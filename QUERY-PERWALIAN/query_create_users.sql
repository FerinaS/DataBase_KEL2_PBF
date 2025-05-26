
CREATE TABLE users (
id_user int auto_increment PRIMARY KEY,
username varchar(50) not null,
email varchar(25) not null,
password varchar(50) not null,
role varchar(50) not NULL,
nim char(9),
nidn char(10),
CONSTRAINT `users_fk1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `users_fk2` FOREIGN KEY (`nidn`) REFERENCES `dosen_wali` (`nidn`) ON DELETE CASCADE ON UPDATE CASCADE
);