-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 24, 2025 at 08:45 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pbf-kel22`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen_wali`
--

CREATE TABLE `dosen_wali` (
  `nidn` char(10) COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(25) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dosen_wali`
--

INSERT INTO `dosen_wali` (`nidn`, `nama`, `email`) VALUES
('0111111121', 'Bu Tiani', 'butiani@gmail.com'),
('0987654321', 'Pak Abdau', 'pakabdau@gmail.com'),
('0987654331', 'Pak Lutfi', 'paklutfi@gmail.com'),
('0987654341', 'Pak Andes', 'pakandes@gmail.com'),
('0987654351', 'Pak Annas', 'pakannas@gmail.com'),
('0987654361', 'Pak Wahyu', 'pakwahyu@gmail.com'),
('222222223', 'Bu Minal', 'buminal@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` char(9) COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_general_ci NOT NULL,
  `nidn` char(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `email`, `alamat`, `nidn`) VALUES
('230109007', 'Dzuxy', 'dzuk@gmail.com', 'Cilacap', '0987654361'),
('230109107', 'Snzen', 'zen@gmail.com', 'Cilacap', '0987654361'),
('230109109', 'Rasta', 'raas@example.com', 'Cilacap', '0987654361'),
('230302021', 'Alifia', 'fia@gmail.com', 'jalan pisang', '0987654321'),
('230302022', 'Fassha', 'fassha@gmail.com', 'Bekasi', '0111111121'),
('230302023', 'Ferina', 'ferina@gmail.com', 'jalan nangka', '0987654341'),
('230302024', 'Putri', 'putriaul@gmail.com', 'jalan pepaya', '0987654351'),
('230302025', 'Zahran', 'zahransyah@gmail.com', 'jalan melon', '0987654361'),
('696969', 'Putra', 'putra@gmail.com', 'jalan pepaya', '0987654351'),
('7000', 'sutaryo', 'sutaryo@gmail.com', 'jalan manggis', '0987654351');

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id_notifikasi` int NOT NULL,
  `tipe` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_kirim` date NOT NULL,
  `pesan` text COLLATE utf8mb4_general_ci NOT NULL,
  `nim` char(9) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nidn` char(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `notifikasi`
--

INSERT INTO `notifikasi` (`id_notifikasi`, `tipe`, `tanggal_kirim`, `pesan`, `nim`, `nidn`) VALUES
(1, 'Pengumuman', '2025-03-10', 'Jadwal pertemuan perwalian telah tersedia. Silakan cek portal akademik.', '230302021', '0987654321'),
(2, 'Pemberitahuan', '2025-03-11', 'Harap segera menghubungi dosen wali untuk pertemuan perwalian.', '230302022', '0987654331'),
(3, 'Informasi', '2025-03-12', 'Pengisian KRS akan dibuka setelah pertemuan perwalian.', '230302023', '0987654341'),
(4, 'Reminder', '2025-03-13', 'Jangan lupa membawa berkas akademik saat pertemuan perwalian.', '230302024', '0987654351'),
(5, 'Peringatan', '2025-03-14', 'Konfirmasi kehadiran perwalian sebelum batas waktu yang ditentukan.', '230302025', '0987654361');

-- --------------------------------------------------------

--
-- Table structure for table `pertemuan_perwalian`
--

CREATE TABLE `pertemuan_perwalian` (
  `id_pertemuan` int NOT NULL,
  `tanggal` date NOT NULL,
  `topik` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `catatan` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `saran_akademik` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nim` char(9) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nidn` char(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bulan_tahun` varchar(10) COLLATE utf8mb4_general_ci GENERATED ALWAYS AS (concat(year(`tanggal`),_utf8mb4'-',lpad(month(`tanggal`),2,_utf8mb4'0'))) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pertemuan_perwalian`
--

INSERT INTO `pertemuan_perwalian` (`id_pertemuan`, `tanggal`, `topik`, `catatan`, `saran_akademik`, `nim`, `nidn`) VALUES
(40, '2025-05-24', 'ngecekk', 'coding', 'kosong', '230302023', '0987654321'),
(45, '2025-05-29', 'Rencana Studi Semester Depan', 'Mahasiswa ingin mengambil 22 SKS.', 'Disarankan mengambil maksimal 20 SKS', '230302023', '0987654331');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nim` char(9) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nidn` char(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `email`, `password`, `role`, `nim`, `nidn`) VALUES
(1, 'Alifia', 'fia@gmail.com', '112233', 'dosen wali', NULL, NULL),
(2, 'Fasha', 'fasha@gmail.com', '223344', 'dosen wali', NULL, NULL),
(3, 'Ferina', 'ferina@gmail.com', '334455', 'mahasiswa', NULL, NULL),
(4, 'Putri', 'putri@gmail.com', '445566', 'mahasiswa', NULL, NULL),
(5, 'Zahran', 'zahran@gmail.com', '556677', 'mahasiswa', NULL, NULL),
(6, 'Senantha', 'senan@gmail.com', 'password123', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('mahasiswa','dosen wali') COLLATE utf8mb4_general_ci NOT NULL,
  `nim` char(9) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nidn` char(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `email`, `password`, `role`, `nim`, `nidn`) VALUES
(1, 'Pak Abda\'u'', 'fia@gmail.com', '112233', 'dosen wali', NULL, '0987654321'),
(2, 'Fassha', 'fassha@gmail.com', '22334415', 'dosen wali', NULL, '0111111121'),
(3, 'Ferina', 'ferina@gmail.com', '334455', 'mahasiswa', '230302023', NULL),
(4, 'Putri', 'putri@gmail.com', '445566', 'mahasiswa', '230302024', NULL),
(5, 'Zahran', 'zahran@gmail.com', '556677', 'mahasiswa', '230302025', NULL),
(19, 'Fadli', 'Fadlik@gmail.com', '111111', 'mahasiswa', NULL, NULL),
(30, 'Dzuxy', 'dzuk@gmail.com', '123456', 'mahasiswa', '230109007', NULL),
(31, 'Snzen', 'zen@gmail.com', '123456', 'mahasiswa', '230109107', NULL),
(32, 'Rasta', 'raas@example.com', '123456', 'mahasiswa', '230109109', NULL),
(33, 'Alifia', 'fia@gmail.com', '123456', 'mahasiswa', '230302021', NULL),
(34, 'Fassha', 'fassha@gmail.com', '123456', 'mahasiswa', '230302022', NULL),
(35, 'Putra', 'putra@gmail.com', '123456', 'mahasiswa', '696969', NULL),
(36, 'sutaryo', 'sutaryo@gmail.com', '123456', 'mahasiswa', '7000', NULL),
(37, 'Pak Lutfi', 'paklutfi@gmail.com', '123456', 'dosen wali', NULL, '0987654331'),
(38, 'Pak Andes', 'pakandes@gmail.com', '123456', 'dosen wali', NULL, '0987654341'),
(39, 'Pak Annas', 'pakannas@gmail.com', '123456', 'dosen wali', NULL, '0987654351'),
(40, 'Pak Wahyu', 'pakwahyu@gmail.com', '123456', 'dosen wali', NULL, '0987654361'),
(41, 'Bu Minal', 'buminal@gmail.com', '123456', 'dosen wali', NULL, '222222223');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_mahasiswa`
-- (See below for the actual view)
--
CREATE TABLE `v_mahasiswa` (
`alamat` text
,`email` varchar(25)
,`nama_dosen` varchar(50)
,`nama_mahasiswa` varchar(50)
,`nim` char(9)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_notifikasi`
-- (See below for the actual view)
--
CREATE TABLE `v_notifikasi` (
`nama_dosen` varchar(50)
,`nama_mahasiswa` varchar(50)
,`pesan` text
,`tanggal_kirim` date
,`tipe` varchar(25)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pertemuan_perwalian`
-- (See below for the actual view)
--
CREATE TABLE `v_pertemuan_perwalian` (
`bulan_tahun` varchar(10)
,`catatan` varchar(255)
,`id_pertemuan` int
,`nama_dosen` varchar(50)
,`nama_mahasiswa` varchar(50)
,`nidn` char(10)
,`nim` char(9)
,`saran_akademik` varchar(255)
,`tanggal` date
,`topik` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `v_mahasiswa`
--
DROP TABLE IF EXISTS `v_mahasiswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_mahasiswa`  AS SELECT `mahasiswa`.`nama` AS `nama_mahasiswa`, `dosen_wali`.`nama` AS `nama_dosen`, `mahasiswa`.`nim` AS `nim`, `mahasiswa`.`email` AS `email`, `mahasiswa`.`alamat` AS `alamat` FROM (`mahasiswa` join `dosen_wali` on((`mahasiswa`.`nidn` = `dosen_wali`.`nidn`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_notifikasi`
--
DROP TABLE IF EXISTS `v_notifikasi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_notifikasi`  AS SELECT `mahasiswa`.`nama` AS `nama_mahasiswa`, `dosen_wali`.`nama` AS `nama_dosen`, `notifikasi`.`tipe` AS `tipe`, `notifikasi`.`tanggal_kirim` AS `tanggal_kirim`, `notifikasi`.`pesan` AS `pesan` FROM ((`notifikasi` join `mahasiswa` on((`notifikasi`.`nim` = `mahasiswa`.`nim`))) join `dosen_wali` on(((`mahasiswa`.`nidn` = `dosen_wali`.`nidn`) and (`notifikasi`.`nidn` = `dosen_wali`.`nidn`))))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_pertemuan_perwalian`
--
DROP TABLE IF EXISTS `v_pertemuan_perwalian`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pertemuan_perwalian`  AS SELECT `p`.`id_pertemuan` AS `id_pertemuan`, `m`.`nama` AS `nama_mahasiswa`, `m`.`nim` AS `nim`, `d`.`nidn` AS `nidn`, `d`.`nama` AS `nama_dosen`, `p`.`tanggal` AS `tanggal`, `p`.`topik` AS `topik`, `p`.`catatan` AS `catatan`, `p`.`saran_akademik` AS `saran_akademik`, `p`.`bulan_tahun` AS `bulan_tahun` FROM ((`pertemuan_perwalian` `p` join `mahasiswa` `m` on((`p`.`nim` = `m`.`nim`))) join `dosen_wali` `d` on((`p`.`nidn` = `d`.`nidn`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen_wali`
--
ALTER TABLE `dosen_wali`
  ADD PRIMARY KEY (`nidn`) USING BTREE;

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`) USING BTREE,
  ADD KEY `nidn` (`nidn`) USING BTREE;

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id_notifikasi`) USING BTREE,
  ADD KEY `nim` (`nim`) USING BTREE,
  ADD KEY `nidn` (`nidn`) USING BTREE;

--
-- Indexes for table `pertemuan_perwalian`
--
ALTER TABLE `pertemuan_perwalian`
  ADD PRIMARY KEY (`id_pertemuan`) USING BTREE,
  ADD KEY `nidn` (`nidn`) USING BTREE,
  ADD KEY `pertemuan_perwalian_ibfk_1` (`nim`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`) USING BTREE,
  ADD KEY `fk_user_mahasiswa` (`nim`),
  ADD KEY `fk_user_dosen` (`nidn`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`) USING BTREE,
  ADD KEY `fk_user_mahasiswa` (`nim`),
  ADD KEY `fk_user_dosen` (`nidn`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id_notifikasi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pertemuan_perwalian`
--
ALTER TABLE `pertemuan_perwalian`
  MODIFY `id_pertemuan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`nidn`) REFERENCES `dosen_wali` (`nidn`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD CONSTRAINT `notifikasi_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifikasi_ibfk_2` FOREIGN KEY (`nidn`) REFERENCES `dosen_wali` (`nidn`);

--
-- Constraints for table `pertemuan_perwalian`
--
ALTER TABLE `pertemuan_perwalian`
  ADD CONSTRAINT `pertemuan_perwalian_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pertemuan_perwalian_ibfk_2` FOREIGN KEY (`nidn`) REFERENCES `dosen_wali` (`nidn`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_user_dosen` FOREIGN KEY (`nidn`) REFERENCES `dosen_wali` (`nidn`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_mahasiswa` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
