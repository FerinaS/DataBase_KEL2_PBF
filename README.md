# DataBase
Database adalah tempat menyimpan data secara teratur di komputer, sehingga memudahkan dalam mengakses, mengatur, dan memperbarui informasi

Navicat adalah aplikasi GUI (Graphical User Interface) untuk mengelola database MySQL

ERD (Entity Relationship Diagram) di MySQL digunakan untuk merancang struktur database relasional, lalu diimplementasikan dalam bentuk perintah SQL (Structured Query Language) seperti CREATE TABLE, FOREIGN KEY, dan PRIMARY KEY.

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


