<?php

namespace App\Filament\Resources\Users\Schemas;

use App\Models\Position;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Get;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;
use Illuminate\Support\Facades\Hash;

class UserForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema->components([
            /* -----------------------------------------------------------------
             | Personal Information
             |-----------------------------------------------------------------*/
            Section::make('Personal Information')
                ->columns(2)
                ->columnSpanFull()
                ->schema([
                    TextInput::make('name')
                        ->required(),

                    TextInput::make('email')
                        ->email()
                        ->required(),

                    TextInput::make('password')
                        ->password()
                        ->revealable()
                        ->dehydrateStateUsing(
                            fn (?string $state) =>
                                filled($state) ? Hash::make($state) : null
                        )
                        ->dehydrated(fn (?string $state): bool => filled($state))
                        ->required(fn (string $context): bool => $context === 'create'),

                    TextInput::make('phone')
                        ->tel()
                        ->nullable(),

                    DatePicker::make('date_of_birth')
                        ->nullable(),

                    Textarea::make('address')
                        ->columnSpanFull()
                        ->nullable(),

                    Select::make('roles')
                        ->relationship('roles', 'name')
                        ->multiple()
                        ->searchable()
                        ->preload(),
                ]),

            /* -----------------------------------------------------------------
             | Employment Details
             |-----------------------------------------------------------------*/
            Section::make('Employment Details')
                ->columns(2)
                ->columnSpanFull()
                ->schema([
                    Select::make('department_id')
                        ->relationship('department', 'name')
                        ->required()
                        ->live(),

                    Select::make('position_id')
                        ->label('Position')
                        ->required()
                        ->options(fn ($get) =>
                            $get('departments_id')
                                ? Position::query()
                                    ->where('departments_id', $get('departments_id'))
                                    ->pluck('title', 'id')
                                : []
                        )
                        ->searchable(),

                    DatePicker::make('hire_date')
                        ->required(),

                    Select::make('employment_type')
                        ->options([
                            'full_time' => '🟢 Full time',
                            'part_time' => '🟡 Part time',
                            'contract'  => '🔵 Contract',
                            'intern'    => '🟣 Intern',
                        ])
                        ->default('full_time')
                        ->required(),

                    Select::make('status')
                        ->options([
                            'active'     => '🟢 Active',
                            'inactive'   => '⚪ Inactive',
                            'on_leave'   => '🟠 On leave',
                            'terminated' => '🔴 Terminated',
                        ])
                        ->default('active')
                        ->required(),

                    TextInput::make('salary')
                        ->numeric()
                        ->nullable(),
                ]),

            /* -----------------------------------------------------------------
             | Emergency Contact
             |-----------------------------------------------------------------*/
            Section::make('Emergency Contact')
                ->columnSpanFull()
                ->schema([
                    TextInput::make('emergency_contact_name')
                        ->nullable(),

                    TextInput::make('emergency_contact_phone')
                        ->nullable(),
                ]),
        ]);
    }
}
