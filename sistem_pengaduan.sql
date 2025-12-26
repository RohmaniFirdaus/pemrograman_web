-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2025 at 01:39 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem_pengaduan`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `konten` text NOT NULL,
  `gambar_utama` varchar(255) DEFAULT NULL,
  `status` enum('draft','dipublikasi') DEFAULT 'draft',
  `views` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galeri_umkm`
--

CREATE TABLE `galeri_umkm` (
  `id` int(11) NOT NULL,
  `umkm_id` int(11) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kalender_kegiatan`
--

CREATE TABLE `kalender_kegiatan` (
  `id` int(11) NOT NULL,
  `judul_acara` varchar(200) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `jenis_acara` enum('rapat','kegiatan','hari_penting','lainnya') DEFAULT 'kegiatan',
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `waktu_mulai` time DEFAULT NULL,
  `waktu_selesai` time DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_pengaduan`
--

CREATE TABLE `kategori_pengaduan` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori_pengaduan`
--

INSERT INTO `kategori_pengaduan` (`id`, `nama_kategori`, `deskripsi`, `created_at`) VALUES
(1, 'Infrastruktur', 'Pengaduan terkait infrastruktur desa', '2025-12-24 11:51:31'),
(2, 'Lingkungan', 'Pengaduan terkait lingkungan hidup', '2025-12-24 11:51:31'),
(3, 'Pelayanan Publik', 'Pengaduan terkait pelayanan publik', '2025-12-24 11:51:31'),
(4, 'Keamanan', 'Pengaduan terkait keamanan dan ketertiban', '2025-12-24 11:51:31'),
(5, 'Lainnya', 'Pengaduan lainnya', '2025-12-24 11:51:31');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_surat`
--

CREATE TABLE `kategori_surat` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori_surat`
--

INSERT INTO `kategori_surat` (`id`, `nama_kategori`, `deskripsi`, `created_at`) VALUES
(1, 'Surat Keterangan', 'Surat keterangan berbagai keperluan', '2025-12-24 11:51:31'),
(2, 'Surat Pengantar', 'Surat pengantar untuk berbagai keperluan', '2025-12-24 11:51:31'),
(3, 'Surat Domisili', 'Surat keterangan domisili', '2025-12-24 11:51:31'),
(4, 'Surat Keterangan Tidak Mampu', 'Surat keterangan tidak mampu', '2025-12-24 11:51:31'),
(5, 'Surat Izin', 'Surat izin berbagai keperluan', '2025-12-24 11:51:31'),
(6, 'Lainnya', 'Jenis surat lainnya', '2025-12-24 11:51:31');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_umkm`
--

CREATE TABLE `kategori_umkm` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori_umkm`
--

INSERT INTO `kategori_umkm` (`id`, `nama_kategori`, `created_at`) VALUES
(1, 'Kuliner', '2025-12-24 11:51:31'),
(2, 'Perdagangan', '2025-12-24 11:51:31'),
(3, 'Kerajinan', '2025-12-24 11:51:31'),
(4, 'Jasa', '2025-12-24 11:51:31'),
(5, 'Pertanian', '2025-12-24 11:51:31'),
(6, 'Lainnya', '2025-12-24 11:51:31');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tipe_entitas` enum('berita','umkm') NOT NULL,
  `entitas_id` int(11) NOT NULL,
  `komentar` text NOT NULL,
  `status` enum('aktif','nonaktif') DEFAULT 'aktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_statistik`
--

CREATE TABLE `laporan_statistik` (
  `id` int(11) NOT NULL,
  `periode_bulan` int(11) NOT NULL,
  `periode_tahun` int(11) NOT NULL,
  `total_pengaduan` int(11) DEFAULT 0,
  `pengaduan_menunggu` int(11) DEFAULT 0,
  `pengaduan_diproses` int(11) DEFAULT 0,
  `pengaduan_selesai` int(11) DEFAULT 0,
  `pengaduan_ditolak` int(11) DEFAULT 0,
  `total_surat` int(11) DEFAULT 0,
  `surat_menunggu` int(11) DEFAULT 0,
  `surat_diproses` int(11) DEFAULT 0,
  `surat_selesai` int(11) DEFAULT 0,
  `surat_ditolak` int(11) DEFAULT 0,
  `total_umkm` int(11) DEFAULT 0,
  `umkm_terverifikasi` int(11) DEFAULT 0,
  `total_berita` int(11) DEFAULT 0,
  `total_warga` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laporan_statistik`
--

INSERT INTO `laporan_statistik` (`id`, `periode_bulan`, `periode_tahun`, `total_pengaduan`, `pengaduan_menunggu`, `pengaduan_diproses`, `pengaduan_selesai`, `pengaduan_ditolak`, `total_surat`, `surat_menunggu`, `surat_diproses`, `surat_selesai`, `surat_ditolak`, `total_umkm`, `umkm_terverifikasi`, `total_berita`, `total_warga`, `created_at`, `updated_at`) VALUES
(1, 12, 2025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2025-12-24 12:23:51', '2025-12-26 00:20:42'),
(2, 11, 2025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2025-12-24 12:23:51', '2025-12-26 00:20:42');

-- --------------------------------------------------------

--
-- Table structure for table `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `deskripsi` text NOT NULL,
  `saran` text DEFAULT NULL,
  `lokasi_kejadian` varchar(255) DEFAULT NULL,
  `prioritas` enum('rendah','sedang','tinggi') DEFAULT 'sedang',
  `status` enum('menunggu','diproses','selesai','ditolak') DEFAULT 'menunggu',
  `bukti_file` varchar(255) DEFAULT NULL,
  `tipe_bukti` enum('foto','video','dokumen') DEFAULT 'foto',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profil_desa`
--

CREATE TABLE `profil_desa` (
  `id` int(11) NOT NULL,
  `nama_desa` varchar(100) NOT NULL,
  `alamat` text DEFAULT NULL,
  `kode_pos` varchar(10) DEFAULT NULL,
  `kecamatan` varchar(50) DEFAULT NULL,
  `kabupaten` varchar(50) DEFAULT NULL,
  `provinsi` varchar(50) DEFAULT NULL,
  `luas_wilayah` decimal(10,2) DEFAULT NULL,
  `jumlah_penduduk` int(11) DEFAULT NULL,
  `sejarah` text DEFAULT NULL,
  `visi` text DEFAULT NULL,
  `misi` text DEFAULT NULL,
  `struktur_organisasi` text DEFAULT NULL,
  `foto_desa` varchar(255) DEFAULT NULL,
  `background_homepage` varchar(255) DEFAULT NULL,
  `kontak_email` varchar(100) DEFAULT NULL,
  `kontak_telepon` varchar(15) DEFAULT NULL,
  `kontak_alamat` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profil_desa`
--

INSERT INTO `profil_desa` (`id`, `nama_desa`, `alamat`, `kode_pos`, `kecamatan`, `kabupaten`, `provinsi`, `luas_wilayah`, `jumlah_penduduk`, `sejarah`, `visi`, `misi`, `struktur_organisasi`, `foto_desa`, `background_homepage`, `kontak_email`, `kontak_telepon`, `kontak_alamat`, `created_at`, `updated_at`) VALUES
(1, 'Gembong Kulon', NULL, NULL, 'Talang', 'Tegal', 'Jawa Tengah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-24 11:51:31', '2025-12-24 11:51:31');

-- --------------------------------------------------------

--
-- Table structure for table `surat_menyurat`
--

CREATE TABLE `surat_menyurat` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `jenis_surat` varchar(100) NOT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `keperluan` text NOT NULL,
  `detail_data_tambahan` text DEFAULT NULL,
  `status` enum('menunggu','diproses','selesai','ditolak') DEFAULT 'menunggu',
  `nomor_surat` varchar(50) DEFAULT NULL,
  `tanggal_surat` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tentang_aplikasi`
--

CREATE TABLE `tentang_aplikasi` (
  `id` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `versi` varchar(20) DEFAULT NULL,
  `pengembang` varchar(100) DEFAULT NULL,
  `logo_aplikasi` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `umkm`
--

CREATE TABLE `umkm` (
  `id` int(11) NOT NULL,
  `nama_umkm` varchar(200) NOT NULL,
  `nama_pemilik` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `telepon` varchar(15) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `gambar_utama` varchar(255) DEFAULT NULL,
  `status_verifikasi` enum('menunggu','terverifikasi','ditolak') DEFAULT 'menunggu',
  `is_unggulan` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `foto_profil` varchar(255) DEFAULT NULL,
  `foto_ktp` varchar(255) DEFAULT NULL,
  `role` enum('admin','warga','kepala_desa') NOT NULL DEFAULT 'warga',
  `status_verifikasi` enum('menunggu','terverifikasi','ditolak') DEFAULT 'menunggu',
  `status_aktif` enum('aktif','nonaktif') DEFAULT 'aktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nik`, `username`, `email`, `password`, `nama_lengkap`, `no_hp`, `alamat`, `foto_profil`, `foto_ktp`, `role`, `status_verifikasi`, `status_aktif`, `created_at`, `updated_at`) VALUES
(1, '3328101205050005', 'admin', 'admin123@gmail.com', '$2y$10$NAjRvJzV3ODQnQqqL.RVD.RLOCKU5RgC2o/HrkwOfIgFFBbMYghhy', 'administrator', '085975406235', 'gembogn tegal', NULL, NULL, 'admin', 'terverifikasi', 'aktif', '2025-12-24 12:17:05', '2025-12-24 12:23:30'),
(2, '3328101205050002', 'Firdaus', 'rhmn.fi12@gmail.com', '$2y$10$ktXqsOQCI4cJV5oFAeUguOgnUUpPe.OxYIwayLfrTEkNpqUFjIgju', 'Rohmani Firdaus', '085975406230', 'Tegal', NULL, NULL, 'warga', 'terverifikasi', 'aktif', '2025-12-26 00:21:35', '2025-12-26 00:23:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `galeri_umkm`
--
ALTER TABLE `galeri_umkm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_umkm_id` (`umkm_id`);

--
-- Indexes for table `kalender_kegiatan`
--
ALTER TABLE `kalender_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tanggal_mulai` (`tanggal_mulai`),
  ADD KEY `idx_jenis_acara` (`jenis_acara`);

--
-- Indexes for table `kategori_pengaduan`
--
ALTER TABLE `kategori_pengaduan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_surat`
--
ALTER TABLE `kategori_surat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_umkm`
--
ALTER TABLE `kategori_umkm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tipe_entitas` (`tipe_entitas`,`entitas_id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `laporan_statistik`
--
ALTER TABLE `laporan_statistik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_periode` (`periode_bulan`,`periode_tahun`),
  ADD KEY `idx_periode` (`periode_tahun`,`periode_bulan`);

--
-- Indexes for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_kategori_id` (`kategori_id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `profil_desa`
--
ALTER TABLE `profil_desa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_menyurat`
--
ALTER TABLE `surat_menyurat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_kategori_id` (`kategori_id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `tentang_aplikasi`
--
ALTER TABLE `tentang_aplikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `umkm`
--
ALTER TABLE `umkm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_id` (`kategori_id`),
  ADD KEY `idx_status_verifikasi` (`status_verifikasi`),
  ADD KEY `idx_is_unggulan` (`is_unggulan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `nik` (`nik`),
  ADD KEY `idx_role` (`role`),
  ADD KEY `idx_status_verifikasi` (`status_verifikasi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galeri_umkm`
--
ALTER TABLE `galeri_umkm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kalender_kegiatan`
--
ALTER TABLE `kalender_kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori_pengaduan`
--
ALTER TABLE `kategori_pengaduan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kategori_surat`
--
ALTER TABLE `kategori_surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kategori_umkm`
--
ALTER TABLE `kategori_umkm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `laporan_statistik`
--
ALTER TABLE `laporan_statistik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profil_desa`
--
ALTER TABLE `profil_desa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `surat_menyurat`
--
ALTER TABLE `surat_menyurat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tentang_aplikasi`
--
ALTER TABLE `tentang_aplikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `umkm`
--
ALTER TABLE `umkm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `berita`
--
ALTER TABLE `berita`
  ADD CONSTRAINT `berita_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `galeri_umkm`
--
ALTER TABLE `galeri_umkm`
  ADD CONSTRAINT `galeri_umkm_ibfk_1` FOREIGN KEY (`umkm_id`) REFERENCES `umkm` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD CONSTRAINT `pengaduan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengaduan_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `kategori_pengaduan` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `surat_menyurat`
--
ALTER TABLE `surat_menyurat`
  ADD CONSTRAINT `surat_menyurat_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `surat_menyurat_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `kategori_surat` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `umkm`
--
ALTER TABLE `umkm`
  ADD CONSTRAINT `umkm_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori_umkm` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
