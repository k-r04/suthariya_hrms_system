<?php

namespace App\Filament\Widgets;

use App\Models\User;
use App\Models\Department;
use App\Models\LeaveRequest;
use App\Models\Attendance;
use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class StatsOverview extends StatsOverviewWidget
{
    protected ?string $pollingInterval = '60s';

    protected function getStats(): array
    {
        return [
            Stat::make('Total Employees', User::count())
                ->description('Total number of employees in the system')
                ->descriptionIcon('heroicon-o-users')
                ->color('success'),

            Stat::make('Departments', Department::count())
                ->description('Total number of departments')
                ->descriptionIcon('heroicon-o-building-office-2') 
                ->color('primary'),

            Stat::make('Pending Leaves Requests', LeaveRequest::where('status', 'pending')->count())
                ->description('Awaiting approval')
                ->descriptionIcon('heroicon-o-calendar-days')
                ->color('danger'),

            Stat::make('Today\'s Attendance', Attendance::whereDate('date', today())->count())
                ->description('Checked in today')
                ->descriptionIcon('heroicon-o-clock')
                ->color('info'),
        ];
    }
}
