-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Feb 07, 2015 at 07:56 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `db`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `clients`
-- 

CREATE TABLE `clients` (
  `id` int(255) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `balance` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `clients`
-- 

INSERT INTO `clients` VALUES (1, 'احمد خليل اسلام', '', '', '', '', '', '7000', '2015-02-03 00:00:00', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `companies`
-- 

CREATE TABLE `companies` (
  `id` int(255) NOT NULL auto_increment,
  `CompaniesName` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `GroupName` (`CompaniesName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `companies`
-- 

INSERT INTO `companies` VALUES (1, 'فلورا');
INSERT INTO `companies` VALUES (2, 'بلاستيك مصر');
INSERT INTO `companies` VALUES (3, 'شركة فاين');

-- --------------------------------------------------------

-- 
-- Table structure for table `config`
-- 

CREATE TABLE `config` (
  `id` int(255) NOT NULL auto_increment,
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
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `config`
-- 

INSERT INTO `config` VALUES (1, 'pos', 0, '', 'Africa/Cairo', 2, 1, '', '', 0, '', '', '', 0, '', '', '', 0, '16', 14, '0', 2);

-- --------------------------------------------------------

-- 
-- Table structure for table `customer_payments`
-- 

CREATE TABLE `customer_payments` (
  `id` int(255) NOT NULL auto_increment,
  `client` varchar(255) NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `Date` date NOT NULL,
  `PaymentMethod` int(1) NOT NULL,
  `Due_Date` date NOT NULL,
  `notes` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `customer_payments`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `expenses`
-- 

CREATE TABLE `expenses` (
  `id` int(255) NOT NULL auto_increment,
  `date` datetime NOT NULL,
  `Amount` decimal(10,3) NOT NULL,
  `Employee` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `details` longtext NOT NULL,
  `user` varchar(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `expenses`
-- 

INSERT INTO `expenses` VALUES (1, '2015-02-05 00:00:00', 5.500, '', '', '9', '', '0000-00-00', '', '');
INSERT INTO `expenses` VALUES (2, '2015-02-05 00:00:00', 3.500, '', '', '10', '', '0000-00-00', '', '');
INSERT INTO `expenses` VALUES (7, '2015-02-05 00:00:00', 7.785, '', '', '5', '', '0000-00-00', '', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `expenses_set`
-- 

CREATE TABLE `expenses_set` (
  `id` int(255) NOT NULL auto_increment,
  `expensestype` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `GroupName` (`expensestype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- 
-- Dumping data for table `expenses_set`
-- 

INSERT INTO `expenses_set` VALUES (7, 'مرتبات');
INSERT INTO `expenses_set` VALUES (5, 'ايجار');
INSERT INTO `expenses_set` VALUES (6, 'كهرباء');
INSERT INTO `expenses_set` VALUES (8, 'سلفيات');
INSERT INTO `expenses_set` VALUES (9, 'مياه');
INSERT INTO `expenses_set` VALUES (10, 'ادوات مكتبية');
INSERT INTO `expenses_set` VALUES (11, 'اخرى');

-- --------------------------------------------------------

-- 
-- Table structure for table `fawry`
-- 

CREATE TABLE `fawry` (
  `id` int(255) NOT NULL auto_increment,
  `date` datetime NOT NULL,
  `Amount` varchar(255) NOT NULL,
  `Employee` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `details` longtext NOT NULL,
  `user` varchar(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `fawry`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `groups`
-- 

CREATE TABLE `groups` (
  `id` int(255) NOT NULL auto_increment,
  `GroupName` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `useimage` int(1) NOT NULL,
  `background` varchar(7) NOT NULL,
  `rank` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `GroupName` (`GroupName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `groups`
-- 

INSERT INTO `groups` VALUES (1, 'ورقيات', '', 0, '#000000', '');
INSERT INTO `groups` VALUES (2, 'شنط بلاستيك', '', 0, '#000000', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `items`
-- 

CREATE TABLE `items` (
  `id` int(255) NOT NULL auto_increment,
  `groupid` varchar(255) NOT NULL,
  `item` varchar(70) NOT NULL,
  `date` date NOT NULL,
  `Quantity` int(11) NOT NULL default '0',
  `Retail_price` varchar(11) NOT NULL,
  `price` varchar(11) NOT NULL,
  `Sale_wholesale_price` varchar(11) NOT NULL,
  `Barcode` varchar(255) NOT NULL,
  `Supplier` varchar(255) NOT NULL,
  `Discount` varchar(3) NOT NULL,
  `useimage` int(1) NOT NULL,
  `image` varchar(255) NOT NULL,
  `Background` varchar(11) NOT NULL,
  `OrderNo` varchar(255) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `alert_shortcomings` varbinary(6) NOT NULL,
  `subprice` varbinary(6) NOT NULL,
  `companies` int(60) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `item` (`item`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `items`
-- 

INSERT INTO `items` VALUES (1, '1', 'مناديل فلورا', '2015-02-03', 10, '10', '9.5', '', '', '', '', 0, '', '#000000', '', '10', 0x33, 0x312e3235, 1);
INSERT INTO `items` VALUES (2, '1', 'مناديل فاين', '1970-01-01', 20, '20', '15.5', '', '', '', '', 0, '', '#000000', '', '10', 0x33, 0x3230, 3);
INSERT INTO `items` VALUES (3, '2', 'شنط بلاستيك وسط', '1970-01-01', 20, '20', '15', '', '', '', '', 0, '', '#000000', '', '10', 0x32, 0x32, 2);

-- --------------------------------------------------------

-- 
-- Table structure for table `payments_suppliers`
-- 

CREATE TABLE `payments_suppliers` (
  `id` int(255) NOT NULL auto_increment,
  `Supplier` varchar(255) NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `Date` date NOT NULL,
  `PaymentMethod` int(1) NOT NULL,
  `Due_Date` date NOT NULL,
  `notes` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `payments_suppliers`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `receivings`
-- 

CREATE TABLE `receivings` (
  `id` int(255) NOT NULL auto_increment,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `Discount` varchar(3) NOT NULL default '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `receivings`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `receivings_inv`
-- 

CREATE TABLE `receivings_inv` (
  `id` int(255) NOT NULL auto_increment,
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
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `receivings_inv`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `receivings_suspended`
-- 

CREATE TABLE `receivings_suspended` (
  `id` int(255) NOT NULL auto_increment,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `Discount` varchar(3) NOT NULL default '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

-- 
-- Dumping data for table `receivings_suspended`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `receivings_temporary`
-- 

CREATE TABLE `receivings_temporary` (
  `id` int(255) NOT NULL auto_increment,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `Discount` varchar(3) NOT NULL default '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `receivings_temporary`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `sales`
-- 

CREATE TABLE `sales` (
  `id` int(255) NOT NULL auto_increment,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `Discount` varchar(3) NOT NULL default '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `sales_type` varchar(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- 
-- Dumping data for table `sales`
-- 

INSERT INTO `sales` VALUES (1, '10', '3', '2', '0.5', '', '10', '1', '15', '2015-02-05 00:00:00', '1', '10', '2');
INSERT INTO `sales` VALUES (2, '11', '3', '20', '2', '', '40', '', '15', '2015-02-05 00:00:00', '1', '10', '1');
INSERT INTO `sales` VALUES (3, '12', '3', '20', '2', '', '40', '1', '15', '2015-02-05 00:00:00', '1', '10', '1');
INSERT INTO `sales` VALUES (4, '13', '3', '2', '0.1', '', '2', '', '15', '2015-02-05 00:00:00', '1', '10', '2');
INSERT INTO `sales` VALUES (5, '14', '3', '2', '0.2', '', '4', '1', '15', '2015-02-05 00:00:00', '1', '10', '2');

-- --------------------------------------------------------

-- 
-- Table structure for table `sales_cart`
-- 

CREATE TABLE `sales_cart` (
  `id` int(255) NOT NULL auto_increment,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `Discount` varchar(3) NOT NULL,
  `Total` varchar(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `sales_cart`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `sales_inv`
-- 

CREATE TABLE `sales_inv` (
  `id` int(255) NOT NULL auto_increment,
  `inv_id` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `Total` varchar(11) NOT NULL,
  `supplier` varchar(60) NOT NULL,
  `PaymentMethod` int(1) NOT NULL,
  `paid` varchar(11) NOT NULL,
  `DueDate` date NOT NULL,
  `CheckNumber` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `type` int(1) NOT NULL,
  `sales_type` int(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- 
-- Dumping data for table `sales_inv`
-- 

INSERT INTO `sales_inv` VALUES (1, '', '2015-02-05 00:00:00', '-8', '1', 1, '', '0000-00-00', '', '', 3, 0);
INSERT INTO `sales_inv` VALUES (2, '10', '2015-02-05 00:00:00', '10', '1', 1, '8', '0000-00-00', '', '', 1, 0);
INSERT INTO `sales_inv` VALUES (3, '', '2015-02-05 00:00:00', '-40', '', 1, '', '0000-00-00', '', '', 3, 0);
INSERT INTO `sales_inv` VALUES (4, '11', '2015-02-05 00:00:00', '40', '', 1, '40', '0000-00-00', '', '', 1, 0);
INSERT INTO `sales_inv` VALUES (5, '', '2015-02-05 00:00:00', '-40', '1', 1, '', '0000-00-00', '', '', 3, 0);
INSERT INTO `sales_inv` VALUES (6, '12', '2015-02-05 00:00:00', '40', '1', 1, '40', '0000-00-00', '', '', 1, 0);
INSERT INTO `sales_inv` VALUES (7, '', '2015-02-05 00:00:00', '-2', '', 1, '', '0000-00-00', '', '', 3, 0);
INSERT INTO `sales_inv` VALUES (8, '13', '2015-02-05 00:00:00', '2', '', 1, '2', '0000-00-00', '', '', 1, 0);
INSERT INTO `sales_inv` VALUES (9, '', '2015-02-05 00:00:00', '-4', '1', 1, '', '0000-00-00', '', '', 3, 0);
INSERT INTO `sales_inv` VALUES (10, '14', '2015-02-05 00:00:00', '4', '1', 1, '4', '0000-00-00', '', '', 1, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `sales_suspended`
-- 

CREATE TABLE `sales_suspended` (
  `id` int(255) NOT NULL auto_increment,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `Discount` varchar(3) NOT NULL default '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `sales_type` varchar(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=238 ;

-- 
-- Dumping data for table `sales_suspended`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `sales_temporary`
-- 

CREATE TABLE `sales_temporary` (
  `id` int(255) NOT NULL auto_increment,
  `inv_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `Price` varchar(11) NOT NULL,
  `Quantity` varchar(11) NOT NULL,
  `Discount` varchar(3) NOT NULL default '0',
  `Total` varchar(11) NOT NULL,
  `SupplierID` varchar(255) NOT NULL,
  `BuyPrice` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `subqty` varchar(10) NOT NULL,
  `sales_type` varchar(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

-- 
-- Dumping data for table `sales_temporary`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `settings`
-- 

CREATE TABLE `settings` (
  `id` int(3) NOT NULL auto_increment,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `settings`
-- 

INSERT INTO `settings` VALUES (1, '1');

-- --------------------------------------------------------

-- 
-- Table structure for table `staff`
-- 

CREATE TABLE `staff` (
  `id` int(255) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `balance` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

-- 
-- Dumping data for table `staff`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `suppliers`
-- 

CREATE TABLE `suppliers` (
  `id` int(255) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` longtext NOT NULL,
  `balance` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `suppliers`
-- 

INSERT INTO `suppliers` VALUES (1, 'محمد', '', '', '', '', '', '5000.500', '1970-01-01 00:00:00', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `treasury`
-- 

CREATE TABLE `treasury` (
  `id` int(255) NOT NULL auto_increment,
  `type` varchar(1) NOT NULL,
  `date` datetime NOT NULL,
  `Amount` varchar(11) NOT NULL,
  `notes` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- 
-- Dumping data for table `treasury`
-- 

INSERT INTO `treasury` VALUES (1, '4', '2015-02-05 00:00:00', '8', 'فاتورة رقم 10');
INSERT INTO `treasury` VALUES (2, '4', '2015-02-05 00:00:00', '40', 'فاتورة رقم 11');
INSERT INTO `treasury` VALUES (3, '4', '2015-02-05 00:00:00', '40', 'فاتورة رقم 12');
INSERT INTO `treasury` VALUES (4, '4', '2015-02-05 00:00:00', '2', 'فاتورة رقم 13');
INSERT INTO `treasury` VALUES (5, '4', '2015-02-05 00:00:00', '4', 'فاتورة رقم 14');

-- --------------------------------------------------------

-- 
-- Table structure for table `users`
-- 

CREATE TABLE `users` (
  `id` int(255) NOT NULL auto_increment,
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
  `IsAdmin` int(1) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `users`
-- 

INSERT INTO `users` VALUES (1, 'demo', 'demo', 'demo', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 1);
