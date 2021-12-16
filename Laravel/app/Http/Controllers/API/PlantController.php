<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\plant;
use App\Models\kelompokplant;

class PlantController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data=plant::getPlant()->paginate(5);
        return response()->json($data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validasi=$request->validate([
            'kd_plant' => 'required',
            'nama_plant' => 'required',
            'harga' => 'required',
            'deskripsi' => '',
            'foto' => 'required|file|mimes:png,jpg',
            'id_kelompok_plant' => 'required'
        ]);
        try {
            $fileName = time().$request->file('foto')->getClientOriginalName();
            $path = $request->file('foto')->storeAs('uploads/plants',$fileName);
            $validasi['foto'] = $path;
            $validasi = plant::create($validasi);
            return response()->json([
                'success' => true, 
                'message' => 'success'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => 'Err', 
                'errors' => $e->getMessage()
            ],422);
        }
    }
    function kelompokPlant(){
        $data=kelompokplant::all();
        return response()->json($data);
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data=plant::find($id);
        return response()->json($data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validasi=$request->validate([
            'kd_plant' => 'required',
            'nama_plant' => 'required',
            'harga' => 'required',
            'deskripsi' => '',
            'foto' => 'required|file|mimes:png,jpg',
            'id_kelompok_plant' => 'required'
        ]);
        try {
            if($request->file('foto')){
                $fileName = time().$request->file('foto')->getClientOriginalName();
                $path = $request->file('foto')->storeAs('uploads/plants',$fileName);
                $validasi['foto'] = $path;
            }
            $response = plant::find($id);
            $response->update($validasi);
            return response()->json([
                'success' => true, 
                'message' => 'success'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => 'Err', 
                'errors' => $e->getMessage()
            ],422);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $plant=plant::find($id);
            $plant->delete();
            return response()->json([
                'success' => true,
                'message' => 'success'
            ]);
        }  catch (\Exception $e) {
            return response()->json([
                'success' => 'Err', 
                'errors' => $e->getMessage()
            ]);
        }
        
    }
}
