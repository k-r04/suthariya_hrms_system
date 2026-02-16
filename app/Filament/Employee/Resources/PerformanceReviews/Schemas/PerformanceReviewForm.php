<?php

namespace App\Filament\Employee\Resources\PerformanceReviews\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Schemas\Schema;

class PerformanceReviewForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('user_id')
                    ->required()
                    ->numeric(),
                TextInput::make('reviewer_id')
                    ->required()
                    ->numeric(),
                TextInput::make('review_period')
                    ->required(),
                TextInput::make('quality_of_work')
                    ->required()
                    ->numeric(),
                TextInput::make('productivity')
                    ->required()
                    ->numeric(),
                TextInput::make('communication')
                    ->required()
                    ->numeric(),
                TextInput::make('teamwork')
                    ->required()
                    ->numeric(),
                TextInput::make('leadership')
                    ->required()
                    ->numeric(),
                TextInput::make('overall_rating')
                    ->required()
                    ->numeric(),
                Textarea::make('strengths')
                    ->columnSpanFull(),
                Textarea::make('areas_for_improvement')
                    ->columnSpanFull(),
                Textarea::make('goals')
                    ->columnSpanFull(),
                Textarea::make('comments')
                    ->columnSpanFull(),
            ]);
    }
}
