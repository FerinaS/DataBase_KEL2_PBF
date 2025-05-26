CREATE TABLE pertemuan_perwalian (
    id_pertemuan INT AUTO_INCREMENT PRIMARY KEY,
    tanggal DATE NOT NULL,
    topik VARCHAR(255) NOT NULL,
    catatan VARCHAR(255) NOT NULL,
    saran_akademik VARCHAR(150) NOT NULL,
    nim CHAR(9),
    nidn CHAR(10),
    bulan_tahun VARCHAR(10) GENERATED ALWAYS AS (CONCAT(YEAR(tanggal), '-', LPAD(MONTH(tanggal), 2, '0'))) STORED, 
    CONSTRAINT pertemuan_ibfk_1 FOREIGN KEY (nim) REFERENCES mahasiswa (nim) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT pertemuan_ibfk_2 FOREIGN KEY (nidn) REFERENCES dosen_wali (nidn) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (nim, nidn, tanggal) -- Mencegah duplikasi pertemuan pada tanggal yang sama
);
