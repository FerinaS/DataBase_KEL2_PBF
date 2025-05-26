# DataBase
Database adalah tempat menyimpan data secara teratur di komputer, sehingga memudahkan dalam mengakses, mengatur, dan memperbarui informasi

# Tujuan Database
1. Menghindari redudansi data (pengulangan).
2. Menjaga konsistensi dan integritas data.
3. Memfasilitasi akses multiuser secara bersamaan.
4. Mempermudah pelaporan dan analisis data.

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




