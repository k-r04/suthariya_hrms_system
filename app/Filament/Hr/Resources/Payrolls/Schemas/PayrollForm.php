<?php

namespace App\Filament\Hr\Resources\Payrolls\Schemas;

use App\Models\User;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;
use Filament\Schemas\Components\Utilities\Get;
use Filament\Schemas\Components\Utilities\Set;

class PayrollForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Select::make('user_id')
                    ->relationship('user', 'name')
                    ->searchable()
                    ->preload()
                    ->live()
                    ->required()
                    ->afterStateUpdated(function (mixed $state, Set $set): void {
                        $user = User::find($state);

                        if ($user) {
                            $set('basic_salary', $user->salary);
                        }
                    }),

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
                    ->required(),

                TextInput::make('year')
                    ->numeric()
                    ->default(date('Y'))
                    ->required(),

                TextInput::make('basic_salary')
                    ->numeric()
                    ->prefix('₹')
                    ->required()
                    ->live()
                    ->afterStateUpdated(function (mixed $state, Set $set, Get $get): void {
                        self::calculateNetSalary($set, $get);
                    }),

                TextInput::make('allowances')
                    ->numeric()
                    ->default(0)
                    ->prefix('₹')
                    ->required()
                    ->live(onBlur: true)
                    ->afterStateUpdated(function (mixed $state, Set $set, Get $get): void {
                        self::calculateNetSalary($set, $get);
                    }),

                TextInput::make('deductions')
                    ->numeric()
                    ->default(0)
                    ->prefix('₹')
                    ->required()
                    ->live(onBlur: true)
                    ->afterStateUpdated(function (mixed $state, Set $set, Get $get): void {
                        self::calculateNetSalary($set, $get);
                    }),

                TextInput::make('bonus')
                    ->numeric()
                    ->default(0)
                    ->prefix('₹')
                    ->required()
                    ->live(onBlur: true)
                    ->afterStateUpdated(function (mixed $state, Set $set, Get $get): void {
                        self::calculateNetSalary($set, $get);
                    }),

                TextInput::make('net_salary')
                    ->numeric()
                    ->prefix('₹')
                    ->disabled()
                    ->dehydrated()
                    ->required(),

                Select::make('status')
                    ->options([
                        'draft'     => 'Draft',
                        'processed' => 'Processed',
                        'paid'      => 'Paid',
                    ])
                    ->default('draft')
                    ->required(),

                DatePicker::make('paid_at')
                    ->nullable(),
            ]);
    }

    protected static function calculateNetSalary(Set $set, Get $get): void
    {
        $basicSalary = (float) ($get('basic_salary') ?? 0);
        $allowances  = (float) ($get('allowances') ?? 0);
        $deductions  = (float) ($get('deductions') ?? 0);
        $bonus       = (float) ($get('bonus') ?? 0);

        $netSalary = ($basicSalary + $allowances + $bonus) - $deductions;

        $set('net_salary', $netSalary);
    }
}
