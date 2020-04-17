-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3307
-- Thời gian đã tạo: Th4 11, 2020 lúc 05:55 AM
-- Phiên bản máy phục vụ: 10.3.16-MariaDB
-- Phiên bản PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+07:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `caphochieu`
--

--
-- Đang đổ dữ liệu cho bảng `passports`
--

INSERT INTO `passports` (`id`, `id_congdan`, `id_admin`, `hoten`, `hinh`, `ngaysinh`, `noisinh`, `gioitinh`, `cmnd`, `ngaycap`, `noicap`, `dantoc`, `tongiao`, `email`, `sodienthoai`, `dcthuongtru`, `quanhuyen`, `dcchitiet`, `dctamtru`, `quanhuyen_tt`, `dcchitiet_tt`, `nghenghiep`, `tendccoquan`, `hoten_cha`, `ngaysinh_cha`, `hoten_me`, `ngaysinh_me`, `hoten_vc`, `ngaysinh_vc`, `tinhtrang`, `hansudung`, `tinhtranghsd`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Bùi Quang Trường', NULL, '1998-01-01', 'Duc Pho', 'Nam', 212283588, '2013-03-03', 'Quảng Ngãi', 'Kinh', '', 'truongbuidp@gmail.com', '0326030448', 'Quảng Ngãi', 'Đức Phổ', 'thôn Nam Phước, xã Phổ Vinh', '', '', '', 'Sinh viên', '', 'Bùi Văn Lập', '0000-00-00', 'Trần Thị Phiêu', '0000-00-00 00:00:00', '', '0000-00-00', 'complete', NULL, NULL, '2020-04-03 15:45:37', '2020-04-03 15:45:37'),
(2, NULL, NULL, 'Phạm Quang Tâm', NULL, '1998-01-02', 'Duc Pho', 'Nam', 212254731, '2013-03-04', 'Quảng Ngãi', 'Kinh', '', 'truongbuidp@gmail.com', '0326030448', 'Đồng Nai', 'Đức Phổ', 'thôn Nam Phước, xã Phổ Vinh', '', '', '', 'Sinh viên', '', 'Bùi Văn Lập', '0000-00-00', 'Trần Thị Phiêu', '0000-00-00 00:00:00', '', '0000-00-00', 'waiting', NULL, NULL, '2020-04-04 04:22:25', '2020-04-04 04:22:25'),
(3, NULL, NULL, 'Nguyễn Văn A', NULL, '1998-01-02', 'Duc Pho', 'Nam', 212252031, '2013-03-04', 'Quảng Ngãi', 'Kinh', '', 'truongbuidp@gmail.com', '0326030448', 'Tây Ninh', 'Đức Phổ', 'thôn Nam Phước, xã Phổ Vinh', '', '', '', 'Sinh viên', '', 'Bùi Văn Lập', '0000-00-00', 'Trần Thị Phiêu', '0000-00-00 00:00:00', '', '0000-00-00', 'cancel', NULL, NULL, '2020-04-04 15:24:59', '2020-04-04 15:24:59'),
(4, NULL, NULL, 'Nguyên Văn B', NULL, '1998-01-02', 'Duc Pho', 'Nam', 254374344, '2013-03-04', 'Quảng Ngãi', 'Kinh', '', 'truongbuidp@gmail.com', '0326030448', 'Quảng Ngãi', 'Đức Phổ', 'thôn Nam Phước, xã Phổ Vinh', '', '', '', 'Sinh viên', '', 'Bùi Văn Lập', '0000-00-00', 'Trần Thị Phiêu', '0000-00-00 00:00:00', '', '0000-00-00', 'complete', NULL, NULL, '2020-04-04 15:38:55', '2020-04-04 15:38:55'),
(5, NULL, NULL, 'Bùi quang tèo', NULL, '2020-04-04', NULL, 'male', 212283588, NULL, NULL, NULL, NULL, NULL, NULL, 'Đà Nẵng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'complete', NULL, NULL, '2020-04-04 15:49:39', '2020-04-04 15:49:39'),
(7, NULL, NULL, 'Nguyễn Văn C', NULL, '1998-01-02', 'Duc Pho', 'Nam', 212283588, '2013-03-04', 'Quảng Ngãi', 'Kinh', '', 'truongbuidp@gmail.com', '0326030448', 'T.P Hồ Chí Minh', 'Đức Phổ', 'thôn Nam Phước, xã Phổ Vinh', '', '', '', 'Sinh viên', '', 'Bùi Văn Lập', '0000-00-00', 'Trần Thị Phiêu', '0000-00-00 00:00:00', '', '0000-00-00', 'waiting', NULL, NULL, '2020-04-07 07:42:41', '2020-04-07 07:42:41'),
(8, NULL, NULL, 'Nguyễn Văn D', NULL, '2020-04-09', 'Item 1', 'female', 212283516, '2020-04-09', 'Item 2', 'Item 3', 'Item 4', 'acekyros28@gmail.com', '0326238123', 'Item 2', 'Item 3', 'Địa chỉ chi tiết', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'waiting', NULL, NULL, '2020-04-09 09:09:39', '2020-04-09 09:09:39');

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `role_id`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'truongbuidp@gmail.com', '1', '$2b$08$PSD6bjYZRvASsN81ZskGdeOQgcWswU/0Wj9QWlqDTLRlWS.Md.mJK', '2020-04-06 11:49:57', '2020-04-06 11:49:57'),
(2, 'admin_xt@gmail.com', '2', '$2b$08$MSTrcLynSHhNBG/iPZ2A8O4p1QR52fpr2DYl6MlWqJxnn2X3qUh4m', '2020-04-06 11:52:11', '2020-04-06 11:52:11'),
(3, 'admin_xd@gmail.com', '3', '$2b$08$qZX7H9sH9jp7zTgr4dqzqOMQbKZFp9Si4JSoRV2P2BqOjmtLjjvIW', '2020-04-06 11:52:29', '2020-04-06 11:52:29'),
(4, 'admin_lt@gmail.com', '4', '$2b$08$GuFadk86nwVPMlqEAKzBoe/wD2c0AbT5dBNrSmUeiiaI5Q4bZKh.e', '2020-04-06 11:52:36', '2020-04-06 11:52:36'),
(5, 'admin_gs@gmail.com', '5', '$2b$08$MHGRuJ2B85t72KMmQhohcOW/l9qdMQVReZ6ZecudCfgDbo/xfTxvy', '2020-04-06 11:52:55', '2020-04-06 11:52:55');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
