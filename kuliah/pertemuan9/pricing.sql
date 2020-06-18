-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 03 Jun 2020 pada 18.05
-- Versi Server: 5.5.32
-- Versi PHP: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `pricing`
--
CREATE DATABASE IF NOT EXISTS `pricing` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pricing`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE IF NOT EXISTS `tb_admin` (
  `id_admin` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `nama_admin` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `telepon` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `status` enum('Aktif','Tidak Aktif') COLLATE latin1_general_ci NOT NULL DEFAULT 'Aktif',
  `alamat` text COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `nama_admin`, `username`, `password`, `telepon`, `email`, `gambar`, `status`, `alamat`) VALUES
('ADM02', '', 'a', 'a', '0234567845678', 'admin@yahoo.com', 'wifi.png', 'Aktif', ''),
('ADM03', '', 'array', 'array', '02345678923456', 'array@a.com', 'keys.jpg', 'Aktif', ''),
('ADM1904001', 'Bagus Eka Satrio', 'baguseka', 'jkl56789', '081281209726', 'b.ekasatrio@gmail.com', '13 (2).jpg', 'Aktif', 'Jl. Kayu Timur no  21, Rawamangun, Kayu Putih, Jakarta Timur');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_customer`
--

CREATE TABLE IF NOT EXISTS `tb_customer` (
  `id_customer` varchar(30) NOT NULL,
  `nama_customer` varchar(30) NOT NULL,
  `nama_instansi` varchar(35) NOT NULL,
  `email` varchar(35) NOT NULL,
  `telepon` varchar(13) NOT NULL,
  `alamat` text NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(35) NOT NULL,
  `status` varchar(20) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_customer`
--

INSERT INTO `tb_customer` (`id_customer`, `nama_customer`, `nama_instansi`, `email`, `telepon`, `alamat`, `username`, `password`, `status`, `keterangan`) VALUES
('CST2005001', 'Agam Hermansyah', 'CV. Abadi Jaya', 'dading@gmail.com', '081211463987', 'Jakarta Selatan', 'cst', 'cst', 'Aktif', '-'),
('CST2006001', 'Ahmad Fatoni', 'CV Code Universal', 'dading@gmail.com', '081211463987', 'Jakarta Selatan', 'ton', 'ton', 'Aktif', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_detail`
--

CREATE TABLE IF NOT EXISTS `tb_detail` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `id_penawaran` varchar(30) NOT NULL,
  `id_pl` varchar(35) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `catatan` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `tb_detail`
--

INSERT INTO `tb_detail` (`id`, `id_penawaran`, `id_pl`, `jumlah`, `subtotal`, `catatan`) VALUES
(2, 'IDP2005001', 'PRD2005001', 40, 120000000, '-'),
(3, 'IDP2005001', 'PRD2005001', 2, 6000000, '-'),
(4, 'IDP2006001', 'PRD2005002', 2, 10000000, '-'),
(5, 'IDP2006001', 'PRD2005001', 1, 3000000, '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_log`
--

CREATE TABLE IF NOT EXISTS `tb_log` (
  `id_log` int(35) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `id_user` varchar(35) NOT NULL,
  `id_customer` varchar(35) NOT NULL,
  `aktifitas` varchar(35) NOT NULL,
  `keterangan` text NOT NULL,
  UNIQUE KEY `id_log` (`id_log`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `tb_log`
--

INSERT INTO `tb_log` (`id_log`, `tanggal`, `jam`, `id_user`, `id_customer`, `aktifitas`, `keterangan`) VALUES
(1, '2020-05-31', '01:12:26', 'USR01', 'CST2005001', 'qweqweqweqwe', '-'),
(2, '2020-06-03', '02:11:34', 'USR02', '', 'Create data Penawaran IDP2006001', '-'),
(3, '2020-06-03', '02:59:59', '', 'CST2006001', 'Update data Penawaran IDP2006001', '-'),
(4, '2020-06-03', '03:14:25', 'USR02', '', 'Update data Penawaran IDP2006001 to', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_notif_customer`
--

CREATE TABLE IF NOT EXISTS `tb_notif_customer` (
  `id_notif` int(35) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `id_customer` varchar(35) NOT NULL,
  `kategori` varchar(35) NOT NULL,
  `id` varchar(35) NOT NULL,
  `pesan` text NOT NULL,
  `status` varchar(20) NOT NULL,
  `keterangan` text NOT NULL,
  UNIQUE KEY `id_notif` (`id_notif`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `tb_notif_customer`
--

INSERT INTO `tb_notif_customer` (`id_notif`, `tanggal`, `jam`, `id_customer`, `kategori`, `id`, `pesan`, `status`, `keterangan`) VALUES
(1, '2020-05-30', '01:23:27', 'CST2005001', '-', '-', '-', '-', '-'),
(2, '2020-06-03', '02:59:59', 'CST2006001', 'Notifikasi', 'IDP2006001', 'Approve Penawaran', 'Unread', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_notif_user`
--

CREATE TABLE IF NOT EXISTS `tb_notif_user` (
  `id_notif` int(35) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `id_user` varchar(35) NOT NULL,
  `kategori` varchar(35) NOT NULL,
  `id` varchar(35) NOT NULL,
  `pesan` text NOT NULL,
  `status` varchar(20) NOT NULL,
  `keterangan` text NOT NULL,
  UNIQUE KEY `id_notif` (`id_notif`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `tb_notif_user`
--

INSERT INTO `tb_notif_user` (`id_notif`, `tanggal`, `jam`, `id_user`, `kategori`, `id`, `pesan`, `status`, `keterangan`) VALUES
(1, '2020-05-31', '01:26:39', 'USR01', '-', '-', 'Besok Libur', 'Read', 'Semester Ganjil'),
(2, '2020-06-03', '02:11:34', 'USR01', 'Notifikasi', 'RO02006001', 'Request RO', 'Unread', '-'),
(3, '2020-06-03', '03:14:25', 'USR02', 'Notifikasi', 'IDP2006001', 'Update Penawaran', 'Unread', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penawaran`
--

CREATE TABLE IF NOT EXISTS `tb_penawaran` (
  `id_penawaran` varchar(30) NOT NULL,
  `id_ro` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `id_user` varchar(35) NOT NULL,
  `pesan` text NOT NULL,
  `dokumen` text NOT NULL,
  `status` varchar(20) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_penawaran`
--

INSERT INTO `tb_penawaran` (`id_penawaran`, `id_ro`, `tanggal`, `jam`, `id_user`, `pesan`, `dokumen`, `status`, `keterangan`) VALUES
('IDP2005001', 'RO02005001', '2020-05-30', '23:46:16', 'USR01', 'Terlampir di dokumen', 'grad.xml', 'Request', '-'),
('IDP2006001', 'RO02006001', '2020-06-03', '02:08:09', 'USR01', 'Terlampir di dokumen', 'avatar.jpg', 'Setuju', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_po`
--

CREATE TABLE IF NOT EXISTS `tb_po` (
  `id_po` varchar(35) NOT NULL,
  `id_penawaran` varchar(35) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `id_user` varchar(35) NOT NULL,
  `perihal` text NOT NULL,
  `dokumen` text NOT NULL,
  `status` varchar(20) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_po`
--

INSERT INTO `tb_po` (`id_po`, `id_penawaran`, `tanggal`, `jam`, `id_user`, `perihal`, `dokumen`, `status`, `keterangan`) VALUES
('PO02005001', 'IDP2005001', '2020-05-31', '01:01:17', 'USR01', 'Permintaan Printer Otomatis', 'avatar.jpg', 'Selesai', '-'),
('PO02006001', 'IDP2006001', '2020-06-03', '03:14:13', 'USR02', 'Permintaan Jaringan High Speed', 'avatar.jpg', 'Selesai', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_produk_layanan`
--

CREATE TABLE IF NOT EXISTS `tb_produk_layanan` (
  `id_pl` varchar(30) NOT NULL,
  `nama_pl` varchar(35) NOT NULL,
  `deskripsi` text NOT NULL,
  `kategori` varchar(35) NOT NULL,
  `harga` int(11) NOT NULL,
  `gambar` text NOT NULL,
  `status` varchar(20) NOT NULL,
  `keterangan` text NOT NULL,
  UNIQUE KEY `id_pl` (`id_pl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_produk_layanan`
--

INSERT INTO `tb_produk_layanan` (`id_pl`, `nama_pl`, `deskripsi`, `kategori`, `harga`, `gambar`, `status`, `keterangan`) VALUES
('PRD2005001', 'Printer Otomatis', 'Media pembelajaran secara umum adalah alat bantu proses belajar mengajar. Segala sesuatu yang dapat dipergunakan untuk merangsang pikiran, perasaan, perhatian dan kemampuan atau ketrampilan pebelajar  sehingga dapat mendorong terjadinya proses belajar. ', 'Service', 3000000, 'bgdash.PNG', 'Aktif', '-'),
('PRD2005002', 'Servis Bulanan', 'Media pembelajaran secara umum adalah alat bantu proses belajar mengajar. Segala sesuatu yang dapat dipergunakan untuk merangsang pikiran, perasaan, perhatian dan kemampuan atau ketrampilan pebelajar  sehingga dapat mendorong terjadinya proses belajar. ', 'Produk', 5000000, 'bgdash.PNG', 'Aktif', '-'),
('PRD2005003', 'Servis Bulanan', 'Media pembelajaran secara umum adalah alat bantu proses belajar mengajar. Segala sesuatu yang dapat dipergunakan untuk merangsang pikiran, perasaan, perhatian dan kemampuan atau ketrampilan pebelajar  sehingga dapat mendorong terjadinya proses belajar. ', 'Produk', 5000000, 'bgdash.PNG', 'Aktif', '-'),
('PRD2005004', 'Servis Bulanan', 'Media pembelajaran secara umum adalah alat bantu proses belajar mengajar. Segala sesuatu yang dapat dipergunakan untuk merangsang pikiran, perasaan, perhatian dan kemampuan atau ketrampilan pebelajar  sehingga dapat mendorong terjadinya proses belajar. ', 'Produk', 5000000, 'bgdash.PNG', 'Aktif', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ro`
--

CREATE TABLE IF NOT EXISTS `tb_ro` (
  `id_ro` varchar(30) NOT NULL,
  `perihal` text NOT NULL,
  `id_customer` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `pesan` text NOT NULL,
  `dokumen` text NOT NULL,
  `status` varchar(30) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_ro`
--

INSERT INTO `tb_ro` (`id_ro`, `perihal`, `id_customer`, `tanggal`, `jam`, `pesan`, `dokumen`, `status`, `keterangan`) VALUES
('RO02005001', 'Permintaan Printer Otomatis', 'CST2005001', '2020-05-30', '23:25:17', 'terimakasih Infonya22', 'grad.xml', 'Batal', '-'),
('RO02006001', 'Permintaan Jaringan High Speed', 'CST2006001', '2020-06-03', '01:24:17', 'To request a conversation, fill out the form. A sales specialist will be in touch within two business days.', 'grad.xml', 'Proses', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE IF NOT EXISTS `tb_user` (
  `id_user` varchar(15) NOT NULL,
  `nama_user` varchar(30) NOT NULL,
  `level` varchar(30) NOT NULL,
  `email` varchar(35) NOT NULL,
  `telepon` varchar(13) NOT NULL,
  `username` varchar(35) NOT NULL,
  `password` varchar(35) NOT NULL,
  `status` varchar(20) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama_user`, `level`, `email`, `telepon`, `username`, `password`, `status`, `keterangan`) VALUES
('USR01', 'Agus Salim H', 'Administrator', 'dading@gmail.com', '081211463987', 'a', 'a', 'Aktif', '-'),
('USR02', 'Budiman', 'Staff Sales', 'dading@gmail.com', '081211463987', 's', 's', 'Aktif', '-');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
