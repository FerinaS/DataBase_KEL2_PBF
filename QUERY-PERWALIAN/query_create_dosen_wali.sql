DROP TABLE if EXISTS Dosen_wali;
CREATE TABLE dosen_wali (
nidn char(10) PRIMARY KEY,
nama varchar(50) not null,
email varchar(25) not null
);