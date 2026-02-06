<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Position extends Model
{
    //
    protected $fillable = [
        'title',
        'departments_id',
        'min_salary',
        'max_salary',
        'description',
    ];

    protected $casts = [
        'min_salary' => 'decimal:2',
        'max_salary' => 'decimal:2',
    ];

    public function department()
    {
        return $this->belongsTo(Department::class , 'departments_id');
    }
    
    public function employees()
    {
        return $this->hasMany(Employee::class);
    }


}
