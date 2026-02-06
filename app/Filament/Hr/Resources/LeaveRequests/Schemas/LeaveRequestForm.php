<?php

namespace App\Filament\Hr\Resources\LeaveRequests\Schemas;

use Carbon\Carbon;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\DateTimePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Schemas\Schema;
use Filament\Schemas\Components\Utilities\Get;
use Filament\Schemas\Components\Utilities\Set;

class LeaveRequestForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Select::make('user_id')
                    ->relationship('user', 'name')
                    ->searchable()
                    ->preload()
                    ->required(),

                Select::make('leave_type_id')
                    ->relationship('leaveType', 'name')
                    ->searchable()
                    ->preload()
                    ->required(),

                DatePicker::make('start_date')
                    ->live()
                    ->required()
                    ->afterStateUpdated(function (mixed $state, Set $set, Get $get): void {
                        self::calculateDays($set, $get);
                    }),

                DatePicker::make('end_date')
                    ->live()
                    ->required()
                    ->afterStateUpdated(function (mixed $state, Set $set, Get $get): void {
                        self::calculateDays($set, $get);
                    }),

                TextInput::make('days')
                    ->numeric()
                    ->disabled()
                    ->dehydrated()
                    ->required(),

                Textarea::make('reason')
                    ->required()
                    ->columnSpanFull(),

                Select::make('status')
                    ->options([
                        'pending' => 'Pending',
                        'approved' => 'Approved',
                        'rejected' => 'Rejected',
                    ])
                    ->default('pending')
                    ->required()
                    ->live(),

                DateTimePicker::make('approved_at')
                    ->nullable(),

                Textarea::make('rejection_reason')
                    ->nullable()
                    ->columnSpanFull()
                    ->visible(fn (Get $get) => $get('status') === 'rejected'),
            ]);
    }

    protected static function calculateDays(Set $set, Get $get): void
    {
        $startDate = $get('start_date');
        $endDate = $get('end_date');

        if ($startDate && $endDate) {
            $start = Carbon::parse($startDate);
            $end = Carbon::parse($endDate);

            $set('days', $start->diffInDays($end) + 1);
        } else {
            $set('days', null);
        }
    }
}
