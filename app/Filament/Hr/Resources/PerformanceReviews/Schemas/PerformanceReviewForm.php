<?php

namespace App\Filament\Hr\Resources\PerformanceReviews\Schemas;

use Filament\Schemas\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Schemas\Schema;
use Filament\Schemas\Components\Utilities\Get;
use Filament\Schemas\Components\Utilities\Set;

class PerformanceReviewForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make('Review Information')
                    ->columns(2)
                    ->schema([
                        Select::make('user_id')
                            ->relationship('user', 'name')
                            ->searchable()
                            ->preload()
                            ->required(),

                        Select::make('reviewer_id')
                            ->relationship('reviewer', 'name')
                            ->searchable()
                            ->preload()
                            ->required(),

                        TextInput::make('review_period')
                            ->default(now()->format('Y-m-d'))
                            ->placeholder('Select review period')
                            ->required(),
                    ]),

                Section::make('Performance Metrics (1-10)')
                    ->columns(2)
                    ->schema([
                        TextInput::make('quality_of_work')
                            ->required()
                            ->minValue(1)
                            ->maxValue(10)
                            ->numeric()
                            ->live()
                            ->afterStateUpdated(function (Set $set, Get $get): void {
                                self::calculateOverallRating($get, $set);
                            }),

                        TextInput::make('productivity')
                            ->required()
                            ->minValue(1)
                            ->maxValue(10)
                            ->numeric()
                            ->live()
                            ->afterStateUpdated(function (Set $set, Get $get): void {
                                self::calculateOverallRating($get, $set);
                            }),

                        TextInput::make('communication')
                            ->required()
                            ->minValue(1)
                            ->maxValue(10)
                            ->numeric()
                            ->live()
                            ->afterStateUpdated(function (Set $set, Get $get): void {
                                self::calculateOverallRating($get, $set);
                            }),

                        TextInput::make('teamwork')
                            ->required()
                            ->minValue(1)
                            ->maxValue(10)
                            ->numeric()
                            ->live()
                            ->afterStateUpdated(function (Set $set, Get $get): void {
                                self::calculateOverallRating($get, $set);
                            }),

                        TextInput::make('leadership')
                            ->required()
                            ->minValue(1)
                            ->maxValue(10)
                            ->numeric()
                            ->live()
                            ->afterStateUpdated(function (Set $set, Get $get): void {
                                self::calculateOverallRating($get, $set);
                            }),

                        TextInput::make('overall_rating')
                            ->required()
                            ->suffix('/10')
                            ->disabled()
                            ->dehydrated()
                            ->numeric(),
                    ]),

                Section::make('Feedback and Goals')
                    ->columns(2)
                    ->columnSpanFull()
                    ->schema([
                        Textarea::make('strengths')
                            ->columnSpanFull(),

                        Textarea::make('areas_for_improvement')
                            ->columnSpanFull(),

                        Textarea::make('goals')
                            ->columnSpanFull(),

                        Textarea::make('comments')
                            ->columnSpanFull(),
                    ]),
            ]);
    }

    protected static function calculateOverallRating(Get $get, Set $set): void
    {
        $qualityOfWork = (int) ($get('quality_of_work') ?? 0);
        $productivity  = (int) ($get('productivity') ?? 0);
        $communication = (int) ($get('communication') ?? 0);
        $teamwork      = (int) ($get('teamwork') ?? 0);
        $leadership    = (int) ($get('leadership') ?? 0);

        $overallRating = round(
            ($qualityOfWork + $productivity + $communication + $teamwork + $leadership) / 5,
            2
        );

        $set('overall_rating', $overallRating);
    }
}
