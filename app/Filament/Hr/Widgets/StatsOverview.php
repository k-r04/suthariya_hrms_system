<?php

namespace App\Filament\Hr\Widgets;

use App\Models\User;
use App\Models\Payroll;
use App\Models\LeaveRequest;
use App\Models\Attendance;
use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class StatsOverview extends StatsOverviewWidget
{
    protected function getStats(): array
    {
        return [
            Stat::make('Active Employees', User::where('status', 'active')->count())
                ->description('Currently active')
                ->descriptionIcon('heroicon-o-user-group')
                ->color('success'),

            Stat::make('Pending Leave', LeaveRequest::where('status', 'pending')->count())
                ->description('Requires action')
                ->descriptionIcon('heroicon-o-calendar-days')
                ->color('warning'),

            Stat::make(
                "Today's Attendance",
                Attendance::whereDate('date', today())
                    ->where('status', 'present')
                    ->count()
            )
                ->description('Present today')
                ->descriptionIcon('heroicon-o-clock')
                ->color('primary'),

            Stat::make(
                "This Month's Payroll",
                Payroll::where('month', date('F'))
                    ->where('year', date('Y'))
                    ->where('status', 'paid')
                    ->count()
            )
                ->description('Processed this month')
                ->descriptionIcon('heroicon-o-banknotes')
                ->color('info'),
        ];
    }
}
