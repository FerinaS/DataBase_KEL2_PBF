CREATE TABLE mahasiswa (
    nim CHAR(9) PRIMARY KEY,
    nama VARCHAR(50) NOT NULL,
    email VARCHAR(25) NOT NULL,
    alamat TEXT NOT NULL,
    nidn CHAR(10),
    CONSTRAINT mahasiswa_ibfk_1 FOREIGN KEY (nidn) REFERENCES dosen_wali (nidn) 
    ON DELETE CASCADE ON UPDATE CASCADE
);
