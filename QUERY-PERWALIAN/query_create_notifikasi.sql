CREATE TABLE notifikasi (
id_notifikasi int auto_increment PRIMARY KEY,
tipe varchar(25) not null,
tanggal_kirim date not null,
pesan text not null,
nim char(9),
nidn char(10),
CONSTRAINT `notifikasi_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `notifikasi_ibfk_2` FOREIGN KEY (`nidn`) REFERENCES `dosen_wali` (`nidn`) ON DELETE CASCADE ON UPDATE CASCADE
);
