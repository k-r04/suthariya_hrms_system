<?php

namespace App\Filament\Hr\Resources\Payrolls\Tables;

use App\Jobs\GeneratePayrollsJob;
use Filament\Actions\Action;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Filament\Notifications\Notification; 

class PayrollsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->headerActions([
                Action::make('generate_payroll')
                    ->label('Generate Payroll')
                    ->icon('heroicon-o-cog')
                    ->color('success')
                    ->schema([
                        Select::make('month')
                            ->options([
                                'January'   => 'January',
                                'February'  => 'February',
                                'March'     => 'March',
                                'April'     => 'April',
                                'May'       => 'May',
                                'June'      => 'June',
                                'July'      => 'July',
                                'August'    => 'August',
                                'September' => 'September',
                                'October'   => 'October',
                                'November'  => 'November',
                                'December'  => 'December',
                            ])
                            ->default(now()->format('F'))
                            ->required(),

                        TextInput::make('year')
                            ->numeric()
                            ->default(now()->year)
                            ->required()
                            ->minValue(2000)
                            ->maxValue(now()->year + 1),

                        Select::make('user_id')
                            ->label('Employee (Optional)')
                            ->placeholder('Generate for all employees')
                            ->relationship('user', 'name')
                            ->searchable()
                            ->preload(),
                    ])
                    ->action(function (array $data): void {
                        GeneratePayrollsJob::dispatch(
                            $data['month'],
                            $data['year'],
                            $data['user_id'] ?? null
                        );

                        Notification::make()
                            ->title('Payroll generation started')
                            ->body('Payrolls are being generated in the background. You will be notified once it is complete.')
                            ->success()
                            ->send();
                    }),
            ])
            ->columns([
                TextColumn::make('user.name')
                    ->label('Employee')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('user.employee_id')
                    ->label('Employee Code')
                    ->searchable(),

                TextColumn::make('month')
                    ->searchable(),

                TextColumn::make('year')
                    ->sortable(),

                TextColumn::make('basic_salary')
                    ->money('INR')
                    ->sortable(),

                TextColumn::make('net_salary')
                    ->money('INR')
                    ->sortable(),

                TextColumn::make('status')
                    ->badge()
                    ->colors([
                        'gray'    => 'draft',
                        'warning' => 'processed',
                        'success' => 'paid',
                    ]),

                TextColumn::make('paid_at')
                    ->date()
                    ->sortable(),

                TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),

                TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->recordActions([
                EditAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
