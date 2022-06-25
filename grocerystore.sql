-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2022 at 07:42 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grocerystore`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(13) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(10) NOT NULL,
  `category_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'pulses');

-- --------------------------------------------------------

--
-- Table structure for table `cus_order`
--

CREATE TABLE `cus_order` (
  `order_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `cart_qty` int(11) NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(10) NOT NULL,
  `cus_id` int(10) NOT NULL,
  `delivery_status` varchar(20) NOT NULL,
  `delivery_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `feedback_name` varchar(30) NOT NULL,
  `feedback_email` varchar(30) NOT NULL,
  `feedback_desp` varchar(500) NOT NULL,
  `cus_id` int(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `feedback_name`, `feedback_email`, `feedback_desp`, `cus_id`) VALUES
(3, 'snehansu sekhar sahu', 'snehansu284@gmail.com', 'you are doing great job...\r\nloved the interface..', NULL),
(4, 'Purusottam Gupta', 'purusottam64@gmail.com', ' All are Quality products', NULL),
(5, '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `pay_id` int(13) NOT NULL,
  `pay_status` varchar(10) NOT NULL,
  `cus_id` int(10) NOT NULL,
  `pay_mode` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(13) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_qty` varchar(10) NOT NULL,
  `category_id` int(10) NOT NULL,
  `product_img` mediumblob NOT NULL,
  `product_desp` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_qty`, `category_id`, `product_img`, `product_desp`) VALUES
(12, 'Onion-', 28, '1 Kg', 0, '', 'Onion-1 kg\nOnion is an antioxidant rich vegetable that is also versatile and is used in different food preparations in India and across the world. '),
(13, ' Plum Indian ', 155, '1 Kg', 0, '', 'Plum is tart-sweet and offers an acidic flavor. It is a red skin plum with pale yellow flesh. The Flesh is dense, crunchy, and mildly juicy. Red Plum is a versatile Plum, great for snacking and making pies, jams & sauces. Plums are a rich source of Vitamin D, which is essential for healthy bones. Buy Plum Indian 8 Pcs (Pack) (Approx 350 g - 400 g) online now.'),
(14, 'Amul Pure Ghee', 225, '500 ml', 0, '', 'For all your cooking needs, look no further than Amul Pure Ghee. With a long shelf-life and rich aroma, this is an ideal product for your kitchen and serves as a good Vitamin A source. It is clarified butter in its purest form and you can use it for a variety of purposes. Buy Amul Pure Ghee online now!'),
(15, 'Britannia Strawberry Veg ', 10, '33 g', 0, '', 'Little muffills with gooey centres in your favourite flavours. Introducing Britannia Strawberry Veg Muffils oozing with a delightful strawberry filling. So buy this sweet delight online now and let the kid inside you enjoy this treat.'),
(16, 'vdfvdfv', 6666, '3', 0, '', 'tydhcrhutjthffttujuf');

-- --------------------------------------------------------

--
-- Table structure for table `userregister`
--

CREATE TABLE `userregister` (
  `cus_id` int(10) NOT NULL,
  `first_name` varchar(13) NOT NULL,
  `last_name` varchar(10) NOT NULL,
  `cus_email` varchar(30) NOT NULL,
  `cus_mobile` varchar(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  `pincode` int(6) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(30) NOT NULL,
  `cus_img` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userregister`
--

INSERT INTO `userregister` (`cus_id`, `first_name`, `last_name`, `cus_email`, `cus_mobile`, `address`, `pincode`, `city`, `state`, `cus_img`) VALUES
(5, 'Ramya ', 'Shree', 'ramyashree@gmail.com', '8978564322', 'PR Peta, NKT Road', 764001, 'Jeypore', 'Odisha', ''),
(6, 'Sibo narayan', 'Mohapatro', 'Sibonarayan@gmail.com', '897834567', 'Parabeda', 764001, 'jeypore', 'Odisha', ''),
(7, 'Purusottam', 'Gupta', 'purusottam64@gmail.com', '8984567898', 'new street , jeypore', 764001, 'jeypore', 'odisha', ''),
(8, 'Kriti', 'Behera', 'Kriti@gmail.com', '3458634685', 'Parabeda', 764001, 'jeypore', 'odisha', ''),
(9, 'Subranshu', 'padhy', 'subransucr@gmail.com', '3456789875', 'pailo steet', 764001, 'jeypore', 'odisha', ''),
(10, 'amit', 'Gupta', 'nrrrujrj@gmail.com', '336463456', 'ghhhhh', 5366364, 'Koraput', 'odisha', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `cus_order`
--
ALTER TABLE `cus_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`pay_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `userregister`
--
ALTER TABLE `userregister`
  ADD PRIMARY KEY (`cus_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cus_order`
--
ALTER TABLE `cus_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `pay_id` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `userregister`
--
ALTER TABLE `userregister`
  MODIFY `cus_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
