-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 04, 2022 at 02:51 AM
-- Server version: 5.7.37
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `etolv_vially`
--

-- --------------------------------------------------------

--
-- Table structure for table `allowances_bonuses`
--

CREATE TABLE `allowances_bonuses` (
  `id` int(11) NOT NULL,
  `employees_id` int(11) NOT NULL,
  `amount` varchar(6) NOT NULL,
  `date` datetime NOT NULL,
  `details` varchar(255) NOT NULL,
  `settlement` int(11) NOT NULL,
  `settlement_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bugs`
--

CREATE TABLE `bugs` (
  `id` int(11) NOT NULL,
  `bug_num` varchar(60) NOT NULL,
  `date` datetime NOT NULL,
  `notes` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cairo_clients`
--

CREATE TABLE `cairo_clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `balance` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cairo_clients`
--

INSERT INTO `cairo_clients` (`id`, `name`, `phone`, `address1`, `address2`, `email`, `notes`, `balance`, `date`, `state`) VALUES
(1, 'د/عبد الرازق يوسف', '01008068904', '', '', '', '', '', '2021-01-09 00:00:00', ''),
(2, 'عميل نقدي', '', '', '', '', '', '', '2021-12-07 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `cairo_companies`
--

CREATE TABLE `cairo_companies` (
  `id` int(11) NOT NULL,
  `CompaniesName` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cairo_companies`
--

INSERT INTO `cairo_companies` (`id`, `CompaniesName`) VALUES
(2, 'مصنع فيالى'),
(3, 'لافيتو'),
(4, 'فلانتيجو'),
(6, 'ناين ويست');

-- --------------------------------------------------------

--
-- Table structure for table `cairo_config`
--

CREATE TABLE `cairo_config` (
  `id` int(11) NOT NULL,
  `CompanyName` varchar(255) NOT NULL,
  `isLogo` int(11) NOT NULL,
  `Logo` varchar(255) NOT NULL,
  `TimeZone` varchar(255) NOT NULL,
  `Currency` int(11) NOT NULL,
  `Language` int(11) NOT NULL,
  `E_mail` varchar(255) NOT NULL,
  `Website` varchar(255) NOT NULL,
  `PrintingAftermarket` int(11) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `ReturnPolicy` varchar(255) NOT NULL,
  `Phone` varchar(60) NOT NULL,
  `Branch` int(11) NOT NULL,
  `CustomField1` varchar(255) NOT NULL,
  `CustomField2` varchar(255) NOT NULL,
  `CustomField3` varchar(255) NOT NULL,
  `LastInvoiceNo` int(11) NOT NULL,
  `LastreceivingsInvoiceNo` varchar(255) NOT NULL,
  `LastsaleInvoiceNo` int(11) NOT NULL,
  `cat_items_show` varchar(255) NOT NULL,
  `sales_type` int(11) NOT NULL,
  `receivings_type` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cairo_config`
--

INSERT INTO `cairo_config` (`id`, `CompanyName`, `isLogo`, `Logo`, `TimeZone`, `Currency`, `Language`, `E_mail`, `Website`, `PrintingAftermarket`, `Address`, `ReturnPolicy`, `Phone`, `Branch`, `CustomField1`, `CustomField2`, `CustomField3`, `LastInvoiceNo`, `LastreceivingsInvoiceNo`, `LastsaleInvoiceNo`, `cat_items_show`, `sales_type`, `receivings_type`) VALUES
(1, 'Vially', 0, '', 'Africa/Cairo', 2, 1, '', '', 1, '', 'نسعد دائما بنواجدكم داخل الفرع... شكرا لثقتكم *الرجاء الاحتفاظ بالفاتوره كمستند اساسي *', '', 0, 'البضاعه المباعه ترد وتستبدل  خلال 14 يوم من تاريخ البون ماعدا ايام الاوكازيون خلال 3 ايام فقط  بشرط ان تكون علي حالتها الاصليه', 'الاكسسوار المباع لايرد ولايستبدل', '', 0, '884', 2836, '57', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cairo_customer_payments`
--

CREATE TABLE `cairo_customer_payments` (
  `id` int(11) NOT NULL,
  `client` varchar(255) NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `Date` date NOT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `Due_Date` date NOT NULL,
  `notes` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cairo_expenses`
--

CREATE TABLE `cairo_expenses` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `Amount` decimal(10,3) NOT NULL,
  `Employee` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `details` longtext NOT NULL,
  `user` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cairo_expenses_set`
--

CREATE TABLE `cairo_expenses_set` (
  `id` int(11) NOT NULL,
  `expensestype` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cairo_expenses_set`
--

INSERT INTO `cairo_expenses_set` (`id`, `expensestype`) VALUES
(4, 'كهرباء'),
(21, 'سلفه محمود عبد الله'),
(20, 'فاتوره فيزا'),
(24, 'سلفه احمد محروس'),
(12, 'ترزى'),
(14, 'نظافه'),
(25, 'سلفه محمد محمود'),
(22, 'سلفه احمد طه');

-- --------------------------------------------------------

--
-- Table structure for table `cairo_fawry`
--

CREATE TABLE `cairo_fawry` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `Amount` varchar(255) NOT NULL,
  `Employee` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `details` longtext NOT NULL,
  `user` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cairo_groups`
--

CREATE TABLE `cairo_groups` (
  `id` int(11) NOT NULL,
  `GroupName` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `useimage` int(11) NOT NULL,
  `background` varchar(7) NOT NULL,
  `rank` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cairo_groups`
--

INSERT INTO `cairo_groups` (`id`, `GroupName`, `image`, `useimage`, `background`, `rank`) VALUES
(4, 'بدلة', '', 0, '#ffcccc', '1');

-- --------------------------------------------------------

--
-- Table structure for table `cairo_items_hide`
--

CREATE TABLE `cairo_items_hide` (
  `item` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cairo_payments_suppliers`
--

CREATE TABLE `cairo_payments_suppliers` (
  `id` int(11) NOT NULL,
  `Supplier` varchar(255) NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `Date` date NOT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `Due_Date` date NOT NULL,
  `notes` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cairo_receivings`
--

CREATE TABLE `cairo_receivings` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `conversion` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cairo_receivings_inv`
--

CREATE TABLE `cairo_receivings_inv` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `Total` varchar(11) NOT NULL,
  `supplier` varchar(60) DEFAULT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `paid` varchar(11) NOT NULL,
  `DueDate` date NOT NULL,
  `CheckNumber` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `type` varchar(20) NOT NULL,
  `discount` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cairo_receivings_orders`
--

CREATE TABLE `cairo_receivings_orders` (
  `id` int(11) NOT NULL,
  `name` varchar(220) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cairo_receivings_orders_line`
--

CREATE TABLE `cairo_receivings_orders_line` (
  `id` int(11) NOT NULL,
  `inv` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cairo_receivings_suspended`
--

CREATE TABLE `cairo_receivings_suspended` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cairo_receivings_temporary`
--

CREATE TABLE `cairo_receivings_temporary` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cairo_sales`
--

CREATE TABLE `cairo_sales` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `sales_type` varchar(1) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cairo_sales_cart`
--

CREATE TABLE `cairo_sales_cart` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `Discount` varchar(3) NOT NULL,
  `Total` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cairo_sales_inv`
--

CREATE TABLE `cairo_sales_inv` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `discount` varchar(5) NOT NULL,
  `Total` varchar(11) NOT NULL,
  `supplier` varchar(60) DEFAULT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `paid` varchar(11) NOT NULL,
  `DueDate` date NOT NULL,
  `CheckNumber` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `type` int(11) NOT NULL,
  `sales_type` int(11) NOT NULL,
  `customer_name` varchar(225) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `saller_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cairo_sales_suspended`
--

CREATE TABLE `cairo_sales_suspended` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `sales_type` varchar(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cairo_sales_temporary`
--

CREATE TABLE `cairo_sales_temporary` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `sellerID` int(11) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `sales_type` varchar(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_name` varchar(225) DEFAULT NULL,
  `customer_phone` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cairo_settings`
--

CREATE TABLE `cairo_settings` (
  `id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cairo_settings`
--

INSERT INTO `cairo_settings` (`id`, `value`) VALUES
(1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `cairo_staff`
--

CREATE TABLE `cairo_staff` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `balance` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cairo_staff`
--

INSERT INTO `cairo_staff` (`id`, `name`, `phone`, `address1`, `address2`, `email`, `notes`, `balance`, `date`, `state`) VALUES
(4, 'محمد', '56', '56', '989', '88', '988', '', '2022-02-19 00:00:00', ''),
(2, 'محمود كمال', '01027060835', 'بنها', 'قها', 'mahmoud@gmail.com', 'مممانانانان', '', '2021-12-07 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `cairo_suppliers`
--

CREATE TABLE `cairo_suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `balance` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cairo_suppliers`
--

INSERT INTO `cairo_suppliers` (`id`, `name`, `phone`, `address1`, `address2`, `email`, `notes`, `balance`, `date`, `state`) VALUES
(1, 'Vially', '', '', '', '', '', '', '1970-01-01 00:00:00', ''),
(2, 'فيالي', '', '', '', '', '', '', '2020-07-06 00:00:00', ''),
(3, 'Nine west', '', '', '', '', '', '', '2020-10-31 00:00:00', ''),
(4, 'Red scoop', '', '', '', '', '', '', '2020-10-31 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `cairo_treasury`
--

CREATE TABLE `cairo_treasury` (
  `id` int(11) NOT NULL,
  `type` varchar(1) NOT NULL,
  `date` datetime NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `notes` longtext NOT NULL,
  `PaymentMethod` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cairo_users`
--

CREATE TABLE `cairo_users` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sale` varchar(1) NOT NULL,
  `buy` varchar(1) NOT NULL,
  `SoldReturns` varchar(1) NOT NULL,
  `purchasesReturns` varchar(1) NOT NULL,
  `DeleteBllsOfSale` varchar(1) NOT NULL,
  `DeletePurchaseInvoices` varchar(1) NOT NULL,
  `ModifyBillsOfSale` varchar(1) NOT NULL,
  `ModifyBillsBuy` varchar(1) NOT NULL,
  `Revenue` varchar(1) NOT NULL,
  `Expenses` varchar(1) NOT NULL,
  `Customers` varchar(1) NOT NULL,
  `Suppliers` varchar(1) NOT NULL,
  `GeneralSettings` varchar(1) NOT NULL,
  `Groups` varchar(1) NOT NULL,
  `Items` varchar(1) NOT NULL,
  `UsersAndPermissions` varchar(1) NOT NULL,
  `ReportsPurchases` varchar(1) NOT NULL,
  `SalesReports` varchar(1) NOT NULL,
  `ReportsSuppliers` varchar(1) NOT NULL,
  `CustomerReports` varchar(1) NOT NULL,
  `InventoryReports` varchar(1) NOT NULL,
  `ReportsRevenues` varchar(1) NOT NULL,
  `ExpenseReports` varchar(1) NOT NULL,
  `ReportsOfPayments` varchar(1) NOT NULL,
  `EditPrice` varchar(1) NOT NULL,
  `profit` varchar(1) NOT NULL,
  `employee` varchar(1) NOT NULL,
  `user_treasury` int(11) NOT NULL,
  `IsAdmin` int(11) NOT NULL,
  `permision_treasury_withdrawal` tinyint(1) NOT NULL,
  `permision_treasury_deposit` tinyint(1) NOT NULL,
  `permision_delete_treasury` tinyint(1) NOT NULL,
  `Item_movement_detection` tinyint(1) NOT NULL,
  `barcode_manual` tinyint(1) NOT NULL,
  `Cost_price` tinyint(1) NOT NULL,
  `colors` int(11) NOT NULL,
  `sizes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cairo_users`
--

INSERT INTO `cairo_users` (`id`, `name`, `username`, `password`, `sale`, `buy`, `SoldReturns`, `purchasesReturns`, `DeleteBllsOfSale`, `DeletePurchaseInvoices`, `ModifyBillsOfSale`, `ModifyBillsBuy`, `Revenue`, `Expenses`, `Customers`, `Suppliers`, `GeneralSettings`, `Groups`, `Items`, `UsersAndPermissions`, `ReportsPurchases`, `SalesReports`, `ReportsSuppliers`, `CustomerReports`, `InventoryReports`, `ReportsRevenues`, `ExpenseReports`, `ReportsOfPayments`, `EditPrice`, `profit`, `employee`, `user_treasury`, `IsAdmin`, `permision_treasury_withdrawal`, `permision_treasury_deposit`, `permision_delete_treasury`, `Item_movement_detection`, `barcode_manual`, `Cost_price`, `colors`, `sizes`) VALUES
(1, 'vially', 'vially', 'vially100', '1', '1', '1', '1', '', '', '', '', '1', '1', '1', '', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '1', '', '', '1', '1', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 'محمود كمال', 'medo012', 'medo012', '1', '1', '1', '1', '', '', '', '', '1', '1', '1', '', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '1', '', '', '', '', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `responsible` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `balance` decimal(10,3) NOT NULL,
  `details` char(255) NOT NULL,
  `pos` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `color` varchar(60) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `color`, `status`) VALUES
(1, 'الاسود', 0),
(2, 'كحلى', 0),
(3, 'فرانى', 0),
(4, 'رمادى وسط', 0),
(5, 'رمادى فاتح', 0),
(6, 'بنى', 0),
(7, 'كافية', 0),
(8, 'بيج', 0),
(9, 'زهرى', 0),
(10, 'زيتى', 0),
(11, 'بترولى', 0),
(12, 'رمادى*بيج', 0),
(13, 'فضى', 0),
(14, 'لبنى', 0),
(15, 'رمادى', 0),
(16, 'ابيض', 0),
(17, 'رمادى كوعة اسود', 0),
(18, 'رمادى كوعه رمادى', 0),
(19, 'رمادى كوعه كحلى', 0),
(20, 'بيج كوعه بنى', 0),
(21, 'مقلمات وكاروة', 0),
(22, 'سمنى', 0),
(23, 'عسلى', 0),
(24, 'موف غامق', 0),
(25, 'موف وسط لايلا', 0),
(26, 'موف فاتح', 0),
(27, 'بيج كتانى', 0),
(28, 'بيج كاكى', 0),
(29, 'سكرى', 0),
(30, 'تفاحى فاتح', 0),
(31, 'تفاحى وسط', 0),
(32, 'اصفر كنارى', 0),
(33, 'روز', 0),
(34, 'تركواز', 0),
(35, 'بطيخى', 0),
(36, 'لبنى فاتح', 0),
(37, 'كحلى فاتح', 0),
(38, 'زهرى غامق', 0),
(39, 'رمادى مستورد *موف', 0),
(40, 'فضى', 0),
(41, 'بنفسجى', 0),
(42, 'اخضر', 0),
(43, 'احمر', 0),
(44, 'فوشيا', 0),
(45, 'بتنجانى غامق', 0),
(46, 'نبيتى', 0),
(47, 'منقوش', 0),
(48, 'بنى فاتح', 0),
(49, 'برتقالى', 0),
(50, 'سادة', 0),
(51, 'الوان', 0),
(52, 'ازرق', 0),
(53, 'رمادى غامق', 0),
(54, 'زهبى', 0),
(55, 'اوف وايت', 0),
(56, 'تركواز غ', 0),
(57, 'طوبى', 0),
(58, 'سيمون', 0),
(59, 'روز غامق', 0),
(62, 'انجليزى', 0),
(63, 'بنى كاروه', 0),
(64, 'اسود لمع', 0);

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` int(11) NOT NULL,
  `employees_id` int(11) NOT NULL,
  `amount` varchar(6) NOT NULL,
  `date` datetime NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `stage` varchar(5) NOT NULL,
  `voluum` varchar(6) NOT NULL,
  `total` varchar(6) NOT NULL,
  `cost_of_requirements` decimal(11,3) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `settlement` int(11) NOT NULL DEFAULT '0',
  `settlement_date` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `costs_elements`
--

CREATE TABLE `costs_elements` (
  `id` int(11) NOT NULL,
  `cost_type` varchar(60) NOT NULL,
  `product_id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `details` varchar(60) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `costs_items`
--

CREATE TABLE `costs_items` (
  `id` int(11) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 NOT NULL,
  `units_of_measurement` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `depreciation_foundation_exp`
--

CREATE TABLE `depreciation_foundation_exp` (
  `id` int(11) NOT NULL,
  `exp_id` int(11) NOT NULL,
  `value` decimal(10,3) NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `depreciation_of_assets`
--

CREATE TABLE `depreciation_of_assets` (
  `id` int(11) NOT NULL,
  `assets_id` int(11) NOT NULL,
  `value` decimal(10,3) NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `embaba_clients`
--

CREATE TABLE `embaba_clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `balance` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `embaba_clients`
--

INSERT INTO `embaba_clients` (`id`, `name`, `phone`, `address1`, `address2`, `email`, `notes`, `balance`, `date`, `state`) VALUES
(1, 'د/عبد الرازق يوسف', '01008068904', '', '', '', '', '', '2021-01-09 00:00:00', ''),
(2, 'عميل نقدي', '', '', '', '', '', '', '2021-12-07 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `embaba_companies`
--

CREATE TABLE `embaba_companies` (
  `id` int(11) NOT NULL,
  `CompaniesName` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `embaba_companies`
--

INSERT INTO `embaba_companies` (`id`, `CompaniesName`) VALUES
(2, 'مصنع فيالى'),
(3, 'لافيتو'),
(4, 'فلانتيجو'),
(6, 'ناين ويست');

-- --------------------------------------------------------

--
-- Table structure for table `embaba_config`
--

CREATE TABLE `embaba_config` (
  `id` int(11) NOT NULL,
  `CompanyName` varchar(255) NOT NULL,
  `isLogo` int(11) NOT NULL,
  `Logo` varchar(255) NOT NULL,
  `TimeZone` varchar(255) NOT NULL,
  `Currency` int(11) NOT NULL,
  `Language` int(11) NOT NULL,
  `E_mail` varchar(255) NOT NULL,
  `Website` varchar(255) NOT NULL,
  `PrintingAftermarket` int(11) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `ReturnPolicy` varchar(255) NOT NULL,
  `Phone` varchar(60) NOT NULL,
  `Branch` int(11) NOT NULL,
  `CustomField1` varchar(255) NOT NULL,
  `CustomField2` varchar(255) NOT NULL,
  `CustomField3` varchar(255) NOT NULL,
  `LastInvoiceNo` int(11) NOT NULL,
  `LastreceivingsInvoiceNo` varchar(255) NOT NULL,
  `LastsaleInvoiceNo` int(11) NOT NULL,
  `cat_items_show` varchar(255) NOT NULL,
  `sales_type` int(11) NOT NULL,
  `receivings_type` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `embaba_config`
--

INSERT INTO `embaba_config` (`id`, `CompanyName`, `isLogo`, `Logo`, `TimeZone`, `Currency`, `Language`, `E_mail`, `Website`, `PrintingAftermarket`, `Address`, `ReturnPolicy`, `Phone`, `Branch`, `CustomField1`, `CustomField2`, `CustomField3`, `LastInvoiceNo`, `LastreceivingsInvoiceNo`, `LastsaleInvoiceNo`, `cat_items_show`, `sales_type`, `receivings_type`) VALUES
(1, 'Vially', 0, '', 'Africa/Cairo', 2, 1, '', '', 1, '', 'نسعد دائما بنواجدكم داخل الفرع... شكرا لثقتكم *الرجاء الاحتفاظ بالفاتوره كمستند اساسي *', '', 0, 'البضاعه المباعه ترد وتستبدل  خلال 14 يوم من تاريخ البون ماعدا ايام الاوكازيون خلال 3 ايام فقط  بشرط ان تكون علي حالتها الاصليه', 'الاكسسوار المباع لايرد ولايستبدل', '', 0, '884', 2835, '57', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `embaba_customer_payments`
--

CREATE TABLE `embaba_customer_payments` (
  `id` int(11) NOT NULL,
  `client` varchar(255) NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `Date` date NOT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `Due_Date` date NOT NULL,
  `notes` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `embaba_expenses`
--

CREATE TABLE `embaba_expenses` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `Amount` decimal(10,3) NOT NULL,
  `Employee` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `details` longtext NOT NULL,
  `user` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `embaba_expenses_set`
--

CREATE TABLE `embaba_expenses_set` (
  `id` int(11) NOT NULL,
  `expensestype` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `embaba_expenses_set`
--

INSERT INTO `embaba_expenses_set` (`id`, `expensestype`) VALUES
(4, 'كهرباء'),
(21, 'سلفه محمود عبد الله'),
(20, 'فاتوره فيزا'),
(24, 'سلفه احمد محروس'),
(12, 'ترزى'),
(14, 'نظافه'),
(25, 'سلفه محمد محمود'),
(22, 'سلفه احمد طه');

-- --------------------------------------------------------

--
-- Table structure for table `embaba_fawry`
--

CREATE TABLE `embaba_fawry` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `Amount` varchar(255) NOT NULL,
  `Employee` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `details` longtext NOT NULL,
  `user` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `embaba_groups`
--

CREATE TABLE `embaba_groups` (
  `id` int(11) NOT NULL,
  `GroupName` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `useimage` int(11) NOT NULL,
  `background` varchar(7) NOT NULL,
  `rank` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `embaba_groups`
--

INSERT INTO `embaba_groups` (`id`, `GroupName`, `image`, `useimage`, `background`, `rank`) VALUES
(4, 'بدلة', '', 0, '#ffcccc', '1');

-- --------------------------------------------------------

--
-- Table structure for table `embaba_items_hide`
--

CREATE TABLE `embaba_items_hide` (
  `item` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `embaba_payments_suppliers`
--

CREATE TABLE `embaba_payments_suppliers` (
  `id` int(11) NOT NULL,
  `Supplier` varchar(255) NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `Date` date NOT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `Due_Date` date NOT NULL,
  `notes` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `embaba_receivings`
--

CREATE TABLE `embaba_receivings` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `conversion` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `embaba_receivings_inv`
--

CREATE TABLE `embaba_receivings_inv` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `Total` varchar(11) NOT NULL,
  `supplier` varchar(60) DEFAULT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `paid` varchar(11) NOT NULL,
  `DueDate` date NOT NULL,
  `CheckNumber` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `type` varchar(20) NOT NULL,
  `discount` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `embaba_receivings_orders`
--

CREATE TABLE `embaba_receivings_orders` (
  `id` int(11) NOT NULL,
  `name` varchar(220) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `embaba_receivings_orders_line`
--

CREATE TABLE `embaba_receivings_orders_line` (
  `id` int(11) NOT NULL,
  `inv` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `embaba_receivings_suspended`
--

CREATE TABLE `embaba_receivings_suspended` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `embaba_receivings_temporary`
--

CREATE TABLE `embaba_receivings_temporary` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `embaba_sales`
--

CREATE TABLE `embaba_sales` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `sales_type` varchar(1) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `embaba_sales_cart`
--

CREATE TABLE `embaba_sales_cart` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `Discount` varchar(3) NOT NULL,
  `Total` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `embaba_sales_inv`
--

CREATE TABLE `embaba_sales_inv` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `discount` varchar(5) NOT NULL,
  `Total` varchar(11) NOT NULL,
  `supplier` varchar(60) DEFAULT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `paid` varchar(11) NOT NULL,
  `DueDate` date NOT NULL,
  `CheckNumber` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `type` int(11) NOT NULL,
  `sales_type` int(11) NOT NULL,
  `customer_name` varchar(225) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `saller_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `embaba_sales_suspended`
--

CREATE TABLE `embaba_sales_suspended` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `sales_type` varchar(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `embaba_sales_temporary`
--

CREATE TABLE `embaba_sales_temporary` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `sellerID` int(11) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `sales_type` varchar(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_name` varchar(225) DEFAULT NULL,
  `customer_phone` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `embaba_settings`
--

CREATE TABLE `embaba_settings` (
  `id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `embaba_settings`
--

INSERT INTO `embaba_settings` (`id`, `value`) VALUES
(1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `embaba_staff`
--

CREATE TABLE `embaba_staff` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `balance` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `embaba_staff`
--

INSERT INTO `embaba_staff` (`id`, `name`, `phone`, `address1`, `address2`, `email`, `notes`, `balance`, `date`, `state`) VALUES
(4, 'محمد', '56', '56', '989', '88', '988', '', '2022-02-19 00:00:00', ''),
(2, 'محمود كمال', '01027060835', 'بنها', 'قها', 'mahmoud@gmail.com', 'مممانانانان', '', '2021-12-07 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `embaba_suppliers`
--

CREATE TABLE `embaba_suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `balance` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `embaba_suppliers`
--

INSERT INTO `embaba_suppliers` (`id`, `name`, `phone`, `address1`, `address2`, `email`, `notes`, `balance`, `date`, `state`) VALUES
(1, 'Vially', '', '', '', '', '', '', '1970-01-01 00:00:00', ''),
(2, 'فيالي', '', '', '', '', '', '', '2020-07-06 00:00:00', ''),
(3, 'Nine west', '', '', '', '', '', '', '2020-10-31 00:00:00', ''),
(4, 'Red scoop', '', '', '', '', '', '', '2020-10-31 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `embaba_treasury`
--

CREATE TABLE `embaba_treasury` (
  `id` int(11) NOT NULL,
  `type` varchar(1) NOT NULL,
  `date` datetime NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `notes` longtext NOT NULL,
  `PaymentMethod` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `embaba_users`
--

CREATE TABLE `embaba_users` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sale` varchar(1) NOT NULL,
  `buy` varchar(1) NOT NULL,
  `SoldReturns` varchar(1) NOT NULL,
  `purchasesReturns` varchar(1) NOT NULL,
  `DeleteBllsOfSale` varchar(1) NOT NULL,
  `DeletePurchaseInvoices` varchar(1) NOT NULL,
  `ModifyBillsOfSale` varchar(1) NOT NULL,
  `ModifyBillsBuy` varchar(1) NOT NULL,
  `Revenue` varchar(1) NOT NULL,
  `Expenses` varchar(1) NOT NULL,
  `Customers` varchar(1) NOT NULL,
  `Suppliers` varchar(1) NOT NULL,
  `GeneralSettings` varchar(1) NOT NULL,
  `Groups` varchar(1) NOT NULL,
  `Items` varchar(1) NOT NULL,
  `UsersAndPermissions` varchar(1) NOT NULL,
  `ReportsPurchases` varchar(1) NOT NULL,
  `SalesReports` varchar(1) NOT NULL,
  `ReportsSuppliers` varchar(1) NOT NULL,
  `CustomerReports` varchar(1) NOT NULL,
  `InventoryReports` varchar(1) NOT NULL,
  `ReportsRevenues` varchar(1) NOT NULL,
  `ExpenseReports` varchar(1) NOT NULL,
  `ReportsOfPayments` varchar(1) NOT NULL,
  `EditPrice` varchar(1) NOT NULL,
  `profit` varchar(1) NOT NULL,
  `employee` varchar(1) NOT NULL,
  `user_treasury` int(11) NOT NULL,
  `IsAdmin` int(11) NOT NULL,
  `permision_treasury_withdrawal` tinyint(1) NOT NULL,
  `permision_treasury_deposit` tinyint(1) NOT NULL,
  `permision_delete_treasury` tinyint(1) NOT NULL,
  `Item_movement_detection` tinyint(1) NOT NULL,
  `barcode_manual` tinyint(1) NOT NULL,
  `Cost_price` tinyint(1) NOT NULL,
  `colors` int(11) NOT NULL,
  `sizes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `embaba_users`
--

INSERT INTO `embaba_users` (`id`, `name`, `username`, `password`, `sale`, `buy`, `SoldReturns`, `purchasesReturns`, `DeleteBllsOfSale`, `DeletePurchaseInvoices`, `ModifyBillsOfSale`, `ModifyBillsBuy`, `Revenue`, `Expenses`, `Customers`, `Suppliers`, `GeneralSettings`, `Groups`, `Items`, `UsersAndPermissions`, `ReportsPurchases`, `SalesReports`, `ReportsSuppliers`, `CustomerReports`, `InventoryReports`, `ReportsRevenues`, `ExpenseReports`, `ReportsOfPayments`, `EditPrice`, `profit`, `employee`, `user_treasury`, `IsAdmin`, `permision_treasury_withdrawal`, `permision_treasury_deposit`, `permision_delete_treasury`, `Item_movement_detection`, `barcode_manual`, `Cost_price`, `colors`, `sizes`) VALUES
(1, 'vially', 'vially', 'vially100', '1', '1', '1', '1', '', '', '', '', '1', '1', '1', '', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '1', '', '', '1', '1', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 'محمود كمال', 'medo012', 'medo012', '1', '1', '1', '1', '', '', '', '', '1', '1', '1', '', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '1', '', '', '', '', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `stages` varchar(255) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `details` longtext NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `establishment_expenses`
--

CREATE TABLE `establishment_expenses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `start` date NOT NULL,
  `to_date` date NOT NULL,
  `depreciation_period` int(11) NOT NULL,
  `value` decimal(10,0) NOT NULL,
  `scrap_value` decimal(10,0) NOT NULL,
  `notes` longtext CHARACTER SET utf8 NOT NULL,
  `stop` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `expensestype_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `notes` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `employees_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `expensestype`
--

CREATE TABLE `expensestype` (
  `expense_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `expensestype`
--

INSERT INTO `expensestype` (`expense_id`, `name`) VALUES
(1, 'ايجار'),
(2, 'عمالة مؤقته'),
(3, 'كهرباء'),
(4, 'مياه'),
(5, 'عتالة'),
(6, 'مشروبات'),
(7, 'مصروفات نقل'),
(8, 'اكراميات'),
(9, 'نظافة'),
(10, 'أدوات مكتبية'),
(11, 'سفر و انتقالات'),
(12, 'تليفون و فاكس'),
(13, 'ايجار سيارة'),
(14, 'مصروفات تسويق');

-- --------------------------------------------------------

--
-- Table structure for table `fixed_assets`
--

CREATE TABLE `fixed_assets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `start` date NOT NULL,
  `to_date` date NOT NULL,
  `depreciation_period` int(11) NOT NULL,
  `value` decimal(10,0) NOT NULL,
  `scrap_value` decimal(10,0) NOT NULL,
  `notes` longtext CHARACTER SET utf8 NOT NULL,
  `stop` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `amount` decimal(10,3) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `invoice_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `check_number` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `bank_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `inv_id`, `date`, `amount`, `supplier_id`, `payment_method`, `invoice_type`, `status`, `notes`, `check_number`, `due_date`, `bank_name`) VALUES
(1, '1301', '2016-10-18 16:21:18', '1500.000', 1, 2, 2, 0, '', '', '0000-00-00', ''),
(2, '', '2016-10-18 00:00:00', '-1000.000', 1, 1, 3, 0, '', '', '1970-01-01', '');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `groupid` varchar(255) NOT NULL,
  `item` varchar(70) NOT NULL,
  `date` date NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT '0',
  `Retail_price` varchar(11) NOT NULL,
  `price` varchar(11) NOT NULL,
  `Sale_wholesale_price` varchar(11) NOT NULL,
  `Barcode` varchar(255) NOT NULL,
  `Supplier` varchar(255) NOT NULL,
  `Discount` varchar(3) NOT NULL,
  `useimage` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `Background` varchar(11) NOT NULL,
  `OrderNo` varchar(255) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `alert_shortcomings` varbinary(6) NOT NULL,
  `subprice` varbinary(6) NOT NULL,
  `companies` int(11) NOT NULL,
  `sizes` varchar(255) NOT NULL,
  `colors` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `items_inv`
--

CREATE TABLE `items_inv` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(11) NOT NULL,
  `Item` varchar(11) NOT NULL,
  `quantity` varchar(20) NOT NULL,
  `discount` decimal(10,3) NOT NULL,
  `unit_price` decimal(20,2) NOT NULL,
  `color` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_clients`
--

CREATE TABLE `kawmya_clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `balance` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kawmya_clients`
--

INSERT INTO `kawmya_clients` (`id`, `name`, `phone`, `address1`, `address2`, `email`, `notes`, `balance`, `date`, `state`) VALUES
(1, 'د/عبد الرازق يوسف', '01008068904', '', '', '', '', '', '2021-01-09 00:00:00', ''),
(2, 'عميل نقدي', '', '', '', '', '', '', '2021-12-07 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_companies`
--

CREATE TABLE `kawmya_companies` (
  `id` int(11) NOT NULL,
  `CompaniesName` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kawmya_companies`
--

INSERT INTO `kawmya_companies` (`id`, `CompaniesName`) VALUES
(2, 'مصنع فيالى'),
(3, 'لافيتو'),
(4, 'فلانتيجو'),
(6, 'ناين ويست');

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_config`
--

CREATE TABLE `kawmya_config` (
  `id` int(11) NOT NULL,
  `CompanyName` varchar(255) NOT NULL,
  `isLogo` int(11) NOT NULL,
  `Logo` varchar(255) NOT NULL,
  `TimeZone` varchar(255) NOT NULL,
  `Currency` int(11) NOT NULL,
  `Language` int(11) NOT NULL,
  `E_mail` varchar(255) NOT NULL,
  `Website` varchar(255) NOT NULL,
  `PrintingAftermarket` int(11) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `ReturnPolicy` varchar(255) NOT NULL,
  `Phone` varchar(60) NOT NULL,
  `Branch` int(11) NOT NULL,
  `CustomField1` varchar(255) NOT NULL,
  `CustomField2` varchar(255) NOT NULL,
  `CustomField3` varchar(255) NOT NULL,
  `LastInvoiceNo` int(11) NOT NULL,
  `LastreceivingsInvoiceNo` varchar(255) NOT NULL,
  `LastsaleInvoiceNo` int(11) NOT NULL,
  `cat_items_show` varchar(255) NOT NULL,
  `sales_type` int(11) NOT NULL,
  `receivings_type` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kawmya_config`
--

INSERT INTO `kawmya_config` (`id`, `CompanyName`, `isLogo`, `Logo`, `TimeZone`, `Currency`, `Language`, `E_mail`, `Website`, `PrintingAftermarket`, `Address`, `ReturnPolicy`, `Phone`, `Branch`, `CustomField1`, `CustomField2`, `CustomField3`, `LastInvoiceNo`, `LastreceivingsInvoiceNo`, `LastsaleInvoiceNo`, `cat_items_show`, `sales_type`, `receivings_type`) VALUES
(1, 'Vially', 0, '', 'Africa/Cairo', 2, 1, '', '', 1, '', 'نسعد دائما بنواجدكم داخل الفرع... شكرا لثقتكم *الرجاء الاحتفاظ بالفاتوره كمستند اساسي *', '', 0, 'البضاعه المباعه ترد وتستبدل  خلال 14 يوم من تاريخ البون ماعدا ايام الاوكازيون خلال 3 ايام فقط  بشرط ان تكون علي حالتها الاصليه', 'الاكسسوار المباع لايرد ولايستبدل', '', 0, '884', 2835, '57', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_customer_payments`
--

CREATE TABLE `kawmya_customer_payments` (
  `id` int(11) NOT NULL,
  `client` varchar(255) NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `Date` date NOT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `Due_Date` date NOT NULL,
  `notes` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_expenses`
--

CREATE TABLE `kawmya_expenses` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `Amount` decimal(10,3) NOT NULL,
  `Employee` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `details` longtext NOT NULL,
  `user` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_expenses_set`
--

CREATE TABLE `kawmya_expenses_set` (
  `id` int(11) NOT NULL,
  `expensestype` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kawmya_expenses_set`
--

INSERT INTO `kawmya_expenses_set` (`id`, `expensestype`) VALUES
(4, 'كهرباء'),
(21, 'سلفه محمود عبد الله'),
(20, 'فاتوره فيزا'),
(24, 'سلفه احمد محروس'),
(12, 'ترزى'),
(14, 'نظافه'),
(25, 'سلفه محمد محمود'),
(22, 'سلفه احمد طه');

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_fawry`
--

CREATE TABLE `kawmya_fawry` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `Amount` varchar(255) NOT NULL,
  `Employee` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `details` longtext NOT NULL,
  `user` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_groups`
--

CREATE TABLE `kawmya_groups` (
  `id` int(11) NOT NULL,
  `GroupName` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `useimage` int(11) NOT NULL,
  `background` varchar(7) NOT NULL,
  `rank` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kawmya_groups`
--

INSERT INTO `kawmya_groups` (`id`, `GroupName`, `image`, `useimage`, `background`, `rank`) VALUES
(4, 'بدلة', '', 0, '#ffcccc', '1');

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_items_hide`
--

CREATE TABLE `kawmya_items_hide` (
  `item` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_payments_suppliers`
--

CREATE TABLE `kawmya_payments_suppliers` (
  `id` int(11) NOT NULL,
  `Supplier` varchar(255) NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `Date` date NOT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `Due_Date` date NOT NULL,
  `notes` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_receivings`
--

CREATE TABLE `kawmya_receivings` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `conversion` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_receivings_inv`
--

CREATE TABLE `kawmya_receivings_inv` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `Total` varchar(11) NOT NULL,
  `supplier` varchar(60) DEFAULT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `paid` varchar(11) NOT NULL,
  `DueDate` date NOT NULL,
  `CheckNumber` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `type` varchar(20) NOT NULL,
  `discount` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_receivings_orders`
--

CREATE TABLE `kawmya_receivings_orders` (
  `id` int(11) NOT NULL,
  `name` varchar(220) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_receivings_orders_line`
--

CREATE TABLE `kawmya_receivings_orders_line` (
  `id` int(11) NOT NULL,
  `inv` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_receivings_suspended`
--

CREATE TABLE `kawmya_receivings_suspended` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_receivings_temporary`
--

CREATE TABLE `kawmya_receivings_temporary` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_sales`
--

CREATE TABLE `kawmya_sales` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `sales_type` varchar(1) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_sales_cart`
--

CREATE TABLE `kawmya_sales_cart` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `Discount` varchar(3) NOT NULL,
  `Total` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_sales_inv`
--

CREATE TABLE `kawmya_sales_inv` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `discount` varchar(5) NOT NULL,
  `Total` varchar(11) NOT NULL,
  `supplier` varchar(60) DEFAULT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `paid` varchar(11) NOT NULL,
  `DueDate` date NOT NULL,
  `CheckNumber` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `type` int(11) NOT NULL,
  `sales_type` int(11) NOT NULL,
  `customer_name` varchar(225) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `saller_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_sales_suspended`
--

CREATE TABLE `kawmya_sales_suspended` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `sales_type` varchar(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_sales_temporary`
--

CREATE TABLE `kawmya_sales_temporary` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `sellerID` int(11) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `sales_type` varchar(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_name` varchar(225) DEFAULT NULL,
  `customer_phone` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_settings`
--

CREATE TABLE `kawmya_settings` (
  `id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kawmya_settings`
--

INSERT INTO `kawmya_settings` (`id`, `value`) VALUES
(1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_staff`
--

CREATE TABLE `kawmya_staff` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `balance` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kawmya_staff`
--

INSERT INTO `kawmya_staff` (`id`, `name`, `phone`, `address1`, `address2`, `email`, `notes`, `balance`, `date`, `state`) VALUES
(4, 'محمد', '56', '56', '989', '88', '988', '', '2022-02-19 00:00:00', ''),
(2, 'محمود كمال', '01027060835', 'بنها', 'قها', 'mahmoud@gmail.com', 'مممانانانان', '', '2021-12-07 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_suppliers`
--

CREATE TABLE `kawmya_suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `balance` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kawmya_suppliers`
--

INSERT INTO `kawmya_suppliers` (`id`, `name`, `phone`, `address1`, `address2`, `email`, `notes`, `balance`, `date`, `state`) VALUES
(1, 'Vially', '', '', '', '', '', '', '1970-01-01 00:00:00', ''),
(2, 'فيالي', '', '', '', '', '', '', '2020-07-06 00:00:00', ''),
(3, 'Nine west', '', '', '', '', '', '', '2020-10-31 00:00:00', ''),
(4, 'Red scoop', '', '', '', '', '', '', '2020-10-31 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_treasury`
--

CREATE TABLE `kawmya_treasury` (
  `id` int(11) NOT NULL,
  `type` varchar(1) NOT NULL,
  `date` datetime NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `notes` longtext NOT NULL,
  `PaymentMethod` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kawmya_users`
--

CREATE TABLE `kawmya_users` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sale` varchar(1) NOT NULL,
  `buy` varchar(1) NOT NULL,
  `SoldReturns` varchar(1) NOT NULL,
  `purchasesReturns` varchar(1) NOT NULL,
  `DeleteBllsOfSale` varchar(1) NOT NULL,
  `DeletePurchaseInvoices` varchar(1) NOT NULL,
  `ModifyBillsOfSale` varchar(1) NOT NULL,
  `ModifyBillsBuy` varchar(1) NOT NULL,
  `Revenue` varchar(1) NOT NULL,
  `Expenses` varchar(1) NOT NULL,
  `Customers` varchar(1) NOT NULL,
  `Suppliers` varchar(1) NOT NULL,
  `GeneralSettings` varchar(1) NOT NULL,
  `Groups` varchar(1) NOT NULL,
  `Items` varchar(1) NOT NULL,
  `UsersAndPermissions` varchar(1) NOT NULL,
  `ReportsPurchases` varchar(1) NOT NULL,
  `SalesReports` varchar(1) NOT NULL,
  `ReportsSuppliers` varchar(1) NOT NULL,
  `CustomerReports` varchar(1) NOT NULL,
  `InventoryReports` varchar(1) NOT NULL,
  `ReportsRevenues` varchar(1) NOT NULL,
  `ExpenseReports` varchar(1) NOT NULL,
  `ReportsOfPayments` varchar(1) NOT NULL,
  `EditPrice` varchar(1) NOT NULL,
  `profit` varchar(1) NOT NULL,
  `employee` varchar(1) NOT NULL,
  `user_treasury` int(11) NOT NULL,
  `IsAdmin` int(11) NOT NULL,
  `permision_treasury_withdrawal` tinyint(1) NOT NULL,
  `permision_treasury_deposit` tinyint(1) NOT NULL,
  `permision_delete_treasury` tinyint(1) NOT NULL,
  `Item_movement_detection` tinyint(1) NOT NULL,
  `barcode_manual` tinyint(1) NOT NULL,
  `Cost_price` tinyint(1) NOT NULL,
  `colors` int(11) NOT NULL,
  `sizes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kawmya_users`
--

INSERT INTO `kawmya_users` (`id`, `name`, `username`, `password`, `sale`, `buy`, `SoldReturns`, `purchasesReturns`, `DeleteBllsOfSale`, `DeletePurchaseInvoices`, `ModifyBillsOfSale`, `ModifyBillsBuy`, `Revenue`, `Expenses`, `Customers`, `Suppliers`, `GeneralSettings`, `Groups`, `Items`, `UsersAndPermissions`, `ReportsPurchases`, `SalesReports`, `ReportsSuppliers`, `CustomerReports`, `InventoryReports`, `ReportsRevenues`, `ExpenseReports`, `ReportsOfPayments`, `EditPrice`, `profit`, `employee`, `user_treasury`, `IsAdmin`, `permision_treasury_withdrawal`, `permision_treasury_deposit`, `permision_delete_treasury`, `Item_movement_detection`, `barcode_manual`, `Cost_price`, `colors`, `sizes`) VALUES
(1, 'vially', 'vially', 'vially100', '1', '1', '1', '1', '', '', '', '', '1', '1', '1', '', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '1', '', '', '1', '1', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 'محمود كمال', 'medo012', 'medo012', '1', '1', '1', '1', '', '', '', '', '1', '1', '1', '', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '1', '', '', '', '', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `id` int(11) NOT NULL,
  `models_name` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `sizes` varchar(255) NOT NULL,
  `colors` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_clients`
--

CREATE TABLE `moderea_clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `balance` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `moderea_clients`
--

INSERT INTO `moderea_clients` (`id`, `name`, `phone`, `address1`, `address2`, `email`, `notes`, `balance`, `date`, `state`) VALUES
(1, 'د/عبد الرازق يوسف', '01008068904', '', '', '', '', '', '2021-01-09 00:00:00', ''),
(2, 'عميل نقدي', '', '', '', '', '', '', '2021-12-07 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `moderea_companies`
--

CREATE TABLE `moderea_companies` (
  `id` int(11) NOT NULL,
  `CompaniesName` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `moderea_companies`
--

INSERT INTO `moderea_companies` (`id`, `CompaniesName`) VALUES
(2, 'مصنع فيالى'),
(3, 'لافيتو'),
(4, 'فلانتيجو'),
(6, 'ناين ويست');

-- --------------------------------------------------------

--
-- Table structure for table `moderea_config`
--

CREATE TABLE `moderea_config` (
  `id` int(11) NOT NULL,
  `CompanyName` varchar(255) NOT NULL,
  `isLogo` int(11) NOT NULL,
  `Logo` varchar(255) NOT NULL,
  `TimeZone` varchar(255) NOT NULL,
  `Currency` int(11) NOT NULL,
  `Language` int(11) NOT NULL,
  `E_mail` varchar(255) NOT NULL,
  `Website` varchar(255) NOT NULL,
  `PrintingAftermarket` int(11) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `ReturnPolicy` varchar(255) NOT NULL,
  `Phone` varchar(60) NOT NULL,
  `Branch` int(11) NOT NULL,
  `CustomField1` varchar(255) NOT NULL,
  `CustomField2` varchar(255) NOT NULL,
  `CustomField3` varchar(255) NOT NULL,
  `LastInvoiceNo` int(11) NOT NULL,
  `LastreceivingsInvoiceNo` varchar(255) NOT NULL,
  `LastsaleInvoiceNo` int(11) NOT NULL,
  `cat_items_show` varchar(255) NOT NULL,
  `sales_type` int(11) NOT NULL,
  `receivings_type` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `moderea_config`
--

INSERT INTO `moderea_config` (`id`, `CompanyName`, `isLogo`, `Logo`, `TimeZone`, `Currency`, `Language`, `E_mail`, `Website`, `PrintingAftermarket`, `Address`, `ReturnPolicy`, `Phone`, `Branch`, `CustomField1`, `CustomField2`, `CustomField3`, `LastInvoiceNo`, `LastreceivingsInvoiceNo`, `LastsaleInvoiceNo`, `cat_items_show`, `sales_type`, `receivings_type`) VALUES
(1, 'Vially', 0, '', 'Africa/Cairo', 2, 1, '', '', 1, '', 'نسعد دائما بنواجدكم داخل الفرع... شكرا لثقتكم *الرجاء الاحتفاظ بالفاتوره كمستند اساسي *', '', 0, 'البضاعه المباعه ترد وتستبدل  خلال 14 يوم من تاريخ البون ماعدا ايام الاوكازيون خلال 3 ايام فقط  بشرط ان تكون علي حالتها الاصليه', 'الاكسسوار المباع لايرد ولايستبدل', '', 0, '884', 2835, '57', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `moderea_customer_payments`
--

CREATE TABLE `moderea_customer_payments` (
  `id` int(11) NOT NULL,
  `client` varchar(255) NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `Date` date NOT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `Due_Date` date NOT NULL,
  `notes` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_expenses`
--

CREATE TABLE `moderea_expenses` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `Amount` decimal(10,3) NOT NULL,
  `Employee` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `details` longtext NOT NULL,
  `user` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_expenses_set`
--

CREATE TABLE `moderea_expenses_set` (
  `id` int(11) NOT NULL,
  `expensestype` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `moderea_expenses_set`
--

INSERT INTO `moderea_expenses_set` (`id`, `expensestype`) VALUES
(4, 'كهرباء'),
(21, 'سلفه محمود عبد الله'),
(20, 'فاتوره فيزا'),
(24, 'سلفه احمد محروس'),
(12, 'ترزى'),
(14, 'نظافه'),
(25, 'سلفه محمد محمود'),
(22, 'سلفه احمد طه');

-- --------------------------------------------------------

--
-- Table structure for table `moderea_fawry`
--

CREATE TABLE `moderea_fawry` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `Amount` varchar(255) NOT NULL,
  `Employee` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `details` longtext NOT NULL,
  `user` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_groups`
--

CREATE TABLE `moderea_groups` (
  `id` int(11) NOT NULL,
  `GroupName` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `useimage` int(11) NOT NULL,
  `background` varchar(7) NOT NULL,
  `rank` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `moderea_groups`
--

INSERT INTO `moderea_groups` (`id`, `GroupName`, `image`, `useimage`, `background`, `rank`) VALUES
(4, 'بدلة', '', 0, '#ffcccc', '1');

-- --------------------------------------------------------

--
-- Table structure for table `moderea_items_hide`
--

CREATE TABLE `moderea_items_hide` (
  `item` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_payments_suppliers`
--

CREATE TABLE `moderea_payments_suppliers` (
  `id` int(11) NOT NULL,
  `Supplier` varchar(255) NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `Date` date NOT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `Due_Date` date NOT NULL,
  `notes` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_receivings`
--

CREATE TABLE `moderea_receivings` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `conversion` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_receivings_inv`
--

CREATE TABLE `moderea_receivings_inv` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `Total` varchar(11) NOT NULL,
  `supplier` varchar(60) DEFAULT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `paid` varchar(11) NOT NULL,
  `DueDate` date NOT NULL,
  `CheckNumber` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `type` varchar(20) NOT NULL,
  `discount` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_receivings_orders`
--

CREATE TABLE `moderea_receivings_orders` (
  `id` int(11) NOT NULL,
  `name` varchar(220) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_receivings_orders_line`
--

CREATE TABLE `moderea_receivings_orders_line` (
  `id` int(11) NOT NULL,
  `inv` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_receivings_suspended`
--

CREATE TABLE `moderea_receivings_suspended` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_receivings_temporary`
--

CREATE TABLE `moderea_receivings_temporary` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_sales`
--

CREATE TABLE `moderea_sales` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `sales_type` varchar(1) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_sales_cart`
--

CREATE TABLE `moderea_sales_cart` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `Discount` varchar(3) NOT NULL,
  `Total` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_sales_inv`
--

CREATE TABLE `moderea_sales_inv` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `discount` varchar(5) NOT NULL,
  `Total` varchar(11) NOT NULL,
  `supplier` varchar(60) DEFAULT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `paid` varchar(11) NOT NULL,
  `DueDate` date NOT NULL,
  `CheckNumber` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `type` int(11) NOT NULL,
  `sales_type` int(11) NOT NULL,
  `customer_name` varchar(225) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `saller_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_sales_suspended`
--

CREATE TABLE `moderea_sales_suspended` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `sales_type` varchar(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_sales_temporary`
--

CREATE TABLE `moderea_sales_temporary` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `sellerID` int(11) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `sales_type` varchar(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_name` varchar(225) DEFAULT NULL,
  `customer_phone` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_settings`
--

CREATE TABLE `moderea_settings` (
  `id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `moderea_settings`
--

INSERT INTO `moderea_settings` (`id`, `value`) VALUES
(1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `moderea_staff`
--

CREATE TABLE `moderea_staff` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `balance` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `moderea_staff`
--

INSERT INTO `moderea_staff` (`id`, `name`, `phone`, `address1`, `address2`, `email`, `notes`, `balance`, `date`, `state`) VALUES
(4, 'محمد', '56', '56', '989', '88', '988', '', '2022-02-19 00:00:00', ''),
(2, 'محمود كمال', '01027060835', 'بنها', 'قها', 'mahmoud@gmail.com', 'مممانانانان', '', '2021-12-07 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `moderea_suppliers`
--

CREATE TABLE `moderea_suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `balance` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `moderea_suppliers`
--

INSERT INTO `moderea_suppliers` (`id`, `name`, `phone`, `address1`, `address2`, `email`, `notes`, `balance`, `date`, `state`) VALUES
(1, 'Vially', '', '', '', '', '', '', '1970-01-01 00:00:00', ''),
(2, 'فيالي', '', '', '', '', '', '', '2020-07-06 00:00:00', ''),
(3, 'Nine west', '', '', '', '', '', '', '2020-10-31 00:00:00', ''),
(4, 'Red scoop', '', '', '', '', '', '', '2020-10-31 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `moderea_treasury`
--

CREATE TABLE `moderea_treasury` (
  `id` int(11) NOT NULL,
  `type` varchar(1) NOT NULL,
  `date` datetime NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `notes` longtext NOT NULL,
  `PaymentMethod` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_users`
--

CREATE TABLE `moderea_users` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sale` varchar(1) NOT NULL,
  `buy` varchar(1) NOT NULL,
  `SoldReturns` varchar(1) NOT NULL,
  `purchasesReturns` varchar(1) NOT NULL,
  `DeleteBllsOfSale` varchar(1) NOT NULL,
  `DeletePurchaseInvoices` varchar(1) NOT NULL,
  `ModifyBillsOfSale` varchar(1) NOT NULL,
  `ModifyBillsBuy` varchar(1) NOT NULL,
  `Revenue` varchar(1) NOT NULL,
  `Expenses` varchar(1) NOT NULL,
  `Customers` varchar(1) NOT NULL,
  `Suppliers` varchar(1) NOT NULL,
  `GeneralSettings` varchar(1) NOT NULL,
  `Groups` varchar(1) NOT NULL,
  `Items` varchar(1) NOT NULL,
  `UsersAndPermissions` varchar(1) NOT NULL,
  `ReportsPurchases` varchar(1) NOT NULL,
  `SalesReports` varchar(1) NOT NULL,
  `ReportsSuppliers` varchar(1) NOT NULL,
  `CustomerReports` varchar(1) NOT NULL,
  `InventoryReports` varchar(1) NOT NULL,
  `ReportsRevenues` varchar(1) NOT NULL,
  `ExpenseReports` varchar(1) NOT NULL,
  `ReportsOfPayments` varchar(1) NOT NULL,
  `EditPrice` varchar(1) NOT NULL,
  `profit` varchar(1) NOT NULL,
  `employee` varchar(1) NOT NULL,
  `user_treasury` int(11) NOT NULL,
  `IsAdmin` int(11) NOT NULL,
  `permision_treasury_withdrawal` tinyint(1) NOT NULL,
  `permision_treasury_deposit` tinyint(1) NOT NULL,
  `permision_delete_treasury` tinyint(1) NOT NULL,
  `Item_movement_detection` tinyint(1) NOT NULL,
  `barcode_manual` tinyint(1) NOT NULL,
  `Cost_price` tinyint(1) NOT NULL,
  `colors` int(11) NOT NULL,
  `sizes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `moderea_users`
--

INSERT INTO `moderea_users` (`id`, `name`, `username`, `password`, `sale`, `buy`, `SoldReturns`, `purchasesReturns`, `DeleteBllsOfSale`, `DeletePurchaseInvoices`, `ModifyBillsOfSale`, `ModifyBillsBuy`, `Revenue`, `Expenses`, `Customers`, `Suppliers`, `GeneralSettings`, `Groups`, `Items`, `UsersAndPermissions`, `ReportsPurchases`, `SalesReports`, `ReportsSuppliers`, `CustomerReports`, `InventoryReports`, `ReportsRevenues`, `ExpenseReports`, `ReportsOfPayments`, `EditPrice`, `profit`, `employee`, `user_treasury`, `IsAdmin`, `permision_treasury_withdrawal`, `permision_treasury_deposit`, `permision_delete_treasury`, `Item_movement_detection`, `barcode_manual`, `Cost_price`, `colors`, `sizes`) VALUES
(1, 'vially', 'vially', 'vially100', '1', '1', '1', '1', '', '', '', '', '1', '1', '1', '', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '1', '', '', '1', '1', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 'محمود كمال', 'medo012', 'medo012', '1', '1', '1', '1', '', '', '', '', '1', '1', '1', '', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '1', '', '', '', '', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `on_account`
--

CREATE TABLE `on_account` (
  `id` int(11) NOT NULL,
  `employees_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `amount` varchar(6) NOT NULL,
  `notes` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `owners`
--

CREATE TABLE `owners` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percentage` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `page_name` varchar(60) NOT NULL,
  `page_name_en` varchar(60) NOT NULL,
  `section` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `page_name`, `page_name_en`, `section`) VALUES
(1, 'الرئيسية', 'Home', 1),
(2, 'العملاء', '', 2),
(3, 'مدفوعات العملاء', '', 2),
(4, 'المبيعات', '', 2),
(5, 'مرتجعات المبيعات', '', 2),
(6, 'الموردون', '', 3),
(7, 'مدفوعات الموردين', '', 3),
(8, 'المشتريات', '', 3),
(9, 'مرتجعات المشتريات', '', 3),
(10, 'الاصول الثابتة', '', 3),
(11, 'بون القص', '', 4),
(12, 'مخزن الخامات', '', 5),
(13, 'مخزن الانتاج التام', '', 6),
(14, 'بيانات الموظفين', '', 7),
(15, 'البدلات و المكافأت', '', 7),
(16, 'الخصومات', '', 7),
(17, 'السلفيات', '', 7),
(18, 'دفع الرواتب', '', 7),
(19, 'المصروفات', '', 8),
(20, 'مراحل الانتاج', '', 9),
(21, 'الخزينة', '', 10),
(22, 'المنتجات', '', 11),
(23, 'الموديلات', '', 12),
(24, 'الاعدادات العامة', '', 13),
(25, 'المستخدمين', '', 13),
(26, 'مستلزمات الانتاج', '', 13),
(27, 'الالوان', '', 13),
(28, 'المقاسات', '', 13),
(29, 'مصروفات التأسيس', '', 14),
(30, 'الشركاء', '', 15);

-- --------------------------------------------------------

--
-- Table structure for table `pons`
--

CREATE TABLE `pons` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `color` varchar(60) NOT NULL,
  `meters` int(11) NOT NULL,
  `size1` int(11) NOT NULL,
  `size2` int(11) NOT NULL,
  `size3` int(11) NOT NULL,
  `size4` int(11) NOT NULL,
  `size5` int(11) NOT NULL,
  `size6` int(11) NOT NULL,
  `size7` int(11) NOT NULL,
  `size8` int(11) NOT NULL,
  `size9` int(11) NOT NULL,
  `size10` int(11) NOT NULL,
  `size11` int(11) NOT NULL,
  `size12` int(11) NOT NULL,
  `size13` int(11) NOT NULL,
  `size14` int(11) NOT NULL,
  `size15` int(11) NOT NULL,
  `size16` varchar(6) NOT NULL,
  `size17` varchar(6) NOT NULL,
  `size18` varchar(6) NOT NULL,
  `size19` varchar(6) NOT NULL,
  `size20` varchar(6) NOT NULL,
  `size21` int(11) NOT NULL,
  `size22` int(11) NOT NULL,
  `size23` int(11) NOT NULL,
  `size24` int(11) NOT NULL,
  `size25` int(11) NOT NULL,
  `code` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

CREATE TABLE `privileges` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `browse` int(11) NOT NULL,
  `addpri` varchar(1) NOT NULL,
  `editpri` varchar(1) NOT NULL,
  `removepri` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`id`, `user_id`, `page_id`, `browse`, `addpri`, `editpri`, `removepri`) VALUES
(106, 1, 1, 1, '1', '1', '1'),
(107, 1, 2, 1, '1', '1', '1'),
(108, 1, 3, 1, '1', '1', '1'),
(109, 1, 4, 1, '1', '1', '1'),
(110, 1, 5, 1, '1', '1', '1'),
(111, 1, 6, 1, '1', '1', '1'),
(112, 1, 7, 1, '1', '1', '1'),
(113, 1, 8, 1, '1', '1', '1'),
(114, 1, 9, 1, '1', '1', '1'),
(115, 1, 10, 1, '1', '1', '1'),
(116, 1, 11, 1, '1', '1', '1'),
(117, 1, 12, 1, '1', '1', '1'),
(118, 1, 13, 1, '1', '1', '1'),
(119, 1, 14, 1, '1', '1', '1'),
(120, 1, 15, 1, '1', '1', '1'),
(121, 1, 16, 1, '1', '1', '1'),
(122, 1, 17, 1, '1', '1', '1'),
(123, 1, 18, 1, '1', '1', '1'),
(124, 1, 19, 1, '1', '1', '1'),
(125, 1, 20, 1, '1', '1', '1'),
(126, 1, 21, 1, '1', '1', '1'),
(127, 1, 22, 1, '1', '1', '1'),
(128, 1, 23, 1, '1', '1', '1'),
(129, 1, 24, 1, '1', '1', '1'),
(130, 1, 25, 1, '1', '1', '1'),
(131, 1, 26, 1, '1', '1', '1'),
(132, 1, 27, 1, '1', '1', '1'),
(133, 1, 28, 1, '1', '1', '1'),
(134, 1, 29, 1, '1', '1', '1'),
(193, 1, 30, 1, '1', '1', '1'),
(194, 23, 1, 0, '', '', ''),
(195, 23, 2, 0, '', '', ''),
(196, 23, 3, 0, '', '', ''),
(197, 23, 4, 0, '', '', ''),
(198, 23, 5, 0, '', '', ''),
(199, 23, 6, 0, '', '', ''),
(200, 23, 7, 0, '', '', ''),
(201, 23, 8, 0, '', '', ''),
(202, 23, 9, 0, '', '', ''),
(203, 23, 10, 0, '', '', ''),
(204, 23, 11, 1, '1', '1', '1'),
(205, 23, 12, 0, '', '', ''),
(206, 23, 13, 0, '', '', ''),
(207, 23, 14, 0, '', '', ''),
(208, 23, 15, 0, '', '', ''),
(209, 23, 16, 0, '', '', ''),
(210, 23, 17, 0, '', '', ''),
(211, 23, 18, 0, '', '', ''),
(212, 23, 19, 0, '', '', ''),
(213, 23, 20, 0, '', '', ''),
(214, 23, 21, 0, '', '', ''),
(215, 23, 22, 0, '', '', ''),
(216, 23, 23, 0, '', '', ''),
(217, 23, 24, 0, '', '', ''),
(218, 23, 25, 0, '', '', ''),
(219, 23, 26, 0, '', '', ''),
(220, 23, 27, 0, '', '', ''),
(221, 23, 28, 0, '', '', ''),
(222, 23, 29, 0, '', '', ''),
(223, 23, 30, 0, '', '', ''),
(224, 24, 1, 1, '1', '1', '1'),
(225, 24, 2, 1, '1', '1', '1'),
(226, 24, 3, 1, '1', '1', '1'),
(227, 24, 4, 1, '1', '1', '1'),
(228, 24, 5, 1, '1', '1', '1'),
(229, 24, 6, 1, '1', '1', '1'),
(230, 24, 7, 1, '1', '1', '1'),
(231, 24, 8, 1, '1', '1', '1'),
(232, 24, 9, 1, '1', '1', '1'),
(233, 24, 10, 1, '1', '1', '1'),
(234, 24, 11, 1, '1', '1', '1'),
(235, 24, 12, 1, '1', '1', '1'),
(236, 24, 13, 1, '1', '1', '1'),
(237, 24, 14, 1, '1', '1', '1'),
(238, 24, 15, 1, '1', '1', '1'),
(239, 24, 16, 1, '1', '1', '1'),
(240, 24, 17, 1, '1', '1', '1'),
(241, 24, 18, 1, '1', '1', '1'),
(242, 24, 19, 1, '1', '1', '1'),
(243, 24, 20, 1, '1', '1', '1'),
(244, 24, 21, 1, '1', '1', '1'),
(245, 24, 22, 1, '1', '1', '1'),
(246, 24, 23, 1, '1', '1', '1'),
(247, 24, 24, 1, '1', '1', '1'),
(248, 24, 25, 1, '1', '1', '1'),
(249, 24, 26, 1, '1', '1', '1'),
(250, 24, 27, 1, '1', '1', '1'),
(251, 24, 28, 1, '1', '1', '1'),
(252, 24, 29, 1, '1', '1', '1'),
(253, 24, 30, 1, '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `final_production_stage` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `useimage` varchar(1) NOT NULL,
  `background` varchar(20) NOT NULL,
  `rank` varchar(20) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `notes` varchar(60) NOT NULL,
  `value` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `notes`, `value`) VALUES
(1, 'Profit Ratio', '50'),
(2, 'license', '1'),
(3, 'slaes_inv_num', '1301'),
(6, 'barcode_height', '1cm'),
(7, 'page_size', 'A4'),
(8, 'page_size_margin', '0cm'),
(9, 'body_width', '0px'),
(10, 'body_height', '1cm-'),
(11, 'table_margin_left', '0cm'),
(12, 'table_margin_top', '1cm-'),
(13, 'table_width', '3.20cm'),
(14, 'td_width', '3.20cm'),
(15, 'td_height', '2.30cm'),
(16, 'td_padding', '0px 0px 0px 0px'),
(17, 'img_width', '3.20cm'),
(18, 'img_height', '2.30cm'),
(19, 'img_padding', '0px 0px 0px'),
(20, 'img_float', 'left'),
(21, 'perpage', '72'),
(22, 'perline', '6'),
(23, 'original_img_height', '48'),
(24, 'transaction_id', '54'),
(25, 'store transaction id', '34');

-- --------------------------------------------------------

--
-- Table structure for table `shibin_clients`
--

CREATE TABLE `shibin_clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `balance` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shibin_clients`
--

INSERT INTO `shibin_clients` (`id`, `name`, `phone`, `address1`, `address2`, `email`, `notes`, `balance`, `date`, `state`) VALUES
(1, 'د/عبد الرازق يوسف', '01008068904', '', '', '', '', '', '2021-01-09 00:00:00', ''),
(2, 'عميل نقدي', '', '', '', '', '', '', '2021-12-07 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `shibin_companies`
--

CREATE TABLE `shibin_companies` (
  `id` int(11) NOT NULL,
  `CompaniesName` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shibin_companies`
--

INSERT INTO `shibin_companies` (`id`, `CompaniesName`) VALUES
(2, 'مصنع فيالى'),
(3, 'لافيتو'),
(4, 'فلانتيجو'),
(6, 'ناين ويست');

-- --------------------------------------------------------

--
-- Table structure for table `shibin_config`
--

CREATE TABLE `shibin_config` (
  `id` int(11) NOT NULL,
  `CompanyName` varchar(255) NOT NULL,
  `isLogo` int(11) NOT NULL,
  `Logo` varchar(255) NOT NULL,
  `TimeZone` varchar(255) NOT NULL,
  `Currency` int(11) NOT NULL,
  `Language` int(11) NOT NULL,
  `E_mail` varchar(255) NOT NULL,
  `Website` varchar(255) NOT NULL,
  `PrintingAftermarket` int(11) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `ReturnPolicy` varchar(255) NOT NULL,
  `Phone` varchar(60) NOT NULL,
  `Branch` int(11) NOT NULL,
  `CustomField1` varchar(255) NOT NULL,
  `CustomField2` varchar(255) NOT NULL,
  `CustomField3` varchar(255) NOT NULL,
  `LastInvoiceNo` int(11) NOT NULL,
  `LastreceivingsInvoiceNo` varchar(255) NOT NULL,
  `LastsaleInvoiceNo` int(11) NOT NULL,
  `cat_items_show` varchar(255) NOT NULL,
  `sales_type` int(11) NOT NULL,
  `receivings_type` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shibin_config`
--

INSERT INTO `shibin_config` (`id`, `CompanyName`, `isLogo`, `Logo`, `TimeZone`, `Currency`, `Language`, `E_mail`, `Website`, `PrintingAftermarket`, `Address`, `ReturnPolicy`, `Phone`, `Branch`, `CustomField1`, `CustomField2`, `CustomField3`, `LastInvoiceNo`, `LastreceivingsInvoiceNo`, `LastsaleInvoiceNo`, `cat_items_show`, `sales_type`, `receivings_type`) VALUES
(1, 'Vially', 0, '', 'Africa/Cairo', 2, 1, '', '', 1, '', 'نسعد دائما بنواجدكم داخل الفرع... شكرا لثقتكم *الرجاء الاحتفاظ بالفاتوره كمستند اساسي *', '', 0, 'البضاعه المباعه ترد وتستبدل  خلال 14 يوم من تاريخ البون ماعدا ايام الاوكازيون خلال 3 ايام فقط  بشرط ان تكون علي حالتها الاصليه', 'الاكسسوار المباع لايرد ولايستبدل', '', 0, '884', 2835, '57', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shibin_customer_payments`
--

CREATE TABLE `shibin_customer_payments` (
  `id` int(11) NOT NULL,
  `client` varchar(255) NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `Date` date NOT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `Due_Date` date NOT NULL,
  `notes` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shibin_expenses`
--

CREATE TABLE `shibin_expenses` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `Amount` decimal(10,3) NOT NULL,
  `Employee` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `details` longtext NOT NULL,
  `user` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shibin_expenses_set`
--

CREATE TABLE `shibin_expenses_set` (
  `id` int(11) NOT NULL,
  `expensestype` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shibin_expenses_set`
--

INSERT INTO `shibin_expenses_set` (`id`, `expensestype`) VALUES
(4, 'كهرباء'),
(21, 'سلفه محمود عبد الله'),
(20, 'فاتوره فيزا'),
(24, 'سلفه احمد محروس'),
(12, 'ترزى'),
(14, 'نظافه'),
(25, 'سلفه محمد محمود'),
(22, 'سلفه احمد طه');

-- --------------------------------------------------------

--
-- Table structure for table `shibin_fawry`
--

CREATE TABLE `shibin_fawry` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `Amount` varchar(255) NOT NULL,
  `Employee` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `details` longtext NOT NULL,
  `user` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shibin_groups`
--

CREATE TABLE `shibin_groups` (
  `id` int(11) NOT NULL,
  `GroupName` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `useimage` int(11) NOT NULL,
  `background` varchar(7) NOT NULL,
  `rank` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shibin_groups`
--

INSERT INTO `shibin_groups` (`id`, `GroupName`, `image`, `useimage`, `background`, `rank`) VALUES
(4, 'بدلة', '', 0, '#ffcccc', '1');

-- --------------------------------------------------------

--
-- Table structure for table `shibin_items_hide`
--

CREATE TABLE `shibin_items_hide` (
  `item` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shibin_payments_suppliers`
--

CREATE TABLE `shibin_payments_suppliers` (
  `id` int(11) NOT NULL,
  `Supplier` varchar(255) NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `Date` date NOT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `Due_Date` date NOT NULL,
  `notes` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shibin_receivings`
--

CREATE TABLE `shibin_receivings` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `conversion` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shibin_receivings_inv`
--

CREATE TABLE `shibin_receivings_inv` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `Total` varchar(11) NOT NULL,
  `supplier` varchar(60) DEFAULT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `paid` varchar(11) NOT NULL,
  `DueDate` date NOT NULL,
  `CheckNumber` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `type` varchar(20) NOT NULL,
  `discount` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shibin_receivings_orders`
--

CREATE TABLE `shibin_receivings_orders` (
  `id` int(11) NOT NULL,
  `name` varchar(220) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shibin_receivings_orders_line`
--

CREATE TABLE `shibin_receivings_orders_line` (
  `id` int(11) NOT NULL,
  `inv` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shibin_receivings_suspended`
--

CREATE TABLE `shibin_receivings_suspended` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shibin_receivings_temporary`
--

CREATE TABLE `shibin_receivings_temporary` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(11) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shibin_sales`
--

CREATE TABLE `shibin_sales` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `sales_type` varchar(1) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shibin_sales_cart`
--

CREATE TABLE `shibin_sales_cart` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `Discount` varchar(3) NOT NULL,
  `Total` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shibin_sales_inv`
--

CREATE TABLE `shibin_sales_inv` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `discount` varchar(5) NOT NULL,
  `Total` varchar(11) NOT NULL,
  `supplier` varchar(60) DEFAULT NULL,
  `PaymentMethod` int(11) NOT NULL,
  `paid` varchar(11) NOT NULL,
  `DueDate` date NOT NULL,
  `CheckNumber` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `type` int(11) NOT NULL,
  `sales_type` int(11) NOT NULL,
  `customer_name` varchar(225) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `saller_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shibin_sales_suspended`
--

CREATE TABLE `shibin_sales_suspended` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `sales_type` varchar(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shibin_sales_temporary`
--

CREATE TABLE `shibin_sales_temporary` (
  `id` int(11) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) DEFAULT NULL,
  `sellerID` int(11) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `sales_type` varchar(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_name` varchar(225) DEFAULT NULL,
  `customer_phone` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shibin_settings`
--

CREATE TABLE `shibin_settings` (
  `id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shibin_settings`
--

INSERT INTO `shibin_settings` (`id`, `value`) VALUES
(1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `shibin_staff`
--

CREATE TABLE `shibin_staff` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `balance` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shibin_staff`
--

INSERT INTO `shibin_staff` (`id`, `name`, `phone`, `address1`, `address2`, `email`, `notes`, `balance`, `date`, `state`) VALUES
(4, 'محمد', '56', '56', '989', '88', '988', '', '2022-02-19 00:00:00', ''),
(2, 'محمود كمال', '01027060835', 'بنها', 'قها', 'mahmoud@gmail.com', 'مممانانانان', '', '2021-12-07 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `shibin_suppliers`
--

CREATE TABLE `shibin_suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `balance` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shibin_suppliers`
--

INSERT INTO `shibin_suppliers` (`id`, `name`, `phone`, `address1`, `address2`, `email`, `notes`, `balance`, `date`, `state`) VALUES
(1, 'Vially', '', '', '', '', '', '', '1970-01-01 00:00:00', ''),
(2, 'فيالي', '', '', '', '', '', '', '2020-07-06 00:00:00', ''),
(3, 'Nine west', '', '', '', '', '', '', '2020-10-31 00:00:00', ''),
(4, 'Red scoop', '', '', '', '', '', '', '2020-10-31 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `shibin_treasury`
--

CREATE TABLE `shibin_treasury` (
  `id` int(11) NOT NULL,
  `type` varchar(1) NOT NULL,
  `date` datetime NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `notes` longtext NOT NULL,
  `PaymentMethod` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shibin_users`
--

CREATE TABLE `shibin_users` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sale` varchar(1) NOT NULL,
  `buy` varchar(1) NOT NULL,
  `SoldReturns` varchar(1) NOT NULL,
  `purchasesReturns` varchar(1) NOT NULL,
  `DeleteBllsOfSale` varchar(1) NOT NULL,
  `DeletePurchaseInvoices` varchar(1) NOT NULL,
  `ModifyBillsOfSale` varchar(1) NOT NULL,
  `ModifyBillsBuy` varchar(1) NOT NULL,
  `Revenue` varchar(1) NOT NULL,
  `Expenses` varchar(1) NOT NULL,
  `Customers` varchar(1) NOT NULL,
  `Suppliers` varchar(1) NOT NULL,
  `GeneralSettings` varchar(1) NOT NULL,
  `Groups` varchar(1) NOT NULL,
  `Items` varchar(1) NOT NULL,
  `UsersAndPermissions` varchar(1) NOT NULL,
  `ReportsPurchases` varchar(1) NOT NULL,
  `SalesReports` varchar(1) NOT NULL,
  `ReportsSuppliers` varchar(1) NOT NULL,
  `CustomerReports` varchar(1) NOT NULL,
  `InventoryReports` varchar(1) NOT NULL,
  `ReportsRevenues` varchar(1) NOT NULL,
  `ExpenseReports` varchar(1) NOT NULL,
  `ReportsOfPayments` varchar(1) NOT NULL,
  `EditPrice` varchar(1) NOT NULL,
  `profit` varchar(1) NOT NULL,
  `employee` varchar(1) NOT NULL,
  `user_treasury` int(11) NOT NULL,
  `IsAdmin` int(11) NOT NULL,
  `permision_treasury_withdrawal` tinyint(1) NOT NULL,
  `permision_treasury_deposit` tinyint(1) NOT NULL,
  `permision_delete_treasury` tinyint(1) NOT NULL,
  `Item_movement_detection` tinyint(1) NOT NULL,
  `barcode_manual` tinyint(1) NOT NULL,
  `Cost_price` tinyint(1) NOT NULL,
  `colors` int(11) NOT NULL,
  `sizes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shibin_users`
--

INSERT INTO `shibin_users` (`id`, `name`, `username`, `password`, `sale`, `buy`, `SoldReturns`, `purchasesReturns`, `DeleteBllsOfSale`, `DeletePurchaseInvoices`, `ModifyBillsOfSale`, `ModifyBillsBuy`, `Revenue`, `Expenses`, `Customers`, `Suppliers`, `GeneralSettings`, `Groups`, `Items`, `UsersAndPermissions`, `ReportsPurchases`, `SalesReports`, `ReportsSuppliers`, `CustomerReports`, `InventoryReports`, `ReportsRevenues`, `ExpenseReports`, `ReportsOfPayments`, `EditPrice`, `profit`, `employee`, `user_treasury`, `IsAdmin`, `permision_treasury_withdrawal`, `permision_treasury_deposit`, `permision_delete_treasury`, `Item_movement_detection`, `barcode_manual`, `Cost_price`, `colors`, `sizes`) VALUES
(1, 'vially', 'vially', 'vially100', '1', '1', '1', '1', '', '', '', '', '1', '1', '1', '', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '1', '', '', '1', '1', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 'محمود كمال', 'medo012', 'medo012', '1', '1', '1', '1', '', '', '', '', '1', '1', '1', '', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '1', '', '', '', '', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `size` varchar(30) NOT NULL,
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`size`, `id`, `status`) VALUES
('38', 1, 0),
('40', 2, 0),
('42', 3, 0),
('44', 4, 0),
('46', 5, 0),
('48', 6, 0),
('50', 7, 0),
('52', 8, 0),
('54', 9, 0),
('56', 10, 0),
('58', 11, 0),
('60', 12, 0),
('62', 13, 0),
('64', 14, 0),
('66', 15, 0),
('36', 16, 0),
('34', 17, 0),
('32', 18, 0),
('30', 19, 0),
('s', 20, 0),
('m', 21, 0),
('L', 22, 0),
('XL', 23, 0),
('2xl', 24, 0),
('3xl', 25, 0),
('all size', 26, 0),
('4xl', 27, 0),
('5XL', 28, 0);

-- --------------------------------------------------------

--
-- Table structure for table `staff_advances`
--

CREATE TABLE `staff_advances` (
  `id` int(11) NOT NULL,
  `employees_id` int(11) NOT NULL,
  `amount` varchar(6) NOT NULL,
  `date` datetime NOT NULL,
  `details` varchar(255) NOT NULL,
  `settlement` int(11) NOT NULL DEFAULT '0',
  `settlement_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_deductions`
--

CREATE TABLE `staff_deductions` (
  `id` int(11) NOT NULL,
  `employees_id` int(11) NOT NULL,
  `amount` varchar(6) NOT NULL,
  `date` datetime NOT NULL,
  `details` varchar(255) NOT NULL,
  `settlement` int(11) NOT NULL DEFAULT '0',
  `settlement_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_payments`
--

CREATE TABLE `staff_payments` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `employees_id` int(11) NOT NULL,
  `amount` decimal(20,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stages_of_manufacture`
--

CREATE TABLE `stages_of_manufacture` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `commission` varchar(6) NOT NULL,
  `final_production` int(11) NOT NULL,
  `details` longtext NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stages_of_manufacture`
--

INSERT INTO `stages_of_manufacture` (`id`, `name`, `commission`, `final_production`, `details`, `status`) VALUES
(1, 'مقص دار قماش', '2.5', 0, '', 0),
(2, 'مقص دار بطانة', '1', 0, '', 0),
(3, 'مقص دار مستلزمات', '1', 0, '', 0),
(4, 'تدوير', '5.75', 0, '', 0),
(5, 'جيب برا', '3', 0, '', 0),
(6, 'جيب جوه', '3.25', 0, '', 0),
(7, 'مسرة وجيب صدر', '3', 0, '', 0),
(8, 'طبق', '3', 0, '', 0),
(9, 'ياقة', '3', 0, '', 0),
(10, 'تشغيل كم', '1.75', 0, '', 0),
(11, 'تركيب كم', '1.75', 0, '', 0),
(12, 'جيرو', '3', 0, '', 0),
(13, 'مكوة', '4.5', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `color` varchar(60) NOT NULL,
  `size1` int(11) NOT NULL,
  `size2` int(11) NOT NULL,
  `size3` int(11) NOT NULL,
  `size4` int(11) NOT NULL,
  `size5` int(11) NOT NULL,
  `size6` int(11) NOT NULL,
  `size7` int(11) NOT NULL,
  `size8` int(11) NOT NULL,
  `size9` int(11) NOT NULL,
  `size10` int(11) NOT NULL,
  `size11` int(11) NOT NULL,
  `size12` int(11) NOT NULL,
  `size13` int(11) NOT NULL,
  `size14` int(11) NOT NULL,
  `size15` int(11) NOT NULL,
  `size16` int(11) NOT NULL,
  `size17` int(11) NOT NULL,
  `size18` int(11) NOT NULL,
  `size19` int(11) NOT NULL,
  `size20` int(11) NOT NULL,
  `size21` int(11) NOT NULL,
  `size22` int(11) NOT NULL,
  `size23` int(11) NOT NULL,
  `size24` int(11) NOT NULL,
  `size25` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `store` int(11) NOT NULL,
  `pon_id` varchar(255) NOT NULL,
  `inORout` int(11) NOT NULL,
  `client` varchar(11) NOT NULL,
  `recipient` varchar(200) NOT NULL,
  `permission_number` varchar(255) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`id`, `product_id`, `transaction_id`, `image`, `color`, `size1`, `size2`, `size3`, `size4`, `size5`, `size6`, `size7`, `size8`, `size9`, `size10`, `size11`, `size12`, `size13`, `size14`, `size15`, `size16`, `size17`, `size18`, `size19`, `size20`, `size21`, `size22`, `size23`, `size24`, `size25`, `code`, `store`, `pon_id`, `inORout`, `client`, `recipient`, `permission_number`, `date`) VALUES
(1, 2, '31', '', '1', 0, 0, 0, 0, 19, 19, 19, 19, 19, 19, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '104', 1, '24', 1, '', '', '', '2016-03-12 12:12:29'),
(2, 2, '31', '', '2', 0, 0, 0, 0, 19, 19, 19, 19, 19, 19, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '104', 1, '24', 1, '', '', '', '2016-03-12 12:12:29'),
(3, 2, '31', '', '3', 0, 0, 0, 0, 19, 19, 19, 19, 19, 19, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '104', 1, '24', 1, '', '', '', '2016-03-12 12:12:29'),
(4, 2, '31', '', '5', 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '104', 1, '24', 1, '', '', '', '2016-03-12 12:12:29'),
(5, 2, '31', '', '6', 0, 0, 0, 0, 19, 19, 19, 19, 19, 19, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '104', 1, '24', 1, '', '', '', '2016-03-12 12:12:29'),
(6, 2, '31', '', '9', 0, 0, 0, 0, 19, 19, 19, 19, 19, 19, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '104', 1, '24', 1, '', '', '', '2016-03-12 12:12:29'),
(7, 2, '31', '', '11', 0, 0, 0, 0, 19, 19, 19, 19, 19, 19, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '104', 1, '24', 1, '', '', '', '2016-03-12 12:12:29'),
(8, 2, '33', '', '1', 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '104', 1, '', 2, '70', '', '1', '2016-03-12 00:00:00'),
(9, 2, '33', '', '2', 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '104', 1, '', 2, '70', '', '1', '2016-03-12 00:00:00'),
(10, 2, '33', '', '3', 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '104', 1, '', 2, '70', '', '1', '2016-03-12 00:00:00'),
(11, 2, '33', '', '5', 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '104', 1, '', 2, '70', '', '1', '2016-03-12 00:00:00'),
(12, 2, '33', '', '6', 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '104', 1, '', 2, '70', '', '1', '2016-03-12 00:00:00'),
(13, 2, '33', '', '9', 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '104', 1, '', 2, '70', '', '1', '2016-03-12 00:00:00'),
(14, 2, '33', '', '11', 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '104', 1, '', 2, '70', '', '1', '2016-03-12 00:00:00'),
(15, 2, '34', '', '1', 0, 0, 36, 36, 35, 35, 35, 33, 19, 14, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '3', 1, '25', 1, '', '', '', '2016-03-12 14:23:32');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(60) NOT NULL,
  `details` varbinary(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`store_id`, `store_name`, `details`) VALUES
(1, 'store1', '');

-- --------------------------------------------------------

--
-- Table structure for table `store_out`
--

CREATE TABLE `store_out` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `color` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `permission_number` varchar(255) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `store_temp`
--

CREATE TABLE `store_temp` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `color` varchar(60) NOT NULL,
  `size1` int(11) NOT NULL,
  `size2` int(11) NOT NULL,
  `size3` int(11) NOT NULL,
  `size4` int(11) NOT NULL,
  `size5` int(11) NOT NULL,
  `size6` int(11) NOT NULL,
  `size7` int(11) NOT NULL,
  `size8` int(11) NOT NULL,
  `size9` int(11) NOT NULL,
  `size10` int(11) NOT NULL,
  `size11` int(11) NOT NULL,
  `size12` int(11) NOT NULL,
  `size13` int(11) NOT NULL,
  `size14` int(11) NOT NULL,
  `size15` int(11) NOT NULL,
  `size16` int(11) NOT NULL,
  `size17` int(11) NOT NULL,
  `size18` int(11) NOT NULL,
  `size19` int(11) NOT NULL,
  `size20` int(11) NOT NULL,
  `size21` int(11) NOT NULL,
  `size22` int(11) NOT NULL,
  `size23` int(11) NOT NULL,
  `size24` int(11) NOT NULL,
  `size25` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `store` int(11) NOT NULL,
  `pon_id` varchar(255) NOT NULL,
  `inORout` int(11) NOT NULL,
  `client` varchar(11) NOT NULL,
  `recipient` varchar(200) NOT NULL,
  `permission_number` varchar(255) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `store_transaction_details`
--

CREATE TABLE `store_transaction_details` (
  `id` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `details` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `responsible` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `balance` decimal(10,3) NOT NULL,
  `details` char(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplies_transactions`
--

CREATE TABLE `supplies_transactions` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `value` varchar(6) CHARACTER SET utf8 NOT NULL,
  `in_out` int(11) NOT NULL,
  `pon_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 NOT NULL,
  `color` int(11) NOT NULL,
  `total_cost` decimal(10,3) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `treasury`
--

CREATE TABLE `treasury` (
  `id` int(11) NOT NULL,
  `amount` decimal(10,3) NOT NULL,
  `type` int(11) NOT NULL,
  `ref` varchar(255) CHARACTER SET utf8 NOT NULL,
  `date` datetime NOT NULL,
  `notes1` varchar(255) CHARACTER SET utf8 NOT NULL,
  `notes2` varchar(255) CHARACTER SET utf8 NOT NULL,
  `permission_no` int(11) NOT NULL,
  `discription` varchar(255) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `check_number` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treasury`
--

INSERT INTO `treasury` (`id`, `amount`, `type`, `ref`, `date`, `notes1`, `notes2`, `permission_no`, `discription`, `payment_method`, `check_number`, `status`) VALUES
(1, '1000.000', 4, '2', '2016-10-18 00:00:00', '1', '', 0, '', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sale` varchar(1) NOT NULL,
  `buy` varchar(1) NOT NULL,
  `SoldReturns` varchar(1) NOT NULL,
  `purchasesReturns` varchar(1) NOT NULL,
  `DeleteBllsOfSale` varchar(1) NOT NULL,
  `DeletePurchaseInvoices` varchar(1) NOT NULL,
  `ModifyBillsOfSale` varchar(1) NOT NULL,
  `ModifyBillsBuy` varchar(1) NOT NULL,
  `Revenue` varchar(1) NOT NULL,
  `Expenses` varchar(1) NOT NULL,
  `Customers` varchar(1) NOT NULL,
  `Suppliers` varchar(1) NOT NULL,
  `GeneralSettings` varchar(1) NOT NULL,
  `Groups` varchar(1) NOT NULL,
  `Items` varchar(1) NOT NULL,
  `orders_p` int(11) NOT NULL,
  `store_p` int(11) NOT NULL,
  `employees_p` int(11) NOT NULL,
  `costs_p` int(11) NOT NULL,
  `production_p` int(11) NOT NULL,
  `stages_p` int(11) NOT NULL,
  `UsersAndPermissions` varchar(1) NOT NULL,
  `ReportsPurchases` varchar(1) NOT NULL,
  `SalesReports` varchar(1) NOT NULL,
  `ReportsSuppliers` varchar(1) NOT NULL,
  `CustomerReports` varchar(1) NOT NULL,
  `InventoryReports` varchar(1) NOT NULL,
  `ReportsRevenues` varchar(1) NOT NULL,
  `ExpenseReports` varchar(1) NOT NULL,
  `ReportsOfPayments` varchar(1) NOT NULL,
  `EditPrice` varchar(1) NOT NULL,
  `profit` varchar(1) NOT NULL,
  `employee` varchar(1) NOT NULL,
  `default_language` varchar(3) NOT NULL,
  `IsAdmin` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `sale`, `buy`, `SoldReturns`, `purchasesReturns`, `DeleteBllsOfSale`, `DeletePurchaseInvoices`, `ModifyBillsOfSale`, `ModifyBillsBuy`, `Revenue`, `Expenses`, `Customers`, `Suppliers`, `GeneralSettings`, `Groups`, `Items`, `orders_p`, `store_p`, `employees_p`, `costs_p`, `production_p`, `stages_p`, `UsersAndPermissions`, `ReportsPurchases`, `SalesReports`, `ReportsSuppliers`, `CustomerReports`, `InventoryReports`, `ReportsRevenues`, `ExpenseReports`, `ReportsOfPayments`, `EditPrice`, `profit`, `employee`, `default_language`, `IsAdmin`, `status`) VALUES
(1, 'vially', 'vially', 'demo', '1', '1', '1', '1', '', '', '', '', '1', '1', '1', '1', '1', '1', '1', 1, 1, 1, 1, 1, 1, '1', '1', '1', '1', '1', '1', '', '1', '', '', '', '', 'ar', 1, 0),
(16, 'www', 'www', 'www', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 1, 1, 1, 1, '', '', '', '', '', '', '', '', '', '', '', '', 'ar', 0, 3),
(17, 'eee', 'eee', 'eee', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 1, 1, 1, 1, '', '', '', '', '', '', '', '', '', '', '', '', 'ar', 0, 3),
(18, 'mhamed', 'mh', '111', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 'ar', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allowances_bonuses`
--
ALTER TABLE `allowances_bonuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bugs`
--
ALTER TABLE `bugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_clients`
--
ALTER TABLE `cairo_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `cairo_companies`
--
ALTER TABLE `cairo_companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GroupName` (`CompaniesName`);

--
-- Indexes for table `cairo_config`
--
ALTER TABLE `cairo_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_customer_payments`
--
ALTER TABLE `cairo_customer_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_expenses`
--
ALTER TABLE `cairo_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_expenses_set`
--
ALTER TABLE `cairo_expenses_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GroupName` (`expensestype`);

--
-- Indexes for table `cairo_fawry`
--
ALTER TABLE `cairo_fawry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_groups`
--
ALTER TABLE `cairo_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GroupName` (`GroupName`);

--
-- Indexes for table `cairo_payments_suppliers`
--
ALTER TABLE `cairo_payments_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_receivings`
--
ALTER TABLE `cairo_receivings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_receivings_inv`
--
ALTER TABLE `cairo_receivings_inv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_receivings_orders`
--
ALTER TABLE `cairo_receivings_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_receivings_orders_line`
--
ALTER TABLE `cairo_receivings_orders_line`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_receivings_suspended`
--
ALTER TABLE `cairo_receivings_suspended`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_receivings_temporary`
--
ALTER TABLE `cairo_receivings_temporary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_sales`
--
ALTER TABLE `cairo_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_sales_cart`
--
ALTER TABLE `cairo_sales_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_sales_inv`
--
ALTER TABLE `cairo_sales_inv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_sales_suspended`
--
ALTER TABLE `cairo_sales_suspended`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_sales_temporary`
--
ALTER TABLE `cairo_sales_temporary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_settings`
--
ALTER TABLE `cairo_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_staff`
--
ALTER TABLE `cairo_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_suppliers`
--
ALTER TABLE `cairo_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `cairo_treasury`
--
ALTER TABLE `cairo_treasury`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cairo_users`
--
ALTER TABLE `cairo_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `costs_elements`
--
ALTER TABLE `costs_elements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_clients`
--
ALTER TABLE `embaba_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `embaba_companies`
--
ALTER TABLE `embaba_companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GroupName` (`CompaniesName`);

--
-- Indexes for table `embaba_config`
--
ALTER TABLE `embaba_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_customer_payments`
--
ALTER TABLE `embaba_customer_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_expenses`
--
ALTER TABLE `embaba_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_expenses_set`
--
ALTER TABLE `embaba_expenses_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GroupName` (`expensestype`);

--
-- Indexes for table `embaba_fawry`
--
ALTER TABLE `embaba_fawry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_groups`
--
ALTER TABLE `embaba_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GroupName` (`GroupName`);

--
-- Indexes for table `embaba_payments_suppliers`
--
ALTER TABLE `embaba_payments_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_receivings`
--
ALTER TABLE `embaba_receivings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_receivings_inv`
--
ALTER TABLE `embaba_receivings_inv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_receivings_orders`
--
ALTER TABLE `embaba_receivings_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_receivings_orders_line`
--
ALTER TABLE `embaba_receivings_orders_line`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_receivings_suspended`
--
ALTER TABLE `embaba_receivings_suspended`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_receivings_temporary`
--
ALTER TABLE `embaba_receivings_temporary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_sales`
--
ALTER TABLE `embaba_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_sales_cart`
--
ALTER TABLE `embaba_sales_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_sales_inv`
--
ALTER TABLE `embaba_sales_inv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_sales_suspended`
--
ALTER TABLE `embaba_sales_suspended`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_sales_temporary`
--
ALTER TABLE `embaba_sales_temporary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_settings`
--
ALTER TABLE `embaba_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_staff`
--
ALTER TABLE `embaba_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_suppliers`
--
ALTER TABLE `embaba_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `embaba_treasury`
--
ALTER TABLE `embaba_treasury`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embaba_users`
--
ALTER TABLE `embaba_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expensestype`
--
ALTER TABLE `expensestype`
  ADD PRIMARY KEY (`expense_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item` (`item`);

--
-- Indexes for table `items_inv`
--
ALTER TABLE `items_inv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_clients`
--
ALTER TABLE `kawmya_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `kawmya_companies`
--
ALTER TABLE `kawmya_companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GroupName` (`CompaniesName`);

--
-- Indexes for table `kawmya_config`
--
ALTER TABLE `kawmya_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_customer_payments`
--
ALTER TABLE `kawmya_customer_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_expenses`
--
ALTER TABLE `kawmya_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_expenses_set`
--
ALTER TABLE `kawmya_expenses_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GroupName` (`expensestype`);

--
-- Indexes for table `kawmya_fawry`
--
ALTER TABLE `kawmya_fawry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_groups`
--
ALTER TABLE `kawmya_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GroupName` (`GroupName`);

--
-- Indexes for table `kawmya_payments_suppliers`
--
ALTER TABLE `kawmya_payments_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_receivings`
--
ALTER TABLE `kawmya_receivings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_receivings_inv`
--
ALTER TABLE `kawmya_receivings_inv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_receivings_orders`
--
ALTER TABLE `kawmya_receivings_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_receivings_orders_line`
--
ALTER TABLE `kawmya_receivings_orders_line`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_receivings_suspended`
--
ALTER TABLE `kawmya_receivings_suspended`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_receivings_temporary`
--
ALTER TABLE `kawmya_receivings_temporary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_sales`
--
ALTER TABLE `kawmya_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_sales_cart`
--
ALTER TABLE `kawmya_sales_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_sales_inv`
--
ALTER TABLE `kawmya_sales_inv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_sales_suspended`
--
ALTER TABLE `kawmya_sales_suspended`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_sales_temporary`
--
ALTER TABLE `kawmya_sales_temporary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_settings`
--
ALTER TABLE `kawmya_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_staff`
--
ALTER TABLE `kawmya_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_suppliers`
--
ALTER TABLE `kawmya_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `kawmya_treasury`
--
ALTER TABLE `kawmya_treasury`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kawmya_users`
--
ALTER TABLE `kawmya_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_clients`
--
ALTER TABLE `moderea_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `moderea_companies`
--
ALTER TABLE `moderea_companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GroupName` (`CompaniesName`);

--
-- Indexes for table `moderea_config`
--
ALTER TABLE `moderea_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_customer_payments`
--
ALTER TABLE `moderea_customer_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_expenses`
--
ALTER TABLE `moderea_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_expenses_set`
--
ALTER TABLE `moderea_expenses_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GroupName` (`expensestype`);

--
-- Indexes for table `moderea_fawry`
--
ALTER TABLE `moderea_fawry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_groups`
--
ALTER TABLE `moderea_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GroupName` (`GroupName`);

--
-- Indexes for table `moderea_payments_suppliers`
--
ALTER TABLE `moderea_payments_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_receivings`
--
ALTER TABLE `moderea_receivings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_receivings_inv`
--
ALTER TABLE `moderea_receivings_inv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_receivings_orders`
--
ALTER TABLE `moderea_receivings_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_receivings_orders_line`
--
ALTER TABLE `moderea_receivings_orders_line`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_receivings_suspended`
--
ALTER TABLE `moderea_receivings_suspended`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_receivings_temporary`
--
ALTER TABLE `moderea_receivings_temporary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_sales`
--
ALTER TABLE `moderea_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_sales_cart`
--
ALTER TABLE `moderea_sales_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_sales_inv`
--
ALTER TABLE `moderea_sales_inv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_sales_suspended`
--
ALTER TABLE `moderea_sales_suspended`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_sales_temporary`
--
ALTER TABLE `moderea_sales_temporary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_settings`
--
ALTER TABLE `moderea_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_staff`
--
ALTER TABLE `moderea_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_suppliers`
--
ALTER TABLE `moderea_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `moderea_treasury`
--
ALTER TABLE `moderea_treasury`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderea_users`
--
ALTER TABLE `moderea_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `on_account`
--
ALTER TABLE `on_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pons`
--
ALTER TABLE `pons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_clients`
--
ALTER TABLE `shibin_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `shibin_companies`
--
ALTER TABLE `shibin_companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GroupName` (`CompaniesName`);

--
-- Indexes for table `shibin_config`
--
ALTER TABLE `shibin_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_customer_payments`
--
ALTER TABLE `shibin_customer_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_expenses`
--
ALTER TABLE `shibin_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_expenses_set`
--
ALTER TABLE `shibin_expenses_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GroupName` (`expensestype`);

--
-- Indexes for table `shibin_fawry`
--
ALTER TABLE `shibin_fawry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_groups`
--
ALTER TABLE `shibin_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GroupName` (`GroupName`);

--
-- Indexes for table `shibin_payments_suppliers`
--
ALTER TABLE `shibin_payments_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_receivings`
--
ALTER TABLE `shibin_receivings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_receivings_inv`
--
ALTER TABLE `shibin_receivings_inv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_receivings_orders`
--
ALTER TABLE `shibin_receivings_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_receivings_orders_line`
--
ALTER TABLE `shibin_receivings_orders_line`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_receivings_suspended`
--
ALTER TABLE `shibin_receivings_suspended`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_receivings_temporary`
--
ALTER TABLE `shibin_receivings_temporary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_sales`
--
ALTER TABLE `shibin_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_sales_cart`
--
ALTER TABLE `shibin_sales_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_sales_inv`
--
ALTER TABLE `shibin_sales_inv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_sales_suspended`
--
ALTER TABLE `shibin_sales_suspended`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_sales_temporary`
--
ALTER TABLE `shibin_sales_temporary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_settings`
--
ALTER TABLE `shibin_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_staff`
--
ALTER TABLE `shibin_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_suppliers`
--
ALTER TABLE `shibin_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `shibin_treasury`
--
ALTER TABLE `shibin_treasury`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibin_users`
--
ALTER TABLE `shibin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `size` (`size`);

--
-- Indexes for table `staff_advances`
--
ALTER TABLE `staff_advances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_deductions`
--
ALTER TABLE `staff_deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_payments`
--
ALTER TABLE `staff_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stages_of_manufacture`
--
ALTER TABLE `stages_of_manufacture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `store_out`
--
ALTER TABLE `store_out`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_temp`
--
ALTER TABLE `store_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_transaction_details`
--
ALTER TABLE `store_transaction_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allowances_bonuses`
--
ALTER TABLE `allowances_bonuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bugs`
--
ALTER TABLE `bugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cairo_clients`
--
ALTER TABLE `cairo_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cairo_companies`
--
ALTER TABLE `cairo_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cairo_config`
--
ALTER TABLE `cairo_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cairo_customer_payments`
--
ALTER TABLE `cairo_customer_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cairo_expenses`
--
ALTER TABLE `cairo_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=472;

--
-- AUTO_INCREMENT for table `cairo_expenses_set`
--
ALTER TABLE `cairo_expenses_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `cairo_fawry`
--
ALTER TABLE `cairo_fawry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cairo_groups`
--
ALTER TABLE `cairo_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cairo_payments_suppliers`
--
ALTER TABLE `cairo_payments_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cairo_receivings`
--
ALTER TABLE `cairo_receivings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cairo_receivings_inv`
--
ALTER TABLE `cairo_receivings_inv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cairo_receivings_orders`
--
ALTER TABLE `cairo_receivings_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cairo_receivings_orders_line`
--
ALTER TABLE `cairo_receivings_orders_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cairo_receivings_suspended`
--
ALTER TABLE `cairo_receivings_suspended`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4147;

--
-- AUTO_INCREMENT for table `cairo_receivings_temporary`
--
ALTER TABLE `cairo_receivings_temporary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `cairo_sales`
--
ALTER TABLE `cairo_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cairo_sales_cart`
--
ALTER TABLE `cairo_sales_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cairo_sales_inv`
--
ALTER TABLE `cairo_sales_inv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cairo_sales_suspended`
--
ALTER TABLE `cairo_sales_suspended`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT for table `cairo_sales_temporary`
--
ALTER TABLE `cairo_sales_temporary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `cairo_settings`
--
ALTER TABLE `cairo_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cairo_staff`
--
ALTER TABLE `cairo_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cairo_suppliers`
--
ALTER TABLE `cairo_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cairo_treasury`
--
ALTER TABLE `cairo_treasury`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cairo_users`
--
ALTER TABLE `cairo_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `costs_elements`
--
ALTER TABLE `costs_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `embaba_clients`
--
ALTER TABLE `embaba_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `embaba_companies`
--
ALTER TABLE `embaba_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `embaba_config`
--
ALTER TABLE `embaba_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `embaba_customer_payments`
--
ALTER TABLE `embaba_customer_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `embaba_expenses`
--
ALTER TABLE `embaba_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=472;

--
-- AUTO_INCREMENT for table `embaba_expenses_set`
--
ALTER TABLE `embaba_expenses_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `embaba_fawry`
--
ALTER TABLE `embaba_fawry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `embaba_groups`
--
ALTER TABLE `embaba_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `embaba_payments_suppliers`
--
ALTER TABLE `embaba_payments_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `embaba_receivings`
--
ALTER TABLE `embaba_receivings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `embaba_receivings_inv`
--
ALTER TABLE `embaba_receivings_inv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `embaba_receivings_orders`
--
ALTER TABLE `embaba_receivings_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `embaba_receivings_orders_line`
--
ALTER TABLE `embaba_receivings_orders_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `embaba_receivings_suspended`
--
ALTER TABLE `embaba_receivings_suspended`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4147;

--
-- AUTO_INCREMENT for table `embaba_receivings_temporary`
--
ALTER TABLE `embaba_receivings_temporary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `embaba_sales`
--
ALTER TABLE `embaba_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `embaba_sales_cart`
--
ALTER TABLE `embaba_sales_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `embaba_sales_inv`
--
ALTER TABLE `embaba_sales_inv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `embaba_sales_suspended`
--
ALTER TABLE `embaba_sales_suspended`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT for table `embaba_sales_temporary`
--
ALTER TABLE `embaba_sales_temporary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `embaba_settings`
--
ALTER TABLE `embaba_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `embaba_staff`
--
ALTER TABLE `embaba_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `embaba_suppliers`
--
ALTER TABLE `embaba_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `embaba_treasury`
--
ALTER TABLE `embaba_treasury`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `embaba_users`
--
ALTER TABLE `embaba_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expensestype`
--
ALTER TABLE `expensestype`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items_inv`
--
ALTER TABLE `items_inv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kawmya_clients`
--
ALTER TABLE `kawmya_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kawmya_companies`
--
ALTER TABLE `kawmya_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kawmya_config`
--
ALTER TABLE `kawmya_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kawmya_customer_payments`
--
ALTER TABLE `kawmya_customer_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kawmya_expenses`
--
ALTER TABLE `kawmya_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=472;

--
-- AUTO_INCREMENT for table `kawmya_expenses_set`
--
ALTER TABLE `kawmya_expenses_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `kawmya_fawry`
--
ALTER TABLE `kawmya_fawry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kawmya_groups`
--
ALTER TABLE `kawmya_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kawmya_payments_suppliers`
--
ALTER TABLE `kawmya_payments_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kawmya_receivings`
--
ALTER TABLE `kawmya_receivings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kawmya_receivings_inv`
--
ALTER TABLE `kawmya_receivings_inv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kawmya_receivings_orders`
--
ALTER TABLE `kawmya_receivings_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kawmya_receivings_orders_line`
--
ALTER TABLE `kawmya_receivings_orders_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kawmya_receivings_suspended`
--
ALTER TABLE `kawmya_receivings_suspended`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4147;

--
-- AUTO_INCREMENT for table `kawmya_receivings_temporary`
--
ALTER TABLE `kawmya_receivings_temporary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `kawmya_sales`
--
ALTER TABLE `kawmya_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kawmya_sales_cart`
--
ALTER TABLE `kawmya_sales_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kawmya_sales_inv`
--
ALTER TABLE `kawmya_sales_inv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kawmya_sales_suspended`
--
ALTER TABLE `kawmya_sales_suspended`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT for table `kawmya_sales_temporary`
--
ALTER TABLE `kawmya_sales_temporary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `kawmya_settings`
--
ALTER TABLE `kawmya_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kawmya_staff`
--
ALTER TABLE `kawmya_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kawmya_suppliers`
--
ALTER TABLE `kawmya_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kawmya_treasury`
--
ALTER TABLE `kawmya_treasury`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kawmya_users`
--
ALTER TABLE `kawmya_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `models`
--
ALTER TABLE `models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_clients`
--
ALTER TABLE `moderea_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `moderea_companies`
--
ALTER TABLE `moderea_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `moderea_config`
--
ALTER TABLE `moderea_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `moderea_customer_payments`
--
ALTER TABLE `moderea_customer_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_expenses`
--
ALTER TABLE `moderea_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=472;

--
-- AUTO_INCREMENT for table `moderea_expenses_set`
--
ALTER TABLE `moderea_expenses_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `moderea_fawry`
--
ALTER TABLE `moderea_fawry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_groups`
--
ALTER TABLE `moderea_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `moderea_payments_suppliers`
--
ALTER TABLE `moderea_payments_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_receivings`
--
ALTER TABLE `moderea_receivings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_receivings_inv`
--
ALTER TABLE `moderea_receivings_inv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_receivings_orders`
--
ALTER TABLE `moderea_receivings_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `moderea_receivings_orders_line`
--
ALTER TABLE `moderea_receivings_orders_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `moderea_receivings_suspended`
--
ALTER TABLE `moderea_receivings_suspended`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4147;

--
-- AUTO_INCREMENT for table `moderea_receivings_temporary`
--
ALTER TABLE `moderea_receivings_temporary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `moderea_sales`
--
ALTER TABLE `moderea_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_sales_cart`
--
ALTER TABLE `moderea_sales_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_sales_inv`
--
ALTER TABLE `moderea_sales_inv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_sales_suspended`
--
ALTER TABLE `moderea_sales_suspended`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT for table `moderea_sales_temporary`
--
ALTER TABLE `moderea_sales_temporary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `moderea_settings`
--
ALTER TABLE `moderea_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `moderea_staff`
--
ALTER TABLE `moderea_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `moderea_suppliers`
--
ALTER TABLE `moderea_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `moderea_treasury`
--
ALTER TABLE `moderea_treasury`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_users`
--
ALTER TABLE `moderea_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `on_account`
--
ALTER TABLE `on_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pons`
--
ALTER TABLE `pons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `shibin_clients`
--
ALTER TABLE `shibin_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shibin_companies`
--
ALTER TABLE `shibin_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shibin_config`
--
ALTER TABLE `shibin_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shibin_customer_payments`
--
ALTER TABLE `shibin_customer_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shibin_expenses`
--
ALTER TABLE `shibin_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=472;

--
-- AUTO_INCREMENT for table `shibin_expenses_set`
--
ALTER TABLE `shibin_expenses_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `shibin_fawry`
--
ALTER TABLE `shibin_fawry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shibin_groups`
--
ALTER TABLE `shibin_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shibin_payments_suppliers`
--
ALTER TABLE `shibin_payments_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shibin_receivings`
--
ALTER TABLE `shibin_receivings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shibin_receivings_inv`
--
ALTER TABLE `shibin_receivings_inv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shibin_receivings_orders`
--
ALTER TABLE `shibin_receivings_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shibin_receivings_orders_line`
--
ALTER TABLE `shibin_receivings_orders_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shibin_receivings_suspended`
--
ALTER TABLE `shibin_receivings_suspended`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4147;

--
-- AUTO_INCREMENT for table `shibin_receivings_temporary`
--
ALTER TABLE `shibin_receivings_temporary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `shibin_sales`
--
ALTER TABLE `shibin_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shibin_sales_cart`
--
ALTER TABLE `shibin_sales_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shibin_sales_inv`
--
ALTER TABLE `shibin_sales_inv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shibin_sales_suspended`
--
ALTER TABLE `shibin_sales_suspended`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT for table `shibin_sales_temporary`
--
ALTER TABLE `shibin_sales_temporary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `shibin_settings`
--
ALTER TABLE `shibin_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shibin_staff`
--
ALTER TABLE `shibin_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shibin_suppliers`
--
ALTER TABLE `shibin_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shibin_treasury`
--
ALTER TABLE `shibin_treasury`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shibin_users`
--
ALTER TABLE `shibin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `staff_advances`
--
ALTER TABLE `staff_advances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_deductions`
--
ALTER TABLE `staff_deductions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_payments`
--
ALTER TABLE `staff_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stages_of_manufacture`
--
ALTER TABLE `stages_of_manufacture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `store_out`
--
ALTER TABLE `store_out`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_temp`
--
ALTER TABLE `store_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `store_transaction_details`
--
ALTER TABLE `store_transaction_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
