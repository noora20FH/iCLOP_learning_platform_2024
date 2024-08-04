<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;

    protected $fillable = [
        'material_id',
        'task_name',
        'pdf_path',
    ];

    public function material()
    {
        return $this->belongsTo(Material::class);
    }
}
