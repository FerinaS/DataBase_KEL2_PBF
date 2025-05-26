CREATE VIEW v_mahasiswa as 
SELECT
	mahasiswa.nama as nama_mahasiswa,
  dosen_wali.nama as nama_dosen, 
  mahasiswa.nim, 
	mahasiswa.email, 
	mahasiswa.alamat 
	
FROM
	mahasiswa
	INNER JOIN
	dosen_wali
	ON 
		mahasiswa.nidn = dosen_wali.nidn