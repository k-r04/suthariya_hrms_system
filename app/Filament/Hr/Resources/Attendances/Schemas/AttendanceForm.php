<?php

namespace App\Filament\Hr\Resources\Attendances\Schemas;

use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TimePicker;
use Filament\Forms\Components\ToggleButtons;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;

class AttendanceForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema->components([
            Section::make('Attendance Information')
                ->columns(2)
                ->columnSpanFull()
                ->schema([
                    Select::make('user_id')
                        ->label('Employee')
                        ->relationship('user', 'name')
                        ->searchable()
                        ->preload()
                        ->required(),

                    DatePicker::make('date')
                        ->required(),

                    TimePicker::make('check_in')
                        ->nullable(),

                    TimePicker::make('check_out')
                        ->nullable(),

                    ToggleButtons::make('status')
                        ->options([
                            'present'   => 'Present',
                            'absent'    => 'Absent',
                            'half_day'  => 'Half Day',
                            'late'      => 'Late',
                            'on_leave'  => 'On Leave',
                        ])
                        ->colors([
                            'present'   => 'success',
                            'absent'    => 'danger',
                            'half_day'  => 'primary',
                            'late'      => 'warning',
                            'on_leave'  => 'info',
                        ])
                        ->default('present')
                        ->grouped()
                        ->required()
                        ->columnSpanFull(),

                    Textarea::make('notes')
                        ->nullable()
                        ->columnSpanFull(),
                ]),
        ]);
    }
}
