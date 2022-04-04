-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 04, 2022 at 12:24 AM
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


-- --------------------------------------------------------

--
-- Table structure for table `bugs`
--

-- --------------------------------------------------------

--
-- Table structure for table `moderea_clients`
--

CREATE TABLE `moderea_clients` (
  `id` int(255) NOT NULL,
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
  `id` int(255) NOT NULL,
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
  `id` int(255) NOT NULL,
  `CompanyName` varchar(255) NOT NULL,
  `isLogo` int(1) NOT NULL,
  `Logo` varchar(255) NOT NULL,
  `TimeZone` varchar(255) NOT NULL,
  `Currency` int(1) NOT NULL,
  `Language` int(1) NOT NULL,
  `E_mail` varchar(255) NOT NULL,
  `Website` varchar(255) NOT NULL,
  `PrintingAftermarket` int(1) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `ReturnPolicy` varchar(255) NOT NULL,
  `Phone` varchar(60) NOT NULL,
  `Branch` int(3) NOT NULL,
  `CustomField1` varchar(255) NOT NULL,
  `CustomField2` varchar(255) NOT NULL,
  `CustomField3` varchar(255) NOT NULL,
  `LastInvoiceNo` int(255) NOT NULL,
  `LastreceivingsInvoiceNo` varchar(255) NOT NULL,
  `LastsaleInvoiceNo` int(255) NOT NULL,
  `cat_items_show` varchar(255) NOT NULL,
  `sales_type` int(1) NOT NULL,
  `receivings_type` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `moderea_config`
--

INSERT INTO `moderea_config` (`id`, `CompanyName`, `isLogo`, `Logo`, `TimeZone`, `Currency`, `Language`, `E_mail`, `Website`, `PrintingAftermarket`, `Address`, `ReturnPolicy`, `Phone`, `Branch`, `CustomField1`, `CustomField2`, `CustomField3`, `LastInvoiceNo`, `LastreceivingsInvoiceNo`, `LastsaleInvoiceNo`, `cat_items_show`, `sales_type`, `receivings_type`) VALUES
(1, 'Vially', 0, '', 'Africa/Cairo', 2, 1, '', '', 1, '', 'نسعد دائما بنواجدكم داخل الفرع... شكرا لثقتكم *الرجاء الاحتفاظ بالفاتوره كمستند اساسي *', '', 0, 'البضاعه المباعه ترد وتستبدل  خلال 14 يوم من تاريخ البون ماعدا ايام الاوكازيون خلال 3 ايام فقط  بشرط ان تكون علي حالتها الاصليه', 'الاكسسوار المباع لايرد ولايستبدل', '', 0, '0', 0, '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `moderea_customer_payments`
--

CREATE TABLE `moderea_customer_payments` (
  `id` int(255) NOT NULL,
  `client` varchar(255) NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `Date` date NOT NULL,
  `PaymentMethod` int(1) NOT NULL,
  `Due_Date` date NOT NULL,
  `notes` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_expenses`
--

CREATE TABLE `moderea_expenses` (
  `id` int(255) NOT NULL,
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
  `id` int(255) NOT NULL,
  `expensestype` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `moderea_expenses_set`
--

INSERT INTO `moderea_expenses_set` (`id`, `expensestype`) VALUES
(28, 'ترزي'),
(27, 'فاتوره كهرباء'),
(26, 'نظافه');

-- --------------------------------------------------------

--
-- Table structure for table `moderea_fawry`
--

CREATE TABLE `moderea_fawry` (
  `id` int(255) NOT NULL,
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
  `id` int(255) NOT NULL,
  `GroupName` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `useimage` int(1) NOT NULL,
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
  `item` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_payments_suppliers`
--

CREATE TABLE `moderea_payments_suppliers` (
  `id` int(255) NOT NULL,
  `Supplier` varchar(255) NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `Date` date NOT NULL,
  `PaymentMethod` int(1) NOT NULL,
  `Due_Date` date NOT NULL,
  `notes` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_receivings`
--

CREATE TABLE `moderea_receivings` (
  `id` int(255) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(1) NOT NULL,
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
-- Table structure for table `moderea_receivings_inv`
--

CREATE TABLE `moderea_receivings_inv` (
  `id` int(255) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `Total` varchar(11) NOT NULL,
  `supplier` varchar(60) NOT NULL,
  `PaymentMethod` int(1) NOT NULL,
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
  `id` int(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(1) NOT NULL,
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
  `id` int(255) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit` int(1) NOT NULL,
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
-- Table structure for table `moderea_sales`
--

CREATE TABLE `moderea_sales` (
  `id` int(255) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
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
-- Table structure for table `moderea_sales_cart`
--

CREATE TABLE `moderea_sales_cart` (
  `id` int(255) NOT NULL,
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
  `id` int(255) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `discount` varchar(5) NOT NULL,
  `Total` varchar(11) NOT NULL,
  `supplier` varchar(60) NOT NULL,
  `PaymentMethod` int(1) NOT NULL,
  `paid` varchar(11) NOT NULL,
  `DueDate` date NOT NULL,
  `CheckNumber` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `type` int(1) NOT NULL,
  `sales_type` int(1) NOT NULL,
  `customer_name` varchar(225) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `saller_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_sales_suspended`
--

CREATE TABLE `moderea_sales_suspended` (
  `id` int(255) NOT NULL,
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
  `id` int(255) NOT NULL,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL,
  `Discount` varchar(3) NOT NULL DEFAULT '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `sellerID` int(11) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `sales_type` varchar(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_name` varchar(225) NOT NULL,
  `customer_phone` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderea_settings`
--

CREATE TABLE `moderea_settings` (
  `id` int(3) NOT NULL,
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
  `id` int(255) NOT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `moderea_suppliers`
--

CREATE TABLE `moderea_suppliers` (
  `id` int(255) NOT NULL,
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
  `id` int(255) NOT NULL,
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
  `id` int(255) NOT NULL,
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
  `user_treasury` int(1) NOT NULL,
  `IsAdmin` int(1) NOT NULL,
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
(1, 'vially', 'vially', 'vially100', '1', '1', '1', '1', '', '', '', '', '1', '1', '1', '', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '1', '', '', '1', '1', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0);


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
-- Indexes for table `colors`
----
-- AUTO_INCREMENT for table `moderea_clients`
--
ALTER TABLE `moderea_clients`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `moderea_companies`
--
ALTER TABLE `moderea_companies`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `moderea_config`
--
ALTER TABLE `moderea_config`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `moderea_customer_payments`
--
ALTER TABLE `moderea_customer_payments`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_expenses`
--
ALTER TABLE `moderea_expenses`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=472;

--
-- AUTO_INCREMENT for table `moderea_expenses_set`
--
ALTER TABLE `moderea_expenses_set`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `moderea_fawry`
--
ALTER TABLE `moderea_fawry`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_groups`
--
ALTER TABLE `moderea_groups`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `moderea_payments_suppliers`
--
ALTER TABLE `moderea_payments_suppliers`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_receivings`
--
ALTER TABLE `moderea_receivings`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_receivings_inv`
--
ALTER TABLE `moderea_receivings_inv`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_receivings_orders`
--
ALTER TABLE `moderea_receivings_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_receivings_orders_line`
--
ALTER TABLE `moderea_receivings_orders_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_receivings_suspended`
--
ALTER TABLE `moderea_receivings_suspended`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_receivings_temporary`
--
ALTER TABLE `moderea_receivings_temporary`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_sales`
--
ALTER TABLE `moderea_sales`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_sales_cart`
--
ALTER TABLE `moderea_sales_cart`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_sales_inv`
--
ALTER TABLE `moderea_sales_inv`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_sales_suspended`
--
ALTER TABLE `moderea_sales_suspended`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_sales_temporary`
--
ALTER TABLE `moderea_sales_temporary`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_settings`
--
ALTER TABLE `moderea_settings`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `moderea_staff`
--
ALTER TABLE `moderea_staff`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `moderea_suppliers`
--
ALTER TABLE `moderea_suppliers`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `moderea_treasury`
--
ALTER TABLE `moderea_treasury`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderea_users`
--
ALTER TABLE `moderea_users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
  
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;