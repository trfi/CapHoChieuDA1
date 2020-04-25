-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Apr 25, 2020 at 05:57 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `caphochieu`
--

-- --------------------------------------------------------

--
-- Table structure for table `archives`
--

CREATE TABLE `archives` (
  `id` int(11) NOT NULL,
  `passport_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `archives`
--

INSERT INTO `archives` (`id`, `passport_id`, `created_at`, `updated_at`) VALUES
(10, 1000000002, '2020-04-18 08:59:37', '2020-04-18 08:59:37');

-- --------------------------------------------------------

--
-- Table structure for table `passports`
--

CREATE TABLE `passports` (
  `id` int(11) NOT NULL,
  `id_congdan` int(11) DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `hoten` varchar(255) DEFAULT NULL,
  `hinh` varchar(255) DEFAULT NULL,
  `gioitinh` varchar(255) DEFAULT NULL,
  `ngaysinh` date DEFAULT NULL,
  `noisinh` varchar(255) DEFAULT NULL,
  `cmnd` int(11) DEFAULT NULL,
  `ngaycap` date DEFAULT NULL,
  `noicap` varchar(255) DEFAULT NULL,
  `dantoc` varchar(255) DEFAULT NULL,
  `tongiao` varchar(255) DEFAULT 'Không',
  `sodienthoai` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `dcthuongtru` varchar(255) DEFAULT NULL,
  `quanhuyen` varchar(255) DEFAULT NULL,
  `dcchitiet` varchar(255) DEFAULT NULL,
  `dctamtru` varchar(255) DEFAULT NULL,
  `quanhuyen_tt` varchar(255) DEFAULT NULL,
  `dcchitiet_tt` varchar(255) DEFAULT NULL,
  `nghenghiep` varchar(255) DEFAULT NULL,
  `tendccoquan` varchar(255) DEFAULT NULL,
  `hoten_cha` varchar(255) DEFAULT NULL,
  `ngaysinh_cha` date DEFAULT NULL,
  `hoten_me` varchar(255) DEFAULT NULL,
  `ngaysinh_me` date DEFAULT NULL,
  `hoten_vc` varchar(255) DEFAULT NULL,
  `ngaysinh_vc` date DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT NULL,
  `hansudung` date DEFAULT NULL,
  `tinhtranghsd` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passports`
--

INSERT INTO `passports` (`id`, `id_congdan`, `id_admin`, `hoten`, `hinh`, `gioitinh`, `ngaysinh`, `noisinh`, `cmnd`, `ngaycap`, `noicap`, `dantoc`, `tongiao`, `sodienthoai`, `email`, `dcthuongtru`, `quanhuyen`, `dcchitiet`, `dctamtru`, `quanhuyen_tt`, `dcchitiet_tt`, `nghenghiep`, `tendccoquan`, `hoten_cha`, `ngaysinh_cha`, `hoten_me`, `ngaysinh_me`, `hoten_vc`, `ngaysinh_vc`, `trangthai`, `hansudung`, `tinhtranghsd`, `created_at`, `updated_at`) VALUES
(1000000001, NULL, NULL, 'Bùi Quang Trường', NULL, 'Nam', '1998-01-01', 'Quảng Ngãi', 212283588, '2013-03-03', 'Quảng Ngãi', 'Kinh', 'Không', '0326030448', 'truongbuidp@gmail.com', 'Quảng Ngãi', 'Đức Phổ', 'thôn Nam Phước, xã Phổ Vinh', '', '', '', 'Sinh viên', '', 'Bùi Văn Lập', '0000-00-00', 'Trần Thị Phiêu', '0000-00-00', '', '0000-00-00', 'xd waiting', NULL, NULL, '2020-04-02 15:45:37', '2020-04-18 14:40:08'),
(1000000002, NULL, NULL, 'Phạm Quang Tâm', NULL, 'Nam', '1998-01-02', 'TP. Hồ Chí Minh', 212254731, '2013-03-04', 'TP. Hồ Chí Minh', 'Kinh', 'Không', '0855717123', 'acekyros28@gmail.com', 'TP. Hồ Chí Minh', 'Gò Vấp', '125 Phan Huy Ích, Phường 14', '', '', '', 'Sinh viên', '', 'Bùi Văn Lập', '0000-00-00', 'Trần Thị Phiêu', '0000-00-00', '', '0000-00-00', 'xd waiting', NULL, NULL, '2020-04-03 04:22:25', '2020-04-18 12:51:47'),
(1000000003, NULL, NULL, 'Dương Thanh Vĩ', NULL, 'Nam', '1998-01-02', 'Quảng Ngãi', 254374344, '2013-03-04', 'Quảng Ngãi', 'Kinh', 'Không', '0326030448', 'truongbuidp@gmail.com', 'Quảng Ngãi', 'Đức Phổ', 'thôn Nam Phước, xã Phổ Vinh', '', '', '', 'Sinh viên', '', 'Bùi Văn Lập', '0000-00-00', 'Trần Thị Phiêu', '0000-00-00', '', '0000-00-00', 'lt canceled', NULL, NULL, '2020-04-04 15:38:55', '2020-04-16 13:20:32'),
(1000000004, NULL, NULL, 'Vũ Mai Phương', NULL, 'Nữ', '2020-04-04', 'Đà Nẵng', 212283588, NULL, 'Đà Nẵng', 'Tày', 'Không', '0855717122', 'acekyros28@gmail.com', 'Đà Nẵng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'xt canceled', NULL, NULL, '2020-04-04 15:49:39', '2020-04-16 13:20:17'),
(1000000005, NULL, NULL, 'Trần Dũng Toản', NULL, 'Nam', '1998-01-02', 'Quảng Ngãi', 212283588, '2013-03-04', 'Quảng Ngãi', 'Kinh', 'Không', '0326030448', 'truongbuidp@gmail.com', 'T.P Hồ Chí Minh', 'Đức Phổ', 'thôn Nam Phước, xã Phổ Vinh', '', '', '', 'Sinh viên', '', 'Bùi Văn Lập', '0000-00-00', 'Trần Thị Phiêu', '0000-00-00', '', '0000-00-00', 'gs archived', NULL, NULL, '2020-04-07 06:42:41', '2020-04-18 14:43:03'),
(1000000006, NULL, NULL, 'Lại Văn Dân', NULL, 'Nam', '1998-01-02', 'Quảng Ngãi', 212283588, '2013-03-04', 'Quảng Ngãi', 'Kinh', 'Không', '0326030448', 'truongbuidp@gmail.com', 'T.P Hồ Chí Minh', 'Đức Phổ', 'thôn Nam Phước, xã Phổ Vinh', '', '', '', 'Sinh viên', '', 'Bùi Văn Lập', '0000-00-00', 'Trần Thị Phiêu', '0000-00-00', '', '0000-00-00', 'gs archived', NULL, NULL, '2020-04-07 06:43:41', '2020-04-18 14:43:16'),
(1000000007, NULL, NULL, 'Đàm Thanh Nam', NULL, 'Nam', '2020-04-09', 'Bắc Ninh', 212283516, '2020-04-09', 'Bắc Ninh', 'Kinh', 'Không', '0326238123', 'acekyros28@gmail.com', 'Bắc Ninh', 'Item 3', 'Địa chỉ chi tiết', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'lt approved', NULL, NULL, '2020-04-09 09:09:38', '2020-04-18 14:45:58'),
(1000000008, NULL, NULL, 'Trần Viên Phương', NULL, 'Nam', '2020-04-09', 'Bắc Ninh', 212283516, '2020-04-09', 'Bắc Ninh', 'Kinh', 'Không', '0326238123', 'acekyros28@gmail.com', 'Bắc Ninh', 'Item 3', 'Địa chỉ chi tiết', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'lt canceled', NULL, NULL, '2020-04-09 09:09:39', '2020-04-15 08:45:15'),
(1000000009, NULL, NULL, 'Dương Đan Tâm', NULL, 'Nam', '1998-01-02', 'Quảng Ngãi', 212283588, '2013-03-04', 'Quảng Ngãi', 'Kinh', 'Không', '0326030448', 'truongbuidp@gmail.com', 'T.P Hồ Chí Minh', 'Đức Phổ', 'thôn Nam Phước, xã Phổ Vinh', '', '', '', 'Sinh viên', '', 'Bùi Văn Lập', '0000-00-00', 'Trần Thị Phiêu', '0000-00-00', '', '0000-00-00', 'gs archived', NULL, NULL, '2020-04-09 10:41:41', '2020-04-18 14:45:40'),
(1000000010, NULL, NULL, 'Vũ An Đại', NULL, 'Nam', '1995-02-16', 'Gia Lai', 212267479, '2013-07-09', 'Gia Lai', 'Kinh', 'Không', '0326030448', 'khanh.ma@uong.com', 'Gia Lai', 'Quận Hoan', '5860 Phố Ca Tuyền Thục, Thôn Sa Lễ', 'Lào Cai', 'Huyện Khổng', '55 Phố Quách Sáng Nghiệp', 'Kỹ sư IT', 'FPT Software Lô T2, đường D1, khu công nghệ cao, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh', 'Vũ An Dân', '1920-03-03', 'Phạm Thị Thu Thanh', '1930-05-02', NULL, NULL, 'xt waiting', '2020-07-18', NULL, '2020-04-09 10:42:41', '2020-04-18 14:44:42'),
(1000000011, NULL, NULL, 'Danh Khắc Thịnh', NULL, 'Nam', '1995-08-18', 'Đà Nẵng', 212295235, '2013-07-09', 'Gia Lai', 'Kinh', 'Không', '0326030448', 'khanh.ma@uong.com', 'Đà Nẵng', 'Quận Hoan', '5860 Phố Ca Tuyền Thục, Thôn Sa Lễ', 'Lào Cai', 'Huyện Khổng', '55 Phố Quách Sáng Nghiệp', 'Doanh nhân', 'FPT Software Lô T2, đường D1, khu công nghệ cao, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh', 'Vũ An Dân', '1920-03-03', 'Phạm Thị Thu Thanh', '1930-05-02', NULL, NULL, 'xt waiting', '2020-07-18', NULL, '2020-04-18 12:13:15', '2020-04-18 12:13:15'),
(1000000012, NULL, NULL, 'Chu Huy Thạc', NULL, 'Nam', '1991-11-13', 'Hải Phòng', 212205381, '2013-07-09', 'Gia Lai', 'Kinh', 'Không', '0326030448', 'khanh.ma@uong.com', 'Hải Phòng', 'Quận Hoan', '5860 Phố Ca Tuyền Thục, Thôn Sa Lễ', 'Lào Cai', 'Huyện Khổng', '55 Phố Quách Sáng Nghiệp', 'Doanh nhân', 'FPT Software Lô T2, đường D1, khu công nghệ cao, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh', 'Vũ An Dân', '1920-03-03', 'Phạm Thị Thu Thanh', '1930-05-02', NULL, NULL, 'xt waiting', '2020-07-18', NULL, '2020-04-18 12:13:16', '2020-04-18 14:46:53'),
(1000000013, NULL, NULL, 'Chu Hoàn Hòa', NULL, 'Nam', '1995-11-11', 'Hải Phòng', 212294323, '2013-07-09', 'Gia Lai', 'Kinh', 'Không', '0326030448', 'khanh.ma@uong.com', 'Hải Phòng', 'Quận Hoan', '5860 Phố Ca Tuyền Thục, Thôn Sa Lễ', 'Lào Cai', 'Huyện Khổng', '55 Phố Quách Sáng Nghiệp', 'Doanh nhân', 'FPT Software Lô T2, đường D1, khu công nghệ cao, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh', 'Vũ An Dân', '1920-03-03', 'Phạm Thị Thu Thanh', '1930-05-02', NULL, NULL, 'xt waiting', '2020-07-18', NULL, '2020-04-18 12:13:17', '2020-04-18 14:46:57'),
(1000000014, NULL, NULL, 'Khoa Khắc Phú', NULL, 'Nam', '1995-06-12', 'Thái Nguyên', 212265372, '2013-07-09', 'Thái Nguyên', 'Kinh', 'Không', '0326030448', 'khanh.ma@uong.com', 'Thái Nguyên', 'Quận Hoan', '5860 Phố Ca Tuyền Thục, Thôn Sa Lễ', 'Lào Cai', 'Huyện Khổng', '55 Phố Quách Sáng Nghiệp', 'Doanh nhân', 'FPT Software Lô T2, đường D1, khu công nghệ cao, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh', 'Vũ An Dân', '1920-03-03', 'Phạm Thị Thu Thanh', '1930-05-02', NULL, NULL, 'xd canceled', '2020-07-18', NULL, '2020-04-18 12:13:18', '2020-04-24 20:18:35'),
(1000000015, NULL, NULL, 'Giao Sĩ Toản', NULL, 'Nam', '1992-05-09', 'Đà Nẵng', 212267479, '2013-07-09', 'Gia Lai', 'Kinh', 'Không', '0326030448', 'khanh.ma@uong.com', 'Đà Nẵng', 'Quận Hoan', '5860 Phố Ca Tuyền Thục, Thôn Sa Lễ', 'Lào Cai', 'Huyện Khổng', '55 Phố Quách Sáng Nghiệp', 'Doanh nhân', 'FPT Software Lô T2, đường D1, khu công nghệ cao, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh', 'Vũ An Dân', '1920-03-03', 'Phạm Thị Thu Thanh', '1930-05-02', NULL, NULL, 'xd canceled', '2020-07-18', NULL, '2020-04-18 12:13:19', '2020-04-24 20:18:33'),
(1000000016, NULL, NULL, 'Mạch Hòa Hoán', NULL, 'Nam', '1999-03-05', 'Cần Thơ', 212283192, '2013-07-09', 'Gia Lai', 'Kinh', 'Không', '0326030448', 'khanh.ma@uong.com', 'Cần Thơ', 'Quận Hoan', '5860 Phố Ca Tuyền Thục, Thôn Sa Lễ', 'Lào Cai', 'Huyện Khổng', '55 Phố Quách Sáng Nghiệp', 'Doanh nhân', 'FPT Software Lô T2, đường D1, khu công nghệ cao, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh', 'Vũ An Dân', '1920-03-03', 'Phạm Thị Thu Thanh', '1930-05-02', NULL, NULL, 'xt waiting', '2020-07-18', NULL, '2020-04-18 12:13:20', '2020-04-18 14:47:10'),
(1000000017, NULL, NULL, 'Ngụy Thạch', NULL, 'Nam', '1998-12-11', 'Gia Lai', 212265822, '2013-07-09', 'Hải Phòng', 'Kinh', 'Không', '0326030448', 'khanh.ma@uong.com', 'Hải Phòng', 'Quận Hoan', '5860 Phố Ca Tuyền Thục, Thôn Sa Lễ', 'Lào Cai', 'Huyện Khổng', '55 Phố Quách Sáng Nghiệp', 'Doanh nhân', 'FPT Software Lô T2, đường D1, khu công nghệ cao, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh', 'Vũ An Dân', '1920-03-03', 'Phạm Thị Thu Thanh', '1930-05-02', NULL, NULL, 'lt approved', '2020-07-18', NULL, '2020-04-18 12:13:21', '2020-04-24 20:26:24'),
(1000000018, NULL, NULL, 'Khương Thanh Trí', NULL, 'Nam', '1993-05-11', 'Lâm Đồng', 212266574, '2013-07-09', 'Lâm Đồng', 'Kinh', 'Không', '0326030448', 'khanh.ma@uong.com', 'Lâm Đồng', 'Quận Hoan', '5860 Phố Ca Tuyền Thục, Thôn Sa Lễ', 'Lào Cai', 'Huyện Khổng', '55 Phố Quách Sáng Nghiệp', 'Doanh nhân', 'FPT Software Lô T2, đường D1, khu công nghệ cao, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh', 'Vũ An Dân', '1920-03-03', 'Phạm Thị Thu Thanh', '1930-05-02', NULL, NULL, 'lt approved', '2020-07-18', NULL, '2020-04-18 12:13:22', '2020-04-24 20:26:18');

-- --------------------------------------------------------

--
-- Table structure for table `residents`
--

CREATE TABLE `residents` (
  `id` int(11) NOT NULL,
  `hoten` varchar(255) DEFAULT NULL,
  `gioitinh` varchar(11) DEFAULT NULL,
  `ngaysinh` date DEFAULT NULL,
  `noisinh` varchar(255) DEFAULT NULL,
  `cmnd` int(11) DEFAULT NULL,
  `dcthuongtru` varchar(255) DEFAULT NULL,
  `quanhuyen` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `residents`
--

INSERT INTO `residents` (`id`, `hoten`, `gioitinh`, `ngaysinh`, `noisinh`, `cmnd`, `dcthuongtru`, `quanhuyen`, `created_at`, `updated_at`) VALUES
(1, 'Phạm Quang Tâm', 'Nam', '1998-01-02', 'TP. Hồ Chí Minh', 212254731, 'TP. Hồ Chí Minh', 'Gò Vấp', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Bùi Quang Trường', 'Nam', '1998-01-01', 'Quảng Ngãi', 212283588, 'Quảng Ngãi', 'Đức Phổ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Vũ An Đại', 'Nam', '1995-02-16', 'Gia Lai', 212267479, 'Gia Lai', 'Quận Hoan', '2020-04-18 05:00:00', '2020-04-18 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Adminstrator', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Xác thực', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Xét duyệt', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Lưu trữ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Giám sát', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role_id`, `createdAt`, `updatedAt`) VALUES
(1, 'truongbuidp@gmail.com', '$2b$08$PSD6bjYZRvASsN81ZskGdeOQgcWswU/0Wj9QWlqDTLRlWS.Md.mJK', 1, '2020-04-06 11:49:57', '2020-04-06 11:49:57'),
(2, 'admin_xt@gmail.com', '$2b$08$MSTrcLynSHhNBG/iPZ2A8O4p1QR52fpr2DYl6MlWqJxnn2X3qUh4m', 2, '2020-04-06 11:52:11', '2020-04-06 11:52:11'),
(3, 'admin_xd@gmail.com', '$2b$08$qZX7H9sH9jp7zTgr4dqzqOMQbKZFp9Si4JSoRV2P2BqOjmtLjjvIW', 3, '2020-04-06 11:52:29', '2020-04-06 11:52:29'),
(4, 'admin_lt@gmail.com', '$2b$08$GuFadk86nwVPMlqEAKzBoe/wD2c0AbT5dBNrSmUeiiaI5Q4bZKh.e', 4, '2020-04-06 11:52:36', '2020-04-06 11:52:36'),
(5, 'admin_gs@gmail.com', '$2b$08$MHGRuJ2B85t72KMmQhohcOW/l9qdMQVReZ6ZecudCfgDbo/xfTxvy', 5, '2020-04-06 11:52:55', '2020-04-06 11:52:55'),
(6, 'adxacthuc@gmail.com', '$2b$08$.05/uo7OqdswtB0XYBEis.5ZPuDnSdkhFhhpG2L1tGjqEu.s4JCJS', 2, '2020-04-12 09:13:05', '2020-04-12 09:13:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archives`
--
ALTER TABLE `archives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `passport_id` (`passport_id`);

--
-- Indexes for table `passports`
--
ALTER TABLE `passports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `residents`
--
ALTER TABLE `residents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archives`
--
ALTER TABLE `archives`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `passports`
--
ALTER TABLE `passports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000000019;

--
-- AUTO_INCREMENT for table `residents`
--
ALTER TABLE `residents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `archives`
--
ALTER TABLE `archives`
  ADD CONSTRAINT `archives_ibfk_1` FOREIGN KEY (`passport_id`) REFERENCES `passports` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
