# DataBase
Database adalah tempat menyimpan data secara teratur di komputer, sehingga memudahkan dalam mengakses, mengatur, dan memperbarui informasi

Navicat adalah aplikasi GUI (Graphical User Interface) untuk mengelola database MySQL

ERD (Entity Relationship Diagram) di MySQL digunakan untuk merancang struktur database relasional, lalu diimplementasikan dalam bentuk perintah SQL (Structured Query Language) seperti CREATE TABLE, FOREIGN KEY, dan PRIMARY KEY.

mysql itu untuk

# Fungsi Database
1. Penyimpanan Data: Menyimpan data secara terstruktur dan terorganisir.
2. Pengambilan Data: Memungkinkan pengguna untuk mencari dan mengambil data yang spesifik dengan cepat.
3. Integritas Data: Memastikan data yang disimpan akurat dan konsisten.
4. Keamanan Data: Menyediakan mekanisme untuk mengontrol akses dan melindungi data dari penggunaan yang tidak sah.

# ERD
ERD (Entity Relationship Diagram) adalah menggambarkan entitas (tabel-tabel utama) dan relasi (hubungan) antar entitas tersebut.

![Untitled Diagram drawio (3)](https://github.com/user-attachments/assets/0a1cbbd6-e25d-4bb1-be31-d061ce8a0d9d)

# Relasi Antar table
Berikut adalah penjelasan relasi dan kardinalitas antar entitas sesuai format yang kamu minta, berdasarkan diagram ERD sebelumnya:


1. Users – Mahasiswa

  One-to-One
    Setiap mahasiswa adalah user dengan peran (role) "mahasiswa". 
    Diimplementasikan dengan `NIM` sebagai FK di tabel Users.

2. Users – Dosen Wali

   One-to-One
    Setiap dosen wali adalah user dengan peran (role) "dosen".
    Diimplementasikan dengan `NIDN` sebagai FK di tabel Users.

3. Mahasiswa – Dosen Wali

   Many-to-One
    Satu dosen wali membimbing banyak mahasiswa.
    Diimplementasikan dengan `NIDN` sebagai FK di tabel Mahasiswa.

4. Mahasiswa – Pertemuan Perwalian

   One-to-Many
    Seorang mahasiswa bisa mengikuti banyak pertemuan perwalian.
    Diimplementasikan dengan `NIM` sebagai FK di tabel Pertemuan Perwalian


5. Dosen Wali – Pertemuan Perwalian

   One-to-Many
    Seorang dosen wali bisa mencatat banyak pertemuan perwalian.
    Diimplementasikan dengan `NIDN` sebagai FK di tabel Pertemuan Perwalian.

6. Mahasiswa – Notifikasi

   One-to-Many
    Seorang mahasiswa bisa menerima banyak notifikasi.
    Diimplementasikan dengan `NIM` sebagai FK di tabel Notifikasi.

7. Dosen Wali – Notifikasi

   One-to-Many
    Seorang dosen wali bisa menerima banyak notifikasi.
    Diimplementasikan dengan `NIDN` sebagai FK di tabel Notifikasi.


# Revisi Database
Table users di update menambahkan kolom nim dan nidn di karenakan untuk menghubungkan table dosen agar dosen dapat menambahkan saran akademik di table pertemuan perwalian sesuai dengan data mahasiswa

# Struktur Table
1. dosen_wali
![Screenshot 2025-05-26 090952](https://github.com/user-attachments/assets/32fbec7d-7677-41dc-b748-4fab339dc332)

2. mahasiswa
   ![Screenshot 2025-05-26 091011](https://github.com/user-attachments/assets/20425a93-46cd-48fc-b635-bb4b7e7294f5)

3. notifikasi
   ![Screenshot 2025-05-26 091029](https://github.com/user-attachments/assets/629fffd1-a8e7-43a6-9385-103a16b9c552)

4. pertemuan_perwalian
   ![Screenshot 2025-05-26 091044](https://github.com/user-attachments/assets/4e680fe5-32fe-4d0f-a4b2-9fd3da73fded)

5. users
   ![Screenshot 2025-05-26 091103](https://github.com/user-attachments/assets/233cab28-6b02-463a-8830-b11f9c039d90)




<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class MahasiswaController extends Controller
{
    protected $api = 'http://localhost:8080/mahasiswa';

    public function index(Request $request)
    {
        $response = Http::get($this->api);
        $data = $response->json();
    
        $keyword = $request->input('q');
    
        if ($keyword) {
            $data = array_filter($data, function ($item) use ($keyword) {
                return stripos($item['nama_mhs'], $keyword) !== false || 
                       stripos($item['npm_mhs'], $keyword) !== false;
            });
        }
    
        return view('mahasiswa.index', ['mahasiswa' => $data]);
    }
    

    public function create()
    {
        return view('mahasiswa.create');
    }

    public function store(Request $request)
    {
        $response = Http::post($this->api, $request->all());

        if ($response->successful()) {
            return redirect('/mahasiswa')->with('success', 'Data berhasil ditambahkan');
        } else {
            return back()->withErrors([
                'status' => $response->status(),
                'message' => 'Gagal menyimpan data.',
                'response' => $response->body()
            ])->withInput();
        }
    }

    public function edit($id)
{
    $response = Http::get("http://localhost:8080/mahasiswa/$id");
    $result = $response->json();

    return view('mahasiswa.edit', [
        'mahasiswa' => $result['data'] // ambil hanya bagian 'data'
    ]);
}


    public function update(Request $request, $npm_mhs)
    {
        $response = Http::put("{$this->api}/{$npm_mhs}", $request->all());

        if ($response->successful()) {
            return redirect('/mahasiswa')->with('success', 'Data berhasil diupdate');
        } else {
            return back()->withErrors([
                'status' => $response->status(),
                'message' => 'Gagal mengupdate data.',
                'response' => $response->body()
            ])->withInput();
        }
    }

    public function destroy($npm_mhs)
    {
        $response = Http::delete("{$this->api}/{$npm_mhs}");

        if ($response->successful()) {
            return redirect('/mahasiswa')->with('success', 'Data berhasil dihapus');
        } else {
            return back()->withErrors([
                'status' => $response->status(),
                'message' => 'Gagal menghapus data.',
                'response' => $response->body()
            ]);
        }
    }
}

(controller)



<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Http;
use App\Http\Controllers\MahasiswaController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\PembimbingController;

// ✅ Login routes
Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
Route::post('/login', [LoginController::class, 'login']);
Route::get('/logout', [LoginController::class, 'logout']);

// ✅ Home redirect
Route::get('/', fn() => redirect('/login'));

// ✅ Dashboard
Route::get('/dashboard', function () {
    // Kalau belum login, arahkan ke /login
    if (!session('username')) {
        return redirect('/login');
    }

    // Kalau sudah login, panggil controller dashboard
    $controller = new DashboardController;
    return $controller->index();
});

// ✅ CRUD Mahasiswa
Route::get('/mahasiswa', [MahasiswaController::class, 'index'])->name('mahasiswa.index');
Route::get('/mahasiswa/create', [MahasiswaController::class, 'create'])->name('mahasiswa.create');
Route::post('/mahasiswa', [MahasiswaController::class, 'store'])->name('mahasiswa.store');
Route::get('/mahasiswa/{npm_mhs}/edit', [MahasiswaController::class, 'edit'])->name('mahasiswa.edit');
Route::put('/mahasiswa/{npm_mhs}', [MahasiswaController::class, 'update'])->name('mahasiswa.update');
Route::delete('/mahasiswa/{npm_mhs}', [MahasiswaController::class, 'destroy'])->name('mahasiswa.destroy');


Route::get('/pembimbing', [PembimbingController::class, 'index'])->name('pembimbing.index');

// Menampilkan form tambah pembimbing
Route::get('/pembimbing/create', [PembimbingController::class, 'create'])->name('pembimbing.create');

// Menyimpan data pembimbing baru
Route::post('/pembimbing', [PembimbingController::class, 'store'])->name('pembimbing.store');

// Menampilkan form edit berdasarkan NPM pembimbing
Route::get('/pembimbing/{nidn_pembimbing}/edit', [PembimbingController::class, 'edit'])->name('pembimbing.edit');

// Menyimpan perubahan data pembimbing (update)
Route::put('/pembimbing/{nidn_pembimbing}', [PembimbingController::class, 'update'])->name('pembimbing.update');

// Menghapus data pembimbing berdasarkan NPM
Route::delete('/pembimbing/{nidn_pembimbing}', [PembimbingController::class, 'destroy'])->name('pembimbing.destroy');

(routes frontend)
<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');

// Routes untuk Authentication
$routes->group('auth', function($routes) {
    $routes->post('login', 'UserController::login');
    $routes->post('register', 'UserController::register');
});

// User Management (resource-style manual)
$routes->group('user', function($routes) {
    $routes->get('/', 'UserController::getAllUsers');
    $routes->put('update/(:segment)', 'UserController::updateUser/$1');
    $routes->delete('delete/(:segment)', 'UserController::deleteUser/$1');
});

// ===== RESOURCE ROUTES MULAI DARI SINI ===== //

// Mahasiswa API (Laravel-style)
$routes->resource('mahasiswa', [
    'controller' => 'MahasiswaController',
]);

// Pembimbing API
$routes->resource('pembimbing', [
    'controller' => 'PembimbingController',
]);

// Perusahaan API
$routes->resource('perusahaan', [
    'controller' => 'PerusahaanController',
]);

// Magang API
$routes->resource('magang', [
    'controller' => 'MagangController',
]);

(backend)



