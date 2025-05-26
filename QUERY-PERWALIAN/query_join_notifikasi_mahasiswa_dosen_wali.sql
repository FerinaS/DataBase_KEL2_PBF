CREATE VIEW v_notifikasi as 
SELECT
	mahasiswa.nama as nama_mahasiswa, 
  dosen_wali.nama as nama_dosen,
	notifikasi.tipe, 
	notifikasi.tanggal_kirim, 
	notifikasi.pesan
	
FROM
	notifikasi
	INNER JOIN
	mahasiswa
	ON 
		notifikasi.nim = mahasiswa.nim
	INNER JOIN
	dosen_wali
	ON 
		mahasiswa.nidn = dosen_wali.nidn AND
		notifikasi.nidn = dosen_wali.nidn