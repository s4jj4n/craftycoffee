-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: mysql7
-- Generation Time: Sep 25, 2019 at 09:33 AM
-- Server version: 5.7.25
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `craftycoffee`
--

-- --------------------------------------------------------

--
-- Table structure for table `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(15, 1, 1, 'espresso-shot.jpg', 'image', 1200, 689, 52681, NULL, NULL, NULL, '2019-09-23 10:24:25', '2019-09-23 10:24:25', '2019-09-23 10:24:35', 'adfb68bf-2b75-4b28-be3b-db39597902ab'),
(35, 1, 1, 'iced-coffee.jpg', 'image', 1200, 971, 73657, NULL, NULL, NULL, '2019-09-24 05:04:33', '2019-09-24 05:04:33', '2019-09-24 05:04:37', '8cccf453-ec14-40c6-bcd2-aa1a28b5b4e9');

-- --------------------------------------------------------

--
-- Table structure for table `assettransformindex`
--

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assettransformindex`
--

INSERT INTO `assettransformindex` (`id`, `assetId`, `filename`, `format`, `location`, `volumeId`, `fileExists`, `inProgress`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 15, 'espresso-shot.jpg', NULL, '_drinksHomepageThumb', 1, 1, 0, '2019-09-24 05:01:07', '2019-09-24 05:01:07', '2019-09-24 05:01:08', '1c448cb8-cd47-4a5b-a6bf-a6ac316d6b76'),
(2, 35, 'iced-coffee.jpg', NULL, '_drinksHomepageThumb', 1, 1, 0, '2019-09-24 05:05:04', '2019-09-24 05:05:04', '2019-09-24 05:05:05', '6765c785-d2bb-4d48-8ca6-3ac02f7b7897');

-- --------------------------------------------------------

--
-- Table structure for table `assettransforms`
--

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assettransforms`
--

INSERT INTO `assettransforms` (`id`, `name`, `handle`, `mode`, `position`, `width`, `height`, `format`, `quality`, `interlace`, `dimensionChangeTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '840x200 Thumb', 'drinksHomepageThumb', 'crop', 'center-center', 840, 200, NULL, NULL, 'none', '2019-09-23 10:11:36', '2019-09-23 10:11:36', '2019-09-23 10:11:36', 'efb58c0f-8465-4415-8f3d-9f98cd5af0d6');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `groupId`, `parentId`, `deletedWithGroup`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(147, 1, NULL, NULL, '2019-09-25 07:51:55', '2019-09-25 07:51:55', '39441a13-1bf9-4f82-8dbe-35996adc13d8'),
(148, 1, NULL, NULL, '2019-09-25 08:02:58', '2019-09-25 08:02:58', 'c1fd390f-628e-4c05-8ffe-c5d5cb6ccd4a');

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorygroups`
--

INSERT INTO `categorygroups` (`id`, `structureId`, `fieldLayoutId`, `name`, `handle`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 2, 10, 'Drink Styles', 'drinkStyles', '2019-09-25 07:30:06', '2019-09-25 07:50:57', NULL, '2dc127d1-bd07-4704-8fc5-b2415fb11c3d');

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorygroups_sites`
--

INSERT INTO `categorygroups_sites` (`id`, `groupId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, 'styles/{slug}', 'styles/_category', '2019-09-25 07:30:06', '2019-09-25 07:50:57', 'bacd2fa8-bbcd-43be-b27b-da7b88ca0d90');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_drinkIntro` text,
  `field_pageCopy` text,
  `field_newsExcerpt` text,
  `field_newsBody` text,
  `field_subtitle` text,
  `field_pageIntro` text,
  `field_dateAddedToMenu` datetime DEFAULT NULL,
  `field_recipeSnapshot` text,
  `field_styleDescription` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_drinkIntro`, `field_pageCopy`, `field_newsExcerpt`, `field_newsBody`, `field_subtitle`, `field_pageIntro`, `field_dateAddedToMenu`, `field_recipeSnapshot`, `field_styleDescription`) VALUES
(1, 1, 1, NULL, '2019-09-23 05:24:42', '2019-09-24 08:23:04', '63503125-3f1d-4e29-972f-b6761abf5aeb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 1, NULL, '2019-09-23 09:00:23', '2019-09-23 09:00:23', '94763545-ac1e-474b-8ab7-26287619221b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, 1, 'Perfect Espresso', '2019-09-23 09:14:35', '2019-09-25 08:53:25', 'ae5329f7-9a5b-4909-8245-1e0460fd918c', 'This is an introduction to the Espresso drink.', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', NULL, NULL, NULL, NULL, '2019-09-21 07:00:00', NULL, NULL),
(5, 5, 1, 'Perfect Espresso', '2019-09-23 09:14:35', '2019-09-23 09:14:35', '515b837c-65c2-4c46-ac6d-ad0e9b471255', 'This is an introduction to the Espresso drink.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 7, 1, 'Crafty Coffee is Open for Business', '2019-09-23 09:22:06', '2019-09-23 09:25:39', '5d45e878-4bd5-4bfe-bd63-8a925fe48c2e', NULL, NULL, 'if you\'re craving for best coffee in town, we\'ve got it.', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>', NULL, NULL, NULL, NULL, NULL),
(8, 8, 1, 'My First News', '2019-09-23 09:22:07', '2019-09-23 09:22:07', '548aef11-057f-44a7-add8-02ca6a38fb2d', NULL, NULL, 'my first news exceprt', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 9, 1, 'My First News', '2019-09-23 09:22:12', '2019-09-23 09:22:12', '612a6fd1-cfa6-4f61-87f2-2bfea6df7418', NULL, NULL, 'my first news exceprt', '<p> </p>', NULL, NULL, NULL, NULL, NULL),
(10, 10, 1, 'My First News', '2019-09-23 09:24:31', '2019-09-23 09:24:31', '45e43838-bbc1-4828-b6c5-0bbd696244d1', NULL, NULL, 'my first news exceprt', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>', NULL, NULL, NULL, NULL, NULL),
(11, 11, 1, 'Crafty Coffee is Open for Business', '2019-09-23 09:25:39', '2019-09-23 09:25:39', 'ef2aff4a-b134-4d92-8684-d02cfec42e9c', NULL, NULL, 'if you\'re craving for best coffee in town, we\'ve got it.', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>', NULL, NULL, NULL, NULL, NULL),
(12, 12, 1, NULL, '2019-09-23 09:27:27', '2019-09-23 09:27:27', 'ed5922e7-4e46-4239-9128-f59050e35176', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 13, 1, 'Homepage', '2019-09-23 09:44:03', '2019-09-23 09:44:03', '385d4f34-7d3b-42a8-8e87-2759f49ba491', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 15, 1, 'Espresso shot', '2019-09-23 10:24:25', '2019-09-23 10:24:35', 'bfbd1a0e-cde0-4cae-8dfe-06e08162a39b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 16, 1, 'Perfect Espresso', '2019-09-23 10:25:39', '2019-09-23 10:25:39', '9dc77256-e696-4e66-8d3f-bfdac6c2316a', 'This is an introduction to the Espresso drink.', '<p> </p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 17, 1, 'Perfect Espresso', '2019-09-23 10:26:17', '2019-09-23 10:26:17', '69257042-db15-4cf7-8ea4-92323ef2c911', 'This is an introduction to the Espresso drink.', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 18, 1, 'Perfect Espresso', '2019-09-23 10:26:32', '2019-09-23 10:26:32', '7c278a3c-c34a-4621-be6e-701ed7f47b1a', 'This is an introduction to the Espresso drink.', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 20, 1, 'About Crafty Coffee', '2019-09-23 10:58:06', '2019-09-23 11:17:32', 'a42a4ec7-5a76-4a2e-aa7e-46e49695e1cf', NULL, '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, 'How it happened.', 'Everything you needed to know.', NULL, NULL, NULL),
(21, 21, 1, 'About Crafty Coffee', '2019-09-23 10:58:06', '2019-09-23 10:58:06', '159ef521-8278-41d9-baeb-688d92b74d2c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 23, 1, 'Locations', '2019-09-23 10:58:19', '2019-09-24 10:03:09', '58274b7b-e453-4682-97d2-57c0990efdf4', NULL, '<p>page copy</p>', NULL, NULL, 'Where We Are', 'This is the intro.', NULL, NULL, NULL),
(24, 24, 1, 'Locations', '2019-09-23 10:58:19', '2019-09-23 10:58:19', 'f9565a3a-be05-48a8-9bb4-18c7eb8700a3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 26, 1, 'Kathmanadu, Nepal', '2019-09-23 10:58:51', '2019-09-24 10:04:52', '5a11ef0a-2449-4bfc-bba2-7d0949d42419', NULL, '<p>Page copy.</p>', NULL, NULL, 'Home of the momos.', 'Page intro', NULL, NULL, NULL),
(27, 27, 1, 'Kathmanadu, Nepal', '2019-09-23 10:58:52', '2019-09-23 10:58:52', '86abdd88-0664-48af-beb8-7b8f760eb0a1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 29, 1, 'About Crafty Coffee', '2019-09-23 10:59:51', '2019-09-23 10:59:51', '01767fb7-ff05-41e0-a650-1624e9f1a368', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 31, 1, 'Founders', '2019-09-23 11:07:02', '2019-09-23 11:15:58', '4704cad0-8fbc-4877-9e5c-bc0d44579898', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 32, 1, 'Founders', '2019-09-23 11:07:02', '2019-09-23 11:07:02', 'c69f43cd-81a1-40f4-81ab-517ad1abf1e2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 33, 1, 'About Crafty Coffee', '2019-09-23 11:17:32', '2019-09-23 11:17:32', 'e9563726-35e4-4794-844c-4454c0056536', NULL, '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, 'How it happened.', 'Everything you needed to know.', NULL, NULL, NULL),
(35, 35, 1, 'Iced coffee', '2019-09-24 05:04:33', '2019-09-24 05:04:37', 'a2303861-3eb7-4d6d-8f0e-6f04ee1e3631', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 36, 1, 'Japanese Iced Coffee', '2019-09-24 05:04:48', '2019-09-25 08:23:51', '0377c245-c2b2-445d-8e33-fc36d3e0f3a4', 'The best iced coffed ever.', '<p>japanese iced coffee</p>', NULL, NULL, NULL, NULL, '2019-09-23 07:00:00', NULL, NULL),
(37, 37, 1, 'Japanese Iced Coffee', '2019-09-24 05:04:49', '2019-09-24 05:04:49', '346fa216-1614-456f-901e-34c262c1f355', 'The best iced coffed ever.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 38, 1, NULL, '2019-09-24 07:51:50', '2019-09-24 07:51:50', '6f52c5a8-ddd3-40da-9a3b-06bc6a3a6b91', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 39, 1, NULL, '2019-09-24 07:53:33', '2019-09-24 07:53:33', '3d2058fa-c15b-4067-9957-a67c36198259', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 40, 1, 'Japanese Iced Coffee', '2019-09-24 08:04:39', '2019-09-24 08:04:39', '5adc6a0c-9245-4b6c-9e2c-f537d9284fe9', 'The best iced coffed ever.', '<p>japanese iced coffee</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 41, 1, 'Japanese Iced Coffee', '2019-09-24 09:17:19', '2019-09-24 09:17:19', 'accf42be-8a2d-4e90-9b6e-11adc5fffda3', 'The best iced coffed ever.', '<p>japanese iced coffee</p>', NULL, NULL, NULL, NULL, '2019-09-23 07:00:00', NULL, NULL),
(42, 42, 1, 'Perfect Espresso', '2019-09-24 09:17:30', '2019-09-24 09:17:30', '033ec1c1-494e-425c-96e6-85a600d23d4c', 'This is an introduction to the Espresso drink.', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', NULL, NULL, NULL, NULL, '2019-09-21 07:00:00', NULL, NULL),
(43, 43, 1, 'Locations', '2019-09-24 10:03:09', '2019-09-24 10:03:09', '72c00a02-f05c-4494-8a46-232751e00ffd', NULL, '<p>page copy</p>', NULL, NULL, 'Where We Are', 'This is the intro.', NULL, NULL, NULL),
(44, 44, 1, 'Kathmanadu, Nepal', '2019-09-24 10:04:52', '2019-09-24 10:04:52', 'c5f17e4e-79d9-40a2-a349-74375fa5935a', NULL, '<p>Page copy.</p>', NULL, NULL, 'Home of the momos.', 'Page intro', NULL, NULL, NULL),
(46, 50, 1, 'Perfect Espresso', '2019-09-24 11:21:44', '2019-09-25 08:05:52', 'c5e936cb-f019-4320-bbf3-d011e1c53ce4', NULL, NULL, NULL, NULL, NULL, 'This is the page intro!', NULL, '[{\"col1\":\"This is the first thing\"},{\"col1\":\"This is the second thing\"},{\"col1\":\"This is the third thing\"}]', NULL),
(47, 51, 1, 'Perfect Espresso', '2019-09-24 11:21:44', '2019-09-24 11:21:44', '874f7007-6a63-41b9-8340-6cd5d62d4d20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"This is the first thing\"},{\"col1\":\"This is the second thing\"},{\"col1\":\"This is the third thing\"}]', NULL),
(48, 52, 1, NULL, '2019-09-24 11:21:47', '2019-09-24 11:21:47', 'e044a594-fbb7-4714-b16c-ee77ae37a9a6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"\"}]', NULL),
(49, 64, 1, 'Perfect Espresso', '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'db6d4faa-e4d1-41bb-9d4d-df95e8dcdd8a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"This is the first thing\"},{\"col1\":\"This is the second thing\"},{\"col1\":\"This is the third thing\"}]', NULL),
(50, 76, 1, 'Perfect Espresso', '2019-09-24 11:42:04', '2019-09-24 11:42:04', 'a57e3f67-484b-4e68-9d2f-299dcc6bd670', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"This is the first thing\"},{\"col1\":\"This is the second thing\"},{\"col1\":\"This is the third thing\"}]', NULL),
(51, 88, 1, 'Perfect Espresso', '2019-09-24 11:43:00', '2019-09-24 11:43:00', 'a339a3d4-d9a9-4628-af1b-378551fe84e4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"This is the first thing\"},{\"col1\":\"This is the second thing\"},{\"col1\":\"This is the third thing\"}]', NULL),
(52, 100, 1, 'Perfect Espresso', '2019-09-24 11:44:57', '2019-09-24 11:44:57', 'f3cbdeff-7d90-4f72-8700-2432cae49537', NULL, NULL, NULL, NULL, NULL, 'This is the page intro!', NULL, '[{\"col1\":\"This is the first thing\"},{\"col1\":\"This is the second thing\"},{\"col1\":\"This is the third thing\"}]', NULL),
(54, 135, 1, 'Perfect Espresso', '2019-09-24 12:29:59', '2019-09-24 12:29:59', '1a8ee231-c085-46ec-99ea-218838c36000', NULL, NULL, NULL, NULL, NULL, 'This is the page intro!', NULL, '[{\"col1\":\"This is the first thing\"},{\"col1\":\"This is the second thing\"},{\"col1\":\"This is the third thing\"}]', NULL),
(55, 147, 1, 'Espresso', '2019-09-25 07:51:55', '2019-09-25 07:51:55', 'eb3980b0-165d-452a-9efe-9f108a7c0a01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'This is the style description'),
(56, 148, 1, 'Iced Coffee', '2019-09-25 08:02:58', '2019-09-25 08:02:58', '3eac7b91-4604-42ec-9b60-ab21d2b2a2dc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'The best way to drink coffee in the summer.'),
(57, 149, 1, 'Perfect Espresso', '2019-09-25 08:03:05', '2019-09-25 08:03:05', '5c7b8a2b-e3d4-4a5d-a5d8-310b66305d12', NULL, NULL, NULL, NULL, NULL, 'This is the page intro!', NULL, '[{\"col1\":\"This is the first thing\"},{\"col1\":\"This is the second thing\"},{\"col1\":\"This is the third thing\"}]', NULL),
(58, 161, 1, 'Perfect Espresso', '2019-09-25 08:05:52', '2019-09-25 08:05:52', '9cf9f4ae-769a-40e4-9d3b-3ebb13bc2777', NULL, NULL, NULL, NULL, NULL, 'This is the page intro!', NULL, '[{\"col1\":\"This is the first thing\"},{\"col1\":\"This is the second thing\"},{\"col1\":\"This is the third thing\"}]', NULL),
(59, 173, 1, 'Japanese Iced Coffee', '2019-09-25 08:23:51', '2019-09-25 08:23:51', '31195da8-de45-4fe4-a916-a7a887a42c0c', 'The best iced coffed ever.', '<p>japanese iced coffee</p>', NULL, NULL, NULL, NULL, '2019-09-23 07:00:00', NULL, NULL),
(60, 174, 1, 'Perfect Espresso', '2019-09-25 08:24:05', '2019-09-25 08:24:05', '32fa66ee-9ec0-4abc-bdea-debea2a0da7b', 'This is an introduction to the Espresso drink.', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', NULL, NULL, NULL, NULL, '2019-09-21 07:00:00', NULL, NULL),
(61, 175, 1, 'Perfect Espresso', '2019-09-25 08:53:25', '2019-09-25 08:53:25', '84c8dfa5-778a-4d71-97c7-d9e910a209ec', 'This is an introduction to the Espresso drink.', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', NULL, NULL, NULL, NULL, '2019-09-21 07:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deprecationerrors`
--

INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Field::isEmpty()', '/var/www/code/vendor/craftcms/cms/src/base/Element.php:1196', '2019-09-24 10:04:52', '/var/www/code/vendor/craftcms/cms/src/base/Element.php', 1196, 'Fields’ isEmpty() method has been deprecated. Use isValueEmpty() instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/base/Field.php\",\"line\":353,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"Field::isEmpty()\\\", \\\"Fields’ isEmpty() method has been deprecated. Use isValueEmpty()...\\\"\"},{\"objectClass\":\"craft\\\\ckeditor\\\\Field\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/base/Element.php\",\"line\":1196,\"class\":\"craft\\\\base\\\\Field\",\"method\":\"isValueEmpty\",\"args\":\"Twig\\\\Markup, craft\\\\elements\\\\Entry\"},{\"objectClass\":\"craft\\\\elements\\\\Entry\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/base/Element.php\",\"line\":926,\"class\":\"craft\\\\base\\\\Element\",\"method\":\"isFieldEmpty\",\"args\":\"\\\"pageCopy\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\Entry\",\"file\":null,\"line\":null,\"class\":\"craft\\\\base\\\\Element\",\"method\":\"__call\",\"args\":\"\\\"isFieldEmpty:pageCopy\\\", [Twig\\\\Markup]\"},{\"objectClass\":null,\"file\":\"/var/www/code/vendor/yiisoft/yii2/validators/Validator.php\",\"line\":466,\"class\":null,\"method\":\"call_user_func\",\"args\":\"[craft\\\\elements\\\\Entry, \\\"isFieldEmpty:pageCopy\\\"], Twig\\\\Markup\"},{\"objectClass\":\"yii\\\\validators\\\\RequiredValidator\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/validators/RequiredValidator.php\",\"line\":71,\"class\":\"yii\\\\validators\\\\Validator\",\"method\":\"isEmpty\",\"args\":\"Twig\\\\Markup\"},{\"objectClass\":\"yii\\\\validators\\\\RequiredValidator\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/validators/Validator.php\",\"line\":303,\"class\":\"yii\\\\validators\\\\RequiredValidator\",\"method\":\"validateValue\",\"args\":\"Twig\\\\Markup\"},{\"objectClass\":\"yii\\\\validators\\\\RequiredValidator\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/validators/Validator.php\",\"line\":257,\"class\":\"yii\\\\validators\\\\Validator\",\"method\":\"validateAttribute\",\"args\":\"craft\\\\elements\\\\Entry, \\\"field:pageCopy\\\"\"},{\"objectClass\":\"yii\\\\validators\\\\RequiredValidator\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Model.php\",\"line\":367,\"class\":\"yii\\\\validators\\\\Validator\",\"method\":\"validateAttributes\",\"args\":\"craft\\\\elements\\\\Entry, [\\\"field:pageCopy\\\"]\"},{\"objectClass\":\"craft\\\\elements\\\\Entry\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/services/Elements.php\",\"line\":1866,\"class\":\"yii\\\\base\\\\Model\",\"method\":\"validate\",\"args\":null},{\"objectClass\":\"craft\\\\services\\\\Elements\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/services/Elements.php\",\"line\":488,\"class\":\"craft\\\\services\\\\Elements\",\"method\":\"_saveElementInternal\",\"args\":\"craft\\\\elements\\\\Entry, true, false\"},{\"objectClass\":\"craft\\\\services\\\\Elements\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/controllers/EntriesController.php\",\"line\":378,\"class\":\"craft\\\\services\\\\Elements\",\"method\":\"saveElement\",\"args\":\"craft\\\\elements\\\\Entry\"},{\"objectClass\":\"craft\\\\controllers\\\\EntriesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\EntriesController\",\"method\":\"actionSaveEntry\",\"args\":\"false\"},{\"objectClass\":null,\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\EntriesController, \\\"actionSaveEntry\\\"], [false]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[]\"},{\"objectClass\":\"craft\\\\controllers\\\\EntriesController\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"save-entry\\\", []\"},{\"objectClass\":\"craft\\\\controllers\\\\EntriesController\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"save-entry\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"entries/save-entry\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":566,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"entries/save-entry\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":278,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"_processActionRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-09-24 10:04:52', '2019-09-24 10:04:52', 'd6199620-91a0-4d87-ad4c-d4a50cb090d6'),
(4, 'ElementQuery::getIterator()', '/var/www/code/templates/recipes/_entry.twig:28', '2019-09-25 09:22:21', '/var/www/code/templates/recipes/_entry.twig', 28, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":573,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/33/3339e79b1c875eae751eb6c4e0af6bd7caec206614f9b3fce3b6cc16a9674b1e.php\",\"line\":109,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582\",\"method\":\"block_main\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/c8/c8a70220b794d1621bcefb5c5db7936fcac0e503a5790bf2921a4e0fe025f7b8.php\",\"line\":84,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"main\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/33/3339e79b1c875eae751eb6c4e0af6bd7caec206614f9b3fce3b6cc16a9674b1e.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582\",\"file\":\"/var/www/code/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/var/www/code/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"recipes/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"recipes/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"recipes/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"recipes/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"recipes/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"recipes/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"recipes/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"recipes/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"recipes/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"recipes/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"recipes/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-09-25 09:22:21', '2019-09-25 09:22:21', 'a057fc77-1de8-4c4a-8d53-a12f6949eab9'),
(5, 'ElementQuery::getIterator()', '/var/www/code/templates/styles/_category.twig:23', '2019-09-25 09:29:24', '/var/www/code/templates/styles/_category.twig', 23, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":573,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/b4/b4daffc8ca97bd8a743ce92623748be528e1cdaa473dd9344e750954bb99fd42.php\",\"line\":86,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_3a38800cba6c63cba2afc457abe8096789fd63e2ae98535f30a5dd55dc553fac\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_3a38800cba6c63cba2afc457abe8096789fd63e2ae98535f30a5dd55dc553fac\",\"method\":\"block_main\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_3a38800cba6c63cba2afc457abe8096789fd63e2ae98535f30a5dd55dc553fac, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/c8/c8a70220b794d1621bcefb5c5db7936fcac0e503a5790bf2921a4e0fe025f7b8.php\",\"line\":84,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"main\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_3a38800cba6c63cba2afc457abe8096789fd63e2ae98535f30a5dd55dc553fac, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"method\":\"doDisplay\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_3a38800cba6c63cba2afc457abe8096789fd63e2ae98535f30a5dd55dc553fac, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_3a38800cba6c63cba2afc457abe8096789fd63e2ae98535f30a5dd55dc553fac, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/b4/b4daffc8ca97bd8a743ce92623748be528e1cdaa473dd9344e750954bb99fd42.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_3a38800cba6c63cba2afc457abe8096789fd63e2ae98535f30a5dd55dc553fac, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_3a38800cba6c63cba2afc457abe8096789fd63e2ae98535f30a5dd55dc553fac\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_3a38800cba6c63cba2afc457abe8096789fd63e2ae98535f30a5dd55dc553fac\",\"method\":\"doDisplay\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_3a38800cba6c63cba2afc457abe8096789fd63e2ae98535f30a5dd55dc553fac, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_3a38800cba6c63cba2afc457abe8096789fd63e2ae98535f30a5dd55dc553fac\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_3a38800cba6c63cba2afc457abe8096789fd63e2ae98535f30a5dd55dc553fac, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_3a38800cba6c63cba2afc457abe8096789fd63e2ae98535f30a5dd55dc553fac\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"__TwigTemplate_3a38800cba6c63cba2afc457abe8096789fd63e2ae98535f30a5dd55dc553fac\",\"file\":\"/var/www/code/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/var/www/code/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"styles/_category\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"styles/_category\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"styles/_category\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"styles/_category\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"styles/_category\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":null,\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"styles/_category\\\", [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"styles/_category\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"styles/_category\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"styles/_category\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"styles/_category\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"styles/_category\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-09-25 09:29:24', '2019-09-25 09:29:24', '3bee1889-ee34-48b2-a52a-76a99b45c9d3'),
(12, 'ElementQuery::getIterator()', '/var/www/code/templates/drinks/styles.twig:22', '2019-09-25 08:44:09', '/var/www/code/templates/drinks/styles.twig', 22, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":573,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\CategoryQuery\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/10/102e0362423fd5cca99bbb6715f29099c3abfd8d1ad695fecc2daae77b15c174.php\",\"line\":79,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe\",\"method\":\"block_main\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/c8/c8a70220b794d1621bcefb5c5db7936fcac0e503a5790bf2921a4e0fe025f7b8.php\",\"line\":84,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"main\\\", [\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"method\":\"doDisplay\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/10/102e0362423fd5cca99bbb6715f29099c3abfd8d1ad695fecc2daae77b15c174.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe\",\"method\":\"doDisplay\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[]\"},{\"objectClass\":\"__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe\",\"file\":\"/var/www/code/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/var/www/code/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"drinks/styles\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"drinks/styles\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"drinks/styles\\\", []\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"drinks/styles\\\", []\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"drinks/styles\\\", []\"},{\"objectClass\":null,\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"drinks/styles\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"drinks/styles\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"drinks/styles\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"drinks/styles\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"drinks/styles\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"drinks/styles\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-09-25 08:44:09', '2019-09-25 08:44:09', 'dabb4c9c-f42f-405a-abcb-101fe2b666bf');

-- --------------------------------------------------------

--
-- Table structure for table `drafts`
--

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drafts`
--

INSERT INTO `drafts` (`id`, `sourceId`, `creatorId`, `name`, `notes`) VALUES
(1, NULL, 1, 'First draft', NULL),
(4, NULL, 1, 'First draft', NULL),
(6, NULL, 1, 'First draft', NULL),
(7, NULL, 1, 'First draft', NULL),
(9, NULL, 1, 'First draft', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `elementindexsettings`
--

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2019-09-23 05:24:42', '2019-09-24 08:23:04', NULL, '95d85a9b-fe50-441a-90d9-0419b7caf6ba'),
(2, 1, NULL, NULL, 'craft\\elements\\Entry', 1, 0, '2019-09-23 09:00:23', '2019-09-23 09:00:23', NULL, '76778431-da55-45a3-a6a2-ef36fa81b043'),
(4, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2019-09-23 09:14:35', '2019-09-25 08:53:25', NULL, '6d7da6fe-a63a-43ad-986f-bb0b5e1483e2'),
(5, NULL, 1, 1, 'craft\\elements\\Entry', 1, 0, '2019-09-23 09:14:35', '2019-09-23 09:14:35', NULL, '1cb3058b-b34d-4669-83bd-e65143af7908'),
(7, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2019-09-23 09:22:06', '2019-09-23 09:25:39', NULL, '3fcbd7fd-449b-4b19-b604-81ebae5335d5'),
(8, NULL, 2, 2, 'craft\\elements\\Entry', 1, 0, '2019-09-23 09:22:06', '2019-09-23 09:22:06', NULL, '3d9ee004-3cfb-4d67-9bca-65f5d27f7713'),
(9, NULL, 3, 2, 'craft\\elements\\Entry', 1, 0, '2019-09-23 09:22:12', '2019-09-23 09:22:12', NULL, '89ff1404-fafe-4d3d-9263-585f46c62197'),
(10, NULL, 4, 2, 'craft\\elements\\Entry', 1, 0, '2019-09-23 09:24:31', '2019-09-23 09:24:31', NULL, '8fc410dd-7314-4044-9bec-e8b7a864168f'),
(11, NULL, 5, 2, 'craft\\elements\\Entry', 1, 0, '2019-09-23 09:25:39', '2019-09-23 09:25:39', NULL, '2a540e6a-bf3b-4533-a024-75a56d113463'),
(12, 4, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2019-09-23 09:27:27', '2019-09-23 09:27:27', NULL, '8e67dc84-e3a0-479b-8402-1d13ddd9b3b2'),
(13, NULL, NULL, NULL, 'craft\\elements\\Entry', 1, 0, '2019-09-23 09:44:03', '2019-09-23 09:44:03', NULL, 'd6de00df-eaeb-42c1-a864-c4e14dd99a01'),
(15, NULL, NULL, NULL, 'craft\\elements\\Asset', 1, 0, '2019-09-23 10:24:25', '2019-09-23 10:24:35', NULL, '0a3dbc1f-a931-4be6-8ae5-1f7f8646e183'),
(16, NULL, 6, 1, 'craft\\elements\\Entry', 1, 0, '2019-09-23 10:25:39', '2019-09-23 10:25:39', NULL, '8f07482e-6d68-4eb4-822f-61195cd658fb'),
(17, NULL, 7, 1, 'craft\\elements\\Entry', 1, 0, '2019-09-23 10:26:17', '2019-09-23 10:26:17', NULL, '7c7e82d5-0195-47da-b96e-17901c2cc350'),
(18, NULL, 8, 1, 'craft\\elements\\Entry', 1, 0, '2019-09-23 10:26:32', '2019-09-23 10:26:32', NULL, '822ecf72-6d0d-4d79-8500-2b2144604053'),
(20, NULL, NULL, 3, 'craft\\elements\\Entry', 1, 0, '2019-09-23 10:58:06', '2019-09-23 11:17:32', NULL, '42448a52-bf97-4ad7-9498-64b5d344d07e'),
(21, NULL, 9, NULL, 'craft\\elements\\Entry', 1, 0, '2019-09-23 10:58:06', '2019-09-23 10:58:06', NULL, '02d59e7e-9b39-42d1-86f4-98d88168f3ed'),
(23, NULL, NULL, 3, 'craft\\elements\\Entry', 1, 0, '2019-09-23 10:58:19', '2019-09-24 10:03:09', NULL, 'ae253811-0403-4aff-9e63-3a8e2690dc41'),
(24, NULL, 10, NULL, 'craft\\elements\\Entry', 1, 0, '2019-09-23 10:58:19', '2019-09-23 10:58:19', NULL, '04ef714b-1de7-4152-96c6-eba7380ba58b'),
(26, NULL, NULL, 3, 'craft\\elements\\Entry', 1, 0, '2019-09-23 10:58:51', '2019-09-24 10:04:52', NULL, '8dd1b4a7-d916-4052-9b46-8504faae4f0d'),
(27, NULL, 11, NULL, 'craft\\elements\\Entry', 1, 0, '2019-09-23 10:58:51', '2019-09-23 10:58:51', NULL, '6bb0078f-4885-49d8-ad4e-904c93d95ee9'),
(29, NULL, 12, NULL, 'craft\\elements\\Entry', 1, 0, '2019-09-23 10:59:51', '2019-09-23 10:59:51', NULL, '8f7dcd5b-eb8a-46ed-b1ae-68f40f4de8db'),
(31, NULL, NULL, 3, 'craft\\elements\\Entry', 1, 0, '2019-09-23 11:07:02', '2019-09-23 11:07:02', NULL, '6fe865a4-9e12-43fe-8e2f-66bdeca137a1'),
(32, NULL, 13, NULL, 'craft\\elements\\Entry', 1, 0, '2019-09-23 11:07:02', '2019-09-23 11:07:02', NULL, '3c7ae77c-935f-4ee8-981b-1aa02b6ec6ef'),
(33, NULL, 14, 3, 'craft\\elements\\Entry', 1, 0, '2019-09-23 11:17:32', '2019-09-23 11:17:32', NULL, 'c1609baf-194d-4261-881c-263ff4e577cd'),
(35, NULL, NULL, NULL, 'craft\\elements\\Asset', 1, 0, '2019-09-24 05:04:33', '2019-09-24 05:04:37', NULL, '94767026-78cb-44f8-a0eb-1561d2688e41'),
(36, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2019-09-24 05:04:48', '2019-09-25 08:23:51', NULL, '5eaaad93-1c08-4f12-ab9d-e7b77cad5a6f'),
(37, NULL, 15, 1, 'craft\\elements\\Entry', 1, 0, '2019-09-24 05:04:48', '2019-09-24 05:04:48', NULL, '305c832f-b98a-4414-ba4d-20f47b57597d'),
(38, 6, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2019-09-24 07:51:50', '2019-09-24 07:51:50', NULL, '1825a0b8-3651-4d0c-8fba-6c881244f502'),
(39, 7, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2019-09-24 07:53:33', '2019-09-24 07:53:33', NULL, '01bc9762-ff49-406f-8dae-89b29fd0ed8f'),
(40, NULL, 16, 1, 'craft\\elements\\Entry', 1, 0, '2019-09-24 08:04:39', '2019-09-24 08:04:39', NULL, '97fc0ee4-c697-4945-8a8d-b0e928be53a8'),
(41, NULL, 17, 1, 'craft\\elements\\Entry', 1, 0, '2019-09-24 09:17:19', '2019-09-24 09:17:19', NULL, 'fe4b107c-a90c-444d-b23b-f424439562f2'),
(42, NULL, 18, 1, 'craft\\elements\\Entry', 1, 0, '2019-09-24 09:17:30', '2019-09-24 09:17:30', NULL, 'f6daf13a-d46a-4474-a518-d19c86ba42c7'),
(43, NULL, 19, 3, 'craft\\elements\\Entry', 1, 0, '2019-09-24 10:03:09', '2019-09-24 10:03:09', NULL, 'c4541deb-a02c-4f85-a078-d296ccac19cd'),
(44, NULL, 20, 3, 'craft\\elements\\Entry', 1, 0, '2019-09-24 10:04:52', '2019-09-24 10:04:52', NULL, 'f60a661b-7c38-4264-a6ce-b78c1b778a41'),
(46, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:11:19', '2019-09-24 11:11:19', '2019-09-24 11:11:23', '4225bc5b-f1c5-4899-9786-fdeb12b03e13'),
(47, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:11:23', '2019-09-24 11:11:23', '2019-09-24 11:11:32', '2743c923-4bab-4129-866d-44a898397a32'),
(48, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:11:23', '2019-09-24 11:11:23', '2019-09-24 11:11:32', 'ddbda68b-b913-41fe-b6dd-f79f3bafacfe'),
(49, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:11:32', '2019-09-24 11:11:32', '2019-09-24 11:11:34', '959ed7c1-91b4-4da2-b57c-0b8c96f7e376'),
(50, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2019-09-24 11:21:44', '2019-09-25 08:05:52', NULL, '96c6b283-6461-4565-b7ec-e82f5b255d93'),
(51, NULL, 21, 9, 'craft\\elements\\Entry', 1, 0, '2019-09-24 11:21:44', '2019-09-24 11:21:44', NULL, '1b2ed6dc-82d5-4a8a-b0f8-4e3a2b4481c1'),
(52, 9, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2019-09-24 11:21:46', '2019-09-24 11:21:46', NULL, '0178890f-67c3-4a47-b3e1-7957077a8a05'),
(53, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:44:57', '2019-09-24 12:29:59', 'f033e565-06f5-4905-b62d-0d2ede8017ee'),
(54, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:44:57', '2019-09-24 12:29:59', 'cb18d849-2044-40d8-8074-2a625cf63cd1'),
(55, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:44:57', '2019-09-24 12:29:59', '7526efd3-4026-4894-88f8-415e88f21d03'),
(56, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:44:57', '2019-09-24 12:29:59', '16a71628-a167-4977-a29a-97b0cad5af68'),
(57, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:44:57', '2019-09-24 12:29:59', 'e1de009f-977f-4d53-ba22-daf1c86a21e7'),
(58, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:44:57', '2019-09-24 12:29:59', '26e7b586-0c6d-42d3-80f6-0dfed7c384f7'),
(59, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:44:57', '2019-09-24 12:29:59', 'e694bbe7-9090-40f2-99e2-8483d015bb39'),
(60, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:44:57', '2019-09-24 12:29:59', 'dcea61a8-5e91-49ec-9935-e9a4c2f10de1'),
(61, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:44:57', '2019-09-24 12:29:59', '98fd3fa1-fa40-4a35-862c-4e350e2eeefe'),
(62, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:44:57', '2019-09-24 12:29:59', 'fd888362-cf05-4e31-8eb3-5740f5e4fdcc'),
(63, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:44:57', '2019-09-24 12:29:59', '877fa573-29ad-4af8-8dc6-19aa1e267be4'),
(64, NULL, 22, 9, 'craft\\elements\\Entry', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', NULL, '23b7552a-e032-49f5-837f-ad2a091ac711'),
(65, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', NULL, 'e49c2623-4479-4817-810e-9717e35cb5f0'),
(66, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', NULL, '88423d36-c3f7-476e-859b-9ed7818199a5'),
(67, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', NULL, '79ec4ce8-4084-45b6-ad81-6d0286c906cf'),
(68, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', NULL, 'bcd6679d-17f9-4cf7-a275-92ed9a5cc0ef'),
(69, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', NULL, '54276a49-5e60-4aff-83f6-0cb0b7940200'),
(70, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', NULL, 'f1ce0acf-8114-4bc6-bfa0-0b2783e448ab'),
(71, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', NULL, '949aac88-c3ca-4067-b45f-19a0833bddfb'),
(72, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', NULL, '16ba8b02-f78c-473c-9ccd-34670225bb96'),
(73, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', NULL, 'a2994499-07fa-4631-a77f-dd62b3a8c8f0'),
(74, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', NULL, '45437ccd-cefa-44f6-bc55-3471f725c75d'),
(75, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', NULL, 'd8d90593-7023-4dea-9d53-22bde3678778'),
(76, NULL, 23, 9, 'craft\\elements\\Entry', 1, 0, '2019-09-24 11:42:03', '2019-09-24 11:42:03', NULL, '69415c0c-20a0-4ca2-8f0d-5234e388fa37'),
(77, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:42:04', '2019-09-24 11:42:03', NULL, '38cd2857-5e96-46ec-b9c1-1b8667da9b3e'),
(78, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:42:04', '2019-09-24 11:42:03', NULL, 'c5278b49-b61e-48f2-afe4-1fa2ed383592'),
(79, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:42:04', '2019-09-24 11:42:03', NULL, '9e31aaaf-2932-4441-872c-671d43c060ce'),
(80, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:42:04', '2019-09-24 11:42:03', NULL, '14905920-c3e1-42f5-a8e3-2cd6467e4fab'),
(81, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:42:04', '2019-09-24 11:42:03', NULL, 'ba06dffb-dcd3-4408-8350-cad4f94b5749'),
(82, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:42:04', '2019-09-24 11:42:03', NULL, 'a581feec-8128-4fb3-aa35-9014c18e1445'),
(83, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:42:04', '2019-09-24 11:42:03', NULL, '3d4246d4-127f-45dc-a3aa-d518bd9582dc'),
(84, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:42:04', '2019-09-24 11:42:03', NULL, '831e84db-4a50-4777-afa0-f1b2366c2d8d'),
(85, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:42:04', '2019-09-24 11:42:03', NULL, '7582277d-48bb-49f2-b7c6-cc8cff5e0787'),
(86, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:42:04', '2019-09-24 11:42:03', NULL, 'f3898377-29ee-4de9-aa5b-8541944da9b5'),
(87, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:42:04', '2019-09-24 11:42:03', NULL, 'f716ab5f-8b75-47f2-bd25-b3623afa231f'),
(88, NULL, 24, 9, 'craft\\elements\\Entry', 1, 0, '2019-09-24 11:42:59', '2019-09-24 11:42:59', NULL, 'bffaa0ed-f805-4b0a-9c3d-caa0d45722ec'),
(89, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:43:00', '2019-09-24 11:42:59', NULL, 'daa00619-c880-40d8-8c1c-4acfdcd59add'),
(90, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:43:00', '2019-09-24 11:42:59', NULL, '09341146-b58f-4b45-8f89-b4aaf6919a90'),
(91, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:43:00', '2019-09-24 11:42:59', NULL, '425ae66c-5ecf-47c1-a53c-96f12003b2c8'),
(92, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:43:00', '2019-09-24 11:43:00', NULL, '806dc07f-1442-4cad-ac26-dba5aa79099a'),
(93, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:43:00', '2019-09-24 11:43:00', NULL, '3d35f0a0-782f-44e9-b4f0-38dcc69d5b6e'),
(94, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:43:00', '2019-09-24 11:43:00', NULL, '0dc4c55e-1b4e-426b-b513-53f569c2ae4f'),
(95, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:43:00', '2019-09-24 11:43:00', NULL, 'dc987011-35e7-4f68-b472-f42101b30fd6'),
(96, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:43:00', '2019-09-24 11:43:00', NULL, 'c245e14b-0b39-4620-8393-9ae26f154e91'),
(97, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:43:00', '2019-09-24 11:43:00', NULL, '10743196-2e75-4419-846f-f43043338402'),
(98, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:43:00', '2019-09-24 11:43:00', NULL, '46fc4c83-a9d0-45aa-818c-83e5ffc54d69'),
(99, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:43:00', '2019-09-24 11:43:00', NULL, '4db9e006-0a60-405c-8e01-52785214f3bc'),
(100, NULL, 25, 9, 'craft\\elements\\Entry', 1, 0, '2019-09-24 11:44:57', '2019-09-24 11:44:57', NULL, 'c9faec63-59d4-4dca-91b5-ffc5f5f05827'),
(101, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:44:57', '2019-09-24 11:44:57', NULL, '36118e46-2f12-4050-abdc-05ccbc499e22'),
(102, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:44:57', '2019-09-24 11:44:57', NULL, '9a8f1362-7917-4451-8ab8-385eae8dc014'),
(103, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:44:57', '2019-09-24 11:44:57', NULL, 'ae7033f5-f5da-4776-aa31-22bd789e820b'),
(104, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:44:57', '2019-09-24 11:44:57', NULL, '980ef5ae-f3fa-41db-8d79-d13519a71233'),
(105, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:44:57', '2019-09-24 11:44:57', NULL, 'd77398b6-41c2-4f0a-aa9b-b86bba59e6ae'),
(106, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:44:57', '2019-09-24 11:44:57', NULL, '9b4aa82b-0415-44e8-a6fb-adac5597422b'),
(107, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:44:57', '2019-09-24 11:44:57', NULL, 'fb6db80e-38b7-458d-a0dd-293d37e5d6a9'),
(108, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:44:57', '2019-09-24 11:44:57', NULL, 'b59d0c47-45fd-4051-b115-80c92f351c1b'),
(109, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:44:57', '2019-09-24 11:44:57', NULL, '31fcfffb-de54-4d53-8cb7-d3daa3d64680'),
(110, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:44:57', '2019-09-24 11:44:57', NULL, 'b84d7c43-04e8-4041-812c-dabf87c594fe'),
(111, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 11:44:57', '2019-09-24 11:44:57', NULL, '3d44fe4d-df67-4075-a5b0-33603e614b84'),
(124, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:29:59', '2019-09-25 08:05:52', NULL, '0c261f80-2d8b-438e-808d-b1c37224d505'),
(125, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:29:59', '2019-09-25 08:05:52', NULL, '667583ea-9b8f-4083-b163-0316271bff68'),
(126, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:29:59', '2019-09-25 08:05:52', NULL, '7bbd69fe-0d88-4bf3-a1b2-795869279fa4'),
(127, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:29:59', '2019-09-25 08:05:52', NULL, 'd604e6ae-cf2f-4153-89cb-722aba961834'),
(128, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:29:59', '2019-09-25 08:05:52', NULL, '4cd94564-ffc9-42bc-9e77-1dd301104c0b'),
(129, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:29:59', '2019-09-25 08:05:52', NULL, '301d522f-0ece-4173-a51c-e7ffb5a812f2'),
(130, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:29:59', '2019-09-25 08:05:52', NULL, 'bc328af9-a822-46ba-9477-1169ef7db787'),
(131, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:29:59', '2019-09-25 08:05:52', NULL, '7ab26dda-7e82-40fd-9c63-66ea5e74c4b7'),
(132, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:29:59', '2019-09-25 08:05:52', NULL, 'b8153af2-701f-4f5e-870d-232339cf36fa'),
(133, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:29:59', '2019-09-25 08:05:52', NULL, 'bdb0961e-e556-4909-97ad-d9b2a22f0fa2'),
(134, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:29:59', '2019-09-25 08:05:52', NULL, '4b247a5d-56da-44d9-9c45-df80ad22db8e'),
(135, NULL, 26, 9, 'craft\\elements\\Entry', 1, 0, '2019-09-24 12:29:59', '2019-09-24 12:29:59', NULL, '4c51d7f3-d71e-41db-ac5a-88764c629d80'),
(136, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:29:59', '2019-09-24 12:29:59', NULL, '2e07ba8c-834a-4c81-a8fa-f6b627324673'),
(137, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:29:59', '2019-09-24 12:29:59', NULL, '42fc84f6-8c00-41b8-9fb6-42fec37e0974'),
(138, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:29:59', '2019-09-24 12:29:59', NULL, '8680896f-3e46-46df-8197-0392d9bc87f2'),
(139, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:29:59', '2019-09-24 12:29:59', NULL, 'dacbdecd-7973-48ff-81ad-f82588b07ccc'),
(140, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:29:59', '2019-09-24 12:29:59', NULL, '470fb550-0980-4f25-aad3-9587bf751116'),
(141, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:29:59', '2019-09-24 12:29:59', NULL, '3efdbade-6a85-4687-8be5-0846c3d85e99'),
(142, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:29:59', '2019-09-24 12:29:59', NULL, '3dfde6ac-5a94-4f13-b4ba-8c0ced7dc3e1'),
(143, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:30:00', '2019-09-24 12:29:59', NULL, '0f9f4a54-b746-439d-998e-5f136b4d00fc'),
(144, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:30:00', '2019-09-24 12:29:59', NULL, '7688d6a3-d241-4f9d-a8fa-f86e6ce7ef23'),
(145, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:30:00', '2019-09-24 12:29:59', NULL, '843e6dbb-b0d9-4aea-8876-1bbca68bb527'),
(146, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-24 12:30:00', '2019-09-24 12:29:59', NULL, '86f3a615-2258-466e-a4ff-5adc59aeeb95'),
(147, NULL, NULL, 10, 'craft\\elements\\Category', 1, 0, '2019-09-25 07:51:55', '2019-09-25 07:51:55', NULL, '69cdf28a-c7f5-4415-99d8-1837ea119a66'),
(148, NULL, NULL, 10, 'craft\\elements\\Category', 1, 0, '2019-09-25 08:02:58', '2019-09-25 08:02:58', NULL, '61c550db-93a4-458c-89fb-ec1bac703de9'),
(149, NULL, 27, 9, 'craft\\elements\\Entry', 1, 0, '2019-09-25 08:03:05', '2019-09-25 08:03:05', NULL, 'a2ba854f-e596-4147-ab66-770be5d53332'),
(150, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:03:05', '2019-09-25 08:03:05', NULL, '3471e2c7-8b1a-4090-a92c-9c78bf148025'),
(151, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:03:05', '2019-09-25 08:03:05', NULL, 'eeba9507-ef1a-47b7-a4e8-d55677854814'),
(152, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:03:05', '2019-09-25 08:03:05', NULL, 'ed1ce32e-7f22-4f09-99a4-7eeda3426365'),
(153, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:03:05', '2019-09-25 08:03:05', NULL, 'b66e01c5-7975-4607-b14e-bba0d1763cca'),
(154, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:03:05', '2019-09-25 08:03:05', NULL, 'ba6919c9-6531-4b60-9854-8ea275890cd1'),
(155, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:03:05', '2019-09-25 08:03:05', NULL, '6b556116-243c-4113-9465-a251586843dd'),
(156, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:03:05', '2019-09-25 08:03:05', NULL, 'f0a505a9-a423-496b-88b1-9a5cb86aa37d'),
(157, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:03:05', '2019-09-25 08:03:05', NULL, '176186df-d5ee-4d1c-b74e-c659b69bde0e'),
(158, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:03:05', '2019-09-25 08:03:05', NULL, '5f4212dd-183d-47fb-aebb-08deccf0ede1'),
(159, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:03:05', '2019-09-25 08:03:05', NULL, 'd6586715-80e6-463a-8750-30a4b716a070'),
(160, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:03:05', '2019-09-25 08:03:05', NULL, '12f88fae-e158-46ed-8d1f-1497be4ab560'),
(161, NULL, 28, 9, 'craft\\elements\\Entry', 1, 0, '2019-09-25 08:05:52', '2019-09-25 08:05:52', NULL, '78d4bc9d-ebda-49c0-830c-2494cf8d272f'),
(162, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:05:52', '2019-09-25 08:05:52', NULL, '8bb1c2d3-5ce0-478e-9dc9-e59745794a46'),
(163, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:05:52', '2019-09-25 08:05:52', NULL, '36e7e8ba-22e6-48a8-94e5-dafb66e5d69e'),
(164, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:05:52', '2019-09-25 08:05:52', NULL, '204ba369-8c07-4d95-a6a2-ea3ef899a60b'),
(165, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:05:52', '2019-09-25 08:05:52', NULL, '090343ba-1772-43a9-adf2-9766c3040cd3'),
(166, NULL, NULL, 4, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:05:52', '2019-09-25 08:05:52', NULL, 'e3446eb8-2165-4c6d-8432-292ad714f3d3'),
(167, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:05:52', '2019-09-25 08:05:52', NULL, '7164fdd0-d4fa-491a-8715-f2d4f6145c30'),
(168, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:05:52', '2019-09-25 08:05:52', NULL, '3627ca2a-6303-4515-a068-c11a385d319b'),
(169, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:05:52', '2019-09-25 08:05:52', NULL, 'f87cf7a7-2187-4ff8-8605-705140e9c9a3'),
(170, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:05:52', '2019-09-25 08:05:52', NULL, '3b616d28-2963-4160-b6c6-3cbebf3f5ad2'),
(171, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:05:52', '2019-09-25 08:05:52', NULL, 'bf5cefbd-26bd-44b5-9a80-023646f5f858'),
(172, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-09-25 08:05:52', '2019-09-25 08:05:52', NULL, 'ec1a8ec9-d8bf-4e86-b9a2-68208a87b9fd'),
(173, NULL, 29, 1, 'craft\\elements\\Entry', 1, 0, '2019-09-25 08:23:51', '2019-09-25 08:23:51', NULL, '13d20af1-4acd-46d1-bbeb-9c042f980b78'),
(174, NULL, 30, 1, 'craft\\elements\\Entry', 1, 0, '2019-09-25 08:24:05', '2019-09-25 08:24:05', NULL, '1d61b25b-4af1-4234-ad35-f2fde8a23bd0'),
(175, NULL, 31, 1, 'craft\\elements\\Entry', 1, 0, '2019-09-25 08:53:25', '2019-09-25 08:53:25', NULL, '6c7f3101-0532-4a35-89e2-f32e1024e136');

-- --------------------------------------------------------

--
-- Table structure for table `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2019-09-23 05:24:42', '2019-09-23 05:24:42', '267ef5e0-d518-4145-8b2b-aad70056acb2'),
(2, 2, 1, '__temp_3qzMZIm7R1FbBvEzCcWyZ86iP1j7VPcboGOV', 'drinks/__temp_3qzMZIm7R1FbBvEzCcWyZ86iP1j7VPcboGOV', 1, '2019-09-23 09:00:23', '2019-09-23 09:00:23', '675104ab-1b9d-46c4-94a5-1318a9dabe83'),
(4, 4, 1, 'perfect-espresso', 'drinks/perfect-espresso', 1, '2019-09-23 09:14:35', '2019-09-23 09:14:35', '13d2306c-240b-4fa5-813d-870f2fd44872'),
(5, 5, 1, 'perfect-espresso', 'drinks/perfect-espresso', 1, '2019-09-23 09:14:35', '2019-09-23 09:14:35', '210439a2-1c58-43c8-b735-51fa7c94c574'),
(7, 7, 1, 'my-first-news', 'news/my-first-news', 1, '2019-09-23 09:22:06', '2019-09-23 09:22:06', 'e0b91b4d-a127-47fb-a451-78c5dad146d5'),
(8, 8, 1, 'my-first-news', 'news/my-first-news', 1, '2019-09-23 09:22:07', '2019-09-23 09:22:07', '4468bef1-3e93-404c-b9fe-d263c68f19e0'),
(9, 9, 1, 'my-first-news', 'news/my-first-news', 1, '2019-09-23 09:22:12', '2019-09-23 09:22:12', 'fee2979d-3a99-41e5-b438-b8755b9d0174'),
(10, 10, 1, 'my-first-news', 'news/my-first-news', 1, '2019-09-23 09:24:31', '2019-09-23 09:24:31', '2cd7b362-0b6e-454f-b143-e23366daaa0c'),
(11, 11, 1, 'my-first-news', 'news/my-first-news', 1, '2019-09-23 09:25:39', '2019-09-23 09:25:39', '9eb6724b-4963-4bdd-b1f0-eb5427b3a5db'),
(12, 12, 1, '__temp_ln3Bk3MsKS3EKA1by1hSfpzSOi6bmpDBNrLd', 'news/__temp_ln3Bk3MsKS3EKA1by1hSfpzSOi6bmpDBNrLd', 1, '2019-09-23 09:27:27', '2019-09-23 09:27:27', 'ed319412-8722-478f-abc6-e61a9ef518d1'),
(13, 13, 1, 'homepage', '__home__', 1, '2019-09-23 09:44:03', '2019-09-23 09:44:03', 'b8377665-6f65-4ae8-8aa3-481ac673d870'),
(15, 15, 1, NULL, NULL, 1, '2019-09-23 10:24:25', '2019-09-23 10:24:25', '0bf35e71-d7a0-4b84-9602-ffe47a7f5184'),
(16, 16, 1, 'perfect-espresso', 'drinks/perfect-espresso', 1, '2019-09-23 10:25:39', '2019-09-23 10:25:39', '5aaa4063-994b-4093-8255-45cf41b8f67f'),
(17, 17, 1, 'perfect-espresso', 'drinks/perfect-espresso', 1, '2019-09-23 10:26:17', '2019-09-23 10:26:17', '9956f3dd-b179-4977-8c4e-dacf0254eb1c'),
(18, 18, 1, 'perfect-espresso', 'drinks/perfect-espresso', 1, '2019-09-23 10:26:32', '2019-09-23 10:26:32', 'b4a9561a-9474-4517-b9d5-553e34c06b12'),
(20, 20, 1, 'about', 'about', 1, '2019-09-23 10:58:06', '2019-09-23 11:04:36', '53b26394-291b-435c-9c74-e20bc6911a38'),
(21, 21, 1, 'about-crafty-coffee', 'about/about-crafty-coffee', 1, '2019-09-23 10:58:06', '2019-09-23 10:58:06', '032e0d73-44fa-46b7-9aca-e9156f070dec'),
(23, 23, 1, 'locations', 'about/locations', 1, '2019-09-23 10:58:19', '2019-09-23 11:17:33', 'd39e9c10-6dd8-4858-8cd4-eb0ea3369549'),
(24, 24, 1, 'locations', 'about/locations', 1, '2019-09-23 10:58:19', '2019-09-23 10:58:19', '7a4be89a-1210-40b6-9928-aea774e27073'),
(26, 26, 1, 'kathmanadu-nepal', 'about/locations/kathmanadu-nepal', 1, '2019-09-23 10:58:51', '2019-09-24 10:03:09', '0c5fb117-65f3-4484-bc2f-559b2ab486b6'),
(27, 27, 1, 'kathmanadu-nepal', 'about/kathmanadu-nepal', 1, '2019-09-23 10:58:52', '2019-09-23 10:58:52', 'f460db73-6199-4031-875b-463cfd746794'),
(29, 29, 1, 'about', 'about/about', 1, '2019-09-23 10:59:51', '2019-09-23 10:59:51', '0fa1e727-d1ac-4cf9-a0de-fc36611fb90d'),
(31, 31, 1, 'founders', 'founders', 1, '2019-09-23 11:07:02', '2019-09-23 11:07:03', 'b62aa79e-0cbb-4ee5-8f8e-b785f1022794'),
(32, 32, 1, 'founders', 'founders', 1, '2019-09-23 11:07:02', '2019-09-23 11:07:02', '5b709004-78c1-47e0-9831-747a7c5fd16c'),
(33, 33, 1, 'about', 'about', 1, '2019-09-23 11:17:32', '2019-09-23 11:17:32', '7a9abaac-933b-4ed6-b35a-f274b5e8d23f'),
(35, 35, 1, NULL, NULL, 1, '2019-09-24 05:04:33', '2019-09-24 05:04:33', '7142a2ce-1c12-49c9-8ed1-ec79faa71bf1'),
(36, 36, 1, 'japanese-iced-coffee', 'drinks/japanese-iced-coffee', 1, '2019-09-24 05:04:48', '2019-09-24 05:04:48', '29d525e3-7d4b-4cad-9364-f052a9b215e3'),
(37, 37, 1, 'japanese-iced-coffee', 'drinks/japanese-iced-coffee', 1, '2019-09-24 05:04:48', '2019-09-24 05:04:48', '833ca848-d7ae-4355-beaf-4abec35d5ebc'),
(38, 38, 1, '__temp_7TsXgnSm7SkrP6shuDZy2nRhcINIQ5LKu0HX', 'drinks/__temp_7TsXgnSm7SkrP6shuDZy2nRhcINIQ5LKu0HX', 1, '2019-09-24 07:51:50', '2019-09-24 07:51:50', '056482c3-8084-4b12-90d9-6bebb5d8d425'),
(39, 39, 1, '__temp_8dtZu973vxvhFhYRaQXEFcsWp1AV6UcyNMNK', 'drinks/__temp_8dtZu973vxvhFhYRaQXEFcsWp1AV6UcyNMNK', 1, '2019-09-24 07:53:33', '2019-09-24 07:53:33', 'd1a037b5-bd2c-4420-b28f-9f22a2fd3d03'),
(40, 40, 1, 'japanese-iced-coffee', 'drinks/japanese-iced-coffee', 1, '2019-09-24 08:04:39', '2019-09-24 08:04:39', '5ba78402-f7b4-40ab-8e00-3ae15a4716fc'),
(41, 41, 1, 'japanese-iced-coffee', 'drinks/japanese-iced-coffee', 1, '2019-09-24 09:17:19', '2019-09-24 09:17:19', 'f19fcbd4-1b83-4dfd-b279-259cf9d4c051'),
(42, 42, 1, 'perfect-espresso', 'drinks/perfect-espresso', 1, '2019-09-24 09:17:30', '2019-09-24 09:17:30', '7dc2f633-5fa4-49ff-a9bf-8a98b47e0df6'),
(43, 43, 1, 'locations', 'about/locations', 1, '2019-09-24 10:03:09', '2019-09-24 10:03:09', 'cc09852b-e140-461e-9bb0-59c3ce6e9817'),
(44, 44, 1, 'kathmanadu-nepal', 'about/locations/kathmanadu-nepal', 1, '2019-09-24 10:04:52', '2019-09-24 10:04:52', '64a9ee4d-9c20-400d-8c2b-663bfd631f91'),
(46, 46, 1, NULL, NULL, 1, '2019-09-24 11:11:19', '2019-09-24 11:11:19', '79d740c8-e2d4-435c-8f71-43ebef6336c4'),
(47, 47, 1, NULL, NULL, 1, '2019-09-24 11:11:23', '2019-09-24 11:11:23', 'fb9a0352-0f74-481f-a3a2-4e7c134d7a8f'),
(48, 48, 1, NULL, NULL, 1, '2019-09-24 11:11:23', '2019-09-24 11:11:23', '8e47f804-bf9f-4437-8846-493b6902227f'),
(49, 49, 1, NULL, NULL, 1, '2019-09-24 11:11:32', '2019-09-24 11:11:32', '25c1aacc-714b-4f1f-a89f-cf7d45bcd7d9'),
(50, 50, 1, 'perfect-espresso', 'recipes/perfect-espresso', 1, '2019-09-24 11:21:44', '2019-09-24 11:21:44', '236b0ca6-4a4d-44db-8a3a-3d3a97474249'),
(51, 51, 1, 'perfect-espresso', 'recipes/perfect-espresso', 1, '2019-09-24 11:21:44', '2019-09-24 11:21:44', '39b2afc5-bb3a-47b7-a90b-1d3947543b66'),
(52, 52, 1, '__temp_SQV7i0xgPkDd5WTyTH4ItZSAwl9OJwpC9QT0', 'recipes/__temp_SQV7i0xgPkDd5WTyTH4ItZSAwl9OJwpC9QT0', 1, '2019-09-24 11:21:47', '2019-09-24 11:21:47', '44210a03-f189-4d90-82de-63bd8ae6a91b'),
(53, 53, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '5cbc7c7a-dbb2-4e2d-8e9d-8fbc3e0bc1e4'),
(54, 54, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '69b111bd-5c97-46a6-b108-e077801ebd0e'),
(55, 55, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '47a78aca-e27a-4c77-924d-bf5d9537d5c8'),
(56, 56, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'e07ee75c-6990-4371-b451-195664fa4fbf'),
(57, 57, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '86f3b3a8-b5e9-4298-802e-01f0e64837c0'),
(58, 58, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '121262a4-92f2-42f9-aad9-ce1427ccf602'),
(59, 59, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '45dc870b-5795-4e73-8d78-b8a0ce4236a2'),
(60, 60, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '25821bae-ccd9-4cf0-b84d-ac5d9c3e68f2'),
(61, 61, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '07ad1449-9c31-4926-ad53-d6d34792c439'),
(62, 62, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '32fda875-e21a-46a6-acb0-5917ad4a7ea5'),
(63, 63, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'b6c8e19b-e707-4918-abfd-22ef56ac3408'),
(64, 64, 1, 'perfect-espresso', 'recipes/perfect-espresso', 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '41dd2f4b-df72-4680-9081-a7e95c938d55'),
(65, 65, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'c9570d28-769f-4235-a53a-07019c8634c0'),
(66, 66, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '5312f0c9-d4c7-4088-b750-183ef243bda7'),
(67, 67, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '6107ce8c-c2d2-45a2-8647-bb068da44c4e'),
(68, 68, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'd4915ec2-51d8-4e0a-8d26-cf6be7ff84f9'),
(69, 69, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '4e231478-f99f-475c-93cc-c49b2a1ba8d7'),
(70, 70, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'd9116b49-fa06-4fa7-aeb1-eb4979901440'),
(71, 71, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'ecdc6b9b-6eae-47fc-9a2b-9f033e34bf11'),
(72, 72, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '105fca22-f07d-4be6-86a9-0c0daa980f09'),
(73, 73, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '9d1058ff-5f25-4985-b748-958ce2d9e413'),
(74, 74, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'c26fc94c-1e97-49d2-bc6e-483ba09797a9'),
(75, 75, 1, NULL, NULL, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'cafc962f-2ccf-47f1-b046-e60155305ca9'),
(76, 76, 1, 'perfect-espresso', 'recipes/perfect-espresso', 1, '2019-09-24 11:42:03', '2019-09-24 11:42:03', '47968e48-928b-42a2-9854-a14d5d7494cb'),
(77, 77, 1, NULL, NULL, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', 'ec413e66-2d25-4557-ba1d-b26a1d96abf1'),
(78, 78, 1, NULL, NULL, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', 'fd121418-257c-4a1f-b1c9-e1a715b16d7a'),
(79, 79, 1, NULL, NULL, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '84156c7d-8c0e-4c0d-b682-6a09edb344bf'),
(80, 80, 1, NULL, NULL, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '7acd08a9-02ed-4297-b2d4-f1d68fab45e8'),
(81, 81, 1, NULL, NULL, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '234643b0-ba0f-4e6f-bf07-9e0bae88955e'),
(82, 82, 1, NULL, NULL, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '08ede5cd-9bc3-448c-af40-e19880a62c50'),
(83, 83, 1, NULL, NULL, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '3ade37fe-7611-49a4-92e5-2d077da3c397'),
(84, 84, 1, NULL, NULL, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '6585f80d-125a-4cc8-b521-ad97be952c1b'),
(85, 85, 1, NULL, NULL, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', 'ad491a70-abc8-44bf-8617-67628ad66a48'),
(86, 86, 1, NULL, NULL, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', 'a9a49fc3-a628-4b09-bb83-2bfc58a1bfb6'),
(87, 87, 1, NULL, NULL, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '97acf86e-d196-4e41-97f1-bd93c39b4d1f'),
(88, 88, 1, 'perfect-espresso', 'recipes/perfect-espresso', 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', 'da228a77-2e66-4e83-b1b5-0b12d423d022'),
(89, 89, 1, NULL, NULL, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '339e8f9d-7462-467f-9731-1571903f8590'),
(90, 90, 1, NULL, NULL, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '72942bb2-9a33-469b-9777-9b3578a1d341'),
(91, 91, 1, NULL, NULL, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', 'a98791ca-17e4-4431-9bd7-42b2ea354126'),
(92, 92, 1, NULL, NULL, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '7399e259-0c39-436f-891d-5170005754dd'),
(93, 93, 1, NULL, NULL, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '9bf163b7-826e-4317-bfb6-c8997e7e429e'),
(94, 94, 1, NULL, NULL, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '8ccec45e-0010-4af3-a79d-ad4cfca3687e'),
(95, 95, 1, NULL, NULL, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', 'de7d4ee1-2128-43be-b360-e1e6b3534000'),
(96, 96, 1, NULL, NULL, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '3558092b-5d1a-4b65-a79b-5be7dbb09251'),
(97, 97, 1, NULL, NULL, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', 'cf247fd8-ac3a-481b-b7d9-42766d3f2d21'),
(98, 98, 1, NULL, NULL, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '42b7f19f-c59a-4c65-9fe3-493e0ee2d195'),
(99, 99, 1, NULL, NULL, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '82a11585-13f3-4f19-a818-f99f797f3405'),
(100, 100, 1, 'perfect-espresso', 'recipes/perfect-espresso', 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', 'a2481f67-ffe4-47ad-909c-e4aac6becbb7'),
(101, 101, 1, NULL, NULL, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '8098e3ba-0d60-4dbc-856e-6292c3776509'),
(102, 102, 1, NULL, NULL, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', 'e7eb5ece-5c6f-42b1-9451-1896f0d6c5a7'),
(103, 103, 1, NULL, NULL, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '19bee83c-3f9c-468e-99b8-f408181fd1ac'),
(104, 104, 1, NULL, NULL, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '69e8f765-1c5a-43e6-9a44-607a93e6ef41'),
(105, 105, 1, NULL, NULL, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '488018e4-acda-45a1-b1aa-d4def4d5e140'),
(106, 106, 1, NULL, NULL, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', 'b9bf787b-4135-4da4-bd13-072c601df85b'),
(107, 107, 1, NULL, NULL, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', 'fbed8198-b262-4f02-bc10-f1493f037c6d'),
(108, 108, 1, NULL, NULL, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', 'eb05be36-e408-40db-acbe-a969c9b43cb2'),
(109, 109, 1, NULL, NULL, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '7eb91365-8cb2-4816-b6f0-c839d0f6ae97'),
(110, 110, 1, NULL, NULL, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '4fc2f110-574f-402c-82d4-5c9da001bc3e'),
(111, 111, 1, NULL, NULL, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', 'e2a566dc-560d-43cb-ba65-db97eba2f600'),
(124, 124, 1, NULL, NULL, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '39026402-47cb-4778-aa13-a198048a72ed'),
(125, 125, 1, NULL, NULL, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '91ed381f-2b08-46d0-91a9-ea5a82ec94c1'),
(126, 126, 1, NULL, NULL, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '9cfd32ef-8bba-4267-b820-522e2438105a'),
(127, 127, 1, NULL, NULL, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', 'a029e9e5-94f4-41dc-be47-85d4c54e7511'),
(128, 128, 1, NULL, NULL, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', 'e59023d2-43e6-4ff0-99da-da1774de0c9f'),
(129, 129, 1, NULL, NULL, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '295f84cc-450c-4d65-b83c-a41afc27edf5'),
(130, 130, 1, NULL, NULL, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', 'e9c0cb97-38d0-4028-b92f-c29e52795764'),
(131, 131, 1, NULL, NULL, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '1392e2a5-e5ed-4d6a-9158-10f4b1da9e27'),
(132, 132, 1, NULL, NULL, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '7f9743fe-0a32-4ce2-a838-c6199c773c55'),
(133, 133, 1, NULL, NULL, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '88ffa81f-167d-4c65-a819-cde839d106b0'),
(134, 134, 1, NULL, NULL, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '2e21b6ac-fb35-4c09-98d4-201691af4db0'),
(135, 135, 1, 'perfect-espresso', 'recipes/perfect-espresso', 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', 'edb70f7f-1c00-4a8c-bc3d-87b441e594f6'),
(136, 136, 1, NULL, NULL, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '9cca80e0-60b3-40d2-9ace-10a506aceb7e'),
(137, 137, 1, NULL, NULL, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', 'ac3ec168-aee3-44f3-8022-c98a7cf8311f'),
(138, 138, 1, NULL, NULL, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '3f0c5acb-635c-43d3-ab33-83f9a73c1dd0'),
(139, 139, 1, NULL, NULL, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '93413d2d-8dd9-49c1-aecf-6c5c0f06925d'),
(140, 140, 1, NULL, NULL, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', 'ba71d847-8857-4ec8-b829-587d1f661bf9'),
(141, 141, 1, NULL, NULL, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', 'a75c5739-6d09-4db0-af9a-e59c890ee0e8'),
(142, 142, 1, NULL, NULL, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '2626e08e-f1ea-4b73-a566-4e5e62d64791'),
(143, 143, 1, NULL, NULL, 1, '2019-09-24 12:30:00', '2019-09-24 12:30:00', '0f7d7715-efbe-4a73-934e-c384a47e16b0'),
(144, 144, 1, NULL, NULL, 1, '2019-09-24 12:30:00', '2019-09-24 12:30:00', '3023e87b-b6cb-4087-af5e-56cb217309e9'),
(145, 145, 1, NULL, NULL, 1, '2019-09-24 12:30:00', '2019-09-24 12:30:00', 'db0b2363-c524-4c15-bc00-7658ea4e1b24'),
(146, 146, 1, NULL, NULL, 1, '2019-09-24 12:30:00', '2019-09-24 12:30:00', 'fed33489-f927-4d9d-a547-370820be1e0a'),
(147, 147, 1, 'espresso', 'styles/espresso', 1, '2019-09-25 07:51:55', '2019-09-25 07:51:56', '76e3ef60-c446-44c2-bf10-703424b393e0'),
(148, 148, 1, 'iced-coffee', 'styles/iced-coffee', 1, '2019-09-25 08:02:58', '2019-09-25 08:02:58', '64b409ed-8513-4161-8b77-bc03de87e223'),
(149, 149, 1, 'perfect-espresso', 'recipes/perfect-espresso', 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', 'b2e2bd6b-70f6-4594-a55c-0d1682b3eac7'),
(150, 150, 1, NULL, NULL, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '01b4b202-fa80-4ed3-9a3b-c5aa80088ef8'),
(151, 151, 1, NULL, NULL, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '9e102d4d-1c5b-4ab6-a995-02ed245d44b4'),
(152, 152, 1, NULL, NULL, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', 'a35206b7-d30d-44f7-bce8-bfc8854c786d'),
(153, 153, 1, NULL, NULL, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '7beb1fbc-49d4-4817-b43e-4621ce580abc'),
(154, 154, 1, NULL, NULL, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', 'c910c411-410f-4d26-9967-b74047fe808a'),
(155, 155, 1, NULL, NULL, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', 'cb1d121f-fd0b-4e82-b3c9-f195fcdaa157'),
(156, 156, 1, NULL, NULL, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', 'fcce9ad1-0a5c-4cd4-8365-8a458ac05fc5'),
(157, 157, 1, NULL, NULL, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '8ccdb60e-0328-4765-bda3-0e6648a755da'),
(158, 158, 1, NULL, NULL, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '6aff08ab-e895-4d9c-9367-8b5fe65262a4'),
(159, 159, 1, NULL, NULL, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '380b2939-07ae-4159-b581-fbf4cd85b770'),
(160, 160, 1, NULL, NULL, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '37149b30-41ac-46e9-ba9d-72a112691a91'),
(161, 161, 1, 'perfect-espresso', 'recipes/perfect-espresso', 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '71e0f223-f4ae-4a81-b521-54e2a0ec5d7c'),
(162, 162, 1, NULL, NULL, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '0705bef2-97f2-4c3b-a183-d0e864c6f088'),
(163, 163, 1, NULL, NULL, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', 'a2521f02-1291-43b7-9bc2-2790b0763485'),
(164, 164, 1, NULL, NULL, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '5c00ca60-29ee-47a9-bab5-e39033047ddc'),
(165, 165, 1, NULL, NULL, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', 'a4126e1c-722d-4587-a428-8b77913ca43e'),
(166, 166, 1, NULL, NULL, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', 'e7d11514-1567-46e0-8d26-62bad663873c'),
(167, 167, 1, NULL, NULL, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', 'f00eebcb-11cb-4d2a-9cfd-ff8eebc49377'),
(168, 168, 1, NULL, NULL, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', 'c9985f42-b3dd-4519-b24b-344f88543b86'),
(169, 169, 1, NULL, NULL, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', 'b716692e-9bd7-41ab-b405-67f732ff8acc'),
(170, 170, 1, NULL, NULL, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '2ce4820e-69c2-4552-b4b5-18e398ef6c49'),
(171, 171, 1, NULL, NULL, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', 'a9c19001-8a3d-49e5-a2e7-b9eb5bc1863a'),
(172, 172, 1, NULL, NULL, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '0d4ea9ed-7379-4ab0-8a31-00d3959cc7ce'),
(173, 173, 1, 'japanese-iced-coffee', 'drinks/japanese-iced-coffee', 1, '2019-09-25 08:23:51', '2019-09-25 08:23:51', 'c5e8f936-234c-4023-b640-2c34cfe50239'),
(174, 174, 1, 'perfect-espresso', 'drinks/perfect-espresso', 1, '2019-09-25 08:24:05', '2019-09-25 08:24:05', 'c0a63e1b-08f4-4e79-820d-5b349f315c3d'),
(175, 175, 1, 'perfect-espresso', 'drinks/perfect-espresso', 1, '2019-09-25 08:53:25', '2019-09-25 08:53:25', 'd335468c-f5cd-4d67-984b-61d82b4ffa47');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, NULL, 1, 1, '2019-09-23 09:00:00', NULL, NULL, '2019-09-23 09:00:23', '2019-09-23 09:00:23', 'a40c1cdd-1e08-4fca-8592-7c1afafb7a97'),
(4, 1, NULL, 1, 1, '2019-09-23 09:04:00', NULL, NULL, '2019-09-23 09:14:35', '2019-09-23 09:14:35', 'f76d000d-f7cd-4d10-9e26-1e4644385915'),
(5, 1, NULL, 1, 1, '2019-09-23 09:04:00', NULL, NULL, '2019-09-23 09:14:35', '2019-09-23 09:14:35', '7192f6c0-8bfd-47ee-a87d-44bc61d091a7'),
(7, 2, NULL, 2, 1, '2019-09-23 09:21:00', NULL, NULL, '2019-09-23 09:22:06', '2019-09-23 09:22:06', '64409d57-d9ac-4743-a3c9-09cf96760ec2'),
(8, 2, NULL, 2, 1, '2019-09-23 09:21:00', NULL, NULL, '2019-09-23 09:22:07', '2019-09-23 09:22:07', '477790c2-27c4-4de1-8f94-b6d5e8a1ee58'),
(9, 2, NULL, 2, 1, '2019-09-23 09:21:00', NULL, NULL, '2019-09-23 09:22:12', '2019-09-23 09:22:12', '66766b44-9f6b-44cc-9d86-723ac159c1a7'),
(10, 2, NULL, 2, 1, '2019-09-23 09:21:00', NULL, NULL, '2019-09-23 09:24:31', '2019-09-23 09:24:31', 'e4c60e6c-3b9e-484a-9f94-1fbe6b98709c'),
(11, 2, NULL, 2, 1, '2019-09-23 09:21:00', NULL, NULL, '2019-09-23 09:25:39', '2019-09-23 09:25:39', 'f3f125be-a324-4d19-b161-f3fde1a72e85'),
(12, 2, NULL, 2, 1, '2019-09-23 09:27:00', NULL, NULL, '2019-09-23 09:27:27', '2019-09-23 09:27:27', '9dd7d4ef-2a81-4ea5-9066-d3312ff4f36e'),
(13, 3, NULL, 3, NULL, '2019-09-23 09:44:00', NULL, NULL, '2019-09-23 09:44:03', '2019-09-23 09:44:03', 'b09399c0-a50b-4b28-88ca-8a36a15965d0'),
(16, 1, NULL, 1, 1, '2019-09-23 09:04:00', NULL, NULL, '2019-09-23 10:25:39', '2019-09-23 10:25:39', 'ef014bd8-cdd2-4e3e-9df5-8721b0c44f2f'),
(17, 1, NULL, 1, 1, '2019-09-23 09:04:00', NULL, NULL, '2019-09-23 10:26:17', '2019-09-23 10:26:17', '35d00cce-d8a2-484b-abc0-a3e5e686f4b2'),
(18, 1, NULL, 1, 1, '2019-09-23 09:04:00', NULL, NULL, '2019-09-23 10:26:32', '2019-09-23 10:26:32', '80ce69db-cfa5-4a14-8bc4-c3225f4a3994'),
(20, 4, NULL, 4, 1, '2019-09-23 10:56:00', NULL, NULL, '2019-09-23 10:58:06', '2019-09-23 10:58:06', '6dc71d6f-1361-434a-87a4-1ad643cc1300'),
(21, 4, NULL, 4, 1, '2019-09-23 10:56:00', NULL, NULL, '2019-09-23 10:58:06', '2019-09-23 10:58:06', '6e51c41f-05b6-4066-b451-ea5fece47cfd'),
(23, 4, NULL, 4, 1, '2019-09-23 10:58:00', NULL, NULL, '2019-09-23 10:58:19', '2019-09-23 10:58:19', '4141c868-26f2-4729-a1e4-5b67114653e1'),
(24, 4, NULL, 4, 1, '2019-09-23 10:58:00', NULL, NULL, '2019-09-23 10:58:19', '2019-09-23 10:58:19', '4c9c8306-7fc3-4bf6-bcc0-9b9661b4134c'),
(26, 4, NULL, 4, 1, '2019-09-23 10:58:00', NULL, NULL, '2019-09-23 10:58:51', '2019-09-23 10:58:51', '8c1c986d-2555-4802-8cf1-53aecb581521'),
(27, 4, NULL, 4, 1, '2019-09-23 10:58:00', NULL, NULL, '2019-09-23 10:58:52', '2019-09-23 10:58:52', '27a8fed7-2542-405a-b976-8400255048e6'),
(29, 4, NULL, 4, 1, '2019-09-23 10:56:00', NULL, NULL, '2019-09-23 10:59:51', '2019-09-23 10:59:51', 'c2d4b4b4-54ce-494d-bbd6-80fe3c44f812'),
(31, 4, NULL, 4, 1, '2019-09-23 11:06:00', NULL, NULL, '2019-09-23 11:07:02', '2019-09-23 11:07:02', '2139880e-3ff0-4dc6-a29f-d3e6c42f9278'),
(32, 4, NULL, 4, 1, '2019-09-23 11:06:00', NULL, NULL, '2019-09-23 11:07:02', '2019-09-23 11:07:02', '999a79c2-f8e3-47fe-b6d6-ea3f908a165c'),
(33, 4, NULL, 4, 1, '2019-09-23 10:56:00', NULL, NULL, '2019-09-23 11:17:32', '2019-09-23 11:17:32', '1d3cfa82-327a-4a6a-bc29-731c16210e90'),
(36, 1, NULL, 1, 1, '2019-09-24 05:03:00', NULL, NULL, '2019-09-24 05:04:48', '2019-09-24 05:04:48', 'ac713e1a-2c58-4ac2-ae73-1bcccc64242c'),
(37, 1, NULL, 1, 1, '2019-09-24 05:03:00', NULL, NULL, '2019-09-24 05:04:49', '2019-09-24 05:04:49', '2959355c-5ece-477d-aa09-7ff901191355'),
(38, 1, NULL, 1, 1, '2019-09-24 07:51:00', NULL, NULL, '2019-09-24 07:51:50', '2019-09-24 07:51:50', '7837a069-cd81-40fa-8170-40eb76c67bc0'),
(39, 1, NULL, 1, 1, '2019-09-24 07:53:00', NULL, NULL, '2019-09-24 07:53:33', '2019-09-24 07:53:33', '92942357-c7c0-451c-aabb-30be3e68ae96'),
(40, 1, NULL, 1, 1, '2019-09-24 05:03:00', NULL, NULL, '2019-09-24 08:04:39', '2019-09-24 08:04:39', '0c1f2d25-f4a3-40cd-8f4b-59221e9e64ba'),
(41, 1, NULL, 1, 1, '2019-09-24 05:03:00', NULL, NULL, '2019-09-24 09:17:19', '2019-09-24 09:17:19', '542921c4-98a4-4704-b3cd-962e6ff64882'),
(42, 1, NULL, 1, 1, '2019-09-23 09:04:00', NULL, NULL, '2019-09-24 09:17:30', '2019-09-24 09:17:30', 'a5f657e6-a4a1-4e2e-8762-c5d767b93465'),
(43, 4, NULL, 4, 1, '2019-09-23 10:58:00', NULL, NULL, '2019-09-24 10:03:09', '2019-09-24 10:03:09', 'b63ed224-0365-4170-81d9-123e88c36617'),
(44, 4, NULL, 4, 1, '2019-09-23 10:58:00', NULL, NULL, '2019-09-24 10:04:52', '2019-09-24 10:04:52', '573ef5c7-2bb0-4a7e-a47a-ec3461aa6a40'),
(50, 5, NULL, 5, 1, '2019-09-24 11:11:00', NULL, NULL, '2019-09-24 11:21:44', '2019-09-24 11:21:44', 'f1895db3-2309-4564-b4a2-f18ef68c4957'),
(51, 5, NULL, 5, 1, '2019-09-24 11:11:00', NULL, NULL, '2019-09-24 11:21:44', '2019-09-24 11:21:44', '67803153-e8c8-49d0-b5c5-cd061305761d'),
(52, 5, NULL, 5, 1, '2019-09-24 11:21:00', NULL, NULL, '2019-09-24 11:21:47', '2019-09-24 11:21:47', '098e67c7-e671-4533-84a7-7abdb61672be'),
(64, 5, NULL, 5, 1, '2019-09-24 11:11:00', NULL, NULL, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'df14caee-6e98-4b85-b814-e04a2c9eed7c'),
(76, 5, NULL, 5, 1, '2019-09-24 11:11:00', NULL, NULL, '2019-09-24 11:42:04', '2019-09-24 11:42:04', 'b2f43579-66ae-4f71-8ce9-0443338d485b'),
(88, 5, NULL, 5, 1, '2019-09-24 11:11:00', NULL, NULL, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '9fd793ff-49a8-4874-9452-f92b3f837c0d'),
(100, 5, NULL, 5, 1, '2019-09-24 11:11:00', NULL, NULL, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '1a9e5b41-b132-47fd-bfa6-acf02b42e11a'),
(135, 5, NULL, 5, 1, '2019-09-24 11:11:00', NULL, NULL, '2019-09-24 12:29:59', '2019-09-24 12:29:59', 'd2ed246b-5bb3-4676-a7de-f1ba777a0538'),
(149, 5, NULL, 5, 1, '2019-09-24 11:11:00', NULL, NULL, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '4c527057-1d69-4d5c-89c8-2ff2bf9b9336'),
(161, 5, NULL, 5, 1, '2019-09-24 11:11:00', NULL, NULL, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '059e20fb-c844-4bb3-9f44-c17aafe43fe3'),
(173, 1, NULL, 1, 1, '2019-09-24 05:03:00', NULL, NULL, '2019-09-25 08:23:51', '2019-09-25 08:23:51', '8990fe79-24f2-4010-80f6-2acf80c6a643'),
(174, 1, NULL, 1, 1, '2019-09-23 09:04:00', NULL, NULL, '2019-09-25 08:24:05', '2019-09-25 08:24:05', '51f3ff33-f823-49ff-a611-659904016d78'),
(175, 1, NULL, 1, 1, '2019-09-23 09:04:00', NULL, NULL, '2019-09-25 08:53:25', '2019-09-25 08:53:25', '94e6a3b8-4174-4473-9a60-3d7692621f03');

-- --------------------------------------------------------

--
-- Table structure for table `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'Drinks', 'drinks', 1, 'Drink Name', '', 1, '2019-09-23 08:04:35', '2019-09-25 08:53:08', NULL, 'a2ac2ffe-7ce0-470c-b477-20161ef7bd89'),
(2, 2, 2, 'News', 'news', 1, 'Headline', '', 1, '2019-09-23 08:54:03', '2019-09-23 09:27:22', NULL, 'f73c4837-e023-44bc-a00f-0bd948494d80'),
(3, 3, NULL, 'Homepage', 'homepage', 0, NULL, '{section.name|raw}', 1, '2019-09-23 09:44:03', '2019-09-23 09:44:03', NULL, '1f135125-2aef-4db4-93a4-f463d244faec'),
(4, 4, 3, 'About', 'about', 1, 'Page Title', '', 1, '2019-09-23 10:50:56', '2019-09-23 11:15:57', NULL, '8c5a8134-bca1-407d-a799-fbefb349952a'),
(5, 5, 9, 'Recipes', 'recipes', 1, 'Title', '', 1, '2019-09-24 10:22:07', '2019-09-25 08:00:47', NULL, '7a2d2bae-7201-4a3d-8085-bc0122325109');

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Common', '2019-09-23 05:24:41', '2019-09-23 05:24:41', 'f8d20d5c-a2d7-4225-90d1-be815d4f75b8'),
(2, 'Drinks', '2019-09-23 08:12:41', '2019-09-23 08:12:41', '84b9ad67-6b4b-47f7-aa3a-7e5ac492e294'),
(3, 'General', '2019-09-23 08:13:00', '2019-09-23 08:13:00', '6737f1c7-7097-4b73-bc5c-a96fe970db9f'),
(4, 'News', '2019-09-23 08:55:02', '2019-09-23 08:55:02', '937cf821-da4a-4991-9364-352d25374c0d'),
(5, 'About', '2019-09-23 11:11:58', '2019-09-23 11:11:58', '4f0d80db-f209-4589-900c-1f70c099461b'),
(6, 'Recipes', '2019-09-24 10:23:09', '2019-09-24 10:23:09', '71d51e2d-0393-4ac4-a505-146c76f8cd08');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayoutfields`
--

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayoutfields`
--

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(9, 2, 5, 4, 1, 2, '2019-09-23 09:27:22', '2019-09-23 09:27:22', '0c83e3a0-6da1-4648-bafb-dc8ab91feede'),
(10, 2, 5, 3, 1, 1, '2019-09-23 09:27:22', '2019-09-23 09:27:22', 'cf431cb8-c288-4b16-a7a9-8a2c27e1509b'),
(14, 3, 7, 6, 0, 1, '2019-09-23 11:15:57', '2019-09-23 11:15:57', 'eda2d4ce-0194-4ef1-9e84-afd7774cb4ce'),
(15, 3, 7, 7, 0, 2, '2019-09-23 11:15:57', '2019-09-23 11:15:57', '1f66e8a4-59f3-4290-825d-ad0782b5a43d'),
(16, 3, 7, 2, 1, 3, '2019-09-23 11:15:57', '2019-09-23 11:15:57', '41238a7d-b0a7-456f-9aa9-5e8ddec25627'),
(34, 4, 18, 10, 0, 1, '2019-09-24 11:08:16', '2019-09-24 11:08:16', '56f1c784-2d79-4b5b-b844-208f3cd9a680'),
(35, 4, 18, 11, 0, 2, '2019-09-24 11:08:16', '2019-09-24 11:08:16', 'e4aba6c8-0d13-49ed-90ba-6a6bbbd0e51b'),
(36, 5, 19, 12, 0, 1, '2019-09-24 11:08:16', '2019-09-24 11:08:16', 'f911c6a3-3259-40f8-bbe5-21ce84ffcf86'),
(37, 6, 20, 13, 0, 1, '2019-09-24 11:08:16', '2019-09-24 11:08:16', '48f3bb2f-97f5-43f1-8556-0b0a9897d7b5'),
(38, 7, 21, 14, 0, 1, '2019-09-24 11:08:16', '2019-09-24 11:08:16', '5fc4b563-18d7-4a07-9a99-3af1855197f8'),
(39, 7, 21, 15, 0, 2, '2019-09-24 11:08:16', '2019-09-24 11:08:16', '891c78b2-f731-4070-a553-f4344c5055db'),
(40, 8, 22, 16, 0, 1, '2019-09-24 11:08:16', '2019-09-24 11:08:16', 'f8d20157-e950-4297-b0b8-a83b3f5360f2'),
(47, 10, 25, 18, 0, 1, '2019-09-25 07:50:57', '2019-09-25 07:50:57', '3184f25b-ce66-4d36-9542-3099ce83d15d'),
(48, 9, 26, 19, 0, 1, '2019-09-25 08:00:47', '2019-09-25 08:00:47', '2e3535a8-ef0a-4be0-98f9-dd1f3ab53a3f'),
(49, 9, 26, 9, 0, 5, '2019-09-25 08:00:47', '2019-09-25 08:00:47', 'c1b229e7-bb32-482f-9076-96513eaf670e'),
(50, 9, 26, 7, 0, 3, '2019-09-25 08:00:47', '2019-09-25 08:00:47', '393729e2-35bf-491c-a23f-10f48f129c72'),
(51, 9, 26, 5, 0, 2, '2019-09-25 08:00:47', '2019-09-25 08:00:47', 'ec492bb1-fd70-437c-bccc-2ab7c866b3bc'),
(52, 9, 26, 17, 0, 4, '2019-09-25 08:00:47', '2019-09-25 08:00:47', '33d4d8a0-3070-4afe-b450-6a8b34907b5b'),
(58, 1, 28, 19, 0, 1, '2019-09-25 08:53:08', '2019-09-25 08:53:08', '3e770936-b075-4fd9-85d3-b93306f95708'),
(59, 1, 28, 2, 0, 4, '2019-09-25 08:53:08', '2019-09-25 08:53:08', '4996ce8f-8077-4cb5-83e1-ca74768c2058'),
(60, 1, 28, 5, 1, 2, '2019-09-25 08:53:08', '2019-09-25 08:53:08', '73af875b-92b6-4d8b-a154-0a531f4ab533'),
(61, 1, 28, 8, 0, 5, '2019-09-25 08:53:08', '2019-09-25 08:53:08', '69ac88a0-3f2f-47bc-845a-432dff90877e'),
(62, 1, 28, 1, 0, 3, '2019-09-25 08:53:08', '2019-09-25 08:53:08', 'bcab07a0-e9e6-45bc-8a94-52094b867969'),
(63, 1, 28, 20, 0, 6, '2019-09-25 08:53:08', '2019-09-25 08:53:08', 'b00a633f-5adb-469d-8169-47f5e1afb3a1');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '2019-09-23 09:11:13', '2019-09-23 09:11:13', NULL, '66f1f3f7-172c-49a9-b24e-3667c2027ef4'),
(2, 'craft\\elements\\Entry', '2019-09-23 09:20:40', '2019-09-23 09:20:40', NULL, 'becfa162-b707-4a17-922d-f999b1ad5d74'),
(3, 'craft\\elements\\Entry', '2019-09-23 11:15:57', '2019-09-23 11:15:57', NULL, '48856ed7-c6ed-47cd-a2d4-2930811ae8b0'),
(4, 'craft\\elements\\MatrixBlock', '2019-09-24 10:53:09', '2019-09-24 10:53:09', NULL, '93def6a2-635b-40dc-97fc-59604b9a50bf'),
(5, 'craft\\elements\\MatrixBlock', '2019-09-24 10:57:25', '2019-09-24 10:57:25', NULL, 'c1bf4e2f-c977-4603-bf94-b273df9520b4'),
(6, 'craft\\elements\\MatrixBlock', '2019-09-24 10:57:25', '2019-09-24 10:57:25', NULL, '03313e9b-c96f-4178-a864-99bb81889597'),
(7, 'craft\\elements\\MatrixBlock', '2019-09-24 11:03:38', '2019-09-24 11:03:38', NULL, '160e85d7-36cc-41e5-9eee-704301d348a2'),
(8, 'craft\\elements\\MatrixBlock', '2019-09-24 11:03:38', '2019-09-24 11:03:38', NULL, '441b81fa-eb59-42ed-b1e1-0a974eddec8a'),
(9, 'craft\\elements\\Entry', '2019-09-24 11:10:42', '2019-09-24 11:10:42', NULL, '3583b5cc-3db2-4657-b3e6-16e925e5246f'),
(10, 'craft\\elements\\Category', '2019-09-25 07:50:57', '2019-09-25 07:50:57', NULL, '48a8e5c8-b8fd-4f48-a5a0-5adb11ae78ff');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayouttabs`
--

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(5, 2, 'News', 1, '2019-09-23 09:27:22', '2019-09-23 09:27:22', '5f06bcd8-a082-413f-bb22-8063369c9c3f'),
(7, 3, 'About', 1, '2019-09-23 11:15:57', '2019-09-23 11:15:57', 'b3436661-41eb-4046-825e-277e3948ed39'),
(18, 4, 'Content', 1, '2019-09-24 11:08:16', '2019-09-24 11:08:16', '786d9b85-6d64-4cfd-9456-74fe718d118e'),
(19, 5, 'Content', 1, '2019-09-24 11:08:16', '2019-09-24 11:08:16', '1997fb88-6e16-4caa-b725-003d1ad2fe63'),
(20, 6, 'Content', 1, '2019-09-24 11:08:16', '2019-09-24 11:08:16', 'fb2c6671-a17a-4a6c-8638-4c52469076f5'),
(21, 7, 'Content', 1, '2019-09-24 11:08:16', '2019-09-24 11:08:16', '14f098c7-24d0-4efe-bb17-c032e8680ada'),
(22, 8, 'Content', 1, '2019-09-24 11:08:16', '2019-09-24 11:08:16', 'ec1b865e-514a-44cf-829f-61f4ace3e18a'),
(25, 10, 'Style', 1, '2019-09-25 07:50:57', '2019-09-25 07:50:57', 'bf2a2708-21dc-472a-9834-841f664dd2a3'),
(26, 9, 'Recipes', 1, '2019-09-25 08:00:47', '2019-09-25 08:00:47', '90799914-c98f-480d-b807-7ddfa0fbf0e6'),
(28, 1, 'Drinks', 1, '2019-09-25 08:53:08', '2019-09-25 08:53:08', '5c3515d8-f0f7-4068-94ec-3b72dcbc88dc');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 'Drink Intro', 'drinkIntro', 'global', 'A short introduction(one sentence) that describes the drink. Be creative!', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2019-09-23 08:25:46', '2019-09-23 08:25:46', 'f628f774-47e3-4e0a-88bc-107dba1ec97f'),
(2, 3, 'Page Copy', 'pageCopy', 'global', '', 1, 'none', NULL, 'craft\\ckeditor\\Field', '{\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"columnType\":\"text\"}', '2019-09-23 08:49:19', '2019-09-23 08:49:19', '8150e700-7d4b-46d3-bd35-7a117b09f4c6'),
(3, 4, 'News Excerpt', 'newsExcerpt', 'global', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2019-09-23 08:56:40', '2019-09-23 08:56:40', 'd64cd12a-0f2b-4525-ad11-863961d6f826'),
(4, 4, 'News Body', 'newsBody', 'global', '', 1, 'none', NULL, 'craft\\ckeditor\\Field', '{\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"columnType\":\"text\"}', '2019-09-23 08:57:28', '2019-09-23 08:57:28', 'babb5e1c-6141-4b8d-9c4b-fe28888a98a6'),
(5, 2, 'Drink Image', 'drinkImage', 'global', '', 0, 'site', NULL, 'craft\\fields\\Assets', '{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:1c9a42a4-d16c-4471-9a31-0335cddeb9cd\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:1c9a42a4-d16c-4471-9a31-0335cddeb9cd\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":[\"volume:1c9a42a4-d16c-4471-9a31-0335cddeb9cd\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"Choose a drink image\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"}', '2019-09-23 10:18:21', '2019-09-23 10:18:21', 'ba688f88-740b-45f1-a7fe-c2837a3d77d4'),
(6, 5, 'Subtitle', 'subtitle', 'global', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2019-09-23 11:12:50', '2019-09-23 11:12:50', '6fc29e80-1733-45a0-a3f1-df343c492679'),
(7, 5, 'Page Intro', 'pageIntro', 'global', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2019-09-23 11:13:28', '2019-09-23 11:13:28', '80851629-6fae-4503-96e8-5c8e3a4f45fc'),
(8, 2, 'Date added to Menu', 'dateAddedToMenu', 'global', '', 1, 'none', NULL, 'craft\\fields\\Date', '{\"showDate\":true,\"showTime\":false,\"minuteIncrement\":\"30\"}', '2019-09-24 09:16:02', '2019-09-24 09:16:02', 'e157c0a3-3f28-4e85-bbf4-738dbaa4352b'),
(9, 6, 'Recipe Contents', 'recipeContents', 'global', '', 1, 'site', NULL, 'craft\\fields\\Matrix', '{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_recipecontents}}\",\"propagationMethod\":\"all\"}', '2019-09-24 10:53:09', '2019-09-24 11:08:16', '336231e8-bcd8-4dbd-95ea-c275cb36ca01'),
(10, NULL, 'Image', 'image', 'matrixBlockType:964f95e4-4484-4c09-a252-cd37a6b2959b', '', 1, 'site', NULL, 'craft\\fields\\Assets', '{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:1c9a42a4-d16c-4471-9a31-0335cddeb9cd\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:1c9a42a4-d16c-4471-9a31-0335cddeb9cd\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"Add an image for this block.\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"}', '2019-09-24 10:53:09', '2019-09-24 11:08:16', '1cfc979f-6264-4c45-85ea-ad79f87f9eb9'),
(11, NULL, 'Image Caption', 'imageCaption', 'matrixBlockType:964f95e4-4484-4c09-a252-cd37a6b2959b', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2019-09-24 10:53:09', '2019-09-24 11:08:16', 'f412f156-8002-4931-a4f0-dc206bb85e99'),
(12, NULL, 'Tip Content', 'tipContent', 'matrixBlockType:0fa0ad54-0e8d-4f37-b336-957e263967e3', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2019-09-24 10:57:25', '2019-09-24 11:08:16', '218b31f0-2be4-48c4-959e-5e1df6e127bb'),
(13, NULL, 'Body Content', 'bodyContent', 'matrixBlockType:65f1855f-8c0b-43f5-909a-c5abf2f5270e', '', 1, 'none', NULL, 'craft\\ckeditor\\Field', '{\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"columnType\":\"text\"}', '2019-09-24 10:57:25', '2019-09-24 11:08:16', '6467dc35-6a5d-4c50-be9c-b09b1d183478'),
(14, NULL, 'Steps Title', 'stepsTitle', 'matrixBlockType:f5d308a6-0a2e-47ac-b816-939fc5d880e9', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2019-09-24 11:03:38', '2019-09-24 11:08:16', '4d295765-1951-42b9-9a9d-3fbb92f4b817'),
(15, NULL, 'Steps Content', 'stepsContent', 'matrixBlockType:f5d308a6-0a2e-47ac-b816-939fc5d880e9', '', 1, 'none', NULL, 'craft\\fields\\Table', '{\"addRowLabel\":\"Add a row\",\"maxRows\":\"\",\"minRows\":\"\",\"columns\":{\"col1\":{\"heading\":\"Steps Instructions\",\"handle\":\"stepsInstructions\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[{\"col1\":\"\"}],\"columnType\":\"text\"}', '2019-09-24 11:03:38', '2019-09-24 11:08:16', 'a61de648-6f4f-4930-ab45-47d5f1bd9ce4'),
(16, NULL, 'Ingredients', 'ingredients', 'matrixBlockType:e1ef9a1b-38c9-4b73-9a68-798c9d11a74c', '', 1, 'none', NULL, 'craft\\fields\\Table', '{\"addRowLabel\":\"Add a row\",\"maxRows\":\"\",\"minRows\":\"\",\"columns\":{\"col1\":{\"heading\":\"Amount\",\"handle\":\"amount\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Ingredient\",\"handle\":\"ingredient\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[{\"col1\":\"\",\"col2\":\"\"}],\"columnType\":\"text\"}', '2019-09-24 11:03:38', '2019-09-24 11:08:16', 'dd8e2bc9-6a33-4f88-a03a-232f432b32bf'),
(17, 6, 'Recipe Snapshot', 'recipeSnapshot', 'global', '', 1, 'none', NULL, 'craft\\fields\\Table', '{\"addRowLabel\":\"Add a row\",\"maxRows\":\"\",\"minRows\":\"\",\"columns\":{\"col1\":{\"heading\":\"Snapshot Text\",\"handle\":\"snapshotText\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[{\"col1\":\"\"}],\"columnType\":\"text\"}', '2019-09-24 11:09:18', '2019-09-24 11:09:18', 'd3e10cc9-08a4-4a88-b65d-3c652a70c0a4'),
(18, 6, 'Style Description', 'styleDescription', 'global', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2019-09-25 07:45:39', '2019-09-25 07:45:39', '121fd9c8-73e4-4523-b030-fbaa1da82c48'),
(19, 1, 'Style', 'style', 'global', '', 1, 'site', NULL, 'craft\\fields\\Categories', '{\"allowLimit\":false,\"allowMultipleSources\":false,\"branchLimit\":\"1\",\"sources\":\"*\",\"source\":\"group:2dc127d1-bd07-4704-8fc5-b2415fb11c3d\",\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":\"Add a style\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"}', '2019-09-25 07:55:44', '2019-09-25 07:59:34', '2fac95e5-48ca-4adf-bcea-4ca0b533f9fb'),
(20, 2, 'Related Recipe', 'relatedRecipe', 'global', '', 1, 'site', NULL, 'craft\\fields\\Entries', '{\"sources\":[\"section:5ab65eb0-86ee-46cd-a5c4-0f35fc592a54\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"1\",\"selectionLabel\":\"Add a recipe\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"}', '2019-09-25 08:51:25', '2019-09-25 08:51:25', 'f72ed375-1295-4998-abcf-517c581161a3');

-- --------------------------------------------------------

--
-- Table structure for table `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gqlschemas`
--

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `scope` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gqlschemas`
--

INSERT INTO `gqlschemas` (`id`, `name`, `accessToken`, `enabled`, `expiryDate`, `lastUsed`, `scope`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Public Schema', '__PUBLIC__', 1, NULL, '2019-09-23 05:44:20', '[]', '2019-09-23 05:44:19', '2019-09-23 05:44:20', '71e3c02a-e195-430f-8bef-2bc68ecf73b7');

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `config` mediumtext,
  `configMap` mediumtext,
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `config`, `configMap`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.3.4.1', '3.3.3', 0, '{\"fieldGroups\":{\"f8d20d5c-a2d7-4225-90d1-be815d4f75b8\":{\"name\":\"Common\"},\"84b9ad67-6b4b-47f7-aa3a-7e5ac492e294\":{\"name\":\"Drinks\"},\"6737f1c7-7097-4b73-bc5c-a96fe970db9f\":{\"name\":\"General\"},\"937cf821-da4a-4991-9364-352d25374c0d\":{\"name\":\"News\"},\"4f0d80db-f209-4589-900c-1f70c099461b\":{\"name\":\"About\"},\"71d51e2d-0393-4ac4-a505-146c76f8cd08\":{\"name\":\"Recipes\"}},\"siteGroups\":{\"b87997ae-39a2-4200-97a4-e07c2d82f1a1\":{\"name\":\"Crafty Coffee\"}},\"sites\":{\"fb7d3d24-d0b3-43b9-aae4-a04c1d708262\":{\"baseUrl\":\"$DEFAULT_SITE_URL\",\"handle\":\"default\",\"hasUrls\":true,\"language\":\"en-US\",\"name\":\"Crafty Coffee\",\"primary\":true,\"siteGroup\":\"b87997ae-39a2-4200-97a4-e07c2d82f1a1\",\"sortOrder\":1}},\"email\":{\"fromEmail\":\"admin@admin.com\",\"fromName\":\"Crafty Coffee\",\"transportType\":\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"},\"system\":{\"edition\":\"pro\",\"name\":\"Crafty Coffee\",\"live\":true,\"schemaVersion\":\"3.3.3\",\"timeZone\":\"America/Los_Angeles\"},\"users\":{\"requireEmailVerification\":true,\"allowPublicRegistration\":false,\"defaultGroup\":null,\"photoVolumeUid\":null,\"photoSubpath\":\"\"},\"dateModified\":1569401588,\"plugins\":{\"ckeditor\":{\"edition\":\"standard\",\"enabled\":true,\"schemaVersion\":\"1.0.0\"}},\"sections\":{\"8915b08a-d928-4818-b4ae-8a56bb64ec9f\":{\"name\":\"Drinks\",\"handle\":\"drinks\",\"type\":\"channel\",\"enableVersioning\":true,\"propagationMethod\":\"all\",\"siteSettings\":{\"fb7d3d24-d0b3-43b9-aae4-a04c1d708262\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"drinks/{slug}\",\"template\":\"drinks/_entry\"}},\"entryTypes\":{\"a2ac2ffe-7ce0-470c-b477-20161ef7bd89\":{\"name\":\"Drinks\",\"handle\":\"drinks\",\"hasTitleField\":true,\"titleLabel\":\"Drink Name\",\"titleFormat\":\"\",\"sortOrder\":1,\"fieldLayouts\":{\"66f1f3f7-172c-49a9-b24e-3667c2027ef4\":{\"tabs\":[{\"name\":\"Drinks\",\"sortOrder\":1,\"fields\":{\"2fac95e5-48ca-4adf-bcea-4ca0b533f9fb\":{\"required\":false,\"sortOrder\":1},\"8150e700-7d4b-46d3-bd35-7a117b09f4c6\":{\"required\":false,\"sortOrder\":4},\"ba688f88-740b-45f1-a7fe-c2837a3d77d4\":{\"required\":true,\"sortOrder\":2},\"e157c0a3-3f28-4e85-bbf4-738dbaa4352b\":{\"required\":false,\"sortOrder\":5},\"f628f774-47e3-4e0a-88bc-107dba1ec97f\":{\"required\":false,\"sortOrder\":3},\"f72ed375-1295-4998-abcf-517c581161a3\":{\"required\":false,\"sortOrder\":6}}}]}}}}},\"c191f417-c2df-4c9a-8ddd-4ac8ffe29887\":{\"name\":\"News\",\"handle\":\"news\",\"type\":\"channel\",\"enableVersioning\":true,\"propagationMethod\":\"all\",\"siteSettings\":{\"fb7d3d24-d0b3-43b9-aae4-a04c1d708262\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"news/{slug}\",\"template\":\"news/_entry\"}},\"entryTypes\":{\"f73c4837-e023-44bc-a00f-0bd948494d80\":{\"name\":\"News\",\"handle\":\"news\",\"hasTitleField\":true,\"titleLabel\":\"Headline\",\"titleFormat\":\"\",\"sortOrder\":1,\"fieldLayouts\":{\"becfa162-b707-4a17-922d-f999b1ad5d74\":{\"tabs\":[{\"name\":\"News\",\"sortOrder\":1,\"fields\":{\"babb5e1c-6141-4b8d-9c4b-fe28888a98a6\":{\"required\":true,\"sortOrder\":2},\"d64cd12a-0f2b-4525-ad11-863961d6f826\":{\"required\":true,\"sortOrder\":1}}}]}}}}},\"4a114baf-7c61-45f4-b75b-4c8732f2c51e\":{\"name\":\"Homepage\",\"handle\":\"homepage\",\"type\":\"single\",\"enableVersioning\":false,\"propagationMethod\":\"all\",\"siteSettings\":{\"fb7d3d24-d0b3-43b9-aae4-a04c1d708262\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"__home__\",\"template\":\"index.twig\"}},\"entryTypes\":{\"1f135125-2aef-4db4-93a4-f463d244faec\":{\"name\":\"Homepage\",\"handle\":\"homepage\",\"hasTitleField\":false,\"titleLabel\":null,\"titleFormat\":\"{section.name|raw}\",\"sortOrder\":1}}},\"573d91a5-2586-4dbb-9e33-5c10786e3729\":{\"name\":\"About\",\"handle\":\"about\",\"type\":\"structure\",\"enableVersioning\":true,\"propagationMethod\":\"all\",\"siteSettings\":{\"fb7d3d24-d0b3-43b9-aae4-a04c1d708262\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"{parent.uri}/{slug}\",\"template\":\"about/_entry\"}},\"structure\":{\"uid\":\"640c6320-37a6-42f0-a4ba-a0fd231c78d7\",\"maxLevels\":null},\"entryTypes\":{\"8c5a8134-bca1-407d-a799-fbefb349952a\":{\"name\":\"About\",\"handle\":\"about\",\"hasTitleField\":true,\"titleLabel\":\"Page Title\",\"titleFormat\":\"\",\"sortOrder\":1,\"fieldLayouts\":{\"48856ed7-c6ed-47cd-a2d4-2930811ae8b0\":{\"tabs\":[{\"name\":\"About\",\"sortOrder\":1,\"fields\":{\"6fc29e80-1733-45a0-a3f1-df343c492679\":{\"required\":false,\"sortOrder\":1},\"80851629-6fae-4503-96e8-5c8e3a4f45fc\":{\"required\":false,\"sortOrder\":2},\"8150e700-7d4b-46d3-bd35-7a117b09f4c6\":{\"required\":true,\"sortOrder\":3}}}]}}}}},\"5ab65eb0-86ee-46cd-a5c4-0f35fc592a54\":{\"name\":\"Recipes\",\"handle\":\"recipes\",\"type\":\"channel\",\"enableVersioning\":true,\"propagationMethod\":\"all\",\"siteSettings\":{\"fb7d3d24-d0b3-43b9-aae4-a04c1d708262\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"recipes/{slug}\",\"template\":\"recipes/_entry\"}},\"entryTypes\":{\"7a2d2bae-7201-4a3d-8085-bc0122325109\":{\"name\":\"Recipes\",\"handle\":\"recipes\",\"hasTitleField\":true,\"titleLabel\":\"Title\",\"titleFormat\":\"\",\"sortOrder\":1,\"fieldLayouts\":{\"3583b5cc-3db2-4657-b3e6-16e925e5246f\":{\"tabs\":[{\"name\":\"Recipes\",\"sortOrder\":1,\"fields\":{\"2fac95e5-48ca-4adf-bcea-4ca0b533f9fb\":{\"required\":false,\"sortOrder\":1},\"336231e8-bcd8-4dbd-95ea-c275cb36ca01\":{\"required\":false,\"sortOrder\":5},\"80851629-6fae-4503-96e8-5c8e3a4f45fc\":{\"required\":false,\"sortOrder\":3},\"ba688f88-740b-45f1-a7fe-c2837a3d77d4\":{\"required\":false,\"sortOrder\":2},\"d3e10cc9-08a4-4a88-b65d-3c652a70c0a4\":{\"required\":false,\"sortOrder\":4}}}]}}}}}},\"fields\":{\"f628f774-47e3-4e0a-88bc-107dba1ec97f\":{\"name\":\"Drink Intro\",\"handle\":\"drinkIntro\",\"instructions\":\"A short introduction(one sentence) that describes the drink. Be creative!\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"84b9ad67-6b4b-47f7-aa3a-7e5ac492e294\"},\"8150e700-7d4b-46d3-bd35-7a117b09f4c6\":{\"name\":\"Page Copy\",\"handle\":\"pageCopy\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\ckeditor\\\\Field\",\"settings\":{\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"6737f1c7-7097-4b73-bc5c-a96fe970db9f\"},\"d64cd12a-0f2b-4525-ad11-863961d6f826\":{\"name\":\"News Excerpt\",\"handle\":\"newsExcerpt\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"937cf821-da4a-4991-9364-352d25374c0d\"},\"babb5e1c-6141-4b8d-9c4b-fe28888a98a6\":{\"name\":\"News Body\",\"handle\":\"newsBody\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\ckeditor\\\\Field\",\"settings\":{\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"937cf821-da4a-4991-9364-352d25374c0d\"},\"ba688f88-740b-45f1-a7fe-c2837a3d77d4\":{\"name\":\"Drink Image\",\"handle\":\"drinkImage\",\"instructions\":\"\",\"searchable\":false,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Assets\",\"settings\":{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:1c9a42a4-d16c-4471-9a31-0335cddeb9cd\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:1c9a42a4-d16c-4471-9a31-0335cddeb9cd\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":[\"volume:1c9a42a4-d16c-4471-9a31-0335cddeb9cd\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"Choose a drink image\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"},\"contentColumnType\":\"string\",\"fieldGroup\":\"84b9ad67-6b4b-47f7-aa3a-7e5ac492e294\"},\"6fc29e80-1733-45a0-a3f1-df343c492679\":{\"name\":\"Subtitle\",\"handle\":\"subtitle\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"4f0d80db-f209-4589-900c-1f70c099461b\"},\"80851629-6fae-4503-96e8-5c8e3a4f45fc\":{\"name\":\"Page Intro\",\"handle\":\"pageIntro\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"4f0d80db-f209-4589-900c-1f70c099461b\"},\"e157c0a3-3f28-4e85-bbf4-738dbaa4352b\":{\"name\":\"Date added to Menu\",\"handle\":\"dateAddedToMenu\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Date\",\"settings\":{\"showDate\":true,\"showTime\":false,\"minuteIncrement\":\"30\"},\"contentColumnType\":\"datetime\",\"fieldGroup\":\"84b9ad67-6b4b-47f7-aa3a-7e5ac492e294\"},\"336231e8-bcd8-4dbd-95ea-c275cb36ca01\":{\"name\":\"Recipe Contents\",\"handle\":\"recipeContents\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Matrix\",\"settings\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_recipecontents}}\",\"propagationMethod\":\"all\"},\"contentColumnType\":\"string\",\"fieldGroup\":\"71d51e2d-0393-4ac4-a505-146c76f8cd08\"},\"d3e10cc9-08a4-4a88-b65d-3c652a70c0a4\":{\"name\":\"Recipe Snapshot\",\"handle\":\"recipeSnapshot\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Table\",\"settings\":{\"addRowLabel\":\"Add a row\",\"maxRows\":\"\",\"minRows\":\"\",\"columns\":{\"col1\":{\"heading\":\"Snapshot Text\",\"handle\":\"snapshotText\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[{\"col1\":\"\"}],\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"71d51e2d-0393-4ac4-a505-146c76f8cd08\"},\"121fd9c8-73e4-4523-b030-fbaa1da82c48\":{\"name\":\"Style Description\",\"handle\":\"styleDescription\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"71d51e2d-0393-4ac4-a505-146c76f8cd08\"},\"2fac95e5-48ca-4adf-bcea-4ca0b533f9fb\":{\"name\":\"Style\",\"handle\":\"style\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Categories\",\"settings\":{\"allowLimit\":false,\"allowMultipleSources\":false,\"branchLimit\":\"1\",\"sources\":\"*\",\"source\":\"group:2dc127d1-bd07-4704-8fc5-b2415fb11c3d\",\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":\"Add a style\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"},\"contentColumnType\":\"string\",\"fieldGroup\":\"f8d20d5c-a2d7-4225-90d1-be815d4f75b8\"},\"f72ed375-1295-4998-abcf-517c581161a3\":{\"name\":\"Related Recipe\",\"handle\":\"relatedRecipe\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Entries\",\"settings\":{\"sources\":[\"section:5ab65eb0-86ee-46cd-a5c4-0f35fc592a54\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"1\",\"selectionLabel\":\"Add a recipe\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"},\"contentColumnType\":\"string\",\"fieldGroup\":\"84b9ad67-6b4b-47f7-aa3a-7e5ac492e294\"}},\"volumes\":{\"1c9a42a4-d16c-4471-9a31-0335cddeb9cd\":{\"name\":\"Drinks\",\"handle\":\"drinks\",\"type\":\"craft\\\\volumes\\\\Local\",\"hasUrls\":true,\"url\":\"//craftycoffee.test/images/drinks\",\"settings\":{\"path\":\"/var/www/code/web/images/drinks\"},\"sortOrder\":1}},\"imageTransforms\":{\"efb58c0f-8465-4415-8f3d-9f98cd5af0d6\":{\"format\":null,\"handle\":\"drinksHomepageThumb\",\"height\":200,\"interlace\":\"none\",\"mode\":\"crop\",\"name\":\"840x200 Thumb\",\"position\":\"center-center\",\"quality\":null,\"width\":840}},\"matrixBlockTypes\":{\"964f95e4-4484-4c09-a252-cd37a6b2959b\":{\"field\":\"336231e8-bcd8-4dbd-95ea-c275cb36ca01\",\"name\":\"Recipe Image\",\"handle\":\"recipeImage\",\"sortOrder\":1,\"fields\":{\"1cfc979f-6264-4c45-85ea-ad79f87f9eb9\":{\"name\":\"Image\",\"handle\":\"image\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Assets\",\"settings\":{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:1c9a42a4-d16c-4471-9a31-0335cddeb9cd\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:1c9a42a4-d16c-4471-9a31-0335cddeb9cd\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"Add an image for this block.\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"},\"contentColumnType\":\"string\",\"fieldGroup\":null},\"f412f156-8002-4931-a4f0-dc206bb85e99\":{\"name\":\"Image Caption\",\"handle\":\"imageCaption\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":null}},\"fieldLayouts\":{\"93def6a2-635b-40dc-97fc-59604b9a50bf\":{\"tabs\":[{\"name\":\"Content\",\"sortOrder\":1,\"fields\":{\"1cfc979f-6264-4c45-85ea-ad79f87f9eb9\":{\"required\":false,\"sortOrder\":1},\"f412f156-8002-4931-a4f0-dc206bb85e99\":{\"required\":false,\"sortOrder\":2}}}]}}},\"0fa0ad54-0e8d-4f37-b336-957e263967e3\":{\"field\":\"336231e8-bcd8-4dbd-95ea-c275cb36ca01\",\"name\":\"Recipe Tip\",\"handle\":\"recipeTip\",\"sortOrder\":2,\"fields\":{\"218b31f0-2be4-48c4-959e-5e1df6e127bb\":{\"name\":\"Tip Content\",\"handle\":\"tipContent\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":null}},\"fieldLayouts\":{\"c1bf4e2f-c977-4603-bf94-b273df9520b4\":{\"tabs\":[{\"name\":\"Content\",\"sortOrder\":1,\"fields\":{\"218b31f0-2be4-48c4-959e-5e1df6e127bb\":{\"required\":false,\"sortOrder\":1}}}]}}},\"65f1855f-8c0b-43f5-909a-c5abf2f5270e\":{\"field\":\"336231e8-bcd8-4dbd-95ea-c275cb36ca01\",\"name\":\"Recipe Copy\",\"handle\":\"recipeCopy\",\"sortOrder\":3,\"fields\":{\"6467dc35-6a5d-4c50-be9c-b09b1d183478\":{\"name\":\"Body Content\",\"handle\":\"bodyContent\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\ckeditor\\\\Field\",\"settings\":{\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":null}},\"fieldLayouts\":{\"03313e9b-c96f-4178-a864-99bb81889597\":{\"tabs\":[{\"name\":\"Content\",\"sortOrder\":1,\"fields\":{\"6467dc35-6a5d-4c50-be9c-b09b1d183478\":{\"required\":false,\"sortOrder\":1}}}]}}},\"f5d308a6-0a2e-47ac-b816-939fc5d880e9\":{\"field\":\"336231e8-bcd8-4dbd-95ea-c275cb36ca01\",\"name\":\"Recipe Steps\",\"handle\":\"recipeSteps\",\"sortOrder\":4,\"fields\":{\"4d295765-1951-42b9-9a9d-3fbb92f4b817\":{\"name\":\"Steps Title\",\"handle\":\"stepsTitle\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":null},\"a61de648-6f4f-4930-ab45-47d5f1bd9ce4\":{\"name\":\"Steps Content\",\"handle\":\"stepsContent\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Table\",\"settings\":{\"addRowLabel\":\"Add a row\",\"maxRows\":\"\",\"minRows\":\"\",\"columns\":{\"col1\":{\"heading\":\"Steps Instructions\",\"handle\":\"stepsInstructions\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[{\"col1\":\"\"}],\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":null}},\"fieldLayouts\":{\"160e85d7-36cc-41e5-9eee-704301d348a2\":{\"tabs\":[{\"name\":\"Content\",\"sortOrder\":1,\"fields\":{\"4d295765-1951-42b9-9a9d-3fbb92f4b817\":{\"required\":false,\"sortOrder\":1},\"a61de648-6f4f-4930-ab45-47d5f1bd9ce4\":{\"required\":false,\"sortOrder\":2}}}]}}},\"e1ef9a1b-38c9-4b73-9a68-798c9d11a74c\":{\"field\":\"336231e8-bcd8-4dbd-95ea-c275cb36ca01\",\"name\":\"Recipe Ingredients\",\"handle\":\"recipeIngredients\",\"sortOrder\":5,\"fields\":{\"dd8e2bc9-6a33-4f88-a03a-232f432b32bf\":{\"name\":\"Ingredients\",\"handle\":\"ingredients\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Table\",\"settings\":{\"addRowLabel\":\"Add a row\",\"maxRows\":\"\",\"minRows\":\"\",\"columns\":{\"col1\":{\"heading\":\"Amount\",\"handle\":\"amount\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Ingredient\",\"handle\":\"ingredient\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[{\"col1\":\"\",\"col2\":\"\"}],\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":null}},\"fieldLayouts\":{\"441b81fa-eb59-42ed-b1e1-0a974eddec8a\":{\"tabs\":[{\"name\":\"Content\",\"sortOrder\":1,\"fields\":{\"dd8e2bc9-6a33-4f88-a03a-232f432b32bf\":{\"required\":false,\"sortOrder\":1}}}]}}}},\"categoryGroups\":{\"2dc127d1-bd07-4704-8fc5-b2415fb11c3d\":{\"name\":\"Drink Styles\",\"handle\":\"drinkStyles\",\"structure\":{\"uid\":\"bbe54bf3-0fd0-4652-b3d1-6b691d6ef066\",\"maxLevels\":2},\"siteSettings\":{\"fb7d3d24-d0b3-43b9-aae4-a04c1d708262\":{\"hasUrls\":true,\"uriFormat\":\"styles/{slug}\",\"template\":\"styles/_category\"}},\"fieldLayouts\":{\"48a8e5c8-b8fd-4f48-a5a0-5adb11ae78ff\":{\"tabs\":[{\"name\":\"Style\",\"sortOrder\":1,\"fields\":{\"121fd9c8-73e4-4523-b030-fbaa1da82c48\":{\"required\":false,\"sortOrder\":1}}}]}}}}}', '[]', '3Jwow881KwQr', '2019-09-23 05:24:41', '2019-09-23 05:24:41', '7de2a0e5-1408-4edf-832d-13393e924b7a');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocks`
--

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixblocks`
--

INSERT INTO `matrixblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `deletedWithOwner`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(53, 50, 9, 3, 1, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '37669913-e386-4a35-ad15-d1b497593918'),
(54, 50, 9, 1, 2, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '53471a55-c0bd-4b0c-84b5-78054be88230'),
(55, 50, 9, 3, 3, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '7e6c631a-6829-4689-a4cc-89c451076169'),
(56, 50, 9, 5, 4, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '00919142-24e4-4528-ab49-c9e0113bd364'),
(57, 50, 9, 1, 5, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'd6cf659a-f9af-41d7-9388-1a314dc4fd36'),
(58, 50, 9, 2, 6, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'fadb200c-a5f9-4329-a94c-02135b1403ab'),
(59, 50, 9, 4, 7, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '5173e0d9-adde-4825-9515-df1e056cae02'),
(60, 50, 9, 3, 8, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '476141e2-3cb7-4228-87cb-071bed9b8d76'),
(61, 50, 9, 4, 9, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '50f802a6-b1c3-4a30-8fca-f3971270c55c'),
(62, 50, 9, 3, 10, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'd3eb1245-274d-4e5b-a322-4f9d667528a0'),
(63, 50, 9, 4, 11, 0, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'fb8a0c87-b803-4259-aa98-fda6d21398e9'),
(65, 64, 9, 3, 1, NULL, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '8345b6df-5c2e-417f-8e87-202b59a7f5dd'),
(66, 64, 9, 1, 2, NULL, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '1c715700-2da2-4b67-bfdd-636fb17ea246'),
(67, 64, 9, 3, 3, NULL, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '65f6ca43-19b5-485c-8392-3d01918f1021'),
(68, 64, 9, 5, 4, NULL, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '2f62ef0b-bcc1-4c92-92f9-f1347a3811e8'),
(69, 64, 9, 1, 5, NULL, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '914b4db8-f9fe-4d85-af17-40285b392874'),
(70, 64, 9, 2, 6, NULL, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'd9e32a45-d444-49c0-a3e2-0f0f5e3bb8ca'),
(71, 64, 9, 4, 7, NULL, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '60db5b9f-b6e7-41d2-9758-9feac82ab278'),
(72, 64, 9, 3, 8, NULL, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'f30d566d-8898-49b5-99e4-693d6d9a7298'),
(73, 64, 9, 4, 9, NULL, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'd8adaa38-69de-469f-b7a5-95c64b4e9f7d'),
(74, 64, 9, 3, 10, NULL, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '3e3d8216-e67a-480d-8beb-aba3cacfed06'),
(75, 64, 9, 4, 11, NULL, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'dd4f21c1-fa00-451f-bb9b-911911fcf4f2'),
(77, 76, 9, 3, 1, NULL, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '7e8ce363-e467-4cf5-95e7-99bb5ea5a8a9'),
(78, 76, 9, 1, 2, NULL, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '7ef2e335-2173-4ab2-b985-4a5027bb49a0'),
(79, 76, 9, 3, 3, NULL, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '909ec9f7-027e-454c-87ed-8f3ba17afd9e'),
(80, 76, 9, 5, 4, NULL, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '77e8a732-6b29-4db0-8aee-18b50cbd885c'),
(81, 76, 9, 1, 5, NULL, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '33203de5-2561-4e62-a826-2c80ff97c0ee'),
(82, 76, 9, 2, 6, NULL, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '6e17becd-14f4-46a8-917a-a13418f426bd'),
(83, 76, 9, 4, 7, NULL, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '4a439a3c-2456-4e51-9b21-aee28f0a7d2e'),
(84, 76, 9, 3, 8, NULL, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '6017687f-1b21-49a8-949c-24fc5e84a4b9'),
(85, 76, 9, 4, 9, NULL, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '5d0fe3ac-280a-4288-95f0-4c4bfcadaef3'),
(86, 76, 9, 3, 10, NULL, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '3c603b54-b479-4de1-ab47-52953e980f80'),
(87, 76, 9, 4, 11, NULL, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '9deef763-f835-49c5-ae37-6ea6d1c5bc5f'),
(89, 88, 9, 3, 1, NULL, '2019-09-24 11:43:00', '2019-09-24 11:43:00', 'af72b400-8866-4ef9-ba07-6d78ee7ff56f'),
(90, 88, 9, 1, 2, NULL, '2019-09-24 11:43:00', '2019-09-24 11:43:00', 'a7b62f9d-3a33-4ba9-8d25-212ed98477a4'),
(91, 88, 9, 3, 3, NULL, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '980e17b3-b24a-4d95-987b-e885b6158488'),
(92, 88, 9, 5, 4, NULL, '2019-09-24 11:43:00', '2019-09-24 11:43:00', 'e0a3766f-f98f-4be4-821b-51a8f57b3d9b'),
(93, 88, 9, 1, 5, NULL, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '20505327-685d-40bf-8850-709582841eff'),
(94, 88, 9, 2, 6, NULL, '2019-09-24 11:43:00', '2019-09-24 11:43:00', 'efdc6860-40e4-4fce-8cc8-f35387fa0456'),
(95, 88, 9, 4, 7, NULL, '2019-09-24 11:43:00', '2019-09-24 11:43:00', 'b2f610f3-d72d-4fdf-b40d-628d98540c67'),
(96, 88, 9, 3, 8, NULL, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '71a49ffa-cb24-4b74-8b54-269f34cf7d18'),
(97, 88, 9, 4, 9, NULL, '2019-09-24 11:43:00', '2019-09-24 11:43:00', 'e5ed742e-a0a8-4f93-bc2c-772418f1429e'),
(98, 88, 9, 3, 10, NULL, '2019-09-24 11:43:00', '2019-09-24 11:43:00', 'e7852212-e9a1-4e70-876c-2abe0b77216f'),
(99, 88, 9, 4, 11, NULL, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '1aea5c68-49b5-48bc-97de-211a714876aa'),
(101, 100, 9, 3, 1, NULL, '2019-09-24 11:44:57', '2019-09-24 11:44:57', 'e8979d67-1bb9-4881-9f7e-cc4aac2cfeeb'),
(102, 100, 9, 1, 2, NULL, '2019-09-24 11:44:57', '2019-09-24 11:44:57', 'e7ac8b3c-d4aa-45f2-88b1-b79d7d5bd333'),
(103, 100, 9, 3, 3, NULL, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '08477ed4-bad2-44ab-8960-b1dbae621dc9'),
(104, 100, 9, 5, 4, NULL, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '861c5f7f-2cc9-42b3-bc5f-684a4c4f3052'),
(105, 100, 9, 1, 5, NULL, '2019-09-24 11:44:57', '2019-09-24 11:44:57', 'e4654834-e8c6-4637-83ab-ca3584cb9bd1'),
(106, 100, 9, 2, 6, NULL, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '4dafafa9-bbaa-4b3a-af77-9f74178ebbbf'),
(107, 100, 9, 4, 7, NULL, '2019-09-24 11:44:57', '2019-09-24 11:44:57', 'f8062c50-24b3-456f-b00f-0fa1c18fd7f2'),
(108, 100, 9, 3, 8, NULL, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '8c5c15a2-73c7-4f6e-ab7d-229b0ef7d312'),
(109, 100, 9, 4, 9, NULL, '2019-09-24 11:44:57', '2019-09-24 11:44:57', 'c2c2f328-ce1c-4c9a-97d2-0fa74b5f0898'),
(110, 100, 9, 3, 10, NULL, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '0bc2abc2-d377-4ead-a865-258763e75d71'),
(111, 100, 9, 4, 11, NULL, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '8ee1332c-9a23-40ed-bbd0-a30b03e67916'),
(124, 50, 9, 3, 1, NULL, '2019-09-24 12:29:59', '2019-09-24 12:29:59', 'b7a240c5-f666-46f8-82fd-a173c841058a'),
(125, 50, 9, 3, 2, NULL, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '9e4cf088-7050-4eb4-8b4c-ed248993e9a2'),
(126, 50, 9, 1, 3, NULL, '2019-09-24 12:29:59', '2019-09-24 12:29:59', 'c1c3f849-bc9f-43f1-bca9-d890f5e813c5'),
(127, 50, 9, 5, 4, NULL, '2019-09-24 12:29:59', '2019-09-24 12:29:59', 'ed66b8ed-b05e-46fb-9fcc-7574e5545269'),
(128, 50, 9, 1, 5, NULL, '2019-09-24 12:29:59', '2019-09-24 12:29:59', 'eb5475d5-ba04-4e06-a77a-5578e9f3b37d'),
(129, 50, 9, 2, 6, NULL, '2019-09-24 12:29:59', '2019-09-24 12:29:59', 'a0b1fa33-a875-449d-8f84-e5e6e78bc1c8'),
(130, 50, 9, 4, 7, NULL, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '53656ace-ca3a-4c1b-a5ef-a872f6d66968'),
(131, 50, 9, 3, 8, NULL, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '31941061-c6f8-4454-ae46-abb6c027eed6'),
(132, 50, 9, 4, 9, NULL, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '7589b54a-9a95-4c06-9b4e-d74d45cf1cba'),
(133, 50, 9, 3, 10, NULL, '2019-09-24 12:29:59', '2019-09-24 12:29:59', 'c4e51c62-16c9-4dd7-bc30-161f231fc762'),
(134, 50, 9, 4, 11, NULL, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '689174a9-d387-4418-bb4c-4536777ac72f'),
(136, 135, 9, 3, 1, NULL, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '3f212e86-6235-439c-a4bd-4e7192823e02'),
(137, 135, 9, 3, 2, NULL, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '7e1accad-6e30-4a74-8f70-fac04b1ec38b'),
(138, 135, 9, 1, 3, NULL, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '691998ed-fa85-4265-9573-3f984185a5a4'),
(139, 135, 9, 5, 4, NULL, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '3cd11fae-e508-4c09-ad0c-98cdcf41fbf0'),
(140, 135, 9, 1, 5, NULL, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '8f46ba4a-37eb-4995-8544-afee34817512'),
(141, 135, 9, 2, 6, NULL, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '5164a889-88cd-4d57-97a4-ff71a1086d6b'),
(142, 135, 9, 4, 7, NULL, '2019-09-24 12:29:59', '2019-09-24 12:29:59', 'cd94e019-add9-47a5-8247-770315c07d94'),
(143, 135, 9, 3, 8, NULL, '2019-09-24 12:30:00', '2019-09-24 12:30:00', 'a8359834-735c-47a2-b312-10d01c279599'),
(144, 135, 9, 4, 9, NULL, '2019-09-24 12:30:00', '2019-09-24 12:30:00', '86d5dd19-072d-4d3b-9c5a-ba0ff3201202'),
(145, 135, 9, 3, 10, NULL, '2019-09-24 12:30:00', '2019-09-24 12:30:00', '441a46e0-f4c8-4008-bded-f05b9a521679'),
(146, 135, 9, 4, 11, NULL, '2019-09-24 12:30:00', '2019-09-24 12:30:00', '49ab146e-58fe-4d58-8e3c-5cde2c26c0d0'),
(150, 149, 9, 3, 1, NULL, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '69f07acf-0896-41b2-a475-ec216d4c4879'),
(151, 149, 9, 3, 2, NULL, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '8f5b5216-5e30-4d8c-87e3-e8768cefbc5c'),
(152, 149, 9, 1, 3, NULL, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '859ba2d1-c7ec-40e3-9a18-8e3be23af6d3'),
(153, 149, 9, 5, 4, NULL, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '4b50afe3-aedc-40df-8c94-0b393cf8dcb4'),
(154, 149, 9, 1, 5, NULL, '2019-09-25 08:03:05', '2019-09-25 08:03:05', 'ec51bbf6-c988-4695-ba4c-55b88c80f700'),
(155, 149, 9, 2, 6, NULL, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '908ddcec-c060-4779-a605-68e8f8141c13'),
(156, 149, 9, 4, 7, NULL, '2019-09-25 08:03:05', '2019-09-25 08:03:05', 'b8a6f1ff-ebf6-4bf2-abd5-2acd4e93bb65'),
(157, 149, 9, 3, 8, NULL, '2019-09-25 08:03:05', '2019-09-25 08:03:05', 'e3870ea0-92a4-48c3-bf6c-602c99fed138'),
(158, 149, 9, 4, 9, NULL, '2019-09-25 08:03:05', '2019-09-25 08:03:05', 'e63253db-0ed5-4ae1-b6d8-af42856cf5b9'),
(159, 149, 9, 3, 10, NULL, '2019-09-25 08:03:05', '2019-09-25 08:03:05', 'a1935d65-a0cf-4952-a848-adeba7352d6c'),
(160, 149, 9, 4, 11, NULL, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '0682f866-a4e7-48b8-897e-3de638c48754'),
(162, 161, 9, 3, 1, NULL, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '582fc8a9-bcfb-4bc7-8a2b-e93aa52e22f4'),
(163, 161, 9, 3, 2, NULL, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '789c2311-c6a0-4b63-a2e2-d0758ef3fc96'),
(164, 161, 9, 1, 3, NULL, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '7ccd9de5-2a6e-41ec-b572-bde7c68b7b09'),
(165, 161, 9, 5, 4, NULL, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '25da3ee2-319f-4b83-98b5-c6a0319ddc1e'),
(166, 161, 9, 1, 5, NULL, '2019-09-25 08:05:52', '2019-09-25 08:05:52', 'ea01987e-f945-4f75-990f-9cad3a36a57d'),
(167, 161, 9, 2, 6, NULL, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '1417cc67-761b-40db-8495-00c49a9fc750'),
(168, 161, 9, 4, 7, NULL, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '938783dc-62a7-4774-a31b-c389e6c13d98'),
(169, 161, 9, 3, 8, NULL, '2019-09-25 08:05:52', '2019-09-25 08:05:52', 'e7075a85-2b43-4945-86a4-6072fd85cb9b'),
(170, 161, 9, 4, 9, NULL, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '28ca9fc1-04db-4920-a8e7-332ce71b5141'),
(171, 161, 9, 3, 10, NULL, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '9010b298-32c3-4c1f-b574-e8fe7e0196ea'),
(172, 161, 9, 4, 11, NULL, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '2d4bc822-93a9-4ddb-ab52-72f1327b2732');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocktypes`
--

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixblocktypes`
--

INSERT INTO `matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 9, 4, 'Recipe Image', 'recipeImage', 1, '2019-09-24 10:53:09', '2019-09-24 10:53:09', '964f95e4-4484-4c09-a252-cd37a6b2959b'),
(2, 9, 5, 'Recipe Tip', 'recipeTip', 2, '2019-09-24 10:57:25', '2019-09-24 10:57:25', '0fa0ad54-0e8d-4f37-b336-957e263967e3'),
(3, 9, 6, 'Recipe Copy', 'recipeCopy', 3, '2019-09-24 10:57:25', '2019-09-24 10:57:25', '65f1855f-8c0b-43f5-909a-c5abf2f5270e'),
(4, 9, 7, 'Recipe Steps', 'recipeSteps', 4, '2019-09-24 11:03:38', '2019-09-24 11:03:38', 'f5d308a6-0a2e-47ac-b816-939fc5d880e9'),
(5, 9, 8, 'Recipe Ingredients', 'recipeIngredients', 5, '2019-09-24 11:03:38', '2019-09-24 11:03:38', 'e1ef9a1b-38c9-4b73-9a68-798c9d11a74c');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_recipecontents`
--

CREATE TABLE `matrixcontent_recipecontents` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_recipeImage_imageCaption` text,
  `field_recipeTip_tipContent` text,
  `field_recipeCopy_bodyContent` text,
  `field_recipeSteps_stepsTitle` text,
  `field_recipeSteps_stepsContent` text,
  `field_recipeIngredients_ingredients` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixcontent_recipecontents`
--

INSERT INTO `matrixcontent_recipecontents` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_recipeImage_imageCaption`, `field_recipeTip_tipContent`, `field_recipeCopy_bodyContent`, `field_recipeSteps_stepsTitle`, `field_recipeSteps_stepsContent`, `field_recipeIngredients_ingredients`) VALUES
(1, 46, 1, '2019-09-24 11:11:19', '2019-09-24 11:11:19', '92b1d100-99f1-46b0-8637-1c5cbf3b1062', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 47, 1, '2019-09-24 11:11:23', '2019-09-24 11:11:23', '7ef6cb14-f04a-41ca-a10a-e4faa9f93d56', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 48, 1, '2019-09-24 11:11:23', '2019-09-24 11:11:23', '90903074-66e9-4e92-990c-163d6f20305b', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 49, 1, '2019-09-24 11:11:32', '2019-09-24 11:11:32', '169b938d-c653-49a9-826b-098be303d15b', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 53, 1, '2019-09-24 11:29:29', '2019-09-24 11:44:57', '7d244ebc-7ffd-4666-98e3-6969ca5a5ff1', NULL, NULL, '<p>This is the body copy of the recipe.</p>', NULL, NULL, NULL),
(6, 54, 1, '2019-09-24 11:29:29', '2019-09-24 11:44:57', '4ba30444-a1af-4e5b-8d5f-819de554d0bc', 'Espresso is the best.', NULL, NULL, NULL, NULL, NULL),
(7, 55, 1, '2019-09-24 11:29:29', '2019-09-24 11:44:57', '66530df9-6d2a-4b95-9913-949823ef774d', NULL, NULL, '<p>I can have more copy right here.</p>', NULL, NULL, NULL),
(8, 56, 1, '2019-09-24 11:29:29', '2019-09-24 11:44:57', 'a2134f0a-df9d-4b88-a5c8-9dd1758c3a42', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"1 cup\",\"col2\":\"water\"},{\"col1\":\"18 grams\",\"col2\":\"Espresso beans\"},{\"col1\":\"1\",\"col2\":\"quality coffee grinder\"}]'),
(9, 57, 1, '2019-09-24 11:29:29', '2019-09-24 11:44:57', '92e696be-7aab-489d-9f1a-b68b542cb4f1', 'This is the caption', NULL, NULL, NULL, NULL, NULL),
(10, 58, 1, '2019-09-24 11:29:29', '2019-09-24 11:44:57', '8cf0e6d9-5fa1-4a29-90e3-30db91e2a786', NULL, 'Please only use a quality burr grinder for making espresso!', NULL, NULL, NULL, NULL),
(11, 59, 1, '2019-09-24 11:29:29', '2019-09-24 11:44:57', '02ed13ee-381e-43e4-95bb-ea5bf4efed60', NULL, NULL, NULL, 'Preparation', '[{\"col1\":\"Turn on your espresso machine.\"},{\"col1\":\"Buy good beans\"},{\"col1\":\"Alert friends and family that you need to focus.\"}]', NULL),
(12, 60, 1, '2019-09-24 11:29:29', '2019-09-24 11:44:57', '0c13ee20-8358-499b-a5ce-8afa57cb6408', NULL, NULL, '<p>This is more copy.</p><p> </p><p> </p>', NULL, NULL, NULL),
(13, 61, 1, '2019-09-24 11:29:29', '2019-09-24 11:44:57', 'a0da41c1-e25c-4600-951e-e4fc1d20ed26', NULL, NULL, NULL, 'Grinding the Beans', '[{\"col1\":\"Step one\"},{\"col1\":\"Step two\"},{\"col1\":\"step three\"}]', NULL),
(14, 62, 1, '2019-09-24 11:29:29', '2019-09-24 11:44:57', '0937a886-165b-42a8-b9ff-cf62a444c3db', NULL, NULL, '<p>even more copy -- long winded!</p>', NULL, NULL, NULL),
(15, 63, 1, '2019-09-24 11:29:29', '2019-09-24 11:44:57', 'ecf20100-a72e-45c7-bc87-253cbf69efa0', NULL, NULL, NULL, 'Extracting the Espresso Shot', '[{\"col1\":\"Step one\"},{\"col1\":\"Step Two\"},{\"col1\":\"Step Three\"}]', NULL),
(16, 65, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '3bcd8cf0-5c55-4013-90a7-bc65f12c31ea', NULL, NULL, '<p>This is the body copy of the recipe.</p>', NULL, NULL, NULL),
(17, 66, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'f300ee1a-a649-43b3-b727-88893573cdd5', 'Espresso is the best.', NULL, NULL, NULL, NULL, NULL),
(18, 67, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '3ce069ee-289e-41c4-8a5c-e29a8139a041', NULL, NULL, '<p>I can have more copy right here.</p>', NULL, NULL, NULL),
(19, 68, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'fca1d05d-a58f-4572-a0e7-83e69eb3ed0a', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"1 cup\",\"col2\":\"water\"},{\"col1\":\"18 grams\",\"col2\":\"Espresso beans\"},{\"col1\":\"1\",\"col2\":\"quality coffee grinder\"}]'),
(20, 69, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'aabee479-ad5c-4863-92e6-4d1d012ce6f3', 'This is the caption', NULL, NULL, NULL, NULL, NULL),
(21, 70, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'f6a3991a-14f7-4331-8c36-7f5c598a8369', NULL, 'Please only use a quality burr grinder for making espresso!', NULL, NULL, NULL, NULL),
(22, 71, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '74ea7d8e-bda9-48f1-8e73-00f04239a631', NULL, NULL, NULL, 'Preparation', '[{\"col1\":\"Turn on your espresso machine.\"},{\"col1\":\"Buy good beans\"},{\"col1\":\"Alert friends and family that you need to focus.\"}]', NULL),
(23, 72, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '28416dd1-6d7b-430c-ac80-c6c1da2846c7', NULL, NULL, '<p>This is more copy.</p><p> </p><p> </p>', NULL, NULL, NULL),
(24, 73, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'bd35964b-dfe9-4a0f-916a-c833d7476662', NULL, NULL, NULL, 'Grinding the Beans', '[{\"col1\":\"Step one\"},{\"col1\":\"Step two\"},{\"col1\":\"step three\"}]', NULL),
(25, 74, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '820f9e11-116a-49da-9884-67c037e14de6', NULL, NULL, '<p>even more copy -- long winded!</p>', NULL, NULL, NULL),
(26, 75, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '56de4c4d-a38d-4adf-99a4-b3a5b7539070', NULL, NULL, NULL, 'Extracting the Espresso Shot', '[{\"col1\":\"Step one\"},{\"col1\":\"Step Two\"},{\"col1\":\"Step Three\"}]', NULL),
(27, 77, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '3b8a201d-7273-47b5-8e12-7bb6552fbb16', NULL, NULL, '<p>This is the body copy of the recipe.</p>', NULL, NULL, NULL),
(28, 78, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '1dfd1140-6afa-44e2-8fb0-974fadcc8f0e', 'Espresso is the best.', NULL, NULL, NULL, NULL, NULL),
(29, 79, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '65ea03b9-204d-4eba-a9c3-e089dd1ae537', NULL, NULL, '<p>I can have more copy right here.</p>', NULL, NULL, NULL),
(30, 80, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '9ffeb39d-13b1-47e3-af32-ccceedee09b4', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"1 cup\",\"col2\":\"water\"},{\"col1\":\"18 grams\",\"col2\":\"Espresso beans\"},{\"col1\":\"1\",\"col2\":\"quality coffee grinder\"}]'),
(31, 81, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '3b8541f4-9b17-4e01-b7a9-8f31a2f5b016', 'This is the caption', NULL, NULL, NULL, NULL, NULL),
(32, 82, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', 'b6625e0c-d315-4409-8885-ffaeae7ee643', NULL, 'Please only use a quality burr grinder for making espresso!', NULL, NULL, NULL, NULL),
(33, 83, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '9ecabc72-1787-4c39-aaf6-ed519bd1b500', NULL, NULL, NULL, 'Preparation', '[{\"col1\":\"Turn on your espresso machine.\"},{\"col1\":\"Buy good beans\"},{\"col1\":\"Alert friends and family that you need to focus.\"}]', NULL),
(34, 84, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '9a16dc77-9af4-4d24-a7cf-05705d228c9a', NULL, NULL, '<p>This is more copy.</p><p> </p><p> </p>', NULL, NULL, NULL),
(35, 85, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', 'fd344cf9-b4cd-4955-80d1-4e598a092e77', NULL, NULL, NULL, 'Grinding the Beans', '[{\"col1\":\"Step one\"},{\"col1\":\"Step two\"},{\"col1\":\"step three\"}]', NULL),
(36, 86, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '37bff686-5c49-4928-9591-5aef91fc15b6', NULL, NULL, '<p>even more copy -- long winded!</p>', NULL, NULL, NULL),
(37, 87, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', 'a4fbd341-e00c-4c4a-92a5-4bc83315c5df', NULL, NULL, NULL, 'Extracting the Espresso Shot', '[{\"col1\":\"Step one\"},{\"col1\":\"Step Two\"},{\"col1\":\"Step Three\"}]', NULL),
(38, 89, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '38192138-2460-4147-8872-7485cff5cc22', NULL, NULL, '<p>This is the body copy of the recipe.</p>', NULL, NULL, NULL),
(39, 90, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '92940e25-6465-412e-aaa4-70e308f7e248', 'Espresso is the best.', NULL, NULL, NULL, NULL, NULL),
(40, 91, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '0cd995ea-2d9f-4f75-92d0-74b8bdcdef6f', NULL, NULL, '<p>I can have more copy right here.</p>', NULL, NULL, NULL),
(41, 92, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '9a529a1c-d106-48c7-a73a-ee14368a60f4', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"1 cup\",\"col2\":\"water\"},{\"col1\":\"18 grams\",\"col2\":\"Espresso beans\"},{\"col1\":\"1\",\"col2\":\"quality coffee grinder\"}]'),
(42, 93, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', 'cf2a5129-3ceb-4238-8ee6-d721e6beddc7', 'This is the caption', NULL, NULL, NULL, NULL, NULL),
(43, 94, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', 'f58ac479-18aa-488d-a11b-2e93f869d468', NULL, 'Please only use a quality burr grinder for making espresso!', NULL, NULL, NULL, NULL),
(44, 95, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '855c987b-7f81-4442-8a21-299247f27fa7', NULL, NULL, NULL, 'Preparation', '[{\"col1\":\"Turn on your espresso machine.\"},{\"col1\":\"Buy good beans\"},{\"col1\":\"Alert friends and family that you need to focus.\"}]', NULL),
(45, 96, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', 'f4f2cc7c-21de-4ecf-88bd-47bf2c8ed865', NULL, NULL, '<p>This is more copy.</p><p> </p><p> </p>', NULL, NULL, NULL),
(46, 97, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '3ce582a4-be91-4aca-a51a-d746d467829b', NULL, NULL, NULL, 'Grinding the Beans', '[{\"col1\":\"Step one\"},{\"col1\":\"Step two\"},{\"col1\":\"step three\"}]', NULL),
(47, 98, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', 'c9322931-d8a0-4fac-b9db-a723f48ed782', NULL, NULL, '<p>even more copy -- long winded!</p>', NULL, NULL, NULL),
(48, 99, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '0b81b32a-7cc9-43b6-b29e-a423abb56c7c', NULL, NULL, NULL, 'Extracting the Espresso Shot', '[{\"col1\":\"Step one\"},{\"col1\":\"Step Two\"},{\"col1\":\"Step Three\"}]', NULL),
(49, 101, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '50ef1636-1763-4d3b-98e9-221e843d3256', NULL, NULL, '<p>This is the body copy of the recipe.</p>', NULL, NULL, NULL),
(50, 102, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '73b0c658-68b2-4127-ae0c-cb97f2dcb412', 'Espresso is the best.', NULL, NULL, NULL, NULL, NULL),
(51, 103, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '819d3f61-4f99-418b-9050-8f62faceed36', NULL, NULL, '<p>I can have more copy right here.</p>', NULL, NULL, NULL),
(52, 104, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', 'bb668fdd-d83b-4510-b602-90e297a7a0d6', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"1 cup\",\"col2\":\"water\"},{\"col1\":\"18 grams\",\"col2\":\"Espresso beans\"},{\"col1\":\"1\",\"col2\":\"quality coffee grinder\"}]'),
(53, 105, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', 'dce9db8e-c858-44f3-a433-637dde7711ba', 'This is the caption', NULL, NULL, NULL, NULL, NULL),
(54, 106, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '630f4ee0-a43a-45b3-bd34-51e56d955117', NULL, 'Please only use a quality burr grinder for making espresso!', NULL, NULL, NULL, NULL),
(55, 107, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '231bbf39-612e-4691-a9e4-ba67c2f0bdef', NULL, NULL, NULL, 'Preparation', '[{\"col1\":\"Turn on your espresso machine.\"},{\"col1\":\"Buy good beans\"},{\"col1\":\"Alert friends and family that you need to focus.\"}]', NULL),
(56, 108, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '231ca002-a275-4222-b2d3-46136bb8a3a8', NULL, NULL, '<p>This is more copy.</p><p> </p><p> </p>', NULL, NULL, NULL),
(57, 109, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', 'f707178b-31ff-4e81-9ae9-98c462f73a29', NULL, NULL, NULL, 'Grinding the Beans', '[{\"col1\":\"Step one\"},{\"col1\":\"Step two\"},{\"col1\":\"step three\"}]', NULL),
(58, 110, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '1fbf07b1-8e0a-4a1e-a5f1-ac1300ba2496', NULL, NULL, '<p>even more copy -- long winded!</p>', NULL, NULL, NULL),
(59, 111, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '781c732d-9e75-4a5c-8f95-65b18716dc4d', NULL, NULL, NULL, 'Extracting the Espresso Shot', '[{\"col1\":\"Step one\"},{\"col1\":\"Step Two\"},{\"col1\":\"Step Three\"}]', NULL),
(71, 124, 1, '2019-09-24 12:29:59', '2019-09-25 08:05:52', 'd1860768-42a2-42c3-86d8-2ed71f30b17b', NULL, NULL, '<p>This is the body copy of the recipe.</p>', NULL, NULL, NULL),
(72, 125, 1, '2019-09-24 12:29:59', '2019-09-25 08:05:52', 'e0b429fe-2e12-45ad-b5a4-8eac10e869de', NULL, NULL, '<p>I can have more copy right here.</p>', NULL, NULL, NULL),
(73, 126, 1, '2019-09-24 12:29:59', '2019-09-25 08:05:52', '738db7f3-10fa-45e2-a88c-1da92e8dea7e', 'Espresso is the best.', NULL, NULL, NULL, NULL, NULL),
(74, 127, 1, '2019-09-24 12:29:59', '2019-09-25 08:05:52', 'df0bb2b1-3568-4c3d-9a21-763e03d7f956', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"1 cup\",\"col2\":\"water\"},{\"col1\":\"18 grams\",\"col2\":\"Espresso beans\"},{\"col1\":\"1\",\"col2\":\"quality coffee grinder\"}]'),
(75, 128, 1, '2019-09-24 12:29:59', '2019-09-25 08:05:52', '63478e76-7a03-4073-ae16-32ade2eb5063', 'This is the caption', NULL, NULL, NULL, NULL, NULL),
(76, 129, 1, '2019-09-24 12:29:59', '2019-09-25 08:05:52', '1f0603d6-7213-46fb-98e4-46ef77b9a949', NULL, 'Please only use a quality burr grinder for making espresso!', NULL, NULL, NULL, NULL),
(77, 130, 1, '2019-09-24 12:29:59', '2019-09-25 08:05:52', '806ea195-9e85-4d07-9d01-0ce6067c7b78', NULL, NULL, NULL, 'Preparation', '[{\"col1\":\"Turn on your espresso machine.\"},{\"col1\":\"Buy good beans\"},{\"col1\":\"Alert friends and family that you need to focus.\"}]', NULL),
(78, 131, 1, '2019-09-24 12:29:59', '2019-09-25 08:05:52', '823da547-f905-45c6-91a9-852327425263', NULL, NULL, '<p>This is more copy.</p><p> </p><p> </p>', NULL, NULL, NULL),
(79, 132, 1, '2019-09-24 12:29:59', '2019-09-25 08:05:52', '098cb73f-f77f-41a1-8b38-db9c928aa694', NULL, NULL, NULL, 'Grinding the Beans', '[{\"col1\":\"Step one\"},{\"col1\":\"Step two\"},{\"col1\":\"step three\"}]', NULL),
(80, 133, 1, '2019-09-24 12:29:59', '2019-09-25 08:05:52', '00fd0dc2-ebd6-4065-8811-48bde71ca32c', NULL, NULL, '<p>even more copy -- long winded!</p>', NULL, NULL, NULL),
(81, 134, 1, '2019-09-24 12:29:59', '2019-09-25 08:05:52', '1a1f36e5-db87-43f2-b29d-a0dd049471a5', NULL, NULL, NULL, 'Extracting the Espresso Shot', '[{\"col1\":\"Step one\"},{\"col1\":\"Step Two\"},{\"col1\":\"Step Three\"}]', NULL),
(82, 136, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '147db6db-1a7b-43c1-9efa-0f777b12a6c5', NULL, NULL, '<p>This is the body copy of the recipe.</p>', NULL, NULL, NULL),
(83, 137, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '5e94db70-3dbb-4a5c-8048-e7f43f70f619', NULL, NULL, '<p>I can have more copy right here.</p>', NULL, NULL, NULL),
(84, 138, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', 'f01f114f-4072-438e-a312-0f8544e2086a', 'Espresso is the best.', NULL, NULL, NULL, NULL, NULL),
(85, 139, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', 'a68b8c26-bd0d-4b51-b8ac-91baf5a4a050', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"1 cup\",\"col2\":\"water\"},{\"col1\":\"18 grams\",\"col2\":\"Espresso beans\"},{\"col1\":\"1\",\"col2\":\"quality coffee grinder\"}]'),
(86, 140, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', 'e372774c-b19f-4067-9435-8d3fee7cc959', 'This is the caption', NULL, NULL, NULL, NULL, NULL),
(87, 141, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '249be4a6-d05f-4652-ae61-cc471874f8fa', NULL, 'Please only use a quality burr grinder for making espresso!', NULL, NULL, NULL, NULL),
(88, 142, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', 'a5d1c46f-6005-4a09-9f7d-174e3b5ec5c5', NULL, NULL, NULL, 'Preparation', '[{\"col1\":\"Turn on your espresso machine.\"},{\"col1\":\"Buy good beans\"},{\"col1\":\"Alert friends and family that you need to focus.\"}]', NULL),
(89, 143, 1, '2019-09-24 12:30:00', '2019-09-24 12:30:00', 'c3382e0b-0f6c-4017-b54d-e0c0fe2ebdda', NULL, NULL, '<p>This is more copy.</p><p> </p><p> </p>', NULL, NULL, NULL),
(90, 144, 1, '2019-09-24 12:30:00', '2019-09-24 12:30:00', '40ed26ad-2db3-40b5-957c-5c614dd23070', NULL, NULL, NULL, 'Grinding the Beans', '[{\"col1\":\"Step one\"},{\"col1\":\"Step two\"},{\"col1\":\"step three\"}]', NULL),
(91, 145, 1, '2019-09-24 12:30:00', '2019-09-24 12:30:00', '023ad206-9451-4fac-9fe6-7ad06c84e261', NULL, NULL, '<p>even more copy -- long winded!</p>', NULL, NULL, NULL),
(92, 146, 1, '2019-09-24 12:30:00', '2019-09-24 12:30:00', 'ace7c14d-294e-4efb-8987-a100b8c0904a', NULL, NULL, NULL, 'Extracting the Espresso Shot', '[{\"col1\":\"Step one\"},{\"col1\":\"Step Two\"},{\"col1\":\"Step Three\"}]', NULL),
(93, 150, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '0f91a51b-d502-4e5a-a669-920b300c90d2', NULL, NULL, '<p>This is the body copy of the recipe.</p>', NULL, NULL, NULL),
(94, 151, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '5c7802f7-d96b-4aea-8c07-8e47d4437eb5', NULL, NULL, '<p>I can have more copy right here.</p>', NULL, NULL, NULL),
(95, 152, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '038d280c-7b2e-453d-8f44-1b479bf6335f', 'Espresso is the best.', NULL, NULL, NULL, NULL, NULL),
(96, 153, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', 'c5a481af-afeb-4979-9ade-b08f0aa8ed10', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"1 cup\",\"col2\":\"water\"},{\"col1\":\"18 grams\",\"col2\":\"Espresso beans\"},{\"col1\":\"1\",\"col2\":\"quality coffee grinder\"}]'),
(97, 154, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', 'f714d901-fe35-401f-8ca2-dcd200f1dd82', 'This is the caption', NULL, NULL, NULL, NULL, NULL),
(98, 155, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '25ff2ae3-a26b-45a4-8d17-4149657dc3b6', NULL, 'Please only use a quality burr grinder for making espresso!', NULL, NULL, NULL, NULL),
(99, 156, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '2f36d467-9cf4-4db8-b73a-787abf17e3f2', NULL, NULL, NULL, 'Preparation', '[{\"col1\":\"Turn on your espresso machine.\"},{\"col1\":\"Buy good beans\"},{\"col1\":\"Alert friends and family that you need to focus.\"}]', NULL),
(100, 157, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '470527ed-e4c8-4237-adb2-270882725b56', NULL, NULL, '<p>This is more copy.</p><p> </p><p> </p>', NULL, NULL, NULL),
(101, 158, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '2effc7a4-7b81-4d9d-bc0a-74d45b36bb0f', NULL, NULL, NULL, 'Grinding the Beans', '[{\"col1\":\"Step one\"},{\"col1\":\"Step two\"},{\"col1\":\"step three\"}]', NULL),
(102, 159, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', 'eb495a69-483b-4acb-a29b-daa59c0b2b06', NULL, NULL, '<p>even more copy -- long winded!</p>', NULL, NULL, NULL),
(103, 160, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', 'e2a28efd-2c90-4544-a6a1-75eb505c5bb2', NULL, NULL, NULL, 'Extracting the Espresso Shot', '[{\"col1\":\"Step one\"},{\"col1\":\"Step Two\"},{\"col1\":\"Step Three\"}]', NULL),
(104, 162, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', 'a87e2b4c-7993-4d20-8012-3c3a00ac1b5b', NULL, NULL, '<p>This is the body copy of the recipe.</p>', NULL, NULL, NULL),
(105, 163, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', 'd9598c70-31e2-4c3d-8e47-297c6fcec4cb', NULL, NULL, '<p>I can have more copy right here.</p>', NULL, NULL, NULL),
(106, 164, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '754c210c-36c3-42c1-98a2-1061f1016a76', 'Espresso is the best.', NULL, NULL, NULL, NULL, NULL),
(107, 165, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', 'feb994d7-edc5-452d-b6d3-1262368e97c7', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"1 cup\",\"col2\":\"water\"},{\"col1\":\"18 grams\",\"col2\":\"Espresso beans\"},{\"col1\":\"1\",\"col2\":\"quality coffee grinder\"}]'),
(108, 166, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', 'd6492f2c-dc54-4f16-b015-254db9b4c963', 'This is the caption', NULL, NULL, NULL, NULL, NULL),
(109, 167, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '551a1efd-78ff-4d24-8370-d02d0728e496', NULL, 'Please only use a quality burr grinder for making espresso!', NULL, NULL, NULL, NULL),
(110, 168, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', 'ca8ab3c3-67e5-4f97-94f1-a495374c173c', NULL, NULL, NULL, 'Preparation', '[{\"col1\":\"Turn on your espresso machine.\"},{\"col1\":\"Buy good beans\"},{\"col1\":\"Alert friends and family that you need to focus.\"}]', NULL),
(111, 169, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '44a772b4-a5fc-4967-9e90-ea6818f872d4', NULL, NULL, '<p>This is more copy.</p><p> </p><p> </p>', NULL, NULL, NULL),
(112, 170, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '37242451-995c-4833-a151-56d123f884d1', NULL, NULL, NULL, 'Grinding the Beans', '[{\"col1\":\"Step one\"},{\"col1\":\"Step two\"},{\"col1\":\"step three\"}]', NULL),
(113, 171, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '55493e8f-4602-4d72-a20a-d8717947aaad', NULL, NULL, '<p>even more copy -- long winded!</p>', NULL, NULL, NULL),
(114, 172, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '20fca18e-3c93-42c0-9f08-34c6dbfde584', NULL, NULL, NULL, 'Extracting the Espresso Shot', '[{\"col1\":\"Step one\"},{\"col1\":\"Step Two\"},{\"col1\":\"Step Three\"}]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `pluginId`, `type`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'app', 'Install', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '71cc871e-1d5c-47db-aa9b-2d80218bbcfc'),
(2, NULL, 'app', 'm150403_183908_migrations_table_changes', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'cb222212-536f-4dc6-839e-9e2e560cc5ee'),
(3, NULL, 'app', 'm150403_184247_plugins_table_changes', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'b3b84082-83c2-491e-b971-f29172000d9e'),
(4, NULL, 'app', 'm150403_184533_field_version', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '34be7b2b-415c-4def-bfda-c64b3a072107'),
(5, NULL, 'app', 'm150403_184729_type_columns', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '987ec25b-4ff5-4245-8268-3f124a5dd4a1'),
(6, NULL, 'app', 'm150403_185142_volumes', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'c82b6112-b4f6-4be7-9705-c2405ed291ac'),
(7, NULL, 'app', 'm150428_231346_userpreferences', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '1755b72f-3b24-4b50-b7bb-be95a936e81f'),
(8, NULL, 'app', 'm150519_150900_fieldversion_conversion', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'f091ea74-fa36-4970-b87b-462c02eb0527'),
(9, NULL, 'app', 'm150617_213829_update_email_settings', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'a23b9420-8a22-40ed-b577-b5c29dafe1bb'),
(10, NULL, 'app', 'm150721_124739_templatecachequeries', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'dc98b864-5d97-4ad4-95a5-52e2010c5b1a'),
(11, NULL, 'app', 'm150724_140822_adjust_quality_settings', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'b8c5430b-6b59-4328-89ca-4ec94a8dfdb2'),
(12, NULL, 'app', 'm150815_133521_last_login_attempt_ip', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '8bdab328-bd51-49d2-92d2-bc50fe62c6c7'),
(13, NULL, 'app', 'm151002_095935_volume_cache_settings', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '575c2c2b-0e62-4fa6-a565-a963c741481d'),
(14, NULL, 'app', 'm151005_142750_volume_s3_storage_settings', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'bb04cd0e-a3c6-41ff-93de-8de4d2a0e9e2'),
(15, NULL, 'app', 'm151016_133600_delete_asset_thumbnails', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'be7ee075-1053-4d3e-914f-05544a05ffff'),
(16, NULL, 'app', 'm151209_000000_move_logo', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '8f8d76ce-b812-4012-b2e3-a00b710f9eb3'),
(17, NULL, 'app', 'm151211_000000_rename_fileId_to_assetId', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '7cead695-afe4-41a9-b7d9-0077cc09daa7'),
(18, NULL, 'app', 'm151215_000000_rename_asset_permissions', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '27414fa0-a293-43df-bd50-3b66c753a4bf'),
(19, NULL, 'app', 'm160707_000001_rename_richtext_assetsource_setting', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'f9348fe2-c44c-4168-ac5e-ff42838c03ba'),
(20, NULL, 'app', 'm160708_185142_volume_hasUrls_setting', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '969aa3bc-2cf9-458f-9a01-d2c99ea4c44c'),
(21, NULL, 'app', 'm160714_000000_increase_max_asset_filesize', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '5792cecd-f507-40b2-8f59-8c54848a5b8f'),
(22, NULL, 'app', 'm160727_194637_column_cleanup', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '691c6cac-16f3-407a-9eae-af4d79d8bf99'),
(23, NULL, 'app', 'm160804_110002_userphotos_to_assets', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '42992628-b999-405f-bec5-4d76169b6921'),
(24, NULL, 'app', 'm160807_144858_sites', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'da43e00a-3b5c-46b1-b372-7543eeb7f706'),
(25, NULL, 'app', 'm160829_000000_pending_user_content_cleanup', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '30802c05-303e-4d8e-bc50-5b576619ff7f'),
(26, NULL, 'app', 'm160830_000000_asset_index_uri_increase', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'd4cd040e-dc24-404d-91dd-d54691b70057'),
(27, NULL, 'app', 'm160912_230520_require_entry_type_id', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2550d300-05fd-4a32-a406-cb6b80efe596'),
(28, NULL, 'app', 'm160913_134730_require_matrix_block_type_id', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '54d03c25-fc9e-4787-87e3-024ad61bae25'),
(29, NULL, 'app', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '9e7b27be-ec0e-4edb-913c-951d43176e59'),
(30, NULL, 'app', 'm160920_231045_usergroup_handle_title_unique', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'aacde15e-8cda-4b21-a4cb-f4f2c3838f55'),
(31, NULL, 'app', 'm160925_113941_route_uri_parts', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'b90be4f3-8b22-476d-9c42-447eb001128c'),
(32, NULL, 'app', 'm161006_205918_schemaVersion_not_null', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '952a4b9c-94e7-4084-958d-c339fa78346e'),
(33, NULL, 'app', 'm161007_130653_update_email_settings', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '65060597-5528-4108-b41d-f0993169bebe'),
(34, NULL, 'app', 'm161013_175052_newParentId', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '75bfc40b-507a-4c0d-ae5f-acbc318f7ecd'),
(35, NULL, 'app', 'm161021_102916_fix_recent_entries_widgets', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '9abfa0d7-ca63-4a6f-934f-f0b92899a900'),
(36, NULL, 'app', 'm161021_182140_rename_get_help_widget', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'e69eeea2-6565-4323-84e8-5bab90ef78a6'),
(37, NULL, 'app', 'm161025_000000_fix_char_columns', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2f4e8b55-0a8f-415e-9a8c-3fb7ca7becfe'),
(38, NULL, 'app', 'm161029_124145_email_message_languages', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'ab7838bb-bb4d-4e00-9c18-fb1f2c770f87'),
(39, NULL, 'app', 'm161108_000000_new_version_format', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'f0d327dd-30a7-4bfb-9750-1381a44a8179'),
(40, NULL, 'app', 'm161109_000000_index_shuffle', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '3df8837e-8d84-47f2-98b1-4ad209a73ede'),
(41, NULL, 'app', 'm161122_185500_no_craft_app', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '11f64f5b-7bef-41f5-bcc3-fd74b08e28e6'),
(42, NULL, 'app', 'm161125_150752_clear_urlmanager_cache', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'f810fb25-b167-4876-9ddc-cf7448c181e4'),
(43, NULL, 'app', 'm161220_000000_volumes_hasurl_notnull', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'f5818ad0-6668-4868-898b-857661e1d839'),
(44, NULL, 'app', 'm170114_161144_udates_permission', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '330e8e36-296c-4885-a003-c9aca3be2773'),
(45, NULL, 'app', 'm170120_000000_schema_cleanup', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '9e97d4ce-b7a6-4227-b639-f1b3013b0ff1'),
(46, NULL, 'app', 'm170126_000000_assets_focal_point', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '71a86ffd-4869-491e-a92c-0d47dd4adfc1'),
(47, NULL, 'app', 'm170206_142126_system_name', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'eea360d3-c159-4ffa-9e72-f07953f150b0'),
(48, NULL, 'app', 'm170217_044740_category_branch_limits', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'ed0e4a0b-34f9-4f4f-8b32-93aeea243fc0'),
(49, NULL, 'app', 'm170217_120224_asset_indexing_columns', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'e62c4563-dcbe-402d-9c31-d1382647f1c8'),
(50, NULL, 'app', 'm170223_224012_plain_text_settings', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'f1a87dcf-5fc9-4eab-ab7c-30d2d84c891a'),
(51, NULL, 'app', 'm170227_120814_focal_point_percentage', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'ceadf7d5-0fd9-410d-beab-011feced25c3'),
(52, NULL, 'app', 'm170228_171113_system_messages', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '9b28ee68-7ffb-4c90-8e47-9c523954b083'),
(53, NULL, 'app', 'm170303_140500_asset_field_source_settings', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '535bb12e-e2ae-48f8-b0b8-4af4374edd4f'),
(54, NULL, 'app', 'm170306_150500_asset_temporary_uploads', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'be175aa5-4cfa-43d9-a76b-465f828e462f'),
(55, NULL, 'app', 'm170523_190652_element_field_layout_ids', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'da1bc27f-7a14-42db-af41-5c8ec3239a5c'),
(56, NULL, 'app', 'm170612_000000_route_index_shuffle', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '805a2ff9-2954-459a-98e5-8fd09d914dd8'),
(57, NULL, 'app', 'm170621_195237_format_plugin_handles', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '3673b438-861d-430a-b093-224fb554ffe2'),
(58, NULL, 'app', 'm170630_161027_deprecation_line_nullable', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'f7f4e62e-bf49-430e-bdf7-fe2a673a0154'),
(59, NULL, 'app', 'm170630_161028_deprecation_changes', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '79a4dff5-905c-4743-9aa8-35bd82c0ffd8'),
(60, NULL, 'app', 'm170703_181539_plugins_table_tweaks', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '4434e0d2-43a9-481f-9e43-2c5faa721ba0'),
(61, NULL, 'app', 'm170704_134916_sites_tables', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '61b56e84-a437-4f64-8c55-d7c497b6835f'),
(62, NULL, 'app', 'm170706_183216_rename_sequences', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '9c7a2368-45bd-4aac-8d6a-6ef73e7bc2ea'),
(63, NULL, 'app', 'm170707_094758_delete_compiled_traits', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'aa80a2bc-bfb2-4bd6-90b1-b654a0f074b4'),
(64, NULL, 'app', 'm170731_190138_drop_asset_packagist', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'da1bd68a-bc69-41e4-b7c7-9452c47fa853'),
(65, NULL, 'app', 'm170810_201318_create_queue_table', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '1b2f1dd9-8293-419c-b624-f9e9bc285ca4'),
(66, NULL, 'app', 'm170816_133741_delete_compiled_behaviors', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '5e3d9b13-5328-423a-9530-6ad11a9ec666'),
(67, NULL, 'app', 'm170903_192801_longblob_for_queue_jobs', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '6841dd7b-2444-46d1-909a-35ab2a789007'),
(68, NULL, 'app', 'm170914_204621_asset_cache_shuffle', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'bde43531-1ddb-4089-8e92-061343b702bc'),
(69, NULL, 'app', 'm171011_214115_site_groups', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '448767d0-f2ce-40c9-8deb-58474658c0a2'),
(70, NULL, 'app', 'm171012_151440_primary_site', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '0a7e1782-9a97-41a1-8f5b-fb33c956ea09'),
(71, NULL, 'app', 'm171013_142500_transform_interlace', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '71bcd9e7-f906-4895-8a95-5bada79415e8'),
(72, NULL, 'app', 'm171016_092553_drop_position_select', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2de7aec3-e7da-48f6-8e06-f31f0dd3bf21'),
(73, NULL, 'app', 'm171016_221244_less_strict_translation_method', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '061d47be-8354-4bde-a7fe-311dc6a9d349'),
(74, NULL, 'app', 'm171107_000000_assign_group_permissions', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '524fac04-4cfb-4fe3-9dc1-9bd5060c9196'),
(75, NULL, 'app', 'm171117_000001_templatecache_index_tune', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '6e24dd32-0f11-466a-9d41-d098fe0e64cf'),
(76, NULL, 'app', 'm171126_105927_disabled_plugins', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '9a3ceeef-4f48-4e7a-8393-056ca0671ac7'),
(77, NULL, 'app', 'm171130_214407_craftidtokens_table', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '6a93d5bb-597e-462d-a5b6-dadd7c16d0f3'),
(78, NULL, 'app', 'm171202_004225_update_email_settings', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'd4823e8b-fa21-4c6a-b53b-9ef35226637e'),
(79, NULL, 'app', 'm171204_000001_templatecache_index_tune_deux', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '4685224e-d28f-4275-a31b-71abbe83d7bf'),
(80, NULL, 'app', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '0d99ae9f-0e7a-41df-bfe4-165348412ff1'),
(81, NULL, 'app', 'm171218_143135_longtext_query_column', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'ff0a3de5-c363-453d-b6f9-2ece9cfd19b8'),
(82, NULL, 'app', 'm171231_055546_environment_variables_to_aliases', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '5dd566ff-c5c1-4659-9e5c-e12f9f9ce028'),
(83, NULL, 'app', 'm180113_153740_drop_users_archived_column', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'cd115ab8-dcc6-4224-8eb5-edb54b21a1e3'),
(84, NULL, 'app', 'm180122_213433_propagate_entries_setting', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '4036a4dc-d70a-4467-b6aa-ed4830fdf782'),
(85, NULL, 'app', 'm180124_230459_fix_propagate_entries_values', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '8cfffcbc-e1c5-4249-a4e8-279bb08a5cf2'),
(86, NULL, 'app', 'm180128_235202_set_tag_slugs', '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-23 05:24:42', 'bbe15ffb-4d7e-49a4-a1a1-0c597e207d10'),
(87, NULL, 'app', 'm180202_185551_fix_focal_points', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '84819b29-c526-4150-88ed-319b9f6d95d5'),
(88, NULL, 'app', 'm180217_172123_tiny_ints', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2a0a489d-7b16-4923-8c9b-5aca50ff85ef'),
(89, NULL, 'app', 'm180321_233505_small_ints', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '31630a99-5c90-4197-a70d-3dede6658683'),
(90, NULL, 'app', 'm180328_115523_new_license_key_statuses', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '0b2cb1c6-3ae4-4f11-8c41-17f6c381fc3b'),
(91, NULL, 'app', 'm180404_182320_edition_changes', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'c251fea6-c49d-44f5-a249-7f2e9f3bf132'),
(92, NULL, 'app', 'm180411_102218_fix_db_routes', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '7496a824-5d0a-49a5-b02e-999eee402c67'),
(93, NULL, 'app', 'm180416_205628_resourcepaths_table', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'b2e5c0ab-1cab-43dd-9c6a-f0806caae942'),
(94, NULL, 'app', 'm180418_205713_widget_cleanup', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '4e3decae-2eaa-47c6-bf0c-6e4cfa49980a'),
(95, NULL, 'app', 'm180425_203349_searchable_fields', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'de63d317-5a62-4ac1-a17a-3b12cf10ea93'),
(96, NULL, 'app', 'm180516_153000_uids_in_field_settings', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'a9ca5d4f-1063-4c4e-a2a3-9bf3aab26e7e'),
(97, NULL, 'app', 'm180517_173000_user_photo_volume_to_uid', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '8071b2e7-ab49-47b4-9054-0cfb62436d35'),
(98, NULL, 'app', 'm180518_173000_permissions_to_uid', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '3250bb3a-b62f-495a-b4de-03968e8012c5'),
(99, NULL, 'app', 'm180520_173000_matrix_context_to_uids', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '1a8910d1-8057-44b1-bef5-8d68a480aedf'),
(100, NULL, 'app', 'm180521_173000_initial_yml_and_snapshot', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '8227f458-d89d-4721-a613-064737b86a35'),
(101, NULL, 'app', 'm180731_162030_soft_delete_sites', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'ea5c4648-1292-486a-aebd-3c913e543128'),
(102, NULL, 'app', 'm180810_214427_soft_delete_field_layouts', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '8ee629c9-4cad-4395-945d-3ac8f7b3e01e'),
(103, NULL, 'app', 'm180810_214439_soft_delete_elements', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'fcec9148-978c-4257-8e33-a16853373eb8'),
(104, NULL, 'app', 'm180824_193422_case_sensitivity_fixes', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '025c3248-07ad-44ce-b576-2c821048ebd2'),
(105, NULL, 'app', 'm180901_151639_fix_matrixcontent_tables', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'f0af9337-529e-4dfa-b4ce-72e7d4b5c577'),
(106, NULL, 'app', 'm180904_112109_permission_changes', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '20eccc31-21e7-42b9-9258-ebb8076f39a2'),
(107, NULL, 'app', 'm180910_142030_soft_delete_sitegroups', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '87200db5-1c41-4964-bd4b-f191523be8b1'),
(108, NULL, 'app', 'm181011_160000_soft_delete_asset_support', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '4e75f12b-19bb-452b-844f-736966dca1b3'),
(109, NULL, 'app', 'm181016_183648_set_default_user_settings', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'f599911d-ec37-4026-8584-3d392ddfc0c7'),
(110, NULL, 'app', 'm181017_225222_system_config_settings', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '562cf621-2336-451b-9ae7-b59697b3582b'),
(111, NULL, 'app', 'm181018_222343_drop_userpermissions_from_config', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '5d755fe7-2a2a-4d5f-a137-e31856cc92ac'),
(112, NULL, 'app', 'm181029_130000_add_transforms_routes_to_config', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'e83c75ce-ae4f-4172-8fc7-9324c0db64cc'),
(113, NULL, 'app', 'm181112_203955_sequences_table', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'd5c4aa46-63d0-4911-8f19-a2f2bfa9edf7'),
(114, NULL, 'app', 'm181121_001712_cleanup_field_configs', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2e10d0cc-5eef-4b0d-a116-81773ab93381'),
(115, NULL, 'app', 'm181128_193942_fix_project_config', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '7921414a-595f-487a-8424-03e48e98bc7b'),
(116, NULL, 'app', 'm181130_143040_fix_schema_version', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '8852c9e8-1f35-4cee-b7f8-48d33cef8268'),
(117, NULL, 'app', 'm181211_143040_fix_entry_type_uids', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '27fe20f2-c508-481a-b6d6-34cfcc481c44'),
(118, NULL, 'app', 'm181213_102500_config_map_aliases', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '46882667-6cad-4a10-b0af-02bbe2750930'),
(119, NULL, 'app', 'm181217_153000_fix_structure_uids', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '245443d5-574a-405a-9aca-d84f94ece090'),
(120, NULL, 'app', 'm190104_152725_store_licensed_plugin_editions', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '690d5ad2-3822-4130-ac1b-99ed771dc702'),
(121, NULL, 'app', 'm190108_110000_cleanup_project_config', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '410383fb-88f6-4afb-960a-a2e232a4a744'),
(122, NULL, 'app', 'm190108_113000_asset_field_setting_change', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'f8f8bd4b-3e21-4dd4-af1c-0c98c0949cdc'),
(123, NULL, 'app', 'm190109_172845_fix_colspan', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'f9bcaa4b-98f0-4bb7-9466-6187b0899920'),
(124, NULL, 'app', 'm190110_150000_prune_nonexisting_sites', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'beb2208c-eba2-4a15-a336-0701507fc3d2'),
(125, NULL, 'app', 'm190110_214819_soft_delete_volumes', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '47e883e2-c207-4bbb-8556-2ce39cc4be7d'),
(126, NULL, 'app', 'm190112_124737_fix_user_settings', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'a87d085f-0589-445a-b9dc-07a2d3cf8a3d'),
(127, NULL, 'app', 'm190112_131225_fix_field_layouts', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'd634176b-2979-43ad-8b37-a98009711ef1'),
(128, NULL, 'app', 'm190112_201010_more_soft_deletes', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'f97d4307-8b71-4af7-b221-a906fe30dc87'),
(129, NULL, 'app', 'm190114_143000_more_asset_field_setting_changes', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '84e1eedd-65fb-4c01-93ff-caacf7503eec'),
(130, NULL, 'app', 'm190121_120000_rich_text_config_setting', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '1065c3e0-3be7-4f59-8830-9611f08cd0bc'),
(131, NULL, 'app', 'm190125_191628_fix_email_transport_password', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '42176add-6348-41a2-a1b7-972ae8b4923f'),
(132, NULL, 'app', 'm190128_181422_cleanup_volume_folders', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'a232529d-2fac-493d-bb69-befdb270db99'),
(133, NULL, 'app', 'm190205_140000_fix_asset_soft_delete_index', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '1c0d7ebb-7f1b-4d75-8aea-db1c84db7373'),
(134, NULL, 'app', 'm190208_140000_reset_project_config_mapping', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '28245fe4-59a5-43fa-8484-d461fdb3cf27'),
(135, NULL, 'app', 'm190218_143000_element_index_settings_uid', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'cf9d609f-753f-41f6-ac97-7f2b868c527e'),
(136, NULL, 'app', 'm190312_152740_element_revisions', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '188ba421-c73c-425f-8226-287b648a9277'),
(137, NULL, 'app', 'm190327_235137_propagation_method', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'c5955003-c8bf-486c-aae8-e88d93758c79'),
(138, NULL, 'app', 'm190401_223843_drop_old_indexes', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'e37bc038-aa08-4d37-a17c-36ced25f6db8'),
(139, NULL, 'app', 'm190416_014525_drop_unique_global_indexes', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '59adf490-12a3-40a6-813d-7bd4e5e1e5db'),
(140, NULL, 'app', 'm190417_085010_add_image_editor_permissions', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '22dbe67a-e1c7-4ea9-a8e7-587363e4cc05'),
(141, NULL, 'app', 'm190502_122019_store_default_user_group_uid', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '94ab90ea-4ae7-4717-bf77-571f7a962cbe'),
(142, NULL, 'app', 'm190504_150349_preview_targets', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '4b916434-9ce7-4de2-9be3-81a480d841e2'),
(143, NULL, 'app', 'm190516_184711_job_progress_label', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '9e9f271e-7e0b-4149-b0cb-50b0487839c9'),
(144, NULL, 'app', 'm190523_190303_optional_revision_creators', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '3f71a0b9-35e5-45d4-82fd-748f46194fde'),
(145, NULL, 'app', 'm190529_204501_fix_duplicate_uids', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '3f00acb9-7672-4ecc-b01c-b8a9a564db77'),
(146, NULL, 'app', 'm190605_223807_unsaved_drafts', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '461f09c2-a8ce-4f19-878b-6dd9d21fa909'),
(147, NULL, 'app', 'm190607_230042_entry_revision_error_tables', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '4bfded50-6d7f-4e07-8239-a34e8c7149af'),
(148, NULL, 'app', 'm190608_033429_drop_elements_uid_idx', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '466104fa-665a-4f7b-b435-307d545a36bd'),
(149, NULL, 'app', 'm190617_164400_add_gqlschemas_table', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'c95f47f1-b553-4b1c-846c-064eac150712'),
(150, NULL, 'app', 'm190624_234204_matrix_propagation_method', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'e657057a-d055-44b6-8414-294cba5067ff'),
(151, NULL, 'app', 'm190711_153020_drop_snapshots', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'adc0e446-4855-440e-acf7-868e0b6e4241'),
(152, NULL, 'app', 'm190712_195914_no_draft_revisions', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '60cbf30d-228d-45d1-be4c-63cf8d34a0ef'),
(153, NULL, 'app', 'm190723_140314_fix_preview_targets_column', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', 'e3ab7489-1cda-4038-b207-45a87d15bb33'),
(154, NULL, 'app', 'm190820_003519_flush_compiled_templates', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '16348768-2638-4cca-a8f9-a44f6c784dc2'),
(155, NULL, 'app', 'm190823_020339_optional_draft_creators', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '2019-09-23 05:24:43', '9c8d8c7b-80f4-426d-ac22-90b80246b6c5');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'ckeditor', '1.0.0-beta.2', '1.0.0', 'unknown', NULL, '2019-09-23 06:31:03', '2019-09-23 06:31:03', '2019-09-25 07:27:10', '7297dd8a-ca90-4c16-9ffe-82e31f2b04fb');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `relations`
--

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 5, 16, NULL, 15, 1, '2019-09-23 10:25:39', '2019-09-23 10:25:39', '23f54d92-d5ac-4143-a407-4cf3b1d50a1d'),
(4, 5, 17, NULL, 15, 1, '2019-09-23 10:26:17', '2019-09-23 10:26:17', 'ddf5d7f2-d0fd-4322-9717-0de0376d524d'),
(6, 5, 18, NULL, 15, 1, '2019-09-23 10:26:32', '2019-09-23 10:26:32', 'ebf1717e-5a65-4879-bbf1-cca472a22a61'),
(10, 5, 37, NULL, 35, 1, '2019-09-24 05:04:49', '2019-09-24 05:04:49', '8bed1852-0d9b-4ed3-9930-e501e297b76f'),
(12, 5, 40, NULL, 35, 1, '2019-09-24 08:04:39', '2019-09-24 08:04:39', '81531f31-fe7b-49b0-ae07-c909a0876b99'),
(14, 5, 41, NULL, 35, 1, '2019-09-24 09:17:19', '2019-09-24 09:17:19', 'a86f259b-5a74-4d2b-b428-083b5c144c6a'),
(16, 5, 42, NULL, 15, 1, '2019-09-24 09:17:30', '2019-09-24 09:17:30', '5cfaccc8-bcab-4fe5-ad9d-6d150ae43947'),
(19, 10, 66, NULL, 15, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', '7c8e4809-3f84-4e4f-b8e4-8440d5c6d927'),
(20, 10, 69, NULL, 35, 1, '2019-09-24 11:29:29', '2019-09-24 11:29:29', 'ca4ae082-b1b4-4862-9644-cb4222e76dd8'),
(23, 10, 78, NULL, 15, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', 'c0c9d40b-8eb8-4950-8b7b-ba82338a99bd'),
(24, 10, 81, NULL, 35, 1, '2019-09-24 11:42:04', '2019-09-24 11:42:04', '350ecc31-d2e1-46df-bba6-96a7515d1f59'),
(28, 5, 88, NULL, 15, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '7ebfc8b2-7551-4b2a-9a5a-07f091b6e962'),
(29, 10, 90, NULL, 15, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', '85f82ac9-c0a8-4e42-adb4-9dec6652fcf6'),
(30, 10, 93, NULL, 35, 1, '2019-09-24 11:43:00', '2019-09-24 11:43:00', 'f22de8d1-a85a-46a5-bfe8-d4dffc5e74a1'),
(32, 10, 54, NULL, 15, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', 'ea0f574c-8222-4438-9e18-fc9da820c0f0'),
(33, 10, 57, NULL, 35, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', 'a11b6c8b-830f-4a9e-8eed-debf085f4048'),
(34, 5, 100, NULL, 15, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', 'f882494f-d5bb-4b21-8f5d-0595016b3985'),
(35, 10, 102, NULL, 15, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', 'e13f5b76-1227-4389-96e7-11b28c348441'),
(36, 10, 105, NULL, 35, 1, '2019-09-24 11:44:57', '2019-09-24 11:44:57', '661a97a4-59b4-4e00-91e2-ea98eabdc362'),
(52, 5, 135, NULL, 15, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '64bc38a5-7151-4072-816c-a8b2fa3baf72'),
(53, 10, 138, NULL, 15, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '34d7a33a-0826-4710-bdf8-f7e178fd6709'),
(54, 10, 140, NULL, 35, 1, '2019-09-24 12:29:59', '2019-09-24 12:29:59', '58894b1d-69a8-4fbd-9a5e-3a9f3126227e'),
(59, 19, 149, NULL, 148, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', 'c0c558b1-2e12-4271-9f74-521d524fb451'),
(60, 5, 149, NULL, 15, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '19a3f90a-6c6f-4842-8847-2d02d10279e4'),
(61, 10, 152, NULL, 15, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '628baa25-8cdb-480f-802f-fbc85f00c9bd'),
(62, 10, 154, NULL, 35, 1, '2019-09-25 08:03:05', '2019-09-25 08:03:05', '89e1ec46-144d-465a-bb9f-9faf0938fbb8'),
(63, 19, 50, NULL, 147, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', 'c700134b-d6b6-4e2b-9dd9-c22824223b50'),
(64, 5, 50, NULL, 15, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', 'bd93f208-91f8-4dbc-a660-dadaabb13584'),
(65, 10, 126, NULL, 15, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '92f77bd7-7488-446a-92e6-f2b04f125f8c'),
(66, 10, 128, NULL, 35, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '7d9c4298-f93f-478c-83f7-a84fc8f3000a'),
(67, 19, 161, NULL, 147, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '03e3e222-de49-48f4-86e8-7a42de68be93'),
(68, 5, 161, NULL, 15, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '16b7a430-14cc-44a8-89b9-7c1cb59ed3ff'),
(69, 10, 164, NULL, 15, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', '0339f246-2ed5-4858-9018-9e3699e65d28'),
(70, 10, 166, NULL, 35, 1, '2019-09-25 08:05:52', '2019-09-25 08:05:52', 'aa5e0819-1997-4879-9167-d07be3e486b9'),
(71, 19, 36, NULL, 148, 1, '2019-09-25 08:23:51', '2019-09-25 08:23:51', '6a7f190a-e9f2-410e-9d16-9dd2509a5952'),
(72, 5, 36, NULL, 35, 1, '2019-09-25 08:23:51', '2019-09-25 08:23:51', 'a752733d-e015-47ec-90a7-21f9c9bdb8cc'),
(73, 19, 173, NULL, 148, 1, '2019-09-25 08:23:51', '2019-09-25 08:23:51', '6a50d8b8-fdd1-4f68-afed-e41afecf1d83'),
(74, 5, 173, NULL, 35, 1, '2019-09-25 08:23:51', '2019-09-25 08:23:51', '73bc778e-569c-4741-ba34-81e132539d82'),
(77, 19, 174, NULL, 147, 1, '2019-09-25 08:24:05', '2019-09-25 08:24:05', '73d7804a-f913-468a-af4d-8c942a722c5e'),
(78, 5, 174, NULL, 15, 1, '2019-09-25 08:24:05', '2019-09-25 08:24:05', 'fdaecbad-3f85-4d46-bfe2-7a2a908f95fd'),
(79, 19, 4, NULL, 147, 1, '2019-09-25 08:53:25', '2019-09-25 08:53:25', '8bd67d93-fc79-4c50-b0aa-bc73085b52f7'),
(80, 5, 4, NULL, 15, 1, '2019-09-25 08:53:25', '2019-09-25 08:53:25', '1a145132-a1de-40fa-b56a-dc2841d876d0'),
(81, 20, 4, NULL, 50, 1, '2019-09-25 08:53:25', '2019-09-25 08:53:25', 'b9be0861-a73f-4570-aa4c-ae7288de224b'),
(82, 19, 175, NULL, 147, 1, '2019-09-25 08:53:25', '2019-09-25 08:53:25', 'dcc0bc20-ba20-41d8-bc4c-8d1ae6b737cb'),
(83, 5, 175, NULL, 15, 1, '2019-09-25 08:53:25', '2019-09-25 08:53:25', 'd586106d-430b-437c-bf80-fde98f54a07c'),
(84, 20, 175, NULL, 50, 1, '2019-09-25 08:53:25', '2019-09-25 08:53:25', '1b41d0e8-8898-4b7e-9b95-e08bf4ceaf3e');

-- --------------------------------------------------------

--
-- Table structure for table `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('118933b9', '@app/web/assets/recententries/dist'),
('17fc591f', '@app/web/assets/pluginstore/dist'),
('21a1dd16', '@app/web/assets/craftsupport/dist'),
('29d703ba', '@craft/web/assets/plugins/dist'),
('2f0e5fa8', '@craft/web/assets/editsection/dist'),
('2f3371d7', '@app/web/assets/updateswidget/dist'),
('3473f845', '@craft/web/assets/feed/dist'),
('347c1bfe', '@craft/web/assets/edittransform/dist'),
('36072cc', '@craft/web/assets/login/dist'),
('3769b20b', '@lib/jquery-ui'),
('393135b9', '@app/web/assets/installer/dist'),
('3d2dde60', '@app/web/assets/graphiql/dist'),
('3f6623e8', '@app/web/assets/updater/dist'),
('47df7526', '@lib/element-resize-detector'),
('4d30de8e', '@craft/web/assets/dashboard/dist'),
('50651f2b', '@lib'),
('52fa3de2', '@craft/web/assets/matrixsettings/dist'),
('5637ddfd', '@craft/web/assets/edituser/dist'),
('61cc6865', '@craft/web/assets/editcategory/dist'),
('65e78646', '@lib/jquery.payment'),
('684fded3', '@bower/jquery/dist'),
('6c37c08e', '@craft/ckeditor/assets/field/dist'),
('6d961c8e', '@craft/web/assets/editentry/dist'),
('6ebf56a5', '@app/web/assets/utilities/dist'),
('705b7e8c', '@app/web/assets/userpermissions/dist'),
('72b33072', '@craft/web/assets/deprecationerrors/dist'),
('75df5f8a', '@app/web/assets/feed/dist'),
('79c029ae', '@lib/velocity'),
('8508d32f', '@lib/timepicker'),
('8d02176b', '@app/web/assets/plugins/dist'),
('92707166', '@craft/web/assets/recententries/dist'),
('a747eaab', '@app/web/assets/edituser/dist'),
('acca3308', '@craft/web/assets/updateswidget/dist'),
('b09bcfd0', '@lib/selectize'),
('b66c501', '@craft/web/assets/craftsupport/dist'),
('b6b4ea99', '@craft/web/assets/cp/dist'),
('baf78b5a', '@lib/xregexp'),
('bbc8b14f', '@craft/web/assets/installer/dist'),
('cc41434', '@app/web/assets/cp/dist'),
('cc7ec850', '@craft/web/assets/fields/dist'),
('ccbb01bd', '@lib/fabric'),
('ce7523de', '@yii/debug/assets'),
('cfc95a78', '@app/web/assets/dashboard/dist'),
('d0254871', '@vendor/craftcms/ckeditor/lib/ckeditor/dist'),
('d32f0677', '@vendor/yiisoft/yii2/assets'),
('d9fdd583', '@lib/garnishjs'),
('e1c7d41f', '@lib/prismjs'),
('e341de96', '@lib/jquery-touch-events'),
('e46c7a25', '@craft/web/assets/tablesettings/dist'),
('e49d062a', '@craft/web/assets/matrix/dist'),
('e4e5e254', '@lib/picturefill'),
('ea40c205', '@lib/d3'),
('ec46d253', '@craft/web/assets/utilities/dist'),
('ee290419', '@craft/web/assets/userpermissions/dist'),
('fc0de3aa', '@lib/fileupload');

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`) VALUES
(1, 4, 1, 1, NULL),
(2, 7, 1, 1, NULL),
(3, 7, 1, 2, NULL),
(4, 7, 1, 3, NULL),
(5, 7, 1, 4, NULL),
(6, 4, 1, 2, NULL),
(7, 4, 1, 3, NULL),
(8, 4, 1, 4, NULL),
(9, 20, 1, 1, NULL),
(10, 23, 1, 1, NULL),
(11, 26, 1, 1, NULL),
(12, 20, 1, 2, 'Applied “Draft 1”'),
(13, 31, 1, 1, NULL),
(14, 20, 1, 3, NULL),
(15, 36, 1, 1, NULL),
(16, 36, 1, 2, NULL),
(17, 36, 1, 3, NULL),
(18, 4, 1, 5, NULL),
(19, 23, 1, 2, NULL),
(20, 26, 1, 2, NULL),
(21, 50, 1, 1, NULL),
(22, 50, 1, 2, NULL),
(23, 50, 1, 3, NULL),
(24, 50, 1, 4, NULL),
(25, 50, 1, 5, NULL),
(26, 50, 1, 6, 'Applied “Draft 1”'),
(27, 50, 1, 7, NULL),
(28, 50, 1, 8, NULL),
(29, 36, 1, 4, NULL),
(30, 4, 1, 6, NULL),
(31, 4, 1, 7, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' admin '),
(1, 'firstname', 0, 1, ' sajjan '),
(1, 'lastname', 0, 1, ' shrestha '),
(1, 'fullname', 0, 1, ' sajjan shrestha '),
(1, 'email', 0, 1, ' admin admin com '),
(1, 'slug', 0, 1, ''),
(4, 'slug', 0, 1, ' perfect espresso '),
(4, 'title', 0, 1, ' perfect espresso '),
(4, 'field', 1, 1, ' this is an introduction to the espresso drink '),
(4, 'field', 2, 1, ' lorem ipsum is simply dummy text of the printing and typesetting industry lorem ipsum has been the industry s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has survived not only five centuries but also the leap into electronic typesetting remaining essentially unchanged it was popularised in the 1960s with the release of letraset sheets containing lorem ipsum passages and more recently with desktop publishing software like aldus pagemaker including versions of lorem ipsum it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a more or less normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy various versions have evolved over the years sometimes by accident sometimes on purpose injected humour and the like '),
(7, 'slug', 0, 1, ' my first news '),
(7, 'title', 0, 1, ' crafty coffee is open for business '),
(7, 'field', 3, 1, ' if you re craving for best coffee in town we ve got it '),
(7, 'field', 4, 1, ' contrary to popular belief lorem ipsum is not simply random text it has roots in a piece of classical latin literature from 45 bc making it over 2000 years old richard mcclintock a latin professor at hampden sydney college in virginia looked up one of the more obscure latin words consectetur from a lorem ipsum passage and going through the cites of the word in classical literature discovered the undoubtable source lorem ipsum comes from sections 1 10 32 and 1 10 33 of de finibus bonorum et malorum the extremes of good and evil by cicero written in 45 bc this book is a treatise on the theory of ethics very popular during the renaissance the first line of lorem ipsum lorem ipsum dolor sit amet comes from a line in section 1 10 32 '),
(13, 'slug', 0, 1, ' homepage '),
(13, 'title', 0, 1, ' homepage '),
(15, 'filename', 0, 1, ' espresso shot jpg '),
(15, 'extension', 0, 1, ' jpg '),
(15, 'kind', 0, 1, ' image '),
(15, 'slug', 0, 1, ''),
(15, 'title', 0, 1, ' espresso shot '),
(20, 'slug', 0, 1, ' about '),
(20, 'title', 0, 1, ' about crafty coffee '),
(23, 'slug', 0, 1, ' locations '),
(23, 'title', 0, 1, ' locations '),
(26, 'slug', 0, 1, ' kathmanadu nepal '),
(26, 'title', 0, 1, ' kathmanadu nepal '),
(31, 'slug', 0, 1, ' founders '),
(31, 'title', 0, 1, ' founders '),
(20, 'field', 6, 1, ' how it happened '),
(20, 'field', 7, 1, ' everything you needed to know '),
(20, 'field', 2, 1, ' lorem ipsum is simply dummy text of the printing and typesetting industry lorem ipsum has been the industry s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has survived not only five centuries but also the leap into electronic typesetting remaining essentially unchanged it was popularised in the 1960s with the release of letraset sheets containing lorem ipsum passages and more recently with desktop publishing software like aldus pagemaker including versions of lorem ipsum contrary to popular belief lorem ipsum is not simply random text it has roots in a piece of classical latin literature from 45 bc making it over 2000 years old richard mcclintock a latin professor at hampden sydney college in virginia looked up one of the more obscure latin words consectetur from a lorem ipsum passage and going through the cites of the word in classical literature discovered the undoubtable source lorem ipsum comes from sections 1 10 32 and 1 10 33 of de finibus bonorum et malorum the extremes of good and evil by cicero written in 45 bc this book is a treatise on the theory of ethics very popular during the renaissance the first line of lorem ipsum lorem ipsum dolor sit amet comes from a line in section 1 10 32 the standard chunk of lorem ipsum used since the 1500s is reproduced below for those interested sections 1 10 32 and 1 10 33 from de finibus bonorum et malorum by cicero are also reproduced in their exact original form accompanied by english versions from the 1914 translation by h rackham '),
(23, 'field', 6, 1, ' where we are '),
(23, 'field', 7, 1, ' this is the intro '),
(23, 'field', 2, 1, ' page copy '),
(26, 'field', 6, 1, ' home of the momos '),
(26, 'field', 7, 1, ' page intro '),
(26, 'field', 2, 1, ' page copy '),
(31, 'field', 6, 1, ''),
(31, 'field', 7, 1, ''),
(31, 'field', 2, 1, ''),
(35, 'filename', 0, 1, ' iced coffee jpg '),
(35, 'extension', 0, 1, ' jpg '),
(35, 'kind', 0, 1, ' image '),
(35, 'slug', 0, 1, ''),
(35, 'title', 0, 1, ' iced coffee '),
(36, 'slug', 0, 1, ' japanese iced coffee '),
(36, 'title', 0, 1, ' japanese iced coffee '),
(36, 'field', 1, 1, ' the best iced coffed ever '),
(36, 'field', 2, 1, ' japanese iced coffee '),
(36, 'field', 8, 1, ''),
(4, 'field', 8, 1, ''),
(50, 'slug', 0, 1, ' perfect espresso '),
(50, 'title', 0, 1, ' perfect espresso '),
(50, 'field', 17, 1, ' this is the first thing this is the first thing this is the second thing this is the second thing this is the third thing this is the third thing '),
(50, 'field', 9, 1, ' this is the body copy of the recipe i can have more copy right here espresso shot espresso is the best 1 cup water 1 cup water 18 grams espresso beans 18 grams espresso beans 1 quality coffee grinder 1 quality coffee grinder iced coffee this is the caption please only use a quality burr grinder for making espresso turn on your espresso machine turn on your espresso machine buy good beans buy good beans alert friends and family that you need to focus alert friends and family that you need to focus preparation this is more copy step one step one step two step two step three step three grinding the beans even more copy long winded step one step one step two step two step three step three extracting the espresso shot '),
(53, 'slug', 0, 1, ''),
(53, 'field', 13, 1, ' this is the body copy of the recipe '),
(54, 'slug', 0, 1, ''),
(54, 'field', 10, 1, ' espresso shot '),
(54, 'field', 11, 1, ' espresso is the best '),
(55, 'slug', 0, 1, ''),
(55, 'field', 13, 1, ' i can have more copy right here '),
(56, 'slug', 0, 1, ''),
(56, 'field', 16, 1, ' 1 cup water 1 cup water 18 grams espresso beans 18 grams espresso beans 1 quality coffee grinder 1 quality coffee grinder '),
(57, 'slug', 0, 1, ''),
(57, 'field', 10, 1, ' iced coffee '),
(57, 'field', 11, 1, ' this is the caption '),
(58, 'slug', 0, 1, ''),
(58, 'field', 12, 1, ' please only use a quality burr grinder for making espresso '),
(59, 'slug', 0, 1, ''),
(59, 'field', 14, 1, ' preparation '),
(59, 'field', 15, 1, ' turn on your espresso machine turn on your espresso machine buy good beans buy good beans alert friends and family that you need to focus alert friends and family that you need to focus '),
(60, 'slug', 0, 1, ''),
(60, 'field', 13, 1, ' this is more copy '),
(61, 'slug', 0, 1, ''),
(61, 'field', 14, 1, ' grinding the beans '),
(61, 'field', 15, 1, ' step one step one step two step two step three step three '),
(62, 'slug', 0, 1, ''),
(62, 'field', 13, 1, ' even more copy long winded '),
(63, 'slug', 0, 1, ''),
(63, 'field', 14, 1, ' extracting the espresso shot '),
(63, 'field', 15, 1, ' step one step one step two step two step three step three '),
(50, 'field', 7, 1, ' this is the page intro '),
(124, 'slug', 0, 1, ''),
(124, 'field', 13, 1, ' this is the body copy of the recipe '),
(125, 'slug', 0, 1, ''),
(125, 'field', 13, 1, ' i can have more copy right here '),
(126, 'slug', 0, 1, ''),
(126, 'field', 10, 1, ' espresso shot '),
(126, 'field', 11, 1, ' espresso is the best '),
(127, 'slug', 0, 1, ''),
(127, 'field', 16, 1, ' 1 cup water 1 cup water 18 grams espresso beans 18 grams espresso beans 1 quality coffee grinder 1 quality coffee grinder '),
(128, 'slug', 0, 1, ''),
(128, 'field', 10, 1, ' iced coffee '),
(128, 'field', 11, 1, ' this is the caption '),
(129, 'slug', 0, 1, ''),
(129, 'field', 12, 1, ' please only use a quality burr grinder for making espresso '),
(130, 'slug', 0, 1, ''),
(130, 'field', 14, 1, ' preparation '),
(130, 'field', 15, 1, ' turn on your espresso machine turn on your espresso machine buy good beans buy good beans alert friends and family that you need to focus alert friends and family that you need to focus '),
(131, 'slug', 0, 1, ''),
(131, 'field', 13, 1, ' this is more copy '),
(132, 'slug', 0, 1, ''),
(132, 'field', 14, 1, ' grinding the beans '),
(132, 'field', 15, 1, ' step one step one step two step two step three step three '),
(133, 'slug', 0, 1, ''),
(133, 'field', 13, 1, ' even more copy long winded '),
(134, 'slug', 0, 1, ''),
(134, 'field', 14, 1, ' extracting the espresso shot '),
(134, 'field', 15, 1, ' step one step one step two step two step three step three '),
(147, 'slug', 0, 1, ' espresso '),
(147, 'title', 0, 1, ' espresso '),
(147, 'field', 18, 1, ' this is the style description '),
(148, 'slug', 0, 1, ' iced coffee '),
(148, 'title', 0, 1, ' iced coffee '),
(148, 'field', 18, 1, ' the best way to drink coffee in the summer '),
(50, 'field', 19, 1, ' espresso '),
(36, 'field', 19, 1, ' iced coffee '),
(4, 'field', 19, 1, ' espresso '),
(4, 'field', 20, 1, ' perfect espresso ');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'Drinks', 'drinks', 'channel', 1, 'all', NULL, '2019-09-23 08:04:35', '2019-09-25 08:53:08', NULL, '8915b08a-d928-4818-b4ae-8a56bb64ec9f'),
(2, NULL, 'News', 'news', 'channel', 1, 'all', NULL, '2019-09-23 08:54:03', '2019-09-23 09:26:23', NULL, 'c191f417-c2df-4c9a-8ddd-4ac8ffe29887'),
(3, NULL, 'Homepage', 'homepage', 'single', 0, 'all', NULL, '2019-09-23 09:44:03', '2019-09-23 09:44:03', NULL, '4a114baf-7c61-45f4-b75b-4c8732f2c51e'),
(4, 1, 'About', 'about', 'structure', 1, 'all', NULL, '2019-09-23 10:50:56', '2019-09-23 11:15:57', NULL, '573d91a5-2586-4dbb-9e33-5c10786e3729'),
(5, NULL, 'Recipes', 'recipes', 'channel', 1, 'all', NULL, '2019-09-24 10:22:07', '2019-09-25 08:00:47', NULL, '5ab65eb0-86ee-46cd-a5c4-0f35fc592a54');

-- --------------------------------------------------------

--
-- Table structure for table `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, 'drinks/{slug}', 'drinks/_entry', 1, '2019-09-23 08:04:35', '2019-09-25 08:53:08', '72dfe044-47ac-4a39-82bd-278e29fe3ec0'),
(2, 2, 1, 1, 'news/{slug}', 'news/_entry', 1, '2019-09-23 08:54:03', '2019-09-23 09:26:23', 'af1bce2a-6a65-424c-81c4-eb7ef007a5a2'),
(3, 3, 1, 1, '__home__', 'index.twig', 1, '2019-09-23 09:44:03', '2019-09-23 09:44:03', '8cd6123c-2bd6-4d6f-8889-6f140c1ff57f'),
(4, 4, 1, 1, '{parent.uri}/{slug}', 'about/_entry', 1, '2019-09-23 10:50:56', '2019-09-23 11:15:57', 'a6cc7888-d348-4ab7-9b2e-1a8aa628c5e7'),
(5, 5, 1, 1, 'recipes/{slug}', 'recipes/_entry', 1, '2019-09-24 10:22:07', '2019-09-25 08:00:47', 'bf842b68-864c-4051-b8f4-319d50d7cf2c');

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, '0BPAKFvgDxAMwqSAFYRO6RYErJ_eQ4tYLnY9H0zcYtGWuRO5n04tYdOVqZEOePCSPkqImVVjupmFQ_vfWlNfesyYX4xAMV4wVjaY', '2019-09-23 05:24:42', '2019-09-24 03:42:08', '305c99a6-b222-4873-b47a-d622442edb79'),
(2, 1, 'LmDN6_aFoDxjt8DvdsBopKAUIYGGRWokIWo1rRks1dBU5SJHVWYhBL-cyrHJ3dSbHhIeMsOC7NK1yi04BNp8-wsx3NVKdijibq76', '2019-09-24 03:44:05', '2019-09-24 05:26:32', '996b45b2-9c08-4146-b610-3ac5bf744d10'),
(3, 1, '-tT1Da-YevZBl-t_yFj_ZL2Hc02kZeKS03-eV7ali45AckXqdewMqxtQ8gNxr1HiA-Z7pu_aZI4s4bRn5cg-2IOeTJWF451DQoU8', '2019-09-24 06:26:33', '2019-09-24 12:30:01', 'd857be87-17d5-45b0-a98b-20cafcb4d4b9'),
(4, 1, 'vdrMpN3f8ZeN-UpLCkcw_sqwWePBQJ7QCuI0YK3sRFTdp-5GMqsuDKuk1e5861bqZZx-CvNhKz_qgtXsUEGIb1F6AytwMtaAAZeL', '2019-09-25 07:27:07', '2019-09-25 09:32:54', 'b2593c67-07a7-446e-992e-822fa50e12fd');

-- --------------------------------------------------------

--
-- Table structure for table `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Crafty Coffee', '2019-09-23 05:24:41', '2019-09-23 05:24:41', NULL, 'b87997ae-39a2-4200-97a4-e07c2d82f1a1');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'Crafty Coffee', 'default', 'en-US', 1, '$DEFAULT_SITE_URL', 1, '2019-09-23 05:24:42', '2019-09-23 05:24:42', NULL, 'fb7d3d24-d0b3-43b9-aae4-a04c1d708262');

-- --------------------------------------------------------

--
-- Table structure for table `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `structureelements`
--

INSERT INTO `structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, NULL, 1, 1, 26, 0, '2019-09-23 10:56:50', '2019-09-24 10:04:52', 'f10faebf-f8d9-44d9-b0a1-7603524f22a7'),
(3, 1, 20, 1, 2, 13, 1, '2019-09-23 10:58:06', '2019-09-24 10:04:52', '2c31db58-6f21-4063-8a98-7db043fdaa45'),
(4, 1, 21, 1, 14, 15, 1, '2019-09-23 10:58:06', '2019-09-24 10:04:52', 'b28eadab-0e6f-44da-af4f-bce69932d992'),
(6, 1, 23, 1, 3, 10, 2, '2019-09-23 10:58:19', '2019-09-24 10:04:52', '696993cc-2a99-46c2-add5-055689efe5cc'),
(7, 1, 24, 1, 16, 17, 1, '2019-09-23 10:58:19', '2019-09-24 10:04:52', '16cfce0f-763a-41b8-9d7b-409fcbdcfbde'),
(9, 1, 26, 1, 4, 5, 3, '2019-09-23 10:58:52', '2019-09-23 10:58:52', 'c3576d7b-24ed-45b0-a4b5-cf87043b9115'),
(10, 1, 27, 1, 6, 7, 3, '2019-09-23 10:58:52', '2019-09-23 10:58:52', '7a09ded2-7a52-4e56-8af5-822fa2fff208'),
(12, 1, 29, 1, 18, 19, 1, '2019-09-23 10:59:51', '2019-09-24 10:04:52', '4350e135-35dd-4867-a0bd-5c56452390ac'),
(14, 1, 31, 1, 20, 21, 1, '2019-09-23 11:07:02', '2019-09-24 10:04:52', 'fbd9791d-ff69-4f11-912d-d7b2aa68c961'),
(15, 1, 32, 1, 22, 23, 1, '2019-09-23 11:07:02', '2019-09-24 10:04:52', '08612fe7-5e92-4b67-a8e2-b5b4b15d997f'),
(16, 1, 33, 1, 24, 25, 1, '2019-09-23 11:17:32', '2019-09-24 10:04:52', 'bf41a3c6-b81d-49ee-8aab-516816a3767f'),
(17, 1, 43, 1, 11, 12, 2, '2019-09-24 10:03:09', '2019-09-24 10:04:52', '80e419d6-3bfe-46f8-8645-6b848cf1304a'),
(18, 1, 44, 1, 8, 9, 3, '2019-09-24 10:04:52', '2019-09-24 10:04:52', '4d4c063b-c2b2-4ad7-9b9c-93a4225fd962'),
(19, 2, NULL, 19, 1, 6, 0, '2019-09-25 07:51:55', '2019-09-25 08:02:58', '6e3438c4-44a2-4bb2-8d63-15a42ca0d758'),
(20, 2, 147, 19, 2, 3, 1, '2019-09-25 07:51:55', '2019-09-25 07:51:55', '7e2b8ca8-f5da-4a5a-aec4-e54bb199ab68'),
(21, 2, 148, 19, 4, 5, 1, '2019-09-25 08:02:58', '2019-09-25 08:02:58', '099ed390-51f9-4fe4-acd1-40687884b00e');

-- --------------------------------------------------------

--
-- Table structure for table `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `structures`
--

INSERT INTO `structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, '2019-09-23 10:50:56', '2019-09-23 10:50:56', NULL, '640c6320-37a6-42f0-a4ba-a0fd231c78d7'),
(2, 2, '2019-09-25 07:30:06', '2019-09-25 07:30:06', NULL, 'bbe54bf3-0fd0-4652-b3d1-6b691d6ef066');

-- --------------------------------------------------------

--
-- Table structure for table `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecacheelements`
--

CREATE TABLE `templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecachequeries`
--

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecaches`
--

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `route`, `usageLimit`, `usageCount`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 'eKa0_GkH_wN8lssEBL8ccsUqTI9lSr_S', '[\"preview/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"sourceId\":50,\"siteId\":1,\"draftId\":10,\"revisionId\":null}]', NULL, NULL, '2019-09-25 12:28:18', '2019-09-24 12:28:18', '2019-09-24 12:28:18', 'f3b0f83e-5d28-4508-a942-0cff82ff343d');

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\",\"weekStartDay\":\"1\",\"enableDebugToolbarForSite\":true,\"enableDebugToolbarForCp\":true,\"showExceptionView\":false}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'admin', NULL, 'Sajjan', 'Shrestha', 'admin@admin.com', '$2y$13$.7B3kV2JHNxNBkLguqjOlOw9t3vSk/I2FRXE51k.ifrOnZXS.glUe', 1, 0, 0, 0, '2019-09-25 07:27:07', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2019-09-23 05:24:42', '2019-09-23 05:24:42', '2019-09-25 07:27:07', '10cf11aa-ba31-4388-a910-6c60e9b79e54');

-- --------------------------------------------------------

--
-- Table structure for table `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `volumefolders`
--

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'Drinks', '', '2019-09-23 10:03:29', '2019-09-23 10:03:29', '2a22a7e6-1968-4b96-b3b6-7ad01e16a4da'),
(2, NULL, NULL, 'Temporary source', NULL, '2019-09-23 10:11:59', '2019-09-23 10:11:59', 'c510d213-5799-4271-8a56-6d413b3eb574'),
(3, 2, NULL, 'user_1', 'user_1/', '2019-09-23 10:11:59', '2019-09-23 10:11:59', 'c77aabe1-5e71-4aa9-9a9f-62691e41b8c2');

-- --------------------------------------------------------

--
-- Table structure for table `volumes`
--

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `volumes`
--

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'Drinks', 'drinks', 'craft\\volumes\\Local', 1, '//craftycoffee.test/images/drinks', '{\"path\":\"/var/www/code/web/images/drinks\"}', 1, '2019-09-23 10:03:29', '2019-09-23 10:03:29', NULL, '1c9a42a4-d16c-4471-9a31-0335cddeb9cd');

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}', 1, '2019-09-23 05:24:44', '2019-09-23 05:24:44', 'fc3b8fa0-70a9-472d-aab2-db010abf2aba'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2019-09-23 05:24:44', '2019-09-23 05:24:44', '8379c2c5-078d-4a83-bfb9-84d3048a2de7'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2019-09-23 05:24:44', '2019-09-23 05:24:44', 'ea896f36-2ef8-4d10-b2d6-ab874fc20aaa'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2019-09-23 05:24:44', '2019-09-23 05:24:44', 'ce104a77-4ced-4f09-a355-0dbcad117046');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  ADD KEY `assetindexdata_volumeId_idx` (`volumeId`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_filename_folderId_idx` (`filename`,`folderId`),
  ADD KEY `assets_folderId_idx` (`folderId`),
  ADD KEY `assets_volumeId_idx` (`volumeId`);

--
-- Indexes for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `assettransforms`
--
ALTER TABLE `assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assettransforms_name_unq_idx` (`name`),
  ADD UNIQUE KEY `assettransforms_handle_unq_idx` (`handle`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_groupId_idx` (`groupId`),
  ADD KEY `categories_parentId_fk` (`parentId`);

--
-- Indexes for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorygroups_name_idx` (`name`),
  ADD KEY `categorygroups_handle_idx` (`handle`),
  ADD KEY `categorygroups_structureId_idx` (`structureId`),
  ADD KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `categorygroups_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  ADD KEY `categorygroups_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `content_siteId_idx` (`siteId`),
  ADD KEY `content_title_idx` (`title`);

--
-- Indexes for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craftidtokens_userId_fk` (`userId`);

--
-- Indexes for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indexes for table `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drafts_creatorId_fk` (`creatorId`),
  ADD KEY `drafts_sourceId_fk` (`sourceId`);

--
-- Indexes for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elements_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `elements_type_idx` (`type`),
  ADD KEY `elements_enabled_idx` (`enabled`),
  ADD KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  ADD KEY `elements_draftId_fk` (`draftId`),
  ADD KEY `elements_revisionId_fk` (`revisionId`);

--
-- Indexes for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `elements_sites_siteId_idx` (`siteId`),
  ADD KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  ADD KEY `elements_sites_enabled_idx` (`enabled`),
  ADD KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entries_postDate_idx` (`postDate`),
  ADD KEY `entries_expiryDate_idx` (`expiryDate`),
  ADD KEY `entries_authorId_idx` (`authorId`),
  ADD KEY `entries_sectionId_idx` (`sectionId`),
  ADD KEY `entries_typeId_idx` (`typeId`),
  ADD KEY `entries_parentId_fk` (`parentId`);

--
-- Indexes for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  ADD KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  ADD KEY `entrytypes_sectionId_idx` (`sectionId`),
  ADD KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `entrytypes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldgroups_name_unq_idx` (`name`);

--
-- Indexes for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  ADD KEY `fieldlayoutfields_fieldId_idx` (`fieldId`);

--
-- Indexes for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `fieldlayouts_type_idx` (`type`);

--
-- Indexes for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayouttabs_layoutId_idx` (`layoutId`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fields_handle_context_unq_idx` (`handle`,`context`),
  ADD KEY `fields_groupId_idx` (`groupId`),
  ADD KEY `fields_context_idx` (`context`);

--
-- Indexes for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `globalsets_name_idx` (`name`),
  ADD KEY `globalsets_handle_idx` (`handle`),
  ADD KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gqlschemas_accessToken_unq_idx` (`accessToken`),
  ADD UNIQUE KEY `gqlschemas_name_unq_idx` (`name`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `matrixblocks_sortOrder_idx` (`sortOrder`);

--
-- Indexes for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  ADD UNIQUE KEY `matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  ADD KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `matrixcontent_recipecontents`
--
ALTER TABLE `matrixcontent_recipecontents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixcontent_recipecontents_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `matrixcontent_recipecontents_siteId_fk` (`siteId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `migrations_pluginId_idx` (`pluginId`),
  ADD KEY `migrations_type_pluginId_idx` (`type`,`pluginId`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plugins_handle_unq_idx` (`handle`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_fail_timeUpdated_timePushed_idx` (`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `queue_fail_timeUpdated_delay_idx` (`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `relations_sourceId_idx` (`sourceId`),
  ADD KEY `relations_targetId_idx` (`targetId`),
  ADD KEY `relations_sourceSiteId_idx` (`sourceSiteId`);

--
-- Indexes for table `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  ADD KEY `revisions_creatorId_fk` (`creatorId`);

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `searchindex_keywords_idx` (`keywords`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_handle_idx` (`handle`),
  ADD KEY `sections_name_idx` (`name`),
  ADD KEY `sections_structureId_idx` (`structureId`),
  ADD KEY `sections_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  ADD KEY `sections_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_uid_idx` (`uid`),
  ADD KEY `sessions_token_idx` (`token`),
  ADD KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `sessions_userId_idx` (`userId`);

--
-- Indexes for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indexes for table `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sitegroups_name_idx` (`name`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sites_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `sites_handle_idx` (`handle`),
  ADD KEY `sites_sortOrder_idx` (`sortOrder`),
  ADD KEY `sites_groupId_fk` (`groupId`);

--
-- Indexes for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  ADD KEY `structureelements_root_idx` (`root`),
  ADD KEY `structureelements_lft_idx` (`lft`),
  ADD KEY `structureelements_rgt_idx` (`rgt`),
  ADD KEY `structureelements_level_idx` (`level`),
  ADD KEY `structureelements_elementId_idx` (`elementId`);

--
-- Indexes for table `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `structures_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  ADD KEY `systemmessages_language_idx` (`language`);

--
-- Indexes for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taggroups_name_idx` (`name`),
  ADD KEY `taggroups_handle_idx` (`handle`),
  ADD KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_groupId_idx` (`groupId`);

--
-- Indexes for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  ADD KEY `templatecacheelements_elementId_idx` (`elementId`);

--
-- Indexes for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  ADD KEY `templatecachequeries_type_idx` (`type`);

--
-- Indexes for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `templatecaches_siteId_idx` (`siteId`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unq_idx` (`token`),
  ADD KEY `tokens_expiryDate_idx` (`expiryDate`);

--
-- Indexes for table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_handle_unq_idx` (`handle`),
  ADD UNIQUE KEY `usergroups_name_unq_idx` (`name`);

--
-- Indexes for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `usergroups_users_userId_idx` (`userId`);

--
-- Indexes for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_name_unq_idx` (`name`);

--
-- Indexes for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `userpermissions_usergroups_groupId_idx` (`groupId`);

--
-- Indexes for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `userpermissions_users_userId_idx` (`userId`);

--
-- Indexes for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_uid_idx` (`uid`),
  ADD KEY `users_verificationCode_idx` (`verificationCode`),
  ADD KEY `users_email_idx` (`email`),
  ADD KEY `users_username_idx` (`username`),
  ADD KEY `users_photoId_fk` (`photoId`);

--
-- Indexes for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  ADD KEY `volumefolders_parentId_idx` (`parentId`),
  ADD KEY `volumefolders_volumeId_idx` (`volumeId`);

--
-- Indexes for table `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `volumes_name_idx` (`name`),
  ADD KEY `volumes_handle_idx` (`handle`),
  ADD KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `volumes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widgets_userId_idx` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `assettransforms`
--
ALTER TABLE `assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `matrixcontent_recipecontents`
--
ALTER TABLE `matrixcontent_recipecontents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecaches`
--
ALTER TABLE `templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `matrixcontent_recipecontents`
--
ALTER TABLE `matrixcontent_recipecontents`
  ADD CONSTRAINT `matrixcontent_recipecontents_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixcontent_recipecontents_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `migrations`
--
ALTER TABLE `migrations`
  ADD CONSTRAINT `migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
