<?php

namespace App\Filament\Employee\Pages;

use Filament\Pages\Page;
use Filament\Actions\Action;
use Filament\Notifications\Notification;
use App\Models\Attendance;
use BackedEnum;
use UnitEnum;

class CheckInOut extends Page
{
    protected string $view = 'filament.employee.pages.check-in-out';

    protected static string | BackedEnum | null $navigationIcon = 'heroicon-o-arrow-path';

    protected static string | UnitEnum | null $navigationGroup = 'Attendance';

    public $todayAttendance;
    public $canCheckIn = true;
    public $canCheckOut = false;
    public $currentTime;

    public function mount(): void
    {
        $this->loadAttendance();
        $this->currentTime = now()->format('h:i:s A');
    }

    public function loadAttendance(): void
    {
        $this->todayAttendance = Attendance::where('user_id', auth()->id())
            ->whereDate('date', today())
            ->first();

        $this->canCheckIn = ! $this->todayAttendance || $this->todayAttendance->check_in === null;

        $this->canCheckOut = $this->todayAttendance
            && $this->todayAttendance->check_in !== null
            && $this->todayAttendance->check_out === null;
    }

    public function checkIn(): void
    {
        try {
            if (! $this->canCheckIn) {
                return;
            }

            $this->todayAttendance = Attendance::create([
                'user_id'  => auth()->id(),
                'date'     => today(),
                'check_in' => now(),
                'status'   => now()->format('H:i:s') > '09:00:00' ? 'Late' : 'Present',
            ]);

            Notification::make()
                ->success()
                ->title('Checked In')
                ->body('You have successfully checked in at ' . now()->format('h:i A'))
                ->send();

            $this->loadAttendance();
        } catch (\Exception $e) {
            Notification::make()
                ->danger()
                ->title('Check-In Failed')
                ->body('You have already checked in today.')
                ->send();
        }
    }

    public function checkOut(): void
    {
        if ($this->todayAttendance) {
            $this->todayAttendance->update([
                'check_out' => now(),
            ]);

            Notification::make()
                ->success()
                ->title('Checked Out Successfully')
                ->body('You have successfully checked out at ' . now()->format('h:i A'))
                ->send();

            $this->loadAttendance();
        }
    }

    protected function getHeaderActions(): array
    {
        return [
            Action::make('checkIn')
                ->label('Check In')
                ->icon('heroicon-o-arrow-right-on-rectangle')
                ->color('success')
                ->visible(fn () => $this->canCheckIn)
                ->requiresConfirmation()
                ->modalHeading('Check In')
                ->modalDescription('Are you sure you want to check in now?')
                ->modalSubmitActionLabel('Yes, Check In')
                ->action(fn () => $this->checkIn()),

            Action::make('checkOut')
                ->label('Check Out')
                ->icon('heroicon-o-arrow-left-on-rectangle')
                ->color('danger')
                ->visible(fn () => $this->canCheckOut)
                ->requiresConfirmation()
                ->modalHeading('Check Out')
                ->modalDescription('Are you sure you want to check out now?')
                ->modalSubmitActionLabel('Yes, Check Out')
                ->action(fn () => $this->checkOut()),
        ];
    }
}
