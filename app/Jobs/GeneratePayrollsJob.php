<?php

namespace App\Jobs;

use App\Models\Payroll;
use App\Models\User;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Filament\Notifications\Notification; 
use Illuminate\Support\Facades\Log;

class GeneratePayrollsJob implements ShouldQueue
{
    use Queueable, Dispatchable, InteractsWithQueue, SerializesModels;

    public $timeout = 300;
    public $tries = 3;

    /**
     * Create a new job instance.
     */
    public function __construct(
        public string $month,
        public int $year,
        public ?int $userId = null
    ) {
        //
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $query = User::query()
            ->where('status', 'active')
            ->whereNotNull('salary');

        if ($this->userId) {
            $query->where('id', $this->userId);
        }

        $employees = $query->get();

        foreach ($employees as $employee) {
            try {
                $existingPayroll = Payroll::where('user_id', $employee->id)
                    ->where('month', $this->month)
                    ->where('year', $this->year)
                    ->first();

                if ($existingPayroll) {
                    Log::info("Payroll already exists for user ID {$employee->id} for {$this->month} {$this->year}");
                    continue;
                }

                // Calculate allowances, bonus, deductions (example logic)
                $allowances = 500;
                $bonus = 200;
                $deductions = 150;

                $basicSalary = $employee->salary;
                $netSalary = $basicSalary + $allowances + $bonus - $deductions;

                Payroll::create([
                    'user_id'       => $employee->id,
                    'month'         => $this->month,
                    'year'          => $this->year,
                    'basic_salary'  => $basicSalary,
                    'allowances'    => $allowances,
                    'bonus'         => $bonus,
                    'deductions'    => $deductions,
                    'net_salary'    => $netSalary,
                    'status'        => 'draft',
                ]);

                Log::info("Payroll generated for user ID {$employee->id} for {$this->month} {$this->year}");
            } catch (\Throwable $e) {
                Log::error(
                    "Failed to generate payroll for user ID {$employee->id}: {$e->getMessage()}",
                    ['exception' => $e]
                );
            }
        }
    }
}
