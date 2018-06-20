-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 20, 2018 at 02:37 PM
-- Server version: 5.7.22-0ubuntu0.16.04.1
-- PHP Version: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resto_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `descr` varchar(200) NOT NULL,
  `encoded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `removed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `name`, `descr`, `encoded`, `removed`) VALUES
(1, 'Drinks', '', '2018-05-24 18:14:43', 0),
(2, 'Dessert', '', '2018-05-24 18:16:49', 0),
(3, 'Meals', 'Main products', '2018-05-29 13:52:37', 0),
(4, 'Add-ons', 'Add on products', '2018-05-29 16:54:21', 0);

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `disc_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `descr` varchar(200) NOT NULL,
  `less_p` int(11) NOT NULL COMMENT 'less by percentage',
  `less_c` decimal(10,2) NOT NULL COMMENT 'less by cash',
  `encoded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `removed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `descr` varchar(200) NOT NULL,
  `type` int(1) NOT NULL,
  `encoded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `removed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `name`, `descr`, `type`, `encoded`, `removed`) VALUES
(1, 'Coca Cola', 'Softdrink', 0, '2018-05-25 16:05:26', 0),
(2, 'French Fries', 'Potato French Fries', 1, '2018-05-29 13:43:45', 0),
(3, 'Burger Patty', 'Beef burger patty', 1, '2018-05-29 13:44:08', 0),
(4, 'Burger Bun', 'Bread burger bun', 1, '2018-05-29 13:44:29', 0),
(5, 'Sprite', 'Transparent soda', 0, '2018-05-29 13:45:22', 0),
(6, 'Lettuce', 'Lettuce leaves', 1, '2018-05-29 13:45:55', 0),
(7, 'Cheese slice', 'Yellow cheese slice', 1, '2018-05-29 13:46:20', 0),
(8, 'Tomato', 'Sliced tomato', 1, '2018-05-29 13:46:51', 0),
(9, 'Cheese Powder', 'Fries cheese flavoring', 0, '2018-05-29 13:47:31', 0),
(10, 'Barbecue Powder', 'Burger bbq flavoring', 0, '2018-05-29 13:48:11', 0),
(11, 'Iced Tea Powder', 'Nestea iced tea powder', 0, '2018-05-29 13:49:47', 0),
(12, 'Cup of Rice', 'Tonner banay banay not NFA', 1, '2018-05-29 16:44:36', 0),
(13, 'Fried Chicken Cuts', 'Can be thigh, wings, drumsticks, breasts', 1, '2018-05-29 16:46:28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL,
  `user_fullname` varchar(45) NOT NULL,
  `log_type` varchar(45) NOT NULL,
  `details` varchar(250) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`log_id`, `user_fullname`, `log_type`, `details`, `date_time`) VALUES
(1000001, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-08 22:37:59'),
(1000002, 'TORRES, JIK', 'Add', 'New%20company%20added:%20DENR%20LMS%20XI', '2018-04-08 22:40:33'),
(1000003, 'TORRES, JIK', 'Add', 'New%20company%20added:%20Sutherland%20Global%20Services%20Inc.', '2018-04-08 22:41:30'),
(1000004, 'TORRES, JIK', 'Add', 'New%20company%20added:%20IBEX%20Global', '2018-04-08 22:43:29'),
(1000005, 'TORRES, JIK', 'Add', 'New%20company%20added:%20VXI%20Global%20Solutions%20LLC%20-%20SM%20Ecoland', '2018-04-08 22:44:30'),
(1000006, 'TORRES, JIK', 'Update', 'Company%20updated%20J101:%20DENR%20LMS%20XI%20to%20No%20Company', '2018-04-08 22:49:42'),
(1000007, 'TORRES, JIK', 'Add', 'New%20company%20added:%20DENR%20LMS%20XI', '2018-04-08 22:50:11'),
(1000008, 'TORRES, JIK', 'Update', 'ATM%20Bank%20updated%20A101:%20Land%20bank%20of%20the%20Philippines%20to%20No%20ATM%20Bank', '2018-04-08 22:51:03'),
(1000009, 'TORRES, JIK', 'Add', 'New%20ATM%20bank%20added:%20Land%20bank%20of%20the%20Philippines', '2018-04-08 22:51:29'),
(1000010, 'TORRES, JIK', 'Update', 'ATM%20Bank%20updated%20A103:%20Land%20bank%20of%20the%20Philippines%20to%20Land%20bank%20of%20the%20Philippines', '2018-04-08 22:51:49'),
(1000011, 'TORRES, JIK', 'Add', 'New%20client%20record%20added:%20ISRAEL%20LADY%20GRACE', '2018-04-08 23:00:47'),
(1000012, 'TORRES, JIK', 'Add', 'New%20client%20record%20added:%20N', '2018-04-08 23:22:15'),
(1000013, 'TORRES, JIK', 'Update', 'Client%20updated%20C10001:%20ISRAEL%20LADY%20GRACE', '2018-04-08 23:22:31'),
(1000014, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10002:%20N', '2018-04-08 23:50:44'),
(1000015, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L12%20of%20Client:%20N', '2018-04-09 00:08:02'),
(1000016, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10001:%20ISRAEL%20LADY%20GRACE', '2018-04-09 00:11:02'),
(1000017, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L13%20of%20Client:%20ISRAEL%20LADY%20GRACE', '2018-04-09 00:11:42'),
(1000018, 'TORRES, JIK', 'Add', 'New%20interest%20added%20to%20Loan%20ID:%20L13%20of%20Client:%20ISRAEL%20LADY%20GRACE', '2018-04-09 00:24:44'),
(1000019, 'TORRES, JIK', 'Update', 'New%20loan%20adjustment%20to%20Loan%20ID:%20L13%20of%20Client:%20ISRAEL%20LADY%20GRACE', '2018-04-09 00:30:32'),
(1000020, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L13%20of%20Client:%20ISRAEL%20LADY%20GRACE', '2018-04-09 00:37:41'),
(1000021, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10001:%20ISRAEL%20LADY%20GRACE', '2018-04-09 01:19:07'),
(1000022, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10001%20of%20Client:%20ISRAEL%20LADY%20GRACE', '2018-04-09 01:19:54'),
(1000023, 'TORRES, JIK', 'Add', 'New%20interest%20added%20to%20Loan%20ID:%20L10001%20of%20Client:%20ISRAEL%20LADY%20GRACE', '2018-04-09 01:21:54'),
(1000024, 'TORRES, JIK', 'Update', 'New%20loan%20adjustment%20to%20Loan%20ID:%20L10001%20of%20Client:%20ISRAEL%20LADY%20GRACE', '2018-04-09 01:23:58'),
(1000025, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10001%20of%20Client:%20ISRAEL%20LADY%20GRACE', '2018-04-09 01:25:23'),
(1000026, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10001:%20ISRAEL%20LADY%20GRACE', '2018-04-09 01:27:16'),
(1000027, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10002%20of%20Client:%20ISRAEL%20LADY%20GRACE', '2018-04-09 01:28:25'),
(1000028, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10002:%20N', '2018-04-09 02:22:06'),
(1000029, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10003%20of%20Client:%20N', '2018-04-09 02:51:28'),
(1000030, 'TORRES, JIK', 'Add', 'New%20client%20record%20added:%20ALDERITE%20ROSE%20ANN', '2018-04-09 02:57:22'),
(1000031, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10003:%20ALDERITE%20ROSE%20ANN', '2018-04-09 02:58:11'),
(1000032, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10004%20of%20Client:%20ALDERITE%20ROSE%20ANN', '2018-04-09 02:58:56'),
(1000033, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10003:%20ALDERITE%20ROSE%20ANN', '2018-04-09 02:59:47'),
(1000034, 'TORRES, JIK', 'Update', 'New%20loan%20adjustment%20to%20Loan%20ID:%20L10005%20of%20Client:%20ALDERITE%20ROSE%20ANN', '2018-04-09 03:00:49'),
(1000035, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10005%20of%20Client:%20ALDERITE%20ROSE%20ANN', '2018-04-09 03:01:54'),
(1000036, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10003:%20ALDERITE%20ROSE%20ANN', '2018-04-09 03:02:35'),
(1000037, 'TORRES, JIK', 'Update', 'New%20loan%20adjustment%20to%20Loan%20ID:%20L10006%20of%20Client:%20ALDERITE%20ROSE%20ANN', '2018-04-09 03:04:06'),
(1000038, 'TORRES, JIK', 'Add', 'New%20interest%20added%20to%20Loan%20ID:%20L10006%20of%20Client:%20ALDERITE%20ROSE%20ANN', '2018-04-09 03:05:09'),
(1000039, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10006%20of%20Client:%20ALDERITE%20ROSE%20ANN', '2018-04-09 03:05:46'),
(1000040, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10003:%20ALDERITE%20ROSE%20ANN', '2018-04-09 03:06:53'),
(1000041, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10007%20of%20Client:%20ALDERITE%20ROSE%20ANN', '2018-04-09 03:07:24'),
(1000042, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10007%20of%20Client:%20ALDERITE%20ROSE%20ANN', '2018-04-09 03:07:56'),
(1000043, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10003:%20ALDERITE%20ROSE%20ANN', '2018-04-09 03:09:22'),
(1000044, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10008%20of%20Client:%20ALDERITE%20ROSE%20ANN', '2018-04-09 03:09:45'),
(1000045, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10003:%20ALDERITE%20ROSE%20ANN', '2018-04-09 03:11:11'),
(1000046, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10009%20of%20Client:%20ALDERITE%20ROSE%20ANN', '2018-04-09 03:13:51'),
(1000047, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-09 16:38:43'),
(1000048, 'TORRES, JIK', 'Add', 'New%20client%20record%20added:%20ZABATE%20KAREN%20JANE', '2018-04-09 16:44:59'),
(1000049, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10004:%20ZABATE%20KAREN%20JANE', '2018-04-09 16:45:27'),
(1000050, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10010%20of%20Client:%20ZABATE%20KAREN%20JANE', '2018-04-09 16:45:54'),
(1000051, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10010%20of%20Client:%20ZABATE%20KAREN%20JANE', '2018-04-09 16:46:43'),
(1000052, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10004:%20ZABATE%20KAREN%20JANE', '2018-04-09 16:47:45'),
(1000053, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10011%20of%20Client:%20ZABATE%20KAREN%20JANE', '2018-04-09 16:48:19'),
(1000054, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10011%20of%20Client:%20ZABATE%20KAREN%20JANE', '2018-04-09 16:48:59'),
(1000055, 'TORRES, JIK', 'Add', 'New%20interest%20added%20to%20Loan%20ID:%20L10011%20of%20Client:%20ZABATE%20KAREN%20JANE', '2018-04-09 16:49:43'),
(1000056, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10011%20of%20Client:%20ZABATE%20KAREN%20JANE', '2018-04-09 16:50:06'),
(1000057, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10004:%20ZABATE%20KAREN%20JANE', '2018-04-09 16:50:59'),
(1000058, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10012%20of%20Client:%20ZABATE%20KAREN%20JANE', '2018-04-09 16:51:18'),
(1000059, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10012%20of%20Client:%20ZABATE%20KAREN%20JANE', '2018-04-09 16:51:33'),
(1000060, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10004:%20ZABATE%20KAREN%20JANE', '2018-04-09 16:52:58'),
(1000061, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10013%20of%20Client:%20ZABATE%20KAREN%20JANE', '2018-04-09 16:53:28'),
(1000062, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10013%20of%20Client:%20ZABATE%20KAREN%20JANE', '2018-04-09 16:53:45'),
(1000063, 'TORRES, JIK', 'Add', 'New%20interest%20added%20to%20Loan%20ID:%20L10013%20of%20Client:%20ZABATE%20KAREN%20JANE', '2018-04-09 16:54:06'),
(1000064, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10013%20of%20Client:%20ZABATE%20KAREN%20JANE', '2018-04-09 16:54:35'),
(1000065, 'TORRES, JIK', 'Add', 'New%20client%20record%20added:%20ABDULLAH%20FARHANA%20BINT', '2018-04-09 16:56:42'),
(1000066, 'TORRES, JIK', 'Update', 'Client%20updated%20C10005:%20ABDULLAH%20FARHANA%20BINT', '2018-04-09 16:58:38'),
(1000067, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10005:%20ABDULLAH%20FARHANA%20BINT', '2018-04-09 16:59:06'),
(1000068, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10014%20of%20Client:%20ABDULLAH%20FARHANA%20BINT', '2018-04-09 17:03:16'),
(1000069, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10014%20of%20Client:%20ABDULLAH%20FARHANA%20BINT', '2018-04-09 17:04:02'),
(1000070, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10005:%20ABDULLAH%20FARHANA%20BINT', '2018-04-09 17:05:22'),
(1000071, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10015%20of%20Client:%20ABDULLAH%20FARHANA%20BINT', '2018-04-09 17:05:54'),
(1000072, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10015%20of%20Client:%20ABDULLAH%20FARHANA%20BINT', '2018-04-09 17:06:17'),
(1000073, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10005:%20ABDULLAH%20FARHANA%20BINT', '2018-04-09 17:14:01'),
(1000074, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10016%20of%20Client:%20ABDULLAH%20FARHANA%20BINT', '2018-04-09 17:14:51'),
(1000075, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10005:%20ABDULLAH%20FARHANA%20BINT', '2018-04-09 17:16:09'),
(1000076, 'TORRES, JIK', 'Add', 'New%20client%20record%20added:%20ANGELES%20RUBY', '2018-04-09 18:05:50'),
(1000077, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10006:%20ANGELES%20RUBY', '2018-04-09 18:06:16'),
(1000078, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10018%20of%20Client:%20ANGELES%20RUBY', '2018-04-09 18:06:33'),
(1000079, 'TORRES, JIK', 'Add', 'New%20interest%20added%20to%20Loan%20ID:%20L10018%20of%20Client:%20ANGELES%20RUBY', '2018-04-09 18:07:05'),
(1000080, 'TORRES, JIK', 'Update', 'New%20loan%20adjustment%20to%20Loan%20ID:%20L10018%20of%20Client:%20ANGELES%20RUBY', '2018-04-09 18:07:46'),
(1000081, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10018%20of%20Client:%20ANGELES%20RUBY', '2018-04-09 18:08:00'),
(1000082, 'TORRES, JIK', 'Add', 'New%20client%20record%20added:%20ABUNDA%20ERIKA%20ANNE', '2018-04-09 18:21:50'),
(1000083, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10007:%20ABUNDA%20ERIKA%20ANNE', '2018-04-09 18:23:53'),
(1000084, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10019%20of%20Client:%20ABUNDA%20ERIKA%20ANNE', '2018-04-09 18:24:18'),
(1000085, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10019%20of%20Client:%20ABUNDA%20ERIKA%20ANNE', '2018-04-09 18:24:37'),
(1000086, 'TORRES, JIK', 'Add', 'New%20client%20record%20added:%20N', '2018-04-09 18:29:56'),
(1000087, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10008:%20N', '2018-04-09 18:30:48'),
(1000088, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10020%20of%20Client:%20N', '2018-04-09 18:32:24'),
(1000089, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10020%20of%20Client:%20N', '2018-04-09 18:32:38'),
(1000090, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10008:%20N', '2018-04-09 18:33:05'),
(1000091, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10021%20of%20Client:%20N', '2018-04-09 18:33:33'),
(1000092, 'TORRES, JIK', 'Add', 'New%20client%20record%20added:%20BAYANI%20ESNAYRA', '2018-04-09 18:37:37'),
(1000093, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10009:%20BAYANI%20ESNAYRA', '2018-04-09 18:38:07'),
(1000094, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10022%20of%20Client:%20BAYANI%20ESNAYRA', '2018-04-09 18:39:04'),
(1000095, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10022%20of%20Client:%20BAYANI%20ESNAYRA', '2018-04-09 18:39:20'),
(1000096, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10009:%20BAYANI%20ESNAYRA', '2018-04-09 18:40:40'),
(1000097, 'TORRES, JIK', 'Add', 'New%20client%20record%20added:%20CABANG%20REYSEL', '2018-04-09 18:44:46'),
(1000098, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10010:%20CABANG%20REYSEL', '2018-04-09 18:45:11'),
(1000099, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10024%20of%20Client:%20CABANG%20REYSEL', '2018-04-09 18:45:35'),
(1000100, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10024%20of%20Client:%20CABANG%20REYSEL', '2018-04-09 18:45:49'),
(1000101, 'TORRES, JIK', 'Add', 'New%20interest%20added%20to%20Loan%20ID:%20L10024%20of%20Client:%20CABANG%20REYSEL', '2018-04-09 18:46:22'),
(1000102, 'TORRES, JIK', 'Update', 'New%20loan%20adjustment%20to%20Loan%20ID:%20L10024%20of%20Client:%20CABANG%20REYSEL', '2018-04-09 18:46:55'),
(1000103, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10024%20of%20Client:%20CABANG%20REYSEL', '2018-04-09 18:47:20'),
(1000104, 'TORRES, JIK', 'Add', 'New%20client%20record%20added:%20CABANG%20RUSSEL', '2018-04-09 18:51:05'),
(1000105, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10011:%20CABANG%20RUSSEL', '2018-04-09 18:51:44'),
(1000106, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10025%20of%20Client:%20CABANG%20RUSSEL', '2018-04-09 18:52:07'),
(1000107, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10025%20of%20Client:%20CABANG%20RUSSEL', '2018-04-09 18:52:21'),
(1000108, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T%20of%20Client:%20CABANG%20RUSSEL', '2018-04-09 21:03:58'),
(1000109, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T%20of%20Client:%20CABANG%20RUSSEL', '2018-04-09 21:04:16'),
(1000110, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T%20of%20Client:%20CABANG%20RUSSEL', '2018-04-09 21:04:44'),
(1000111, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T%20of%20Client:%20CABANG%20RUSSEL', '2018-04-09 21:04:44'),
(1000112, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T%20of%20Client:%20CABANG%20RUSSEL', '2018-04-09 21:04:44'),
(1000113, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T%20of%20Client:%20CABANG%20RUSSEL', '2018-04-09 21:04:46'),
(1000114, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T%20of%20Client:%20CABANG%20RUSSEL', '2018-04-09 21:05:46'),
(1000115, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T%20of%20Client:%20CABANG%20RUSSEL', '2018-04-09 21:07:13'),
(1000116, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T%20of%20Client:%20CABANG%20RUSSEL', '2018-04-09 21:07:25'),
(1000117, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T%20of%20Client:%20CABANG%20RUSSEL', '2018-04-09 21:09:56'),
(1000118, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100074%20of%20Client:%20CABANG%20RUSSEL', '2018-04-09 21:15:16'),
(1000119, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100074%20of%20Client:%20CABANG%20RUSSEL', '2018-04-09 21:15:28'),
(1000120, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100074%20of%20Client:%20CABANG%20RUSSEL', '2018-04-09 21:16:16'),
(1000121, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100076%20of%20Client:%20CABANG%20RUSSEL', '2018-04-09 21:16:26'),
(1000122, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100076%20of%20Client:%20CABANG%20RUSSEL', '2018-04-09 21:16:34'),
(1000123, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100076%20of%20Client:%20CABANG%20RUSSEL', '2018-04-09 21:16:43'),
(1000124, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100076%20of%20Client:%20CABANG%20RUSSEL', '2018-04-09 21:16:53'),
(1000125, 'TORRES, JIK', 'Update', 'Loan%20updated%20to:%20C10001:%20ISRAEL%20LADY%20GRACE', '2018-04-09 21:33:48'),
(1000126, 'TORRES, JIK', 'Update', 'Loan%20updated%20to:%20C10001:%20ISRAEL%20LADY%20GRACE', '2018-04-09 21:34:04'),
(1000127, 'TORRES, JIK', 'Update', 'Loan%20updated%20to:%20C10001:%20ISRAEL%20LADY%20GRACE', '2018-04-09 21:34:14'),
(1000128, 'TORRES, JIK', 'Update', 'Loan%20updated%20to:%20C10001:%20ISRAEL%20LADY%20GRACE', '2018-04-09 21:34:39'),
(1000129, 'TORRES, JIK', 'Update', 'Loan%20updated%20to:%20C10001:%20ISRAEL%20LADY%20GRACE', '2018-04-09 21:36:27'),
(1000130, 'TORRES, JIK', 'Update', 'Loan%20updated%20to:%20C10001:%20ISRAEL%20LADY%20GRACE', '2018-04-09 21:36:36'),
(1000131, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100006%20of%20Client:%20ISRAEL%20LADY%20GRACE', '2018-04-09 21:40:20'),
(1000132, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100001%20of%20Client:%20ISRAEL%20LADY%20GRACE', '2018-04-09 21:41:09'),
(1000133, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100002%20of%20Client:%20ISRAEL%20LADY%20GRACE', '2018-04-09 21:44:36'),
(1000134, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100003%20of%20Client:%20ISRAEL%20LADY%20GRACE', '2018-04-09 21:44:49'),
(1000135, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100004%20of%20Client:%20ISRAEL%20LADY%20GRACE', '2018-04-09 21:45:00'),
(1000136, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100005%20of%20Client:%20ISRAEL%20LADY%20GRACE', '2018-04-09 21:45:10'),
(1000137, 'TORRES, JIK', 'Update', 'Loan%20updated%20to:%20C10001:%20ISRAEL%20LADY%20GRACE', '2018-04-09 21:45:37'),
(1000138, 'TORRES, JIK', 'Update', 'Loan%20updated%20to:%20C10001:%20ISRAEL%20LADY%20GRACE', '2018-04-09 21:46:44'),
(1000139, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100007%20of%20Client:%20ISRAEL%20LADY%20GRACE', '2018-04-09 21:47:05'),
(1000140, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100005%20of%20Client:%20ISRAEL%20LADY%20GRACE', '2018-04-09 21:58:59'),
(1000141, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100005%20of%20Client:%20ISRAEL%20LADY%20GRACE', '2018-04-09 21:59:39'),
(1000142, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100025%20of%20Client:%20ALDERITE%20ROSE%20ANN', '2018-04-09 22:00:53'),
(1000143, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100025%20of%20Client:%20ALDERITE%20ROSE%20ANN', '2018-04-09 22:01:15'),
(1000144, 'TORRES, JIK', 'Update', 'Loan%20updated%20to:%20C10003:%20ALDERITE%20ROSE%20ANN', '2018-04-09 22:03:26'),
(1000145, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100021%20of%20Client:%20ALDERITE%20ROSE%20ANN', '2018-04-09 22:05:41'),
(1000146, 'TORRES, JIK', 'Update', 'Loan%20updated%20to:%20C10003:%20ALDERITE%20ROSE%20ANN', '2018-04-09 22:07:09'),
(1000147, 'TORRES, JIK', 'Update', 'Loan%20updated%20to:%20C10003:%20ALDERITE%20ROSE%20ANN', '2018-04-09 22:09:17'),
(1000148, 'TORRES, JIK', 'Update', 'Loan%20updated%20to:%20C10003:%20ALDERITE%20ROSE%20ANN', '2018-04-09 22:09:50'),
(1000149, 'TORRES, JIK', 'Update', 'Client%20updated%20C10009:%20BAYANI%20ESNEYRA', '2018-04-09 22:52:04'),
(1000150, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-10 19:33:42'),
(1000151, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-04-10 19:33:48'),
(1000152, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-10 19:34:14'),
(1000153, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-12 01:30:05'),
(1000154, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10023%20of%20Client:%20BAYANI%20ESNEYRA', '2018-04-12 02:11:31'),
(1000155, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-12 22:08:56'),
(1000156, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10024%20of%20Client:%20CABANG%20REYSEL', '2018-04-12 22:13:29'),
(1000157, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10010:%20CABANG%20REYSEL', '2018-04-12 22:18:17'),
(1000158, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-13 22:01:34'),
(1000159, 'TORRES, JIK', 'Add', 'New%20schedule%20added:%20VXI%20-%20SM%20Ecoland%20Payday', '2018-04-14 01:33:28'),
(1000160, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-14 21:43:53'),
(1000161, 'TORRES, JIK', 'Update', 'Capital%20adjustment%20updated%20P1', '2018-04-15 02:53:03'),
(1000162, 'TORRES, JIK', 'Update', 'Capital%20adjustment%20updated%20P4', '2018-04-15 02:54:16'),
(1000163, 'TORRES, JIK', 'Update', 'Capital%20adjustment%20updated%20P4', '2018-04-15 02:54:30'),
(1000164, 'TORRES, JIK', 'Update', 'Capital%20adjustment%20updated%20P4', '2018-04-15 02:54:40'),
(1000165, 'TORRES, JIK', 'Update', 'Capital%20adjustment%20updated%20P4', '2018-04-15 02:54:50'),
(1000166, 'TORRES, JIK', 'Update', 'New%20capital%20adjustment', '2018-04-15 02:55:16'),
(1000167, 'TORRES, JIK', 'Update', 'New%20capital%20adjustment', '2018-04-15 02:56:37'),
(1000168, 'TORRES, JIK', 'Delete', 'User%20record%20deleted', '2018-04-15 02:58:45'),
(1000169, 'TORRES, JIK', 'Delete', 'User%20record%20deleted', '2018-04-15 02:58:49'),
(1000170, 'TORRES, JIK', 'Update', 'New%20capital%20adjustment', '2018-04-15 03:00:47'),
(1000171, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-15 16:11:15'),
(1000172, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-16 16:58:33'),
(1000173, 'TORRES, JIK', 'Add', 'New%20client%20record%20added:%20Torres%20Jessa%20Mae', '2018-04-16 18:13:07'),
(1000174, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10012:%20Torres%20Jessa%20Mae', '2018-04-16 18:27:32'),
(1000175, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-16 22:23:29'),
(1000176, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-16 23:40:52'),
(1000177, 'TORRES, JIK', 'Update', 'Client%20updated%20C10012:%20TORRES%20JESSA%20MAEs', '2018-04-16 23:58:42'),
(1000178, 'TORRES, JIK', 'Update', 'Client%20updated%20C10012:%20TORRES%20JESSA%20MAE', '2018-04-16 23:58:51'),
(1000179, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-04-17 01:28:59'),
(1000180, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-17 17:37:50'),
(1000181, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-18 01:22:21'),
(1000182, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-19 16:36:00'),
(1000183, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-20 00:07:43'),
(1000184, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10026%20of%20Client:%20CABANG%20REYSEL', '2018-04-20 00:37:29'),
(1000185, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10013%20of%20Client:%20ZABATE%20KAREN%20JANE', '2018-04-20 00:39:39'),
(1000186, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10009%20of%20Client:%20ALDERITE%20ROSE%20ANN', '2018-04-20 00:42:29'),
(1000187, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10009:%20BAYANI%20ESNEYRA', '2018-04-20 00:46:40'),
(1000188, 'TORRES, JIK', 'Add', 'New%20client%20record%20added:%20BIWANG%20JUHAIRY', '2018-04-20 01:09:33'),
(1000189, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10013:%20BIWANG%20JUHAIRY', '2018-04-20 01:10:44'),
(1000190, 'TORRES, JIK', 'Add', 'New%20schedule%20added:%20VXI%20-%20SM%20Ecoland%20Payday', '2018-04-20 02:02:55'),
(1000191, 'TORRES, JIK', 'Update', 'Schedule%20updated%20S2:%20VXI%20-%20SM%20Ecoland%20Payday', '2018-04-20 02:03:21'),
(1000192, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-20 14:54:41'),
(1000193, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-20 17:09:51'),
(1000194, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-25 19:22:12'),
(1000195, 'TORRES, JIK', 'Add', 'New%20schedule%20added:%20Karen%20and%20Juh%20loan', '2018-04-25 19:23:55'),
(1000196, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-25 22:40:51'),
(1000197, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10023%20of%20Client:%20BAYANI%20ESNEYRA', '2018-04-25 22:41:45'),
(1000198, 'TORRES, JIK', 'Add', 'New%20interest%20added%20to%20Loan%20ID:%20L10023%20of%20Client:%20BAYANI%20ESNEYRA', '2018-04-25 22:43:30'),
(1000199, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-27 00:57:33'),
(1000200, 'TORRES, JIK', 'Update', 'New%20loan%20adjustment%20to%20Loan%20ID:%20L10027%20of%20Client:%20TORRES%20JESSA%20MAE', '2018-04-27 01:32:34'),
(1000201, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10004:%20ZABATE%20KAREN%20JANE', '2018-04-27 01:33:58'),
(1000202, 'TORRES, JIK', 'Add', 'New%20interest%20added%20to%20Loan%20ID:%20L10017%20of%20Client:%20ABDULLAH%20FARHANA%20BINT', '2018-04-27 01:36:50'),
(1000203, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10029%20of%20Client:%20BIWANG%20JUHAIRY', '2018-04-27 01:39:08'),
(1000204, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10013:%20BIWANG%20JUHAIRY', '2018-04-27 01:40:10'),
(1000205, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-27 14:52:27'),
(1000206, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-27 17:41:13'),
(1000207, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-04-28 01:35:50'),
(1000208, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-01 10:18:15'),
(1000209, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10027%20of%20Client:%20TORRES%20JESSA%20MAE', '2018-05-01 10:19:19'),
(1000210, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-01 22:09:28'),
(1000211, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-02 22:44:21'),
(1000212, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-03 22:46:01'),
(1000213, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10030%20of%20Client:%20ZABATE%20KAREN%20JANE', '2018-05-03 22:54:27'),
(1000214, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10031%20of%20Client:%20BIWANG%20JUHAIRY', '2018-05-03 23:00:19'),
(1000215, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10026%20of%20Client:%20CABANG%20REYSEL', '2018-05-03 23:07:25'),
(1000216, 'TORRES, JIK', 'Update', 'New%20loan%20adjustment%20to%20Loan%20ID:%20L10009%20of%20Client:%20ALDERITE%20ROSE%20ANN', '2018-05-03 23:15:51'),
(1000217, 'TORRES, JIK', 'Update', 'Transaction%20updated%20T100097%20of%20Client:%20ALDERITE%20ROSE%20ANN', '2018-05-03 23:16:36'),
(1000218, 'TORRES, JIK', 'Add', 'New%20interest%20added%20to%20Loan%20ID:%20L10009%20of%20Client:%20ALDERITE%20ROSE%20ANN', '2018-05-03 23:17:26'),
(1000219, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-05 22:21:08'),
(1000220, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-08 10:02:16'),
(1000221, 'TORRES, JIK', 'Add', 'New%20schedule%20added:%20Bint%20partial%20payment', '2018-05-08 10:11:09'),
(1000222, 'TORRES, JIK', 'Add', 'New%20schedule%20added:%20VXI%20-%20SM%20Ecoland%20Payday', '2018-05-08 10:12:12'),
(1000223, 'TORRES, JIK', 'Add', 'New%20schedule%20added:%20Yanny%20payment', '2018-05-08 10:15:22'),
(1000224, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-08 17:21:52'),
(1000225, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-09 09:00:34'),
(1000226, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-05-09 10:57:51'),
(1000227, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-09 11:51:17'),
(1000228, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-10 09:06:00'),
(1000229, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-10 16:45:56'),
(1000230, 'Lastdmin, Admin', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10028%20of%20Client:%20BAYANI%20ESNEYRA', '2018-05-10 17:34:48'),
(1000231, 'Lastdmin, Admin', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10023%20of%20Client:%20BAYANI%20ESNEYRA', '2018-05-10 17:35:46'),
(1000232, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-11 09:10:13'),
(1000233, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-11 23:22:34'),
(1000234, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10017%20of%20Client:%20ABDULLAH%20FARHANA%20BINT', '2018-05-11 23:23:29'),
(1000235, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10005:%20ABDULLAH%20FARHANA%20BINT', '2018-05-11 23:24:11'),
(1000236, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-12 10:20:54'),
(1000237, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10007:%20ABUNDA%20ERIKA%20ANNE', '2018-05-12 10:21:53'),
(1000238, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-12 10:46:45'),
(1000239, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-14 01:31:10'),
(1000240, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10026%20of%20Client:%20CABANG%20REYSEL', '2018-05-14 01:40:59'),
(1000241, 'TORRES, JIK', 'Add', 'New%20client%20record%20added:%20Diendo%20Sherlyn', '2018-05-14 01:43:20'),
(1000242, 'TORRES, JIK', 'Update', 'Client%20updated%20C10014:%20DIENDOS%20SHERLYN', '2018-05-14 01:45:19'),
(1000243, 'TORRES, JIK', 'Update', 'Client%20updated%20C10014:%20DIENDO%20SHERLYN', '2018-05-14 01:45:24'),
(1000244, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10014:%20DIENDO%20SHERLYN', '2018-05-14 01:46:21'),
(1000245, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-15 20:27:25'),
(1000246, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-16 21:36:43'),
(1000247, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10009:%20BAYANI%20ESNEYRA', '2018-05-16 21:54:01'),
(1000248, 'TORRES, JIK', 'Update', 'Schedule%20updated%20S6:%20IBEX%20pay%20day', '2018-05-16 22:51:42'),
(1000249, 'TORRES, JIK', 'Update', 'Schedule%20updated%20S5:%20VXI%20-%20SM%20Ecoland%20Payday', '2018-05-16 22:53:54'),
(1000250, 'TORRES, JIK', 'Update', 'Schedule%20updated%20S6:%20IBEX%20pay%20day', '2018-05-16 22:54:03'),
(1000251, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-17 09:28:17'),
(1000252, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-17 09:58:27'),
(1000253, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-17 12:26:24'),
(1000254, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-17 20:43:40'),
(1000255, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-17 20:47:46'),
(1000256, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10031%20of%20Client:%20BIWANG%20JUHAIRY', '2018-05-17 20:48:52'),
(1000257, 'TORRES, JIK', 'Add', 'New%20interest%20added%20to%20Loan%20ID:%20L10031%20of%20Client:%20BIWANG%20JUHAIRY', '2018-05-17 20:52:52'),
(1000258, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10030%20of%20Client:%20ZABATE%20KAREN%20JANE', '2018-05-17 20:58:51'),
(1000259, 'TORRES, JIK', 'Add', 'New%20interest%20added%20to%20Loan%20ID:%20L10030%20of%20Client:%20ZABATE%20KAREN%20JANE', '2018-05-17 20:59:24'),
(1000260, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10009%20of%20Client:%20ALDERITE%20ROSE%20ANN', '2018-05-17 21:06:41'),
(1000261, 'TORRES, JIK', 'Add', 'New%20loan%20added%20to:%20C10003:%20ALDERITE%20ROSE%20ANN', '2018-05-17 21:09:02'),
(1000262, 'TORRES, JIK', 'Update', 'Client%20updated%20C10009:%20BAYANI%20ESNEYRA', '2018-05-17 21:29:03'),
(1000263, 'TORRES, JIK', 'Add', 'New%20schedule%20added:%20VXI%20-%20SM%20Ecoland%20Payday', '2018-05-17 21:31:27'),
(1000264, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-18 09:21:02'),
(1000265, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10034%20of%20Client:%20DIENDO%20SHERLYN', '2018-05-18 09:36:22'),
(1000266, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-18 22:54:23'),
(1000267, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-20 21:19:44'),
(1000268, 'TORRES, JIK', 'Add', 'New%20payment%20added%20to%20Loan%20ID:%20L10033%20of%20Client:%20ABUNDA%20ERIKA%20ANNE', '2018-05-20 21:20:50'),
(1000269, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-21 08:56:37'),
(1000270, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-21 15:41:38'),
(1000271, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-21 22:01:44'),
(1000272, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-22 11:12:22'),
(1000273, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-22 11:13:16'),
(1000274, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-22 11:26:29'),
(1000275, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-22 21:59:40'),
(1000276, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-22 22:20:42'),
(1000277, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-22 22:22:20'),
(1000278, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-23 09:21:03'),
(1000279, 'TORRES, JIK', 'Add', 'New%20schedule%20added:%20IBEX%20pay%20day', '2018-05-23 09:25:10'),
(1000280, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-05-23 09:28:46'),
(1000281, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-23 09:29:03'),
(1000282, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-23 14:31:16'),
(1000283, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-23 20:26:24'),
(1000284, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-23 20:37:37'),
(1000285, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-23 20:39:35'),
(1000286, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-24 09:26:30'),
(1000287, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-24 18:14:08'),
(1000288, 'TORRES, JIK', 'Add', 'New%20category%20added:%20Dessert', '2018-05-24 18:16:50'),
(1000289, 'TORRES, JIK', 'Add', 'New%20product%20added:%20Coke', '2018-05-24 18:22:34'),
(1000290, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-25 01:01:13'),
(1000291, 'TORRES, JIK', 'Add', 'New%20package%20added:%20Family%20Bundle', '2018-05-25 01:21:38'),
(1000292, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-25 09:19:20'),
(1000293, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-25 15:43:06'),
(1000294, 'TORRES, JIK', 'Add', 'New%20item%20added:%20Coca%20Cola', '2018-05-25 16:05:26'),
(1000295, 'TORRES, JIK', 'Update', 'Item%20updated%20I1:%20Coca%20Cola%20to%20Coca%20Cola', '2018-05-25 17:20:11'),
(1000296, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P1', '2018-05-25 17:20:46'),
(1000297, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%201', '2018-05-25 17:27:43'),
(1000298, 'TORRES, JIK', 'Delete', 'Product%20item%20deleted%20P1:%20I1', '2018-05-25 17:27:46'),
(1000299, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%201', '2018-05-25 17:28:07'),
(1000300, 'TORRES, JIK', 'Update', 'Item%20updated%20I1:%20Coca%20Cola%20to%20Coca%20Cola', '2018-05-25 17:40:17'),
(1000301, 'TORRES, JIK', 'Update', 'Item%20updated%20I1:%20Coca%20Cola%20to%20Coca%20Cola', '2018-05-25 17:40:22'),
(1000302, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-28 10:11:55'),
(1000303, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-28 13:48:26'),
(1000304, 'TORRES, JIK', 'Add', 'New%20product%20added:%20Iced%20Tea', '2018-05-28 14:37:40'),
(1000305, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%201', '2018-05-28 14:38:18'),
(1000306, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P2', '2018-05-28 15:10:46'),
(1000307, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-29 13:12:53'),
(1000308, 'TORRES, JIK', 'Add', 'New%20package%20added:%20Package%20test%201', '2018-05-29 13:17:08'),
(1000309, 'TORRES, JIK', 'Add', 'New%20package%20product%20added:%202', '2018-05-29 13:22:23'),
(1000310, 'TORRES, JIK', 'Add', 'New%20package%20product%20added:%202', '2018-05-29 13:24:58'),
(1000311, 'TORRES, JIK', 'Update', 'Package%20updated%20G2:%20Package%20test%201%20to%20Package%20test%201', '2018-05-29 13:30:26'),
(1000312, 'TORRES, JIK', 'Add', 'New%20item%20added:%20French%20Fries', '2018-05-29 13:43:45'),
(1000313, 'TORRES, JIK', 'Add', 'New%20item%20added:%20Burger%20Patty', '2018-05-29 13:44:08'),
(1000314, 'TORRES, JIK', 'Add', 'New%20item%20added:%20Burger%20Bun', '2018-05-29 13:44:30'),
(1000315, 'TORRES, JIK', 'Add', 'New%20item%20added:%20Sprite', '2018-05-29 13:45:22'),
(1000316, 'TORRES, JIK', 'Add', 'New%20item%20added:%20Lettuce', '2018-05-29 13:45:55'),
(1000317, 'TORRES, JIK', 'Add', 'New%20item%20added:%20Cheese%20slice', '2018-05-29 13:46:20'),
(1000318, 'TORRES, JIK', 'Add', 'New%20item%20added:%20Tomato', '2018-05-29 13:46:51'),
(1000319, 'TORRES, JIK', 'Add', 'New%20item%20added:%20Cheese%20Powder', '2018-05-29 13:47:31'),
(1000320, 'TORRES, JIK', 'Add', 'New%20item%20added:%20Barbecue%20Powder', '2018-05-29 13:48:11'),
(1000321, 'TORRES, JIK', 'Update', 'Item%20updated%20I8:%20Tomato%20to%20Tomato', '2018-05-29 13:48:33'),
(1000322, 'TORRES, JIK', 'Update', 'Item%20updated%20I8:%20Tomato%20to%20Tomato', '2018-05-29 13:48:40'),
(1000323, 'TORRES, JIK', 'Update', 'Item%20updated%20I6:%20Lettuce%20to%20Lettuces', '2018-05-29 13:48:45'),
(1000324, 'TORRES, JIK', 'Update', 'Item%20updated%20I6:%20Lettuces%20to%20Lettuce', '2018-05-29 13:48:54'),
(1000325, 'TORRES, JIK', 'Update', 'Item%20updated%20I6:%20Lettuce%20to%20Lettuce', '2018-05-29 13:49:00'),
(1000326, 'TORRES, JIK', 'Add', 'New%20item%20added:%20Iced%20Tea%20Powder', '2018-05-29 13:49:47'),
(1000327, 'TORRES, JIK', 'Delete', 'Product%20item%20deleted%20P2:%20I1', '2018-05-29 13:50:07'),
(1000328, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%2011', '2018-05-29 13:50:18'),
(1000329, 'TORRES, JIK', 'Update', 'Product%20updated%20P2:%20Iced%20Tea%20to%20Iced%20Tea%201%20Pitcher', '2018-05-29 13:50:34'),
(1000330, 'TORRES, JIK', 'Update', 'Product%20updated%20P1:%20Coke%20to%20Coke%20in%20can', '2018-05-29 13:50:43'),
(1000331, 'TORRES, JIK', 'Update', 'Product%20updated%20P2:%20Iced%20Tea%201%20Pitcher%20to%20Iced%20Tea%20Pitcher', '2018-05-29 13:50:58'),
(1000332, 'TORRES, JIK', 'Add', 'New%20product%20added:%20Cheese%20Burger', '2018-05-29 13:51:48'),
(1000333, 'TORRES, JIK', 'Add', 'New%20category%20added:%20Meals', '2018-05-29 13:52:38'),
(1000334, 'TORRES, JIK', 'Update', 'Product%20updated%20P3:%20Cheese%20Burger%20to%20Cheese%20Burger', '2018-05-29 13:52:48'),
(1000335, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%203', '2018-05-29 13:53:33'),
(1000336, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%204', '2018-05-29 13:53:41'),
(1000337, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%206', '2018-05-29 13:53:49'),
(1000338, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%207', '2018-05-29 13:53:57'),
(1000339, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%208', '2018-05-29 13:54:13'),
(1000340, 'TORRES, JIK', 'Add', 'New%20product%20added:%20Sprite%20in%20Can', '2018-05-29 13:55:33'),
(1000341, 'TORRES, JIK', 'Add', 'New%20product%20added:%20Cheesy%20Fries', '2018-05-29 13:56:42'),
(1000342, 'TORRES, JIK', 'Add', 'New%20product%20added:%20Barbecue%20Fries', '2018-05-29 13:57:28'),
(1000343, 'TORRES, JIK', 'Add', 'New%20product%20added:%20Double%20Cheese%20Burger', '2018-05-29 13:58:22'),
(1000344, 'TORRES, JIK', 'Update', 'Product%20updated%20P7:%20Double%20Cheese%20Burger%20to%20Double%20Cheese%20Burger', '2018-05-29 13:58:32'),
(1000345, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%202', '2018-05-29 13:58:48'),
(1000346, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%209', '2018-05-29 14:01:23'),
(1000347, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P6', '2018-05-29 14:01:34'),
(1000348, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P6', '2018-05-29 14:01:50'),
(1000349, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%202', '2018-05-29 14:02:06'),
(1000350, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%209', '2018-05-29 14:02:11'),
(1000351, 'TORRES, JIK', 'Delete', 'Product%20item%20deleted%20P6:%20I9', '2018-05-29 14:03:06'),
(1000352, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%2010', '2018-05-29 14:03:12'),
(1000353, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%205', '2018-05-29 14:18:49'),
(1000354, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%203', '2018-05-29 14:19:18'),
(1000355, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%204', '2018-05-29 14:19:25'),
(1000356, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%206', '2018-05-29 14:19:32'),
(1000357, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%207', '2018-05-29 14:19:42'),
(1000358, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%208', '2018-05-29 14:19:49'),
(1000359, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P7', '2018-05-29 14:25:20'),
(1000360, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P7', '2018-05-29 14:25:39'),
(1000361, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P7', '2018-05-29 14:46:49'),
(1000362, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P7', '2018-05-29 14:46:54'),
(1000363, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P7', '2018-05-29 14:46:59'),
(1000364, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P7', '2018-05-29 14:49:10'),
(1000365, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%2010', '2018-05-29 14:49:20'),
(1000366, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P7', '2018-05-29 14:49:33'),
(1000367, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P7', '2018-05-29 14:49:38'),
(1000368, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P7', '2018-05-29 14:49:43'),
(1000369, 'TORRES, JIK', 'Delete', 'Product%20item%20deleted%20P7:%20I10', '2018-05-29 14:49:58'),
(1000370, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P7', '2018-05-29 14:53:40'),
(1000371, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P7', '2018-05-29 14:53:45'),
(1000372, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%209', '2018-05-29 14:53:59'),
(1000373, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P7', '2018-05-29 14:54:05'),
(1000374, 'TORRES, JIK', 'Delete', 'Product%20item%20deleted%20P7:%20I9', '2018-05-29 14:54:10'),
(1000375, 'TORRES, JIK', 'Add', 'New%20product%20added:%20Mix%20Fries', '2018-05-29 14:56:29'),
(1000376, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%202', '2018-05-29 14:56:56'),
(1000377, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%209', '2018-05-29 14:57:00'),
(1000378, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%2010', '2018-05-29 14:57:08'),
(1000379, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P8', '2018-05-29 14:57:13'),
(1000380, 'TORRES, JIK', 'Add', 'New%20product%20added:%20Extra%20Large%20Fries', '2018-05-29 14:58:13'),
(1000381, 'TORRES, JIK', 'Add', 'New%20product%20added:%20Chicken%20Rice%20Meal', '2018-05-29 14:59:21'),
(1000382, 'TORRES, JIK', 'Add', 'New%20package%20product%20added:%201', '2018-05-29 15:09:29'),
(1000383, 'TORRES, JIK', 'Add', 'New%20package%20product%20added:%201', '2018-05-29 15:09:45'),
(1000384, 'TORRES, JIK', 'Add', 'New%20package%20product%20added:%201', '2018-05-29 15:09:59'),
(1000385, 'TORRES, JIK', 'Update', 'Package%20product%20updated%20G1', '2018-05-29 15:15:27'),
(1000386, 'TORRES, JIK', 'Update', 'Package%20product%20updated%20G1', '2018-05-29 15:15:34'),
(1000387, 'TORRES, JIK', 'Add', 'New%20package%20product%20added:%201', '2018-05-29 15:15:52'),
(1000388, 'TORRES, JIK', 'Update', 'Package%20product%20updated%20G1', '2018-05-29 15:16:02'),
(1000389, 'TORRES, JIK', 'Delete', 'Package%20product%20deleted%20P1:%20I4', '2018-05-29 15:16:06'),
(1000390, 'TORRES, JIK', 'Update', 'Package%20product%20updated%20G1', '2018-05-29 15:16:18'),
(1000391, 'TORRES, JIK', 'Update', 'Package%20product%20updated%20G1', '2018-05-29 15:16:24'),
(1000392, 'TORRES, JIK', 'Add', 'New%20package%20added:%20Barkada%20Package', '2018-05-29 15:18:31'),
(1000393, 'TORRES, JIK', 'Add', 'New%20package%20product%20added:%203', '2018-05-29 15:19:05'),
(1000394, 'TORRES, JIK', 'Add', 'New%20package%20product%20added:%203', '2018-05-29 15:19:21'),
(1000395, 'TORRES, JIK', 'Add', 'New%20item%20added:%20Cup%20of%20Rice', '2018-05-29 16:44:36'),
(1000396, 'TORRES, JIK', 'Add', 'New%20item%20added:%20Fried%20Chicken%20Cuts', '2018-05-29 16:46:28'),
(1000397, 'TORRES, JIK', 'Update', 'Item%20updated%20I13:%20Fried%20Chicken%20Cuts%20to%20Fried%20Chicken%20Cuts', '2018-05-29 16:46:35'),
(1000398, 'TORRES, JIK', 'Update', 'Item%20updated%20I13:%20Fried%20Chicken%20Cuts%20to%20Fried%20Chicken%20Cuts', '2018-05-29 16:46:38'),
(1000399, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%2013', '2018-05-29 16:47:10'),
(1000400, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%2012', '2018-05-29 16:47:22'),
(1000401, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%201', '2018-05-29 16:51:51'),
(1000402, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%202', '2018-05-29 16:52:17'),
(1000403, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%209', '2018-05-29 16:52:39'),
(1000404, 'TORRES, JIK', 'Add', 'New%20category%20added:%20Add-ons', '2018-05-29 16:54:21'),
(1000405, 'TORRES, JIK', 'Update', 'Package%20updated%20G2:%20Package%20test%201%20to%20Family%20Bundle%202', '2018-05-29 16:55:53'),
(1000406, 'TORRES, JIK', 'Update', 'Package%20updated%20G1:%20Family%20Bundle%20to%20Family%20Bundle%201', '2018-05-29 16:56:00'),
(1000407, 'TORRES, JIK', 'Update', 'Package%20product%20updated%20G2', '2018-05-29 16:57:13'),
(1000408, 'TORRES, JIK', 'Delete', 'Package%20product%20deleted%20P2:%20I2', '2018-05-29 16:57:27'),
(1000409, 'TORRES, JIK', 'Add', 'New%20package%20product%20added:%202', '2018-05-29 16:57:40'),
(1000410, 'TORRES, JIK', 'Add', 'New%20package%20product%20added:%202', '2018-05-29 16:57:53'),
(1000411, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P10', '2018-05-29 17:00:05'),
(1000412, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P10', '2018-05-29 17:00:09'),
(1000413, 'TORRES, JIK', 'Update', 'Product%20item%20updated%20P10', '2018-05-29 17:00:19'),
(1000414, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-29 17:33:40'),
(1000415, 'TORRES, JIK', 'Delete', 'Item%20deleted%20I1', '2018-05-29 17:59:00'),
(1000416, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-30 10:10:03'),
(1000417, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-05-30 13:49:36'),
(1000418, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-30 13:49:39'),
(1000419, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-30 13:50:34'),
(1000420, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-30 14:07:36'),
(1000421, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-30 16:19:18'),
(1000422, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-31 10:45:02'),
(1000423, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-31 14:00:46'),
(1000424, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-05-31 14:35:21'),
(1000425, 'TORRES, JIK', 'Delete', 'Product%20deleted%20P12:%20test%20insert%202', '2018-05-31 14:35:42'),
(1000426, 'TORRES, JIK', 'Delete', 'Product%20deleted%20P11:%20test%20insert%201', '2018-05-31 14:35:46'),
(1000427, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-04 09:52:56'),
(1000428, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-04 17:53:52'),
(1000429, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-05 09:15:48'),
(1000430, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-05 11:06:05'),
(1000431, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-05 15:06:48'),
(1000432, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-06 09:27:05'),
(1000433, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-06 14:30:52'),
(1000434, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-06 17:43:09'),
(1000435, 'TORRES, JIK', 'Add', 'New%20table%20added:%20Square%20Table%202', '2018-06-06 18:01:18'),
(1000436, 'TORRES, JIK', 'Update', 'Table%20updated%20T2:%20Square%20Table%202%20to%20Square%20Table%202', '2018-06-06 18:01:24'),
(1000437, 'TORRES, JIK', 'Update', 'Table%20updated%20T2:%20Square%20Table%202%20to%20Square%20Table%202', '2018-06-06 18:01:33'),
(1000438, 'TORRES, JIK', 'Update', 'Table%20updated%20T2:%20Square%20Table%202%20to%20Square%20Table%202', '2018-06-06 18:01:40'),
(1000439, 'TORRES, JIK', 'Update', 'Table%20updated%20T2:%20Square%20Table%202%20to%20Square%20Table%202', '2018-06-06 18:04:52'),
(1000440, 'TORRES, JIK', 'Update', 'Table%20updated%20T2:%20Square%20Table%202%20to%20Square%20Table%202', '2018-06-06 18:05:44'),
(1000441, 'TORRES, JIK', 'Update', 'Table%20updated%20T2:%20Square%20Table%202%20to%20Square%20Table%202', '2018-06-06 18:05:49'),
(1000442, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-07 11:11:55'),
(1000443, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-07 11:15:11'),
(1000444, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-07 12:44:10'),
(1000445, 'TORRES, JIK', 'Update', 'Table%20updated%20T2:%20Square%20Table%202%20to%20Square%20Table%202', '2018-06-07 12:47:04'),
(1000446, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-07 16:13:34'),
(1000447, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-08 09:45:02'),
(1000448, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-08 16:24:44'),
(1000449, 'TORRES, JIK', 'Delete', 'Transaction%20detail%20product%20voided%20T1:%20P1', '2018-06-08 17:55:00'),
(1000450, 'TORRES, JIK', 'Delete', 'Transaction%20detail%20package%20voided%20T1:%20G1', '2018-06-08 17:55:06'),
(1000451, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-11 11:53:24'),
(1000452, 'TORRES, JIK', 'Add', 'New%20table%20added:%20Circle%20Table%201', '2018-06-11 11:54:21');
INSERT INTO `logs` (`log_id`, `user_fullname`, `log_type`, `details`, `date_time`) VALUES
(1000453, 'TORRES, JIK', 'Add', 'New%20table%20added:%20Circle%20Table%202', '2018-06-11 11:54:34'),
(1000454, 'TORRES, JIK', 'Update', 'Table%20updated%20T4:%20Circle%20Table%202%20to%20Circle%20Table%202', '2018-06-11 13:06:41'),
(1000455, 'TORRES, JIK', 'Update', 'Table%20updated%20T4:%20Circle%20Table%202%20to%20Circle%20Table%202', '2018-06-11 13:06:49'),
(1000456, 'TORRES, JIK', 'Update', 'Table%20updated%20T4:%20Circle%20Table%202%20to%20Circle%20Table%202', '2018-06-11 13:10:49'),
(1000457, 'TORRES, JIK', 'Update', 'Table%20updated%20T4:%20Circle%20Table%202%20to%20Circle%20Table%202', '2018-06-11 13:10:59'),
(1000458, 'TORRES, JIK', 'Update', 'Table%20updated%20T4:%20Circle%20Table%202%20to%20Circle%20Table%202', '2018-06-11 13:11:09'),
(1000459, 'TORRES, JIK', 'Update', 'Table%20updated%20T4:%20Circle%20Table%202%20to%20Circle%20Table%202', '2018-06-11 13:11:15'),
(1000460, 'TORRES, JIK', 'Update', 'Table%20updated%20T4:%20Circle%20Table%202%20to%20Circle%20Table%202', '2018-06-11 13:17:06'),
(1000461, 'TORRES, JIK', 'Update', 'Table%20updated%20T4:%20Circle%20Table%202%20to%20Circle%20Table%202', '2018-06-11 13:17:18'),
(1000462, 'TORRES, JIK', 'Update', 'Table%20updated%20T4:%20Circle%20Table%202%20to%20Circle%20Table%202', '2018-06-11 13:17:24'),
(1000463, 'TORRES, JIK', 'Update', 'Table%20updated%20T4:%20Circle%20Table%202%20to%20Circle%20Table%202', '2018-06-11 13:17:49'),
(1000464, 'TORRES, JIK', 'Update', 'Table%20updated%20T4:%20Circle%20Table%202%20to%20Circle%20Table%202', '2018-06-11 13:17:56'),
(1000465, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-12 19:36:27'),
(1000466, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-06-12 23:48:40'),
(1000467, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-13 09:11:08'),
(1000468, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-13 13:10:15'),
(1000469, 'TORRES, JIK', 'Add', 'New%20table%20added:%20Circle%20Table%203', '2018-06-13 15:54:11'),
(1000470, 'TORRES, JIK', 'Update', 'Table%20updated%20T5:%20Circle%20Table%203%20to%20Circle%20Table%203', '2018-06-13 15:54:16'),
(1000471, 'TORRES, JIK', 'Update', 'Table%20updated%20T5:%20Circle%20Table%203%20to%20Circle%20Table%203', '2018-06-13 15:54:20'),
(1000472, 'TORRES, JIK', 'Update', 'Table%20updated%20T5:%20Circle%20Table%203%20to%20Circle%20Table%203', '2018-06-13 15:54:24'),
(1000473, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S1', '2018-06-13 17:20:57'),
(1000474, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S1', '2018-06-13 17:21:43'),
(1000475, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S1', '2018-06-13 17:23:24'),
(1000476, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S1', '2018-06-13 17:27:47'),
(1000477, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S1', '2018-06-13 17:28:06'),
(1000478, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S1', '2018-06-13 17:30:42'),
(1000479, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S1', '2018-06-13 17:31:46'),
(1000480, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S1', '2018-06-13 17:37:57'),
(1000481, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S1', '2018-06-13 17:41:01'),
(1000482, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S1', '2018-06-13 18:05:28'),
(1000483, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-14 09:21:35'),
(1000484, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-18 09:29:39'),
(1000485, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-18 17:24:25'),
(1000486, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-19 10:49:07'),
(1000487, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-19 13:17:06'),
(1000488, 'TORRES, JIK', 'Add', 'New%20table%20added:%20Circle%20Table%204', '2018-06-19 13:17:19'),
(1000489, 'TORRES, JIK', 'Add', 'New%20table%20added:%20Circle%20Table%205', '2018-06-19 13:17:27'),
(1000490, 'TORRES, JIK', 'Add', 'New%20table%20added:%20Circle%20Table%206', '2018-06-19 13:17:32'),
(1000491, 'TORRES, JIK', 'Add', 'New%20table%20added:%20Circle%20Table%207', '2018-06-19 13:17:38'),
(1000492, 'TORRES, JIK', 'Add', 'New%20table%20added:%20Circle%20Table%208', '2018-06-19 13:17:44'),
(1000493, 'TORRES, JIK', 'Add', 'New%20table%20added:%20Circle%20Table%209', '2018-06-19 13:17:50'),
(1000494, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-19 15:02:42'),
(1000495, 'TORRES, JIK', 'Update', 'Table%20updated%20T5:%20Circle%20Table%203%20to%20Circle%20Table%203', '2018-06-19 15:02:58'),
(1000496, 'TORRES, JIK', 'Update', 'Table%20updated%20T5:%20Circle%20Table%203%20to%20Circle%20Table%203', '2018-06-19 15:03:11'),
(1000497, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-19 17:25:06'),
(1000498, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-19 17:26:35'),
(1000499, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-20 09:02:27'),
(1000500, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S3', '2018-06-20 09:09:57'),
(1000501, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S5', '2018-06-20 09:11:20'),
(1000502, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-20 11:15:45'),
(1000503, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-20 14:15:49'),
(1000504, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S11', '2018-06-20 14:16:31'),
(1000505, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S12', '2018-06-20 14:32:42'),
(1000506, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S10', '2018-06-20 14:33:06'),
(1000507, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S9', '2018-06-20 14:33:17'),
(1000508, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S7', '2018-06-20 14:33:31'),
(1000509, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S4', '2018-06-20 14:33:42'),
(1000510, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S6', '2018-06-20 14:33:55');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `pack_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `descr` varchar(200) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(20) NOT NULL,
  `sold` int(11) NOT NULL,
  `encoded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `removed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`pack_id`, `name`, `descr`, `price`, `img`, `sold`, `encoded`, `removed`) VALUES
(1, 'Family Bundle 1', '', '500.00', '1.jpg', 6, '2018-05-25 01:21:37', 0),
(2, 'Family Bundle 2', 'Sample descr pack 1', '1000.00', '2.jpg', 0, '2018-05-29 13:17:08', 0),
(3, 'Barkada Package', 'Family package X 2', '1000.00', '3.jpg', 3, '2018-05-29 15:18:31', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pack_details`
--

CREATE TABLE `pack_details` (
  `pack_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `encoded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pack_details`
--

INSERT INTO `pack_details` (`pack_id`, `prod_id`, `qty`, `encoded`) VALUES
(2, 1, 5, '2018-05-29 13:22:23'),
(1, 2, 1, '2018-05-29 15:09:29'),
(1, 9, 1, '2018-05-29 15:09:45'),
(1, 10, 4, '2018-05-29 15:09:59'),
(3, 9, 2, '2018-05-29 15:19:05'),
(3, 7, 2, '2018-05-29 15:19:21'),
(2, 10, 5, '2018-05-29 16:57:39'),
(2, 9, 2, '2018-05-29 16:57:53');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prod_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `descr` varchar(200) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(20) NOT NULL,
  `sold` int(11) NOT NULL,
  `sold_pack` int(11) NOT NULL DEFAULT '0',
  `encoded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `removed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prod_id`, `name`, `descr`, `cat_id`, `price`, `img`, `sold`, `sold_pack`, `encoded`, `removed`) VALUES
(1, 'Coco Loco', 'JUSTIN AND MICO', 1, '50.00', '1.jpg', 7, 0, '2018-05-24 18:22:34', 0),
(2, 'Iced Tea Pitcher', 'Soda', 1, '45.00', '2.jpg', 3, 6, '2018-05-28 14:37:40', 0),
(3, 'Cheese Burger', 'Regular size cheese burger', 3, '100.00', '3.jpg', 13, 0, '2018-05-29 13:51:47', 0),
(4, 'Sprite in Can', 'Green can soda in can', 1, '50.00', '4.jpg', 0, 0, '2018-05-29 13:55:32', 0),
(5, 'Cheesy Fries', 'French fries cheese flavor', 3, '80.00', '5.jpg', 1, 0, '2018-05-29 13:56:42', 0),
(6, 'Barbecue Fries', 'French fries BBQ flavor', 3, '80.00', '6.jpg', 3, 0, '2018-05-29 13:57:27', 0),
(7, 'Double Cheese Burger', 'Heavy cheese burger X 2', 3, '180.00', '7.jpg', 0, 6, '2018-05-29 13:58:22', 0),
(8, 'Mix Fries', '2 flavored french fries', 3, '100.00', '8.jpg', 0, 0, '2018-05-29 14:56:29', 0),
(9, 'Extra Large Fries', 'Triple size french fries', 3, '150.00', '9.jpg', 1, 12, '2018-05-29 14:58:13', 0),
(10, 'Chicken Rice Meal', 'Fried chicken cut with rice', 3, '70.00', '10.jpg', 1, 24, '2018-05-29 14:59:21', 0),
(11, 'test insert 1', 'test insert 1 descr', 2, '1000.00', '', 0, 0, '2018-05-31 14:33:22', 1),
(12, 'test insert 2', 'test insert 2 descr', 2, '2000.00', '', 0, 0, '2018-05-31 14:33:23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `prod_details`
--

CREATE TABLE `prod_details` (
  `prod_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `encoded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prod_details`
--

INSERT INTO `prod_details` (`prod_id`, `item_id`, `qty`, `encoded`) VALUES
(1, 1, 1, '2018-05-25 17:28:07'),
(2, 11, 1, '2018-05-29 13:50:17'),
(3, 3, 1, '2018-05-29 13:53:32'),
(3, 4, 1, '2018-05-29 13:53:41'),
(3, 6, 1, '2018-05-29 13:53:49'),
(3, 7, 1, '2018-05-29 13:53:57'),
(3, 8, 1, '2018-05-29 13:54:13'),
(6, 2, 1, '2018-05-29 13:58:48'),
(5, 2, 1, '2018-05-29 14:02:06'),
(5, 9, 1, '2018-05-29 14:02:11'),
(6, 10, 1, '2018-05-29 14:03:11'),
(4, 5, 1, '2018-05-29 14:18:49'),
(7, 3, 2, '2018-05-29 14:19:18'),
(7, 4, 2, '2018-05-29 14:19:25'),
(7, 6, 2, '2018-05-29 14:19:32'),
(7, 7, 2, '2018-05-29 14:19:42'),
(7, 8, 2, '2018-05-29 14:19:48'),
(8, 2, 2, '2018-05-29 14:56:55'),
(8, 9, 1, '2018-05-29 14:57:00'),
(8, 10, 1, '2018-05-29 14:57:07'),
(10, 13, 1, '2018-05-29 16:47:09'),
(10, 12, 1, '2018-05-29 16:47:22'),
(10, 1, 1, '2018-05-29 16:51:50'),
(9, 2, 3, '2018-05-29 16:52:17'),
(9, 9, 3, '2018-05-29 16:52:38');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `tbl_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `status` int(1) NOT NULL,
  `encoded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `removed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`tbl_id`, `name`, `status`, `encoded`, `removed`) VALUES
(1, 'Square Table 1', 0, '2018-06-06 17:57:24', 0),
(2, 'Square Table 2', 0, '2018-06-06 18:01:17', 0),
(3, 'Circle Table 1', 0, '2018-06-11 11:54:21', 0),
(4, 'Circle Table 2', 0, '2018-06-11 11:54:34', 0),
(5, 'Circle Table 3', 0, '2018-06-13 15:54:11', 0),
(6, 'Circle Table 4', 0, '2018-06-19 13:17:19', 0),
(7, 'Circle Table 5', 0, '2018-06-19 13:17:26', 0),
(8, 'Circle Table 6', 0, '2018-06-19 13:17:32', 0),
(9, 'Circle Table 7', 0, '2018-06-19 13:17:38', 0),
(10, 'Circle Table 8', 0, '2018-06-19 13:17:44', 0),
(11, 'Circle Table 9', 0, '2018-06-19 13:17:50', 0);

-- --------------------------------------------------------

--
-- Table structure for table `table_groups`
--

CREATE TABLE `table_groups` (
  `tbl_grp_id` int(11) NOT NULL,
  `trans_id` int(11) NOT NULL,
  `tbl_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_groups`
--

INSERT INTO `table_groups` (`tbl_grp_id`, `trans_id`, `tbl_id`) VALUES
(8, 2, 3),
(9, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `trans_id` int(11) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `discount` decimal(10,2) NOT NULL,
  `disc_type` int(11) NOT NULL COMMENT 'disc_id',
  `status` varchar(20) NOT NULL,
  `order_type` varchar(20) NOT NULL,
  `cash_amt` decimal(10,2) NOT NULL,
  `change_amt` decimal(10,2) NOT NULL,
  `method` varchar(20) NOT NULL DEFAULT 'n/a',
  `card_number` varchar(45) NOT NULL DEFAULT 'n/a',
  `cust_name` varchar(45) NOT NULL DEFAULT 'n/a',
  `user_id` int(11) NOT NULL COMMENT 'staff/waiter id',
  `cashier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`trans_id`, `datetime`, `discount`, `disc_type`, `status`, `order_type`, `cash_amt`, `change_amt`, `method`, `card_number`, `cust_name`, `user_id`, `cashier_id`) VALUES
(1, '2018-06-08 17:49:31', '0.00', 0, 'CLEARED', 'DINE-IN', '400.00', '0.00', 'Cash', 'n/a', 'n/a', 103, 103),
(2, '2018-06-11 12:15:21', '0.00', 0, 'ONGOING', 'DINE-IN', '0.00', '0.00', 'n/a', 'n/a', 'n/a', 103, 0),
(3, '2018-06-11 18:05:20', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 103, 108),
(4, '2018-06-19 17:44:58', '0.00', 0, 'CLEARED', 'DINE-IN', '200.00', '55.00', 'Cash', 'n/a', 'n/a', 103, 108),
(5, '2018-06-19 17:47:29', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 103, 108),
(6, '2018-06-19 17:58:42', '0.00', 0, 'CLEARED', 'DINE-IN', '100.00', '50.00', 'Cash', 'n/a', 'n/a', 103, 108),
(7, '2018-06-19 18:02:19', '0.00', 0, 'CLEARED', 'DINE-IN', '300.00', '40.00', 'Cash', 'n/a', 'n/a', 103, 108),
(8, '2018-06-20 09:04:52', '0.00', 0, 'ONGOING', 'DINE-IN', '0.00', '0.00', 'n/a', 'n/a', 'n/a', 103, 0),
(9, '2018-06-20 09:05:47', '0.00', 0, 'CLEARED', 'DINE-IN', '300.00', '25.00', 'Cash', 'n/a', 'n/a', 103, 108),
(10, '2018-06-20 11:15:18', '0.00', 0, 'CLEARED', 'DINE-IN', '1600.00', '20.00', 'Cash', 'n/a', 'n/a', 103, 108),
(11, '2018-06-20 11:45:52', '0.00', 0, 'CLEARED', 'DINE-IN', '1100.00', '100.00', 'Cash', 'n/a', 'n/a', 103, 108),
(12, '2018-06-20 14:30:38', '0.00', 0, 'CLEARED', 'DINE-IN', '1700.00', '85.00', 'Cash', 'n/a', 'n/a', 103, 108);

-- --------------------------------------------------------

--
-- Table structure for table `trans_details`
--

CREATE TABLE `trans_details` (
  `trans_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `pack_id` int(11) NOT NULL,
  `prod_type` int(1) NOT NULL COMMENT '0-individual, 1-package, 2-prod-of-package',
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `part_of` int(11) NOT NULL COMMENT 'products associated with the pack_id'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_details`
--

INSERT INTO `trans_details` (`trans_id`, `prod_id`, `pack_id`, `prod_type`, `price`, `qty`, `total`, `part_of`) VALUES
(1, 3, 0, 0, '100.00', 4, '400.00', 0),
(2, 1, 0, 0, '50.00', 2, '100.00', 0),
(2, 3, 0, 0, '100.00', 4, '400.00', 0),
(2, 0, 1, 1, '500.00', 2, '1000.00', 0),
(2, 2, 0, 2, '0.00', 2, '0.00', 1),
(2, 9, 0, 2, '0.00', 2, '0.00', 1),
(2, 10, 0, 2, '0.00', 8, '0.00', 1),
(3, 1, 0, 0, '50.00', 2, '100.00', 0),
(3, 3, 0, 0, '100.00', 4, '400.00', 0),
(3, 0, 1, 1, '500.00', 2, '1000.00', 0),
(3, 2, 0, 2, '0.00', 2, '0.00', 1),
(3, 9, 0, 2, '0.00', 2, '0.00', 1),
(3, 10, 0, 2, '0.00', 8, '0.00', 1),
(4, 1, 0, 0, '50.00', 2, '100.00', 0),
(4, 2, 0, 0, '45.00', 1, '45.00', 0),
(5, 1, 0, 0, '50.00', 2, '100.00', 0),
(5, 3, 0, 0, '100.00', 4, '400.00', 0),
(5, 0, 1, 1, '500.00', 2, '1000.00', 0),
(5, 2, 0, 2, '0.00', 2, '0.00', 1),
(5, 9, 0, 2, '0.00', 2, '0.00', 1),
(5, 10, 0, 2, '0.00', 8, '0.00', 1),
(6, 1, 0, 0, '50.00', 1, '50.00', 0),
(7, 6, 0, 0, '80.00', 1, '80.00', 0),
(7, 3, 0, 0, '100.00', 1, '100.00', 0),
(7, 5, 0, 0, '80.00', 1, '80.00', 0),
(9, 6, 0, 0, '80.00', 1, '80.00', 0),
(9, 9, 0, 0, '150.00', 1, '150.00', 0),
(9, 2, 0, 0, '45.00', 1, '45.00', 0),
(10, 6, 0, 0, '80.00', 1, '80.00', 0),
(10, 0, 3, 1, '1000.00', 1, '1000.00', 0),
(10, 9, 0, 2, '0.00', 2, '0.00', 3),
(10, 7, 0, 2, '0.00', 2, '0.00', 3),
(10, 0, 1, 1, '500.00', 1, '500.00', 0),
(10, 2, 0, 2, '0.00', 1, '0.00', 1),
(10, 9, 0, 2, '0.00', 1, '0.00', 1),
(10, 10, 0, 2, '0.00', 4, '0.00', 1),
(11, 0, 3, 1, '1000.00', 1, '1000.00', 0),
(11, 9, 0, 2, '0.00', 2, '0.00', 3),
(11, 7, 0, 2, '0.00', 2, '0.00', 3),
(12, 10, 0, 0, '70.00', 1, '70.00', 0),
(12, 2, 0, 0, '45.00', 1, '45.00', 0),
(12, 0, 1, 1, '500.00', 1, '500.00', 0),
(12, 2, 0, 2, '0.00', 1, '0.00', 1),
(12, 9, 0, 2, '0.00', 1, '0.00', 1),
(12, 10, 0, 2, '0.00', 4, '0.00', 1),
(12, 0, 3, 1, '1000.00', 1, '1000.00', 0),
(12, 9, 0, 2, '0.00', 2, '0.00', 3),
(12, 7, 0, 2, '0.00', 2, '0.00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `middlename` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(250) NOT NULL,
  `date_registered` varchar(20) NOT NULL,
  `administrator` int(1) NOT NULL DEFAULT '0',
  `cashier` int(1) NOT NULL DEFAULT '0',
  `inventory` int(1) NOT NULL DEFAULT '0',
  `supplier` int(1) NOT NULL DEFAULT '0',
  `customer` int(1) NOT NULL DEFAULT '0',
  `user` int(1) NOT NULL DEFAULT '0',
  `report` int(1) NOT NULL DEFAULT '0',
  `removed` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `lastname`, `firstname`, `middlename`, `contact`, `email`, `address`, `date_registered`, `administrator`, `cashier`, `inventory`, `supplier`, `customer`, `user`, `report`, `removed`) VALUES
(101, 'super_admin', 'alphabravocharliedelta', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', '2017-10-10 19:34:33', 1, 0, 0, 0, 0, 0, 0, 0),
(102, 'nelda', 'kallay1975', 'NELDA', 'PAGSAC', 'BAGUIOHANON', '2969754', 'celinemariepagsac@gmail.com', 'Bl. 27, Lot 4, Gallera de Oro, Bago, Davao City', '2017-10-10 19:38:54', 1, 0, 0, 0, 0, 0, 0, 1),
(103, 'jiktorres', 'jiktorres', 'Torres', 'Jiki', 'Zyrus', '09228031290', 'jiki@gmail.com', 'Sasa, Davao City', '2017-10-10 19:40:32', 0, 0, 0, 0, 0, 0, 0, 1),
(104, 'ladysheen', 'ladysheen', 'GIlbang', 'Lady Sheen', 'Acolentaba', '09888787878', 'lsg@gmail.com', 'Catalunan Grande, Davao City', '2017-10-10 19:41:30', 0, 0, 0, 0, 0, 0, 0, 1),
(105, 'ivyybi', 'ivyybi', 'Ybiernas', 'Ivy', 'Villegas', '0909898897', 'ybi@gmail.com', 'Mawab, Compostela Valley', '2017-10-10 19:52:08', 0, 0, 0, 0, 0, 0, 0, 1),
(106, 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', '2018-02-04 02:31:33', 0, 0, 0, 0, 0, 0, 0, 1),
(107, 'srmafel_inting', 'fsilgc', 'Inting', 'Ma. Felina ', 'Saban', '09232838367', 'srmafel_inting@yahoo.com', 'JS Francisco Village, Talomo , Davao City', '2018-02-06 16:19:07', 1, 0, 0, 0, 0, 0, 0, 1),
(108, 'um_developer', 'jiktorres', 'TORRES', 'JIK', 'ABAS', '+639228031290', 'jikiboi03@gmail.com', 'Sasa, Davao City', '2018-02-07 14:06:29', 1, 0, 0, 0, 0, 0, 0, 0),
(109, 'xanderford', 'xanderford', 'Ford', 'Xander', 'Marlou', '09989898988', 'xander@gmail.com', 'Brgy Barrio Patay, Davao City', '2018-03-12 23:23:04', 0, 0, 0, 0, 0, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`pack_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`tbl_id`);

--
-- Indexes for table `table_groups`
--
ALTER TABLE `table_groups`
  ADD PRIMARY KEY (`tbl_grp_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000511;
--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `pack_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `tbl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `table_groups`
--
ALTER TABLE `table_groups`
  MODIFY `tbl_grp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
