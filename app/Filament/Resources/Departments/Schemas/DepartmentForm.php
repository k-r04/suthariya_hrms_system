<?php

namespace App\Filament\Resources\Departments\Schemas;

use Filament\Forms\Components\ColorPicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;

class DepartmentForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema->components([
            Section::make('Department Information')
                ->columns(2)
                ->columnSpanFull()
                ->schema([
                    TextInput::make('name')
                        ->required(),

                    Select::make('manager_id')
                        ->label('Manager')
                        ->relationship('manager', 'name')
                        ->searchable()
                        ->preload()
                        ->nullable(),

                    ColorPicker::make('color')
                        ->label('Department Color')
                        ->nullable(),

                    Textarea::make('description')
                        ->columnSpanFull()
                        ->nullable(),
                ]),
        ]);
    }
}
