<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class LeaveRequest extends Model
{
    //
    protected $fillable = ['user_id', 'leave_type_id', 'start_date', 'end_date', 'days', 'reason', 'status','approver_id','reject_reason'];

    protected $casts = [
        'start_date' => 'date',
        'end_date' => 'date',
        'approved_at' => 'datetime',
    ];
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
    public function leaveType()
    {
        return $this->belongsTo(LeaveType::class, 'leave_type_id');
    }
    public function approver()
    {
        return $this->belongsTo(User::class, 'approver_id');
    }
    

}


