<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class MahasiswaController extends Controller
{
    protected $api = 'http://localhost:8080/mahasiswa'; // ganti sesuai API kamu

    public function index()
    {
        $response = Http::get($this->api);
        $mahasiswa = $response->json();
        return view('mahasiswa.index', compact('mahasiswa'));
    }

    public function create()
    {
        return view('mahasiswa.create');
    }

    public function store(Request $request)
    {
        Http::post($this->api, $request->all());
        return redirect('/mahasiswa')->with('success', 'Data berhasil ditambahkan');
    }

    public function edit($npm)
    {
        $response = Http::get("{$this->api}/{$npm}");
        $data = $response->json();
        return view('mahasiswa.edit', ['mahasiswa' => $data]);
    }

    public function update(Request $request, $npm)
    {
        Http::put("{$this->api}/{$npm}", $request->all());
        return redirect('/mahasiswa')->with('success', 'Data berhasil diupdate');
    }

    public function destroy($npm)
    {
        Http::delete("{$this->api}/{$npm}");
        return redirect('/mahasiswa')->with('success', 'Data berhasil dihapus');
    }
}