<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class plant extends Model
{
    use HasFactory;
    public $primaryKey = 'id_plant';
    protected $fillable = [
        'kd_plant', 'nama_plant', 'harga', 'deskripsi', 'foto', 'id_kelompok_plant'
    ];
    static function getPlant(){
        $return=DB::table('plants')
        ->join('kelompokplants','plants.id_kelompok_plant', '=', 'kelompokplants.id_kelompok_plant');
        return $return;
    }
}
