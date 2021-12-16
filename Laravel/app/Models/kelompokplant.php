<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class kelompokplant extends Model
{
    use HasFactory;
    public $primaryKey = 'id_kelompok_plant';
    protected $fillable = [
        'nama_kelompok'
    ];
}
