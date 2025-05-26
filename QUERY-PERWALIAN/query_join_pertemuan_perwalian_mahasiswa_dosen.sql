CREATE VIEW v_pertemuan_perwalian as  
SELECT
	mahasiswa.nama as nama_mahasiswa, 
	dosen_wali.nama as nama_dosen, 
	pertemuan_perwalian.tanggal, 
	pertemuan_perwalian.topik, 
	pertemuan_perwalian.catatan, 
	pertemuan_perwalian.saran_akademik, 
	pertemuan_perwalian.bulan_tahun
FROM
	pertemuan_perwalian
	INNER JOIN
	dosen_wali
	ON 
		pertemuan_perwalian.nidn = dosen_wali.nidn
	INNER JOIN
	mahasiswa
	ON 
		dosen_wali.nidn = mahasiswa.nidn AND
		pertemuan_perwalian.nim = mahasiswa.nim