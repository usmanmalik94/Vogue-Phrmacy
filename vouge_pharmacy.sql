-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2017 at 08:24 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vouge_pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `accpayables`
--

CREATE TABLE `accpayables` (
  `PayableId` int(16) NOT NULL,
  `Supplier_id` int(16) NOT NULL,
  `Tilldate` date NOT NULL,
  `amount` int(12) NOT NULL,
  `Discription` varchar(50) NOT NULL,
  `PurInvoiceID` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `advance`
--

CREATE TABLE `advance` (
  `Advanceid` int(16) NOT NULL,
  `employee_id` int(16) NOT NULL,
  `amount` int(8) NOT NULL,
  `date` date NOT NULL,
  `type` varchar(10) NOT NULL,
  `returndate` date DEFAULT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attendence`
--

CREATE TABLE `attendence` (
  `Attendenceid` int(16) NOT NULL,
  `employee_id` int(16) NOT NULL,
  `arivaltime` datetime NOT NULL,
  `left time` datetime NOT NULL,
  `type` int(10) NOT NULL,
  `workedhours` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Category_id` int(16) NOT NULL,
  `Name` varchar(15) NOT NULL,
  `Discription` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerid` int(16) NOT NULL,
  `Name` varchar(16) NOT NULL,
  `Contactno` varchar(14) DEFAULT NULL,
  `adress` varchar(40) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custpaymenthistory`
--

CREATE TABLE `custpaymenthistory` (
  `custpayid` int(16) NOT NULL,
  `reciveableid` int(16) NOT NULL,
  `Date` int(11) NOT NULL,
  `amount` int(10) NOT NULL,
  `Discription` varchar(50) DEFAULT NULL,
  `remaining` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `Employee_id` int(16) NOT NULL,
  `Firstname` varchar(12) NOT NULL,
  `lastname` int(12) NOT NULL,
  `CNIC` varchar(14) NOT NULL,
  `Adress` varchar(40) NOT NULL,
  `Designation` varchar(15) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `joiningdate` date DEFAULT NULL,
  `Email` varchar(35) DEFAULT NULL,
  `contact` varchar(14) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `othernum` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item groups`
--

CREATE TABLE `item groups` (
  `GroupId` int(16) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item history`
--

CREATE TABLE `item history` (
  `transid` int(16) NOT NULL,
  `Item_id` int(11) NOT NULL,
  `qty` int(8) NOT NULL,
  `type` varchar(20) NOT NULL,
  `Date` date NOT NULL,
  `Last location` varchar(20) DEFAULT NULL,
  `Lastlocid` int(16) DEFAULT NULL,
  `NewLocid` int(16) DEFAULT NULL,
  `newlocation` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `itemlocation`
--

CREATE TABLE `itemlocation` (
  `Location_id` int(16) NOT NULL,
  `Item_id` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `itemscategory`
--

CREATE TABLE `itemscategory` (
  `Category_id` int(16) NOT NULL,
  `Item_id` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_details`
--

CREATE TABLE `item_details` (
  `Item_ID` int(16) NOT NULL,
  `Expiry_date` date NOT NULL,
  `BarCode` varchar(32) NOT NULL,
  `Medicenname` varchar(40) NOT NULL,
  `genericname` varchar(20) NOT NULL,
  `Weight` int(5) NOT NULL,
  `AvailableQty` int(7) NOT NULL,
  `minimumQty` int(7) DEFAULT NULL,
  `PackType` int(16) DEFAULT NULL,
  `Formula` varchar(32) NOT NULL,
  `purchaserate` int(6) NOT NULL,
  `salerate` int(7) NOT NULL,
  `ControledItem` char(3) DEFAULT NULL,
  `Refrigrated` char(3) DEFAULT NULL,
  `Norcotic` varchar(3) DEFAULT NULL,
  `Category_id` int(16) DEFAULT NULL,
  `Piecesinpack` int(3) DEFAULT NULL,
  `PackingDiscription` varchar(30) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `Interactions` varchar(100) DEFAULT NULL,
  `Location` varchar(16) NOT NULL,
  `Group_id` int(16) DEFAULT NULL,
  `Supplier_id` int(16) NOT NULL,
  `Location_id` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Medicen Item Table' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `Leave_id` int(16) NOT NULL,
  `Type` int(10) NOT NULL,
  `reason` int(30) NOT NULL,
  `date` int(11) NOT NULL,
  `employee_id` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `Location_id` int(16) NOT NULL,
  `Place` varchar(20) DEFAULT NULL,
  `adress` varchar(40) DEFAULT NULL,
  `sector` varchar(6) DEFAULT NULL,
  `Item_id` int(16) NOT NULL,
  `Section` varchar(6) NOT NULL,
  `Rack` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacies`
--

CREATE TABLE `pharmacies` (
  `Phramaid` int(16) NOT NULL,
  `name` int(11) NOT NULL,
  `adress` int(40) NOT NULL,
  `contactno` varchar(14) NOT NULL,
  `City` varchar(12) NOT NULL,
  `Opendate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacyitems`
--

CREATE TABLE `pharmacyitems` (
  `Phramaid` int(11) NOT NULL,
  `Item_id` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Adddate` date DEFAULT NULL,
  `Location` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinvoiceitems`
--

CREATE TABLE `pinvoiceitems` (
  `pinvoiceid` int(16) NOT NULL,
  `Item_id` int(16) NOT NULL,
  `expirydate` date NOT NULL,
  `barcode` varchar(32) NOT NULL,
  `Qty` int(11) NOT NULL,
  `purchasedrate` int(11) NOT NULL,
  `salerate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `preturnitems`
--

CREATE TABLE `preturnitems` (
  `Preturnid` int(16) NOT NULL,
  `Item_id` int(16) NOT NULL,
  `prchaserate` int(10) NOT NULL,
  `returnedamount` int(10) NOT NULL,
  `Qty` int(10) NOT NULL,
  `expirydate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseinvoice`
--

CREATE TABLE `purchaseinvoice` (
  `Pivinvoiceid` int(16) NOT NULL,
  `date` date NOT NULL,
  `paid` int(14) NOT NULL,
  `total` int(14) NOT NULL,
  `discount` int(10) DEFAULT NULL,
  `payingdate` date NOT NULL,
  `Status` varchar(20) NOT NULL,
  `supplier_id` int(16) DEFAULT NULL,
  `purchaseorderid` int(16) DEFAULT NULL,
  `Employee_id` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorder`
--

CREATE TABLE `purchaseorder` (
  `porderid` int(16) NOT NULL,
  `Supplier_id` int(16) NOT NULL,
  `Date` date NOT NULL,
  `Amount` int(12) NOT NULL,
  `batchnum` int(10) NOT NULL,
  `frieght` int(10) NOT NULL,
  `deliverycharges` int(10) NOT NULL,
  `othercharges` int(11) NOT NULL,
  `remarks` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorderitems`
--

CREATE TABLE `purchaseorderitems` (
  `porderid` int(16) NOT NULL,
  `Item_id` int(16) NOT NULL,
  `Qty` int(11) NOT NULL,
  `remarks` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchasereturn`
--

CREATE TABLE `purchasereturn` (
  `Preturnid` int(16) NOT NULL,
  `date` int(11) NOT NULL,
  `nop` int(11) NOT NULL,
  `returndate` int(11) NOT NULL,
  `returnamount` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reciveables`
--

CREATE TABLE `reciveables` (
  `Accreciveid` int(16) NOT NULL,
  `CustomerId` int(16) NOT NULL,
  `date` date NOT NULL,
  `amount` int(12) NOT NULL,
  `tilldate` date NOT NULL,
  `invoiceid` int(16) NOT NULL,
  `remarks` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `Employee_id` int(16) NOT NULL,
  `salarytype` varchar(12) NOT NULL,
  `amount` int(8) NOT NULL,
  `medicalallowed` int(7) NOT NULL,
  `ta` int(6) NOT NULL,
  `da` int(6) NOT NULL,
  `incrementrate` float NOT NULL,
  `balance` int(9) NOT NULL,
  `deduction` int(6) NOT NULL,
  `tax%` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `saleinovice`
--

CREATE TABLE `saleinovice` (
  `invoice_id` int(16) NOT NULL,
  `CustomerId` int(16) NOT NULL,
  `Employeeid` int(16) NOT NULL,
  `total` int(12) NOT NULL,
  `Recived` int(12) NOT NULL,
  `remaining` int(12) NOT NULL,
  `discount` int(11) NOT NULL,
  `subtotal` int(12) NOT NULL,
  `remarks` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `saleinoviceitems`
--

CREATE TABLE `saleinoviceitems` (
  `inoviceid` int(16) NOT NULL,
  `Item_id` int(16) NOT NULL,
  `expirydate` date NOT NULL,
  `qty` int(10) NOT NULL,
  `saleprice` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salereturn`
--

CREATE TABLE `salereturn` (
  `sreturnid` int(16) NOT NULL,
  `Amount` int(9) NOT NULL,
  `deduction` int(9) DEFAULT NULL,
  `date` int(11) NOT NULL,
  `total` int(9) DEFAULT NULL,
  `Employee_id` int(16) NOT NULL,
  `Remarks` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salereturnitems`
--

CREATE TABLE `salereturnitems` (
  `sreturnid` int(16) NOT NULL,
  `Item_id` int(16) NOT NULL,
  `expirydate` date NOT NULL,
  `price` int(9) NOT NULL,
  `Qty` int(9) NOT NULL,
  `total` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Supplier_id` int(16) NOT NULL,
  `Name` varchar(15) NOT NULL,
  `Adress` varchar(30) NOT NULL,
  `City` varchar(10) NOT NULL,
  `Number` varchar(12) NOT NULL,
  `Companyname` varchar(15) NOT NULL,
  `othernum` varchar(12) DEFAULT NULL,
  `Email` varchar(40) NOT NULL,
  `Ntn#` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `suppliercat`
--

CREATE TABLE `suppliercat` (
  `Supplier_id` int(16) NOT NULL,
  `Category_id` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplierpaymenthistory`
--

CREATE TABLE `supplierpaymenthistory` (
  `PayhistoryId` int(16) NOT NULL,
  `Supplier_id` int(16) NOT NULL,
  `Date` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `Remaining` int(10) DEFAULT NULL,
  `discription` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_id` int(16) NOT NULL,
  `username` varchar(16) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `PriorityLevel` int(2) DEFAULT '1',
  `Status` int(12) NOT NULL,
  `email` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `User_id` int(11) NOT NULL,
  `loggedin` datetime NOT NULL,
  `loggedout` datetime NOT NULL,
  `ip` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accpayables`
--
ALTER TABLE `accpayables`
  ADD PRIMARY KEY (`PayableId`),
  ADD KEY `Supplier_id` (`Supplier_id`);

--
-- Indexes for table `advance`
--
ALTER TABLE `advance`
  ADD PRIMARY KEY (`Advanceid`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `attendence`
--
ALTER TABLE `attendence`
  ADD PRIMARY KEY (`Attendenceid`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerid`),
  ADD KEY `Name` (`Name`);

--
-- Indexes for table `custpaymenthistory`
--
ALTER TABLE `custpaymenthistory`
  ADD PRIMARY KEY (`custpayid`),
  ADD KEY `reciveableid` (`reciveableid`);

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`Employee_id`),
  ADD UNIQUE KEY `CNIC` (`CNIC`);

--
-- Indexes for table `item groups`
--
ALTER TABLE `item groups`
  ADD PRIMARY KEY (`GroupId`);

--
-- Indexes for table `item history`
--
ALTER TABLE `item history`
  ADD PRIMARY KEY (`transid`),
  ADD KEY `Item_id` (`Item_id`),
  ADD KEY `Lastlocid` (`Lastlocid`),
  ADD KEY `NewLocid` (`NewLocid`);

--
-- Indexes for table `itemlocation`
--
ALTER TABLE `itemlocation`
  ADD KEY `Location_id` (`Location_id`),
  ADD KEY `Item_id` (`Item_id`);

--
-- Indexes for table `itemscategory`
--
ALTER TABLE `itemscategory`
  ADD KEY `Category_id` (`Category_id`),
  ADD KEY `Item_id` (`Item_id`);

--
-- Indexes for table `item_details`
--
ALTER TABLE `item_details`
  ADD PRIMARY KEY (`Item_ID`,`Expiry_date`),
  ADD UNIQUE KEY `BarCode` (`BarCode`),
  ADD KEY `Group_id` (`Group_id`),
  ADD KEY `Supplier_id` (`Supplier_id`),
  ADD KEY `Location_id` (`Location_id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`Leave_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`Location_id`),
  ADD KEY `Item_id` (`Item_id`);

--
-- Indexes for table `pharmacies`
--
ALTER TABLE `pharmacies`
  ADD PRIMARY KEY (`Phramaid`);

--
-- Indexes for table `pharmacyitems`
--
ALTER TABLE `pharmacyitems`
  ADD KEY `Phramaid` (`Phramaid`),
  ADD KEY `Item_id` (`Item_id`);

--
-- Indexes for table `pinvoiceitems`
--
ALTER TABLE `pinvoiceitems`
  ADD KEY `pinvoiceid` (`pinvoiceid`),
  ADD KEY `Item_id` (`Item_id`,`expirydate`),
  ADD KEY `barcode` (`barcode`);

--
-- Indexes for table `preturnitems`
--
ALTER TABLE `preturnitems`
  ADD KEY `Preturnid` (`Preturnid`),
  ADD KEY `Item_id` (`Item_id`,`expirydate`);

--
-- Indexes for table `purchaseinvoice`
--
ALTER TABLE `purchaseinvoice`
  ADD PRIMARY KEY (`Pivinvoiceid`),
  ADD KEY `purchaseorderid` (`purchaseorderid`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  ADD PRIMARY KEY (`porderid`),
  ADD KEY `Supplier_id` (`Supplier_id`);

--
-- Indexes for table `purchaseorderitems`
--
ALTER TABLE `purchaseorderitems`
  ADD KEY `Item_id` (`Item_id`),
  ADD KEY `porderid` (`porderid`);

--
-- Indexes for table `purchasereturn`
--
ALTER TABLE `purchasereturn`
  ADD PRIMARY KEY (`Preturnid`);

--
-- Indexes for table `reciveables`
--
ALTER TABLE `reciveables`
  ADD PRIMARY KEY (`Accreciveid`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD KEY `Employee_id` (`Employee_id`);

--
-- Indexes for table `saleinovice`
--
ALTER TABLE `saleinovice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `CustomerId` (`CustomerId`),
  ADD KEY `Employeeid` (`Employeeid`);

--
-- Indexes for table `saleinoviceitems`
--
ALTER TABLE `saleinoviceitems`
  ADD KEY `inoviceid` (`inoviceid`),
  ADD KEY `expirydate` (`expirydate`,`Item_id`);

--
-- Indexes for table `salereturn`
--
ALTER TABLE `salereturn`
  ADD PRIMARY KEY (`sreturnid`);

--
-- Indexes for table `salereturnitems`
--
ALTER TABLE `salereturnitems`
  ADD KEY `sreturnid` (`sreturnid`),
  ADD KEY `Item_id` (`Item_id`,`expirydate`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Supplier_id`);

--
-- Indexes for table `suppliercat`
--
ALTER TABLE `suppliercat`
  ADD KEY `Supplier_id` (`Supplier_id`),
  ADD KEY `Category_id` (`Category_id`);

--
-- Indexes for table `supplierpaymenthistory`
--
ALTER TABLE `supplierpaymenthistory`
  ADD PRIMARY KEY (`PayhistoryId`),
  ADD KEY `Supplier_id` (`Supplier_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advance`
--
ALTER TABLE `advance`
  MODIFY `Advanceid` int(16) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `Location_id` int(16) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `custpaymenthistory`
--
ALTER TABLE `custpaymenthistory`
  ADD CONSTRAINT `custpaymenthistory_ibfk_1` FOREIGN KEY (`reciveableid`) REFERENCES `reciveables` (`Accreciveid`);

--
-- Constraints for table `item history`
--
ALTER TABLE `item history`
  ADD CONSTRAINT `item history_ibfk_1` FOREIGN KEY (`Lastlocid`) REFERENCES `location` (`Location_id`),
  ADD CONSTRAINT `item history_ibfk_2` FOREIGN KEY (`NewLocid`) REFERENCES `location` (`Location_id`);

--
-- Constraints for table `item_details`
--
ALTER TABLE `item_details`
  ADD CONSTRAINT `item_details_ibfk_1` FOREIGN KEY (`Group_id`) REFERENCES `item groups` (`GroupId`);

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`Item_id`) REFERENCES `item_details` (`Item_ID`) ON UPDATE NO ACTION;

--
-- Constraints for table `pinvoiceitems`
--
ALTER TABLE `pinvoiceitems`
  ADD CONSTRAINT `pinvoiceitems_ibfk_1` FOREIGN KEY (`pinvoiceid`) REFERENCES `purchaseinvoice` (`Pivinvoiceid`),
  ADD CONSTRAINT `pinvoiceitems_ibfk_2` FOREIGN KEY (`Item_id`,`expirydate`) REFERENCES `item_details` (`Item_ID`, `Expiry_date`);

--
-- Constraints for table `preturnitems`
--
ALTER TABLE `preturnitems`
  ADD CONSTRAINT `preturnitems_ibfk_1` FOREIGN KEY (`Preturnid`) REFERENCES `purchasereturn` (`Preturnid`),
  ADD CONSTRAINT `preturnitems_ibfk_2` FOREIGN KEY (`Item_id`,`expirydate`) REFERENCES `item_details` (`Item_ID`, `Expiry_date`);

--
-- Constraints for table `purchaseinvoice`
--
ALTER TABLE `purchaseinvoice`
  ADD CONSTRAINT `purchaseinvoice_ibfk_1` FOREIGN KEY (`purchaseorderid`) REFERENCES `purchaseorder` (`porderid`),
  ADD CONSTRAINT `purchaseinvoice_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`Supplier_id`);

--
-- Constraints for table `purchaseorderitems`
--
ALTER TABLE `purchaseorderitems`
  ADD CONSTRAINT `purchaseorderitems_ibfk_1` FOREIGN KEY (`porderid`) REFERENCES `purchaseorder` (`porderid`),
  ADD CONSTRAINT `purchaseorderitems_ibfk_2` FOREIGN KEY (`Item_id`) REFERENCES `item_details` (`Item_ID`);

--
-- Constraints for table `suppliercat`
--
ALTER TABLE `suppliercat`
  ADD CONSTRAINT `suppliercat_ibfk_1` FOREIGN KEY (`Supplier_id`) REFERENCES `supplier` (`Supplier_id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `suppliercat_ibfk_2` FOREIGN KEY (`Category_id`) REFERENCES `category` (`Category_id`);

--
-- Constraints for table `supplierpaymenthistory`
--
ALTER TABLE `supplierpaymenthistory`
  ADD CONSTRAINT `supplierpaymenthistory_ibfk_1` FOREIGN KEY (`Supplier_id`) REFERENCES `supplier` (`Supplier_id`) ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
