-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.29-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for thuysan
DROP DATABASE IF EXISTS `thuysan`;
CREATE DATABASE IF NOT EXISTS `thuysan` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `thuysan`;

-- Dumping structure for table thuysan.binhluan
DROP TABLE IF EXISTS `binhluan`;
CREATE TABLE IF NOT EXISTS `binhluan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `binhluan_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `binhluan_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `binhluan_noi_dung` longtext COLLATE utf8_unicode_ci NOT NULL,
  `binhluan_trang_thai` int(11) NOT NULL,
  `sanpham_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `binhluan_sanpham_id_foreign` (`sanpham_id`),
  CONSTRAINT `binhluan_sanpham_id_foreign` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.binhluan: ~0 rows (approximately)
DELETE FROM `binhluan`;
/*!40000 ALTER TABLE `binhluan` DISABLE KEYS */;
INSERT INTO `binhluan` (`id`, `binhluan_ten`, `binhluan_email`, `binhluan_noi_dung`, `binhluan_trang_thai`, `sanpham_id`, `created_at`, `updated_at`) VALUES
	(2, 'Mr Huy', 'leduchuy254@gmail.com', 'Tươi ngon', 1, 9, '2018-03-02 13:28:55', '2018-03-02 13:28:55');
/*!40000 ALTER TABLE `binhluan` ENABLE KEYS */;

-- Dumping structure for table thuysan.chitietdonhang
DROP TABLE IF EXISTS `chitietdonhang`;
CREATE TABLE IF NOT EXISTS `chitietdonhang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sanpham_id` int(10) unsigned NOT NULL,
  `donhang_id` int(10) unsigned NOT NULL,
  `chitietdonhang_so_luong` int(11) NOT NULL,
  `chitietdonhang_thanh_tien` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chitietdonhang_sanpham_id_foreign` (`sanpham_id`),
  KEY `chitietdonhang_donhang_id_foreign` (`donhang_id`),
  CONSTRAINT `chitietdonhang_donhang_id_foreign` FOREIGN KEY (`donhang_id`) REFERENCES `donhang` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `chitietdonhang_sanpham_id_foreign` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.chitietdonhang: ~0 rows (approximately)
DELETE FROM `chitietdonhang`;
/*!40000 ALTER TABLE `chitietdonhang` DISABLE KEYS */;
INSERT INTO `chitietdonhang` (`id`, `sanpham_id`, `donhang_id`, `chitietdonhang_so_luong`, `chitietdonhang_thanh_tien`, `created_at`, `updated_at`) VALUES
	(54, 21, 46, 1, 300000.00, NULL, NULL);
/*!40000 ALTER TABLE `chitietdonhang` ENABLE KEYS */;

-- Dumping structure for table thuysan.donhang
DROP TABLE IF EXISTS `donhang`;
CREATE TABLE IF NOT EXISTS `donhang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `donhang_nguoi_nhan` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `donhang_nguoi_nhan_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `donhang_nguoi_nhan_sdt` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `donhang_nguoi_nhan_dia_chi` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `donhang_ghi_chu` longtext COLLATE utf8_unicode_ci NOT NULL,
  `donhang_tong_tien` decimal(10,2) NOT NULL,
  `khachhang_id` int(10) unsigned NOT NULL,
  `tinhtranghd_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `donhang_khachhang_id_foreign` (`khachhang_id`),
  KEY `donhang_tinhtranghd_id_foreign` (`tinhtranghd_id`),
  CONSTRAINT `donhang_khachhang_id_foreign` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `donhang_tinhtranghd_id_foreign` FOREIGN KEY (`tinhtranghd_id`) REFERENCES `tinhtranghd` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.donhang: ~0 rows (approximately)
DELETE FROM `donhang`;
/*!40000 ALTER TABLE `donhang` DISABLE KEYS */;
INSERT INTO `donhang` (`id`, `donhang_nguoi_nhan`, `donhang_nguoi_nhan_email`, `donhang_nguoi_nhan_sdt`, `donhang_nguoi_nhan_dia_chi`, `donhang_ghi_chu`, `donhang_tong_tien`, `khachhang_id`, `tinhtranghd_id`, `created_at`, `updated_at`) VALUES
	(46, 'Lê Đức Huy', 'dinhnhan@gmail.com', '123456789', 'Hà Nội ', 'Chuyển Gấp', 300000.00, 11, 1, '2018-02-28 15:48:40', '2018-02-28 15:48:40');
/*!40000 ALTER TABLE `donhang` ENABLE KEYS */;

-- Dumping structure for table thuysan.donvitinh
DROP TABLE IF EXISTS `donvitinh`;
CREATE TABLE IF NOT EXISTS `donvitinh` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `donvitinh_ten` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `donvitinh_mo_ta` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.donvitinh: ~2 rows (approximately)
DELETE FROM `donvitinh`;
/*!40000 ALTER TABLE `donvitinh` DISABLE KEYS */;
INSERT INTO `donvitinh` (`id`, `donvitinh_ten`, `donvitinh_mo_ta`, `created_at`, `updated_at`) VALUES
	(1, 'Kg', '', NULL, NULL),
	(2, 'Bịch', NULL, NULL, NULL);
/*!40000 ALTER TABLE `donvitinh` ENABLE KEYS */;

-- Dumping structure for table thuysan.hinhsanpham
DROP TABLE IF EXISTS `hinhsanpham`;
CREATE TABLE IF NOT EXISTS `hinhsanpham` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hinhsanpham_ten` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sanpham_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hinhsanpham_sanpham_id_foreign` (`sanpham_id`),
  CONSTRAINT `hinhsanpham_sanpham_id_foreign` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.hinhsanpham: ~8 rows (approximately)
DELETE FROM `hinhsanpham`;
/*!40000 ALTER TABLE `hinhsanpham` DISABLE KEYS */;
INSERT INTO `hinhsanpham` (`id`, `hinhsanpham_ten`, `sanpham_id`, `created_at`, `updated_at`) VALUES
	(84, '18813935_769668749824579_2352218379664339343_n_grande.png', 9, NULL, NULL),
	(85, 'upload_4637c88378604140949c4778e67df08b.jpg', 21, NULL, NULL),
	(86, 'calocdaunhim.jpg', 3, NULL, NULL),
	(87, '1_62565.jpg', 22, NULL, NULL),
	(88, '2_119769.jpg', 22, NULL, NULL),
	(89, '3_202495.jpg', 22, NULL, NULL),
	(90, 'a.jpg', 22, NULL, NULL),
	(91, 'Ech dong.jpg', 22, NULL, NULL);
/*!40000 ALTER TABLE `hinhsanpham` ENABLE KEYS */;

-- Dumping structure for table thuysan.khachhang
DROP TABLE IF EXISTS `khachhang`;
CREATE TABLE IF NOT EXISTS `khachhang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `khachhang_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `khachhang_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `khachhang_sdt` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `khachhang_dia_chi` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `khachhang_khachhang_email_unique` (`khachhang_email`),
  KEY `khachhang_user_id_foreign` (`user_id`),
  CONSTRAINT `khachhang_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.khachhang: ~2 rows (approximately)
DELETE FROM `khachhang`;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` (`id`, `khachhang_ten`, `khachhang_email`, `khachhang_sdt`, `khachhang_dia_chi`, `user_id`, `created_at`, `updated_at`) VALUES
	(9, 'leduchuy', 'leduchuy@gmail.com', '0905887925', '123446', 15, NULL, NULL),
	(10, 'huy', 'leduchuy1@gmail.com', '5456446', '15116', 16, NULL, NULL),
	(11, 'dinhnhan', 'dinhnhan@gmail.com', '123456789', 'đà nẵng', 17, NULL, NULL),
	(12, 'Mr Huy', 'leduchuy22@gmail.com', '0905887925', '213', 18, NULL, NULL);
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;

-- Dumping structure for table thuysan.khuyenmai
DROP TABLE IF EXISTS `khuyenmai`;
CREATE TABLE IF NOT EXISTS `khuyenmai` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `khuyenmai_tieu_de` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `khuyenmai_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `khuyenmai_noi_dung` longtext COLLATE utf8_unicode_ci NOT NULL,
  `khuyenmai_anh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `khuyenmai_phan_tram` int(11) NOT NULL,
  `khuyenmai_thoi_gian` int(11) NOT NULL,
  `khuyenmai_tinh_trang` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.khuyenmai: ~0 rows (approximately)
DELETE FROM `khuyenmai`;
/*!40000 ALTER TABLE `khuyenmai` DISABLE KEYS */;
INSERT INTO `khuyenmai` (`id`, `khuyenmai_tieu_de`, `khuyenmai_url`, `khuyenmai_noi_dung`, `khuyenmai_anh`, `khuyenmai_phan_tram`, `khuyenmai_thoi_gian`, `khuyenmai_tinh_trang`, `created_at`, `updated_at`) VALUES
	(9, 'Khuyến Mãi Hè ', 'khuyen-mai-he-', '<p>Khuyến M&atilde;i Hot M&ugrave;a H&egrave;</p>\r\n', 'calocdaunhim.jpg', 10, 10, 1, '2018-02-27 11:07:36', '2018-02-27 11:07:36');
/*!40000 ALTER TABLE `khuyenmai` ENABLE KEYS */;

-- Dumping structure for table thuysan.loainguoidung
DROP TABLE IF EXISTS `loainguoidung`;
CREATE TABLE IF NOT EXISTS `loainguoidung` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loainguoidung_ten` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.loainguoidung: ~2 rows (approximately)
DELETE FROM `loainguoidung`;
/*!40000 ALTER TABLE `loainguoidung` DISABLE KEYS */;
INSERT INTO `loainguoidung` (`id`, `loainguoidung_ten`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', NULL, NULL),
	(2, 'user', NULL, NULL);
/*!40000 ALTER TABLE `loainguoidung` ENABLE KEYS */;

-- Dumping structure for table thuysan.loaisanpham
DROP TABLE IF EXISTS `loaisanpham`;
CREATE TABLE IF NOT EXISTS `loaisanpham` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loaisanpham_ten` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `loaisanpham_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `loaisanpham_mo_ta` longtext COLLATE utf8_unicode_ci,
  `loaisanpham_anh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `loaisanpham_da_xoa` int(11) NOT NULL,
  `nhom_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loaisanpham_nhom_id_foreign` (`nhom_id`),
  CONSTRAINT `loaisanpham_nhom_id_foreign` FOREIGN KEY (`nhom_id`) REFERENCES `nhom` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.loaisanpham: ~11 rows (approximately)
DELETE FROM `loaisanpham`;
/*!40000 ALTER TABLE `loaisanpham` DISABLE KEYS */;
INSERT INTO `loaisanpham` (`id`, `loaisanpham_ten`, `loaisanpham_url`, `loaisanpham_mo_ta`, `loaisanpham_anh`, `loaisanpham_da_xoa`, `nhom_id`, `created_at`, `updated_at`) VALUES
	(1, 'Mực - Bạch Tuộc', 'muc---bach-tuoc', '', 'muc-seafood-banner.png', 1, 1, NULL, NULL),
	(2, 'Cá Nước Lợ', 'ca-nuoc-lo', '', '0000309-ca-bop-cua-lo-500.jpg', 1, 2, NULL, NULL),
	(3, 'Ếch Tươi Sống', 'ech-tuoi-song', '', 'banner4-768x284_______OK.jpg', 1, 2, NULL, NULL),
	(4, 'Lươn Đồng Sạch', 'luon-dong-sach', '', 'banner-hau1494563948_920x300.jpg', 1, 2, NULL, NULL),
	(5, 'Cá Nước Mặn', 'ca-nuoc-man', '', 'tải xuống.jpg', 1, 1, NULL, NULL),
	(6, 'Cua - Ghẹ', 'cua---ghe', '', 'banner-22.jpg', 1, 1, NULL, NULL),
	(7, 'Bào Ngư Cao Cấp', 'bao-ngu-cao-cap', '', 'gcs_full_59b0c2c176ec571b9f28ce6a-2017-09-07-035337.png', 1, 3, NULL, NULL),
	(8, 'Hải Sâm Cao Cấp', 'hai-sam-cao-cap', '', 'gcs_full_59b0c2c176ec571b9f28ce6a-2017-09-07-035337.png', 1, 3, NULL, NULL),
	(9, 'Cá Khô ', 'ca-kho-', '<p>abc</p>\r\n', 'banner_trong_1.jpg', 1, 4, NULL, NULL),
	(10, 'Mực Khô ', 'muc-kho-', '', '1559a9f9b2b4dd2.jpg', 1, 4, NULL, NULL),
	(11, 'Ốc - Sò ', 'oc---so-', '', 'banner4-768x284_______OK.jpg', 0, 1, NULL, NULL);
/*!40000 ALTER TABLE `loaisanpham` ENABLE KEYS */;

-- Dumping structure for table thuysan.lohang
DROP TABLE IF EXISTS `lohang`;
CREATE TABLE IF NOT EXISTS `lohang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lohang_ky_hieu` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `lohang_han_su_dung` int(11) NOT NULL,
  `lohang_gia_mua_vao` decimal(10,2) NOT NULL,
  `lohang_gia_ban_ra` decimal(10,2) NOT NULL,
  `lohang_so_luong_nhap` int(11) NOT NULL,
  `lohang_so_luong_da_ban` int(11) NOT NULL,
  `lohang_so_luong_doi_tra` int(11) NOT NULL,
  `lohang_so_luong_hien_tai` int(11) NOT NULL,
  `lohang_tinh_trang` int(11) DEFAULT NULL COMMENT '1',
  `sanpham_id` int(10) unsigned NOT NULL,
  `nhacungcap_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lohang_nhacungcap_id_foreign` (`nhacungcap_id`),
  KEY `lohang_sanpham_id_foreign` (`sanpham_id`),
  CONSTRAINT `lohang_nhacungcap_id_foreign` FOREIGN KEY (`nhacungcap_id`) REFERENCES `nhacungcap` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `lohang_sanpham_id_foreign` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.lohang: ~4 rows (approximately)
DELETE FROM `lohang`;
/*!40000 ALTER TABLE `lohang` DISABLE KEYS */;
INSERT INTO `lohang` (`id`, `lohang_ky_hieu`, `lohang_han_su_dung`, `lohang_gia_mua_vao`, `lohang_gia_ban_ra`, `lohang_so_luong_nhap`, `lohang_so_luong_da_ban`, `lohang_so_luong_doi_tra`, `lohang_so_luong_hien_tai`, `lohang_tinh_trang`, `sanpham_id`, `nhacungcap_id`, `created_at`, `updated_at`) VALUES
	(21, 'A3000', 30, 50000.00, 70000.00, 10, 0, 0, 10, NULL, 22, 2, '2018-02-27 20:46:28', '2018-02-27 20:46:28'),
	(22, 'T0002', 10, 190000.00, 300000.00, 10, 0, 0, 10, NULL, 21, 2, '2018-02-27 20:47:37', '2018-02-27 20:47:37'),
	(23, 'T0001', 10, 50000.00, 70000.00, 10, 0, 0, 10, NULL, 9, 3, '2018-02-27 20:49:35', '2018-02-27 20:49:35'),
	(25, 'N0003', 10, 50000.00, 70000.00, 10, 0, 0, 10, NULL, 3, 2, '2018-02-27 20:50:42', '2018-02-27 20:50:42');
/*!40000 ALTER TABLE `lohang` ENABLE KEYS */;

-- Dumping structure for table thuysan.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.migrations: ~41 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`migration`, `batch`) VALUES
	('2016_04_14_110951_create_nhacungcap_table', 1),
	('2016_04_16_005616_create_nhom_table', 1),
	('2016_04_18_030252_create_tuyendung_table', 1),
	('2016_04_20_062118_create_khuyenmai_table', 1),
	('2016_04_28_141651_create-donvitinh-table', 1),
	('2016_04_16_011341_create_loaisanpham_table', 2),
	('2016_04_20_031400_create_sanpham_table', 3),
	('2016_04_20_032205_create_giabanra_table', 4),
	('2016_04_20_133501_create_hinhsanpham_table', 4),
	('2016_04_25_174513_create_giamuavao_table', 4),
	('2016_05_01_023512_create_nhom_table', 5),
	('2016_05_01_023719_create_loaisanpham_table', 6),
	('2016_05_01_023846_create_sanpham_table', 7),
	('2016_05_01_023949_create_giabanra_table', 8),
	('2016_05_01_024111_create_giamuavao_table', 8),
	('2016_05_01_024136_create_hinhsanpham_table', 8),
	('2016_05_09_032019_create_monngon_table', 9),
	('2016_05_10_165156_create_hinhmonngon_table', 10),
	('2016_05_13_074300_create_lohang_table', 11),
	('2016_05_13_102657_create_sanpham_table', 12),
	('2016_05_13_103740_create_lohang_table', 13),
	('2016_05_13_104520_create_hinhsanpham_table', 14),
	('2016_05_13_105811_create_hinhsanpham_table', 15),
	('2016_05_13_162644_create_monngon_table', 16),
	('2016_05_14_073949_create_nguyenlieu_table', 17),
	('2016_05_16_112417_create_khuyenmai_table', 18),
	('2016_05_16_150907_create_tylegia_table', 19),
	('2016_05_16_160708_create_tylegia_table', 20),
	('2016_05_17_075014_create_tuyendung_table', 21),
	('2016_05_19_093429_create_khuyenmai_table', 22),
	('2016_05_19_093815_create_sanphamkhuyenmai_table', 23),
	('2016_05_20_091554_craete_pages_table', 24),
	('2016_05_23_092444_create_loainguoidung_table', 24),
	('2014_10_12_000000_create_users_table', 25),
	('2016_05_23_094448_create_nhanvien_table', 26),
	('2016_06_01_081813_create_khachhang_table', 27),
	('2016_06_01_085225_create_tinhtranghd_table', 28),
	('2016_06_01_084422_create_donhang_table', 29),
	('2016_06_01_090918_create_chitietdonhang_table', 30),
	('2016_06_01_151838_create_binhluan_table', 31),
	('2016_06_22_215955_create_quangcao_table', 32);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table thuysan.monngon
DROP TABLE IF EXISTS `monngon`;
CREATE TABLE IF NOT EXISTS `monngon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monngon_tieu_de` text COLLATE utf8_unicode_ci NOT NULL,
  `monngon_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `monngon_tom_tat` longtext COLLATE utf8_unicode_ci NOT NULL,
  `monngon_noi_dung` longtext COLLATE utf8_unicode_ci NOT NULL,
  `monngon_luot_xem` int(11) NOT NULL,
  `monngon_anh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `monngon_da_xoa` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.monngon: ~3 rows (approximately)
DELETE FROM `monngon`;
/*!40000 ALTER TABLE `monngon` DISABLE KEYS */;
INSERT INTO `monngon` (`id`, `monngon_tieu_de`, `monngon_url`, `monngon_tom_tat`, `monngon_noi_dung`, `monngon_luot_xem`, `monngon_anh`, `monngon_da_xoa`, `created_at`, `updated_at`) VALUES
	(1, 'Khô mực chiên nước mắm: Món nhắm tuyệt vời cho mùa bóng', 'kho-muc-chien-nuoc-mam:-mon-nham-tuyet-voi-cho-mua-bong', '<p>M&ugrave;a Euro đ&atilde; bắt đầu, h&atilde;y học ngay c&ocirc;ng thức kh&ocirc; mực chi&ecirc;n nước mắm tuyệt ngon n&agrave;y để cho c&aacute;c buổi xem b&oacute;ng đ&aacute; th&ecirc;m x&ocirc;m n&agrave;o!</p>\r\n', '<p><strong><u>Nguy&ecirc;n liệu l&agrave;m kh&ocirc; mực:</u></strong></p>\r\n\r\n<p><strong><em>- 2 con mực kh&ocirc; cỡ vừa</em></strong></p>\r\n\r\n<p><strong><em>- 1 củ tỏi</em></strong></p>\r\n\r\n<p><strong><em>- 15g đường (2 th&igrave;a)</em></strong></p>\r\n\r\n<p><strong><em>- 10ml nước mắm (1 th&igrave;a)</em></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="Khô mực chiên nước mắm: Món nhắm tuyệt vời cho mùa bóng - Ảnh 1." id="img_ca89dd60-323f-11e6-aa10-f7306ed585e3" src="https://k14.vcmedia.vn/thumb_w/650/2016/muc-0-1465915869087.png" title="Khô mực chiên nước mắm: Món nhắm tuyệt vời cho mùa bóng - Ảnh 1." /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><u>Nguy&ecirc;n liệu l&agrave;m kh&ocirc; mực:</u></strong></p>\r\n\r\n<p><strong><em>- 2 con mực kh&ocirc; cỡ vừa</em></strong></p>\r\n\r\n<p><strong><em>- 1 củ tỏi</em></strong></p>\r\n\r\n<p><strong><em>- 15g đường (2 th&igrave;a)</em></strong></p>\r\n\r\n<p><strong><em>- 10ml nước mắm (1 th&igrave;a)</em></strong></p>\r\n\r\n<p><strong><u>C&aacute;ch l&agrave;m kh&ocirc; mực như sau:</u></strong></p>\r\n\r\n<p>Bước 1:</p>\r\n\r\n<p>- Đầu ti&ecirc;n, bạn nướng ch&iacute;n mực.</p>\r\n\r\n<p>Bước 2:</p>\r\n\r\n<p>- Đập cho con mực b&ocirc;ng tơi.</p>\r\n\r\n<p>Bước 3:</p>\r\n\r\n<p>- Sau đ&oacute;, ta x&eacute; mực th&agrave;nh sợi nhỏ.</p>\r\n\r\n<p>Bước 4:</p>\r\n\r\n<p>- Phi cho tỏi thơm gi&ograve;n rồi vớt ra b&aacute;t.</p>\r\n\r\n<p>Bước 5:</p>\r\n\r\n<p>- Cho mực, tỏi phi, đường, nước mắm v&agrave;o chảo rồi đảo đến khi đường keo lại.</p>\r\n\r\n<p><strong>Chỉ c&oacute; vậy th&ocirc;i l&agrave; xong xu&ocirc;i rồi!</strong></p>\r\n\r\n<p>Kh&ocirc; mực chi&ecirc;n nước mắm ch&aacute;y tỏi c&oacute; m&ugrave;i vị rất hấp dẫn nh&eacute;!</p>\r\n\r\n<p>Sợi mực vừa dai vừa gi&ograve;n ăn th&iacute;ch cực lu&ocirc;n!</p>\r\n\r\n<p>Nếu th&iacute;ch th&igrave; c&aacute;c bạn c&oacute; thể vắt th&ecirc;m một &iacute;t chanh hoặc quất nữa...</p>\r\n', 1, 'khomuc.JPG', 1, '2016-06-15 08:42:11', '2016-06-15 08:42:11'),
	(3, 'NẤM BÀO NGƯ XÀO XỐT MÈ', 'nam-bao-ngu-xao-xot-me', '<p><strong>Mới x&agrave;o th&ocirc;i m&agrave; m&ugrave;i m&egrave; lẫn m&ugrave;i xốt mayonnaise Aji-mayo đ&atilde; thơm lừng rồi. Khi được b&agrave;y ra dĩa, m&oacute;n ăn với nhiều m&agrave;u sắc của nấm b&agrave;o ngư, c&agrave; rốt, v&agrave; b&ocirc;ng cải trong thật hấp dẫn. Thịt nạc dăm thấm vị ăn v&agrave;o thơm thơm vị x&agrave;o, nấm b&agrave;o ngư vừa ch&iacute;n tới cũng ngon ngọt kh&ocirc;ng k&eacute;m.&nbsp;</strong></p>\r\n', '<h3>NGUY&Ecirc;N LIỆU</h3>\r\n\r\n<ul>\r\n	<li>Nấm b&agrave;o ngư: 200g</li>\r\n	<li>Ớt sừng băm: 1M</li>\r\n	<li>Thịt nạc dăm: 50g</li>\r\n	<li>C&agrave; rốt: 50g</li>\r\n	<li>H&agrave;nh l&aacute;: 3 nh&aacute;nh</li>\r\n	<li>H&agrave;nh t&iacute;m băm: 1M</li>\r\n	<li>B&ocirc;ng cải xanh: 100g</li>\r\n	<li>M&egrave; rang: 30g</li>\r\n	<li>Tỏi băm: 1M</li>\r\n	<li>Dầu ăn, dầu m&egrave;, đường, ti&ecirc;u</li>\r\n	<li>Hạt n&ecirc;m</li>\r\n	<li>Xốt Mayonaise</li>\r\n	<li>Nước tương</li>\r\n	<li>&nbsp;</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>1. SƠ CHẾ:</h3>\r\n\r\n<p>&ndash; Nấm b&agrave;o ngư x&eacute; đ&ocirc;i, ướp 1M h&agrave;nh, tỏi băm, 1M nước tương&nbsp;<em>&ldquo;Ph&uacute; Sĩ&rdquo;</em>&nbsp;v&agrave;&nbsp; 1/2M đường.</p>\r\n\r\n<p>&ndash; Thịt nạc dăm cắt miếng, ướp 1M h&agrave;nh, tỏi băm, 1/2M hạt n&ecirc;m Aji-ngon&reg;, 1/2M ti&ecirc;u.</p>\r\n\r\n<p>&ndash; B&ocirc;ng cải xanh t&aacute;ch nh&aacute;nh thật nhỏ. C&agrave; rốt cắt l&aacute;t mỏng, d&ugrave;ng dao răng cưa nhấn chiều ngang 1cm. H&agrave;nh l&aacute; cắt kh&uacute;c.</p>\r\n\r\n<p>&ndash; Pha gia vị x&agrave;o: 2M xốt mayonnaise&nbsp;<em>&ldquo;Aji-mayo&rdquo;,</em>&nbsp;1M nước tương&nbsp;<em>&ldquo;Ph&uacute; Sĩ&rdquo;,</em>&nbsp;1/3M ti&ecirc;u, 1M dầu m&egrave;, 1M m&egrave; rang, 1M ớt sừng băm.&nbsp;</p>\r\n\r\n<h3>2. THỰC HIỆN:</h3>\r\n\r\n<p>Phi thơm h&agrave;nh tỏi, x&agrave;o săn thịt nạc dăm, cho nấm b&agrave;o ngư v&agrave;o x&agrave;o lửa lớn, th&ecirc;m một &iacute;t nước, tiếp tục cho b&ocirc;ng cải, c&agrave; rốt v&agrave;o x&agrave;o ch&iacute;n. Th&ecirc;m 1/2 ch&eacute;n nước, cuối c&ugrave;ng tắt lửa, th&ecirc;m xốt x&agrave;o v&agrave; h&agrave;nh l&aacute; v&agrave;o, đảo đều, rắc th&ecirc;m m&egrave; rang c&ograve;n lại.</p>\r\n', 1, 'nam-bao-ngu-xot-me.png', 1, '2016-05-14 08:01:29', '2016-05-14 08:01:29'),
	(4, 'Nấm xào ngũ sắc bắt mắt người ăn', 'nam-xao-ngu-sac-bat-mat-nguoi-an', '<p><strong><span style="color:#000000">Nấm l&agrave; 1 thực phẩm kh&ocirc;ng những ngon m&agrave; c&ograve;n rất c&oacute; lợi cho sức khỏe. Mỗi loại nấm lại đem đến cho ta 1 hương vị ri&ecirc;ng, l&agrave;m n&ecirc;n sự độc đ&aacute;o, ngon miệng của bữa cơm gia đ&igrave;nh. H&ocirc;m nay sổ tay nấu ăn sẽ hướng dẫn cả nh&agrave; m&oacute;n Nấm x&agrave;o ngũ sắc</span></strong></p>\r\n', '<h4>Nguy&ecirc;n liệu:</h4>\r\n\r\n<ul>\r\n	<li><a href="http://sotaynauan.com/tag/nam-mo/">Nấm mỡ</a>&nbsp;-&nbsp;khoảng 400 gr</li>\r\n	<li><a href="http://sotaynauan.com/tag/tom-tuoi/">T&ocirc;m tươi</a>&nbsp;-&nbsp;300 gr</li>\r\n	<li><a href="http://sotaynauan.com/tag/dau-ha-lan/">Đậu H&agrave; lan</a>&nbsp;-&nbsp;150 gr</li>\r\n	<li><a href="http://sotaynauan.com/tag/ot-chuong-do-vang/">Ớt chu&ocirc;ng đỏ, v&agrave;ng</a>&nbsp;-&nbsp;1 nửa quả mỗi loại</li>\r\n	<li><a href="http://sotaynauan.com/tag/ngo-non/">Ng&ocirc; non</a>&nbsp;-&nbsp;200 gr</li>\r\n</ul>\r\n\r\n<h4>Hướng dẫn:</h4>\r\n\r\n<p><strong>Bước 1:&nbsp;</strong>Nấm&nbsp;mỡ cắt bỏ ch&acirc;n, mũ nấm n&agrave;o to th&igrave; bổ l&agrave;m đ&ocirc;i, ng&ocirc; non&nbsp;cũng vậy, bắp n&agrave;o to c&aacute;c bạn bổ đ&ocirc;i ra cho vừa ăn nh&eacute;. Đậu H&agrave; Lan tước bỏ xơ, ớt chu&ocirc;ng&nbsp;đỏ v&agrave;ng th&aacute;i miếng d&agrave;i.</p>\r\n\r\n<p><strong>Bước 2:&nbsp;</strong>Đun s&ocirc;i 1 nồi nước, thả 1 d&uacute;m muối rồi cho ng&ocirc; non&nbsp;v&agrave; đậu H&agrave; Lan&nbsp;v&agrave;o trần sơ, vớt ra ng&acirc;m ngay v&agrave;o b&aacute;t nước lạnh để ng&ocirc; v&agrave; đậu giữ được m&agrave;u sắc đẹp.</p>\r\n\r\n<p><strong>Bước 3:&nbsp;</strong><em>T&ocirc;m</em>&nbsp;tươi b&oacute;c bỏ đầu v&agrave; vỏ, đem x&agrave;o săn với h&agrave;nh kh&ocirc; v&agrave; nước mắm, tr&uacute;t ra 1 đĩa ri&ecirc;ng.</p>\r\n\r\n<p><strong>Bước 4:</strong>&nbsp;Tiếp tục cho dầu ăn v&agrave;o chảo, ch&uacute;ng ta x&agrave;o đến phần nấm, &oacute;t chu&ocirc;ng&nbsp;đỏ v&agrave; v&agrave;ng. N&ecirc;m nếm gia vị vừa miệng.</p>\r\n\r\n<p><strong>Bước 5:</strong>&nbsp;Khi nấm gần ch&iacute;n v&agrave; đ&atilde; ngấm gia vị, c&aacute;c bạn cho đến phần ng&ocirc; non v&agrave; &nbsp;đậu H&agrave; Lanv&agrave;o x&agrave;o c&ugrave;ng. Ở bước n&agrave;y c&oacute; thể th&ecirc;m 1 ch&uacute;t dầu h&agrave;o v&agrave;o để tăng hương vị v&agrave; sắc b&oacute;ng đẹp cho &nbsp;m&oacute;n x&agrave;o&nbsp;của ch&uacute;ng ta.</p>\r\n\r\n<p><strong>Bước 6:</strong>&nbsp;Cuối c&ugrave;ng l&agrave; đến t&ocirc;m, c&aacute;c bạn đảo nhanh tay v&agrave; tắt bếp. Cho m&oacute;n&nbsp;nấm x&agrave;o ngũ sắc&nbsp;ra đĩa v&agrave; c&ugrave;ng cả nh&agrave; thưởng thức nh&eacute;!</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 'che-bien-nam-xao-ngu-sac-.jpg', 1, '2016-05-14 08:03:13', '2016-05-14 08:03:13'),
	(5, 'Món Hàu Nướng 18 Vị ', 'mon-hau-nuong-18-vi-', '<p>M&oacute;n H&agrave;u Nướng 18 Vị&nbsp;</p>\r\n', '<p>M&oacute;n H&agrave;u Nướng 18 Vị&nbsp;</p>\r\n', 1, 'banner-hau1494563948_920x300.jpg', 1, '2018-03-02 13:59:27', '2018-03-02 13:59:27');
/*!40000 ALTER TABLE `monngon` ENABLE KEYS */;

-- Dumping structure for table thuysan.nguyenlieu
DROP TABLE IF EXISTS `nguyenlieu`;
CREATE TABLE IF NOT EXISTS `nguyenlieu` (
  `monngon_id` int(10) unsigned NOT NULL,
  `sanpham_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `nguyenlieu_monngon_id_foreign` (`monngon_id`),
  KEY `nguyenlieu_sanpham_id_foreign` (`sanpham_id`),
  CONSTRAINT `nguyenlieu_monngon_id_foreign` FOREIGN KEY (`monngon_id`) REFERENCES `monngon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nguyenlieu_sanpham_id_foreign` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.nguyenlieu: ~2 rows (approximately)
DELETE FROM `nguyenlieu`;
/*!40000 ALTER TABLE `nguyenlieu` DISABLE KEYS */;
INSERT INTO `nguyenlieu` (`monngon_id`, `sanpham_id`, `created_at`, `updated_at`) VALUES
	(1, 9, NULL, NULL);
/*!40000 ALTER TABLE `nguyenlieu` ENABLE KEYS */;

-- Dumping structure for table thuysan.nhacungcap
DROP TABLE IF EXISTS `nhacungcap`;
CREATE TABLE IF NOT EXISTS `nhacungcap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nhacungcap_ten` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `nhacungcap_dia_chi` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `nhacungcap_sdt` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.nhacungcap: ~5 rows (approximately)
DELETE FROM `nhacungcap`;
/*!40000 ALTER TABLE `nhacungcap` DISABLE KEYS */;
INSERT INTO `nhacungcap` (`id`, `nhacungcap_ten`, `nhacungcap_dia_chi`, `nhacungcap_sdt`, `created_at`, `updated_at`) VALUES
	(1, 'Cần Thơ ', '<p>a</p>\r\n', '01678991282', NULL, NULL),
	(2, 'Chợ Đầu Mối', '<p>a</p>\r\n', ' 0917116441', NULL, NULL),
	(3, 'Chợ Hải Sản', '<p>1</p>\r\n', '0938031013', NULL, NULL),
	(4, 'Chợ Đống Đa', '<p>1</p>\r\n', '0862833102', NULL, NULL),
	(8, 'Công Ty TNHH Hải Mạnh Bắc Ninh', '<p>Th&ocirc;n Đa Cầu, X. Nam Sơn, TP. Bắc Ninh,&nbsp;<strong><em>Bắc Ninh</em></strong></p>\r\n', '0912436220', NULL, NULL);
/*!40000 ALTER TABLE `nhacungcap` ENABLE KEYS */;

-- Dumping structure for table thuysan.nhanvien
DROP TABLE IF EXISTS `nhanvien`;
CREATE TABLE IF NOT EXISTS `nhanvien` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nhanvien_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nhanvien_cmnd` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `nhanvien_sdt` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `nhanvien_dia_chi` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `nhanvien_ngay_vao_lam` date NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nhanvien_nhanvien_cmnd_unique` (`nhanvien_cmnd`),
  KEY `nhanvien_user_id_foreign` (`user_id`),
  CONSTRAINT `nhanvien_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.nhanvien: ~0 rows (approximately)
DELETE FROM `nhanvien`;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` (`id`, `nhanvien_ten`, `nhanvien_cmnd`, `nhanvien_sdt`, `nhanvien_dia_chi`, `nhanvien_ngay_vao_lam`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'Trịnh Thị Ngọc Hân', '301498483', '012678991281', 'Long An', '2016-05-01', 1, '2016-05-23 11:28:32', '2016-05-23 11:28:32');
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;

-- Dumping structure for table thuysan.nhom
DROP TABLE IF EXISTS `nhom`;
CREATE TABLE IF NOT EXISTS `nhom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nhom_ten` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nhom_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nhom_mo_ta` text COLLATE utf8_unicode_ci,
  `nhom_anh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.nhom: ~4 rows (approximately)
DELETE FROM `nhom`;
/*!40000 ALTER TABLE `nhom` DISABLE KEYS */;
INSERT INTO `nhom` (`id`, `nhom_ten`, `nhom_url`, `nhom_mo_ta`, `nhom_anh`, `created_at`, `updated_at`) VALUES
	(1, 'Sản Phẩm Nước Mặn', 'san-pham-nuoc-man', '', 'banner_home1.jpg', NULL, NULL),
	(2, 'Sản Phẩm Nước Lợ', 'san-pham-nuoc-lo', '', 'banner21.jpg', NULL, NULL),
	(3, 'Sản Phẩm Cao Cấp', 'san-pham-cao-cap', '', 'block-banner.jpg', NULL, NULL),
	(4, 'Sản Phẩm Khô ', 'san-pham-kho-', '', 'banner_trong_1.jpg', NULL, NULL);
/*!40000 ALTER TABLE `nhom` ENABLE KEYS */;

-- Dumping structure for table thuysan.quangcao
DROP TABLE IF EXISTS `quangcao`;
CREATE TABLE IF NOT EXISTS `quangcao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quangcao_anh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quangcao_trang_thai` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.quangcao: ~4 rows (approximately)
DELETE FROM `quangcao`;
/*!40000 ALTER TABLE `quangcao` DISABLE KEYS */;
INSERT INTO `quangcao` (`id`, `quangcao_anh`, `quangcao_trang_thai`, `created_at`, `updated_at`) VALUES
	(2, 'banner-22.jpg', 1, NULL, NULL),
	(3, '4800414banner1.jpg', 1, NULL, NULL),
	(4, 'banner4-768x284_______OK.jpg', 1, NULL, NULL),
	(5, 'banner_home1.jpg', 1, NULL, NULL);
/*!40000 ALTER TABLE `quangcao` ENABLE KEYS */;

-- Dumping structure for table thuysan.sanpham
DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE IF NOT EXISTS `sanpham` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sanpham_ky_hieu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sanpham_ten` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sanpham_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sanpham_anh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sanpham_mo_ta` longtext COLLATE utf8_unicode_ci NOT NULL,
  `loaisanpham_id` int(10) unsigned NOT NULL,
  `donvitinh_id` int(10) unsigned NOT NULL,
  `sanpham_khuyenmai` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sanpham_loaisanpham_id_foreign` (`loaisanpham_id`),
  KEY `sanpham_donvitinh_id_foreign` (`donvitinh_id`),
  CONSTRAINT `sanpham_donvitinh_id_foreign` FOREIGN KEY (`donvitinh_id`) REFERENCES `donvitinh` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sanpham_loaisanpham_id_foreign` FOREIGN KEY (`loaisanpham_id`) REFERENCES `loaisanpham` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.sanpham: ~4 rows (approximately)
DELETE FROM `sanpham`;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` (`id`, `sanpham_ky_hieu`, `sanpham_ten`, `sanpham_url`, `sanpham_anh`, `sanpham_mo_ta`, `loaisanpham_id`, `donvitinh_id`, `sanpham_khuyenmai`, `created_at`, `updated_at`) VALUES
	(3, 'N0003', 'Cá Lóc Đồng', 'ca-loc-dong', 'tải xuống.jpg', '<p>Quy c&aacute;ch :&nbsp;<em>C&aacute; l&oacute;c đồng&nbsp;sống nguy&ecirc;n con</em></p>\r\n\r\n<p>Gi&aacute; b&aacute;n c&aacute; l&oacute;c đồng&nbsp;: 155.000 vnđ/kg</p>\r\n\r\n<p>K&iacute;ch cỡ: size từ 1kg- 2kg</p>\r\n', 2, 1, 1, '2016-05-13 11:25:31', '2018-02-26 14:03:21'),
	(9, 'T0001', 'Bạch Tuộc Tươi Sống', 'bach-tuoc-tuoi-song', 'bach-tuoc-nuong-muoi-ot-1.jpg', '<h3>Bạch tuộc tươi sống v&agrave; nơi b&aacute;n uy t&iacute;n</h3>\r\n\r\n<p><strong>Bạch Tuộc</strong>&nbsp;c&ograve;n được gọi l&agrave; mực tr&ugrave;m, l&agrave; m&oacute;n ăn kh&aacute; quen thuộc của người d&acirc;n xứ biển, c&oacute; thể chế biến th&agrave;nh nhiều m&oacute;n ăn ngon, được nhiều người ưa chuộng như: nướng sa tế, hấp gừng, l&agrave;m gỏi&hellip; Những m&oacute;n n&agrave;y ăn ngon, đơn giản v&agrave; cũng dễ chế biến.</p>\r\n\r\n<p>Quy c&aacute;ch:&nbsp;<strong>&nbsp;</strong>H&agrave;ng tươi thường c&oacute; v&agrave;o buổi s&aacute;ng. Từ buổi chiều th&igrave; h&agrave;ng tươi sẽ chuyển sang cấp đ&ocirc;ng để bảo đảm độ tươi ngon.&nbsp;H&agrave;ng sống giao tới nơi c&ograve;n b&ograve; (sống tốt từ 5-7 ng&agrave;y nếu chăm s&oacute;c tốt). C&oacute; bạch tuộc l&agrave;m sạch cho Qu&yacute; Kh&aacute;ch nếu c&oacute; y&ecirc;u cầu.</p>\r\n\r\n<p><em>Gi&aacute; b&aacute;n bạch tuộc tươi sống</em>&nbsp;hiện nay tại TpHCM</p>\r\n\r\n<p>&ndash; Bạch tuộc nhỏ<strong>:</strong>&nbsp;0,5-1 lạng/con &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gi&aacute; 95.000 đ/kg ( cơm chi&ecirc;n hải sản)</p>\r\n\r\n<p>&ndash; Bạch tuộc trung<strong>:</strong>&nbsp;2,5-9 lạng/con &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gi&aacute; 105.000 đ/kg (d&ugrave;ng để nướng l&agrave; tuyệt vời nhất)</p>\r\n\r\n<p>&ndash; Bạch tuộc lớn<strong>:</strong>&nbsp;1- 6 kg/ con ( mực hũ) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gi&aacute; 125.000 đ/kg ( d&ugrave;ng cho Tiệc, Nh&agrave; H&agrave;ng,..)</p>\r\n\r\n<p>&ndash;&nbsp;<a href="http://chuyenhaisantuoisong.com/t/bach-tuoc-song" title="Bạch tuộc sống">Bạch tuộc sống</a><strong>:</strong>&nbsp;18-30 con/kg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gi&aacute; 490.000 đ/kg t&ugrave;y ng&agrave;y ( d&ugrave;ng ăn sống, nh&uacute;ng mẻ, nh&uacute;ng giấm,..)</p>\r\n\r\n<p>Lưu &yacute;: bạch tuộc ngo&agrave;i chợ tr&ocirc;i nổi v&agrave; một số nơi b&aacute;n thường hay bị ng&acirc;m nước muối cả ng&agrave;y ( bạch tuộc sẽ bị ươn) để tăng trọng, để tăng lợi nhuận bất ch&iacute;nh, đ&aacute;nh v&agrave;o Kh&aacute;ch h&agrave;ng ham gi&aacute; rẻ, thịt kh&aacute; bở v&agrave; mặn. Ch&uacute;ng t&ocirc;i cam kết b&aacute;n&nbsp;<a href="http://chuyenhaisantuoisong.com/c/san-pham" title="sản phẩm">sản phẩm</a>&nbsp;tươi ngon, chất lượng, kh&ocirc;ng ng&acirc;m nước, kh&ocirc;ng h&oacute;a chất bảo quản.</p>\r\n', 1, 1, 0, '2016-05-17 10:21:21', '2018-02-26 11:55:32'),
	(21, 'T0002', 'Cá Mú Đen', 'ca-mu-den', 'images.jpg', '<p>&aacute;đ&acirc;sd</p>\r\n', 5, 1, 0, '2018-02-26 20:57:58', '2018-02-26 14:00:26'),
	(22, 'A3000', 'Ếch Đồng Tươi Sống ', 'ech-dong-tuoi-song-', 'baotuech_04_ysqq.jpg', '<p>Ếch Đồng&nbsp;</p>\r\n', 3, 1, 0, '2018-02-27 18:00:12', '2018-02-27 18:00:12');
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;

-- Dumping structure for table thuysan.sanphamkhuyenmai
DROP TABLE IF EXISTS `sanphamkhuyenmai`;
CREATE TABLE IF NOT EXISTS `sanphamkhuyenmai` (
  `khuyenmai_id` int(10) unsigned NOT NULL,
  `sanpham_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `sanphamkhuyenmai_khuyenmai_id_foreign` (`khuyenmai_id`),
  KEY `sanphamkhuyenmai_sanpham_id_foreign` (`sanpham_id`),
  CONSTRAINT `sanphamkhuyenmai_khuyenmai_id_foreign` FOREIGN KEY (`khuyenmai_id`) REFERENCES `khuyenmai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sanphamkhuyenmai_sanpham_id_foreign` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.sanphamkhuyenmai: ~0 rows (approximately)
DELETE FROM `sanphamkhuyenmai`;
/*!40000 ALTER TABLE `sanphamkhuyenmai` DISABLE KEYS */;
INSERT INTO `sanphamkhuyenmai` (`khuyenmai_id`, `sanpham_id`, `created_at`, `updated_at`) VALUES
	(9, 3, NULL, NULL);
/*!40000 ALTER TABLE `sanphamkhuyenmai` ENABLE KEYS */;

-- Dumping structure for table thuysan.tinhtranghd
DROP TABLE IF EXISTS `tinhtranghd`;
CREATE TABLE IF NOT EXISTS `tinhtranghd` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tinhtranghd_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tinhtranghd_mo_ta` longtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.tinhtranghd: ~4 rows (approximately)
DELETE FROM `tinhtranghd`;
/*!40000 ALTER TABLE `tinhtranghd` DISABLE KEYS */;
INSERT INTO `tinhtranghd` (`id`, `tinhtranghd_ten`, `tinhtranghd_mo_ta`, `created_at`, `updated_at`) VALUES
	(1, 'Chưa xác nhận', NULL, NULL, NULL),
	(2, 'Giao hàng', NULL, NULL, NULL),
	(3, 'Đã hủy', NULL, NULL, NULL),
	(4, 'Đã thanh toán', NULL, NULL, NULL);
/*!40000 ALTER TABLE `tinhtranghd` ENABLE KEYS */;

-- Dumping structure for table thuysan.tuyendung
DROP TABLE IF EXISTS `tuyendung`;
CREATE TABLE IF NOT EXISTS `tuyendung` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tuyendung_tieu_de` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tuyendung_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tuyendung_anh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tuyendung_mo_ta` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tuyendung_lien_he` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tuyendung_thoi_gian` int(11) NOT NULL,
  `tuyendung_tinh_trang` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.tuyendung: ~0 rows (approximately)
DELETE FROM `tuyendung`;
/*!40000 ALTER TABLE `tuyendung` DISABLE KEYS */;
INSERT INTO `tuyendung` (`id`, `tuyendung_tieu_de`, `tuyendung_url`, `tuyendung_anh`, `tuyendung_mo_ta`, `tuyendung_lien_he`, `tuyendung_thoi_gian`, `tuyendung_tinh_trang`, `created_at`, `updated_at`) VALUES
	(1, 'nhân viên giao hàng', 'nhan-vien-giao-hang', '28459813_2057466491177949_395808191_o.jpg', '<p>giao h&agrave;ng</p>\r\n', '<p>mr huy</p>\r\n', 30, NULL, '2018-03-02 09:57:19', '2018-03-02 09:57:19');
/*!40000 ALTER TABLE `tuyendung` ENABLE KEYS */;

-- Dumping structure for table thuysan.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `loainguoidung_id` int(10) unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_loainguoidung_id_foreign` (`loainguoidung_id`),
  CONSTRAINT `users_loainguoidung_id_foreign` FOREIGN KEY (`loainguoidung_id`) REFERENCES `loainguoidung` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table thuysan.users: ~5 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `loainguoidung_id`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'leduchuy2', 'hanb1204011@gmail.com', '$2y$10$otuh16Oc5CkdKJa8WVLgO.7.w9CwO8ycP60IzJof0Of6pUDBikW.S', 2, 'iNz9sKkewi9efMKPA3RG8yfPOARdoPmmxRGCgUTNN0Ryo3pcatAyfSWpLiy3', '2016-05-23 11:28:32', '2018-02-26 11:30:17'),
	(15, 'leduchuy', 'leduchuy@gmail.com', '$2y$10$ZFq.iROvrBR/KVjwDUHH3.nH4lnVPB3I6HctRWZsJAUzqbSdzrDca', 1, 'FsonRdNzrcdcQWGZPXiFnJpJCLs9IyyNb0WLeaX1NO6Phwm4yn3qH2aqjwD2', '2018-02-26 11:30:51', '2018-03-05 11:31:35'),
	(16, 'leduchuy1', 'leduchuy1@gmail.com', '$2y$10$.NVw33PH8.CpyuUokBzrnOB.YmGR3FXWWnzNTAbPj8z6SkjSYQxpW', 2, 'ZpoCimZcaGCOUDQwm7CMmVU7Lnlck4HmqkqAx7NWa9SdgEzJvUKtW4VHV06O', '2018-02-26 14:29:06', '2018-02-26 15:52:52'),
	(17, 'dinhnhan', 'dinhnhan@gmail.com', '$2y$10$8aBGQ0tzcAgLJAx8xiJBl.AbJwO7FHLaA.osdOa382U1/T17kuxIy', 2, 'vlPB0l4qUE5hzJdwsKZZQT3HXtOTrckqP2NmPzbEU6QB1h7lEQ5KvuqF5e6l', '2018-02-27 10:31:07', '2018-03-01 19:34:02'),
	(18, 'dinhnhan111', 'leduchuy22@gmail.com', '$2y$10$gHNjWdoBz0nk67bN8kW8EO8EIDnpaidsTBrwT3sOqDx0/lYWS098m', 2, 'OpFJhYCg9Vl8BEjsJXfMdLxFrcXHn8hfgl2OUnZ7qZXK0bBePerJB3xduuxX', '2018-03-01 19:42:28', '2018-03-01 19:43:02');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
