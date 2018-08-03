-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 03, 2018 at 07:51 PM
-- Server version: 5.7.23-0ubuntu0.16.04.1
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
(1, 'Drinks', 'Juice, Soda, Liquor', '2018-05-24 18:14:43', 0),
(2, 'Dessert', 'Dessert foods', '2018-05-24 18:16:49', 0),
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

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`disc_id`, `name`, `descr`, `less_p`, `less_c`, `encoded`, `removed`) VALUES
(1, 'SC (20%)', 'Senior Citizen Discount', 20, '0.00', '2018-06-25 17:39:03', 0),
(2, 'PWD Discount (20%)', 'Person with disability discount', 20, '0.00', '2018-07-09 13:00:09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `descr` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `encoded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `removed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `name`, `descr`, `type`, `encoded`, `removed`) VALUES
(1, 'Coca Cola', 'Softdrink', 'NON-PERISHABLE', '2018-05-25 16:05:26', 0),
(2, 'French Fries', 'Potato French Fries', 'PERISHABLE', '2018-05-29 13:43:45', 0),
(3, 'Burger Patty', 'Beef burger patty', 'PERISHABLE', '2018-05-29 13:44:08', 0),
(4, 'Burger Bun', 'Bread burger bun', 'PERISHABLE', '2018-05-29 13:44:29', 0),
(5, 'Sprite', 'Transparent soda', 'NON-PERISHABLE', '2018-05-29 13:45:22', 0),
(6, 'Lettuce', 'Lettuce leaves', 'PERISHABLE', '2018-05-29 13:45:55', 0),
(7, 'Cheese slice', 'Yellow cheese slice', 'PERISHABLE', '2018-05-29 13:46:20', 0),
(8, 'Tomato', 'Sliced tomato', 'PERISHABLE', '2018-05-29 13:46:51', 0),
(9, 'Cheese Powder', 'Fries cheese flavoring', 'NON-PERISHABLE', '2018-05-29 13:47:31', 0),
(10, 'Barbecue Powder', 'Burger bbq flavoring', 'NON-PERISHABLE', '2018-05-29 13:48:11', 0),
(11, 'Iced Tea Powder', 'Nestea iced tea powder', 'NON-PERISHABLE', '2018-05-29 13:49:47', 0),
(12, 'Cup of Rice', 'Tonner banay banay not NFA', 'PERISHABLE', '2018-05-29 16:44:36', 0),
(13, 'Fried Chicken Cuts', 'Can be thigh, wings, drumsticks, breasts', 'PERISHABLE', '2018-05-29 16:46:28', 0),
(14, 'Square Tables', 'Tables for customer use', 'EQUIPMENT', '2018-07-06 11:04:52', 0),
(15, 'Chairs', 'Chairs for customer use', 'EQUIPMENT', '2018-07-06 11:05:13', 0);

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
(1000510, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S6', '2018-06-20 14:33:55'),
(1000511, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-20 15:18:29'),
(1000512, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-21 13:28:02'),
(1000513, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-22 11:24:38'),
(1000514, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-22 13:41:52'),
(1000515, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-22 14:30:35'),
(1000516, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-22 17:57:49'),
(1000517, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-25 14:09:44'),
(1000518, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-25 16:48:59'),
(1000519, 'TORRES, JIK', 'Add', 'New%20discount%20added:%20Senior%20Citizen%2020', '2018-06-25 17:39:03'),
(1000520, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-26 14:43:57'),
(1000521, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S13', '2018-06-26 16:41:41'),
(1000522, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S14', '2018-06-26 16:42:10'),
(1000523, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S15', '2018-06-26 16:43:37'),
(1000524, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-27 11:26:26'),
(1000525, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-27 12:30:39'),
(1000526, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-27 17:05:45'),
(1000527, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-27 17:31:11'),
(1000528, 'TORRES, JIK', 'Update', 'Discount%20updated%20Dundefined:%20Senior%20Citizen%2020%20to%20Senior%20Citizen%2020', '2018-06-27 18:53:24'),
(1000529, 'TORRES, JIK', 'Update', 'Discount%20updated%20Dundefined:%20Senior%20Citizen%2020%20to%20Senior%20Citizen%2020', '2018-06-27 19:04:50'),
(1000530, 'TORRES, JIK', 'Update', 'Discount%20updated%20Dundefined:%20Senior%20Citizen%2020%20to%20Senior%20Citizen%2020', '2018-06-27 19:05:00'),
(1000531, 'TORRES, JIK', 'Update', 'Discount%20updated%20Dundefined:%20Senior%20Citizen%2020%20to%20Senior%20Citizen%2020', '2018-06-27 19:05:16'),
(1000532, 'TORRES, JIK', 'Update', 'Discount%20updated%20Dundefined:%20Senior%20Citizen%2020%20to%20Senior%20Citizen%2020', '2018-06-27 19:05:25'),
(1000533, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S18', '2018-06-27 19:33:25'),
(1000534, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S18', '2018-06-27 19:36:25'),
(1000535, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S18', '2018-06-27 19:36:47'),
(1000536, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S18', '2018-06-27 19:37:06'),
(1000537, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S20', '2018-06-27 19:43:37'),
(1000538, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-28 10:26:18'),
(1000539, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S21', '2018-06-28 10:27:05'),
(1000540, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-28 11:23:38'),
(1000541, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S20', '2018-06-28 11:31:27'),
(1000542, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S16', '2018-06-28 11:56:26'),
(1000543, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S17', '2018-06-28 11:57:56'),
(1000544, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S17', '2018-06-28 11:58:39'),
(1000545, 'TORRES, JIK', 'Delete', 'Transaction%20detail%20package%20voided%20T19:%20G3', '2018-06-28 14:24:44'),
(1000546, 'TORRES, JIK', 'Delete', 'Transaction%20detail%20package%20voided%20T19:%20G2', '2018-06-28 14:24:54'),
(1000547, 'TORRES, JIK', 'Delete', 'Transaction%20detail%20product%20voided%20T19:%20P4', '2018-06-28 14:44:08'),
(1000548, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-06-28 14:46:28'),
(1000549, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-28 14:47:11'),
(1000550, ', ', 'Logout', 'System user logout as Staff', '2018-06-28 14:51:53'),
(1000551, 'TORRES, JIK', 'Delete', 'Transaction%20detail%20product%20voided%20T20:%20P6', '2018-06-28 14:56:16'),
(1000552, 'TORRES, JIK', 'Delete', 'Transaction%20detail%20product%20voided%20T20:%20P5', '2018-06-28 14:56:27'),
(1000553, 'TORRES, JIK', 'Delete', 'Transaction%20detail%20package%20voided%20T24:%20G2', '2018-06-28 15:02:19'),
(1000554, 'TORRES, JIK', 'Delete', 'Transaction%20detail%20product%20voided%20T25:%20P1', '2018-06-28 15:02:34'),
(1000555, 'TORRES, JIK', 'Delete', 'Transaction%20detail%20package%20voided%20T25:%20G3', '2018-06-28 15:02:39'),
(1000556, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S26', '2018-06-28 15:11:02'),
(1000557, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S26', '2018-06-28 15:11:47'),
(1000558, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-28 18:09:06'),
(1000559, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S29', '2018-06-28 18:13:51'),
(1000560, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-28 18:28:31'),
(1000561, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-29 09:18:40'),
(1000562, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-29 10:22:56'),
(1000563, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-29 13:34:10'),
(1000564, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-29 13:39:05'),
(1000565, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-06-29 18:44:56'),
(1000566, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-02 09:44:55'),
(1000567, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-02 19:21:10'),
(1000568, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-02 19:54:02'),
(1000569, 'TORRES, JIK', 'Delete', 'Transaction%20has%20been%20cancelled', '2018-07-02 20:03:22'),
(1000570, 'TORRES, JIK', 'Delete', 'Transaction%20has%20been%20cancelled', '2018-07-02 20:07:22'),
(1000571, 'TORRES, JIK', 'Delete', 'Transaction%20has%20been%20cancelled', '2018-07-02 20:07:47'),
(1000572, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-02 20:26:04'),
(1000573, 'TORRES, JIK', 'Add', 'New%20table%20added:%20sample', '2018-07-02 20:26:11'),
(1000574, 'TORRES, JIK', 'Add', 'New%20table%20added:%20sample2', '2018-07-02 20:26:16'),
(1000575, 'TORRES, JIK', 'Add', 'New%20table%20added:%20sample3', '2018-07-02 20:26:20'),
(1000576, 'TORRES, JIK', 'Add', 'New%20table%20added:%20sample4', '2018-07-02 20:26:24'),
(1000577, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-03 13:22:26'),
(1000578, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-03 18:25:17'),
(1000579, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-03 18:42:06'),
(1000580, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-04 11:23:05'),
(1000581, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S78', '2018-07-04 11:44:12'),
(1000582, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S77', '2018-07-04 11:44:22'),
(1000583, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S76', '2018-07-04 11:44:32'),
(1000584, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S75', '2018-07-04 11:46:48'),
(1000585, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S74', '2018-07-04 11:47:01'),
(1000586, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S73', '2018-07-04 11:47:12'),
(1000587, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S72', '2018-07-04 11:47:28'),
(1000588, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S71', '2018-07-04 11:47:51'),
(1000589, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S70', '2018-07-04 11:48:01'),
(1000590, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S69', '2018-07-04 11:48:38'),
(1000591, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S68', '2018-07-04 11:48:48'),
(1000592, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S67', '2018-07-04 11:49:54'),
(1000593, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S66', '2018-07-04 12:38:54'),
(1000594, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S65', '2018-07-04 12:39:26'),
(1000595, 'TORRES, JIK', 'Update', 'Product%20updated%20P10:%20Chicken%20Rice%20Meal%20to%20Chicken%20Rice%20Meal', '2018-07-04 14:03:24'),
(1000596, 'TORRES, JIK', 'Update', 'Product%20updated%20P9:%20Extra%20Large%20Fries%20to%20Extra%20Large%20Fries', '2018-07-04 14:16:46'),
(1000597, 'TORRES, JIK', 'Update', 'Product%20updated%20P8:%20Mix%20Fries%20to%20Mix%20Fries', '2018-07-04 14:17:06'),
(1000598, 'TORRES, JIK', 'Update', 'Product%20updated%20P7:%20Double%20Cheese%20Burger%20to%20Double%20Cheese%20Burger', '2018-07-04 14:26:23'),
(1000599, 'TORRES, JIK', 'Update', 'Product%20updated%20P5:%20Cheesy%20Fries%20to%20Cheesy%20Fries', '2018-07-04 14:26:37'),
(1000600, 'TORRES, JIK', 'Update', 'Product%20updated%20P5:%20Cheesy%20Fries%20to%20Cheesy%20Fries', '2018-07-04 14:27:02'),
(1000601, 'TORRES, JIK', 'Update', 'Product%20updated%20P6:%20Barbecue%20Fries%20to%20Barbecue%20Fries', '2018-07-04 14:27:13'),
(1000602, 'TORRES, JIK', 'Update', 'Product%20updated%20P4:%20Sprite%20in%20Can%20to%20Sprite%20in%20Can', '2018-07-04 14:27:29'),
(1000603, 'TORRES, JIK', 'Update', 'Product%20updated%20P3:%20Cheese%20Burger%20to%20Cheese%20Burger', '2018-07-04 14:27:49'),
(1000604, 'TORRES, JIK', 'Update', 'Product%20updated%20P2:%20Iced%20Tea%20Pitcher%20to%20Iced%20Tea%20Pitcher', '2018-07-04 14:28:08'),
(1000605, 'TORRES, JIK', 'Update', 'Product%20updated%20P1:%20Coca%20Cola%20to%20Coca%20Cola', '2018-07-04 14:28:19'),
(1000606, 'TORRES, JIK', 'Update', 'Product%20updated%20P9:%20Extra%20Large%20Fries%20to%20Extra%20Large%20Fries', '2018-07-04 14:29:07'),
(1000607, 'TORRES, JIK', 'Update', 'Product%20updated%20P9:%20Extra%20Large%20Fries%20to%20Extra%20Large%20Fries', '2018-07-04 14:29:12'),
(1000608, 'TORRES, JIK', 'Update', 'Product%20updated%20P1:%20Coca%20Cola%20to%20Coca%20Cola', '2018-07-04 15:18:00'),
(1000609, 'TORRES, JIK', 'Add', 'New%20product%20added:%20Plain%20Rice', '2018-07-04 15:30:44'),
(1000610, 'TORRES, JIK', 'Add', 'New%20product%20item%20added:%2012', '2018-07-04 15:40:34'),
(1000611, 'TORRES, JIK', 'Update', 'Package%20updated%20G3:%20Barkada%20Package%20to%20Barkada%20Package', '2018-07-04 16:12:50'),
(1000612, 'TORRES, JIK', 'Update', 'Package%20updated%20G2:%20Family%20Bundle%202%20to%20Family%20Bundle%202', '2018-07-04 16:13:14'),
(1000613, 'TORRES, JIK', 'Update', 'Package%20updated%20G1:%20Family%20Bundle%201%20to%20Family%20Bundle%201', '2018-07-04 16:13:36'),
(1000614, 'TORRES, JIK', 'Update', 'Package%20updated%20G1:%20Family%20Bundle%201%20to%20Family%20Bundle%201', '2018-07-04 16:15:38'),
(1000615, 'TORRES, JIK', 'Update', 'Package%20updated%20G1:%20Family%20Bundle%201%20to%20Family%20Bundle%201', '2018-07-04 16:15:55'),
(1000616, 'TORRES, JIK', 'Update', 'Package%20updated%20G1:%20Family%20Bundle%201%20to%20Family%20Bundle%201', '2018-07-04 16:16:06'),
(1000617, 'TORRES, JIK', 'Add', 'New%20package%20added:%20Lechon%20Bundle%201', '2018-07-04 16:18:35'),
(1000618, 'TORRES, JIK', 'Update', 'Package%20updated%20G4:%20Lechon%20Bundle%201%20to%20Lechon%20Bundle%201', '2018-07-04 16:19:37'),
(1000619, 'TORRES, JIK', 'Update', 'Package%20updated%20G4:%20Lechon%20Bundle%201%20to%20Lechon%20Bundle%201', '2018-07-04 16:19:48'),
(1000620, 'TORRES, JIK', 'Update', 'Table%20updated%20T1:%20Square%20Table%201%20to%20Table', '2018-07-04 16:43:32'),
(1000621, 'TORRES, JIK', 'Update', 'Table%20updated%20T2:%20Square%20Table%202%20to%20Table', '2018-07-04 16:43:44'),
(1000622, 'TORRES, JIK', 'Update', 'Table%20updated%20T3:%20Circle%20Table%201%20to%20Table', '2018-07-04 16:43:55'),
(1000623, 'TORRES, JIK', 'Update', 'Table%20updated%20T4:%20Circle%20Table%202%20to%20Table', '2018-07-04 16:44:04'),
(1000624, 'TORRES, JIK', 'Update', 'Table%20updated%20T5:%20Circle%20Table%203%20to%20Table', '2018-07-04 16:44:13'),
(1000625, 'TORRES, JIK', 'Update', 'Table%20updated%20T6:%20Circle%20Table%204%20to%20Table', '2018-07-04 16:44:24'),
(1000626, 'TORRES, JIK', 'Update', 'Table%20updated%20T7:%20Circle%20Table%205%20to%20Table', '2018-07-04 16:44:32'),
(1000627, 'TORRES, JIK', 'Update', 'Table%20updated%20T8:%20Circle%20Table%206%20to%20Table', '2018-07-04 16:44:41'),
(1000628, 'TORRES, JIK', 'Update', 'Table%20updated%20T9:%20Circle%20Table%207%20to%20Table', '2018-07-04 16:44:50'),
(1000629, 'TORRES, JIK', 'Update', 'Table%20updated%20T10:%20Circle%20Table%208%20to%20Table', '2018-07-04 16:44:59'),
(1000630, 'TORRES, JIK', 'Update', 'Table%20updated%20T11:%20Circle%20Table%209%20to%20Table', '2018-07-04 16:45:53'),
(1000631, 'TORRES, JIK', 'Update', 'Table%20updated%20T12:%20sample%20to%20Table', '2018-07-04 16:46:02'),
(1000632, 'TORRES, JIK', 'Update', 'Table%20updated%20T13:%20sample2%20to%20Table', '2018-07-04 16:46:15'),
(1000633, 'TORRES, JIK', 'Update', 'Table%20updated%20T14:%20sample3%20to%20Table', '2018-07-04 16:46:26'),
(1000634, 'TORRES, JIK', 'Update', 'Table%20updated%20T15:%20sample4%20to%20Table', '2018-07-04 16:46:34'),
(1000635, 'TORRES, JIK', 'Update', 'Table%20updated%20T12:%20Table', '2018-07-04 16:46:50'),
(1000636, 'TORRES, JIK', 'Update', 'Table%20updated%20T14:%20Table', '2018-07-04 16:46:55'),
(1000637, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-04 16:53:38'),
(1000638, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-04 19:33:41'),
(1000639, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-04 19:33:51'),
(1000640, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-04 19:33:55'),
(1000641, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-04 19:34:30'),
(1000642, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-04 19:36:24'),
(1000643, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-04 19:36:28'),
(1000644, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-04 19:36:33'),
(1000645, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-05 09:12:17'),
(1000646, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-05 09:13:36'),
(1000647, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-05 09:13:45'),
(1000648, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-05 09:13:49'),
(1000649, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-05 09:13:54'),
(1000650, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-05 09:14:07'),
(1000651, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-05 09:14:22'),
(1000652, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-05 09:14:27'),
(1000653, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-05 11:46:06'),
(1000654, 'TORRES, JIK', 'Add', 'New%20product%20discount%20added:%20P6', '2018-07-05 19:40:33'),
(1000655, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P6', '2018-07-05 19:41:28'),
(1000656, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P6', '2018-07-05 19:41:36'),
(1000657, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P6', '2018-07-05 19:46:41'),
(1000658, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P6', '2018-07-05 19:46:54'),
(1000659, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P6', '2018-07-05 19:47:05'),
(1000660, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P6', '2018-07-05 19:47:17'),
(1000661, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P6', '2018-07-05 19:47:26'),
(1000662, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P6', '2018-07-05 19:47:44'),
(1000663, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P6', '2018-07-05 19:47:52'),
(1000664, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P6', '2018-07-05 19:48:10'),
(1000665, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P6', '2018-07-05 19:48:19'),
(1000666, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P6', '2018-07-05 19:49:14'),
(1000667, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P6', '2018-07-05 19:49:30'),
(1000668, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P6', '2018-07-05 19:49:46'),
(1000669, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-06 09:26:34'),
(1000670, 'TORRES, JIK', 'Add', 'New%20item%20added:%20Square%20Tables', '2018-07-06 11:04:52'),
(1000671, 'TORRES, JIK', 'Add', 'New%20item%20added:%20Chairs', '2018-07-06 11:05:13'),
(1000672, 'TORRES, JIK', 'Update', 'Item%20updated%20I13:%20Fried%20Chicken%20Cuts%20to%20Fried%20Chicken%20Cuts', '2018-07-06 11:06:32'),
(1000673, 'TORRES, JIK', 'Update', 'Item%20updated%20I12:%20Cup%20of%20Rice%20to%20Cup%20of%20Rice', '2018-07-06 11:06:40'),
(1000674, 'TORRES, JIK', 'Update', 'Item%20updated%20I11:%20Iced%20Tea%20Powder%20to%20Iced%20Tea%20Powder', '2018-07-06 11:06:44'),
(1000675, 'TORRES, JIK', 'Update', 'Item%20updated%20I11:%20Iced%20Tea%20Powder%20to%20Iced%20Tea%20Powder', '2018-07-06 11:06:56'),
(1000676, 'TORRES, JIK', 'Update', 'Item%20updated%20I10:%20Barbecue%20Powder%20to%20Barbecue%20Powder', '2018-07-06 11:07:06'),
(1000677, 'TORRES, JIK', 'Update', 'Item%20updated%20I9:%20Cheese%20Powder%20to%20Cheese%20Powder', '2018-07-06 11:07:10'),
(1000678, 'TORRES, JIK', 'Update', 'Item%20updated%20I8:%20Tomato%20to%20Tomato', '2018-07-06 11:07:16'),
(1000679, 'TORRES, JIK', 'Update', 'Item%20updated%20I7:%20Cheese%20slice%20to%20Cheese%20slice', '2018-07-06 11:07:24'),
(1000680, 'TORRES, JIK', 'Update', 'Item%20updated%20I6:%20Lettuce%20to%20Lettuce', '2018-07-06 11:07:36'),
(1000681, 'TORRES, JIK', 'Update', 'Item%20updated%20I5:%20Sprite%20to%20Sprite', '2018-07-06 11:09:28'),
(1000682, 'TORRES, JIK', 'Update', 'Item%20updated%20I4:%20Burger%20Bun%20to%20Burger%20Bun', '2018-07-06 11:09:33'),
(1000683, 'TORRES, JIK', 'Update', 'Item%20updated%20I3:%20Burger%20Patty%20to%20Burger%20Patty', '2018-07-06 11:09:38'),
(1000684, 'TORRES, JIK', 'Update', 'Item%20updated%20I2:%20French%20Fries%20to%20French%20Fries', '2018-07-06 11:09:43'),
(1000685, 'TORRES, JIK', 'Update', 'Item%20updated%20I1:%20Coca%20Cola%20to%20Coca%20Cola', '2018-07-06 11:09:47'),
(1000686, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-06 14:10:32'),
(1000687, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-06 17:34:58'),
(1000688, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-06 17:42:11'),
(1000689, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-06 17:42:18'),
(1000690, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P6', '2018-07-06 17:43:20'),
(1000691, 'TORRES, JIK', 'Add', 'New%20package%20discount%20added:%20Gundefined', '2018-07-06 18:24:59'),
(1000692, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P6', '2018-07-06 19:43:34'),
(1000693, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P6', '2018-07-06 19:44:19'),
(1000694, 'TORRES, JIK', 'Update', 'Package%20discount%20updated%20Gundefined', '2018-07-06 19:45:38'),
(1000695, 'TORRES, JIK', 'Update', 'Package%20discount%20updated%20Gundefined', '2018-07-06 19:46:38'),
(1000696, 'TORRES, JIK', 'Update', 'Package%20discount%20updated%20Gundefined', '2018-07-06 19:46:53'),
(1000697, 'TORRES, JIK', 'Update', 'Package%20discount%20updated%20Gundefined', '2018-07-06 19:47:05'),
(1000698, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P6', '2018-07-06 20:06:56'),
(1000699, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P6', '2018-07-06 20:07:17'),
(1000700, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-09 10:26:09'),
(1000701, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-09 12:42:23'),
(1000702, 'TORRES, JIK', 'Update', 'Discount%20updated%20Dundefined:%20Senior%20Citizen%2020%20to%20SC%2020', '2018-07-09 12:43:13'),
(1000703, 'TORRES, JIK', 'Add', 'New%20discount%20added:%20PWD%20Discount%2020', '2018-07-09 13:00:09'),
(1000704, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-09 17:21:02'),
(1000705, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-09 17:22:05'),
(1000706, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-09 17:31:47'),
(1000707, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-09 17:31:50'),
(1000708, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-09 17:31:54'),
(1000709, 'TORRES, JIK', 'Delete', 'Transaction%20has%20been%20cancelled', '2018-07-09 18:59:52'),
(1000710, 'TORRES, JIK', 'Delete', 'Transaction%20has%20been%20cancelled', '2018-07-09 19:01:12'),
(1000711, 'TORRES, JIK', 'Delete', 'Transaction%20detail%20product%20voided%20T85:%20P3', '2018-07-09 19:15:19'),
(1000712, 'TORRES, JIK', 'Delete', 'Transaction%20has%20been%20cancelled', '2018-07-09 19:16:19'),
(1000713, 'TORRES, JIK', 'Delete', 'Transaction%20detail%20product%20voided%20T84:%20P13', '2018-07-09 19:29:01'),
(1000714, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-10 10:54:22'),
(1000715, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-10 14:16:28'),
(1000716, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-10 15:56:16'),
(1000717, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-10 15:57:43'),
(1000718, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-10 15:58:19'),
(1000719, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-11 09:05:48'),
(1000720, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S91', '2018-07-11 19:16:24'),
(1000721, 'TORRES, JIK', 'Update', 'Product%20updated%20P13:%20Plain%20Rice%20to%20Plain%20Rice', '2018-07-11 19:16:33'),
(1000722, 'TORRES, JIK', 'Update', 'Product%20updated%20P10:%20Chicken%20Rice%20Meal%20to%20Chicken%20Rice%20Meal', '2018-07-11 19:16:36'),
(1000723, 'TORRES, JIK', 'Update', 'Product%20updated%20P13:%20Plain%20Rice%20to%20Plain%20Rice', '2018-07-11 19:18:02'),
(1000724, 'TORRES, JIK', 'Update', 'Product%20updated%20P13:%20Plain%20Rice%20to%20Plain%20Rice', '2018-07-11 19:18:07'),
(1000725, 'TORRES, JIK', 'Update', 'Category%20updated%20C2:%20Dessert%20to%20Dessert', '2018-07-11 19:19:26'),
(1000726, 'TORRES, JIK', 'Update', 'Category%20updated%20C1:%20Drinks%20to%20Drinks', '2018-07-11 19:20:07'),
(1000727, 'TORRES, JIK', 'Add', 'New%20product%20discount%20added:%20P1', '2018-07-11 19:20:38'),
(1000728, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-11 19:48:28'),
(1000729, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-12 09:12:40'),
(1000730, 'TORRES, JIK', 'Delete', 'Transaction%20has%20been%20cancelled', '2018-07-12 11:44:28'),
(1000731, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S83', '2018-07-12 11:50:03'),
(1000732, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S83', '2018-07-12 11:50:28'),
(1000733, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S91', '2018-07-12 12:50:55'),
(1000734, 'TORRES, JIK', 'Add', 'New%20product%20discount%20added:%20P10', '2018-07-12 15:07:11'),
(1000735, 'TORRES, JIK', 'Update', 'Product%20discount%20updated%20P10', '2018-07-12 15:07:38'),
(1000736, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-12 17:21:27'),
(1000737, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-12 17:35:29'),
(1000738, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-13 09:31:26'),
(1000739, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-13 11:02:37'),
(1000740, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-13 14:10:08'),
(1000741, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S91', '2018-07-13 17:33:49'),
(1000742, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S83', '2018-07-13 17:34:05'),
(1000743, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-13 18:23:42'),
(1000744, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S82', '2018-07-13 18:26:22'),
(1000745, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S81', '2018-07-13 18:32:49'),
(1000746, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S80', '2018-07-13 18:33:22'),
(1000747, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S64', '2018-07-13 18:33:41'),
(1000748, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S64', '2018-07-13 18:35:14'),
(1000749, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S64', '2018-07-13 18:36:27'),
(1000750, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S64', '2018-07-13 18:36:48'),
(1000751, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S64', '2018-07-13 18:37:06'),
(1000752, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S64', '2018-07-13 18:40:06'),
(1000753, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S63', '2018-07-13 18:42:51'),
(1000754, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S79', '2018-07-13 18:43:18'),
(1000755, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S61', '2018-07-13 18:43:32'),
(1000756, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S60', '2018-07-13 18:44:04'),
(1000757, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S62', '2018-07-13 18:44:27'),
(1000758, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S58', '2018-07-13 18:44:50'),
(1000759, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S56', '2018-07-13 18:45:00'),
(1000760, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S53', '2018-07-13 18:45:12'),
(1000761, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S51', '2018-07-13 18:45:39'),
(1000762, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S52', '2018-07-13 18:45:49'),
(1000763, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S50', '2018-07-13 18:45:57'),
(1000764, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S54', '2018-07-13 18:46:08'),
(1000765, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S46', '2018-07-13 18:46:20'),
(1000766, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S47', '2018-07-13 18:46:30'),
(1000767, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S44', '2018-07-13 18:46:39'),
(1000768, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S43', '2018-07-13 18:46:49'),
(1000769, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S42', '2018-07-13 18:46:58'),
(1000770, 'TORRES, JIK', 'Delete', 'Transaction%20has%20been%20cancelled', '2018-07-13 18:49:51'),
(1000771, 'TORRES, JIK', 'Delete', 'Transaction%20has%20been%20cancelled', '2018-07-13 18:50:48'),
(1000772, 'TORRES, JIK', 'Delete', 'Transaction%20has%20been%20cancelled', '2018-07-13 18:51:12'),
(1000773, 'TORRES, JIK', 'Delete', 'Transaction%20has%20been%20cancelled', '2018-07-13 18:52:11'),
(1000774, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S59', '2018-07-13 18:52:21'),
(1000775, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S39', '2018-07-13 18:52:32'),
(1000776, 'TORRES, JIK', 'Delete', 'Transaction%20has%20been%20cancelled', '2018-07-13 18:52:47'),
(1000777, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-13 21:29:52'),
(1000778, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-13 22:12:40'),
(1000779, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-13 22:49:24'),
(1000780, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S100', '2018-07-13 23:06:18'),
(1000781, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S55', '2018-07-13 23:08:53'),
(1000782, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S38', '2018-07-13 23:09:26'),
(1000783, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-13 23:32:23'),
(1000784, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S105', '2018-07-19 23:25:19'),
(1000785, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S102', '2018-07-19 23:25:30'),
(1000786, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S101', '2018-07-19 23:25:41'),
(1000787, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S35', '2018-07-19 23:25:48'),
(1000788, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S33', '2018-07-19 23:25:58'),
(1000789, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S32', '2018-07-19 23:26:10'),
(1000790, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S31', '2018-07-19 23:26:20'),
(1000791, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S30', '2018-07-19 23:26:32'),
(1000792, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S27', '2018-07-19 23:26:46'),
(1000793, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S22', '2018-07-19 23:27:02'),
(1000794, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S20', '2018-07-19 23:27:25'),
(1000795, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S19', '2018-07-19 23:27:57'),
(1000796, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S106', '2018-07-19 23:33:53'),
(1000797, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S107', '2018-07-19 23:34:37'),
(1000798, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S107', '2018-07-19 23:34:53'),
(1000799, 'TORRES, JIK', 'Report', 'Dashboard%20Daily%20Report%20Generated', '2018-07-19 23:35:54'),
(1000800, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-20 09:13:14'),
(1000801, 'TORRES, JIK', 'Report', 'Dashboard%20Daily%20Report%20Generated', '2018-07-20 09:36:55'),
(1000802, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-23 09:43:26'),
(1000803, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-23 11:16:03'),
(1000804, 'TORRES, JIK', 'Report', 'Products%20Report%20Generated', '2018-07-23 11:30:49'),
(1000805, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-23 13:57:08'),
(1000806, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-23 15:31:46'),
(1000807, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-23 17:17:27'),
(1000808, 'TORRES, JIK', 'Report', 'Products%20Report%20Generated', '2018-07-23 17:18:55'),
(1000809, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-23 19:02:41'),
(1000810, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-23 19:03:33'),
(1000811, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S108', '2018-07-23 19:21:19'),
(1000812, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S110', '2018-07-23 19:28:29'),
(1000813, 'TORRES, JIK', 'Report', 'Products%20Report%20Generated', '2018-07-23 19:40:08'),
(1000814, 'TORRES, JIK', 'Add', 'New%20user%20added:%20as', '2018-07-23 19:55:06'),
(1000815, 'TORRES, JIK', 'Delete', 'User%20record%20deleted', '2018-07-23 19:55:22'),
(1000816, 'TORRES, JIK', 'Report', 'Dashboard%20Daily%20Report%20Generated', '2018-07-23 20:11:12'),
(1000817, 'TORRES, JIK', 'Report', 'Products%20Report%20Generated', '2018-07-23 20:16:14'),
(1000818, 'TORRES, JIK', 'Report', 'Dashboard%20Daily%20Report%20Generated', '2018-07-23 20:17:31'),
(1000819, 'TORRES, JIK', 'Report', 'Products%20Report%20Generated', '2018-07-23 20:17:50'),
(1000820, 'TORRES, JIK', 'Report', 'Products%20Report%20Generated', '2018-07-23 20:18:26'),
(1000821, 'TORRES, JIK', 'Report', 'Products%20Report%20Generated', '2018-07-23 20:22:20'),
(1000822, 'TORRES, JIK', 'Report', 'Products%20Report%20Generated', '2018-07-23 20:23:03'),
(1000823, 'TORRES, JIK', 'Report', 'Products%20Report%20Generated', '2018-07-23 20:23:23'),
(1000824, 'TORRES, JIK', 'Report', 'Packages%20Report%20Generated', '2018-07-23 20:25:35'),
(1000825, 'TORRES, JIK', 'Report', 'Products%20Report%20Generated', '2018-07-23 20:37:00'),
(1000826, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-24 12:39:45'),
(1000827, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U109', '2018-07-24 12:53:19'),
(1000828, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U109', '2018-07-24 12:53:24'),
(1000829, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U109', '2018-07-24 12:53:29'),
(1000830, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U109', '2018-07-24 12:53:33'),
(1000831, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U109', '2018-07-24 12:53:40'),
(1000832, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U109', '2018-07-24 12:53:44'),
(1000833, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U109', '2018-07-24 12:53:57'),
(1000834, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U109', '2018-07-24 12:54:05'),
(1000835, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U108', '2018-07-24 12:54:14'),
(1000836, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U108', '2018-07-24 12:54:19'),
(1000837, 'TORRES, JIK', 'Add', 'New%20user%20added:%20janedoe', '2018-07-24 12:55:08'),
(1000838, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U111', '2018-07-24 12:55:17'),
(1000839, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U111', '2018-07-24 12:55:24'),
(1000840, 'TORRES, JIK', 'Report', 'Dashboard%20Daily%20Report%20Generated', '2018-07-24 13:03:28'),
(1000841, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-24 14:02:47'),
(1000842, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-24 14:03:53'),
(1000843, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-25 09:25:39'),
(1000844, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-25 11:27:37'),
(1000845, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-25 11:27:57'),
(1000846, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-25 11:28:12'),
(1000847, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-25 11:30:44'),
(1000848, 'TORRES, JIK', 'Update', 'Store%20config%20updated', '2018-07-25 11:30:52'),
(1000849, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U111', '2018-07-25 11:39:20'),
(1000850, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U111', '2018-07-25 11:39:29'),
(1000851, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U109', '2018-07-25 11:42:57'),
(1000852, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U111', '2018-07-25 11:44:59'),
(1000853, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U111', '2018-07-25 11:45:03'),
(1000854, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U111', '2018-07-25 11:45:11'),
(1000855, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U111', '2018-07-25 11:47:04'),
(1000856, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U111', '2018-07-25 11:47:10'),
(1000857, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U111', '2018-07-25 11:47:16'),
(1000858, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U111', '2018-07-25 11:47:23'),
(1000859, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U109', '2018-07-25 11:47:29'),
(1000860, 'TORRES, JIK', 'Update', 'User%20record%20updated%20U109', '2018-07-25 11:47:33'),
(1000861, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-07-25 11:48:38'),
(1000862, 'n/a, n/a', 'Login', 'System user login as Administrator', '2018-07-25 11:48:50'),
(1000863, 'n/a, n/a', 'Logout', 'System user logout as Administrator', '2018-07-25 11:49:35'),
(1000864, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-25 11:49:37'),
(1000865, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-07-25 11:57:08'),
(1000866, 'Ford, Xander', 'Login', 'System user login as Staff', '2018-07-25 11:57:15'),
(1000867, 'Ford, Xander', 'Logout', 'System user logout as Staff', '2018-07-25 11:58:20'),
(1000868, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-25 12:05:12'),
(1000869, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-07-25 12:05:17'),
(1000870, 'Ford, Xander', 'Login', 'System user login as Staff', '2018-07-25 12:05:25'),
(1000871, 'Ford, Xander', 'Logout', 'System user logout as Staff', '2018-07-25 12:05:35'),
(1000872, 'DOE, JANE', 'Login', 'System user login as Staff', '2018-07-25 12:05:42'),
(1000873, 'DOE, JANE', 'Logout', 'System user logout as Staff', '2018-07-25 12:44:00'),
(1000874, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-25 12:44:01'),
(1000875, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-07-25 12:44:16'),
(1000876, 'DOE, JANE', 'Login', 'System user login as Staff', '2018-07-25 12:44:26'),
(1000877, 'DOE, JANE', 'Logout', 'System user logout as Staff', '2018-07-25 12:46:42'),
(1000878, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-25 12:46:43'),
(1000879, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-07-25 12:48:02'),
(1000880, 'DOE, JANE', 'Login', 'System user login as Staff', '2018-07-25 12:48:10'),
(1000881, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-25 12:49:37'),
(1000882, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-07-25 12:53:26'),
(1000883, 'DOE, JANE', 'Login', 'System user login as Staff', '2018-07-25 12:53:39'),
(1000884, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-25 12:53:49'),
(1000885, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-07-25 12:54:25'),
(1000886, 'DOE, JANE', 'Login', 'System user login as Staff', '2018-07-25 12:54:32'),
(1000887, 'DOE, JANE', 'Login', 'System user login as Staff', '2018-07-25 12:56:03'),
(1000888, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-25 12:56:26'),
(1000889, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-07-25 12:56:28'),
(1000890, 'DOE, JANE', 'Login', 'System user login as Staff', '2018-07-25 12:56:34'),
(1000891, 'DOE, JANE', 'Logout', 'System user logout as Staff', '2018-07-25 13:08:58'),
(1000892, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-25 13:09:01'),
(1000893, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-07-25 13:09:04'),
(1000894, 'DOE, JANE', 'Login', 'System user login as Staff', '2018-07-25 13:09:19'),
(1000895, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-25 13:28:25'),
(1000896, 'DOE, JANE', 'Logout', 'System user logout as Staff', '2018-07-25 14:02:01'),
(1000897, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-25 14:02:02'),
(1000898, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-07-25 14:09:29'),
(1000899, 'DOE, JANE', 'Login', 'System user login as Staff', '2018-07-25 14:09:37'),
(1000900, 'DOE, JANE', 'Logout', 'System user logout as Staff', '2018-07-25 14:09:44'),
(1000901, 'Ford, Xander', 'Login', 'System user login as Staff', '2018-07-25 14:09:50'),
(1000902, 'Ford, Xander', 'Logout', 'System user logout as Staff', '2018-07-25 14:10:03'),
(1000903, 'DOE, JANE', 'Login', 'System user login as Staff', '2018-07-25 14:10:11'),
(1000904, 'DOE, JANE', 'Logout', 'System user logout as Staff', '2018-07-25 14:36:04'),
(1000905, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-25 14:36:06'),
(1000906, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-25 17:44:02'),
(1000907, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-25 17:47:14'),
(1000908, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-26 09:12:19'),
(1000909, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-26 13:09:37'),
(1000910, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-27 10:01:17'),
(1000911, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-27 20:51:46'),
(1000912, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-29 22:33:24'),
(1000913, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-29 22:33:45'),
(1000914, 'TORRES, JIK', 'Report', 'Dashboard%20Daily%20Report%20Generated', '2018-07-29 22:34:59'),
(1000915, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-30 09:09:12'),
(1000916, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-30 14:58:43'),
(1000917, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-30 22:35:19'),
(1000918, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-30 22:35:52'),
(1000919, 'TORRES, JIK', 'Report', 'S-Reading%20printed%20successfully', '2018-07-30 22:54:16'),
(1000920, 'TORRES, JIK', 'Report', 'S-Reading%20printed%20successfully', '2018-07-30 22:55:47'),
(1000921, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S109', '2018-07-30 22:56:21'),
(1000922, 'TORRES, JIK', 'Report', 'S-Reading%20printed%20successfully', '2018-07-30 22:56:35'),
(1000923, 'TORRES, JIK', 'Report', 'S-Reading%20printed%20successfully', '2018-07-30 22:58:44'),
(1000924, 'TORRES, JIK', 'Report', 'S-Reading%20printed%20successfully', '2018-07-30 23:01:57'),
(1000925, 'TORRES, JIK', 'Report', 'S-Reading%20printed%20successfully', '2018-07-30 23:05:28'),
(1000926, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S121', '2018-07-30 23:25:50'),
(1000927, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S121', '2018-07-30 23:26:15'),
(1000928, 'TORRES, JIK', 'Report', 'S-Reading%20printed%20successfully', '2018-07-30 23:27:37'),
(1000929, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S122', '2018-07-30 23:29:30'),
(1000930, 'TORRES, JIK', 'Add', 'New%20transaction%20payment%20added:%20S122', '2018-07-30 23:30:07'),
(1000931, 'TORRES, JIK', 'Report', 'S-Reading%20printed%20successfully', '2018-07-30 23:31:01'),
(1000932, 'TORRES, JIK', 'Report', 'X-Reading%20printed%20successfully', '2018-07-30 23:40:26'),
(1000933, 'TORRES, JIK', 'Report', 'X-Reading%20printed%20successfully', '2018-07-30 23:43:19'),
(1000934, ', ', 'Report', 'Transactions%20Report%20Generated', '2018-07-31 14:23:42'),
(1000935, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-31 14:23:44'),
(1000936, 'TORRES, JIK', 'Report', 'Transactions%20Report%20Generated', '2018-07-31 14:23:50'),
(1000937, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-07-31 18:06:19'),
(1000938, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-08-01 09:15:32'),
(1000939, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-08-01 13:49:01'),
(1000940, 'TORRES, JIK', 'Report', 'Products%20Report%20Generated', '2018-08-01 13:49:57'),
(1000941, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-08-01 13:55:26'),
(1000942, 'TORRES, JIK', 'Report', 'Dashboard%20Daily%20Report%20Generated', '2018-08-01 13:55:28'),
(1000943, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S123', '2018-08-01 17:15:35'),
(1000944, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S123', '2018-08-01 17:15:57'),
(1000945, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S123', '2018-08-01 17:16:22'),
(1000946, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S123', '2018-08-01 17:16:35'),
(1000947, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S123', '2018-08-01 17:16:51'),
(1000948, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S123', '2018-08-01 17:17:42'),
(1000949, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S123', '2018-08-01 17:17:48'),
(1000950, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S123', '2018-08-01 17:18:03'),
(1000951, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S123', '2018-08-01 17:18:43');
INSERT INTO `logs` (`log_id`, `user_fullname`, `log_type`, `details`, `date_time`) VALUES
(1000952, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S123', '2018-08-01 17:30:50'),
(1000953, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S123', '2018-08-01 17:31:20'),
(1000954, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S123', '2018-08-01 17:33:20'),
(1000955, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S123', '2018-08-01 17:33:33'),
(1000956, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S123', '2018-08-01 17:58:05'),
(1000957, 'TORRES, JIK', 'Add', 'New%20transaction%20discount%20added:%20S123', '2018-08-01 17:58:15'),
(1000958, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-08-01 17:59:22'),
(1000959, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-08-02 09:10:23'),
(1000960, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-08-02 14:21:17'),
(1000961, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-08-02 15:01:01'),
(1000962, 'TORRES, JIK', 'Report', 'Transactions%20Report%20Generated', '2018-08-02 15:01:52'),
(1000963, 'TORRES, JIK', 'Report', 'Dashboard%20Daily%20Report%20Generated', '2018-08-02 15:01:59'),
(1000964, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-08-02 16:19:39'),
(1000965, 'Torres, Jiki', 'Login', 'System user login as Staff', '2018-08-02 16:19:47'),
(1000966, 'Torres, Jiki', 'Login', 'System user login as Staff', '2018-08-02 16:20:06'),
(1000967, 'Torres, Jiki', 'Login', 'System user login as Staff', '2018-08-02 16:20:22'),
(1000968, 'Ford, Xander', 'Login', 'System user login as Staff', '2018-08-02 16:21:04'),
(1000969, 'Ford, Xander', 'Logout', 'System user logout as Staff', '2018-08-02 16:21:18'),
(1000970, 'DOE, JANE', 'Login', 'System user login as Staff', '2018-08-02 16:21:27'),
(1000971, 'DOE, JANE', 'Logout', 'System user logout as Staff', '2018-08-02 16:22:24'),
(1000972, 'Torres, Jiki', 'Login', 'System user login as Staff', '2018-08-02 16:22:32'),
(1000973, 'Ford, Xander', 'Login', 'System user login as Staff', '2018-08-02 16:25:02'),
(1000974, 'Ford, Xander', 'Logout', 'System user logout as Staff', '2018-08-02 16:25:07'),
(1000975, 'Torres, Jiki', 'Login', 'System user login as Staff', '2018-08-02 16:25:17'),
(1000976, 'Torres, Jiki', 'Logout', 'System user logout as Staff', '2018-08-02 16:27:30'),
(1000977, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-08-02 16:27:31'),
(1000978, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-08-02 16:32:40'),
(1000979, 'Torres, Jiki', 'Login', 'System user login as Staff', '2018-08-02 16:32:55'),
(1000980, 'Torres, Jiki', 'Report', 'Packages%20Report%20Generated', '2018-08-02 16:53:44'),
(1000981, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-08-02 16:53:49'),
(1000982, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-08-02 16:53:53'),
(1000983, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-08-02 16:53:54'),
(1000984, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-08-02 16:54:51'),
(1000985, 'Torres, Jiki', 'Login', 'System user login as Staff', '2018-08-02 16:55:01'),
(1000986, 'Torres, Jiki', 'Report', 'Transactions%20Report%20Generated', '2018-08-02 16:57:10'),
(1000987, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-08-02 16:57:20'),
(1000988, 'TORRES, JIK', 'Report', 'Transactions%20Report%20Generated', '2018-08-02 16:58:37'),
(1000989, 'TORRES, JIK', 'Report', 'Transactions%20Report%20Generated', '2018-08-02 16:58:47'),
(1000990, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-08-02 16:58:51'),
(1000991, 'Ford, Xander', 'Login', 'System user login as Staff', '2018-08-02 16:59:01'),
(1000992, 'Ford, Xander', 'Report', 'Dashboard%20Daily%20Report%20Generated', '2018-08-02 16:59:05'),
(1000993, 'DOE, JANE', 'Login', 'System user login as Staff', '2018-08-02 16:59:15'),
(1000994, 'DOE, JANE', 'Report', 'Dashboard%20Daily%20Report%20Generated', '2018-08-02 16:59:17'),
(1000995, 'DOE, JANE', 'Login', 'System user login as Staff', '2018-08-02 16:59:29'),
(1000996, 'DOE, JANE', 'Report', 'S-Reading%20printed%20successfully', '2018-08-02 17:01:01'),
(1000997, 'DOE, JANE', 'Report', 'Transactions%20Report%20Generated', '2018-08-02 17:01:45'),
(1000998, 'DOE, JANE', 'Report', 'Transactions%20Report%20Generated', '2018-08-02 17:02:09'),
(1000999, 'DOE, JANE', 'Logout', 'System user logout as Staff', '2018-08-02 17:04:36'),
(1001000, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-08-02 17:04:37'),
(1001001, 'TORRES, JIK', 'Report', 'Transactions%20Report%20Generated', '2018-08-02 17:04:43'),
(1001002, 'TORRES, JIK', 'Report', 'Transactions%20Report%20Generated', '2018-08-02 17:04:46'),
(1001003, 'TORRES, JIK', 'Report', 'Transactions%20Report%20Generated', '2018-08-02 17:04:50'),
(1001004, 'TORRES, JIK', 'Report', 'Products%20Report%20Generated', '2018-08-02 17:04:57'),
(1001005, 'TORRES, JIK', 'Report', 'Dashboard%20Daily%20Report%20Generated', '2018-08-02 17:06:10'),
(1001006, 'TORRES, JIK', 'Logout', 'System user logout as Administrator', '2018-08-02 17:06:14'),
(1001007, 'DOE, JANE', 'Login', 'System user login as Staff', '2018-08-02 17:06:25'),
(1001008, 'DOE, JANE', 'Report', 'Dashboard%20Daily%20Report%20Generated', '2018-08-02 17:06:33'),
(1001009, 'DOE, JANE', 'Logout', 'System user logout as Staff', '2018-08-02 17:06:45'),
(1001010, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-08-02 17:06:46'),
(1001011, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-08-03 09:20:43'),
(1001012, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-08-03 12:09:13'),
(1001013, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-08-03 17:34:05'),
(1001014, 'um_developer', 'Update', 'Item%20updated%20I15:%20Chairs%20to%20Chairs', '2018-08-03 17:57:28'),
(1001015, 'um_developer', 'Add', 'New%20transaction%20payment%20added:%20S128', '2018-08-03 18:34:59'),
(1001016, 'um_developer', 'Add', 'New%20transaction%20payment%20added:%20S127', '2018-08-03 18:36:21'),
(1001017, 'um_developer', 'Delete', 'Transaction%20has%20been%20cancelled', '2018-08-03 18:40:53'),
(1001018, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-08-03 18:44:46'),
(1001019, 'um_developer', 'Add', 'New%20transaction%20discount%20added:%20S126', '2018-08-03 18:47:37'),
(1001020, 'um_developer', 'Delete', 'Transaction%20detail%20product%20voided%20T126:%20P1', '2018-08-03 18:53:15'),
(1001021, 'um_developer', 'Delete', 'Transaction%20detail%20package%20voided%20T126:%20G1', '2018-08-03 18:58:54'),
(1001022, 'TORRES, JIK', 'Login', 'System user login as Administrator', '2018-08-03 19:21:50');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `pack_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `short_name` varchar(12) NOT NULL,
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

INSERT INTO `packages` (`pack_id`, `name`, `short_name`, `descr`, `price`, `img`, `sold`, `encoded`, `removed`) VALUES
(1, 'Family Bundle 1', 'FamlyBundle1', 'Sample package descr', '500.00', '1_1_.jpg', 107, '2018-05-25 01:21:37', 0),
(2, 'Family Bundle 2', 'FamlyBundle2', 'Sample descr pack 1', '1000.00', '2_1_.jpg', 6, '2018-05-29 13:17:08', 0),
(3, 'Barkada Package', 'BrkdaPackage', 'Family package X 2', '1000.00', '3_1_.jpg', 21, '2018-05-29 15:18:31', 0),
(4, 'Lechon Bundle 1', 'LechonBndle1', 'Lechon Bundle with Lamas', '1200.00', '4_1_.jpg', 3, '2018-07-04 16:18:35', 0);

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
-- Table structure for table `pack_discounts`
--

CREATE TABLE `pack_discounts` (
  `pd_id` int(11) NOT NULL,
  `pack_id` int(11) NOT NULL,
  `remarks` varchar(200) NOT NULL,
  `date_start` varchar(20) NOT NULL,
  `date_end` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `new_price` decimal(10,2) NOT NULL,
  `encoded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `removed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pack_discounts`
--

INSERT INTO `pack_discounts` (`pd_id`, `pack_id`, `remarks`, `date_start`, `date_end`, `status`, `new_price`, `encoded`, `removed`) VALUES
(1, 4, 'Discount promo test 1', '2018-07-05', '2018-07-05', 'ACTIVE', '1100.00', '2018-07-05 19:40:32', 0),
(2, 1, '', '2018-07-06', '2018-07-06', 'ACTIVE', '450.00', '2018-07-06 18:24:59', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pos`
--

CREATE TABLE `pos` (
  `pos_id` int(11) NOT NULL,
  `pos_name` varchar(100) NOT NULL,
  `receipt_count` int(11) NOT NULL,
  `encoded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prod_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `short_name` varchar(12) NOT NULL,
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

INSERT INTO `products` (`prod_id`, `name`, `short_name`, `descr`, `cat_id`, `price`, `img`, `sold`, `sold_pack`, `encoded`, `removed`) VALUES
(1, 'Coca Cola', 'CokeInCan', 'Coke in Can', 1, '50.00', '1_1_.jpg', 126, 30, '2018-05-24 18:22:34', 0),
(2, 'Iced Tea Pitcher', 'IceTeaPitchr', 'Soda', 1, '45.00', '2_1_.jpg', 16, 107, '2018-05-28 14:37:40', 0),
(3, 'Cheese Burger', 'CheeseBurger', 'Regular size cheese burger', 3, '100.00', '3_1_.jpg', 259, 0, '2018-05-29 13:51:47', 0),
(4, 'Sprite in Can', 'SpriteInCan', 'Green can soda in can', 1, '50.00', '4_1_.jpg', 6, 0, '2018-05-29 13:55:32', 0),
(5, 'Cheesy Fries', 'CheesyFries', 'French fries cheese flavor', 3, '80.00', '5_2_.jpg', 17, 0, '2018-05-29 13:56:42', 0),
(6, 'Barbecue Fries', 'BBQFries', 'French fries BBQ flavor', 3, '80.00', '6_1_.jpg', 28, 0, '2018-05-29 13:57:27', 0),
(7, 'Double Cheese Burger', 'DblCheeseBgr', 'Heavy cheese burger X 2', 3, '180.00', '7_1_.jpg', 8, 42, '2018-05-29 13:58:22', 0),
(8, 'Mix Fries', 'MixFries', '2 flavored french fries', 3, '100.00', '8_1_.jpg', 1, 0, '2018-05-29 14:56:29', 0),
(9, 'Extra Large Fries', 'FrnchFriesXL', 'Triple size french fries', 3, '150.00', '9_1_.jpg', 6, 161, '2018-05-29 14:58:13', 0),
(10, 'Chicken Rice Meal', 'ChknRiceMeal', 'Fried chicken cut with rice', 3, '70.00', '10_1_.jpg', 8, 458, '2018-05-29 14:59:21', 0),
(11, 'test insert 1', '', 'test insert 1 descr', 2, '1000.00', '', 0, 0, '2018-05-31 14:33:22', 1),
(12, 'test insert 2', '', 'test insert 2 descr', 2, '2000.00', '', 0, 0, '2018-05-31 14:33:23', 1),
(13, 'Plain Rice', 'PlainRice', '1 cup plain rice banay-banay', 4, '20.00', '13_1_.jpg', 5, 0, '2018-07-04 15:30:44', 0);

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
(9, 9, 3, '2018-05-29 16:52:38'),
(13, 12, 1, '2018-07-04 15:40:34');

-- --------------------------------------------------------

--
-- Table structure for table `prod_discounts`
--

CREATE TABLE `prod_discounts` (
  `pd_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `remarks` varchar(200) NOT NULL,
  `date_start` varchar(20) NOT NULL,
  `date_end` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `new_price` decimal(10,2) NOT NULL,
  `encoded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `removed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prod_discounts`
--

INSERT INTO `prod_discounts` (`pd_id`, `prod_id`, `remarks`, `date_start`, `date_end`, `status`, `new_price`, `encoded`, `removed`) VALUES
(1, 6, 'Discount promo test 1', '2018-07-05', '2018-07-05', 'ACTIVE', '70.00', '2018-07-05 19:40:32', 0),
(2, 1, 'Coca Cola promo discount', '', '', 'INACTIVE', '10.00', '2018-07-11 19:20:38', 0),
(3, 10, 'Chicken Day Promo ', '2018-07-12', '2018-07-27', 'INACTIVE', '60.00', '2018-07-12 15:07:11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `store_config`
--

CREATE TABLE `store_config` (
  `conf_id` int(11) NOT NULL,
  `branch_id` int(4) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `tin` varchar(45) NOT NULL,
  `vat` int(11) NOT NULL,
  `bs_price` decimal(10,2) NOT NULL,
  `img` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_config`
--

INSERT INTO `store_config` (`conf_id`, `branch_id`, `name`, `address`, `city`, `telephone`, `mobile`, `tin`, `vat`, `bs_price`, `img`, `password`) VALUES
(1, 1, 'Lolo Ernings Lechon - Obrero', 'Sample St., Bo. Obrero', 'Davao City', '(082) 234-8398', '+63 9228 031 290', 'TIN:008-351-499-012', 0, '45.00', 'complogo_1_.png', 'jiktorres');

-- --------------------------------------------------------

--
-- Table structure for table `s_readings`
--

CREATE TABLE `s_readings` (
  `reading_no` int(11) NOT NULL,
  `pos_no` int(11) NOT NULL,
  `cashier_username` varchar(45) NOT NULL,
  `date` varchar(20) NOT NULL,
  `trans_count_dine_in` int(11) NOT NULL,
  `trans_count_take_out` int(11) NOT NULL,
  `trans_count_total` int(11) NOT NULL,
  `trans_count_cleared` int(11) NOT NULL,
  `trans_count_cancelled` int(11) NOT NULL,
  `trans_count_refunded` int(11) NOT NULL,
  `void_items_count` int(11) NOT NULL,
  `net_sales` decimal(10,2) NOT NULL,
  `discounts_rendered_sc` decimal(10,2) NOT NULL,
  `discounts_rendered_pwd` decimal(10,2) NOT NULL,
  `discounts_rendered_promo` decimal(10,2) NOT NULL,
  `discounts_rendered_total` decimal(10,2) NOT NULL,
  `gross_sales` decimal(10,2) NOT NULL,
  `cancelled_sales` decimal(10,2) NOT NULL,
  `refunded_sales` decimal(10,2) NOT NULL,
  `vat_sales` decimal(10,2) NOT NULL,
  `vat_amount` decimal(10,2) NOT NULL,
  `vat_exempt` decimal(10,2) NOT NULL,
  `start_rcpt_no` int(11) NOT NULL,
  `end_rcpt_no` int(11) NOT NULL,
  `encoded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `s_readings`
--

INSERT INTO `s_readings` (`reading_no`, `pos_no`, `cashier_username`, `date`, `trans_count_dine_in`, `trans_count_take_out`, `trans_count_total`, `trans_count_cleared`, `trans_count_cancelled`, `trans_count_refunded`, `void_items_count`, `net_sales`, `discounts_rendered_sc`, `discounts_rendered_pwd`, `discounts_rendered_promo`, `discounts_rendered_total`, `gross_sales`, `cancelled_sales`, `refunded_sales`, `vat_sales`, `vat_amount`, `vat_exempt`, `start_rcpt_no`, `end_rcpt_no`, `encoded`) VALUES
(1, 1, 'um_developer', '', 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, '2018-07-30 22:54:16'),
(2, 1, 'um_developer', '2018-07-30', 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, '2018-07-30 22:55:47'),
(3, 1, 'um_developer', '2018-07-30', 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, '2018-07-30 22:56:35'),
(4, 1, 'um_developer', '2018-07-30', 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, '2018-07-30 22:58:44'),
(5, 1, 'um_developer', '2018-07-30', 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, '2018-07-30 23:01:57'),
(6, 1, 'um_developer', '2018-07-30', 1, 0, 1, 1, 0, 0, 0, '1000.00', '0.00', '0.00', '0.00', '0.00', '1000.00', '0.00', '0.00', '0.00', '0.00', '0.00', 2000025, 2000025, '2018-07-30 23:05:28'),
(7, 1, 'um_developer', '2018-07-30', 1, 0, 1, 1, 0, 0, 0, '1120.00', '0.00', '280.00', '0.00', '280.00', '1400.00', '0.00', '0.00', '0.00', '0.00', '0.00', 2000028, 2000028, '2018-07-30 23:27:37'),
(8, 1, 'um_developer', '2018-07-30', 2, 0, 2, 2, 0, 0, 0, '2420.00', '100.00', '280.00', '0.00', '380.00', '2800.00', '0.00', '0.00', '0.00', '0.00', '0.00', 2000028, 2000029, '2018-07-30 23:31:01'),
(9, 1, 'janedoe', '2018-08-02', 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0, 0, '2018-08-02 17:01:01');

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
(1, 'Table #1', 0, '2018-06-06 17:57:24', 0),
(2, 'Table #2 ', 0, '2018-06-06 18:01:17', 0),
(3, 'Table #3', 0, '2018-06-11 11:54:21', 0),
(4, 'Table #4', 0, '2018-06-11 11:54:34', 0),
(5, 'Table #5', 0, '2018-06-13 15:54:11', 0),
(6, 'Table #6', 0, '2018-06-19 13:17:19', 0),
(7, 'Table #7', 0, '2018-06-19 13:17:26', 0),
(8, 'Table #8', 0, '2018-06-19 13:17:32', 0),
(9, 'Table #9', 0, '2018-06-19 13:17:38', 0),
(10, 'Table #10', 0, '2018-06-19 13:17:44', 0),
(11, 'Table #11', 0, '2018-06-19 13:17:50', 0),
(12, 'Table #12', 2, '2018-07-02 20:26:11', 0),
(13, 'Table #13', 0, '2018-07-02 20:26:15', 0),
(14, 'Table #14', 1, '2018-07-02 20:26:20', 0),
(15, 'Table #15', 0, '2018-07-02 20:26:24', 0);

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
(1, 123, 3),
(2, 123, 4),
(3, 124, 3),
(4, 124, 4),
(5, 125, 3),
(6, 125, 4),
(21, 126, 0);

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
  `cust_disc_id` varchar(45) NOT NULL DEFAULT 'n/a',
  `user_id` int(11) NOT NULL COMMENT 'staff/waiter id',
  `cashier_id` int(11) NOT NULL,
  `is_updated` int(1) NOT NULL DEFAULT '0',
  `is_billout_printed` int(1) NOT NULL DEFAULT '0',
  `receipt_no` int(7) NOT NULL DEFAULT '1000000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`trans_id`, `datetime`, `discount`, `disc_type`, `status`, `order_type`, `cash_amt`, `change_amt`, `method`, `card_number`, `cust_name`, `cust_disc_id`, `user_id`, `cashier_id`, `is_updated`, `is_billout_printed`, `receipt_no`) VALUES
(1, '2018-06-08 17:49:31', '0.00', 0, 'CLEARED', 'DINE-IN', '400.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 103, 0, 0, 1000000),
(2, '2018-06-11 12:15:21', '0.00', 0, 'CANCELLED', 'DINE-IN', '0.00', '0.00', 'n/a', 'n/a', 'n/a', 'n/a', 103, 103, 0, 0, 1000000),
(3, '2018-06-11 18:05:20', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(4, '2018-06-19 17:44:58', '0.00', 0, 'CLEARED', 'DINE-IN', '200.00', '55.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(5, '2018-06-19 17:47:29', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(6, '2018-06-19 17:58:42', '0.00', 0, 'CLEARED', 'DINE-IN', '100.00', '50.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(7, '2018-06-19 18:02:19', '0.00', 0, 'CLEARED', 'DINE-IN', '300.00', '40.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(9, '2018-06-20 09:05:47', '0.00', 0, 'CLEARED', 'DINE-IN', '300.00', '25.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(10, '2018-06-20 11:15:18', '0.00', 0, 'CLEARED', 'DINE-IN', '1600.00', '20.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(11, '2018-06-20 11:45:52', '0.00', 0, 'CLEARED', 'DINE-IN', '1100.00', '100.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(12, '2018-06-20 14:30:38', '0.00', 0, 'CLEARED', 'DINE-IN', '1700.00', '85.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(13, '2018-06-26 16:41:14', '0.00', 0, 'CLEARED', 'DINE-IN', '2000.00', '500.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(14, '2018-06-26 16:41:57', '0.00', 0, 'CLEARED', 'DINE-IN', '2000.00', '500.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(15, '2018-06-26 16:43:19', '0.00', 0, 'CLEARED', 'DINE-IN', '2000.00', '500.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(16, '2018-06-27 17:10:11', '0.00', 0, 'CLEARED', 'DINE-IN', '1130.00', '0.00', 'Credit Card', '12121212121212', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(17, '2018-06-27 17:12:45', '140.00', 1, 'CLEARED', 'DINE-IN', '560.00', '0.00', 'Cash Card', '33333333333', 'Jose Rizal', '1212121212', 103, 108, 0, 0, 1000000),
(18, '2018-06-27 17:13:13', '132.00', 1, 'CLEARED', 'DINE-IN', '528.00', '0.00', 'Cash', 'n/a', 'n/a', '11111111', 103, 108, 0, 0, 1000000),
(19, '2018-06-27 19:39:10', '0.00', 0, 'CLEARED', 'DINE-IN', '500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000021),
(20, '2018-06-27 19:39:24', '55.00', 1, 'CLEARED', 'DINE-IN', '500.00', '455.00', 'Cash', 'n/a', 'n/a', '2222222', 103, 108, 0, 0, 2000020),
(21, '2018-06-28 10:25:52', '0.00', 0, 'CLEARED', 'DINE-IN', '1700.00', '30.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(22, '2018-06-28 14:57:03', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000019),
(24, '2018-06-28 14:57:24', '0.00', 0, 'CANCELLED', 'TAKE-OUT', '0.00', '0.00', 'n/a', 'n/a', 'n/a', 'n/a', 103, 0, 0, 0, 1000000),
(25, '2018-06-28 14:57:37', '0.00', 0, 'CANCELLED', 'TAKE-OUT', '0.00', '0.00', 'n/a', 'n/a', 'n/a', 'n/a', 103, 0, 0, 0, 1000000),
(26, '2018-06-28 15:01:18', '120.00', 1, 'CLEARED', 'DINE-IN', '880.00', '0.00', 'Credit Card', '111121212121', 'Emilio Aguinaldo', '21212121212', 103, 108, 0, 0, 1000000),
(27, '2018-06-28 15:04:24', '0.00', 0, 'CLEARED', 'DINE-IN', '2050.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000018),
(28, '2018-06-28 17:46:38', '0.00', 0, 'CANCELLED', 'TAKE-OUT', '0.00', '0.00', 'n/a', 'n/a', 'n/a', 'n/a', 103, 0, 0, 0, 1000000),
(29, '2018-06-28 18:12:35', '0.00', 0, 'CLEARED', 'DINE-IN', '1300.00', '70.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(30, '2018-06-29 21:32:35', '0.00', 0, 'CLEARED', 'DINE-IN', '1000.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000017),
(31, '2018-06-29 21:36:17', '0.00', 0, 'CLEARED', 'DINE-IN', '495.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000016),
(32, '2018-06-29 21:38:05', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000015),
(33, '2018-06-29 21:41:20', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000014),
(34, '2018-06-29 21:42:29', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000007),
(35, '2018-06-29 21:43:40', '0.00', 0, 'CLEARED', 'DINE-IN', '500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000013),
(36, '2018-06-29 21:44:53', '0.00', 0, 'CLEARED', 'DINE-IN', '500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000006),
(37, '2018-06-29 21:45:15', '0.00', 0, 'CLEARED', 'DINE-IN', '500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000005),
(38, '2018-06-29 21:46:12', '0.00', 0, 'CLEARED', 'DINE-IN', '500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000004),
(39, '2018-06-29 21:46:50', '0.00', 0, 'CLEARED', 'DINE-IN', '500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000025),
(40, '2018-06-29 21:47:47', '0.00', 0, 'CANCELLED', 'DINE-IN', '0.00', '0.00', 'n/a', 'n/a', 'n/a', 'n/a', 103, 0, 0, 0, 1000000),
(41, '2018-06-29 21:48:05', '0.00', 0, 'CANCELLED', 'DINE-IN', '0.00', '0.00', 'n/a', 'n/a', 'n/a', 'n/a', 103, 0, 0, 0, 1000000),
(42, '2018-06-29 21:48:38', '0.00', 0, 'CLEARED', 'DINE-IN', '500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000023),
(43, '2018-06-29 21:49:43', '0.00', 0, 'CLEARED', 'DINE-IN', '580.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000022),
(44, '2018-06-29 21:52:42', '0.00', 0, 'CLEARED', 'DINE-IN', '180.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000021),
(45, '2018-06-29 21:52:57', '0.00', 0, 'CANCELLED', 'DINE-IN', '0.00', '0.00', 'n/a', 'n/a', 'n/a', 'n/a', 103, 0, 0, 0, 1000000),
(46, '2018-07-02 20:18:31', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000019),
(47, '2018-07-02 20:18:48', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000020),
(48, '2018-07-02 20:19:05', '0.00', 0, 'CANCELLED', 'DINE-IN', '0.00', '0.00', 'n/a', 'n/a', 'n/a', 'n/a', 103, 0, 0, 0, 1000000),
(49, '2018-07-02 20:22:44', '0.00', 0, 'CANCELLED', 'DINE-IN', '0.00', '0.00', 'n/a', 'n/a', 'n/a', 'n/a', 103, 0, 0, 0, 1000000),
(50, '2018-07-02 20:23:25', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000017),
(51, '2018-07-02 20:24:05', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000015),
(52, '2018-07-02 20:25:23', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000016),
(53, '2018-07-02 20:26:22', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Cash Card', '45454545', 'n/a', 'n/a', 103, 108, 0, 0, 1000014),
(54, '2018-07-02 20:27:54', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000018),
(55, '2018-07-02 20:29:23', '0.00', 0, 'CLEARED', 'TAKE-OUT', '50.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000003),
(56, '2018-07-02 20:47:39', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000013),
(57, '2018-07-02 20:48:48', '0.00', 0, 'CANCELLED', 'DINE-IN', '0.00', '0.00', 'n/a', 'n/a', 'n/a', 'n/a', 103, 0, 0, 0, 1000000),
(58, '2018-07-03 18:25:56', '0.00', 0, 'CLEARED', 'DINE-IN', '330.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000012),
(59, '2018-07-03 18:26:34', '0.00', 0, 'CLEARED', 'DINE-IN', '260.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000024),
(60, '2018-07-03 18:39:35', '0.00', 0, 'CLEARED', 'DINE-IN', '500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000010),
(61, '2018-07-03 18:40:32', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000009),
(62, '2018-07-03 18:41:20', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000011),
(63, '2018-07-03 18:49:22', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000007),
(64, '2018-07-03 18:53:34', '120.00', 2, 'CLEARED', 'DINE-IN', '1380.00', '0.00', 'Cash', 'n/a', 'n/a', '878787878', 103, 108, 0, 0, 1000006),
(65, '2018-07-03 19:00:18', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Credit Card', '656589855', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(66, '2018-07-03 19:02:28', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Credit Card', '112522525', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(67, '2018-07-03 19:06:07', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '0.00', 'Credit Card', '2000', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(68, '2018-07-03 19:09:37', '0.00', 0, 'CLEARED', 'DINE-IN', '2000.00', '500.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(69, '2018-07-03 19:15:34', '0.00', 0, 'CLEARED', 'DINE-IN', '2000.00', '500.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(70, '2018-07-03 19:24:38', '0.00', 0, 'CLEARED', 'DINE-IN', '2000.00', '500.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(71, '2018-07-03 19:28:03', '0.00', 0, 'CLEARED', 'DINE-IN', '2000.00', '500.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(72, '2018-07-03 19:30:32', '0.00', 0, 'CLEARED', 'DINE-IN', '2000.00', '500.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(73, '2018-07-03 19:33:21', '0.00', 0, 'CLEARED', 'DINE-IN', '2000.00', '500.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(74, '2018-07-03 19:37:53', '0.00', 0, 'CLEARED', 'DINE-IN', '2000.00', '500.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(75, '2018-07-03 19:50:18', '0.00', 0, 'CLEARED', 'DINE-IN', '2000.00', '500.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(76, '2018-07-03 19:51:52', '0.00', 0, 'CLEARED', 'DINE-IN', '2000.00', '500.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(77, '2018-07-03 19:55:04', '0.00', 0, 'CLEARED', 'DINE-IN', '2000.00', '500.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(78, '2018-07-03 19:57:33', '0.00', 0, 'CLEARED', 'DINE-IN', '2000.00', '500.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(79, '2018-07-05 20:18:37', '0.00', 0, 'CLEARED', 'TAKE-OUT', '1500.00', '40.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000008),
(80, '2018-07-05 20:20:08', '0.00', 0, 'CLEARED', 'TAKE-OUT', '1180.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000005),
(81, '2018-07-05 20:20:51', '0.00', 0, 'CLEARED', 'TAKE-OUT', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000004),
(82, '2018-07-05 20:21:42', '0.00', 0, 'CLEARED', 'TAKE-OUT', '1500.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000003),
(83, '2018-07-05 20:24:34', '200.00', 2, 'CLEARED', 'TAKE-OUT', '3410.00', '0.00', 'Cash', 'n/a', 'n/a', '5151215112158', 103, 108, 0, 0, 1000002),
(84, '2018-07-05 20:29:25', '0.00', 0, 'CANCELLED', 'DINE-IN', '0.00', '0.00', 'n/a', 'n/a', 'n/a', 'n/a', 103, 0, 0, 0, 1000000),
(85, '2018-07-05 20:33:33', '0.00', 0, 'CANCELLED', 'DINE-IN', '0.00', '0.00', 'n/a', 'n/a', 'n/a', 'n/a', 103, 0, 0, 0, 1000000),
(86, '2018-07-05 20:35:23', '0.00', 0, 'CANCELLED', 'DINE-IN', '0.00', '0.00', 'n/a', 'n/a', 'n/a', 'n/a', 103, 0, 0, 0, 1000000),
(87, '2018-07-06 21:00:05', '0.00', 0, 'CANCELLED', 'TAKE-OUT', '0.00', '0.00', 'n/a', 'n/a', 'n/a', 'n/a', 103, 0, 0, 0, 1000000),
(88, '2018-07-10 17:32:59', '0.00', 0, 'CLEARED', 'DINE-IN', '1520.00', '0.00', 'Credit Card', '1212121212121', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(89, '2018-07-11 10:54:55', '0.00', 0, 'CLEARED', 'TAKE-OUT', '1990.00', '0.00', 'Credit Card', '2323323232', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(90, '2018-07-11 12:40:03', '0.00', 0, 'CLEARED', 'DINE-IN', '2500.00', '410.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(91, '2018-07-11 12:50:57', '200.00', 1, 'CLEARED', 'TAKE-OUT', '800.00', '0.00', 'Cash', 'n/a', 'n/a', '545454', 103, 108, 0, 0, 1000001),
(92, '2018-07-11 12:51:09', '0.00', 0, 'CLEARED', 'TAKE-OUT', '1000.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 1000000),
(93, '2018-07-12 14:52:42', '0.00', 0, 'CLEARED', 'DINE-IN', '2000.00', '800.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 103, 0, 0, 1000000),
(94, '2018-07-13 20:09:53', '0.00', 0, 'CLEARED', 'DINE-IN', '2000.00', '600.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 103, 0, 0, 1100000),
(95, '2018-07-13 20:57:27', '0.00', 0, 'CLEARED', 'DINE-IN', '1000.00', '930.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 103, 0, 0, 1000001),
(96, '2018-07-13 21:01:25', '0.00', 0, 'CLEARED', 'DINE-IN', '500.00', '320.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 103, 0, 0, 1000001),
(97, '2018-07-13 21:08:39', '0.00', 0, 'CLEARED', 'DINE-IN', '1000.00', '750.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 103, 0, 0, 1000001),
(98, '2018-07-13 21:32:40', '0.00', 0, 'CLEARED', 'DINE-IN', '1000.00', '600.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 103, 0, 0, 2000001),
(99, '2018-07-13 21:33:49', '0.00', 0, 'CLEARED', 'DINE-IN', '1000.00', '570.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 103, 0, 0, 2000001),
(100, '2018-07-13 23:04:03', '0.00', 0, 'CLEARED', 'TAKE-OUT', '1000.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000002),
(101, '2018-07-13 23:22:30', '0.00', 0, 'CLEARED', 'TAKE-OUT', '1400.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000012),
(102, '2018-07-13 23:27:47', '0.00', 0, 'CLEARED', 'TAKE-OUT', '1400.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000011),
(103, '2018-07-13 23:31:02', '0.00', 0, 'CLEARED', 'TAKE-OUT', '1400.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000009),
(104, '2018-07-13 23:32:03', '0.00', 0, 'CLEARED', 'DINE-IN', '3550.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000008),
(105, '2018-07-13 23:34:16', '0.00', 0, 'CLEARED', 'TAKE-OUT', '250.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000010),
(106, '2018-07-19 23:32:11', '0.00', 0, 'CLEARED', 'TAKE-OUT', '2000.00', '600.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000022),
(107, '2018-07-19 23:32:24', '200.00', 1, 'CLEARED', 'DINE-IN', '1200.00', '0.00', 'Cash Card', '89898989', 'n/a', '12121211', 103, 108, 0, 0, 2000023),
(108, '2018-07-23 15:32:00', '0.00', 0, 'CLEARED', 'DINE-IN', '500.00', '270.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000024),
(109, '2018-07-23 15:45:30', '0.00', 0, 'CLEARED', 'DINE-IN', '1000.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 1, 2000027),
(110, '2018-07-23 15:53:19', '0.00', 0, 'CLEARED', 'DINE-IN', '1000.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 1, 2000025),
(111, '2018-07-23 20:36:50', '0.00', 0, 'CLEARED', 'DINE-IN', '1000.00', '470.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 103, 0, 0, 2000001),
(112, '2018-07-23 20:37:02', '0.00', 0, 'CLEARED', 'TAKE-OUT', '500.00', '200.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 103, 0, 0, 2000002),
(113, '2018-07-23 20:44:17', '0.00', 0, 'CLEARED', 'DINE-IN', '1500.00', '1180.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 103, 0, 0, 2000003),
(114, '2018-07-23 20:55:47', '0.00', 0, 'CLEARED', 'DINE-IN', '1000.00', '830.00', 'Cash', 'n/a', 'n/a', 'n/a', 109, 109, 0, 0, 2000004),
(115, '2018-07-23 20:58:29', '0.00', 0, 'CLEARED', 'DINE-IN', '500.00', '180.00', 'Cash', 'n/a', 'n/a', 'n/a', 109, 109, 0, 0, 2000005),
(116, '2018-07-23 20:59:10', '0.00', 0, 'CLEARED', 'TAKE-OUT', '500.00', '120.00', 'Cash', 'n/a', 'n/a', 'n/a', 109, 109, 0, 0, 2000006),
(117, '2018-07-27 15:07:43', '0.00', 0, 'REFUNDED', 'DINE-IN', '-2000.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 109, 111, 0, 0, 1200000),
(118, '2018-07-27 15:12:12', '0.00', 0, 'REFUNDED', 'DINE-IN', '-2000.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 109, 111, 0, 0, 1200000),
(119, '2018-07-27 17:52:28', '0.00', 0, 'CLEARED', 'TAKE-OUT', '2000.00', '600.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000026),
(120, '2018-07-27 19:40:46', '0.00', 0, 'REFUNDED', 'DINE-IN', '-1400.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 109, 111, 0, 0, 1200000),
(121, '2018-07-30 23:23:59', '280.00', 2, 'CLEARED', 'DINE-IN', '1500.00', '380.00', 'Cash', 'n/a', 'n/a', '343434', 103, 108, 0, 0, 2000028),
(122, '2018-07-30 23:28:52', '100.00', 1, 'CLEARED', 'DINE-IN', '2000.00', '700.00', 'Cash', 'n/a', 'n/a', '98998', 103, 108, 0, 0, 2000029),
(123, '2018-08-01 17:15:13', '0.00', 0, 'CLEARED', 'TAKE-OUT', '2000.00', '600.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000030),
(124, '2018-08-03 17:34:17', '0.00', 0, 'ONGOING', 'TAKE-OUT', '0.00', '0.00', 'n/a', 'n/a', 'n/a', 'n/a', 103, 0, 0, 0, 1000000),
(125, '2018-08-03 17:34:51', '0.00', 0, 'ONGOING', 'TAKE-OUT', '0.00', '0.00', 'n/a', 'n/a', 'n/a', 'n/a', 103, 0, 0, 0, 1000000),
(126, '2018-08-03 17:36:59', '100.00', 2, 'ONGOING', 'DINE-IN', '0.00', '0.00', 'n/a', 'n/a', 'n/a', '54545454', 103, 0, 0, 0, 1000000),
(127, '2018-08-03 17:42:40', '0.00', 0, 'CLEARED', 'TAKE-OUT', '1500.00', '100.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000032),
(128, '2018-08-03 17:58:53', '0.00', 0, 'CANCELLED', 'TAKE-OUT', '2000.00', '340.00', 'Cash', 'n/a', 'n/a', 'n/a', 103, 108, 0, 0, 2000031),
(129, '2018-08-03 18:10:09', '0.00', 0, 'REFUNDED', 'DINE-IN', '-2000.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 109, 111, 0, 0, 1200000),
(130, '2018-08-03 19:25:28', '0.00', 0, 'REFUNDED', 'TAKE-OUT', '0.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 109, 111, 0, 0, 2000032),
(131, '2018-08-03 19:26:55', '0.00', 0, 'REFUNDED', 'TAKE-OUT', '0.00', '0.00', 'Cash', 'n/a', 'n/a', 'n/a', 109, 111, 0, 0, 2000032);

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
(12, 7, 0, 2, '0.00', 2, '0.00', 3),
(13, 1, 0, 0, '50.00', 2, '100.00', 0),
(13, 3, 0, 0, '100.00', 4, '400.00', 0),
(13, 0, 1, 1, '500.00', 2, '1000.00', 0),
(13, 2, 0, 2, '0.00', 2, '0.00', 1),
(13, 9, 0, 2, '0.00', 2, '0.00', 1),
(13, 10, 0, 2, '0.00', 8, '0.00', 1),
(14, 1, 0, 0, '50.00', 2, '100.00', 0),
(14, 3, 0, 0, '100.00', 4, '400.00', 0),
(14, 0, 1, 1, '500.00', 2, '1000.00', 0),
(14, 2, 0, 2, '0.00', 2, '0.00', 1),
(14, 9, 0, 2, '0.00', 2, '0.00', 1),
(14, 10, 0, 2, '0.00', 8, '0.00', 1),
(15, 1, 0, 0, '50.00', 2, '100.00', 0),
(15, 3, 0, 0, '100.00', 4, '400.00', 0),
(15, 0, 1, 1, '500.00', 2, '1000.00', 0),
(15, 2, 0, 2, '0.00', 2, '0.00', 1),
(15, 9, 0, 2, '0.00', 2, '0.00', 1),
(15, 10, 0, 2, '0.00', 8, '0.00', 1),
(16, 1, 0, 0, '50.00', 1, '50.00', 0),
(16, 5, 0, 0, '80.00', 1, '80.00', 0),
(16, 0, 3, 1, '1000.00', 1, '1000.00', 0),
(16, 9, 0, 2, '0.00', 2, '0.00', 3),
(16, 7, 0, 2, '0.00', 2, '0.00', 3),
(17, 9, 0, 0, '150.00', 2, '300.00', 0),
(17, 8, 0, 0, '100.00', 1, '100.00', 0),
(17, 7, 0, 0, '180.00', 1, '180.00', 0),
(17, 10, 0, 0, '70.00', 1, '70.00', 0),
(17, 4, 0, 0, '50.00', 1, '50.00', 0),
(18, 7, 0, 0, '180.00', 1, '180.00', 0),
(18, 3, 0, 0, '100.00', 3, '300.00', 0),
(18, 2, 0, 0, '45.00', 4, '180.00', 0),
(19, 0, 1, 1, '500.00', 1, '500.00', 0),
(19, 2, 0, 2, '0.00', 1, '0.00', 1),
(19, 9, 0, 2, '0.00', 1, '0.00', 1),
(19, 10, 0, 2, '0.00', 4, '0.00', 1),
(20, 3, 0, 0, '100.00', 1, '100.00', 0),
(21, 2, 0, 0, '45.00', 8, '360.00', 0),
(21, 4, 0, 0, '50.00', 1, '50.00', 0),
(21, 6, 0, 0, '80.00', 1, '80.00', 0),
(21, 3, 0, 0, '100.00', 1, '100.00', 0),
(21, 5, 0, 0, '80.00', 1, '80.00', 0),
(21, 0, 3, 1, '1000.00', 1, '1000.00', 0),
(21, 9, 0, 2, '0.00', 2, '0.00', 3),
(21, 7, 0, 2, '0.00', 2, '0.00', 3),
(26, 0, 3, 1, '1000.00', 1, '1000.00', 0),
(26, 9, 0, 2, '0.00', 2, '0.00', 3),
(26, 7, 0, 2, '0.00', 2, '0.00', 3),
(29, 7, 0, 0, '180.00', 1, '180.00', 0),
(29, 1, 0, 0, '50.00', 1, '50.00', 0),
(29, 0, 3, 1, '1000.00', 1, '1000.00', 0),
(29, 9, 0, 2, '0.00', 2, '0.00', 3),
(29, 7, 0, 2, '0.00', 2, '0.00', 3),
(27, 1, 0, 0, '50.00', 1, '50.00', 0),
(27, 0, 2, 1, '1000.00', 1, '1000.00', 0),
(27, 1, 0, 2, '0.00', 5, '0.00', 2),
(27, 10, 0, 2, '0.00', 5, '0.00', 2),
(27, 9, 0, 2, '0.00', 2, '0.00', 2),
(27, 0, 3, 1, '1000.00', 1, '1000.00', 0),
(27, 9, 0, 2, '0.00', 2, '0.00', 3),
(27, 7, 0, 2, '0.00', 2, '0.00', 3),
(22, 0, 3, 1, '1000.00', 1, '1000.00', 0),
(22, 9, 0, 2, '0.00', 2, '0.00', 3),
(22, 7, 0, 2, '0.00', 2, '0.00', 3),
(22, 0, 1, 1, '500.00', 1, '500.00', 0),
(22, 2, 0, 2, '0.00', 1, '0.00', 1),
(22, 9, 0, 2, '0.00', 1, '0.00', 1),
(22, 10, 0, 2, '0.00', 4, '0.00', 1),
(24, 1, 0, 0, '50.00', 2, '100.00', 0),
(24, 3, 0, 0, '100.00', 4, '400.00', 0),
(24, 5, 0, 0, '80.00', 2, '160.00', 0),
(24, 0, 1, 1, '500.00', 2, '1000.00', 0),
(24, 2, 0, 2, '0.00', 2, '0.00', 1),
(24, 9, 0, 2, '0.00', 2, '0.00', 1),
(24, 10, 0, 2, '0.00', 8, '0.00', 1),
(25, 1, 0, 0, '50.00', 2, '100.00', 0),
(25, 3, 0, 0, '100.00', 4, '400.00', 0),
(25, 5, 0, 0, '80.00', 2, '160.00', 0),
(25, 0, 1, 1, '500.00', 2, '1000.00', 0),
(25, 2, 0, 2, '0.00', 2, '0.00', 1),
(25, 9, 0, 2, '0.00', 2, '0.00', 1),
(25, 10, 0, 2, '0.00', 8, '0.00', 1),
(28, 1, 0, 0, '50.00', 2, '100.00', 0),
(28, 3, 0, 0, '100.00', 4, '400.00', 0),
(28, 5, 0, 0, '80.00', 2, '160.00', 0),
(28, 0, 1, 1, '500.00', 2, '1000.00', 0),
(28, 2, 0, 2, '0.00', 2, '0.00', 1),
(28, 9, 0, 2, '0.00', 2, '0.00', 1),
(28, 10, 0, 2, '0.00', 8, '0.00', 1),
(30, 0, 3, 1, '1000.00', 1, '1000.00', 0),
(30, 9, 0, 2, '0.00', 2, '0.00', 3),
(30, 7, 0, 2, '0.00', 2, '0.00', 3),
(32, 1, 0, 0, '50.00', 2, '100.00', 0),
(32, 3, 0, 0, '100.00', 4, '400.00', 0),
(32, 0, 1, 1, '500.00', 2, '1000.00', 0),
(32, 2, 0, 2, '0.00', 2, '0.00', 1),
(32, 9, 0, 2, '0.00', 2, '0.00', 1),
(32, 10, 0, 2, '0.00', 8, '0.00', 1),
(33, 1, 0, 0, '50.00', 2, '100.00', 0),
(33, 3, 0, 0, '100.00', 4, '400.00', 0),
(33, 0, 1, 1, '500.00', 2, '1000.00', 0),
(33, 2, 0, 2, '0.00', 2, '0.00', 1),
(33, 9, 0, 2, '0.00', 2, '0.00', 1),
(33, 10, 0, 2, '0.00', 8, '0.00', 1),
(34, 1, 0, 0, '50.00', 2, '100.00', 0),
(34, 3, 0, 0, '100.00', 4, '400.00', 0),
(34, 0, 1, 1, '500.00', 2, '1000.00', 0),
(34, 2, 0, 2, '0.00', 2, '0.00', 1),
(34, 9, 0, 2, '0.00', 2, '0.00', 1),
(34, 10, 0, 2, '0.00', 8, '0.00', 1),
(35, 1, 0, 0, '50.00', 2, '100.00', 0),
(35, 3, 0, 0, '100.00', 4, '400.00', 0),
(36, 1, 0, 0, '50.00', 2, '100.00', 0),
(36, 3, 0, 0, '100.00', 4, '400.00', 0),
(37, 1, 0, 0, '50.00', 2, '100.00', 0),
(37, 3, 0, 0, '100.00', 4, '400.00', 0),
(38, 1, 0, 0, '50.00', 2, '100.00', 0),
(38, 3, 0, 0, '100.00', 4, '400.00', 0),
(39, 1, 0, 0, '50.00', 2, '100.00', 0),
(39, 3, 0, 0, '100.00', 4, '400.00', 0),
(40, 1, 0, 0, '50.00', 2, '100.00', 0),
(40, 3, 0, 0, '100.00', 4, '400.00', 0),
(41, 1, 0, 0, '50.00', 2, '100.00', 0),
(41, 3, 0, 0, '100.00', 4, '400.00', 0),
(42, 1, 0, 0, '50.00', 2, '100.00', 0),
(42, 3, 0, 0, '100.00', 4, '400.00', 0),
(31, 1, 0, 0, '50.00', 1, '50.00', 0),
(31, 2, 0, 0, '45.00', 1, '45.00', 0),
(31, 9, 0, 0, '150.00', 1, '150.00', 0),
(31, 10, 0, 0, '70.00', 1, '70.00', 0),
(31, 5, 0, 0, '80.00', 1, '80.00', 0),
(31, 3, 0, 0, '100.00', 1, '100.00', 0),
(43, 1, 0, 0, '50.00', 2, '100.00', 0),
(43, 3, 0, 0, '100.00', 4, '400.00', 0),
(43, 6, 0, 0, '80.00', 1, '80.00', 0),
(44, 6, 0, 0, '80.00', 1, '80.00', 0),
(44, 3, 0, 0, '100.00', 1, '100.00', 0),
(45, 6, 0, 0, '80.00', 1, '80.00', 0),
(45, 3, 0, 0, '100.00', 1, '100.00', 0),
(45, 9, 0, 0, '150.00', 1, '150.00', 0),
(45, 7, 0, 0, '180.00', 1, '180.00', 0),
(45, 1, 0, 0, '50.00', 1, '50.00', 0),
(46, 1, 0, 0, '50.00', 2, '100.00', 0),
(46, 3, 0, 0, '100.00', 4, '400.00', 0),
(46, 0, 1, 1, '500.00', 2, '1000.00', 0),
(46, 2, 0, 2, '0.00', 2, '0.00', 1),
(46, 9, 0, 2, '0.00', 2, '0.00', 1),
(46, 10, 0, 2, '0.00', 8, '0.00', 1),
(47, 1, 0, 0, '50.00', 2, '100.00', 0),
(47, 3, 0, 0, '100.00', 4, '400.00', 0),
(47, 0, 1, 1, '500.00', 2, '1000.00', 0),
(47, 2, 0, 2, '0.00', 2, '0.00', 1),
(47, 9, 0, 2, '0.00', 2, '0.00', 1),
(47, 10, 0, 2, '0.00', 8, '0.00', 1),
(48, 1, 0, 0, '50.00', 2, '100.00', 0),
(48, 3, 0, 0, '100.00', 4, '400.00', 0),
(48, 0, 1, 1, '500.00', 2, '1000.00', 0),
(48, 2, 0, 2, '0.00', 2, '0.00', 1),
(48, 9, 0, 2, '0.00', 2, '0.00', 1),
(48, 10, 0, 2, '0.00', 8, '0.00', 1),
(49, 1, 0, 0, '50.00', 2, '100.00', 0),
(49, 3, 0, 0, '100.00', 4, '400.00', 0),
(49, 0, 1, 1, '500.00', 2, '1000.00', 0),
(49, 2, 0, 2, '0.00', 2, '0.00', 1),
(49, 9, 0, 2, '0.00', 2, '0.00', 1),
(49, 10, 0, 2, '0.00', 8, '0.00', 1),
(50, 1, 0, 0, '50.00', 2, '100.00', 0),
(50, 3, 0, 0, '100.00', 4, '400.00', 0),
(50, 0, 1, 1, '500.00', 2, '1000.00', 0),
(50, 2, 0, 2, '0.00', 2, '0.00', 1),
(50, 9, 0, 2, '0.00', 2, '0.00', 1),
(50, 10, 0, 2, '0.00', 8, '0.00', 1),
(51, 1, 0, 0, '50.00', 2, '100.00', 0),
(51, 3, 0, 0, '100.00', 4, '400.00', 0),
(51, 0, 1, 1, '500.00', 2, '1000.00', 0),
(51, 2, 0, 2, '0.00', 2, '0.00', 1),
(51, 9, 0, 2, '0.00', 2, '0.00', 1),
(51, 10, 0, 2, '0.00', 8, '0.00', 1),
(52, 1, 0, 0, '50.00', 2, '100.00', 0),
(52, 3, 0, 0, '100.00', 4, '400.00', 0),
(52, 0, 1, 1, '500.00', 2, '1000.00', 0),
(52, 2, 0, 2, '0.00', 2, '0.00', 1),
(52, 9, 0, 2, '0.00', 2, '0.00', 1),
(52, 10, 0, 2, '0.00', 8, '0.00', 1),
(53, 1, 0, 0, '50.00', 2, '100.00', 0),
(53, 3, 0, 0, '100.00', 4, '400.00', 0),
(53, 0, 1, 1, '500.00', 2, '1000.00', 0),
(53, 2, 0, 2, '0.00', 2, '0.00', 1),
(53, 9, 0, 2, '0.00', 2, '0.00', 1),
(53, 10, 0, 2, '0.00', 8, '0.00', 1),
(54, 1, 0, 0, '50.00', 2, '100.00', 0),
(54, 3, 0, 0, '100.00', 4, '400.00', 0),
(54, 0, 1, 1, '500.00', 2, '1000.00', 0),
(54, 2, 0, 2, '0.00', 2, '0.00', 1),
(54, 9, 0, 2, '0.00', 2, '0.00', 1),
(54, 10, 0, 2, '0.00', 8, '0.00', 1),
(56, 1, 0, 0, '50.00', 2, '100.00', 0),
(56, 3, 0, 0, '100.00', 4, '400.00', 0),
(56, 0, 1, 1, '500.00', 2, '1000.00', 0),
(56, 2, 0, 2, '0.00', 2, '0.00', 1),
(56, 9, 0, 2, '0.00', 2, '0.00', 1),
(56, 10, 0, 2, '0.00', 8, '0.00', 1),
(57, 1, 0, 0, '50.00', 2, '100.00', 0),
(57, 3, 0, 0, '100.00', 4, '400.00', 0),
(57, 0, 1, 1, '500.00', 2, '1000.00', 0),
(57, 2, 0, 2, '0.00', 2, '0.00', 1),
(57, 9, 0, 2, '0.00', 2, '0.00', 1),
(57, 10, 0, 2, '0.00', 8, '0.00', 1),
(59, 6, 0, 0, '80.00', 1, '80.00', 0),
(59, 3, 0, 0, '100.00', 1, '100.00', 0),
(59, 5, 0, 0, '80.00', 1, '80.00', 0),
(58, 6, 0, 0, '80.00', 1, '80.00', 0),
(58, 3, 0, 0, '100.00', 1, '100.00', 0),
(58, 5, 0, 0, '80.00', 1, '80.00', 0),
(58, 10, 0, 0, '70.00', 1, '70.00', 0),
(60, 1, 0, 0, '50.00', 2, '100.00', 0),
(60, 3, 0, 0, '100.00', 4, '400.00', 0),
(61, 1, 0, 0, '50.00', 2, '100.00', 0),
(61, 3, 0, 0, '100.00', 4, '400.00', 0),
(61, 0, 1, 1, '500.00', 2, '1000.00', 0),
(61, 2, 0, 2, '0.00', 2, '0.00', 1),
(61, 9, 0, 2, '0.00', 2, '0.00', 1),
(61, 10, 0, 2, '0.00', 8, '0.00', 1),
(62, 1, 0, 0, '50.00', 2, '100.00', 0),
(62, 3, 0, 0, '100.00', 4, '400.00', 0),
(62, 0, 1, 1, '500.00', 2, '1000.00', 0),
(62, 2, 0, 2, '0.00', 2, '0.00', 1),
(62, 9, 0, 2, '0.00', 2, '0.00', 1),
(62, 10, 0, 2, '0.00', 8, '0.00', 1),
(63, 1, 0, 0, '50.00', 2, '100.00', 0),
(63, 3, 0, 0, '100.00', 4, '400.00', 0),
(63, 0, 1, 1, '500.00', 2, '1000.00', 0),
(63, 2, 0, 2, '0.00', 2, '0.00', 1),
(63, 9, 0, 2, '0.00', 2, '0.00', 1),
(63, 10, 0, 2, '0.00', 8, '0.00', 1),
(64, 1, 0, 0, '50.00', 2, '100.00', 0),
(64, 3, 0, 0, '100.00', 4, '400.00', 0),
(64, 0, 1, 1, '500.00', 2, '1000.00', 0),
(64, 2, 0, 2, '0.00', 2, '0.00', 1),
(64, 9, 0, 2, '0.00', 2, '0.00', 1),
(64, 10, 0, 2, '0.00', 8, '0.00', 1),
(65, 1, 0, 0, '50.00', 2, '100.00', 0),
(65, 3, 0, 0, '100.00', 4, '400.00', 0),
(65, 0, 1, 1, '500.00', 2, '1000.00', 0),
(65, 2, 0, 2, '0.00', 2, '0.00', 1),
(65, 9, 0, 2, '0.00', 2, '0.00', 1),
(65, 10, 0, 2, '0.00', 8, '0.00', 1),
(66, 1, 0, 0, '50.00', 2, '100.00', 0),
(66, 3, 0, 0, '100.00', 4, '400.00', 0),
(66, 0, 1, 1, '500.00', 2, '1000.00', 0),
(66, 2, 0, 2, '0.00', 2, '0.00', 1),
(66, 9, 0, 2, '0.00', 2, '0.00', 1),
(66, 10, 0, 2, '0.00', 8, '0.00', 1),
(67, 1, 0, 0, '50.00', 2, '100.00', 0),
(67, 3, 0, 0, '100.00', 4, '400.00', 0),
(67, 0, 1, 1, '500.00', 2, '1000.00', 0),
(67, 2, 0, 2, '0.00', 2, '0.00', 1),
(67, 9, 0, 2, '0.00', 2, '0.00', 1),
(67, 10, 0, 2, '0.00', 8, '0.00', 1),
(68, 1, 0, 0, '50.00', 2, '100.00', 0),
(68, 3, 0, 0, '100.00', 4, '400.00', 0),
(68, 0, 1, 1, '500.00', 2, '1000.00', 0),
(68, 2, 0, 2, '0.00', 2, '0.00', 1),
(68, 9, 0, 2, '0.00', 2, '0.00', 1),
(68, 10, 0, 2, '0.00', 8, '0.00', 1),
(69, 1, 0, 0, '50.00', 2, '100.00', 0),
(69, 3, 0, 0, '100.00', 4, '400.00', 0),
(69, 0, 1, 1, '500.00', 2, '1000.00', 0),
(69, 2, 0, 2, '0.00', 2, '0.00', 1),
(69, 9, 0, 2, '0.00', 2, '0.00', 1),
(69, 10, 0, 2, '0.00', 8, '0.00', 1),
(70, 1, 0, 0, '50.00', 2, '100.00', 0),
(70, 3, 0, 0, '100.00', 4, '400.00', 0),
(70, 0, 1, 1, '500.00', 2, '1000.00', 0),
(70, 2, 0, 2, '0.00', 2, '0.00', 1),
(70, 9, 0, 2, '0.00', 2, '0.00', 1),
(70, 10, 0, 2, '0.00', 8, '0.00', 1),
(71, 1, 0, 0, '50.00', 2, '100.00', 0),
(71, 3, 0, 0, '100.00', 4, '400.00', 0),
(71, 0, 1, 1, '500.00', 2, '1000.00', 0),
(71, 2, 0, 2, '0.00', 2, '0.00', 1),
(71, 9, 0, 2, '0.00', 2, '0.00', 1),
(71, 10, 0, 2, '0.00', 8, '0.00', 1),
(72, 1, 0, 0, '50.00', 2, '100.00', 0),
(72, 3, 0, 0, '100.00', 4, '400.00', 0),
(72, 0, 1, 1, '500.00', 2, '1000.00', 0),
(72, 2, 0, 2, '0.00', 2, '0.00', 1),
(72, 9, 0, 2, '0.00', 2, '0.00', 1),
(72, 10, 0, 2, '0.00', 8, '0.00', 1),
(73, 1, 0, 0, '50.00', 2, '100.00', 0),
(73, 3, 0, 0, '100.00', 4, '400.00', 0),
(73, 0, 1, 1, '500.00', 2, '1000.00', 0),
(73, 2, 0, 2, '0.00', 2, '0.00', 1),
(73, 9, 0, 2, '0.00', 2, '0.00', 1),
(73, 10, 0, 2, '0.00', 8, '0.00', 1),
(74, 1, 0, 0, '50.00', 2, '100.00', 0),
(74, 3, 0, 0, '100.00', 4, '400.00', 0),
(74, 0, 1, 1, '500.00', 2, '1000.00', 0),
(74, 2, 0, 2, '0.00', 2, '0.00', 1),
(74, 9, 0, 2, '0.00', 2, '0.00', 1),
(74, 10, 0, 2, '0.00', 8, '0.00', 1),
(75, 1, 0, 0, '50.00', 2, '100.00', 0),
(75, 3, 0, 0, '100.00', 4, '400.00', 0),
(75, 0, 1, 1, '500.00', 2, '1000.00', 0),
(75, 2, 0, 2, '0.00', 2, '0.00', 1),
(75, 9, 0, 2, '0.00', 2, '0.00', 1),
(75, 10, 0, 2, '0.00', 8, '0.00', 1),
(76, 1, 0, 0, '50.00', 2, '100.00', 0),
(76, 3, 0, 0, '100.00', 4, '400.00', 0),
(76, 0, 1, 1, '500.00', 2, '1000.00', 0),
(76, 2, 0, 2, '0.00', 2, '0.00', 1),
(76, 9, 0, 2, '0.00', 2, '0.00', 1),
(76, 10, 0, 2, '0.00', 8, '0.00', 1),
(77, 1, 0, 0, '50.00', 2, '100.00', 0),
(77, 3, 0, 0, '100.00', 4, '400.00', 0),
(77, 0, 1, 1, '500.00', 2, '1000.00', 0),
(77, 2, 0, 2, '0.00', 2, '0.00', 1),
(77, 9, 0, 2, '0.00', 2, '0.00', 1),
(77, 10, 0, 2, '0.00', 8, '0.00', 1),
(78, 1, 0, 0, '50.00', 2, '100.00', 0),
(78, 3, 0, 0, '100.00', 4, '400.00', 0),
(78, 0, 1, 1, '500.00', 2, '1000.00', 0),
(78, 2, 0, 2, '0.00', 2, '0.00', 1),
(78, 9, 0, 2, '0.00', 2, '0.00', 1),
(78, 10, 0, 2, '0.00', 8, '0.00', 1),
(79, 6, 0, 0, '80.00', 1, '80.00', 0),
(79, 3, 0, 0, '100.00', 1, '100.00', 0),
(79, 5, 0, 0, '80.00', 1, '80.00', 0),
(79, 0, 4, 1, '1200.00', 1, '1200.00', 0),
(80, 6, 0, 0, '80.00', 1, '80.00', 0),
(80, 3, 0, 0, '100.00', 1, '100.00', 0),
(80, 0, 3, 1, '1000.00', 1, '1000.00', 0),
(80, 9, 0, 2, '0.00', 2, '0.00', 3),
(80, 7, 0, 2, '0.00', 2, '0.00', 3),
(82, 1, 0, 0, '50.00', 2, '100.00', 0),
(82, 3, 0, 0, '100.00', 4, '400.00', 0),
(82, 0, 1, 1, '500.00', 2, '1000.00', 0),
(82, 2, 0, 2, '0.00', 2, '0.00', 1),
(82, 9, 0, 2, '0.00', 2, '0.00', 1),
(82, 10, 0, 2, '0.00', 8, '0.00', 1),
(83, 3, 0, 0, '100.00', 2, '200.00', 0),
(83, 6, 0, 0, '80.00', 1, '80.00', 0),
(83, 4, 0, 0, '50.00', 1, '50.00', 0),
(83, 13, 0, 0, '20.00', 4, '80.00', 0),
(83, 0, 3, 1, '1000.00', 2, '2000.00', 0),
(83, 9, 0, 2, '0.00', 4, '0.00', 3),
(83, 7, 0, 2, '0.00', 4, '0.00', 3),
(83, 0, 4, 1, '1200.00', 1, '1200.00', 0),
(84, 6, 0, 0, '80.00', 1, '80.00', 0),
(84, 3, 0, 0, '100.00', 1, '100.00', 0),
(84, 5, 0, 0, '80.00', 1, '80.00', 0),
(84, 0, 3, 1, '1000.00', 1, '1000.00', 0),
(84, 9, 0, 2, '0.00', 2, '0.00', 3),
(84, 7, 0, 2, '0.00', 2, '0.00', 3),
(85, 13, 0, 0, '20.00', 3, '60.00', 0),
(85, 0, 3, 1, '1000.00', 1, '1000.00', 0),
(85, 9, 0, 2, '0.00', 2, '0.00', 3),
(85, 7, 0, 2, '0.00', 2, '0.00', 3),
(85, 0, 2, 1, '1000.00', 1, '1000.00', 0),
(85, 1, 0, 2, '0.00', 5, '0.00', 2),
(85, 10, 0, 2, '0.00', 5, '0.00', 2),
(85, 9, 0, 2, '0.00', 2, '0.00', 2),
(86, 6, 0, 0, '80.00', 1, '80.00', 0),
(86, 3, 0, 0, '100.00', 1, '100.00', 0),
(86, 5, 0, 0, '80.00', 1, '80.00', 0),
(86, 13, 0, 0, '20.00', 3, '60.00', 0),
(86, 1, 0, 0, '50.00', 1, '50.00', 0),
(87, 1, 0, 0, '50.00', 2, '100.00', 0),
(87, 3, 0, 0, '100.00', 4, '400.00', 0),
(87, 0, 1, 1, '450.00', 2, '900.00', 0),
(87, 2, 0, 2, '0.00', 2, '0.00', 1),
(87, 9, 0, 2, '0.00', 2, '0.00', 1),
(87, 10, 0, 2, '0.00', 8, '0.00', 1),
(88, 6, 0, 0, '70.00', 1, '70.00', 0),
(88, 0, 3, 1, '1000.00', 1, '1000.00', 0),
(88, 9, 0, 2, '0.00', 2, '0.00', 3),
(88, 7, 0, 2, '0.00', 2, '0.00', 3),
(88, 0, 1, 1, '450.00', 1, '450.00', 0),
(88, 2, 0, 2, '0.00', 1, '0.00', 1),
(88, 9, 0, 2, '0.00', 1, '0.00', 1),
(88, 10, 0, 2, '0.00', 4, '0.00', 1),
(89, 1, 0, 0, '50.00', 1, '50.00', 0),
(89, 6, 0, 0, '80.00', 3, '240.00', 0),
(89, 3, 0, 0, '100.00', 2, '200.00', 0),
(89, 0, 3, 1, '1000.00', 1, '1000.00', 0),
(89, 9, 0, 2, '0.00', 2, '0.00', 3),
(89, 7, 0, 2, '0.00', 2, '0.00', 3),
(89, 0, 1, 1, '500.00', 1, '500.00', 0),
(89, 2, 0, 2, '0.00', 1, '0.00', 1),
(89, 9, 0, 2, '0.00', 1, '0.00', 1),
(89, 10, 0, 2, '0.00', 4, '0.00', 1),
(90, 10, 0, 0, '70.00', 1, '70.00', 0),
(90, 13, 0, 0, '20.00', 1, '20.00', 0),
(90, 0, 2, 1, '1000.00', 2, '2000.00', 0),
(90, 1, 0, 2, '0.00', 10, '0.00', 2),
(90, 10, 0, 2, '0.00', 10, '0.00', 2),
(90, 9, 0, 2, '0.00', 4, '0.00', 2),
(92, 0, 2, 1, '1000.00', 1, '1000.00', 0),
(92, 1, 0, 2, '0.00', 5, '0.00', 2),
(92, 10, 0, 2, '0.00', 5, '0.00', 2),
(92, 9, 0, 2, '0.00', 2, '0.00', 2),
(55, 4, 0, 0, '50.00', 1, '50.00', 0),
(91, 0, 2, 1, '1000.00', 1, '1000.00', 0),
(91, 1, 0, 2, '0.00', 5, '0.00', 2),
(91, 10, 0, 2, '0.00', 5, '0.00', 2),
(91, 9, 0, 2, '0.00', 2, '0.00', 2),
(81, 1, 0, 0, '50.00', 2, '100.00', 0),
(81, 3, 0, 0, '100.00', 4, '400.00', 0),
(81, 0, 1, 1, '500.00', 2, '1000.00', 0),
(81, 2, 0, 2, '0.00', 2, '0.00', 1),
(81, 9, 0, 2, '0.00', 2, '0.00', 1),
(81, 10, 0, 2, '0.00', 8, '0.00', 1),
(93, 1, 0, 0, '50.00', 2, '100.00', 0),
(93, 3, 0, 0, '100.00', 4, '400.00', 0),
(93, 0, 1, 1, '450.00', 2, '900.00', 0),
(93, 2, 0, 2, '0.00', 2, '0.00', 1),
(93, 9, 0, 2, '0.00', 2, '0.00', 1),
(93, 10, 0, 2, '0.00', 8, '0.00', 1),
(94, 1, 0, 0, '50.00', 2, '100.00', 0),
(94, 3, 0, 0, '100.00', 4, '400.00', 0),
(94, 0, 1, 1, '450.00', 2, '900.00', 0),
(94, 2, 0, 2, '0.00', 2, '0.00', 1),
(94, 9, 0, 2, '0.00', 2, '0.00', 1),
(94, 10, 0, 2, '0.00', 8, '0.00', 1),
(95, 6, 0, 0, '70.00', 1, '70.00', 0),
(96, 3, 0, 0, '100.00', 1, '100.00', 0),
(96, 5, 0, 0, '80.00', 1, '80.00', 0),
(97, 6, 0, 0, '70.00', 1, '70.00', 0),
(97, 3, 0, 0, '100.00', 1, '100.00', 0),
(97, 5, 0, 0, '80.00', 1, '80.00', 0),
(98, 6, 0, 0, '70.00', 1, '70.00', 0),
(98, 3, 0, 0, '100.00', 1, '100.00', 0),
(98, 7, 0, 0, '180.00', 1, '180.00', 0),
(98, 1, 0, 0, '50.00', 1, '50.00', 0),
(99, 6, 0, 0, '70.00', 1, '70.00', 0),
(99, 3, 0, 0, '100.00', 1, '100.00', 0),
(99, 5, 0, 0, '80.00', 1, '80.00', 0),
(99, 7, 0, 0, '180.00', 1, '180.00', 0),
(100, 0, 3, 1, '1000.00', 1, '1000.00', 0),
(100, 9, 0, 2, '0.00', 2, '0.00', 3),
(100, 7, 0, 2, '0.00', 2, '0.00', 3),
(101, 1, 0, 0, '50.00', 2, '100.00', 0),
(101, 3, 0, 0, '100.00', 4, '400.00', 0),
(101, 0, 1, 1, '450.00', 2, '900.00', 0),
(101, 2, 0, 2, '0.00', 2, '0.00', 1),
(101, 9, 0, 2, '0.00', 2, '0.00', 1),
(101, 10, 0, 2, '0.00', 8, '0.00', 1),
(102, 1, 0, 0, '50.00', 2, '100.00', 0),
(102, 3, 0, 0, '100.00', 4, '400.00', 0),
(102, 0, 1, 1, '450.00', 2, '900.00', 0),
(102, 2, 0, 2, '0.00', 2, '0.00', 1),
(102, 9, 0, 2, '0.00', 2, '0.00', 1),
(102, 10, 0, 2, '0.00', 8, '0.00', 1),
(103, 1, 0, 0, '50.00', 2, '100.00', 0),
(103, 3, 0, 0, '100.00', 4, '400.00', 0),
(103, 0, 1, 1, '450.00', 2, '900.00', 0),
(103, 2, 0, 2, '0.00', 2, '0.00', 1),
(103, 9, 0, 2, '0.00', 2, '0.00', 1),
(103, 10, 0, 2, '0.00', 8, '0.00', 1),
(104, 0, 3, 1, '1000.00', 1, '1000.00', 0),
(104, 9, 0, 2, '0.00', 2, '0.00', 3),
(104, 7, 0, 2, '0.00', 2, '0.00', 3),
(104, 0, 1, 1, '450.00', 1, '450.00', 0),
(104, 2, 0, 2, '0.00', 1, '0.00', 1),
(104, 9, 0, 2, '0.00', 1, '0.00', 1),
(104, 10, 0, 2, '0.00', 4, '0.00', 1),
(104, 0, 2, 1, '1000.00', 1, '1000.00', 0),
(104, 1, 0, 2, '0.00', 5, '0.00', 2),
(104, 10, 0, 2, '0.00', 5, '0.00', 2),
(104, 9, 0, 2, '0.00', 2, '0.00', 2),
(104, 0, 4, 1, '1100.00', 1, '1100.00', 0),
(105, 6, 0, 0, '70.00', 1, '70.00', 0),
(105, 3, 0, 0, '100.00', 1, '100.00', 0),
(105, 5, 0, 0, '80.00', 1, '80.00', 0),
(106, 1, 0, 0, '50.00', 2, '100.00', 0),
(106, 3, 0, 0, '100.00', 4, '400.00', 0),
(106, 0, 1, 1, '450.00', 2, '900.00', 0),
(106, 2, 0, 2, '0.00', 2, '0.00', 1),
(106, 9, 0, 2, '0.00', 2, '0.00', 1),
(106, 10, 0, 2, '0.00', 8, '0.00', 1),
(107, 1, 0, 0, '50.00', 2, '100.00', 0),
(107, 3, 0, 0, '100.00', 4, '400.00', 0),
(107, 0, 1, 1, '450.00', 2, '900.00', 0),
(107, 2, 0, 2, '0.00', 2, '0.00', 1),
(107, 9, 0, 2, '0.00', 2, '0.00', 1),
(107, 10, 0, 2, '0.00', 8, '0.00', 1),
(108, 1, 0, 0, '50.00', 1, '50.00', 0),
(108, 7, 0, 0, '180.00', 1, '180.00', 0),
(110, 0, 3, 1, '1000.00', 1, '1000.00', 0),
(110, 9, 0, 2, '0.00', 2, '0.00', 3),
(110, 7, 0, 2, '0.00', 2, '0.00', 3),
(109, 0, 3, 1, '1000.00', 1, '1000.00', 0),
(109, 9, 0, 2, '0.00', 2, '0.00', 3),
(109, 7, 0, 2, '0.00', 2, '0.00', 3),
(111, 6, 0, 0, '70.00', 1, '70.00', 0),
(111, 3, 0, 0, '100.00', 1, '100.00', 0),
(111, 5, 0, 0, '80.00', 1, '80.00', 0),
(111, 7, 0, 0, '180.00', 1, '180.00', 0),
(111, 4, 0, 0, '50.00', 2, '100.00', 0),
(112, 5, 0, 0, '80.00', 1, '80.00', 0),
(112, 10, 0, 0, '70.00', 1, '70.00', 0),
(112, 9, 0, 0, '150.00', 1, '150.00', 0),
(113, 6, 0, 0, '70.00', 1, '70.00', 0),
(113, 3, 0, 0, '100.00', 1, '100.00', 0),
(113, 5, 0, 0, '80.00', 1, '80.00', 0),
(113, 10, 0, 0, '70.00', 1, '70.00', 0),
(114, 6, 0, 0, '70.00', 1, '70.00', 0),
(114, 3, 0, 0, '100.00', 1, '100.00', 0),
(115, 6, 0, 0, '70.00', 1, '70.00', 0),
(115, 3, 0, 0, '100.00', 1, '100.00', 0),
(115, 5, 0, 0, '80.00', 1, '80.00', 0),
(115, 10, 0, 0, '70.00', 1, '70.00', 0),
(116, 1, 0, 0, '50.00', 1, '50.00', 0),
(116, 7, 0, 0, '180.00', 1, '180.00', 0),
(116, 9, 0, 0, '150.00', 1, '150.00', 0),
(117, 1, 0, 0, '50.00', 2, '-100.00', 0),
(117, 3, 0, 0, '100.00', 4, '-400.00', 0),
(117, 0, 1, 1, '450.00', 2, '-900.00', 0),
(117, 2, 0, 2, '0.00', 2, '0.00', 1),
(117, 9, 0, 2, '0.00', 2, '0.00', 1),
(117, 10, 0, 2, '0.00', 8, '0.00', 1),
(118, 1, 0, 0, '50.00', 2, '-100.00', 0),
(118, 3, 0, 0, '100.00', 4, '-400.00', 0),
(118, 0, 1, 1, '450.00', 2, '-900.00', 0),
(118, 2, 0, 2, '0.00', 2, '0.00', 1),
(118, 9, 0, 2, '0.00', 2, '0.00', 1),
(118, 10, 0, 2, '0.00', 8, '0.00', 1),
(119, 1, 0, 0, '50.00', 2, '100.00', 0),
(119, 3, 0, 0, '100.00', 4, '400.00', 0),
(119, 0, 1, 1, '450.00', 2, '900.00', 0),
(119, 2, 0, 2, '0.00', 2, '0.00', 1),
(119, 9, 0, 2, '0.00', 2, '0.00', 1),
(119, 10, 0, 2, '0.00', 8, '0.00', 1),
(120, 1, 0, 0, '50.00', 2, '-100.00', 0),
(120, 3, 0, 0, '100.00', 4, '-400.00', 0),
(120, 0, 1, 1, '450.00', 2, '-900.00', 0),
(120, 2, 0, 2, '0.00', 2, '0.00', 1),
(120, 9, 0, 2, '0.00', 2, '0.00', 1),
(120, 10, 0, 2, '0.00', 8, '0.00', 1),
(121, 1, 0, 0, '50.00', 2, '100.00', 0),
(121, 3, 0, 0, '100.00', 4, '400.00', 0),
(121, 0, 1, 1, '450.00', 2, '900.00', 0),
(121, 2, 0, 2, '0.00', 2, '0.00', 1),
(121, 9, 0, 2, '0.00', 2, '0.00', 1),
(121, 10, 0, 2, '0.00', 8, '0.00', 1),
(122, 1, 0, 0, '50.00', 2, '100.00', 0),
(122, 3, 0, 0, '100.00', 4, '400.00', 0),
(122, 0, 1, 1, '450.00', 2, '900.00', 0),
(122, 2, 0, 2, '0.00', 2, '0.00', 1),
(122, 9, 0, 2, '0.00', 2, '0.00', 1),
(122, 10, 0, 2, '0.00', 8, '0.00', 1),
(123, 1, 0, 0, '50.00', 2, '100.00', 0),
(123, 3, 0, 0, '100.00', 4, '400.00', 0),
(123, 0, 1, 1, '450.00', 2, '900.00', 0),
(123, 2, 0, 2, '0.00', 2, '0.00', 1),
(123, 9, 0, 2, '0.00', 2, '0.00', 1),
(123, 10, 0, 2, '0.00', 8, '0.00', 1),
(124, 1, 0, 0, '50.00', 2, '100.00', 0),
(124, 3, 0, 0, '100.00', 4, '400.00', 0),
(124, 0, 1, 1, '450.00', 2, '900.00', 0),
(124, 2, 0, 2, '0.00', 2, '0.00', 1),
(124, 9, 0, 2, '0.00', 2, '0.00', 1),
(124, 10, 0, 2, '0.00', 8, '0.00', 1),
(125, 1, 0, 0, '50.00', 2, '100.00', 0),
(125, 3, 0, 0, '100.00', 4, '400.00', 0),
(125, 0, 1, 1, '450.00', 2, '900.00', 0),
(125, 2, 0, 2, '0.00', 2, '0.00', 1),
(125, 9, 0, 2, '0.00', 2, '0.00', 1),
(125, 10, 0, 2, '0.00', 8, '0.00', 1),
(127, 1, 0, 0, '50.00', 2, '100.00', 0),
(127, 3, 0, 0, '100.00', 4, '400.00', 0),
(127, 0, 1, 1, '450.00', 2, '900.00', 0),
(127, 2, 0, 2, '0.00', 2, '0.00', 1),
(127, 9, 0, 2, '0.00', 2, '0.00', 1),
(127, 10, 0, 2, '0.00', 8, '0.00', 1),
(129, 1, 0, 0, '50.00', 2, '-100.00', 0),
(129, 3, 0, 0, '100.00', 4, '-400.00', 0),
(129, 0, 1, 1, '450.00', 2, '-900.00', 0),
(129, 2, 0, 2, '0.00', 2, '0.00', 1),
(129, 9, 0, 2, '0.00', 2, '0.00', 1),
(129, 10, 0, 2, '0.00', 8, '0.00', 1),
(128, 1, 0, 0, '50.00', 2, '100.00', 0),
(128, 3, 0, 0, '100.00', 4, '400.00', 0),
(128, 5, 0, 0, '80.00', 2, '160.00', 0),
(128, 0, 1, 1, '500.00', 2, '1000.00', 0),
(128, 2, 0, 2, '0.00', 2, '0.00', 1),
(128, 9, 0, 2, '0.00', 2, '0.00', 1),
(128, 10, 0, 2, '0.00', 8, '0.00', 1),
(126, 3, 0, 0, '100.00', 5, '500.00', 0),
(130, 1, 0, 0, '50.00', 1, '-50.00', 0),
(130, 3, 0, 0, '100.00', 1, '-100.00', 0),
(130, 0, 1, 1, '450.00', 1, '-450.00', 0),
(130, 2, 0, 2, '0.00', 1, '0.00', 1),
(130, 9, 0, 2, '0.00', 1, '0.00', 1),
(130, 10, 0, 2, '0.00', 4, '0.00', 1),
(131, 1, 0, 0, '50.00', 1, '-50.00', 0),
(131, 3, 0, 0, '100.00', 1, '-100.00', 0),
(131, 0, 1, 1, '450.00', 1, '-450.00', 0),
(131, 2, 0, 2, '0.00', 1, '0.00', 1),
(131, 9, 0, 2, '0.00', 1, '0.00', 1),
(131, 10, 0, 2, '0.00', 4, '0.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `trans_logs`
--

CREATE TABLE `trans_logs` (
  `log_id` int(11) NOT NULL,
  `user_fullname` varchar(45) NOT NULL,
  `log_type` varchar(45) NOT NULL,
  `details` varchar(250) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_logs`
--

INSERT INTO `trans_logs` (`log_id`, `user_fullname`, `log_type`, `details`, `date_time`) VALUES
(1000001, ', ', 'SetOrder', 'New transaction added S126 by U103', '2018-08-03 17:36:59'),
(1000002, ', ', 'SetOrder', 'New transaction added S127 by U103', '2018-08-03 17:42:41'),
(1000003, 'jiktorres', 'SetOrder', 'New transaction added S128 by U103', '2018-08-03 17:58:53'),
(1000004, 'janedoe', 'Refund', 'Transaction refunded S129 by RCPT#: 1200000', '2018-08-03 18:10:10'),
(1000005, 'xanderford', 'UpdateOrder', 'Transaction updated S128', '2018-08-03 18:22:59'),
(1000006, 'xanderford', 'UpdateOrder', 'Transaction updated S128 by U109', '2018-08-03 18:25:34'),
(1000007, 'um_developer', 'Payment', 'Transaction refunded S128 RCPT#: 2000031', '2018-08-03 18:34:59'),
(1000008, 'um_developer', 'Payment', 'Transaction payment S127 RCPT#: 2000032', '2018-08-03 18:36:21'),
(1000009, 'um_developer', 'Cancel', 'Transaction cancelled S128 by U108', '2018-08-03 18:40:53'),
(1000010, 'um_developer', 'Discount', 'Transaction discounted S126 by U108', '2018-08-03 18:47:37'),
(1000011, 'um_developer', 'Void', 'Item void S126 by U108 - Product: P1', '2018-08-03 18:53:15'),
(1000012, 'um_developer', 'Void', 'Item void S126 by U108 - Package: G1', '2018-08-03 18:58:54'),
(1000013, 'xanderford', 'UpdateOrder', 'Transaction updated S126 by U109', '2018-08-03 19:00:05'),
(1000014, 'janedoe', 'Refund', 'Transaction refunded S131 RCPT#: 2000032', '2018-08-03 19:26:56'),
(1000015, 'xanderford', 'Void', 'Item void S126 by U108 - Product: P1', '2018-08-03 19:41:17');

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
  `staff` int(1) NOT NULL DEFAULT '0',
  `removed` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `lastname`, `firstname`, `middlename`, `contact`, `email`, `address`, `date_registered`, `administrator`, `cashier`, `staff`, `removed`) VALUES
(101, 'super_admin', 'alphabravocharliedelta', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', '2017-10-10 19:34:33', 1, 0, 0, 0),
(102, 'nelda', 'kallay1975', 'NELDA', 'PAGSAC', 'BAGUIOHANON', '2969754', 'celinemariepagsac@gmail.com', 'Bl. 27, Lot 4, Gallera de Oro, Bago, Davao City', '2017-10-10 19:38:54', 1, 0, 0, 1),
(103, 'jiktorres', 'jiktorres', 'Torres', 'Jiki', 'Zyrus', '09228031290', 'jiki@gmail.com', 'Sasa, Davao City', '2017-10-10 19:40:32', 0, 1, 1, 0),
(104, 'ladysheen', 'ladysheen', 'GIlbang', 'Lady Sheen', 'Acolentaba', '09888787878', 'lsg@gmail.com', 'Catalunan Grande, Davao City', '2017-10-10 19:41:30', 0, 0, 0, 1),
(105, 'ivyybi', 'ivyybi', 'Ybiernas', 'Ivy', 'Villegas', '0909898897', 'ybi@gmail.com', 'Mawab, Compostela Valley', '2017-10-10 19:52:08', 0, 0, 0, 1),
(106, 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', '2018-02-04 02:31:33', 0, 0, 0, 1),
(107, 'srmafel_inting', 'fsilgc', 'Inting', 'Ma. Felina ', 'Saban', '09232838367', 'srmafel_inting@yahoo.com', 'JS Francisco Village, Talomo , Davao City', '2018-02-06 16:19:07', 1, 0, 0, 1),
(108, 'um_developer', 'jiktorres', 'TORRES', 'JIK', 'ABAS', '+639228031290', 'jikiboi03@gmail.com', 'Sasa, Davao City', '2018-02-07 14:06:29', 1, 1, 0, 0),
(109, 'xanderford', 'xanderford', 'Ford', 'Xander', 'Marlou', '09989898988', 'xander@gmail.com', 'Brgy Barrio Patay, Davao City', '2018-03-12 23:23:04', 0, 0, 1, 0),
(110, 'as', 'as', 'as', 'as', 'as', 'as', 'as', 'as', '2018-07-23 19:55:06', 0, 0, 0, 1),
(111, 'janedoe', 'janedoe', 'DOE', 'JANE', 'SMITH', '090909090', 'jane@gmail.com', 'Sasa, Davao City', '2018-07-24 12:55:08', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `x_readings`
--

CREATE TABLE `x_readings` (
  `reading_no` int(11) NOT NULL,
  `pos_no` int(11) NOT NULL,
  `cashier_username` varchar(45) NOT NULL,
  `date` varchar(20) NOT NULL,
  `trans_count_dine_in` int(11) NOT NULL,
  `trans_count_take_out` int(11) NOT NULL,
  `trans_count_total` int(11) NOT NULL,
  `trans_count_cleared` int(11) NOT NULL,
  `trans_count_cancelled` int(11) NOT NULL,
  `trans_count_refunded` int(11) NOT NULL,
  `void_items_count` int(11) NOT NULL,
  `net_sales` decimal(10,2) NOT NULL,
  `discounts_rendered_sc` decimal(10,2) NOT NULL,
  `discounts_rendered_pwd` decimal(10,2) NOT NULL,
  `discounts_rendered_promo` decimal(10,2) NOT NULL,
  `discounts_rendered_total` decimal(10,2) NOT NULL,
  `gross_sales` decimal(10,2) NOT NULL,
  `cancelled_sales` decimal(10,2) NOT NULL,
  `refunded_sales` decimal(10,2) NOT NULL,
  `vat_sales` decimal(10,2) NOT NULL,
  `vat_amount` decimal(10,2) NOT NULL,
  `vat_exempt` decimal(10,2) NOT NULL,
  `start_rcpt_no` int(11) NOT NULL,
  `end_rcpt_no` int(11) NOT NULL,
  `encoded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `x_readings`
--

INSERT INTO `x_readings` (`reading_no`, `pos_no`, `cashier_username`, `date`, `trans_count_dine_in`, `trans_count_take_out`, `trans_count_total`, `trans_count_cleared`, `trans_count_cancelled`, `trans_count_refunded`, `void_items_count`, `net_sales`, `discounts_rendered_sc`, `discounts_rendered_pwd`, `discounts_rendered_promo`, `discounts_rendered_total`, `gross_sales`, `cancelled_sales`, `refunded_sales`, `vat_sales`, `vat_amount`, `vat_exempt`, `start_rcpt_no`, `end_rcpt_no`, `encoded`) VALUES
(1, 1, 'um_developer', '2018-07-30', 2, 0, 2, 2, 0, 0, 0, '2420.00', '100.00', '280.00', '0.00', '380.00', '2800.00', '0.00', '0.00', '0.00', '0.00', '0.00', 2000028, 0, '2018-07-30 23:32:55'),
(2, 1, 'um_developer', '2018-07-30', 2, 0, 2, 2, 0, 0, 0, '2420.00', '100.00', '280.00', '0.00', '380.00', '2800.00', '0.00', '0.00', '0.00', '0.00', '0.00', 2000028, 0, '2018-07-30 23:37:12'),
(3, 1, 'um_developer', '2018-07-30', 2, 0, 2, 2, 0, 0, 0, '2420.00', '100.00', '280.00', '0.00', '380.00', '2800.00', '0.00', '0.00', '0.00', '0.00', '0.00', 2000028, 0, '2018-07-30 23:38:45'),
(4, 1, 'um_developer', '2018-07-30', 2, 0, 2, 2, 0, 0, 0, '2420.00', '100.00', '280.00', '0.00', '380.00', '2800.00', '0.00', '0.00', '0.00', '0.00', '0.00', 2000028, 0, '2018-07-30 23:40:25'),
(5, 1, 'um_developer', '2018-07-30', 2, 0, 2, 2, 0, 0, 0, '2420.00', '100.00', '280.00', '0.00', '380.00', '2800.00', '0.00', '0.00', '0.00', '0.00', '0.00', 2000028, 2000029, '2018-07-30 23:43:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`disc_id`);

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
-- Indexes for table `pack_discounts`
--
ALTER TABLE `pack_discounts`
  ADD PRIMARY KEY (`pd_id`);

--
-- Indexes for table `pos`
--
ALTER TABLE `pos`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `prod_discounts`
--
ALTER TABLE `prod_discounts`
  ADD PRIMARY KEY (`pd_id`);

--
-- Indexes for table `store_config`
--
ALTER TABLE `store_config`
  ADD PRIMARY KEY (`conf_id`);

--
-- Indexes for table `s_readings`
--
ALTER TABLE `s_readings`
  ADD PRIMARY KEY (`reading_no`);

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
-- Indexes for table `trans_logs`
--
ALTER TABLE `trans_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `x_readings`
--
ALTER TABLE `x_readings`
  ADD PRIMARY KEY (`reading_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `disc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001023;
--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `pack_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pack_discounts`
--
ALTER TABLE `pack_discounts`
  MODIFY `pd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pos`
--
ALTER TABLE `pos`
  MODIFY `pos_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `prod_discounts`
--
ALTER TABLE `prod_discounts`
  MODIFY `pd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `store_config`
--
ALTER TABLE `store_config`
  MODIFY `conf_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `s_readings`
--
ALTER TABLE `s_readings`
  MODIFY `reading_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `tbl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `table_groups`
--
ALTER TABLE `table_groups`
  MODIFY `tbl_grp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT for table `trans_logs`
--
ALTER TABLE `trans_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000016;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;
--
-- AUTO_INCREMENT for table `x_readings`
--
ALTER TABLE `x_readings`
  MODIFY `reading_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
