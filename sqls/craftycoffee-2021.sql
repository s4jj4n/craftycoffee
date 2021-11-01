-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql7
-- Generation Time: Nov 01, 2021 at 01:29 PM
-- Server version: 5.7.35
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(22, 1, 1, 'boy-6398465_1920.jpg', 'image', 1200, 1920, 364300, NULL, 0, 0, '2021-10-30 11:45:15', '2021-10-30 11:45:15', '2021-10-30 11:45:15', '71d3625e-088a-482f-a3e8-c4a292737328'),
(23, 1, 1, 'espresso-shot.jpg', 'image', 1200, 689, 52681, NULL, NULL, NULL, '2021-10-30 12:17:18', '2021-10-30 12:17:18', '2021-10-30 12:17:18', '9ae99660-05da-43e5-ad7e-843811ca9ca0'),
(25, 1, 1, 'iced-coffee.jpg', 'image', 1200, 971, 73655, NULL, NULL, NULL, '2021-10-30 13:21:21', '2021-10-30 13:21:21', '2021-10-30 13:21:21', '877c7fa8-a64c-4790-9cc0-235e4408139e');

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
(1, '840x200 Thumb', 'EightFortyTwoHundredThumb', 'crop', 'center-center', 840, 200, NULL, NULL, 'none', '2021-10-30 13:20:50', '2021-10-30 13:20:50', '2021-10-30 13:20:50', '15ca9281-396b-460e-9aa5-a8f1bd2cc99d');

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
(503, 1, NULL, NULL, '2021-10-31 16:12:37', '2021-10-31 16:12:37', 'fe0cbb01-37ac-4023-abe8-000138b4c336'),
(527, 1, NULL, NULL, '2021-11-01 07:40:17', '2021-11-01 07:40:17', '2893ab4e-9249-49c3-8da8-1e720c4256bc');

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
(1, 2, 11, 'Drink Styles', 'drinkStyles', '2021-10-31 16:08:17', '2021-10-31 16:11:36', NULL, 'a87e584f-142b-48fd-ae9b-6ec0352fd211');

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
(1, 1, 1, 1, 'styles/{slug}', 'styles/_entry', '2021-10-31 16:08:17', '2021-10-31 16:11:36', '866968c5-af7d-4ae7-86a1-35dd9dc1b842');

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
  `field_introduction` text,
  `field_pageCopy` text,
  `field_excerpt` text,
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

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_introduction`, `field_pageCopy`, `field_excerpt`, `field_newsBody`, `field_subtitle`, `field_pageIntro`, `field_dateAddedToMenu`, `field_recipeSnapshot`, `field_styleDescription`) VALUES
(1, 1, 1, NULL, '2021-10-08 15:12:57', '2021-10-31 10:29:10', '093e21aa-1796-43cc-b768-35efa5e14d60', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 1, NULL, '2021-10-30 07:51:20', '2021-10-30 07:51:20', '885052bc-ded9-430b-b1bb-5fdcac196602', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 1, NULL, '2021-10-30 08:01:17', '2021-10-30 08:01:17', 'cce3be2f-3524-43cf-ae98-e4164295b48d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, 1, NULL, '2021-10-30 08:41:11', '2021-10-30 08:41:11', '0feb54cb-df11-4f9b-8ba1-9f967adf1601', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 5, 1, NULL, '2021-10-30 08:49:26', '2021-10-30 08:49:26', '72098e59-1837-4416-84b6-7e60253a4b87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 6, 1, NULL, '2021-10-30 08:49:31', '2021-10-30 08:49:31', '8451e00b-a102-43f7-a1d8-de1a16567477', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 8, 1, 'Perfect Espresso', '2021-10-30 08:54:36', '2021-11-01 07:49:38', 'dddebbea-79ce-4ce1-be9f-dcbfa34cf95d', 'The best shot you\'ve ever had.', '<p>CraftQuest is a comprehensive learning resource with <em>unlimited access</em> to video training to help you with your current and future projects. Updated weekly with new tutorials on modern web development.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p><p>CraftQuest can help you skill up for a new job or learn the skills to finish an important project. We are always here with new content every week to help you reach your goals.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p><p>We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p>', NULL, NULL, NULL, NULL, '2021-10-29 18:15:00', NULL, NULL),
(9, 9, 1, 'Espresso', '2021-10-30 08:54:36', '2021-10-30 08:54:36', 'd109e0e1-a652-4e1d-a424-bbc865306974', 'News article lede or summary.', '<p>CraftQuest is a comprehensive learning resource with <em>unlimited access</em> to video training to help you with your current and future projects. Updated weekly with new tutorials on modern web development.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p><p>CraftQuest can help you skill up for a new job or learn the skills to finish an important project. We are always here with new content every week to help you reach your goals.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p><p>We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 10, 1, 'Espresso', '2021-10-30 08:54:51', '2021-10-30 08:54:51', 'd3101e4f-3090-46dc-bfdf-07e05e06bdb3', 'News article lede or summary.', '<p>CraftQuest is a comprehensive learning resource with <em>unlimited access</em> to video training to help you with your current and future projects. Updated weekly with new tutorials on modern web development.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p><p>CraftQuest can help you skill up for a new job or learn the skills to finish an important project. We are always here with new content every week to help you reach your goals.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p><p>We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 11, 1, NULL, '2021-10-30 08:56:16', '2021-10-30 08:56:16', '9710e6ad-ef8a-43c6-9def-3cb181b374e8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 13, 1, 'New coffee coming soon', '2021-10-30 08:58:07', '2021-10-30 08:58:07', '08dc20db-5935-48e9-b86d-4129ae4899d1', NULL, NULL, 'Check out the new coffee style coming to Crafty Coffee!', '<p>Redactor fields use <a href=\"http://htmlpurifier.org/\">HTML Purifier</a> to ensure that no malicious code makes it into its field values, to prevent XSS attacks and other vulnerabilities.</p><p>You can create custom HTML Purifier configs that will be available to your Redactor fields. They should be created as JSON files in your <code>config/htmlpurifier/</code> folder.</p><p>Copy <a href=\"https://github.com/craftcms/craft/blob/master/config/htmlpurifier/Default.json\">Default.json</a> as a starting point, which is the default config that Redactor fields use if no custom HTML Purifier config is selected.</p><p>See the <a href=\"http://htmlpurifier.org/live/configdoc/plain.html\">HTML Purifier documentation</a> for a list of available config optio</p>', NULL, NULL, NULL, NULL, NULL),
(14, 14, 1, 'New coffee coming soon', '2021-10-30 08:58:08', '2021-10-30 08:58:08', '1ddf311b-08df-491f-8aec-3feefb08599d', NULL, NULL, 'Check out the new coffee style coming to Crafty Coffee!', '<p>Redactor fields use <a href=\"http://htmlpurifier.org/\">HTML Purifier</a> to ensure that no malicious code makes it into its field values, to prevent XSS attacks and other vulnerabilities.</p><p>You can create custom HTML Purifier configs that will be available to your Redactor fields. They should be created as JSON files in your <code>config/htmlpurifier/</code> folder.</p><p>Copy <a href=\"https://github.com/craftcms/craft/blob/master/config/htmlpurifier/Default.json\">Default.json</a> as a starting point, which is the default config that Redactor fields use if no custom HTML Purifier config is selected.</p><p>See the <a href=\"http://htmlpurifier.org/live/configdoc/plain.html\">HTML Purifier documentation</a> for a list of available config optio</p>', NULL, NULL, NULL, NULL, NULL),
(15, 15, 1, 'Crafty Coffee', '2021-10-30 09:02:53', '2021-10-30 15:36:31', '69e96378-1208-461f-8fa6-61ffc13ad68c', NULL, NULL, NULL, NULL, 'If we wrote it down, you can make it at home.', NULL, NULL, NULL, NULL),
(16, 16, 1, 'Homepage', '2021-10-30 09:02:53', '2021-10-30 09:02:53', 'd9b2c165-6103-4816-b4d5-a62b88720eb9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 17, 1, 'Homepage', '2021-10-30 09:03:04', '2021-10-30 09:03:04', 'e41e2203-f67f-4274-ae8e-0ae1071a3920', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 18, 1, 'Homepage', '2021-10-30 09:03:05', '2021-10-30 09:03:05', '59d17ca2-84ec-4d6e-a0d2-176fdcba112a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 19, 1, 'Homepage', '2021-10-30 09:04:42', '2021-10-30 09:04:42', 'ed073eea-d207-4f2c-a22d-e82e3f769c18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 20, 1, 'Homepage', '2021-10-30 09:05:50', '2021-10-30 09:05:51', '33c7cad6-4f2e-4fcf-a2f5-51a3d734966e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 22, 1, 'Boy 6398465 1920', '2021-10-30 11:45:15', '2021-10-30 11:45:15', '4e3fcb0d-761f-4ce8-9383-b81909dbb2d6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 23, 1, 'Espresso shot', '2021-10-30 12:17:18', '2021-10-30 12:17:18', '0cb12cdd-525f-4941-af1a-d5fc13b476b0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 24, 1, 'Espresso', '2021-10-30 12:22:39', '2021-10-30 12:22:39', '1380687f-a3fd-40c1-a7f0-5ee339f774bf', 'News article lede or summary.', '<p>CraftQuest is a comprehensive learning resource with <em>unlimited access</em> to video training to help you with your current and future projects. Updated weekly with new tutorials on modern web development.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p><p>CraftQuest can help you skill up for a new job or learn the skills to finish an important project. We are always here with new content every week to help you reach your goals.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p><p>We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 25, 1, 'Iced coffee', '2021-10-30 13:21:21', '2021-10-30 13:21:21', 'e40da55d-6161-495d-8353-39a486d8ae26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 26, 1, NULL, '2021-10-30 13:23:05', '2021-10-30 13:23:05', '6ab5753f-4e9a-4ed4-aad0-06b07d434436', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 28, 1, 'Iced Espresso', '2021-10-30 13:23:46', '2021-11-01 07:49:20', '5b12c913-ae73-4dca-83fd-32be8eef22fc', 'News article lede or summary.', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL, NULL, '2021-10-28 18:15:00', NULL, NULL),
(29, 29, 1, 'Iced Coffee', '2021-10-30 13:23:46', '2021-10-30 13:23:46', 'e7e8f04e-1e1c-4e40-b36b-ea40257bfba2', 'Intro', '<p>page copy</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 30, 1, NULL, '2021-10-30 13:30:40', '2021-10-30 13:30:40', '63f32c56-d0e9-4d48-83d0-77d6a66252eb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 32, 1, 'About', '2021-10-30 13:31:51', '2021-10-30 14:28:11', '13fc6843-2312-47ff-bdae-feefb2486c95', NULL, '<p>This is the page copy.</p>', NULL, NULL, 'This is a subtitle', 'This is a page intro', NULL, NULL, NULL),
(33, 33, 1, 'About', '2021-10-30 13:31:51', '2021-10-30 13:31:51', 'ef25f89f-4037-4729-ae35-fc35c7e889d3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 35, 1, 'Locations', '2021-10-30 13:32:39', '2021-10-31 11:20:24', '6a1c83fd-eaef-409a-aa82-9d73ea30a245', NULL, '<p>lorem loc</p>', NULL, NULL, 'location sub', 'loc page intro', NULL, NULL, NULL),
(36, 36, 1, 'Locations', '2021-10-30 13:32:39', '2021-10-30 13:32:39', '70194e3c-8f81-459e-8f0c-7dd70531bd1b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 38, 1, 'Austin, TX', '2021-10-30 13:33:08', '2021-10-31 11:21:27', '16d42a0e-916d-46ea-9228-98a74c52a27f', NULL, '<p>page copy</p>', NULL, NULL, 'Live music capitol of the world', 'page intro', NULL, NULL, NULL),
(39, 39, 1, 'Austin, TX', '2021-10-30 13:33:08', '2021-10-30 13:33:08', '75349653-17a7-4465-a1d6-0374451a0ad2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 41, 1, 'Mission Statement', '2021-10-30 13:33:40', '2021-10-30 14:23:37', 'd3bb3683-72ce-4385-8321-33478ab5bd08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 42, 1, 'Mission Statement', '2021-10-30 13:33:40', '2021-10-30 13:33:40', '3008f89e-6a12-4be2-b88f-fecca199a32f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 43, 1, 'Austin, TX', '2021-10-30 13:37:28', '2021-10-30 13:37:28', '315fa6b8-d245-4a83-8ef4-81d7ea276254', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 44, 1, 'About', '2021-10-30 14:28:11', '2021-10-30 14:28:11', '9d456488-ed3c-4b0d-a2d4-e89fe8c9f338', NULL, '<p>This is the page copy.</p>', NULL, NULL, 'This is a subtitle', 'This is a page intro', NULL, NULL, NULL),
(45, 45, 1, 'Homepage', '2021-10-30 15:33:37', '2021-10-30 15:33:37', '22747bf5-d7ce-43c9-aa13-b58954604312', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 46, 1, 'Homepage', '2021-10-30 15:33:37', '2021-10-30 15:33:37', '10b81ffc-f9c4-4553-be21-67deae69b31e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 47, 1, 'Crafty Coffee', '2021-10-30 15:35:14', '2021-10-30 15:35:14', '93909071-a8c6-405d-9314-d3b92735c4b5', NULL, NULL, NULL, NULL, 'If we wrote it down, you can make it at home.', NULL, NULL, NULL, NULL),
(48, 48, 1, 'Crafty Coffee', '2021-10-30 15:36:20', '2021-10-30 15:36:20', '0801baa8-e4ad-4325-9908-1b2b6b24ccc7', NULL, NULL, NULL, NULL, 'If we wrote it down, you can make it at home.z', NULL, NULL, NULL, NULL),
(49, 49, 1, 'Crafty Coffee', '2021-10-30 15:36:31', '2021-10-30 15:36:31', '46f5e5bb-e1ae-446d-b30b-850d858b94cc', NULL, NULL, NULL, NULL, 'If we wrote it down, you can make it at home.', NULL, NULL, NULL, NULL),
(50, 50, 1, 'Iced Coffee', '2021-10-31 10:07:50', '2021-10-31 10:07:50', '6ebffb19-0202-4741-8193-bfc981c51481', 'News article lede or summary.', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 51, 1, 'Perfect Espresso', '2021-10-31 10:09:08', '2021-10-31 10:09:08', '7477d105-223a-4942-95f7-034260578aec', 'The best shot you\'ve ever had.', '<p>CraftQuest is a comprehensive learning resource with <em>unlimited access</em> to video training to help you with your current and future projects. Updated weekly with new tutorials on modern web development.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p><p>CraftQuest can help you skill up for a new job or learn the skills to finish an important project. We are always here with new content every week to help you reach your goals.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p><p>We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 52, 1, 'Iced Coffee', '2021-10-31 10:38:17', '2021-10-31 10:38:17', 'acf09cdc-636e-45e8-b22b-7901c4cbef2e', 'News article lede or summary.', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL, NULL, '2021-10-28 18:15:00', NULL, NULL),
(54, 54, 1, 'Acquired by Starbucks', '2021-10-31 10:50:57', '2021-10-31 10:50:57', 'a9082559-abae-4e57-9f00-f0712bfcfeaf', NULL, NULL, 'This is amazing!', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL, NULL, NULL),
(55, 55, 1, 'Acquired by Starbucks', '2021-10-31 10:50:57', '2021-10-31 10:50:57', '4a4146f6-3e40-40b5-b06a-c0fb6011c5ec', NULL, NULL, 'This is amazing!', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL, NULL, NULL),
(56, 56, 1, 'Locations', '2021-10-31 11:20:24', '2021-10-31 11:20:24', '5e571bec-b5d5-458f-a8bd-34bf8ddde318', NULL, '<p>lorem loc</p>', NULL, NULL, 'location sub', 'loc page intro', NULL, NULL, NULL),
(57, 57, 1, 'Austin, TX', '2021-10-31 11:21:27', '2021-10-31 11:21:27', '75f52eac-2ee6-4e15-8edf-f00d0a299329', NULL, '<p>page copy</p>', NULL, NULL, 'Live music capitol of the world', 'page intro', NULL, NULL, NULL),
(59, 434, 1, 'Perfect Espresso', '2021-10-31 12:37:44', '2021-10-31 16:23:20', '3f46c2d7-cbb9-4ea6-9320-49caf84e5e08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"Difficulty: Medium\"},{\"col1\":\"Time Required: 10minutes\"},{\"col1\":\"Cost: varies\"},{\"col1\":\"Yield: One double shot\"}]', NULL),
(60, 444, 1, 'Perfect Espresso', '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'e7118fa2-01ed-420d-816a-89b39f25ea41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 473, 1, 'Perfect Espresso', '2021-10-31 14:01:40', '2021-10-31 14:01:40', '9566fc9d-dc22-4346-824f-8bac8a862fbe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 483, 1, 'Perfect Espresso', '2021-10-31 16:02:15', '2021-10-31 16:02:15', 'ea582de0-3d1b-435e-801c-817af353bc3c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"Difficulty: Medium\"}]', NULL),
(64, 493, 1, 'Perfect Espresso', '2021-10-31 16:03:14', '2021-10-31 16:03:14', '56332201-dd3d-4a87-929e-a7c345a40d08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"Difficulty: Medium\"},{\"col1\":\"Time Required: 10minutes\"},{\"col1\":\"Cost: varies\"},{\"col1\":\"Yield: One double shot\"}]', NULL),
(65, 503, 1, 'Espresso', '2021-10-31 16:12:37', '2021-10-31 16:12:37', '21617811-676e-47fc-b1f3-c4607eeb135e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'All drinks made with the delicious espresso roasted bean and pressure brewed technique.'),
(66, 504, 1, 'Perfect Espresso', '2021-10-31 16:17:14', '2021-10-31 16:17:14', 'ec8e7dca-521b-412c-a404-5265ebc8f5ff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"Difficulty: Medium\"},{\"col1\":\"Time Required: 10minutes\"},{\"col1\":\"Cost: varies\"},{\"col1\":\"Yield: One double shot\"}]', NULL),
(67, 514, 1, 'Perfect Espresso', '2021-10-31 16:18:54', '2021-10-31 16:18:54', 'f6afd146-0e12-4998-9c7a-ecefdef52345', 'The best shot you\'ve ever had.', '<p>CraftQuest is a comprehensive learning resource with <em>unlimited access</em> to video training to help you with your current and future projects. Updated weekly with new tutorials on modern web development.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p><p>CraftQuest can help you skill up for a new job or learn the skills to finish an important project. We are always here with new content every week to help you reach your goals.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p><p>We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 515, 1, 'Perfect Espresso', '2021-10-31 16:23:21', '2021-10-31 16:23:21', '75db477a-f283-44f2-a16d-d90d1f746f3e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"Difficulty: Medium\"},{\"col1\":\"Time Required: 10minutes\"},{\"col1\":\"Cost: varies\"},{\"col1\":\"Yield: One double shot\"}]', NULL),
(69, 525, 1, 'Perfect Espresso', '2021-11-01 06:45:04', '2021-11-01 06:45:04', 'fc77f857-ca29-426e-816c-03d09452e20e', 'The best shot you\'ve ever had.', '<p>CraftQuest is a comprehensive learning resource with <em>unlimited access</em> to video training to help you with your current and future projects. Updated weekly with new tutorials on modern web development.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p><p>CraftQuest can help you skill up for a new job or learn the skills to finish an important project. We are always here with new content every week to help you reach your goals.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p><p>We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p>', NULL, NULL, NULL, NULL, '2021-10-29 18:15:00', NULL, NULL),
(70, 526, 1, 'Iced Espresso', '2021-11-01 06:55:51', '2021-11-01 06:55:51', '5b86c0a9-0c71-49da-880f-566d84e3e7d3', 'News article lede or summary.', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL, NULL, '2021-10-28 18:15:00', NULL, NULL),
(71, 527, 1, 'Iced Drinks', '2021-11-01 07:40:17', '2021-11-01 07:40:17', '618b9fc0-b947-48bc-8f91-63615ead51f0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Iced drinks for hot days.'),
(72, 528, 1, 'Iced Americano', '2021-11-01 07:49:07', '2021-11-01 07:49:07', '5f079c49-e0f5-4f7f-95de-d6fa6e4bef76', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"Difficulty: Intermediate\"},{\"col1\":\"Time: 15mins\"}]', NULL),
(73, 530, 1, 'Iced Americano', '2021-11-01 07:49:07', '2021-11-01 07:49:07', '1b864fec-ef2a-42c1-96ca-3ad51a58fd7f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"Difficulty: Intermediate\"},{\"col1\":\"Time: 15mins\"}]', NULL),
(74, 532, 1, 'Iced Espresso', '2021-11-01 07:49:20', '2021-11-01 07:49:20', 'c406ded1-9880-4f9a-adb3-0969911bf57e', 'News article lede or summary.', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL, NULL, '2021-10-28 18:15:00', NULL, NULL),
(75, 533, 1, 'Perfect Espresso', '2021-11-01 07:49:38', '2021-11-01 07:49:38', '6da17744-418e-4982-9636-b7de819c5b63', 'The best shot you\'ve ever had.', '<p>CraftQuest is a comprehensive learning resource with <em>unlimited access</em> to video training to help you with your current and future projects. Updated weekly with new tutorials on modern web development.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p><p>CraftQuest can help you skill up for a new job or learn the skills to finish an important project. We are always here with new content every week to help you reach your goals.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p><p>We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.We help you track your progress on courses, lessons, and Quests. Resume a video right where you left off. Keep track of your progress on your personalized dashboard.</p>', NULL, NULL, NULL, NULL, '2021-10-29 18:15:00', NULL, NULL);

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
(1, 'ElementQuery::getIterator()', '/var/www/code/templates/recipes/_entry.twig:30', '2021-11-01 07:55:37', '/var/www/code/templates/recipes/_entry.twig', 30, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":573,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/33/3339e79b1c875eae751eb6c4e0af6bd7caec206614f9b3fce3b6cc16a9674b1e.php\",\"line\":109,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582\",\"method\":\"block_main\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/c8/c8a70220b794d1621bcefb5c5db7936fcac0e503a5790bf2921a4e0fe025f7b8.php\",\"line\":84,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"main\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/33/3339e79b1c875eae751eb6c4e0af6bd7caec206614f9b3fce3b6cc16a9674b1e.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_aaf840209c1c048bde933ed2f0ad75ec8abec52f0b5a60dd0e93380e7c20b582\",\"file\":\"/var/www/code/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/var/www/code/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"recipes/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"recipes/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"recipes/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"recipes/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"recipes/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"recipes/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"recipes/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"recipes/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"recipes/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"recipes/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"recipes/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2021-11-01 07:55:37', '2021-11-01 07:55:37', '5ed938f6-1a3d-47f6-b671-4aafd5847fda'),
(14, 'ElementQuery::getIterator()', '/var/www/code/templates/styles/_entry.twig:23', '2021-10-31 16:22:33', '/var/www/code/templates/styles/_entry.twig', 23, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":573,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/9d/9da5ff58fa8c8428b8410209212faa87cba8710633696d2913bae2a1e97095c2.php\",\"line\":86,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"method\":\"block_main\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/c8/c8a70220b794d1621bcefb5c5db7936fcac0e503a5790bf2921a4e0fe025f7b8.php\",\"line\":84,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"main\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"method\":\"doDisplay\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/9d/9da5ff58fa8c8428b8410209212faa87cba8710633696d2913bae2a1e97095c2.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"method\":\"doDisplay\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"file\":\"/var/www/code/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/var/www/code/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"styles/_entry\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"styles/_entry\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"styles/_entry\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"styles/_entry\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"styles/_entry\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":null,\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"styles/_entry\\\", [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"styles/_entry\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"styles/_entry\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"styles/_entry\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"styles/_entry\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"styles/_entry\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2021-10-31 16:22:33', '2021-10-31 16:22:33', '6d424bcf-db13-4c30-9f93-248a0e33602f'),
(15, 'ElementQuery::getIterator()', '/var/www/code/templates/styles/_entry.twig:24', '2021-11-01 06:37:20', '/var/www/code/templates/styles/_entry.twig', 24, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":573,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/9d/9da5ff58fa8c8428b8410209212faa87cba8710633696d2913bae2a1e97095c2.php\",\"line\":90,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"method\":\"block_main\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/c8/c8a70220b794d1621bcefb5c5db7936fcac0e503a5790bf2921a4e0fe025f7b8.php\",\"line\":84,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"main\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"method\":\"doDisplay\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/9d/9da5ff58fa8c8428b8410209212faa87cba8710633696d2913bae2a1e97095c2.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"method\":\"doDisplay\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"file\":\"/var/www/code/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/var/www/code/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"styles/_entry\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"styles/_entry\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"styles/_entry\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"styles/_entry\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"styles/_entry\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":null,\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"styles/_entry\\\", [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"styles/_entry\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"styles/_entry\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"styles/_entry\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"styles/_entry\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"styles/_entry\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2021-11-01 06:37:20', '2021-11-01 06:37:20', '7dce77c6-3e0d-4d34-91b6-a9628d12a02f'),
(20, 'ElementQuery::getIterator()', '/var/www/code/templates/styles/_entry.twig:37', '2021-11-01 06:37:41', '/var/www/code/templates/styles/_entry.twig', 37, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":573,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/9d/9da5ff58fa8c8428b8410209212faa87cba8710633696d2913bae2a1e97095c2.php\",\"line\":121,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"method\":\"block_main\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/c8/c8a70220b794d1621bcefb5c5db7936fcac0e503a5790bf2921a4e0fe025f7b8.php\",\"line\":84,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"main\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"method\":\"doDisplay\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/9d/9da5ff58fa8c8428b8410209212faa87cba8710633696d2913bae2a1e97095c2.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"method\":\"doDisplay\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"main\\\" => [__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"__TwigTemplate_6a0e1e73ba78defdd7421bdbd8c769e3756243ae673d214527f00e9d5a3588b9\",\"file\":\"/var/www/code/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/var/www/code/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"styles/_entry\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"styles/_entry\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"styles/_entry\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"styles/_entry\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"styles/_entry\\\", [\\\"category\\\" => craft\\\\elements\\\\Category, \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":null,\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"styles/_entry\\\", [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"styles/_entry\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"styles/_entry\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"styles/_entry\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"styles/_entry\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"styles/_entry\\\", \\\"variables\\\" => [\\\"category\\\" => craft\\\\elements\\\\Category]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2021-11-01 06:37:41', '2021-11-01 06:37:41', '2c415a89-df80-4aef-98e9-41f2549ac415');
INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(25, 'ElementQuery::getIterator()', '/var/www/code/templates/styles/index.twig:22', '2021-11-01 07:37:47', '/var/www/code/templates/styles/index.twig', 22, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":573,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\CategoryQuery\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/d9/d91e23b1fe6535b40384cbb17eb6499274cc52c1fbe4db3fdbacd758bad5618a.php\",\"line\":79,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_2d0b0255db877f8c84d2edcd84867ae35e4e731c43c9a0b3cfc100520a501e20\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_2d0b0255db877f8c84d2edcd84867ae35e4e731c43c9a0b3cfc100520a501e20\",\"method\":\"block_main\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_2d0b0255db877f8c84d2edcd84867ae35e4e731c43c9a0b3cfc100520a501e20, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/c8/c8a70220b794d1621bcefb5c5db7936fcac0e503a5790bf2921a4e0fe025f7b8.php\",\"line\":84,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"main\\\", [\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_2d0b0255db877f8c84d2edcd84867ae35e4e731c43c9a0b3cfc100520a501e20, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"method\":\"doDisplay\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_2d0b0255db877f8c84d2edcd84867ae35e4e731c43c9a0b3cfc100520a501e20, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_2d0b0255db877f8c84d2edcd84867ae35e4e731c43c9a0b3cfc100520a501e20, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/d9/d91e23b1fe6535b40384cbb17eb6499274cc52c1fbe4db3fdbacd758bad5618a.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_2d0b0255db877f8c84d2edcd84867ae35e4e731c43c9a0b3cfc100520a501e20, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2d0b0255db877f8c84d2edcd84867ae35e4e731c43c9a0b3cfc100520a501e20\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_2d0b0255db877f8c84d2edcd84867ae35e4e731c43c9a0b3cfc100520a501e20\",\"method\":\"doDisplay\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_2d0b0255db877f8c84d2edcd84867ae35e4e731c43c9a0b3cfc100520a501e20, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2d0b0255db877f8c84d2edcd84867ae35e4e731c43c9a0b3cfc100520a501e20\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_2d0b0255db877f8c84d2edcd84867ae35e4e731c43c9a0b3cfc100520a501e20, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2d0b0255db877f8c84d2edcd84867ae35e4e731c43c9a0b3cfc100520a501e20\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[]\"},{\"objectClass\":\"__TwigTemplate_2d0b0255db877f8c84d2edcd84867ae35e4e731c43c9a0b3cfc100520a501e20\",\"file\":\"/var/www/code/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/var/www/code/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"styles\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"styles\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"styles\\\", []\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"styles\\\", []\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"styles\\\", []\"},{\"objectClass\":null,\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"styles\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"styles\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"styles\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"styles\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"styles\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"styles\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2021-11-01 07:37:47', '2021-11-01 07:37:47', 'd6431625-4169-4077-a419-26988ea385d0'),
(27, 'ElementQuery::getIterator()', '/var/www/code/templates/drinks/styles.twig:22', '2021-11-01 07:29:43', '/var/www/code/templates/drinks/styles.twig', 22, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":573,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\CategoryQuery\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/10/102e0362423fd5cca99bbb6715f29099c3abfd8d1ad695fecc2daae77b15c174.php\",\"line\":79,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe\",\"method\":\"block_main\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/c8/c8a70220b794d1621bcefb5c5db7936fcac0e503a5790bf2921a4e0fe025f7b8.php\",\"line\":84,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"main\\\", [\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"method\":\"doDisplay\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_db94d91f8237fd4d362159af335a2d8069cb8277f5136598462fa29f94bdf2ad\",\"file\":\"/var/www/code/storage/runtime/compiled_templates/10/102e0362423fd5cca99bbb6715f29099c3abfd8d1ad695fecc2daae77b15c174.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe\",\"method\":\"doDisplay\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], [\\\"main\\\" => [__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe\",\"file\":\"/var/www/code/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[]\"},{\"objectClass\":\"__TwigTemplate_199e3d3e55e0d518e2ff9642a5cc105b4d8bfc20d1ee6f974da6c648dcc490fe\",\"file\":\"/var/www/code/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/var/www/code/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"drinks/styles\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"drinks/styles\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"drinks/styles\\\", []\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"drinks/styles\\\", []\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"drinks/styles\\\", []\"},{\"objectClass\":null,\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"drinks/styles\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"drinks/styles\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"drinks/styles\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"drinks/styles\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"drinks/styles\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"drinks/styles\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/var/www/code/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2021-11-01 07:29:43', '2021-11-01 07:29:43', '1ece3707-d453-4101-81a9-a022e6385394');

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
(2, NULL, 1, 'First draft', NULL),
(3, NULL, 1, 'First draft', NULL),
(4, NULL, 1, 'First draft', NULL),
(5, NULL, 1, 'First draft', NULL),
(7, 8, 1, 'Draft 1', NULL),
(8, NULL, 1, 'First draft', NULL),
(10, 15, 1, 'Draft 1', NULL),
(11, NULL, 1, 'First draft', NULL),
(13, NULL, 1, 'First draft', NULL),
(18, 38, 1, 'Draft 1', NULL);

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

--
-- Dumping data for table `elementindexsettings`
--

INSERT INTO `elementindexsettings` (`id`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '{\"sources\":{\"section:d5a4185f-4eb7-4f6b-b6df-2b7fc400ec13\":{\"tableAttributes\":{\"1\":\"postDate\",\"2\":\"expiryDate\",\"3\":\"link\",\"4\":\"field:5\"}}}}', '2021-10-30 12:23:16', '2021-10-30 12:23:16', '970ce0e2-3969-4f7b-9aee-dc71e07872ec'),
(2, 'craft\\elements\\Category', '{\"sources\":{\"group:a87e584f-142b-48fd-ae9b-6ec0352fd211\":{\"tableAttributes\":{\"1\":\"field:18\",\"2\":\"uri\",\"3\":\"link\"}}}}', '2021-10-31 16:14:36', '2021-10-31 16:14:36', '47462c5d-548a-49e5-9885-2786a783f4f9');

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
(1, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2021-10-08 15:12:57', '2021-10-31 10:29:10', NULL, '32232674-1e83-472f-80c6-3b0f65cfba22'),
(2, 1, NULL, NULL, 'craft\\elements\\Entry', 1, 0, '2021-10-30 07:51:20', '2021-10-30 07:51:20', NULL, '058ab9ee-4f43-4189-840b-5325d3abe5a5'),
(3, 2, NULL, NULL, 'craft\\elements\\Entry', 1, 0, '2021-10-30 08:01:17', '2021-10-30 08:01:17', NULL, '75565606-2d5a-4ee3-98fb-6631a82cf576'),
(4, 3, NULL, NULL, 'craft\\elements\\Entry', 1, 0, '2021-10-30 08:41:11', '2021-10-30 08:41:11', NULL, '399a8ff4-0ac3-44a4-8d67-7aa449871278'),
(5, 4, NULL, NULL, 'craft\\elements\\Entry', 1, 0, '2021-10-30 08:49:26', '2021-10-30 08:49:26', NULL, 'f020f5be-f05c-426a-be43-2d567577b18a'),
(6, 5, NULL, NULL, 'craft\\elements\\Entry', 1, 0, '2021-10-30 08:49:31', '2021-10-30 08:49:31', NULL, '905dcfda-5988-4ed0-8a52-2dc81470f594'),
(8, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2021-10-30 08:54:36', '2021-11-01 07:49:38', NULL, '26a6c336-4df2-4274-ab53-a34495329933'),
(9, NULL, 1, 1, 'craft\\elements\\Entry', 1, 0, '2021-10-30 08:54:36', '2021-10-30 08:54:36', NULL, 'f8f6a6b9-80a9-468c-bf88-2aa94214332b'),
(10, 7, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2021-10-30 08:54:51', '2021-10-30 08:54:51', NULL, '10675124-e848-47ab-9428-86b93d7bf82e'),
(11, 8, NULL, NULL, 'craft\\elements\\Entry', 1, 0, '2021-10-30 08:56:16', '2021-10-30 08:56:16', NULL, 'd3b06e52-b112-46f2-8348-85b811ec7351'),
(13, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2021-10-30 08:58:07', '2021-10-30 08:58:07', NULL, '25e50d29-67db-4392-b706-2e4420a800e3'),
(14, NULL, 2, 2, 'craft\\elements\\Entry', 1, 0, '2021-10-30 08:58:07', '2021-10-30 08:58:07', NULL, '0e30f5b0-735a-4309-8bc5-bd76aedd0cab'),
(15, NULL, NULL, 3, 'craft\\elements\\Entry', 1, 0, '2021-10-30 09:02:53', '2021-10-30 15:36:31', NULL, '50d00b41-8c27-49f3-86d4-f9e7f1d96d61'),
(16, NULL, 3, NULL, 'craft\\elements\\Entry', 1, 0, '2021-10-30 09:02:53', '2021-10-30 09:02:53', NULL, '33635c16-8c22-4917-bf83-f6a5a0680b62'),
(17, NULL, 4, NULL, 'craft\\elements\\Entry', 1, 0, '2021-10-30 09:03:04', '2021-10-30 09:03:04', NULL, '4dd04199-eb24-4239-87aa-02283469c280'),
(18, NULL, 5, NULL, 'craft\\elements\\Entry', 1, 0, '2021-10-30 09:03:05', '2021-10-30 09:03:05', NULL, 'cf5c953b-b29e-4d77-858e-497dffb5b1c6'),
(19, NULL, 6, NULL, 'craft\\elements\\Entry', 1, 0, '2021-10-30 09:04:42', '2021-10-30 09:04:42', NULL, '04c89e89-2fdc-47d2-97ef-5fffadabe21a'),
(20, 10, NULL, 3, 'craft\\elements\\Entry', 1, 0, '2021-10-30 09:05:50', '2021-10-30 09:05:51', NULL, '358183e3-6fab-4759-9e03-8ea7c9d6425d'),
(22, NULL, NULL, NULL, 'craft\\elements\\Asset', 1, 0, '2021-10-30 11:45:15', '2021-10-30 11:45:15', '2021-10-30 12:52:36', 'f6345456-d0bc-49dd-a172-efdea1bad691'),
(23, NULL, NULL, NULL, 'craft\\elements\\Asset', 1, 0, '2021-10-30 12:17:18', '2021-10-30 12:17:18', NULL, '0b3098f1-23f7-400b-a731-8fa14d681479'),
(24, NULL, 7, 1, 'craft\\elements\\Entry', 1, 0, '2021-10-30 12:22:39', '2021-10-30 12:22:39', NULL, '6ad9c1ab-795e-4d9b-95df-54ee9db95aeb'),
(25, NULL, NULL, NULL, 'craft\\elements\\Asset', 1, 0, '2021-10-30 13:21:21', '2021-10-30 13:21:21', NULL, '4aff2ba0-d9d7-4f87-bafb-f92c50a80b16'),
(26, 11, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2021-10-30 13:23:05', '2021-10-30 13:23:05', NULL, 'd7d8282d-d0c0-4b8b-838d-9b0d0bbbb536'),
(28, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2021-10-30 13:23:46', '2021-11-01 07:49:20', NULL, '7bc9e4c7-9cb8-4e6b-a894-87ce488af0e3'),
(29, NULL, 8, 1, 'craft\\elements\\Entry', 1, 0, '2021-10-30 13:23:46', '2021-10-30 13:23:46', NULL, 'cb30fae2-87c6-45bd-8895-5e0d948b1470'),
(30, 13, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2021-10-30 13:30:40', '2021-10-30 13:30:40', NULL, '35520088-7aa0-4dd4-9f99-a9faecb1b7d3'),
(32, NULL, NULL, 4, 'craft\\elements\\Entry', 1, 0, '2021-10-30 13:31:51', '2021-10-30 14:28:11', NULL, '1070a475-a267-4fe7-958e-da97103f4bf1'),
(33, NULL, 9, NULL, 'craft\\elements\\Entry', 1, 0, '2021-10-30 13:31:51', '2021-10-30 13:31:51', NULL, '53e4d3d1-7bfa-4db0-9a33-5f6b0cff4281'),
(35, NULL, NULL, 4, 'craft\\elements\\Entry', 1, 0, '2021-10-30 13:32:39', '2021-10-31 11:20:24', NULL, 'dc03dfb2-8d99-45ef-a201-87e95ab602d2'),
(36, NULL, 10, NULL, 'craft\\elements\\Entry', 1, 0, '2021-10-30 13:32:39', '2021-10-30 13:32:39', NULL, '5144d393-d749-41b1-8068-b66436ce1a81'),
(38, NULL, NULL, 4, 'craft\\elements\\Entry', 1, 0, '2021-10-30 13:33:08', '2021-10-31 11:21:27', NULL, '16a97094-c8bb-49e4-bd54-9b3441ee4656'),
(39, NULL, 11, NULL, 'craft\\elements\\Entry', 1, 0, '2021-10-30 13:33:07', '2021-10-30 13:33:07', NULL, '93e7fb71-b3e4-47c9-8146-8a2df909bc23'),
(41, NULL, NULL, 4, 'craft\\elements\\Entry', 1, 0, '2021-10-30 13:33:40', '2021-10-30 13:33:40', NULL, 'c2f61ab1-5050-4e05-bd9e-32632e3924a1'),
(42, NULL, 12, NULL, 'craft\\elements\\Entry', 1, 0, '2021-10-30 13:33:40', '2021-10-30 13:33:40', NULL, '533a2eba-e21b-4de3-bb71-76663a4057c8'),
(43, 18, NULL, NULL, 'craft\\elements\\Entry', 1, 0, '2021-10-30 13:37:28', '2021-10-30 13:37:28', NULL, '157af55d-3b25-4628-96f0-ad01beebab04'),
(44, NULL, 13, 4, 'craft\\elements\\Entry', 1, 0, '2021-10-30 14:28:11', '2021-10-30 14:28:11', NULL, 'ecb809ec-1d60-4d2f-af31-0b2e7825dc14'),
(45, NULL, 14, 3, 'craft\\elements\\Entry', 1, 0, '2021-10-30 15:33:36', '2021-10-30 15:33:36', NULL, 'ead86237-556b-49d5-8504-d96097176fa6'),
(46, NULL, 15, 3, 'craft\\elements\\Entry', 1, 0, '2021-10-30 15:33:37', '2021-10-30 15:33:37', NULL, '3475525a-2d16-463b-8a83-645e4e48e97c'),
(47, NULL, 16, 3, 'craft\\elements\\Entry', 1, 0, '2021-10-30 15:35:14', '2021-10-30 15:35:14', NULL, 'e0fc5083-7688-4f56-a32c-a1ac57076c11'),
(48, NULL, 17, 3, 'craft\\elements\\Entry', 1, 0, '2021-10-30 15:36:20', '2021-10-30 15:36:20', NULL, '365a9277-a867-4b7b-8dc6-3efa721f3e99'),
(49, NULL, 18, 3, 'craft\\elements\\Entry', 1, 0, '2021-10-30 15:36:31', '2021-10-30 15:36:31', NULL, '57899dfb-707c-48e3-b7b3-d1c220273df5'),
(50, NULL, 19, 1, 'craft\\elements\\Entry', 1, 0, '2021-10-31 10:07:50', '2021-10-31 10:07:50', NULL, '9bb6c55d-5464-4208-8c9f-007bb4b3bdbb'),
(51, NULL, 20, 1, 'craft\\elements\\Entry', 1, 0, '2021-10-31 10:09:08', '2021-10-31 10:09:08', NULL, '53302add-c366-4fd1-9fec-caa917f1c577'),
(52, NULL, 21, 1, 'craft\\elements\\Entry', 1, 0, '2021-10-31 10:38:17', '2021-10-31 10:38:17', NULL, '18d73d09-b54f-4768-b3f2-11665bae865c'),
(54, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2021-10-31 10:50:57', '2021-10-31 10:50:57', NULL, '18f34f63-2653-47e6-965d-d5ab748a5527'),
(55, NULL, 22, 2, 'craft\\elements\\Entry', 1, 0, '2021-10-31 10:50:57', '2021-10-31 10:50:57', NULL, '18966c38-8f9a-4ae4-b95f-a6851802ec20'),
(56, NULL, 23, 4, 'craft\\elements\\Entry', 1, 0, '2021-10-31 11:20:24', '2021-10-31 11:20:24', NULL, '409a44ed-ec3d-41a2-a4df-c1bdd3a93782'),
(57, NULL, 24, 4, 'craft\\elements\\Entry', 1, 0, '2021-10-31 11:21:27', '2021-10-31 11:21:27', NULL, 'ac382fcf-4189-4f81-9592-3373eb536d7e'),
(59, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:30:21', '2021-10-31 12:30:21', '2021-10-31 12:30:31', '96b6d4c0-40be-41ac-b3f1-20f8f9b358ff'),
(60, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:30:31', '2021-10-31 12:30:31', '2021-10-31 12:30:46', '7e2fcd1b-52fb-4cba-b42d-97eaca047cc1'),
(61, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:30:54', '2021-10-31 12:30:54', '2021-10-31 12:31:03', 'd723ff15-3e94-4443-9bf9-a5ea11e69dbe'),
(62, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:03', '2021-10-31 12:31:03', '2021-10-31 12:31:08', '6b9a01a5-65c9-4b78-85cf-4f96c7db39ce'),
(63, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:08', '2021-10-31 12:31:08', '2021-10-31 12:31:13', '914cd390-5286-4940-81a5-d86d59d1b5f6'),
(64, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:13', '2021-10-31 12:31:13', '2021-10-31 12:31:17', '301006db-b547-44e4-9a95-b0ac13aa8153'),
(65, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:13', '2021-10-31 12:31:13', '2021-10-31 12:31:17', '1e4f5bbe-d993-4a65-9940-2ba81a23a60a'),
(66, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:17', '2021-10-31 12:31:17', '2021-10-31 12:31:21', '779b58b8-5c3d-4b19-811b-0e593fb3d545'),
(67, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:17', '2021-10-31 12:31:17', '2021-10-31 12:31:21', '80982e48-9506-494a-9f38-49a6aecd7860'),
(68, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:21', '2021-10-31 12:31:21', '2021-10-31 12:31:25', '7b305848-dd38-4a38-b8ea-1c5813543cdc'),
(69, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:21', '2021-10-31 12:31:21', '2021-10-31 12:31:25', '69c53cb6-cdcd-4a65-81b0-8bc7abdfc486'),
(70, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:25', '2021-10-31 12:31:25', '2021-10-31 12:31:34', 'be015211-ef9e-44f0-9f74-ca4c224c0368'),
(71, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:25', '2021-10-31 12:31:25', '2021-10-31 12:31:34', 'bc132501-05ef-41d9-a979-c6d682332f43'),
(72, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:34', '2021-10-31 12:31:34', '2021-10-31 12:31:36', '1d1b79c9-ca6a-45d1-89f4-0fce2270bb1c'),
(73, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:34', '2021-10-31 12:31:34', '2021-10-31 12:31:36', 'cd26233d-bdc6-4110-bf5c-d0398c78765c'),
(74, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:36', '2021-10-31 12:31:36', '2021-10-31 12:31:46', '688a4ed2-4b29-446d-bec4-2d6d7283bcc8'),
(75, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:36', '2021-10-31 12:31:36', '2021-10-31 12:31:46', 'df4b5927-fc62-474b-9cd7-bbb8514bdfe6'),
(76, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:36', '2021-10-31 12:31:36', '2021-10-31 12:31:46', '7048d34a-7b57-4aaf-9aa2-c6ddcd6f8e1d'),
(77, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:46', '2021-10-31 12:31:46', '2021-10-31 12:31:58', 'c03a5125-8bb3-4cb9-9471-40bddb999aee'),
(78, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:46', '2021-10-31 12:31:46', '2021-10-31 12:31:58', '0a787bc9-b42f-4483-8bc6-4b7171ef37ff'),
(79, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:46', '2021-10-31 12:31:46', '2021-10-31 12:31:58', 'a5448df2-3f8b-49a6-a26a-8db4dc48d5af'),
(80, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:58', '2021-10-31 12:31:58', '2021-10-31 12:31:59', 'e553563b-9ac8-4834-968c-5b6fdd716880'),
(81, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:58', '2021-10-31 12:31:58', '2021-10-31 12:31:59', 'a2f92b8c-d75f-4b58-88d4-c49424d3cee8'),
(82, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:58', '2021-10-31 12:31:58', '2021-10-31 12:31:59', '85b7a386-1232-4e6b-b3ce-d7cf94d72b28'),
(83, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:59', '2021-10-31 12:31:59', '2021-10-31 12:32:07', '9ea95353-71cc-4b1a-8adc-afb12300d569'),
(84, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:59', '2021-10-31 12:31:59', '2021-10-31 12:32:07', '173f8de4-ce09-4cdb-a872-a6e89ada7ee2'),
(85, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:31:59', '2021-10-31 12:31:59', '2021-10-31 12:32:07', '650630aa-2ecc-4f6a-90b6-104bef55d7f6'),
(86, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:06', '2021-10-31 12:32:06', '2021-10-31 12:32:09', '21b097a7-01c3-455c-be63-5dc7892e3e14'),
(87, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:06', '2021-10-31 12:32:06', '2021-10-31 12:32:09', 'a8f5fd46-2668-4fcc-b056-e29f66c34c2d'),
(88, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:07', '2021-10-31 12:32:07', '2021-10-31 12:32:09', 'f6de14de-d83b-4c20-8e54-09ed7c442cf6'),
(89, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:09', '2021-10-31 12:32:09', '2021-10-31 12:32:12', 'a0ae1231-8460-474c-a17a-4877e669a44a'),
(90, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:09', '2021-10-31 12:32:09', '2021-10-31 12:32:12', 'd0f9376c-ea5a-44d5-ac41-ca22317436d9'),
(91, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:09', '2021-10-31 12:32:09', '2021-10-31 12:32:12', '76b804a1-6e94-4947-b4ea-a8ab335ae774'),
(92, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:11', '2021-10-31 12:32:11', '2021-10-31 12:32:40', 'e0f7589a-da3e-4e7d-ab12-8bce7908e6a0'),
(93, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:12', '2021-10-31 12:32:12', '2021-10-31 12:32:40', 'f7da9aa0-9124-4ef1-a2ea-d08282800fc4'),
(94, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:12', '2021-10-31 12:32:12', '2021-10-31 12:32:40', 'bf8ba71c-ad72-452f-a384-a5174d8c634e'),
(95, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:12', '2021-10-31 12:32:12', '2021-10-31 12:32:40', '217d2fac-0b4e-4b33-9525-35a572f9eadc'),
(96, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:40', '2021-10-31 12:32:40', '2021-10-31 12:32:44', 'a1551b0c-50b4-4791-af09-053e3b7338e5'),
(97, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:40', '2021-10-31 12:32:40', '2021-10-31 12:32:44', '13cc8e86-82ee-4457-8dee-1f511fbfbcb8'),
(98, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:40', '2021-10-31 12:32:40', '2021-10-31 12:32:44', '736801ff-da2b-448c-bee5-ff7fb0b20330'),
(99, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:40', '2021-10-31 12:32:40', '2021-10-31 12:32:44', '3734d400-565c-44f1-827f-77ffecfe6e08'),
(100, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:44', '2021-10-31 12:32:44', '2021-10-31 12:32:49', '96b06b46-7442-4c09-b6f0-c6fbff4ea3d7'),
(101, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:44', '2021-10-31 12:32:44', '2021-10-31 12:32:49', 'f3d8e330-3a0d-497f-b914-2b13c6062cde'),
(102, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:44', '2021-10-31 12:32:44', '2021-10-31 12:32:49', '6c4d92a2-ddda-4b99-8969-8c1c1453db2b'),
(103, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:44', '2021-10-31 12:32:44', '2021-10-31 12:32:49', 'e9ea0339-5461-4318-ab71-88ab34feb258'),
(104, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:49', '2021-10-31 12:32:49', '2021-10-31 12:32:51', '2472663c-3b3b-4f0d-97d8-6e36aba754b9'),
(105, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:49', '2021-10-31 12:32:49', '2021-10-31 12:32:51', '727bd156-6215-44b9-9e72-7dcf86e57b83'),
(106, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:49', '2021-10-31 12:32:49', '2021-10-31 12:32:51', '01f1fd23-5be7-49e8-ba18-0f1ce0e180c1'),
(107, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:49', '2021-10-31 12:32:49', '2021-10-31 12:32:51', '81b4ef62-e9c5-41cd-a32e-5297e6e0f63c'),
(108, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:51', '2021-10-31 12:32:51', '2021-10-31 12:32:52', 'eb005701-8633-43cc-9b98-9784922df217'),
(109, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:51', '2021-10-31 12:32:51', '2021-10-31 12:32:52', '56fb350c-6644-4e65-b6a5-ca1e1a9d3379'),
(110, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:51', '2021-10-31 12:32:51', '2021-10-31 12:32:52', 'bd2558ed-e7e6-4005-ab43-1cad21e2f7f3'),
(111, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:51', '2021-10-31 12:32:51', '2021-10-31 12:32:52', '8cfba44a-da74-421c-94ad-4078c60cfa8e'),
(112, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:52', '2021-10-31 12:32:52', '2021-10-31 12:32:54', '36dedd58-e22a-496c-a3e9-2a65ce5b1349'),
(113, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:52', '2021-10-31 12:32:52', '2021-10-31 12:32:54', 'fc5f2d8a-6df3-4a43-8a7b-faabebc2b019'),
(114, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:52', '2021-10-31 12:32:52', '2021-10-31 12:32:54', '1243ea30-7980-428e-9959-71b4c3a8b265'),
(115, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:52', '2021-10-31 12:32:52', '2021-10-31 12:32:54', '1f253cff-af3e-438d-bb60-37405661844b'),
(116, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:54', '2021-10-31 12:32:54', '2021-10-31 12:32:57', 'dc6d4a17-67d6-4853-9240-70d83c7cb457'),
(117, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:54', '2021-10-31 12:32:54', '2021-10-31 12:32:57', '5053f272-39e9-4d63-9c2b-9894f92c5f66'),
(118, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:54', '2021-10-31 12:32:54', '2021-10-31 12:32:57', '80d4ea9e-dca4-4596-bf72-c3ddea481434'),
(119, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:54', '2021-10-31 12:32:54', '2021-10-31 12:32:57', '41ed4b1d-7988-40f6-93c2-8bdf40de28ab'),
(120, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:57', '2021-10-31 12:32:57', '2021-10-31 12:33:16', '87062e06-c10e-4d00-a7dc-24df49d66302'),
(121, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:57', '2021-10-31 12:32:57', '2021-10-31 12:33:16', 'd5388371-4d9b-408d-968e-34be4f9b042d'),
(122, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:57', '2021-10-31 12:32:57', '2021-10-31 12:33:16', '3384ed29-d693-4ba4-baed-8f7e0227f1e5'),
(123, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:32:57', '2021-10-31 12:32:57', '2021-10-31 12:33:16', '2ca898e6-1013-4d58-9be8-641c28febe7f'),
(124, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:15', '2021-10-31 12:33:15', '2021-10-31 12:33:27', 'a127c49c-b754-4813-965d-f101be6a5430'),
(125, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:15', '2021-10-31 12:33:15', '2021-10-31 12:33:27', '22f95a41-f2a4-423e-a9b5-5260fa7df5ab'),
(126, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:15', '2021-10-31 12:33:15', '2021-10-31 12:33:27', 'a899bb05-1f90-4952-8815-bc2b4d62cf6c'),
(127, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:15', '2021-10-31 12:33:15', '2021-10-31 12:33:27', '474f2b51-4c1b-4164-ade5-a891689fb5b4'),
(128, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:27', '2021-10-31 12:33:27', '2021-10-31 12:33:32', '6815fd3e-9e96-40ed-bc7a-1637c7d7add5'),
(129, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:27', '2021-10-31 12:33:27', '2021-10-31 12:33:32', 'c8c80aa8-3bac-4b37-8d65-a2cb8290876b'),
(130, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:27', '2021-10-31 12:33:27', '2021-10-31 12:33:32', '1d157019-9e32-4174-8312-c556a1abc957'),
(131, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:27', '2021-10-31 12:33:27', '2021-10-31 12:33:32', '7b43c92c-f364-4199-84bd-2c61c21d381c'),
(132, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:27', '2021-10-31 12:33:27', '2021-10-31 12:33:32', 'a7f03dcf-418b-4838-b8a8-2a6dad42af15'),
(133, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:32', '2021-10-31 12:33:32', '2021-10-31 12:33:35', 'ae915158-3f20-4d87-bf65-5a8d6d2155fe'),
(134, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:32', '2021-10-31 12:33:32', '2021-10-31 12:33:35', 'efc5f3df-597d-4382-a7e8-4bbe09844bed'),
(135, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:32', '2021-10-31 12:33:32', '2021-10-31 12:33:35', '87aab049-355c-465f-889a-aa8493b95412'),
(136, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:32', '2021-10-31 12:33:32', '2021-10-31 12:33:35', '2bcd13e3-76f2-497d-a7af-cf05d5636b18'),
(137, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:32', '2021-10-31 12:33:32', '2021-10-31 12:33:35', '8d1199ba-fbee-44ea-92f8-a9b6d0b0af02'),
(138, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:34', '2021-10-31 12:33:34', '2021-10-31 12:33:41', 'ed9f6cd6-1e4c-4ac6-9227-3f94944012cd'),
(139, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:34', '2021-10-31 12:33:34', '2021-10-31 12:33:41', 'bbcdb3a1-c598-4dc8-9507-d249d49bd93d'),
(140, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:34', '2021-10-31 12:33:34', '2021-10-31 12:33:41', '3ad296d6-43a0-4d90-bbdb-0485f84b8514'),
(141, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:34', '2021-10-31 12:33:34', '2021-10-31 12:33:41', '61183e11-ee1f-42db-a2b6-229983c43f7f'),
(142, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:34', '2021-10-31 12:33:34', '2021-10-31 12:33:41', '1b4b1ac2-fd5c-46bf-8867-67c81a63172e'),
(143, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:41', '2021-10-31 12:33:41', '2021-10-31 12:33:45', '1c488b01-9da6-418d-a260-fdb0b650a072'),
(144, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:41', '2021-10-31 12:33:41', '2021-10-31 12:33:45', '9d5e04f5-b693-4f43-a5e3-c7699a49f934'),
(145, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:41', '2021-10-31 12:33:41', '2021-10-31 12:33:45', '870acc7b-e7d2-4dad-9073-414f9940d4e2'),
(146, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:41', '2021-10-31 12:33:41', '2021-10-31 12:33:45', 'e68d57a4-7371-426b-895a-a08cb3de7bb3'),
(147, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:41', '2021-10-31 12:33:41', '2021-10-31 12:33:45', '0da5b108-c9ae-4c70-8971-73c2a1d04478'),
(148, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:44', '2021-10-31 12:33:44', '2021-10-31 12:33:47', 'd2dc88e2-9326-4443-ad1c-b7fc9d29da01'),
(149, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:44', '2021-10-31 12:33:44', '2021-10-31 12:33:47', '27dc721b-c320-4cba-882c-ebed86fdb631'),
(150, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:44', '2021-10-31 12:33:44', '2021-10-31 12:33:47', '560e403e-f367-4dca-8e5b-4bff483c712e'),
(151, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:44', '2021-10-31 12:33:44', '2021-10-31 12:33:47', '99964d45-b514-4d35-96bd-1da286dced9d'),
(152, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:44', '2021-10-31 12:33:44', '2021-10-31 12:33:47', 'db6209cb-c3b9-47c0-9638-d3f7d7af7684'),
(153, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:47', '2021-10-31 12:33:47', '2021-10-31 12:33:53', 'f7bf4d06-37fe-429c-b91b-a01a67555ef6'),
(154, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:47', '2021-10-31 12:33:47', '2021-10-31 12:33:53', 'aa6f1377-3ea5-4308-8e55-d6822ee4d21a'),
(155, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:47', '2021-10-31 12:33:47', '2021-10-31 12:33:53', 'd447a869-1b35-41fe-93f8-c2c4fdc7b9af'),
(156, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:47', '2021-10-31 12:33:47', '2021-10-31 12:33:53', '3c5c7350-d2e1-4a56-9a87-8355855a793b'),
(157, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:47', '2021-10-31 12:33:47', '2021-10-31 12:33:53', '5eb05ae6-e82c-46ae-9170-4789cc85fee4'),
(158, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:52', '2021-10-31 12:33:52', '2021-10-31 12:33:53', 'a9491f38-96fa-4720-b8f3-1f0a908a5bf4'),
(159, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:52', '2021-10-31 12:33:52', '2021-10-31 12:33:53', 'b83fdfad-2295-4da6-90d1-e8f46427c82b'),
(160, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '2021-10-31 12:33:53', '7fb2edbb-cc46-4ac4-8131-3728e93fc6a5'),
(161, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '2021-10-31 12:33:53', '348163cb-5e28-4e36-80b4-1de6648f61df'),
(162, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '2021-10-31 12:33:53', '89daf4f0-3e4d-48cf-bd94-aa1d65bc1f13'),
(163, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '2021-10-31 12:33:55', 'c3ee814f-1404-4d92-850d-fb219dae5677'),
(164, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '2021-10-31 12:33:55', 'b2c4d7e2-f9b0-4d92-b32d-3da5e3b927cd'),
(165, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '2021-10-31 12:33:55', '0b54e5e6-cc4f-4fbf-81f8-ba7de5f9b664'),
(166, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '2021-10-31 12:33:55', '24082d01-520a-4b63-a96b-717383463b2d'),
(167, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '2021-10-31 12:33:55', 'dc7a7b3f-c1cc-4310-89c6-d05d56fe8dac'),
(168, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:55', '2021-10-31 12:33:55', '2021-10-31 12:33:57', '81d6af8f-71ad-4b81-9fac-9cea69b9da6c'),
(169, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:55', '2021-10-31 12:33:55', '2021-10-31 12:33:57', '8357bbcb-a24d-4ff3-bb2d-5c1ac1baeede'),
(170, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:55', '2021-10-31 12:33:55', '2021-10-31 12:33:57', '2bbeb8e7-dcb6-46e4-b78a-0ecf4fc381ae'),
(171, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:55', '2021-10-31 12:33:55', '2021-10-31 12:33:57', 'dcc4bde6-0913-4c88-ac1a-b48bc13e193f'),
(172, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:55', '2021-10-31 12:33:55', '2021-10-31 12:33:57', 'd58648cc-2409-49b3-aba0-9b61be19e6d5'),
(173, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:57', '2021-10-31 12:33:57', '2021-10-31 12:33:58', '435e0972-4301-4852-aed0-d3eb55329034'),
(174, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:57', '2021-10-31 12:33:57', '2021-10-31 12:33:58', '812d94a9-0f6a-4f78-88aa-9a765891c0f4'),
(175, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:57', '2021-10-31 12:33:57', '2021-10-31 12:33:58', 'ad97cefa-deaa-4ef5-8d29-79c5955e7f9f'),
(176, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:57', '2021-10-31 12:33:57', '2021-10-31 12:33:58', 'b6ee75eb-d5e0-43f4-9776-fc18dac417e3'),
(177, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:57', '2021-10-31 12:33:57', '2021-10-31 12:33:58', '24bd1297-aa23-4fd0-8f2e-ae2ca32af9ed'),
(178, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:58', '2021-10-31 12:33:58', '2021-10-31 12:34:03', '6a210519-39f6-4659-936c-ed9d7d06450d'),
(179, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:58', '2021-10-31 12:33:58', '2021-10-31 12:34:03', 'cb1160d3-2b92-42f8-819d-6281279147d6'),
(180, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:58', '2021-10-31 12:33:58', '2021-10-31 12:34:03', '4bee78f9-dd17-4e69-afaa-4d6ad99b0199'),
(181, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:58', '2021-10-31 12:33:58', '2021-10-31 12:34:03', '5cbf1080-a6e7-45ce-bfba-9572519edd96'),
(182, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:33:58', '2021-10-31 12:33:58', '2021-10-31 12:34:03', '6d0505b5-b82c-4a26-b4c9-4db8b26f253d'),
(183, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:03', '2021-10-31 12:34:03', '2021-10-31 12:34:10', '2e1024ec-702f-4a07-bedf-838d138244d7'),
(184, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:03', '2021-10-31 12:34:03', '2021-10-31 12:34:10', '4c9b3b49-d22a-4c3f-be32-7e4f661e7b18'),
(185, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:03', '2021-10-31 12:34:03', '2021-10-31 12:34:10', '2043fdf5-fab2-4b16-bc93-d2d01b6f20b7'),
(186, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:03', '2021-10-31 12:34:03', '2021-10-31 12:34:10', 'cb458018-e144-4da1-b4a6-06569fc567bc'),
(187, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:03', '2021-10-31 12:34:03', '2021-10-31 12:34:10', '04b52202-ab41-480b-9ff6-3d14c9516600'),
(188, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:10', '2021-10-31 12:34:10', '2021-10-31 12:34:17', 'b13450eb-bd25-49b0-8afc-45316a0c020a'),
(189, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:10', '2021-10-31 12:34:10', '2021-10-31 12:34:17', '81d6d98f-9268-44d1-a9b1-fdbc7106e0fc'),
(190, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:10', '2021-10-31 12:34:10', '2021-10-31 12:34:17', '4ae2ff90-60cd-4100-9668-9118cdcac460'),
(191, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:10', '2021-10-31 12:34:10', '2021-10-31 12:34:17', '655674cd-63f6-4335-99e0-cb8fa78f1b5c'),
(192, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:10', '2021-10-31 12:34:10', '2021-10-31 12:34:17', '4e49eee0-7c12-4525-a5c6-a43b8c81f642'),
(193, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:10', '2021-10-31 12:34:10', '2021-10-31 12:34:17', '099c7542-6fb8-43e0-bc9b-c44b68d6be40'),
(194, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:16', '2021-10-31 12:34:16', '2021-10-31 12:34:19', '8511e71a-8b53-40a1-b2cb-95a4a1542ba5'),
(195, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:16', '2021-10-31 12:34:16', '2021-10-31 12:34:19', 'f3832dcf-8d6c-4987-a2d4-55cbc0cc03f4'),
(196, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:16', '2021-10-31 12:34:16', '2021-10-31 12:34:19', 'f7ace761-5598-48a0-bb4c-7ac7c7855675'),
(197, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:16', '2021-10-31 12:34:16', '2021-10-31 12:34:19', '80946f39-63dc-4a5b-a15f-316c40657408'),
(198, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:16', '2021-10-31 12:34:16', '2021-10-31 12:34:19', 'bc43515c-0c1e-48dc-b4d5-f02bd4dc3687'),
(199, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:17', '2021-10-31 12:34:17', '2021-10-31 12:34:19', '437131f5-8f90-463f-b333-0839dfd00aa7'),
(200, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:19', '2021-10-31 12:34:19', '2021-10-31 12:34:21', '7a8fabfc-a932-4971-a960-0796a850802d'),
(201, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:19', '2021-10-31 12:34:19', '2021-10-31 12:34:21', '8c3088c9-cff5-4494-8c5c-39d481deb078'),
(202, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:19', '2021-10-31 12:34:19', '2021-10-31 12:34:21', 'b98f7599-e207-4270-9678-5a94aac2d5fe'),
(203, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:19', '2021-10-31 12:34:19', '2021-10-31 12:34:21', 'd8799408-a3ce-41d6-98de-014b441655fb'),
(204, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:19', '2021-10-31 12:34:19', '2021-10-31 12:34:21', 'd076985f-20da-41e4-926b-c210ec8bc9e5'),
(205, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:19', '2021-10-31 12:34:19', '2021-10-31 12:34:21', '64d14d1b-f148-4dc6-87c2-096f3db4d043'),
(206, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:21', '2021-10-31 12:34:21', '2021-10-31 12:34:23', '07cf18d4-a3d4-4643-b1a0-07f74e6e4109'),
(207, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:21', '2021-10-31 12:34:21', '2021-10-31 12:34:23', '0e40bf3d-ed4d-4546-bdb7-431b8d6703d0'),
(208, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:21', '2021-10-31 12:34:21', '2021-10-31 12:34:23', 'e94967e8-79da-4051-b75f-97a044648aea'),
(209, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:21', '2021-10-31 12:34:21', '2021-10-31 12:34:23', '93e36923-f99b-4b5d-8040-2b47c2d9720c'),
(210, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:21', '2021-10-31 12:34:21', '2021-10-31 12:34:23', '211780ab-2c45-4ca1-9807-09a7367af154'),
(211, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:21', '2021-10-31 12:34:21', '2021-10-31 12:34:23', '92031897-feda-4e18-bd2b-8ab0f775aec5'),
(212, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:23', '2021-10-31 12:34:23', '2021-10-31 12:34:25', '1be5cf04-34ed-4f0e-bb45-415a0fd61183'),
(213, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:23', '2021-10-31 12:34:23', '2021-10-31 12:34:25', 'a13fbd16-8b75-4a6e-b418-349b859da030'),
(214, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:23', '2021-10-31 12:34:23', '2021-10-31 12:34:25', 'ded8234a-e463-4999-aaa6-09ab207dcb52'),
(215, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:23', '2021-10-31 12:34:23', '2021-10-31 12:34:25', '1a830f33-f8b5-4d35-bd73-86c2b5db76a2'),
(216, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:23', '2021-10-31 12:34:23', '2021-10-31 12:34:25', '4bc6e6e2-1e79-4d43-aea1-f900165f118f'),
(217, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:23', '2021-10-31 12:34:23', '2021-10-31 12:34:25', '71617e91-2235-4ce6-a12e-c42ff99a0443'),
(218, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:24', '2021-10-31 12:34:24', '2021-10-31 12:34:29', 'b658c2f9-f572-4da1-8e37-6b394136f9f4'),
(219, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:24', '2021-10-31 12:34:24', '2021-10-31 12:34:29', 'e964031b-de62-413f-8e18-31625eebe522'),
(220, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:24', '2021-10-31 12:34:24', '2021-10-31 12:34:29', 'b0820ec0-6cb4-4dd9-bf5c-26b4c992d97b'),
(221, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:25', '2021-10-31 12:34:25', '2021-10-31 12:34:29', '3a149471-8e6f-4f18-8adf-3e290e5eb05d'),
(222, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:25', '2021-10-31 12:34:25', '2021-10-31 12:34:29', 'b0326ab0-a8a7-4d4e-a32b-0a7872f7dc2e'),
(223, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:25', '2021-10-31 12:34:25', '2021-10-31 12:34:29', 'c7325930-c5e9-405c-9e8a-8f7fb53d63b2'),
(224, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:29', '2021-10-31 12:34:29', '2021-10-31 12:34:31', '0eb3689b-0f9b-4ac4-8699-e71a0c6ef2c0'),
(225, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:29', '2021-10-31 12:34:29', '2021-10-31 12:34:31', '8c963269-60e5-4e58-8208-6a730f226b2d'),
(226, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:29', '2021-10-31 12:34:29', '2021-10-31 12:34:31', '799ecc68-d950-4f60-bc71-bf6bb54a39a0'),
(227, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:29', '2021-10-31 12:34:29', '2021-10-31 12:34:31', 'e39245fb-d899-49ce-8ff6-60afb92c3486'),
(228, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:29', '2021-10-31 12:34:29', '2021-10-31 12:34:31', 'b4fc0a0e-4f50-46b8-a580-15a6460f6992'),
(229, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:29', '2021-10-31 12:34:29', '2021-10-31 12:34:31', '08d99029-4860-4913-9350-5c976c6297de'),
(230, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:31', '2021-10-31 12:34:31', '2021-10-31 12:34:34', '39f5878a-05be-4b87-ac5d-4539e62702fe'),
(231, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:31', '2021-10-31 12:34:31', '2021-10-31 12:34:34', '17751f1d-46a2-4baa-8ed4-2f90e6e1c481'),
(232, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:31', '2021-10-31 12:34:31', '2021-10-31 12:34:34', 'f65c8e63-bef2-4433-8c6b-d5de0e395196'),
(233, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:31', '2021-10-31 12:34:31', '2021-10-31 12:34:34', 'bc0f0761-2a60-4c09-b03c-994d1fcc1764'),
(234, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:31', '2021-10-31 12:34:31', '2021-10-31 12:34:34', '141e52e1-2679-48f3-80f6-70644ba84ede'),
(235, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:31', '2021-10-31 12:34:31', '2021-10-31 12:34:34', '5fd226e2-bdb9-44b4-9260-469292c67366'),
(236, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:34', '2021-10-31 12:34:34', '2021-10-31 12:34:35', '03cb5963-8de5-41c4-ac92-c63861a8b18a'),
(237, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:34', '2021-10-31 12:34:34', '2021-10-31 12:34:35', '0ccd3d93-53f7-4006-bd59-c0c75694734a'),
(238, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:34', '2021-10-31 12:34:34', '2021-10-31 12:34:35', '0ce1e2df-bfc0-4caa-af22-7e946614d9d3'),
(239, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:34', '2021-10-31 12:34:34', '2021-10-31 12:34:35', '2135fb76-a833-498a-951c-2850d27a4068'),
(240, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:34', '2021-10-31 12:34:34', '2021-10-31 12:34:35', '7c2b4ba7-5b6d-4bea-a479-77e6bd9f5686'),
(241, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:34', '2021-10-31 12:34:34', '2021-10-31 12:34:35', '2ddc334c-b5be-4f27-af42-d96904f49b85'),
(242, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:35', '2021-10-31 12:34:35', '2021-10-31 12:34:36', '958eccdf-b0df-4e9d-b534-7ca0d4557df6'),
(243, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:35', '2021-10-31 12:34:35', '2021-10-31 12:34:36', '3acbeb4d-9edf-4759-9d81-d548d5ad91fd'),
(244, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:35', '2021-10-31 12:34:35', '2021-10-31 12:34:36', '5e3d31a1-dd88-4bee-a2c6-664a2b31ae53'),
(245, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:35', '2021-10-31 12:34:35', '2021-10-31 12:34:36', '46af0ad8-5af4-45d7-b27c-b01161c1ae03'),
(246, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:35', '2021-10-31 12:34:35', '2021-10-31 12:34:36', '2f15f7cf-f5e1-4643-aa98-c0feac54f253'),
(247, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:35', '2021-10-31 12:34:35', '2021-10-31 12:34:36', '31454388-070a-4865-99c1-21b2c5f82a88'),
(248, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:36', '2021-10-31 12:34:36', '2021-10-31 12:34:42', '3101afe2-1110-4f7d-bd84-2cc228b1b05f'),
(249, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:36', '2021-10-31 12:34:36', '2021-10-31 12:34:42', '1b4e4fb8-9f3e-444f-b419-6cb7a323b263'),
(250, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:36', '2021-10-31 12:34:36', '2021-10-31 12:34:42', '3c552233-e626-4477-b8cc-49cf8823ea8f'),
(251, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:36', '2021-10-31 12:34:36', '2021-10-31 12:34:42', 'cd33def2-e3d5-4184-91cb-8d5ee9b2f856'),
(252, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:36', '2021-10-31 12:34:36', '2021-10-31 12:34:42', '0c2ab124-87a8-4e95-9abe-60d3455bfcfd'),
(253, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:36', '2021-10-31 12:34:36', '2021-10-31 12:34:42', 'a8fdbf2d-8f87-4719-aa31-a34610af8d59'),
(254, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:42', '2021-10-31 12:34:42', '2021-10-31 12:34:48', '1996ddf6-57b8-4aac-9ba2-ce40134fb917'),
(255, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:42', '2021-10-31 12:34:42', '2021-10-31 12:34:48', '06446527-c9fc-446c-89a6-ce3efbbf6769'),
(256, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:42', '2021-10-31 12:34:42', '2021-10-31 12:34:48', '54c1e36b-912b-4d6a-863d-8ef164ef236e'),
(257, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:42', '2021-10-31 12:34:42', '2021-10-31 12:34:48', '92679aa7-0f0d-459f-a160-aa5f55d6a06a'),
(258, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:42', '2021-10-31 12:34:42', '2021-10-31 12:34:48', '0d28b76b-e912-4d53-8b76-eb7c8f1edfcc'),
(259, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:42', '2021-10-31 12:34:42', '2021-10-31 12:34:48', '59c20689-6f58-4313-87da-4f0d9c95f8ca'),
(260, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:47', '2021-10-31 12:34:47', '2021-10-31 12:34:49', 'b8c3889d-a188-41a8-92ff-4e9526db7c89'),
(261, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:47', '2021-10-31 12:34:47', '2021-10-31 12:34:49', '4285c10a-4ee5-4897-bf98-b128857927f9'),
(262, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:47', '2021-10-31 12:34:47', '2021-10-31 12:34:49', 'b4a9124f-078b-4ce7-9d2c-1de08d765820'),
(263, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:47', '2021-10-31 12:34:47', '2021-10-31 12:34:49', '91d812a3-f69c-4c3b-bf78-b3a622657fbf'),
(264, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:47', '2021-10-31 12:34:47', '2021-10-31 12:34:49', 'b3464046-6e9d-4529-9921-1251e629f33c'),
(265, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:47', '2021-10-31 12:34:47', '2021-10-31 12:34:49', '12141d28-25ba-44d0-b3c1-38ea7121336b'),
(266, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:49', '2021-10-31 12:34:49', '2021-10-31 12:34:56', '3bfbdd69-29d4-4a97-b31b-6460dc553f9e'),
(267, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:49', '2021-10-31 12:34:49', '2021-10-31 12:34:56', 'cb2489df-0a43-420b-85b0-1215ee8f32c5'),
(268, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:49', '2021-10-31 12:34:49', '2021-10-31 12:34:56', '5b64de52-3dc5-4996-9b80-610925758c06'),
(269, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:49', '2021-10-31 12:34:49', '2021-10-31 12:34:56', 'b5218e06-ee34-4f17-a1f5-e5390a48bfe2'),
(270, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:49', '2021-10-31 12:34:49', '2021-10-31 12:34:56', '7d374046-295a-4840-be1e-15251c1b84e1'),
(271, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:49', '2021-10-31 12:34:49', '2021-10-31 12:34:56', '0925ecfb-6b4f-4dc1-a3b2-dac3841f2994'),
(272, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:56', '2021-10-31 12:34:56', '2021-10-31 12:35:04', '068dedf6-9d27-45b2-9b8e-73b8fa52762b'),
(273, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:56', '2021-10-31 12:34:56', '2021-10-31 12:35:04', '7257a26c-5470-47c9-a2d7-ccf6a06a1ff4'),
(274, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:56', '2021-10-31 12:34:56', '2021-10-31 12:35:04', 'b66e5f80-717b-4670-9de6-19f0d0a873a1'),
(275, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:56', '2021-10-31 12:34:56', '2021-10-31 12:35:04', '416cc4b2-d496-4881-8bf9-8885e045d77a'),
(276, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:56', '2021-10-31 12:34:56', '2021-10-31 12:35:04', '50b682af-aea0-4c87-8f1b-0d1d7014e020'),
(277, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:56', '2021-10-31 12:34:56', '2021-10-31 12:35:04', '0abf689a-ef64-4ee1-92c0-15381b8689dd'),
(278, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:34:56', '2021-10-31 12:34:56', '2021-10-31 12:35:04', '19a78b67-6985-41db-b2a4-85c9fe7fbeaf'),
(279, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:04', '2021-10-31 12:35:04', '2021-10-31 12:35:09', '1d31ead2-f7db-438f-bd45-3d287b9193a3'),
(280, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:04', '2021-10-31 12:35:04', '2021-10-31 12:35:09', '4a80f308-2636-4192-ad2b-63fec6500bad'),
(281, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:04', '2021-10-31 12:35:04', '2021-10-31 12:35:09', 'c062693d-c056-43ec-a0f0-c81f1153e2c8'),
(282, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:04', '2021-10-31 12:35:04', '2021-10-31 12:35:09', '50471bac-5250-4deb-839a-ad349b613ca9'),
(283, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:04', '2021-10-31 12:35:04', '2021-10-31 12:35:09', '53ab0b4e-b551-48ee-9fee-8fa01da8645d'),
(284, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:04', '2021-10-31 12:35:04', '2021-10-31 12:35:09', '366388eb-8a8b-400f-8647-0bd77b2879d7'),
(285, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:04', '2021-10-31 12:35:04', '2021-10-31 12:35:09', '33b46504-cdbe-46a5-8736-daa672c63102'),
(286, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:09', '2021-10-31 12:35:09', '2021-10-31 12:35:12', '736f3041-88ed-419c-acf1-3158ade19229'),
(287, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:09', '2021-10-31 12:35:09', '2021-10-31 12:35:12', '2d94a346-f17c-4c10-8b11-c412db35af3f'),
(288, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:09', '2021-10-31 12:35:09', '2021-10-31 12:35:12', 'c23510b6-cc77-4394-a182-31d8bb85ea14'),
(289, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:09', '2021-10-31 12:35:09', '2021-10-31 12:35:12', 'b4a1c238-4fd4-4288-8764-dbe68ff09418'),
(290, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:09', '2021-10-31 12:35:09', '2021-10-31 12:35:12', 'c1b2a368-14a1-48ec-b2fe-936e91af28ca'),
(291, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:09', '2021-10-31 12:35:09', '2021-10-31 12:35:12', 'b6623cd1-f2f6-4c2c-b7f1-313e0912a48a'),
(292, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:09', '2021-10-31 12:35:09', '2021-10-31 12:35:12', 'f0358d59-2b8e-4887-893d-cf49414965c0'),
(293, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:12', '2021-10-31 12:35:12', '2021-10-31 12:35:15', '9f692345-e70a-4de1-af42-938912f2050f'),
(294, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:12', '2021-10-31 12:35:12', '2021-10-31 12:35:15', 'd44bc3bd-96da-4f40-ae4d-30cee4a73da1'),
(295, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:12', '2021-10-31 12:35:12', '2021-10-31 12:35:15', '3e40cffc-889e-4119-bd95-0762b7a292bb'),
(296, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:12', '2021-10-31 12:35:12', '2021-10-31 12:35:15', 'e012a4f9-397b-4768-9ae6-33ad8fe67675'),
(297, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:12', '2021-10-31 12:35:12', '2021-10-31 12:35:15', '99e57bc9-7083-4744-aad0-a69ecd68d529'),
(298, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:12', '2021-10-31 12:35:12', '2021-10-31 12:35:15', '7c70bc96-b0e6-44d8-a795-92e5bbadf6b3'),
(299, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:12', '2021-10-31 12:35:12', '2021-10-31 12:35:15', '07789437-238b-4160-8c2b-42792632f194'),
(300, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:15', '2021-10-31 12:35:15', '2021-10-31 12:35:18', 'da127697-034c-466b-b0af-b052de955452'),
(301, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:15', '2021-10-31 12:35:15', '2021-10-31 12:35:19', 'd0ed9e20-c4de-4425-b0b3-51825bf6bfb1'),
(302, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:15', '2021-10-31 12:35:15', '2021-10-31 12:35:19', '183f8f9e-f312-4ad8-b37a-1a92e5bfdbbe'),
(303, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:15', '2021-10-31 12:35:15', '2021-10-31 12:35:19', 'b5830df8-8572-4aa8-b17d-aa02da552105'),
(304, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:15', '2021-10-31 12:35:15', '2021-10-31 12:35:19', 'd2986696-5942-4fc8-a572-2c9e728b9696'),
(305, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:15', '2021-10-31 12:35:15', '2021-10-31 12:35:19', 'ec745e54-fc34-4014-8b5c-832ae9289a3e'),
(306, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:15', '2021-10-31 12:35:15', '2021-10-31 12:35:19', '1ac10d9a-807d-42fa-b942-22f60eef50ee'),
(307, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:15', '2021-10-31 12:35:15', '2021-10-31 12:35:19', '27986c01-538b-4413-825a-1a42d994f1db'),
(308, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:18', '2021-10-31 12:35:18', '2021-10-31 12:35:19', '78b044f7-5364-44df-9633-f09dea03166d'),
(309, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:18', '2021-10-31 12:35:18', '2021-10-31 12:35:19', '9344e019-f755-48b8-8357-cc682762aec4'),
(310, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:18', '2021-10-31 12:35:18', '2021-10-31 12:35:19', '8997de9a-0d09-43a8-8524-52ed6fcd6a8a'),
(311, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:18', '2021-10-31 12:35:18', '2021-10-31 12:35:19', '35f00107-04cb-42ab-846d-017f28bb202a'),
(312, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:18', '2021-10-31 12:35:18', '2021-10-31 12:35:19', 'ad51e185-bc4b-4959-b760-3217fb05c8eb'),
(313, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:18', '2021-10-31 12:35:18', '2021-10-31 12:35:19', '097f4ce8-8a2a-48cd-a7c0-2c3ef7d9317f'),
(314, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:18', '2021-10-31 12:35:18', '2021-10-31 12:35:19', '40978ce8-41e6-449b-96bc-0ef49fee6be5'),
(315, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:18', '2021-10-31 12:35:18', '2021-10-31 12:35:19', 'afb9e1c7-ac4d-41b2-bad8-ecebe5379b44');
INSERT INTO `elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(316, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:19', '2021-10-31 12:35:19', '2021-10-31 12:35:25', '62535033-7f45-4178-af84-0f916656b85a'),
(317, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:19', '2021-10-31 12:35:19', '2021-10-31 12:35:25', '14288429-15ec-412f-9b07-60c7bd9d2e9b'),
(318, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:19', '2021-10-31 12:35:19', '2021-10-31 12:35:25', '5b8386c2-3dcf-4580-b386-068b42500555'),
(319, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:19', '2021-10-31 12:35:19', '2021-10-31 12:35:25', '7747a7e7-45ab-4775-bd70-5cacf6faa174'),
(320, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:19', '2021-10-31 12:35:19', '2021-10-31 12:35:25', 'a24f558f-1d02-4ca6-93d5-0fc60c0c14f5'),
(321, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:19', '2021-10-31 12:35:19', '2021-10-31 12:35:25', '4c2a8143-a5e5-4a21-9ae4-eeacd1c6b59e'),
(322, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:19', '2021-10-31 12:35:19', '2021-10-31 12:35:25', '48a92417-5def-4cca-8231-1aca7688d5a1'),
(323, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:19', '2021-10-31 12:35:19', '2021-10-31 12:35:25', '3ebb59ba-2d4a-4b67-8383-f14e881a8b53'),
(324, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:25', '2021-10-31 12:35:25', '2021-10-31 12:35:28', 'd5960377-1674-4e52-ae0f-4a93aaf705f7'),
(325, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:25', '2021-10-31 12:35:25', '2021-10-31 12:35:28', '799871ba-181d-4349-96fd-e8b15c5eadcc'),
(326, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:25', '2021-10-31 12:35:25', '2021-10-31 12:35:28', '2b0a7d3c-2b6b-4696-b060-a27372b66c32'),
(327, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:25', '2021-10-31 12:35:25', '2021-10-31 12:35:28', '10652226-f3f9-47d1-a2db-bd260e404210'),
(328, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:25', '2021-10-31 12:35:25', '2021-10-31 12:35:28', '38fe41b3-4a28-41f2-90ab-45c9ad3c2d9d'),
(329, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:25', '2021-10-31 12:35:25', '2021-10-31 12:35:28', 'f9eb7cb7-e746-4bcd-8985-3ab9e0e0b514'),
(330, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:25', '2021-10-31 12:35:25', '2021-10-31 12:35:28', 'ed35688b-97b4-4030-8175-2c53d01959ee'),
(331, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:25', '2021-10-31 12:35:25', '2021-10-31 12:35:28', 'f3613c38-6808-4e39-b6a6-149b8338beed'),
(332, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:27', '2021-10-31 12:35:27', '2021-10-31 12:35:31', 'ffc42679-f3b3-468f-9416-1720db44280f'),
(333, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:28', '2021-10-31 12:35:28', '2021-10-31 12:35:31', '597d880b-47ce-40a4-a152-49071e0e7b50'),
(334, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:28', '2021-10-31 12:35:28', '2021-10-31 12:35:31', '5d014af5-099e-4849-bb2b-956d33655f71'),
(335, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:28', '2021-10-31 12:35:28', '2021-10-31 12:35:31', '30fd9b0c-7365-4925-8c4c-bb3d6e5cb340'),
(336, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:28', '2021-10-31 12:35:28', '2021-10-31 12:35:31', 'f0d99aa4-c29f-4df1-a91b-9b83dc9b9286'),
(337, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:28', '2021-10-31 12:35:28', '2021-10-31 12:35:31', '0ca28e68-8953-40e6-aa33-0d2986cd1bbb'),
(338, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:28', '2021-10-31 12:35:28', '2021-10-31 12:35:31', 'd5629df9-1f0d-4b55-8c4b-bd520e3d7275'),
(339, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:28', '2021-10-31 12:35:28', '2021-10-31 12:35:31', '68d0cb84-3668-473a-83ef-f96fd1a2e50d'),
(340, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:31', '2021-10-31 12:35:31', '2021-10-31 12:35:32', '7c5f5de7-d8a2-414a-9368-a5ea858d816e'),
(341, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:31', '2021-10-31 12:35:31', '2021-10-31 12:35:32', '2b3c3ef1-3642-4011-bf6d-ba583dda4aa3'),
(342, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:31', '2021-10-31 12:35:31', '2021-10-31 12:35:32', '4c203330-9a3e-415c-9977-0c64eccba25d'),
(343, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:31', '2021-10-31 12:35:31', '2021-10-31 12:35:32', '0f160b53-715a-427a-b5e5-9d5fcf7df48b'),
(344, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:31', '2021-10-31 12:35:31', '2021-10-31 12:35:32', 'cb3018f4-4cb8-4241-b8d2-52b2ce59a868'),
(345, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:31', '2021-10-31 12:35:31', '2021-10-31 12:35:32', '0fd13d85-e7ea-45f3-b7ff-dd7c12d1f20c'),
(346, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:31', '2021-10-31 12:35:31', '2021-10-31 12:35:32', '12aa15a8-6501-4b57-a52f-b429c4bc5222'),
(347, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:31', '2021-10-31 12:35:31', '2021-10-31 12:35:32', 'e24d8510-0af3-42f7-98ea-63839de86f4e'),
(348, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:32', '2021-10-31 12:35:32', '2021-10-31 12:35:34', '4c384bc7-9a59-4bef-9651-9e1eecdefdcb'),
(349, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:32', '2021-10-31 12:35:32', '2021-10-31 12:35:34', 'ff877a46-09fc-492d-85bf-736c5acea976'),
(350, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:32', '2021-10-31 12:35:32', '2021-10-31 12:35:34', '39ba5101-4709-43a7-ab9f-67bfd7250b21'),
(351, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:32', '2021-10-31 12:35:32', '2021-10-31 12:35:34', '59037c68-8e07-477a-bd24-7bb3f77f9487'),
(352, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:32', '2021-10-31 12:35:32', '2021-10-31 12:35:34', '72f53f33-9772-4c26-bc96-11134062cb00'),
(353, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:32', '2021-10-31 12:35:32', '2021-10-31 12:35:34', 'd02f860e-1d77-4ba1-9d39-4d991474443c'),
(354, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:32', '2021-10-31 12:35:32', '2021-10-31 12:35:34', '9a158853-e426-40bc-a7fd-4140de7e6130'),
(355, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:32', '2021-10-31 12:35:32', '2021-10-31 12:35:34', 'e5d49473-6744-426d-b985-03bb0d47bae2'),
(356, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:34', '2021-10-31 12:35:34', '2021-10-31 12:35:38', 'cb13a779-9a93-4804-9f90-f84e299fa511'),
(357, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:34', '2021-10-31 12:35:34', '2021-10-31 12:35:38', '95c9dd49-6293-4729-81cc-bf0f19d63ea7'),
(358, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:34', '2021-10-31 12:35:34', '2021-10-31 12:35:38', '51038f1a-6836-45c3-8ec0-5cd178453fc3'),
(359, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:34', '2021-10-31 12:35:34', '2021-10-31 12:35:38', '2fa56151-2ea0-4123-afc7-f02be09843c4'),
(360, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:34', '2021-10-31 12:35:34', '2021-10-31 12:35:38', '86bb5d47-f991-4f2f-85f0-b19bc604ac56'),
(361, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:34', '2021-10-31 12:35:34', '2021-10-31 12:35:38', 'ceba0228-e26b-480e-a5a8-c86cec255a4e'),
(362, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:34', '2021-10-31 12:35:34', '2021-10-31 12:35:38', '1b998090-e663-4c0e-b4ea-cacd35a48e95'),
(363, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:34', '2021-10-31 12:35:34', '2021-10-31 12:35:38', '61bd969a-5a72-4903-af78-ab730f8107d2'),
(364, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '2021-10-31 12:35:56', '8179a7ca-8146-417a-b0ed-f121365338b1'),
(365, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '2021-10-31 12:35:56', '2d840764-903a-40b8-976a-37f5786f0df1'),
(366, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '2021-10-31 12:35:56', '718d253e-74b1-42f5-a682-416dce54f22b'),
(367, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '2021-10-31 12:35:56', 'fdf93c44-7a9b-422b-ba49-03dcfcf4bc8e'),
(368, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '2021-10-31 12:35:56', '74e474fb-dce5-4f78-8800-b778a761cc68'),
(369, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '2021-10-31 12:35:56', 'ab2dc50f-60f2-49eb-8a38-37ca71635e93'),
(370, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '2021-10-31 12:35:56', '8591c240-72d1-41fb-9e4d-94d2a18533ff'),
(371, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '2021-10-31 12:35:56', 'd8f0ab52-40ec-4b57-9717-a6426b687cb8'),
(372, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:56', '2021-10-31 12:35:56', '2021-10-31 12:36:57', '94ad3b79-9f26-4ca2-9d52-988d9970c415'),
(373, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:56', '2021-10-31 12:35:56', '2021-10-31 12:36:57', '8a72687b-a678-4150-96fb-1944bcd41fd6'),
(374, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:56', '2021-10-31 12:35:56', '2021-10-31 12:36:57', '1b49e3b2-83df-4f13-8049-5703869c547d'),
(375, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:56', '2021-10-31 12:35:56', '2021-10-31 12:36:57', 'a49d0f2d-1ab0-4434-9a97-763ea7d13189'),
(376, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:56', '2021-10-31 12:35:56', '2021-10-31 12:36:57', '24fec7d5-37f1-47f1-85fa-80ab47eaf466'),
(377, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:56', '2021-10-31 12:35:56', '2021-10-31 12:36:57', '3edcc607-f81a-40aa-ad19-f503635e5b1f'),
(378, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:56', '2021-10-31 12:35:56', '2021-10-31 12:36:57', '0456ce0e-a26a-4f31-8e83-dda655a67583'),
(379, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:35:56', '2021-10-31 12:35:56', '2021-10-31 12:36:57', '89adf282-cc54-427b-b4da-526e24b4dead'),
(380, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '2021-10-31 12:37:03', 'e2737ec1-2752-433a-8d23-2fa98dcaad2f'),
(381, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '2021-10-31 12:37:03', '09042c27-e50f-4f77-b968-ee9505e8a0bc'),
(382, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '2021-10-31 12:37:03', 'e7f6b7e1-16ab-4e91-b650-c740fe11ee10'),
(383, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '2021-10-31 12:37:03', '27bf7aae-9445-44a9-8b88-1a5e879fa75c'),
(384, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '2021-10-31 12:37:03', 'f8512d40-e31d-4f4b-82a9-62c70bb206af'),
(385, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '2021-10-31 12:37:03', 'c623527f-f608-40e5-b71f-785e445d8288'),
(386, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '2021-10-31 12:37:03', 'aa1c0b6b-b78e-45ab-9161-c6219a903b46'),
(387, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '2021-10-31 12:37:03', 'd874770e-e38f-40ba-b038-cf6ebcb8381a'),
(388, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '2021-10-31 12:37:03', '42d39b3c-fee2-4ab6-ab11-dfada4025548'),
(389, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '2021-10-31 12:37:12', '055bf9d3-492b-4456-9a97-80c056819ebc'),
(390, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '2021-10-31 12:37:12', '8eb099f6-f9a5-4650-814a-ed1118d926e5'),
(391, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '2021-10-31 12:37:12', '63110a3d-7ed2-426e-8085-8579a60f328a'),
(392, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '2021-10-31 12:37:12', '301c7c64-cac6-47b0-b1a9-535fe080b151'),
(393, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '2021-10-31 12:37:12', '1936ec83-efea-4ded-8fdb-b1558543a422'),
(394, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '2021-10-31 12:37:12', '93be395f-caf1-4ba8-9643-37c748ac7635'),
(395, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '2021-10-31 12:37:12', '5108770f-9076-44b3-8382-57070b2c27cb'),
(396, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '2021-10-31 12:37:12', '99c3256d-d3eb-4f0a-8f16-1609b9185123'),
(397, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '2021-10-31 12:37:12', '7d65d59d-6931-43cd-ae27-6766a5d8ec1b'),
(398, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '2021-10-31 12:37:15', '570272b4-8a80-45d2-a302-07500c679a4a'),
(399, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '2021-10-31 12:37:15', '114d1939-462c-4d9c-b6eb-eb701f5be7ff'),
(400, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '2021-10-31 12:37:15', '568977f0-8bc4-4220-bb37-653c119d5c23'),
(401, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '2021-10-31 12:37:15', 'c020c31a-6695-44b5-bf69-d90543c2f616'),
(402, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '2021-10-31 12:37:15', '5d6c601d-1dc7-45c6-9d04-ed99ac2ba96a'),
(403, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '2021-10-31 12:37:15', 'ef378a6c-fb36-4da9-a060-613fb78f2288'),
(404, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '2021-10-31 12:37:15', '3a5326b8-ea29-4271-a1b6-2e16b9c3dde6'),
(405, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '2021-10-31 12:37:15', '54bb7e78-854e-4d63-8050-a65704c367b3'),
(406, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '2021-10-31 12:37:15', 'c541ae01-4524-4c2f-a4b5-f0e8e8829fef'),
(407, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:14', '2021-10-31 12:37:14', '2021-10-31 12:37:22', 'd8c7b53f-b213-435b-9291-d08b85b72d7c'),
(408, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:15', '2021-10-31 12:37:15', '2021-10-31 12:37:22', '81757aad-3d41-49c8-b21e-69054c7a6ff8'),
(409, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:15', '2021-10-31 12:37:15', '2021-10-31 12:37:22', 'ccd93c8b-b143-416e-92d3-5d677d95969f'),
(410, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:15', '2021-10-31 12:37:15', '2021-10-31 12:37:22', '290e64b1-6422-45bc-87fb-740f1d8143cd'),
(411, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:15', '2021-10-31 12:37:15', '2021-10-31 12:37:22', '1d2451e2-68e4-40db-b477-11b305fb50b6'),
(412, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:15', '2021-10-31 12:37:15', '2021-10-31 12:37:22', 'fbacfc86-1600-4ede-8ca5-c8baba7ff83c'),
(413, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:15', '2021-10-31 12:37:15', '2021-10-31 12:37:22', 'a071c1e1-105f-4838-975e-ce115048b0c7'),
(414, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:15', '2021-10-31 12:37:15', '2021-10-31 12:37:22', '25fd442b-76aa-48bc-81d3-6424f85c7c44'),
(415, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:15', '2021-10-31 12:37:15', '2021-10-31 12:37:22', 'c7832027-0f67-48fb-9924-54f31e08759b'),
(416, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '2021-10-31 12:37:43', '33f7827d-3728-40a9-ade8-e043079fd392'),
(417, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '2021-10-31 12:37:44', '46f50371-edde-49ad-955f-194c726e6f02'),
(418, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '2021-10-31 12:37:44', '5f3e3225-ca10-402d-bfaf-f247a5fe70a9'),
(419, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '2021-10-31 12:37:44', '5845fd45-86ed-496e-90b7-9a2c15cebbed'),
(420, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '2021-10-31 12:37:44', '25063ad9-a07b-4dbb-8aba-f2bb5a473272'),
(421, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '2021-10-31 12:37:44', '5c0d1235-f925-40d0-955c-548e4ada1edc'),
(422, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '2021-10-31 12:37:44', '72b8440d-306a-48a9-8c2f-ca2e2db8572e'),
(423, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '2021-10-31 12:37:44', '9f9f18c4-2048-4665-a508-e202ba1a39b1'),
(424, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '2021-10-31 12:37:44', '79f80cf0-2012-4d89-bf62-5484947f1522'),
(434, NULL, NULL, 10, 'craft\\elements\\Entry', 1, 0, '2021-10-31 12:37:44', '2021-10-31 16:23:20', NULL, 'd03701bf-d06d-4884-8a0e-b481fa85e144'),
(435, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:43', '2021-10-31 14:01:40', '4c7c1e95-c769-4707-a9fd-556839fd1f90'),
(436, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:43', '2021-10-31 14:01:40', '83772ad6-33a2-4d85-ad7d-ac74a58d23a4'),
(437, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:43', '2021-10-31 14:01:40', 'd4719163-854a-4917-aa81-794ad51d842a'),
(438, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:43', '2021-10-31 14:01:40', '9b1edeb5-08b1-43a9-984f-8ba63c96be8e'),
(439, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:43', '2021-10-31 14:01:40', 'd494d175-12b6-4b71-b5ec-53df619a7052'),
(440, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:43', '2021-10-31 14:01:40', '22ccd01d-0e7f-42df-bff8-41b0537d163f'),
(441, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:43', '2021-10-31 14:01:40', 'f706a8e6-e37e-4cd2-bd27-19864d517485'),
(442, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:43', '2021-10-31 14:01:40', '7194f5c4-c6b7-4714-9350-aafdcd575bf5'),
(443, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:43', '2021-10-31 14:01:40', '460ca8e0-47a5-4dc1-b395-dca952e1a236'),
(444, NULL, 25, 10, 'craft\\elements\\Entry', 1, 0, '2021-10-31 12:37:43', '2021-10-31 12:37:43', NULL, '4f142b6f-acf9-4d1c-80f9-b3e40ae35887'),
(445, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:43', NULL, '5ca835be-4692-4f49-a358-6edb8884179d'),
(446, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:43', NULL, '067d67af-86d4-4a8d-ba66-9f0a1b96a2fe'),
(447, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:43', NULL, '4ef7d24c-db28-48b5-bf33-eff0f260af0d'),
(448, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:43', NULL, 'e3504c4b-0670-45eb-8521-224a148608d4'),
(449, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:43', NULL, '993ceb46-8be1-42ce-af06-9d4ffba25793'),
(450, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:43', NULL, 'adf82c5e-65e0-43a1-9c1f-93063a2b7d27'),
(451, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:43', NULL, '52dd7bdd-9e24-417d-915e-e9c41564534a'),
(452, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:43', NULL, '84aa4714-d609-467f-950a-1967307626b5'),
(453, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:43', NULL, '7b5a3d34-ecdc-449c-946e-5a9b5e8fe319'),
(464, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 14:01:39', '2021-10-31 16:23:20', NULL, '2f05eb0a-ef90-4799-9bd7-bbbe82a99d4e'),
(465, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 14:01:39', '2021-10-31 16:23:20', NULL, '0bca4290-5f62-4ebe-b884-57fb4ce3913e'),
(466, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 14:01:40', '2021-10-31 16:23:20', NULL, 'bea4668a-550a-468b-ad0f-e9268efdac9b'),
(467, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 14:01:40', '2021-10-31 16:23:20', NULL, 'd4c39161-25cd-44ac-adeb-98f9df604aa0'),
(468, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 14:01:40', '2021-10-31 16:23:20', NULL, 'dd660b93-c869-463c-9bb9-e34149129915'),
(469, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 14:01:40', '2021-10-31 16:23:20', NULL, '8627abfe-339a-4a10-a496-8be52685de4a'),
(470, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 14:01:40', '2021-10-31 16:23:20', NULL, '756c4d48-1e5d-4de0-aa3e-7d5dec9df767'),
(471, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 14:01:40', '2021-10-31 16:23:20', NULL, '90c0c606-5958-4beb-b737-4ea557214017'),
(472, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 14:01:40', '2021-10-31 16:23:20', NULL, 'c6c26960-8f4c-44b0-ab6d-aadfd0946afc'),
(473, NULL, 26, 10, 'craft\\elements\\Entry', 1, 0, '2021-10-31 14:01:39', '2021-10-31 14:01:39', NULL, 'd205503b-4ed9-429a-8fd8-49de03a0a7d5'),
(474, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 14:01:40', '2021-10-31 14:01:39', NULL, '93437402-84d6-4d25-abf4-219945757c65'),
(475, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 14:01:40', '2021-10-31 14:01:39', NULL, '339f6eff-6394-4cf1-ae6d-12945aae1472'),
(476, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 14:01:40', '2021-10-31 14:01:39', NULL, 'd1ecd22b-2b70-417d-a7d0-f2794082a8f3'),
(477, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 14:01:40', '2021-10-31 14:01:39', NULL, '72ee1af7-da65-4048-a3ec-d5bda992f1ec'),
(478, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 14:01:40', '2021-10-31 14:01:39', NULL, '94856ad0-5d6e-4779-b871-e039d8d8cb9f'),
(479, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 14:01:40', '2021-10-31 14:01:39', NULL, '49f53fb6-2b34-41e6-9c44-9924bd758750'),
(480, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 14:01:40', '2021-10-31 14:01:39', NULL, 'b11d9988-1c4e-4c84-b94b-6fe899d6aadd'),
(481, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 14:01:40', '2021-10-31 14:01:39', NULL, '1af6e5b8-6ec6-400a-b5fb-3f807457fe84'),
(482, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 14:01:40', '2021-10-31 14:01:39', NULL, '32a3b487-7925-41c8-8101-4459f5a9a1c4'),
(483, NULL, 27, 10, 'craft\\elements\\Entry', 1, 0, '2021-10-31 16:02:15', '2021-10-31 16:02:15', NULL, '0391159b-5cad-4291-8fc7-2051ad21895e'),
(484, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:02:15', '2021-10-31 16:02:15', NULL, '884d34c2-f9de-4ba0-86a1-df9ea34ec545'),
(485, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:02:15', '2021-10-31 16:02:15', NULL, 'bf72ff88-8e6f-4bc8-ac90-0ba923147aa6'),
(486, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:02:15', '2021-10-31 16:02:15', NULL, 'f9e073fe-b6c2-4fba-a384-38ccf4a8b19a'),
(487, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:02:15', '2021-10-31 16:02:15', NULL, '17956b4b-e55a-4dc9-b82b-bd7621867875'),
(488, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:02:15', '2021-10-31 16:02:15', NULL, '69b6c0ee-1677-46fd-aac5-fbbede870025'),
(489, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:02:15', '2021-10-31 16:02:15', NULL, '6bacd05c-1e26-4cb1-86e2-792951d6914e'),
(490, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:02:15', '2021-10-31 16:02:15', NULL, '57ba73f8-eeb2-49ae-b903-01e05ac6abde'),
(491, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:02:15', '2021-10-31 16:02:15', NULL, '6a0a6231-b508-464d-8299-2e48fe17b216'),
(492, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:02:15', '2021-10-31 16:02:15', NULL, 'a649c8c4-83f6-4918-b49e-e19ef775dd3f'),
(493, NULL, 28, 10, 'craft\\elements\\Entry', 1, 0, '2021-10-31 16:03:14', '2021-10-31 16:03:14', NULL, '076e52db-c23e-44c3-99fc-08a371cc8ca3'),
(494, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:03:14', '2021-10-31 16:03:14', NULL, '6fa7877d-4435-4752-b7ad-e464562ee9e5'),
(495, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:03:14', '2021-10-31 16:03:14', NULL, '27134274-81c3-4b4b-afec-f718939ed883'),
(496, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:03:14', '2021-10-31 16:03:14', NULL, '81947108-7245-4fd3-95af-3fa6543647bb'),
(497, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:03:14', '2021-10-31 16:03:14', NULL, '8ec970f1-95da-4a61-adf4-45d1225df880'),
(498, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:03:14', '2021-10-31 16:03:14', NULL, 'e03f221a-3788-475e-bef4-9b69d1e402be'),
(499, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:03:14', '2021-10-31 16:03:14', NULL, '7b0f2b87-0bf2-4ab2-ac97-af4ece9781ac'),
(500, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:03:14', '2021-10-31 16:03:14', NULL, '831fb09a-006e-44fe-8e1b-d651c6233af8'),
(501, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:03:14', '2021-10-31 16:03:14', NULL, 'edb7663b-8a26-4063-8f61-8d9cc5b78159'),
(502, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:03:14', '2021-10-31 16:03:14', NULL, '9ebf0a06-5d31-4308-aa98-08e7f6e3b970'),
(503, NULL, NULL, 11, 'craft\\elements\\Category', 1, 0, '2021-10-31 16:12:37', '2021-10-31 16:12:37', NULL, '9e2f15ae-002d-48a1-aefe-e74a684b91bc'),
(504, NULL, 29, 10, 'craft\\elements\\Entry', 1, 0, '2021-10-31 16:17:14', '2021-10-31 16:17:14', NULL, 'c96b776f-5fbd-4385-b783-98203a4a0580'),
(505, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:17:14', '2021-10-31 16:17:14', NULL, '83c4c52f-3960-4624-b976-176f786d7396'),
(506, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:17:15', '2021-10-31 16:17:14', NULL, '4cee2a37-dc7f-4d3d-8eb7-b290cac4bdff'),
(507, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:17:15', '2021-10-31 16:17:14', NULL, 'fe481bbe-fe60-4f1f-8267-d5af2b6503cf'),
(508, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:17:15', '2021-10-31 16:17:14', NULL, '27ac0355-3697-433b-95e4-820385d3ab54'),
(509, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:17:15', '2021-10-31 16:17:14', NULL, '395792c1-3b0f-4595-ab8a-cfca5e81d565'),
(510, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:17:15', '2021-10-31 16:17:14', NULL, '18aa5e38-5c76-42df-9836-017809d5ecb0'),
(511, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:17:15', '2021-10-31 16:17:14', NULL, '05cb4b7d-2c6f-49bd-8ec3-1cc5785b0348'),
(512, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:17:15', '2021-10-31 16:17:14', NULL, '47d8ce03-a0d2-47c7-9da1-76e899a275b8'),
(513, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:17:15', '2021-10-31 16:17:14', NULL, 'd6d4752b-8b1b-44e7-8a91-6c1d754c9c07'),
(514, NULL, 30, 1, 'craft\\elements\\Entry', 1, 0, '2021-10-31 16:18:54', '2021-10-31 16:18:54', NULL, '2cc58446-4773-4f74-a7be-929f57f470b2'),
(515, NULL, 31, 10, 'craft\\elements\\Entry', 1, 0, '2021-10-31 16:23:20', '2021-10-31 16:23:20', NULL, '7e229602-02fc-494f-b115-99af84e9b439'),
(516, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:23:21', '2021-10-31 16:23:20', NULL, 'f395e1b1-c318-4835-bfa6-840e7ac4976c'),
(517, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:23:21', '2021-10-31 16:23:20', NULL, '58f77963-018e-41d4-94aa-510c01ed68ba'),
(518, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:23:21', '2021-10-31 16:23:20', NULL, '43f74370-c338-417a-9d94-5366db60c6c3'),
(519, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:23:21', '2021-10-31 16:23:20', NULL, 'e2f88d3e-1c0f-4c3a-97aa-ed0e822db21d'),
(520, NULL, NULL, 9, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:23:21', '2021-10-31 16:23:20', NULL, '84cd6508-223d-4f29-8a90-bcb6c3dc8cf3'),
(521, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:23:21', '2021-10-31 16:23:20', NULL, '4f518e71-0164-4a81-aae1-0692f002104b'),
(522, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:23:21', '2021-10-31 16:23:20', NULL, 'a10d9201-0aa3-4fb2-999c-655592978eca'),
(523, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:23:21', '2021-10-31 16:23:20', NULL, '021561f7-ca6a-4fa4-9d78-df62f567e5c1'),
(524, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-10-31 16:23:21', '2021-10-31 16:23:20', NULL, '812e6e84-c7cb-484e-85bb-51c021afc476'),
(525, NULL, 32, 1, 'craft\\elements\\Entry', 1, 0, '2021-11-01 06:45:04', '2021-11-01 06:45:04', NULL, '7b1a3f8e-5865-48cf-9b17-a44973679819'),
(526, NULL, 33, 1, 'craft\\elements\\Entry', 1, 0, '2021-11-01 06:55:51', '2021-11-01 06:55:51', NULL, 'de1dc5d3-12fe-43f7-87e5-04365b67a184'),
(527, NULL, NULL, 11, 'craft\\elements\\Category', 1, 0, '2021-11-01 07:40:17', '2021-11-01 07:40:17', NULL, '9d34d405-20c7-42cb-b9e1-c7c7e888042c'),
(528, NULL, NULL, 10, 'craft\\elements\\Entry', 1, 0, '2021-11-01 07:49:07', '2021-11-01 07:49:07', NULL, '1764790b-e6ee-42f3-a10a-5b353486c6e5'),
(529, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-11-01 07:49:07', '2021-11-01 07:49:07', NULL, 'c92ca0ea-c333-4575-ba35-4ac95b7f1998'),
(530, NULL, 34, 10, 'craft\\elements\\Entry', 1, 0, '2021-11-01 07:49:07', '2021-11-01 07:49:07', NULL, 'b4c7a15a-fd62-4fd1-84a1-3a8d70d94771'),
(531, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-11-01 07:49:08', '2021-11-01 07:49:07', NULL, 'a0707a6f-4a41-4796-875f-2e1ff413e0c6'),
(532, NULL, 35, 1, 'craft\\elements\\Entry', 1, 0, '2021-11-01 07:49:20', '2021-11-01 07:49:20', NULL, '5e306c90-3de1-408c-81d6-de94c59a0cb0'),
(533, NULL, 36, 1, 'craft\\elements\\Entry', 1, 0, '2021-11-01 07:49:38', '2021-11-01 07:49:38', NULL, '0bb66414-cbe6-45ff-9c19-3b9edebfee66');

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
(1, 1, 1, NULL, NULL, 1, '2021-10-08 15:12:57', '2021-10-08 15:12:57', '21cb8fd1-7ca1-410a-b630-d10021c418f7'),
(2, 2, 1, '__temp_1HWn4exqf5d1E7x2HDOVvv855GrqLryV8w8n', 'drinks/__temp_1HWn4exqf5d1E7x2HDOVvv855GrqLryV8w8n', 1, '2021-10-30 07:51:20', '2021-10-30 07:51:20', '5d55b2a5-f2a8-4287-a281-468a6ef89ecf'),
(3, 3, 1, '__temp_MLZzAjsGUUPPKVJw78gop9UXHVGAc7TlF7FW', 'drinks/__temp_MLZzAjsGUUPPKVJw78gop9UXHVGAc7TlF7FW', 1, '2021-10-30 08:01:17', '2021-10-30 08:01:17', '92b828ea-9c36-424b-8654-c355e7bd7d3d'),
(4, 4, 1, '__temp_bdX4HmdJ006yhGrMi9iTpeQpdy5iq5kpBcGL', 'drinks/__temp_bdX4HmdJ006yhGrMi9iTpeQpdy5iq5kpBcGL', 1, '2021-10-30 08:41:11', '2021-10-30 08:41:11', '14f653fb-4cbf-42ef-9327-bf2c72ffd3e4'),
(5, 5, 1, '__temp_dgVLdYjKkW6aKk7VJK7AjzpIVP1n2oCuM9pu', 'news/__temp_dgVLdYjKkW6aKk7VJK7AjzpIVP1n2oCuM9pu', 1, '2021-10-30 08:49:26', '2021-10-30 08:49:26', 'a17c4b8e-7fc3-4817-9b1a-9a321956680a'),
(6, 6, 1, '__temp_OHghDD9eEzpNja5OdxEdXfDsiBWrIFtBW6Ic', 'drinks/__temp_OHghDD9eEzpNja5OdxEdXfDsiBWrIFtBW6Ic', 1, '2021-10-30 08:49:31', '2021-10-30 08:49:31', '1fda2d38-89ab-459a-aa74-55b076767c16'),
(8, 8, 1, 'espresso', 'drinks/espresso', 1, '2021-10-30 08:54:36', '2021-10-30 08:54:36', '5e5d1263-a5cc-452f-bfdf-1ad275e4a6da'),
(9, 9, 1, 'espresso', 'drinks/espresso', 1, '2021-10-30 08:54:36', '2021-10-30 08:54:36', '3f485aff-19a1-49bf-82f6-2b5621709f47'),
(10, 10, 1, 'espresso', 'drinks/espresso', 1, '2021-10-30 08:54:51', '2021-10-30 08:54:51', '67d15046-67ca-4fd5-8d58-6f66bee009d3'),
(11, 11, 1, '__temp_zMeiqRNjkeP8lhNyjLitIfM2YZ7oTtjJeJF5', 'news/__temp_zMeiqRNjkeP8lhNyjLitIfM2YZ7oTtjJeJF5', 1, '2021-10-30 08:56:16', '2021-10-30 08:56:16', 'd6146b04-e3a5-4431-a994-eda665bcd325'),
(13, 13, 1, 'new-coffee-coming-soon', 'news/new-coffee-coming-soon', 1, '2021-10-30 08:58:07', '2021-10-30 08:58:07', 'a32da7c7-96d4-4638-b31f-8411cfeac970'),
(14, 14, 1, 'new-coffee-coming-soon', 'news/new-coffee-coming-soon', 1, '2021-10-30 08:58:08', '2021-10-30 08:58:08', '93fecd7b-7094-49fd-8394-fec127eb523f'),
(15, 15, 1, 'homepage', '__home__', 1, '2021-10-30 09:02:53', '2021-10-30 09:02:53', '385078fa-2783-4052-9983-1730a0a21389'),
(16, 16, 1, 'homepage', '__home__', 1, '2021-10-30 09:02:53', '2021-10-30 09:02:53', '4cb5be3c-9ab9-49a9-a294-291c35ae6f4d'),
(17, 17, 1, 'homepage', '__home__', 1, '2021-10-30 09:03:04', '2021-10-30 09:03:04', '119898a9-aa3d-4dec-a233-3aa2ff199f9a'),
(18, 18, 1, 'homepage', '__home__', 1, '2021-10-30 09:03:05', '2021-10-30 09:03:05', '87960156-3d7a-4091-94b7-d7aa8a2fd6dd'),
(19, 19, 1, 'homepage', '__home__', 1, '2021-10-30 09:04:42', '2021-10-30 09:04:42', '1921fa7c-49cf-41f1-b171-86b4c501ed8d'),
(20, 20, 1, 'homepage', '__home__', 1, '2021-10-30 09:05:50', '2021-10-30 09:05:50', 'e51b6ce4-ed7d-4f98-942d-1cfa69fa8690'),
(22, 22, 1, NULL, NULL, 1, '2021-10-30 11:45:15', '2021-10-30 11:45:15', '4c68fecc-ce98-46b5-b853-1c5745689e79'),
(23, 23, 1, NULL, NULL, 1, '2021-10-30 12:17:18', '2021-10-30 12:17:18', '241b724e-885f-4bde-9b38-ead4e1a9df8c'),
(24, 24, 1, 'espresso', 'drinks/espresso', 1, '2021-10-30 12:22:39', '2021-10-30 12:22:39', 'a2977164-e784-4697-a7cb-54415d4dd284'),
(25, 25, 1, NULL, NULL, 1, '2021-10-30 13:21:21', '2021-10-30 13:21:21', '0202de92-5588-4fe1-b9bc-1c6b0cb24ee5'),
(26, 26, 1, '__temp_x4FnHw2u09jfJYDuYUyzeUGLueCXcSUMLXdw', 'news/__temp_x4FnHw2u09jfJYDuYUyzeUGLueCXcSUMLXdw', 1, '2021-10-30 13:23:05', '2021-10-30 13:23:05', '8abb60a6-798a-4baa-a0d9-8c48c24470e4'),
(28, 28, 1, 'iced-coffee', 'drinks/iced-coffee', 1, '2021-10-30 13:23:46', '2021-10-30 13:23:46', '6b7e3909-6826-4dc3-9eae-bb4d4d9d4958'),
(29, 29, 1, 'iced-coffee', 'drinks/iced-coffee', 1, '2021-10-30 13:23:46', '2021-10-30 13:23:46', 'd97a5079-d669-4c26-a516-2f7d63b7cde3'),
(30, 30, 1, '__temp_OSaT6hljktGcFRSKIRPD6K5HRf1R9qyg2lkg', 'drinks/__temp_OSaT6hljktGcFRSKIRPD6K5HRf1R9qyg2lkg', 1, '2021-10-30 13:30:40', '2021-10-30 13:30:40', '4ab64e81-58ee-4e1e-a291-3eed964a90cf'),
(32, 32, 1, 'about', 'about', 1, '2021-10-30 13:31:51', '2021-10-30 13:40:06', 'dfbee758-0527-465f-99fe-a7dc97103276'),
(33, 33, 1, 'about', 'about/about', 1, '2021-10-30 13:31:51', '2021-10-30 13:31:51', '46e470f3-2df7-4bc6-8604-a3e012548d4e'),
(35, 35, 1, 'locations', 'about/locations', 1, '2021-10-30 13:32:39', '2021-10-30 14:28:12', '7b091168-6b3a-4f9e-9ccc-6f191b3f54f9'),
(36, 36, 1, 'locations', 'about/locations', 1, '2021-10-30 13:32:39', '2021-10-30 13:32:39', '6b4a9e73-4977-4cbe-98a9-df6b8319285b'),
(38, 38, 1, 'austin-tx', 'about/locations/austin-tx', 1, '2021-10-30 13:33:08', '2021-10-31 11:20:25', 'c36d804e-ab5c-48d9-88a7-07a19e43777a'),
(39, 39, 1, 'austin-tx', 'about/austin-tx', 1, '2021-10-30 13:33:08', '2021-10-30 13:33:08', 'b6965ae8-7189-44e7-8119-a6bf23a90fdf'),
(41, 41, 1, 'mission-statement', 'about/mission-statement', 1, '2021-10-30 13:33:40', '2021-10-30 14:28:12', '66994164-46f0-4f8f-be23-34e6f024ff24'),
(42, 42, 1, 'mission-statement', 'about/mission-statement', 1, '2021-10-30 13:33:40', '2021-10-30 13:33:40', 'e809f01a-1bdc-439c-94ca-e536927f89c3'),
(43, 43, 1, 'austin-tx', 'about/austin-tx', 1, '2021-10-30 13:37:28', '2021-10-30 13:37:28', 'c7e9a474-dbec-4f7a-b074-b3ce1ee0d3c1'),
(44, 44, 1, 'about', 'about', 1, '2021-10-30 14:28:11', '2021-10-30 14:28:11', '1f2effb2-3d41-42d5-b27b-33105afefa3b'),
(45, 45, 1, 'homepage', '__home__', 1, '2021-10-30 15:33:37', '2021-10-30 15:33:37', 'f769f341-1d31-40c8-a890-1709bc0353ab'),
(46, 46, 1, 'homepage', '__home__', 1, '2021-10-30 15:33:37', '2021-10-30 15:33:37', 'cb8f19fa-b49b-473b-87e9-85049e3704ff'),
(47, 47, 1, 'homepage', '__home__', 1, '2021-10-30 15:35:14', '2021-10-30 15:35:14', '04253f75-674f-48c6-8439-2ebb712c5878'),
(48, 48, 1, 'homepage', '__home__', 1, '2021-10-30 15:36:20', '2021-10-30 15:36:20', '0ab1cf84-785a-40df-843e-1d7599527c60'),
(49, 49, 1, 'homepage', '__home__', 1, '2021-10-30 15:36:31', '2021-10-30 15:36:31', 'd62cca96-8385-421e-a050-d57e3c08f80c'),
(50, 50, 1, 'iced-coffee', 'drinks/iced-coffee', 1, '2021-10-31 10:07:50', '2021-10-31 10:07:50', '77ca3c04-c2ae-48ab-b821-5bdffff9a9ed'),
(51, 51, 1, 'espresso', 'drinks/espresso', 1, '2021-10-31 10:09:08', '2021-10-31 10:09:08', '9dd9221c-861f-4947-a6ab-d73e03e24667'),
(52, 52, 1, 'iced-coffee', 'drinks/iced-coffee', 1, '2021-10-31 10:38:17', '2021-10-31 10:38:17', '231b8e36-f591-46da-8777-9c09757a701b'),
(54, 54, 1, 'acquired-by-starbucks', 'news/acquired-by-starbucks', 1, '2021-10-31 10:50:57', '2021-10-31 10:50:57', 'a983ca6f-bde8-462b-935b-cead324932ed'),
(55, 55, 1, 'acquired-by-starbucks', 'news/acquired-by-starbucks', 1, '2021-10-31 10:50:57', '2021-10-31 10:50:57', '1829e035-550f-4d81-a049-e70ee852e4ad'),
(56, 56, 1, 'locations', 'about/locations', 1, '2021-10-31 11:20:24', '2021-10-31 11:20:24', 'af09a1b1-9c09-4530-a96c-b434a712e461'),
(57, 57, 1, 'austin-tx', 'about/locations/austin-tx', 1, '2021-10-31 11:21:27', '2021-10-31 11:21:27', 'e6a42e04-829b-46ec-a897-518d93e18727'),
(59, 59, 1, NULL, NULL, 1, '2021-10-31 12:30:21', '2021-10-31 12:30:21', '4df67dbf-683b-4123-b43f-c5e7d90aa533'),
(60, 60, 1, NULL, NULL, 1, '2021-10-31 12:30:31', '2021-10-31 12:30:31', 'c2fbc870-d781-47cc-90d7-b96d991136df'),
(61, 61, 1, NULL, NULL, 1, '2021-10-31 12:30:54', '2021-10-31 12:30:54', '8a8ed4eb-9246-4a40-b0f0-54e7bb44a080'),
(62, 62, 1, NULL, NULL, 1, '2021-10-31 12:31:03', '2021-10-31 12:31:03', '5b991d57-aa8a-493b-816c-48ebf8d18c91'),
(63, 63, 1, NULL, NULL, 1, '2021-10-31 12:31:08', '2021-10-31 12:31:08', 'abc5fe82-3768-4eaf-940b-0419a3eb9510'),
(64, 64, 1, NULL, NULL, 1, '2021-10-31 12:31:13', '2021-10-31 12:31:13', '35fd0cec-23b0-4679-ab53-e560348b3eaa'),
(65, 65, 1, NULL, NULL, 1, '2021-10-31 12:31:13', '2021-10-31 12:31:13', '4f64bc02-6c9c-49d8-bb87-b3fb794d3c98'),
(66, 66, 1, NULL, NULL, 1, '2021-10-31 12:31:17', '2021-10-31 12:31:17', '0c4d15db-1fbd-4b5a-9ee8-d955c172b325'),
(67, 67, 1, NULL, NULL, 1, '2021-10-31 12:31:17', '2021-10-31 12:31:17', '5348a662-a3cd-43c5-8c3f-313febb864cd'),
(68, 68, 1, NULL, NULL, 1, '2021-10-31 12:31:21', '2021-10-31 12:31:21', '3489be1e-42e0-497f-9de3-219375dbd14a'),
(69, 69, 1, NULL, NULL, 1, '2021-10-31 12:31:21', '2021-10-31 12:31:21', '813502d0-293c-46fa-b54c-7351c5867d9c'),
(70, 70, 1, NULL, NULL, 1, '2021-10-31 12:31:25', '2021-10-31 12:31:25', '628235af-f521-4390-8395-ef31c5bf4471'),
(71, 71, 1, NULL, NULL, 1, '2021-10-31 12:31:25', '2021-10-31 12:31:25', 'dee24bca-73a3-442a-a142-e6b681150d33'),
(72, 72, 1, NULL, NULL, 1, '2021-10-31 12:31:34', '2021-10-31 12:31:34', '78bc4938-f522-40a1-b289-5e2ccd323a38'),
(73, 73, 1, NULL, NULL, 1, '2021-10-31 12:31:34', '2021-10-31 12:31:34', '9b738dcd-8dba-4099-b19f-e636f15d23c7'),
(74, 74, 1, NULL, NULL, 1, '2021-10-31 12:31:36', '2021-10-31 12:31:36', 'dddd90a4-e849-4bff-b29c-93030528509f'),
(75, 75, 1, NULL, NULL, 1, '2021-10-31 12:31:36', '2021-10-31 12:31:36', '1b6d62df-2aa7-4afd-bc69-1e9caf8e4180'),
(76, 76, 1, NULL, NULL, 1, '2021-10-31 12:31:36', '2021-10-31 12:31:36', '2264f1d3-fa2e-4a4e-8fb1-381d902fe4c7'),
(77, 77, 1, NULL, NULL, 1, '2021-10-31 12:31:46', '2021-10-31 12:31:46', '5a9a0526-022d-4284-a8f5-476e3fcec00a'),
(78, 78, 1, NULL, NULL, 1, '2021-10-31 12:31:46', '2021-10-31 12:31:46', '1d6e250d-0a49-4867-ada6-1bda603ec0a3'),
(79, 79, 1, NULL, NULL, 1, '2021-10-31 12:31:46', '2021-10-31 12:31:46', 'd490ab76-73a1-48aa-a5db-8ddc8e3fac0c'),
(80, 80, 1, NULL, NULL, 1, '2021-10-31 12:31:58', '2021-10-31 12:31:58', '8d6e3fec-e42c-4e8e-9e88-a1500c421fec'),
(81, 81, 1, NULL, NULL, 1, '2021-10-31 12:31:58', '2021-10-31 12:31:58', 'ae36ce6a-c4d6-4500-af52-9e094ac1dc21'),
(82, 82, 1, NULL, NULL, 1, '2021-10-31 12:31:58', '2021-10-31 12:31:58', 'b03c2027-d9a7-47b4-a496-8809d1b40f76'),
(83, 83, 1, NULL, NULL, 1, '2021-10-31 12:31:59', '2021-10-31 12:31:59', 'ba70ec1f-06b9-43e0-b135-008405ec453c'),
(84, 84, 1, NULL, NULL, 1, '2021-10-31 12:31:59', '2021-10-31 12:31:59', '679e325d-e687-46f7-b5bc-556fb1a69e95'),
(85, 85, 1, NULL, NULL, 1, '2021-10-31 12:31:59', '2021-10-31 12:31:59', '21191534-6d67-4470-81d7-200094592e3e'),
(86, 86, 1, NULL, NULL, 1, '2021-10-31 12:32:06', '2021-10-31 12:32:06', '430a489c-b8e4-48ba-a1f2-31e9f8a43cb1'),
(87, 87, 1, NULL, NULL, 1, '2021-10-31 12:32:06', '2021-10-31 12:32:06', 'f1af5c07-58d6-4788-96a0-7a02fe6a58ff'),
(88, 88, 1, NULL, NULL, 1, '2021-10-31 12:32:07', '2021-10-31 12:32:07', 'c0e94d9b-6589-403d-ab7f-e555898cd6ad'),
(89, 89, 1, NULL, NULL, 1, '2021-10-31 12:32:09', '2021-10-31 12:32:09', 'f8734dcb-f98b-498e-bf6d-a3a104645132'),
(90, 90, 1, NULL, NULL, 1, '2021-10-31 12:32:09', '2021-10-31 12:32:09', 'e493466a-6771-4535-9a48-7cfa30de9de1'),
(91, 91, 1, NULL, NULL, 1, '2021-10-31 12:32:09', '2021-10-31 12:32:09', 'd45741d3-ed32-4d3b-b9f0-b9366a8a0395'),
(92, 92, 1, NULL, NULL, 1, '2021-10-31 12:32:11', '2021-10-31 12:32:11', '8b968ce0-06d9-4b0e-9e10-2905efc90fb6'),
(93, 93, 1, NULL, NULL, 1, '2021-10-31 12:32:12', '2021-10-31 12:32:12', '8e2d3416-4d54-43ce-93cc-d4f5258b1ee6'),
(94, 94, 1, NULL, NULL, 1, '2021-10-31 12:32:12', '2021-10-31 12:32:12', 'cc4f0ae2-4cf8-489c-92e9-c8a222af5a25'),
(95, 95, 1, NULL, NULL, 1, '2021-10-31 12:32:12', '2021-10-31 12:32:12', '965e43ad-23f8-4c56-a3a9-7ecf8fefa511'),
(96, 96, 1, NULL, NULL, 1, '2021-10-31 12:32:40', '2021-10-31 12:32:40', '8125efab-f157-478a-a923-e18a671b7861'),
(97, 97, 1, NULL, NULL, 1, '2021-10-31 12:32:40', '2021-10-31 12:32:40', '6ac16edd-edf4-4af4-95e2-273daed91a5a'),
(98, 98, 1, NULL, NULL, 1, '2021-10-31 12:32:40', '2021-10-31 12:32:40', 'ea5023f8-a237-47fb-bf19-f07b6e049467'),
(99, 99, 1, NULL, NULL, 1, '2021-10-31 12:32:40', '2021-10-31 12:32:40', '6c6b8824-2cfc-4594-8e0d-e029607a189e'),
(100, 100, 1, NULL, NULL, 1, '2021-10-31 12:32:44', '2021-10-31 12:32:44', '817b4dfb-0edf-40e9-920d-0b379b413ba8'),
(101, 101, 1, NULL, NULL, 1, '2021-10-31 12:32:44', '2021-10-31 12:32:44', 'cabca830-d4e9-4082-adf9-97a65c4d600c'),
(102, 102, 1, NULL, NULL, 1, '2021-10-31 12:32:44', '2021-10-31 12:32:44', '0917bbee-23d4-45b1-8c02-fdd91db8d8f6'),
(103, 103, 1, NULL, NULL, 1, '2021-10-31 12:32:44', '2021-10-31 12:32:44', '8a42fc12-0d33-4fb7-8d09-0258bdd3639a'),
(104, 104, 1, NULL, NULL, 1, '2021-10-31 12:32:49', '2021-10-31 12:32:49', '6981f9b2-34d2-4b13-a8a8-dd86fd435059'),
(105, 105, 1, NULL, NULL, 1, '2021-10-31 12:32:49', '2021-10-31 12:32:49', '46441bc7-d5f5-47ed-a762-ab6fa56cc63d'),
(106, 106, 1, NULL, NULL, 1, '2021-10-31 12:32:49', '2021-10-31 12:32:49', 'af1eaef4-c32e-4f72-9c8a-02f1aed681de'),
(107, 107, 1, NULL, NULL, 1, '2021-10-31 12:32:49', '2021-10-31 12:32:49', '1949c462-0688-4bf1-9ab3-f1a097bae1ea'),
(108, 108, 1, NULL, NULL, 1, '2021-10-31 12:32:51', '2021-10-31 12:32:51', '74552529-fe5d-49ed-a72b-6e186dbef539'),
(109, 109, 1, NULL, NULL, 1, '2021-10-31 12:32:51', '2021-10-31 12:32:51', 'a5b3ae69-3368-4436-9558-b2b70287741b'),
(110, 110, 1, NULL, NULL, 1, '2021-10-31 12:32:51', '2021-10-31 12:32:51', '65b21b88-920b-4150-88e6-8af47c61eec0'),
(111, 111, 1, NULL, NULL, 1, '2021-10-31 12:32:51', '2021-10-31 12:32:51', '270cc657-52ed-4179-9747-ae6fccb8a991'),
(112, 112, 1, NULL, NULL, 1, '2021-10-31 12:32:52', '2021-10-31 12:32:52', '454add48-18bf-4f64-a312-efcbe1a81562'),
(113, 113, 1, NULL, NULL, 1, '2021-10-31 12:32:52', '2021-10-31 12:32:52', '55494d07-e4c9-4c85-a5cf-ba31b05a2972'),
(114, 114, 1, NULL, NULL, 1, '2021-10-31 12:32:52', '2021-10-31 12:32:52', '74eba9b9-86e1-4016-9e7f-0f0b605416c8'),
(115, 115, 1, NULL, NULL, 1, '2021-10-31 12:32:52', '2021-10-31 12:32:52', '35e828f2-d33c-4ba4-8813-ba4d33e0d899'),
(116, 116, 1, NULL, NULL, 1, '2021-10-31 12:32:54', '2021-10-31 12:32:54', 'a25108e8-f4e3-41ad-826b-55953a22cecd'),
(117, 117, 1, NULL, NULL, 1, '2021-10-31 12:32:54', '2021-10-31 12:32:54', '417de3f4-edc5-4b34-8e2d-b1ccdafafe6c'),
(118, 118, 1, NULL, NULL, 1, '2021-10-31 12:32:54', '2021-10-31 12:32:54', '306e992f-a1a2-4b43-b8f7-532bb63903e3'),
(119, 119, 1, NULL, NULL, 1, '2021-10-31 12:32:54', '2021-10-31 12:32:54', 'fa538c0e-3d4b-4dd3-8b9e-176eda72715e'),
(120, 120, 1, NULL, NULL, 1, '2021-10-31 12:32:57', '2021-10-31 12:32:57', '178aef85-e974-487b-b064-5144ef076d91'),
(121, 121, 1, NULL, NULL, 1, '2021-10-31 12:32:57', '2021-10-31 12:32:57', '8c5cbf14-8bc0-4ab7-b533-c8fe18ff7317'),
(122, 122, 1, NULL, NULL, 1, '2021-10-31 12:32:57', '2021-10-31 12:32:57', 'b4b2818f-0876-4083-8ad4-807c023bc4d4'),
(123, 123, 1, NULL, NULL, 1, '2021-10-31 12:32:57', '2021-10-31 12:32:57', 'dea53e1a-b398-4c9c-b0f1-4b76f4f5a859'),
(124, 124, 1, NULL, NULL, 1, '2021-10-31 12:33:15', '2021-10-31 12:33:15', '77f50bfd-e602-4a81-ad73-b4e1434048c1'),
(125, 125, 1, NULL, NULL, 1, '2021-10-31 12:33:15', '2021-10-31 12:33:15', 'a101ca63-c24f-4df7-b3a9-11e8e6b6d553'),
(126, 126, 1, NULL, NULL, 1, '2021-10-31 12:33:15', '2021-10-31 12:33:15', 'f002cb7d-1a78-4a35-9c28-a919c956b55e'),
(127, 127, 1, NULL, NULL, 1, '2021-10-31 12:33:15', '2021-10-31 12:33:15', '978b9f66-b7d9-4079-a410-69bd3f9ce61a'),
(128, 128, 1, NULL, NULL, 1, '2021-10-31 12:33:27', '2021-10-31 12:33:27', '6503ff27-0e09-445d-92da-3ed792c9d401'),
(129, 129, 1, NULL, NULL, 1, '2021-10-31 12:33:27', '2021-10-31 12:33:27', '4df0faa2-ee15-4cce-874f-85aea2bd3252'),
(130, 130, 1, NULL, NULL, 1, '2021-10-31 12:33:27', '2021-10-31 12:33:27', '2ec5c33a-c601-4dc6-aefc-c342bd45594a'),
(131, 131, 1, NULL, NULL, 1, '2021-10-31 12:33:27', '2021-10-31 12:33:27', '2aa9acd4-61f8-4641-90cf-2c2cd0af20ad'),
(132, 132, 1, NULL, NULL, 1, '2021-10-31 12:33:27', '2021-10-31 12:33:27', 'dc1c6d87-b1f0-4cdc-8b41-dd34cdb93c5d'),
(133, 133, 1, NULL, NULL, 1, '2021-10-31 12:33:32', '2021-10-31 12:33:32', '57ea3ac0-7464-4679-bed7-5948d4dfd0b1'),
(134, 134, 1, NULL, NULL, 1, '2021-10-31 12:33:32', '2021-10-31 12:33:32', '604b8376-cb8f-4af9-9d92-bf3197f6fc36'),
(135, 135, 1, NULL, NULL, 1, '2021-10-31 12:33:32', '2021-10-31 12:33:32', 'a5fb3da0-235d-4dd0-b4fd-7e8e9a71620c'),
(136, 136, 1, NULL, NULL, 1, '2021-10-31 12:33:32', '2021-10-31 12:33:32', 'dcad9fbc-fb12-42b2-b47b-3edbc6744a9e'),
(137, 137, 1, NULL, NULL, 1, '2021-10-31 12:33:32', '2021-10-31 12:33:32', '113159de-4976-42b4-ad66-807c00957295'),
(138, 138, 1, NULL, NULL, 1, '2021-10-31 12:33:34', '2021-10-31 12:33:34', '19a79a44-d64f-4dd4-b3f2-bfefe3aae3eb'),
(139, 139, 1, NULL, NULL, 1, '2021-10-31 12:33:34', '2021-10-31 12:33:34', '4a815170-043f-420d-85c1-fbe61e5d4a89'),
(140, 140, 1, NULL, NULL, 1, '2021-10-31 12:33:34', '2021-10-31 12:33:34', '0d793ce2-835b-4dbd-bfb0-de0b74b6ad0a'),
(141, 141, 1, NULL, NULL, 1, '2021-10-31 12:33:34', '2021-10-31 12:33:34', 'e34ad884-4a39-44e7-b75f-c87d6de590cd'),
(142, 142, 1, NULL, NULL, 1, '2021-10-31 12:33:34', '2021-10-31 12:33:34', '2f2f6b1f-07ee-4f5d-93fe-495e35c19d83'),
(143, 143, 1, NULL, NULL, 1, '2021-10-31 12:33:41', '2021-10-31 12:33:41', '23a7ebbd-0d5e-470a-a128-3b88c300b5c5'),
(144, 144, 1, NULL, NULL, 1, '2021-10-31 12:33:41', '2021-10-31 12:33:41', 'a0b94ff4-4f16-4bc1-8e3a-64c09a97f872'),
(145, 145, 1, NULL, NULL, 1, '2021-10-31 12:33:41', '2021-10-31 12:33:41', 'bc66d620-421c-40e8-8511-95ea0ed27b4a'),
(146, 146, 1, NULL, NULL, 1, '2021-10-31 12:33:41', '2021-10-31 12:33:41', '0093ea03-af8e-44f4-a7a1-66e7ab064542'),
(147, 147, 1, NULL, NULL, 1, '2021-10-31 12:33:41', '2021-10-31 12:33:41', '172025b6-93f2-4a5f-a35a-62389ef4e5d1'),
(148, 148, 1, NULL, NULL, 1, '2021-10-31 12:33:44', '2021-10-31 12:33:44', 'e72d5b39-35cf-48bf-ab35-17daeba40d95'),
(149, 149, 1, NULL, NULL, 1, '2021-10-31 12:33:44', '2021-10-31 12:33:44', '22537d50-a917-46d9-a9ff-40a9fcd621dd'),
(150, 150, 1, NULL, NULL, 1, '2021-10-31 12:33:44', '2021-10-31 12:33:44', '7cf90e18-ae26-467a-97d5-0e7ef42125a3'),
(151, 151, 1, NULL, NULL, 1, '2021-10-31 12:33:44', '2021-10-31 12:33:44', '3ebc4fad-3556-4333-a9e8-83d470b30c64'),
(152, 152, 1, NULL, NULL, 1, '2021-10-31 12:33:44', '2021-10-31 12:33:44', 'c591c4b2-db51-499f-92ff-44e31876549f'),
(153, 153, 1, NULL, NULL, 1, '2021-10-31 12:33:47', '2021-10-31 12:33:47', '30605720-b002-4860-925c-e128c54bfb47'),
(154, 154, 1, NULL, NULL, 1, '2021-10-31 12:33:47', '2021-10-31 12:33:47', 'fe462d86-b4c0-456c-b8ff-fb08d8a10c93'),
(155, 155, 1, NULL, NULL, 1, '2021-10-31 12:33:47', '2021-10-31 12:33:47', '32b7bb88-857c-4fa1-ba7b-7ede3514dae0'),
(156, 156, 1, NULL, NULL, 1, '2021-10-31 12:33:47', '2021-10-31 12:33:47', '545dc667-b286-4617-9f2c-a95e12897898'),
(157, 157, 1, NULL, NULL, 1, '2021-10-31 12:33:47', '2021-10-31 12:33:47', 'c2d56c75-c568-4e71-9735-528e61676403'),
(158, 158, 1, NULL, NULL, 1, '2021-10-31 12:33:52', '2021-10-31 12:33:52', '26f8aabe-5fe8-4b31-8334-6adfd4678b5b'),
(159, 159, 1, NULL, NULL, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '5d842f05-f19a-4713-b4b9-4dcb6fb3dcfe'),
(160, 160, 1, NULL, NULL, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '07db12fa-5b72-4790-a99f-426289e16d6e'),
(161, 161, 1, NULL, NULL, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', 'c96a4891-9e03-4e44-8848-97e7d182490e'),
(162, 162, 1, NULL, NULL, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', 'df39c083-0058-4f8d-ada5-453bf65fa733'),
(163, 163, 1, NULL, NULL, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '50a73807-1c03-4885-9591-3b90d442f446'),
(164, 164, 1, NULL, NULL, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '98d4217f-7de2-4d28-bfcd-d8ded920d917'),
(165, 165, 1, NULL, NULL, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '429b6a62-b107-45d4-8ab3-e2b524131509'),
(166, 166, 1, NULL, NULL, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', 'de3ccfcf-c61b-4a01-9c93-bdc363dca138'),
(167, 167, 1, NULL, NULL, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '2e2f9cb1-3d4d-41da-b98d-aa7653414c3a'),
(168, 168, 1, NULL, NULL, 1, '2021-10-31 12:33:55', '2021-10-31 12:33:55', '4f9a013c-e15a-4a52-8ed5-dcc5d9aabf7b'),
(169, 169, 1, NULL, NULL, 1, '2021-10-31 12:33:55', '2021-10-31 12:33:55', 'e199d56f-9707-4c4b-be43-dce4f9396703'),
(170, 170, 1, NULL, NULL, 1, '2021-10-31 12:33:55', '2021-10-31 12:33:55', '6dc12c72-c50a-487c-b96b-e366a7c56ab5'),
(171, 171, 1, NULL, NULL, 1, '2021-10-31 12:33:55', '2021-10-31 12:33:55', 'bb1a19e2-0720-48f8-a859-9870a92e2b48'),
(172, 172, 1, NULL, NULL, 1, '2021-10-31 12:33:55', '2021-10-31 12:33:55', '3fb48778-6fca-402f-a837-a64b086bf61d'),
(173, 173, 1, NULL, NULL, 1, '2021-10-31 12:33:57', '2021-10-31 12:33:57', 'a880225c-e7e0-4775-8074-0b71906d7622'),
(174, 174, 1, NULL, NULL, 1, '2021-10-31 12:33:57', '2021-10-31 12:33:57', 'deba7937-4386-4de5-966e-0ac71e1c744b'),
(175, 175, 1, NULL, NULL, 1, '2021-10-31 12:33:57', '2021-10-31 12:33:57', '600a2972-0a63-40ed-95be-ae8a43d28344'),
(176, 176, 1, NULL, NULL, 1, '2021-10-31 12:33:57', '2021-10-31 12:33:57', 'b5187085-2e92-4c39-a0c7-d5fa5db1fcc8'),
(177, 177, 1, NULL, NULL, 1, '2021-10-31 12:33:57', '2021-10-31 12:33:57', 'c41f20bb-0a77-4bcc-bdeb-28d24d604eaf'),
(178, 178, 1, NULL, NULL, 1, '2021-10-31 12:33:58', '2021-10-31 12:33:58', '6c13ecfb-126c-4168-bdfa-b7a338f6b629'),
(179, 179, 1, NULL, NULL, 1, '2021-10-31 12:33:58', '2021-10-31 12:33:58', 'efa489d9-9a5f-4f22-ac75-8f4bf0ebd2a0'),
(180, 180, 1, NULL, NULL, 1, '2021-10-31 12:33:58', '2021-10-31 12:33:58', '23775ef2-1e3d-4f4d-9132-b2b6fc5ba372'),
(181, 181, 1, NULL, NULL, 1, '2021-10-31 12:33:58', '2021-10-31 12:33:58', '9d259156-1813-44a5-abe3-ad8c230eb5b3'),
(182, 182, 1, NULL, NULL, 1, '2021-10-31 12:33:58', '2021-10-31 12:33:58', 'f883cd77-2ba9-4529-9d35-e5c10fa76340'),
(183, 183, 1, NULL, NULL, 1, '2021-10-31 12:34:03', '2021-10-31 12:34:03', '2ef8b13f-1f8d-4828-b6cc-5014c45f0fde'),
(184, 184, 1, NULL, NULL, 1, '2021-10-31 12:34:03', '2021-10-31 12:34:03', 'f3fbf784-385b-4553-a45c-105c8ff179dc'),
(185, 185, 1, NULL, NULL, 1, '2021-10-31 12:34:03', '2021-10-31 12:34:03', '8af03dae-88f5-4f36-b960-40f8b6efbf50'),
(186, 186, 1, NULL, NULL, 1, '2021-10-31 12:34:03', '2021-10-31 12:34:03', 'cec6a415-fa08-4e9b-9630-eef78a573b1e'),
(187, 187, 1, NULL, NULL, 1, '2021-10-31 12:34:03', '2021-10-31 12:34:03', '890ea6a2-764d-4dd1-b7c1-213931357109'),
(188, 188, 1, NULL, NULL, 1, '2021-10-31 12:34:10', '2021-10-31 12:34:10', '893f073c-74e9-4100-b8b0-0421265481c5'),
(189, 189, 1, NULL, NULL, 1, '2021-10-31 12:34:10', '2021-10-31 12:34:10', 'e61d0c64-4ceb-4cea-b408-dcf5f6afa620'),
(190, 190, 1, NULL, NULL, 1, '2021-10-31 12:34:10', '2021-10-31 12:34:10', '0f94e328-506a-4761-a052-0ed83596e47f'),
(191, 191, 1, NULL, NULL, 1, '2021-10-31 12:34:10', '2021-10-31 12:34:10', '429d8564-99e9-456c-80ea-eb30a4b5f2c8'),
(192, 192, 1, NULL, NULL, 1, '2021-10-31 12:34:10', '2021-10-31 12:34:10', '898b9f1d-68e2-48d7-adde-36778ef772e1'),
(193, 193, 1, NULL, NULL, 1, '2021-10-31 12:34:10', '2021-10-31 12:34:10', 'c207ebd8-1a5d-4e12-9401-53d4c4eef9ca'),
(194, 194, 1, NULL, NULL, 1, '2021-10-31 12:34:16', '2021-10-31 12:34:16', '468fa726-e496-4852-a616-aec3eabb91b3'),
(195, 195, 1, NULL, NULL, 1, '2021-10-31 12:34:16', '2021-10-31 12:34:16', '2228db68-2eb6-478a-8396-04ceb59b6930'),
(196, 196, 1, NULL, NULL, 1, '2021-10-31 12:34:16', '2021-10-31 12:34:16', '34226f18-39d8-41d9-8bd6-2e64398fce28'),
(197, 197, 1, NULL, NULL, 1, '2021-10-31 12:34:16', '2021-10-31 12:34:16', '1ebd57c4-f21c-41f7-8386-a69dafca0bad'),
(198, 198, 1, NULL, NULL, 1, '2021-10-31 12:34:16', '2021-10-31 12:34:16', 'ea944895-858d-48b7-ac28-ceee40dc6dce'),
(199, 199, 1, NULL, NULL, 1, '2021-10-31 12:34:17', '2021-10-31 12:34:17', 'edcc33db-bf0e-4dee-9be0-7fc0b2ac0861'),
(200, 200, 1, NULL, NULL, 1, '2021-10-31 12:34:19', '2021-10-31 12:34:19', '6142d44a-888b-40cf-ad0e-ec0db1ea562c'),
(201, 201, 1, NULL, NULL, 1, '2021-10-31 12:34:19', '2021-10-31 12:34:19', 'e4a8ff50-b01f-40b0-b726-b227ae4c4a73'),
(202, 202, 1, NULL, NULL, 1, '2021-10-31 12:34:19', '2021-10-31 12:34:19', '4748f378-247d-4aa5-9dcf-ab0101f15ecd'),
(203, 203, 1, NULL, NULL, 1, '2021-10-31 12:34:19', '2021-10-31 12:34:19', '4d737a17-d8bd-448a-b86e-83151d6ba37d'),
(204, 204, 1, NULL, NULL, 1, '2021-10-31 12:34:19', '2021-10-31 12:34:19', '51c50840-7317-4fea-8110-1de54b12f570'),
(205, 205, 1, NULL, NULL, 1, '2021-10-31 12:34:19', '2021-10-31 12:34:19', '7bbd2659-bfeb-4bd8-98e9-c68950ece181'),
(206, 206, 1, NULL, NULL, 1, '2021-10-31 12:34:21', '2021-10-31 12:34:21', 'e537617c-d5a6-46c9-bb3f-463ea1a79023'),
(207, 207, 1, NULL, NULL, 1, '2021-10-31 12:34:21', '2021-10-31 12:34:21', '6b64e62f-8160-4319-b6a1-b28b2a90f999'),
(208, 208, 1, NULL, NULL, 1, '2021-10-31 12:34:21', '2021-10-31 12:34:21', '18549a06-c987-42d3-a4bf-dd9d307cf0a7'),
(209, 209, 1, NULL, NULL, 1, '2021-10-31 12:34:21', '2021-10-31 12:34:21', '2aef764e-06da-450a-aa9d-63568d95197d'),
(210, 210, 1, NULL, NULL, 1, '2021-10-31 12:34:21', '2021-10-31 12:34:21', '61bba9e9-8a72-4865-aa61-33b9b2881bc3'),
(211, 211, 1, NULL, NULL, 1, '2021-10-31 12:34:21', '2021-10-31 12:34:21', '1ce9833d-f8d7-4290-8206-dc5acb5ddcea'),
(212, 212, 1, NULL, NULL, 1, '2021-10-31 12:34:23', '2021-10-31 12:34:23', 'dd623edf-cba7-47c1-a112-73d1687cd858'),
(213, 213, 1, NULL, NULL, 1, '2021-10-31 12:34:23', '2021-10-31 12:34:23', 'f4bdb76b-048b-41f4-81fe-2affe46d2799'),
(214, 214, 1, NULL, NULL, 1, '2021-10-31 12:34:23', '2021-10-31 12:34:23', '66d1225c-1102-40d6-8d0c-20b23425afa9'),
(215, 215, 1, NULL, NULL, 1, '2021-10-31 12:34:23', '2021-10-31 12:34:23', '08984a54-3288-4153-be16-1e4bed655b7b'),
(216, 216, 1, NULL, NULL, 1, '2021-10-31 12:34:23', '2021-10-31 12:34:23', '1e71d3d3-e708-4bf6-ab42-e307c3a4b576'),
(217, 217, 1, NULL, NULL, 1, '2021-10-31 12:34:23', '2021-10-31 12:34:23', '7715e3ad-8f65-404f-b0f0-09f72996e734'),
(218, 218, 1, NULL, NULL, 1, '2021-10-31 12:34:24', '2021-10-31 12:34:24', 'caf063a0-1c04-460e-a9c6-05d9c37472c0'),
(219, 219, 1, NULL, NULL, 1, '2021-10-31 12:34:24', '2021-10-31 12:34:24', 'cbbc4c38-0d95-4596-b53f-90ddf4ce53b0'),
(220, 220, 1, NULL, NULL, 1, '2021-10-31 12:34:24', '2021-10-31 12:34:24', 'a46f6085-4687-4f34-9eaf-6c0c1af6de89'),
(221, 221, 1, NULL, NULL, 1, '2021-10-31 12:34:25', '2021-10-31 12:34:25', '994953dd-4f69-44cf-84b3-e05a0737d0e4'),
(222, 222, 1, NULL, NULL, 1, '2021-10-31 12:34:25', '2021-10-31 12:34:25', '7537885c-f8c2-4a22-a14e-59c2ab4b1e39'),
(223, 223, 1, NULL, NULL, 1, '2021-10-31 12:34:25', '2021-10-31 12:34:25', '7cd48dbf-5307-4166-8c2c-18fc3ba1e9eb'),
(224, 224, 1, NULL, NULL, 1, '2021-10-31 12:34:29', '2021-10-31 12:34:29', 'a48b90e8-006c-4184-8609-92da35cd492d'),
(225, 225, 1, NULL, NULL, 1, '2021-10-31 12:34:29', '2021-10-31 12:34:29', 'fff3f637-2820-4c07-9c78-07ea0fdd758b'),
(226, 226, 1, NULL, NULL, 1, '2021-10-31 12:34:29', '2021-10-31 12:34:29', 'e9997d43-48d6-4908-80fc-3bcbca613e7a'),
(227, 227, 1, NULL, NULL, 1, '2021-10-31 12:34:29', '2021-10-31 12:34:29', '28e72cb1-e3a6-4010-b7ec-f7c2c598dcf0'),
(228, 228, 1, NULL, NULL, 1, '2021-10-31 12:34:29', '2021-10-31 12:34:29', 'f66f9315-37e4-4e76-80a2-31f22fc8165a'),
(229, 229, 1, NULL, NULL, 1, '2021-10-31 12:34:29', '2021-10-31 12:34:29', '3b143e1a-b7bc-480f-9070-775a3702adc3'),
(230, 230, 1, NULL, NULL, 1, '2021-10-31 12:34:31', '2021-10-31 12:34:31', '4ce38063-305b-4e4f-9e3b-1909d0bf22b9'),
(231, 231, 1, NULL, NULL, 1, '2021-10-31 12:34:31', '2021-10-31 12:34:31', '80cf917b-07ff-4837-b2fa-b29a732138a2'),
(232, 232, 1, NULL, NULL, 1, '2021-10-31 12:34:31', '2021-10-31 12:34:31', '8be51651-f8c5-4629-87e2-a66249f07bb8'),
(233, 233, 1, NULL, NULL, 1, '2021-10-31 12:34:31', '2021-10-31 12:34:31', '57dd16cd-ab10-45fd-a84f-866d769e4bca'),
(234, 234, 1, NULL, NULL, 1, '2021-10-31 12:34:31', '2021-10-31 12:34:31', '7337ad8c-3ced-4974-8eb8-58967d229ef7'),
(235, 235, 1, NULL, NULL, 1, '2021-10-31 12:34:31', '2021-10-31 12:34:31', '0a6d809d-7001-4ef0-8c7f-8a5120bc9599'),
(236, 236, 1, NULL, NULL, 1, '2021-10-31 12:34:34', '2021-10-31 12:34:34', '32492a9c-c55d-438a-8b0e-c307f1d6c67c'),
(237, 237, 1, NULL, NULL, 1, '2021-10-31 12:34:34', '2021-10-31 12:34:34', 'e36cb1b8-7c99-4b2a-aa64-a976d3b0aa95'),
(238, 238, 1, NULL, NULL, 1, '2021-10-31 12:34:34', '2021-10-31 12:34:34', 'cc5a16a6-2196-4e48-b88e-bf746db8cde4'),
(239, 239, 1, NULL, NULL, 1, '2021-10-31 12:34:34', '2021-10-31 12:34:34', '6f320965-9198-4def-bcb4-c11cd297d3c8'),
(240, 240, 1, NULL, NULL, 1, '2021-10-31 12:34:34', '2021-10-31 12:34:34', 'b7015478-1adc-4ded-8d3b-db7f2caef60c'),
(241, 241, 1, NULL, NULL, 1, '2021-10-31 12:34:34', '2021-10-31 12:34:34', 'c39c0f96-0686-4e4c-b014-1894ad64e591'),
(242, 242, 1, NULL, NULL, 1, '2021-10-31 12:34:35', '2021-10-31 12:34:35', '678774ec-e5b9-401f-80ee-05f0183f0fc8'),
(243, 243, 1, NULL, NULL, 1, '2021-10-31 12:34:35', '2021-10-31 12:34:35', '1c9380ba-114d-494f-a29d-fac26c736ac8'),
(244, 244, 1, NULL, NULL, 1, '2021-10-31 12:34:35', '2021-10-31 12:34:35', '7e48ccb2-9b6f-4883-9ed5-1b411e61315d'),
(245, 245, 1, NULL, NULL, 1, '2021-10-31 12:34:35', '2021-10-31 12:34:35', '6c241775-8355-4046-871f-155d9cb8b567'),
(246, 246, 1, NULL, NULL, 1, '2021-10-31 12:34:35', '2021-10-31 12:34:35', '5efd6162-f208-4dfd-ac65-1e11b4d84de4'),
(247, 247, 1, NULL, NULL, 1, '2021-10-31 12:34:35', '2021-10-31 12:34:35', 'c062a923-4732-4266-8916-92c616fe39e7'),
(248, 248, 1, NULL, NULL, 1, '2021-10-31 12:34:36', '2021-10-31 12:34:36', '0494c630-8c5a-43c8-ac04-db6f70abaa17'),
(249, 249, 1, NULL, NULL, 1, '2021-10-31 12:34:36', '2021-10-31 12:34:36', 'bcc5fff5-30ff-4c11-9ab8-07693c7c2e83'),
(250, 250, 1, NULL, NULL, 1, '2021-10-31 12:34:36', '2021-10-31 12:34:36', '44bc37de-f2ec-4d54-9c60-c0e9abf7d874'),
(251, 251, 1, NULL, NULL, 1, '2021-10-31 12:34:36', '2021-10-31 12:34:36', '0154c917-4bf2-4496-b4eb-ca949fe03eb7'),
(252, 252, 1, NULL, NULL, 1, '2021-10-31 12:34:36', '2021-10-31 12:34:36', '0435bcd8-5fdb-4431-b9c1-afdd9ea37268'),
(253, 253, 1, NULL, NULL, 1, '2021-10-31 12:34:36', '2021-10-31 12:34:36', '218126ed-de70-4c7c-9564-1170af0863ea'),
(254, 254, 1, NULL, NULL, 1, '2021-10-31 12:34:42', '2021-10-31 12:34:42', '978ef54f-53a4-4ce1-920f-f8d1aa9930de'),
(255, 255, 1, NULL, NULL, 1, '2021-10-31 12:34:42', '2021-10-31 12:34:42', '3a1f9f8a-d33f-4817-aea9-dd6ff7deb442'),
(256, 256, 1, NULL, NULL, 1, '2021-10-31 12:34:42', '2021-10-31 12:34:42', 'bebae1f6-e517-4aa7-9b98-2a8e34153d97'),
(257, 257, 1, NULL, NULL, 1, '2021-10-31 12:34:42', '2021-10-31 12:34:42', '307c67eb-1366-4c2d-8252-2bbb9e16ffbf'),
(258, 258, 1, NULL, NULL, 1, '2021-10-31 12:34:42', '2021-10-31 12:34:42', '692a19e8-a58f-412e-b2c6-9ce70779df49'),
(259, 259, 1, NULL, NULL, 1, '2021-10-31 12:34:42', '2021-10-31 12:34:42', '6eb0e66c-0199-4baa-893f-d7cb3e74887d'),
(260, 260, 1, NULL, NULL, 1, '2021-10-31 12:34:47', '2021-10-31 12:34:47', '70bc1408-42aa-482a-a60a-903f3ee6b221'),
(261, 261, 1, NULL, NULL, 1, '2021-10-31 12:34:47', '2021-10-31 12:34:47', '3822c3e0-622b-497c-a2d8-310d91a224d1'),
(262, 262, 1, NULL, NULL, 1, '2021-10-31 12:34:47', '2021-10-31 12:34:47', '9ae0377c-191c-49e7-8da4-47aad3394d02'),
(263, 263, 1, NULL, NULL, 1, '2021-10-31 12:34:47', '2021-10-31 12:34:47', '0a5eec86-3604-42eb-8230-45639fa98b88'),
(264, 264, 1, NULL, NULL, 1, '2021-10-31 12:34:47', '2021-10-31 12:34:47', '5e56ff51-69d0-4bdd-86dd-50299cba2f68'),
(265, 265, 1, NULL, NULL, 1, '2021-10-31 12:34:47', '2021-10-31 12:34:47', '44fb6eb0-25c9-4308-a7ac-e6162e31a3d4'),
(266, 266, 1, NULL, NULL, 1, '2021-10-31 12:34:49', '2021-10-31 12:34:49', '2edaf328-c4fb-47cb-aa5a-8a020785d28f'),
(267, 267, 1, NULL, NULL, 1, '2021-10-31 12:34:49', '2021-10-31 12:34:49', '16dd1e54-c962-4a60-88c4-390dded9b79b'),
(268, 268, 1, NULL, NULL, 1, '2021-10-31 12:34:49', '2021-10-31 12:34:49', '893f94ae-f191-4af7-a71f-8e02bd84dde2'),
(269, 269, 1, NULL, NULL, 1, '2021-10-31 12:34:49', '2021-10-31 12:34:49', '7553cc60-eb24-4525-80ba-22a60914e5f9'),
(270, 270, 1, NULL, NULL, 1, '2021-10-31 12:34:49', '2021-10-31 12:34:49', '473d2290-cd47-43fb-a077-38bf46fc27ca'),
(271, 271, 1, NULL, NULL, 1, '2021-10-31 12:34:49', '2021-10-31 12:34:49', '81fe39c1-4cd3-426b-97e5-227cec835c68'),
(272, 272, 1, NULL, NULL, 1, '2021-10-31 12:34:56', '2021-10-31 12:34:56', '9cda5608-3d52-42c6-9c8a-13ccc5f1aade'),
(273, 273, 1, NULL, NULL, 1, '2021-10-31 12:34:56', '2021-10-31 12:34:56', '81ff580f-99ac-47a1-8fdb-a5b86f7ade44'),
(274, 274, 1, NULL, NULL, 1, '2021-10-31 12:34:56', '2021-10-31 12:34:56', 'b4f51f06-a2a3-4581-89ba-7815f41b0ccf'),
(275, 275, 1, NULL, NULL, 1, '2021-10-31 12:34:56', '2021-10-31 12:34:56', 'd5b0443e-5ab4-493f-8a39-d96d1b7a16dd'),
(276, 276, 1, NULL, NULL, 1, '2021-10-31 12:34:56', '2021-10-31 12:34:56', '039bacf7-ed74-448f-86ff-156814067cca'),
(277, 277, 1, NULL, NULL, 1, '2021-10-31 12:34:56', '2021-10-31 12:34:56', '41825837-3dd9-4a4a-9366-96f23853aa9a'),
(278, 278, 1, NULL, NULL, 1, '2021-10-31 12:34:56', '2021-10-31 12:34:56', '42b548d9-cd6c-4291-8f1f-4ee57becc7e7'),
(279, 279, 1, NULL, NULL, 1, '2021-10-31 12:35:04', '2021-10-31 12:35:04', 'cae1c464-d1cc-435b-9a2c-8b8472dc182e'),
(280, 280, 1, NULL, NULL, 1, '2021-10-31 12:35:04', '2021-10-31 12:35:04', 'f45005fe-3562-4d11-bf93-ff7894f044d7'),
(281, 281, 1, NULL, NULL, 1, '2021-10-31 12:35:04', '2021-10-31 12:35:04', '39f34b80-9bfe-4b2c-8c2c-5ce69f0755de'),
(282, 282, 1, NULL, NULL, 1, '2021-10-31 12:35:04', '2021-10-31 12:35:04', '2b8ac75f-2541-414d-af60-1d6b6a72f69b'),
(283, 283, 1, NULL, NULL, 1, '2021-10-31 12:35:04', '2021-10-31 12:35:04', 'd28250ce-26f5-4b6c-8376-2953a17ba822'),
(284, 284, 1, NULL, NULL, 1, '2021-10-31 12:35:04', '2021-10-31 12:35:04', '477f4bcc-34c9-4d4d-aa8f-aaf7d257c467'),
(285, 285, 1, NULL, NULL, 1, '2021-10-31 12:35:04', '2021-10-31 12:35:04', '2deeb3f4-0024-4e63-ac06-303040ec3a4a'),
(286, 286, 1, NULL, NULL, 1, '2021-10-31 12:35:09', '2021-10-31 12:35:09', '378dd3cc-53a1-4cf6-a7ce-f292b1c139f3'),
(287, 287, 1, NULL, NULL, 1, '2021-10-31 12:35:09', '2021-10-31 12:35:09', 'daab5e58-4d39-43f1-b128-c8db6c333403'),
(288, 288, 1, NULL, NULL, 1, '2021-10-31 12:35:09', '2021-10-31 12:35:09', '7468faca-ce2d-4473-8a4c-05ecbc043c5a'),
(289, 289, 1, NULL, NULL, 1, '2021-10-31 12:35:09', '2021-10-31 12:35:09', '3b6dfc6b-ea98-4d25-8d1e-c2746b379066'),
(290, 290, 1, NULL, NULL, 1, '2021-10-31 12:35:09', '2021-10-31 12:35:09', 'f3b0f613-f436-4ea1-8f1d-ee671bff603f'),
(291, 291, 1, NULL, NULL, 1, '2021-10-31 12:35:09', '2021-10-31 12:35:09', '5d73435d-9b43-4296-b07c-2c8658e9581a'),
(292, 292, 1, NULL, NULL, 1, '2021-10-31 12:35:09', '2021-10-31 12:35:09', 'e5efe7a3-269c-4853-a01f-72c304b4fe58'),
(293, 293, 1, NULL, NULL, 1, '2021-10-31 12:35:12', '2021-10-31 12:35:12', 'bb4bad1e-2e2b-4ad7-8691-769a46f4962d'),
(294, 294, 1, NULL, NULL, 1, '2021-10-31 12:35:12', '2021-10-31 12:35:12', '0ebf7cfc-c8ed-4d3e-8b63-ccf5fc30915a'),
(295, 295, 1, NULL, NULL, 1, '2021-10-31 12:35:12', '2021-10-31 12:35:12', '60cfe812-f7d5-419f-9b94-b26cc5cbe7f0'),
(296, 296, 1, NULL, NULL, 1, '2021-10-31 12:35:12', '2021-10-31 12:35:12', '0b0b8a4c-9f49-4e48-8cb7-805f047594f8'),
(297, 297, 1, NULL, NULL, 1, '2021-10-31 12:35:12', '2021-10-31 12:35:12', '35e40e9d-54c1-43fb-a4ac-acc46d36fe48'),
(298, 298, 1, NULL, NULL, 1, '2021-10-31 12:35:12', '2021-10-31 12:35:12', '65550c9c-9427-4b53-b51d-c7fc90eb18aa'),
(299, 299, 1, NULL, NULL, 1, '2021-10-31 12:35:12', '2021-10-31 12:35:12', 'ad795af5-b681-467f-8b37-f198a5563731'),
(300, 300, 1, NULL, NULL, 1, '2021-10-31 12:35:15', '2021-10-31 12:35:15', '14a6d971-f9f6-4e75-ba1d-f0430ef66a68'),
(301, 301, 1, NULL, NULL, 1, '2021-10-31 12:35:15', '2021-10-31 12:35:15', 'c0e80a6e-49fc-4304-ad84-7418d07bd9a6'),
(302, 302, 1, NULL, NULL, 1, '2021-10-31 12:35:15', '2021-10-31 12:35:15', 'febdb860-9391-4dec-ae36-4523e9c7bc87'),
(303, 303, 1, NULL, NULL, 1, '2021-10-31 12:35:15', '2021-10-31 12:35:15', 'e176bb38-7c3b-4e45-8413-a734440d6c6d'),
(304, 304, 1, NULL, NULL, 1, '2021-10-31 12:35:15', '2021-10-31 12:35:15', '50477364-4764-40eb-b73c-59704a3ba9c7'),
(305, 305, 1, NULL, NULL, 1, '2021-10-31 12:35:15', '2021-10-31 12:35:15', '113a95ac-7f96-4d53-8879-11f882adb2f5'),
(306, 306, 1, NULL, NULL, 1, '2021-10-31 12:35:15', '2021-10-31 12:35:15', '8c1ad92b-5126-491d-8be9-16f8b7532985'),
(307, 307, 1, NULL, NULL, 1, '2021-10-31 12:35:15', '2021-10-31 12:35:15', '8d05b22e-cef7-4960-9b97-af9042afa135'),
(308, 308, 1, NULL, NULL, 1, '2021-10-31 12:35:18', '2021-10-31 12:35:18', '870d702d-24bf-4dfc-bf54-2d0d68c9ef6b'),
(309, 309, 1, NULL, NULL, 1, '2021-10-31 12:35:18', '2021-10-31 12:35:18', 'dd52b71a-5ed5-4d64-82f5-c6fa734138ab'),
(310, 310, 1, NULL, NULL, 1, '2021-10-31 12:35:18', '2021-10-31 12:35:18', '7171921d-81ba-47dd-86b9-7c0be6b39154'),
(311, 311, 1, NULL, NULL, 1, '2021-10-31 12:35:18', '2021-10-31 12:35:18', '52e9df5b-d39e-4e87-b74f-7eb90d6460ea'),
(312, 312, 1, NULL, NULL, 1, '2021-10-31 12:35:18', '2021-10-31 12:35:18', 'c4ea9f3d-fde3-41fb-8ea5-dab85ecb7559'),
(313, 313, 1, NULL, NULL, 1, '2021-10-31 12:35:18', '2021-10-31 12:35:18', '735cb8f5-7705-42cc-ba06-58c2ca1f4b9c'),
(314, 314, 1, NULL, NULL, 1, '2021-10-31 12:35:18', '2021-10-31 12:35:18', 'c2b4b7fc-0de1-48a9-b186-687fe2454761'),
(315, 315, 1, NULL, NULL, 1, '2021-10-31 12:35:18', '2021-10-31 12:35:18', '7c2992d2-bca3-4b8a-922a-3d29245dbe89'),
(316, 316, 1, NULL, NULL, 1, '2021-10-31 12:35:19', '2021-10-31 12:35:19', '0bf36130-75ea-4760-ad2c-270dbe75b440'),
(317, 317, 1, NULL, NULL, 1, '2021-10-31 12:35:19', '2021-10-31 12:35:19', 'c438a180-b330-4c79-88b5-dabac86a3c5b'),
(318, 318, 1, NULL, NULL, 1, '2021-10-31 12:35:19', '2021-10-31 12:35:19', '00677ad3-7dd7-4cf3-bf6d-8f714188e845'),
(319, 319, 1, NULL, NULL, 1, '2021-10-31 12:35:19', '2021-10-31 12:35:19', 'ea42501e-e44b-42e0-b2a5-d024c6080671'),
(320, 320, 1, NULL, NULL, 1, '2021-10-31 12:35:19', '2021-10-31 12:35:19', '6e9c2894-2607-4ced-beb0-162914ba7ec3'),
(321, 321, 1, NULL, NULL, 1, '2021-10-31 12:35:19', '2021-10-31 12:35:19', '1205eae2-5752-4ea3-885b-0eb32230215f'),
(322, 322, 1, NULL, NULL, 1, '2021-10-31 12:35:19', '2021-10-31 12:35:19', '2c571a93-109f-4ed3-be87-8c002804ac14'),
(323, 323, 1, NULL, NULL, 1, '2021-10-31 12:35:19', '2021-10-31 12:35:19', 'c1ac4cd9-f565-4063-8fd1-e014155b7f78'),
(324, 324, 1, NULL, NULL, 1, '2021-10-31 12:35:25', '2021-10-31 12:35:25', 'd89d1496-85ad-40a9-9f41-dedefc1ad5b4'),
(325, 325, 1, NULL, NULL, 1, '2021-10-31 12:35:25', '2021-10-31 12:35:25', '09a4dc2f-788d-409d-9c0a-92c63c94f24b'),
(326, 326, 1, NULL, NULL, 1, '2021-10-31 12:35:25', '2021-10-31 12:35:25', 'bf029a9d-43c6-4a9e-8744-6a33a43c6247'),
(327, 327, 1, NULL, NULL, 1, '2021-10-31 12:35:25', '2021-10-31 12:35:25', 'db5bf972-bea3-4f38-8a4e-f6479dbcf3f5'),
(328, 328, 1, NULL, NULL, 1, '2021-10-31 12:35:25', '2021-10-31 12:35:25', 'da110d75-fdfb-4731-9ce9-c4404b7c9211'),
(329, 329, 1, NULL, NULL, 1, '2021-10-31 12:35:25', '2021-10-31 12:35:25', 'e4e20001-ed59-46f8-bd38-436a4ab6c05c'),
(330, 330, 1, NULL, NULL, 1, '2021-10-31 12:35:25', '2021-10-31 12:35:25', '4e9fdc48-f1d1-4a1c-9229-5f1f55ad6816'),
(331, 331, 1, NULL, NULL, 1, '2021-10-31 12:35:25', '2021-10-31 12:35:25', '5b54007e-8a53-4e93-bcf8-96338d49eb65'),
(332, 332, 1, NULL, NULL, 1, '2021-10-31 12:35:27', '2021-10-31 12:35:27', '51795123-1110-48eb-8d79-4c218e133ab7'),
(333, 333, 1, NULL, NULL, 1, '2021-10-31 12:35:28', '2021-10-31 12:35:28', 'd0cce101-3606-40d7-87bd-a49ffe0c265e'),
(334, 334, 1, NULL, NULL, 1, '2021-10-31 12:35:28', '2021-10-31 12:35:28', '22b7601a-f70d-47a9-b4e7-8067fc132673'),
(335, 335, 1, NULL, NULL, 1, '2021-10-31 12:35:28', '2021-10-31 12:35:28', '7c8498cc-6de7-41c9-83e2-477e8029ef72'),
(336, 336, 1, NULL, NULL, 1, '2021-10-31 12:35:28', '2021-10-31 12:35:28', '2c870c74-7cf6-4148-bb09-1be06f618925'),
(337, 337, 1, NULL, NULL, 1, '2021-10-31 12:35:28', '2021-10-31 12:35:28', 'a2d1f609-b596-4cbd-8b75-38eddfba8f7e'),
(338, 338, 1, NULL, NULL, 1, '2021-10-31 12:35:28', '2021-10-31 12:35:28', '891f5b77-e588-4415-9b70-2321a7e5f065'),
(339, 339, 1, NULL, NULL, 1, '2021-10-31 12:35:28', '2021-10-31 12:35:28', 'ad831c86-13df-413b-9b8e-6eb62e47330e'),
(340, 340, 1, NULL, NULL, 1, '2021-10-31 12:35:31', '2021-10-31 12:35:31', '6d73564c-3d90-4720-9eb7-06329d4cb236'),
(341, 341, 1, NULL, NULL, 1, '2021-10-31 12:35:31', '2021-10-31 12:35:31', 'd64ea0f0-b258-45c4-b465-01caa26c43bf'),
(342, 342, 1, NULL, NULL, 1, '2021-10-31 12:35:31', '2021-10-31 12:35:31', '6c3ed901-4d2d-4711-b4d9-36451b3f3713'),
(343, 343, 1, NULL, NULL, 1, '2021-10-31 12:35:31', '2021-10-31 12:35:31', 'd4606e9c-7a41-4ac7-a3de-d4831bebe825'),
(344, 344, 1, NULL, NULL, 1, '2021-10-31 12:35:31', '2021-10-31 12:35:31', '3cfc0b87-7eb3-46de-be4a-5cb6fb5dbcfe'),
(345, 345, 1, NULL, NULL, 1, '2021-10-31 12:35:31', '2021-10-31 12:35:31', '83031165-50e1-4dab-a2b4-84f2b098997b'),
(346, 346, 1, NULL, NULL, 1, '2021-10-31 12:35:31', '2021-10-31 12:35:31', '55e6594f-aa34-4c84-8fb0-976d2eb4c5b5'),
(347, 347, 1, NULL, NULL, 1, '2021-10-31 12:35:31', '2021-10-31 12:35:31', 'a97973ca-6e05-40f8-90ac-1ef48eeb5a9c'),
(348, 348, 1, NULL, NULL, 1, '2021-10-31 12:35:32', '2021-10-31 12:35:32', 'c1eaab53-11dd-4052-acfa-8a054b24fb98'),
(349, 349, 1, NULL, NULL, 1, '2021-10-31 12:35:32', '2021-10-31 12:35:32', 'b7ed76e0-134c-4be7-941f-e12e34eede14'),
(350, 350, 1, NULL, NULL, 1, '2021-10-31 12:35:32', '2021-10-31 12:35:32', 'b9e8cde2-e386-4a71-9788-c7845c49ce64'),
(351, 351, 1, NULL, NULL, 1, '2021-10-31 12:35:32', '2021-10-31 12:35:32', '16dccf36-19ce-42ca-8ae5-e3795c2aa69e'),
(352, 352, 1, NULL, NULL, 1, '2021-10-31 12:35:32', '2021-10-31 12:35:32', '19b6172f-1063-41cd-8072-89d9e5b7abce'),
(353, 353, 1, NULL, NULL, 1, '2021-10-31 12:35:32', '2021-10-31 12:35:32', '6b1b10a6-2009-4f6f-ab6c-ebefca03321b'),
(354, 354, 1, NULL, NULL, 1, '2021-10-31 12:35:32', '2021-10-31 12:35:32', '8908f90c-a246-4bb2-a171-62d926046996'),
(355, 355, 1, NULL, NULL, 1, '2021-10-31 12:35:32', '2021-10-31 12:35:32', 'd56c0b32-ad64-4dc1-9d40-6fe89a0b5226'),
(356, 356, 1, NULL, NULL, 1, '2021-10-31 12:35:34', '2021-10-31 12:35:34', '70ebe6cc-5616-429d-9cdf-903248abe340'),
(357, 357, 1, NULL, NULL, 1, '2021-10-31 12:35:34', '2021-10-31 12:35:34', '7b58f282-571a-4845-be1c-67793fa7642f'),
(358, 358, 1, NULL, NULL, 1, '2021-10-31 12:35:34', '2021-10-31 12:35:34', '7cb39f1a-3cf5-4265-b64b-d85d6dee1775'),
(359, 359, 1, NULL, NULL, 1, '2021-10-31 12:35:34', '2021-10-31 12:35:34', '8e943660-8aa4-4780-949f-cd1cd22998ea'),
(360, 360, 1, NULL, NULL, 1, '2021-10-31 12:35:34', '2021-10-31 12:35:34', 'e1b5da40-2560-43ac-b217-cb7ce6d65968'),
(361, 361, 1, NULL, NULL, 1, '2021-10-31 12:35:34', '2021-10-31 12:35:34', '45b85be7-9ee4-4fea-88b6-38bdc6b04e5b'),
(362, 362, 1, NULL, NULL, 1, '2021-10-31 12:35:34', '2021-10-31 12:35:34', 'cb30f822-4153-457e-b311-a59379a4f203'),
(363, 363, 1, NULL, NULL, 1, '2021-10-31 12:35:34', '2021-10-31 12:35:34', 'fcf597a6-155a-4f38-b32b-0f44b10c01eb'),
(364, 364, 1, NULL, NULL, 1, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '15cd8d88-e737-4f8f-a188-cd8198098447'),
(365, 365, 1, NULL, NULL, 1, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '284aa08d-c5f2-4681-9ea5-d4099af4ac73'),
(366, 366, 1, NULL, NULL, 1, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '6d6a6e56-3a76-40af-8c21-a99acfeaafa1'),
(367, 367, 1, NULL, NULL, 1, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '4bb0eadb-32d4-4f8d-a286-d021079c9ba6'),
(368, 368, 1, NULL, NULL, 1, '2021-10-31 12:35:38', '2021-10-31 12:35:38', 'db9792f9-d6e2-47dc-88cd-fdc27a7cfc1e'),
(369, 369, 1, NULL, NULL, 1, '2021-10-31 12:35:38', '2021-10-31 12:35:38', 'a1dce9df-9c76-4918-b58d-eb7e8b0904ea'),
(370, 370, 1, NULL, NULL, 1, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '63655c75-04ce-400b-9275-5fa89b02f028'),
(371, 371, 1, NULL, NULL, 1, '2021-10-31 12:35:38', '2021-10-31 12:35:38', 'b6844c12-609b-45c7-8982-62787a6e9d02'),
(372, 372, 1, NULL, NULL, 1, '2021-10-31 12:35:56', '2021-10-31 12:35:56', '7d9754bf-eb0d-49bd-9240-23dfdcbcc9e3'),
(373, 373, 1, NULL, NULL, 1, '2021-10-31 12:35:56', '2021-10-31 12:35:56', '6d687acb-e952-4b5f-ae47-7b4b11453a64'),
(374, 374, 1, NULL, NULL, 1, '2021-10-31 12:35:56', '2021-10-31 12:35:56', '08f53a62-607e-4705-ac63-16dcd0cb74c3'),
(375, 375, 1, NULL, NULL, 1, '2021-10-31 12:35:56', '2021-10-31 12:35:56', '76faf8fd-f6ea-4741-9fda-c7a3b36823ac'),
(376, 376, 1, NULL, NULL, 1, '2021-10-31 12:35:56', '2021-10-31 12:35:56', '357cedb5-d424-420d-a3d0-3d515dbf06b0'),
(377, 377, 1, NULL, NULL, 1, '2021-10-31 12:35:56', '2021-10-31 12:35:56', 'c906dd62-a44f-4a4e-b572-f120a86350bf'),
(378, 378, 1, NULL, NULL, 1, '2021-10-31 12:35:56', '2021-10-31 12:35:56', '4f9bdcd9-04ff-4226-96d0-0a9ef3b8c733'),
(379, 379, 1, NULL, NULL, 1, '2021-10-31 12:35:56', '2021-10-31 12:35:56', '7c59ebdc-37ef-4087-8386-3ab8c65675cc'),
(380, 380, 1, NULL, NULL, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '4f364603-527b-43a7-a108-35de7c646715'),
(381, 381, 1, NULL, NULL, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '1231bca2-36b7-40ca-b746-982d45f08cbc'),
(382, 382, 1, NULL, NULL, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '2013d04b-bdee-418b-8a50-8e091758852b'),
(383, 383, 1, NULL, NULL, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '1c93bb19-b03a-4fc8-9ce4-8c7861c599cd'),
(384, 384, 1, NULL, NULL, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '8d4fa533-c9ca-4b66-9dd7-d16bf8fdfaf5'),
(385, 385, 1, NULL, NULL, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '1aee9a49-3813-43ce-aa9b-d3bbfb934d10'),
(386, 386, 1, NULL, NULL, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '9918db5d-94e4-4fde-911f-089e4fe67f70'),
(387, 387, 1, NULL, NULL, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', 'e26cb888-dc5d-4597-8a03-9ff50531d506'),
(388, 388, 1, NULL, NULL, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '0ce66b5a-4cdb-4061-8b10-c9710e6d5c56'),
(389, 389, 1, NULL, NULL, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', 'a481572d-bbd4-4201-b900-b3b27dd0540b'),
(390, 390, 1, NULL, NULL, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '32953dff-5cc0-4523-b885-29389adadd01'),
(391, 391, 1, NULL, NULL, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', 'c7c0c601-e7c4-471d-ba95-6058f90b6ca2'),
(392, 392, 1, NULL, NULL, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', 'aa45ba33-4093-496e-bb3a-e6523d690b26'),
(393, 393, 1, NULL, NULL, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '3ea906ef-b360-4f2f-b1f1-cf6cd3e3bf75'),
(394, 394, 1, NULL, NULL, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', 'eb0e6746-85d0-4772-8cee-ad89942f1808'),
(395, 395, 1, NULL, NULL, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '2d8b2d73-5f38-4dd7-9253-2960ab4ab0b0'),
(396, 396, 1, NULL, NULL, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', 'daddf045-65f3-4076-b661-00df428d3af8'),
(397, 397, 1, NULL, NULL, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '4d034971-3ab9-4b91-8ee1-f09d110b8b26'),
(398, 398, 1, NULL, NULL, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '2beaa1ec-3cd0-41ac-9889-210103655e77'),
(399, 399, 1, NULL, NULL, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '60fb0c8c-951e-4bec-ada1-c138b47aff21'),
(400, 400, 1, NULL, NULL, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '64f9164b-0ea2-4a35-bdad-ffffbe60c317'),
(401, 401, 1, NULL, NULL, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', 'f8e54c69-0ebc-42c4-8409-6eef91b74d2e'),
(402, 402, 1, NULL, NULL, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '6fac5aaf-edbb-4d9c-b084-552c64379e84'),
(403, 403, 1, NULL, NULL, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', 'ba8a5615-de2e-46ef-8053-954c27aa1a0e'),
(404, 404, 1, NULL, NULL, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '835cbddf-9138-4363-bf5c-1f79f1ab18e9'),
(405, 405, 1, NULL, NULL, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '204c24f3-33a2-46ad-a664-e3cbc6a12952'),
(406, 406, 1, NULL, NULL, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '794dfe95-9527-47ea-b2c3-00439a9c4237'),
(407, 407, 1, NULL, NULL, 1, '2021-10-31 12:37:14', '2021-10-31 12:37:14', '3ff3e14b-3fb4-4adf-a44a-b39e462d2202'),
(408, 408, 1, NULL, NULL, 1, '2021-10-31 12:37:15', '2021-10-31 12:37:15', 'bf305324-07d4-4543-a59d-0547dddeaba0'),
(409, 409, 1, NULL, NULL, 1, '2021-10-31 12:37:15', '2021-10-31 12:37:15', '3e898322-b93a-4214-818b-739bccda833e'),
(410, 410, 1, NULL, NULL, 1, '2021-10-31 12:37:15', '2021-10-31 12:37:15', '974ba8db-4a96-4f05-a8d5-0e0b2536f1e4'),
(411, 411, 1, NULL, NULL, 1, '2021-10-31 12:37:15', '2021-10-31 12:37:15', 'f070a262-d201-49f3-97f6-df0cc161134b'),
(412, 412, 1, NULL, NULL, 1, '2021-10-31 12:37:15', '2021-10-31 12:37:15', 'a9c59589-94f8-47ce-855a-4873ff78e4f5'),
(413, 413, 1, NULL, NULL, 1, '2021-10-31 12:37:15', '2021-10-31 12:37:15', 'ede3c1e5-8422-47fb-8546-88239a214335'),
(414, 414, 1, NULL, NULL, 1, '2021-10-31 12:37:15', '2021-10-31 12:37:15', 'c2e6904a-3c62-4c0f-bb4f-d5681776309a'),
(415, 415, 1, NULL, NULL, 1, '2021-10-31 12:37:15', '2021-10-31 12:37:15', '12e0b362-fc22-403e-b697-746e91072be5'),
(416, 416, 1, NULL, NULL, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '284e1280-964a-4772-9ec0-9bfa0d6631fc'),
(417, 417, 1, NULL, NULL, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '213849db-a255-494a-99dc-9808def2c3b8'),
(418, 418, 1, NULL, NULL, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', 'a934cc3a-bc10-4008-a25a-306df3be3b69'),
(419, 419, 1, NULL, NULL, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '39093f10-db38-46f2-bb23-e8773d1acc66'),
(420, 420, 1, NULL, NULL, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '4a263a89-fb16-4329-b919-b7a21f3368ff'),
(421, 421, 1, NULL, NULL, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '106e28ec-3b19-46ff-be80-156b882d8b12'),
(422, 422, 1, NULL, NULL, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '770bcfee-a154-46c6-8dda-cf104a955132'),
(423, 423, 1, NULL, NULL, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', 'd7323cc5-3706-4ea7-adc8-22f932c58695'),
(424, 424, 1, NULL, NULL, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', 'c5c83270-4e3c-4193-8056-6ec479e0431d'),
(434, 434, 1, 'perfect-espresso', 'recipes/perfect-espresso', 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'b1a8499f-327c-482c-92d8-d8da4a1925c0'),
(435, 435, 1, NULL, NULL, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '1fe05243-7a13-4329-826e-a241761d1442'),
(436, 436, 1, NULL, NULL, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'f11e2a46-c01a-4a76-ae10-c92a8e49e31f'),
(437, 437, 1, NULL, NULL, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'ab96615c-9c71-423c-a0ad-3155b7316fa9'),
(438, 438, 1, NULL, NULL, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '89f2b9b3-ae0a-43e4-b28e-543e464423cb'),
(439, 439, 1, NULL, NULL, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '9edec9f7-6d01-4c4e-9926-4563dff73d89'),
(440, 440, 1, NULL, NULL, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'd00ca6d2-28a8-47e5-b50d-b3bcf7c0f061'),
(441, 441, 1, NULL, NULL, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '588152f3-006c-4376-a113-53b000fa4e2f'),
(442, 442, 1, NULL, NULL, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '72f0e006-0b2c-4aab-aad3-9ce67c8740aa'),
(443, 443, 1, NULL, NULL, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '83959ebb-bb3b-4ae2-8b06-cbfc372d0b43'),
(444, 444, 1, 'perfect-espresso', 'recipes/perfect-espresso', 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '6ef5ca21-f61b-447a-8db9-5decef478d94');
INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(445, 445, 1, NULL, NULL, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '7c65b4bd-9c8e-4b18-80a9-f0bd416309cc'),
(446, 446, 1, NULL, NULL, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'e5bd7943-a391-4119-a021-44d8357dbb23'),
(447, 447, 1, NULL, NULL, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '44bfb29c-8702-43da-92f7-da314136bb42'),
(448, 448, 1, NULL, NULL, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'ab1b4e80-25a2-4e0d-a56e-3f46ec5a3551'),
(449, 449, 1, NULL, NULL, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '5680e326-2f36-47d6-b939-f96cfce572d6'),
(450, 450, 1, NULL, NULL, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'ccd35a5d-5ac9-428e-8083-e09f283e017d'),
(451, 451, 1, NULL, NULL, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '9feb6192-f92c-4321-bc77-b5ac03a93824'),
(452, 452, 1, NULL, NULL, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '930a8394-e46a-4016-b8de-2153a6bc596e'),
(453, 453, 1, NULL, NULL, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'bfbf385f-137e-4977-a6b9-9ebd71393886'),
(464, 464, 1, NULL, NULL, 1, '2021-10-31 14:01:39', '2021-10-31 14:01:39', 'bfffb819-45f7-4fe2-916c-9a61cf4fb1e2'),
(465, 465, 1, NULL, NULL, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '7c67ede0-3829-4a5f-993e-89bc9084e5db'),
(466, 466, 1, NULL, NULL, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '09c3bc44-dee1-4088-97b9-5f0b0df464ad'),
(467, 467, 1, NULL, NULL, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'dbbddc56-8ab9-4631-b948-69a3bbc089e6'),
(468, 468, 1, NULL, NULL, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '85c900fa-90e4-4d32-9a65-05535ab37c2f'),
(469, 469, 1, NULL, NULL, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '9747c082-907d-47ea-8eeb-b540f85443c7'),
(470, 470, 1, NULL, NULL, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'f26f2929-eb95-4067-ba4e-1c880bea7a8b'),
(471, 471, 1, NULL, NULL, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '3bdf8d0b-1c36-4f1b-93f5-2792ec43bd2d'),
(472, 472, 1, NULL, NULL, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '23b0acaa-a62e-4f2e-801e-a0d60c845f85'),
(473, 473, 1, 'perfect-espresso', 'recipes/perfect-espresso', 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'ed317ca1-41ff-4631-8869-56a43128f11d'),
(474, 474, 1, NULL, NULL, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'b00f24a1-6921-4bb5-a7ae-5de9f932e1f6'),
(475, 475, 1, NULL, NULL, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'd92ae5c9-bf46-4167-9f6f-69346181bd75'),
(476, 476, 1, NULL, NULL, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '2548d897-d739-48bc-814d-4eb71fa04841'),
(477, 477, 1, NULL, NULL, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'e5881384-2b17-4498-8f27-c6fdabb7e371'),
(478, 478, 1, NULL, NULL, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '38622178-b69f-4c41-99fd-90bfa344844d'),
(479, 479, 1, NULL, NULL, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'b575452b-74b0-4692-9e4d-b5c5fd625c9d'),
(480, 480, 1, NULL, NULL, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '57ec1075-4271-40d1-a5d4-50909eff9781'),
(481, 481, 1, NULL, NULL, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'b0a4dde4-f102-4b01-875f-5b104d7dc7ae'),
(482, 482, 1, NULL, NULL, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'dab33d6c-f187-48fb-bbe5-a3e37ff29115'),
(483, 483, 1, 'perfect-espresso', 'recipes/perfect-espresso', 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '739aa286-24dc-4ced-acf2-e431da84a1a6'),
(484, 484, 1, NULL, NULL, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', 'aab1028c-780d-4575-a30b-fa8eff10f067'),
(485, 485, 1, NULL, NULL, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', 'c35c7179-70b0-4e24-ab85-15862555ecab'),
(486, 486, 1, NULL, NULL, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '26a93b5c-8886-456e-ab58-68dd363b32e3'),
(487, 487, 1, NULL, NULL, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', 'f1729d37-d104-4b5b-8c62-1ac56b0f73cc'),
(488, 488, 1, NULL, NULL, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '95bdc635-3e40-49c8-a633-fa6dd7208767'),
(489, 489, 1, NULL, NULL, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', 'ebd8a39c-2cc9-433b-8fa4-460e1614cc79'),
(490, 490, 1, NULL, NULL, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '130dea4d-d5f9-4fcf-a088-4651030f72ba'),
(491, 491, 1, NULL, NULL, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '7f21797f-e37a-43c3-bf9c-acefcc46ee4a'),
(492, 492, 1, NULL, NULL, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', 'a7f1beef-e935-436a-8f5a-f5ba8d5dcaac'),
(493, 493, 1, 'perfect-espresso', 'recipes/perfect-espresso', 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', '9e14e41f-bf89-4acf-b98c-7a764c329530'),
(494, 494, 1, NULL, NULL, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', '5ade638e-36b4-43c2-a2cf-45d8d800212a'),
(495, 495, 1, NULL, NULL, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', '0361692e-0a1e-49fb-8a8f-ec590efd48fe'),
(496, 496, 1, NULL, NULL, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', '4b91aa8d-ee27-4f36-a50c-f974aae133af'),
(497, 497, 1, NULL, NULL, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', 'fbf53178-87ed-4508-8421-423fd820a737'),
(498, 498, 1, NULL, NULL, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', 'da90692d-2f2f-4eb5-9c15-ba7628cab9bf'),
(499, 499, 1, NULL, NULL, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', '9186169e-0b7f-4999-bda0-a97fa5af71bb'),
(500, 500, 1, NULL, NULL, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', '9babb0f9-6343-4d6c-9118-4b84d194b1e4'),
(501, 501, 1, NULL, NULL, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', '5af9d9ad-c65e-4b51-81a0-a0bd17be9505'),
(502, 502, 1, NULL, NULL, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', 'b00ed921-7ad0-4784-a0bc-e75d78c3b535'),
(503, 503, 1, 'espresso', 'styles/espresso', 1, '2021-10-31 16:12:37', '2021-10-31 16:12:39', '91eb17b2-471f-44fa-afe4-f8270df662ae'),
(504, 504, 1, 'perfect-espresso', 'recipes/perfect-espresso', 1, '2021-10-31 16:17:14', '2021-10-31 16:17:14', '828449e9-b05c-43e8-9d97-2a2ba26e16b8'),
(505, 505, 1, NULL, NULL, 1, '2021-10-31 16:17:14', '2021-10-31 16:17:14', 'e44cc4f7-f808-40b2-b042-09278df7353f'),
(506, 506, 1, NULL, NULL, 1, '2021-10-31 16:17:15', '2021-10-31 16:17:15', 'c41aea0e-cf7d-4418-a096-701c16facbff'),
(507, 507, 1, NULL, NULL, 1, '2021-10-31 16:17:15', '2021-10-31 16:17:15', 'cda680ed-4605-4692-94a6-f4fbc8cba067'),
(508, 508, 1, NULL, NULL, 1, '2021-10-31 16:17:15', '2021-10-31 16:17:15', 'd2f9fb66-1bfc-4f86-940e-14532c0cb524'),
(509, 509, 1, NULL, NULL, 1, '2021-10-31 16:17:15', '2021-10-31 16:17:15', '05c1fa6d-efc1-4bd3-a3a0-526aa2fb6091'),
(510, 510, 1, NULL, NULL, 1, '2021-10-31 16:17:15', '2021-10-31 16:17:15', 'e36db50f-9b07-45bf-adb9-e905fcee34ba'),
(511, 511, 1, NULL, NULL, 1, '2021-10-31 16:17:15', '2021-10-31 16:17:15', 'cdd27617-7e20-4352-b896-4527f034dfc0'),
(512, 512, 1, NULL, NULL, 1, '2021-10-31 16:17:15', '2021-10-31 16:17:15', '6ca64d71-77bb-4ffc-8e1c-194794d42263'),
(513, 513, 1, NULL, NULL, 1, '2021-10-31 16:17:15', '2021-10-31 16:17:15', 'aef8a064-0610-47b2-adfd-4c0a8c2c38a8'),
(514, 514, 1, 'espresso', 'drinks/espresso', 1, '2021-10-31 16:18:54', '2021-10-31 16:18:54', 'dab9dc21-0ad7-4cb7-9e16-5f6b1941cc7d'),
(515, 515, 1, 'perfect-espresso', 'recipes/perfect-espresso', 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', 'bf2d1bfe-6b08-4276-9a99-83094ca06dee'),
(516, 516, 1, NULL, NULL, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', '0aa5be10-200c-4c97-99ac-a04ff57dc64a'),
(517, 517, 1, NULL, NULL, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', '6184fa86-4e6b-431a-8a3e-f453fd18c39f'),
(518, 518, 1, NULL, NULL, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', '50618bb8-d5d5-438d-9eaa-f252cf444f06'),
(519, 519, 1, NULL, NULL, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', '2c7c83dc-801a-45dd-bf2f-dfdc3259c6a9'),
(520, 520, 1, NULL, NULL, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', '763f7021-0825-4f86-92b0-d6c8f98aabdd'),
(521, 521, 1, NULL, NULL, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', '0c1ecb9f-7cdd-4e43-9741-53916f4b1706'),
(522, 522, 1, NULL, NULL, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', '73dc0c44-575c-4230-bdeb-79a32784be20'),
(523, 523, 1, NULL, NULL, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', '124eae2d-ec8e-4e8f-8116-a6a8f2c1a2ea'),
(524, 524, 1, NULL, NULL, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', 'c1ef417a-67e9-47b1-a35b-c4ba37b86465'),
(525, 525, 1, 'espresso', 'drinks/espresso', 1, '2021-11-01 06:45:04', '2021-11-01 06:45:04', 'b9232f42-a7b7-4f1f-8745-a8638d24e1fe'),
(526, 526, 1, 'iced-coffee', 'drinks/iced-coffee', 1, '2021-11-01 06:55:51', '2021-11-01 06:55:51', '9d93780f-6bba-4811-a4a0-6333a6222746'),
(527, 527, 1, 'iced-drinks', 'styles/iced-drinks', 1, '2021-11-01 07:40:17', '2021-11-01 07:40:18', '4858635c-f90d-4b80-96a5-5ec91e2326ed'),
(528, 528, 1, 'iced-americano', 'recipes/iced-americano', 1, '2021-11-01 07:49:07', '2021-11-01 07:49:07', '3b87bb5f-d086-484a-abf1-96c179e520e7'),
(529, 529, 1, NULL, NULL, 1, '2021-11-01 07:49:07', '2021-11-01 07:49:07', '11e95ae4-c18c-4fab-b0aa-1ea8f0869614'),
(530, 530, 1, 'iced-americano', 'recipes/iced-americano', 1, '2021-11-01 07:49:07', '2021-11-01 07:49:07', '718c8821-b355-422f-96c6-9b8aed40c2d5'),
(531, 531, 1, NULL, NULL, 1, '2021-11-01 07:49:08', '2021-11-01 07:49:08', '708c624c-2b3e-4317-b5b9-5c06de5dcc8c'),
(532, 532, 1, 'iced-coffee', 'drinks/iced-coffee', 1, '2021-11-01 07:49:20', '2021-11-01 07:49:20', '820d96ad-7d67-4c28-9483-c7220ab8438b'),
(533, 533, 1, 'espresso', 'drinks/espresso', 1, '2021-11-01 07:49:38', '2021-11-01 07:49:38', 'c201de06-fb92-43d1-b588-1c90a0727701');

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
(2, 1, NULL, 1, 1, '2021-10-30 07:51:00', NULL, NULL, '2021-10-30 07:51:20', '2021-10-30 07:51:20', '23586a90-d0a4-48dd-a9c3-f1291c2981ef'),
(3, 1, NULL, 1, 1, '2021-10-30 08:01:00', NULL, NULL, '2021-10-30 08:01:17', '2021-10-30 08:01:17', '0ce4d2b7-4372-4cc7-b030-1244b81754df'),
(4, 1, NULL, 1, 1, '2021-10-30 08:41:00', NULL, NULL, '2021-10-30 08:41:11', '2021-10-30 08:41:11', '6904cb3e-abe3-4143-890b-7f89ca92c888'),
(5, 2, NULL, 2, 1, '2021-10-30 08:49:00', NULL, NULL, '2021-10-30 08:49:26', '2021-10-30 08:49:26', '2cd62f53-4bb9-4239-b9de-f36182c6cdf1'),
(6, 1, NULL, 1, 1, '2021-10-30 08:49:00', NULL, NULL, '2021-10-30 08:49:31', '2021-10-30 08:49:31', '8c10d988-39f4-41a5-a1eb-047de733879c'),
(8, 1, NULL, 1, 1, '2021-10-30 08:53:00', NULL, NULL, '2021-10-30 08:54:36', '2021-10-30 08:54:36', '532f70f6-42af-41f3-9007-953ca1f40bc6'),
(9, 1, NULL, 1, 1, '2021-10-30 08:53:00', NULL, NULL, '2021-10-30 08:54:36', '2021-10-30 08:54:36', 'c95f7243-cc1c-417d-af9c-076d8527c7c5'),
(10, 1, NULL, 1, 1, '2021-10-30 08:53:00', NULL, NULL, '2021-10-30 08:54:51', '2021-10-30 08:54:51', '5e0504b2-b487-4b29-81c9-ad70f31c459b'),
(11, 2, NULL, 2, 1, '2021-10-30 08:56:00', NULL, NULL, '2021-10-30 08:56:16', '2021-10-30 08:56:16', 'a463c7f9-16a3-489b-a16c-16f7f03ae8a9'),
(13, 2, NULL, 2, 1, '2021-10-30 08:57:00', NULL, NULL, '2021-10-30 08:58:07', '2021-10-30 08:58:07', '237f39e4-3504-4dfb-89d6-cebb6f446add'),
(14, 2, NULL, 2, 1, '2021-10-30 08:57:00', NULL, NULL, '2021-10-30 08:58:08', '2021-10-30 08:58:08', 'e9a6fe0b-308a-4036-8968-4367cb89b61b'),
(15, 3, NULL, 3, NULL, '2021-10-30 09:02:00', NULL, NULL, '2021-10-30 09:02:53', '2021-10-30 09:02:53', '2322a372-1aab-464c-b650-ee23724b4e2d'),
(16, 3, NULL, 3, NULL, '2021-10-30 09:02:00', NULL, NULL, '2021-10-30 09:02:53', '2021-10-30 09:02:53', '4cab12ee-4812-4b7a-9096-76cf481bcd5c'),
(17, 3, NULL, 3, NULL, '2021-10-30 09:02:00', NULL, NULL, '2021-10-30 09:03:05', '2021-10-30 09:03:05', '018a92e2-13a4-494c-93a7-0dc780958513'),
(18, 3, NULL, 3, NULL, '2021-10-30 09:02:00', NULL, NULL, '2021-10-30 09:03:05', '2021-10-30 09:03:05', '59e04c8c-7ee3-4a88-897a-c03c22e6c130'),
(19, 3, NULL, 3, NULL, '2021-10-30 09:02:00', NULL, NULL, '2021-10-30 09:04:42', '2021-10-30 09:04:42', 'ea2e4288-1b56-4f5a-913f-ab9e1c7e806c'),
(20, 3, NULL, 3, NULL, '2021-10-30 09:02:00', NULL, NULL, '2021-10-30 09:05:51', '2021-10-30 09:05:51', '30902f70-d1d5-4da4-a981-f226644d5ad6'),
(24, 1, NULL, 1, 1, '2021-10-30 08:53:00', NULL, NULL, '2021-10-30 12:22:39', '2021-10-30 12:22:39', 'eb651f75-9255-459d-9512-00977465a8a5'),
(26, 2, NULL, 2, 1, '2021-10-30 13:23:00', NULL, NULL, '2021-10-30 13:23:05', '2021-10-30 13:23:05', 'b6b21388-e13d-4e61-b65a-1461531cd306'),
(28, 1, NULL, 1, 1, '2021-10-30 13:23:00', NULL, NULL, '2021-10-30 13:23:46', '2021-10-30 13:23:46', 'fcff85a2-5e89-4d74-a133-c15e781ff8f1'),
(29, 1, NULL, 1, 1, '2021-10-30 13:23:00', NULL, NULL, '2021-10-30 13:23:46', '2021-10-30 13:23:46', '73475170-8240-487c-be6b-02ac4d0765db'),
(30, 1, NULL, 1, 1, '2021-10-30 13:30:00', NULL, NULL, '2021-10-30 13:30:40', '2021-10-30 13:30:40', 'bff20677-92e9-4b70-afed-7dd0896841fe'),
(32, 4, NULL, 4, 1, '2021-10-30 13:31:00', NULL, NULL, '2021-10-30 13:31:51', '2021-10-30 13:31:51', '28d157f3-80cb-49b8-8d36-57894c75622e'),
(33, 4, NULL, 4, 1, '2021-10-30 13:31:00', NULL, NULL, '2021-10-30 13:31:51', '2021-10-30 13:31:51', 'f79ef394-a301-4ff1-bc73-41b5616189ea'),
(35, 4, NULL, 4, 1, '2021-10-30 13:32:00', NULL, NULL, '2021-10-30 13:32:39', '2021-10-30 13:32:39', 'e361531a-c3d3-4a3a-a8e4-2110f390bb99'),
(36, 4, NULL, 4, 1, '2021-10-30 13:32:00', NULL, NULL, '2021-10-30 13:32:39', '2021-10-30 13:32:39', '5721e237-c76a-4a91-b781-ea0eff5f425e'),
(38, 4, NULL, 4, 1, '2021-10-30 13:32:00', NULL, NULL, '2021-10-30 13:33:08', '2021-10-30 13:33:08', '8d87b45a-ea4d-4202-909b-1d9d4d38a300'),
(39, 4, NULL, 4, 1, '2021-10-30 13:32:00', NULL, NULL, '2021-10-30 13:33:08', '2021-10-30 13:33:08', '46a712c7-82f5-4ea2-a722-956d4f2ecc04'),
(41, 4, NULL, 4, 1, '2021-10-30 13:33:00', NULL, NULL, '2021-10-30 13:33:40', '2021-10-30 13:33:40', 'a7b2a02b-2c5c-469a-b8b0-ef16a14bc9b6'),
(42, 4, NULL, 4, 1, '2021-10-30 13:33:00', NULL, NULL, '2021-10-30 13:33:40', '2021-10-30 13:33:40', '4ffd80ff-f7d3-489b-86fa-b276e8002a2a'),
(43, 4, NULL, 4, 1, '2021-10-30 13:32:00', NULL, NULL, '2021-10-30 13:37:28', '2021-10-30 13:37:28', '1bbb7f55-ae2c-45c4-80ac-ead043ff502e'),
(44, 4, NULL, 4, 1, '2021-10-30 13:31:00', NULL, NULL, '2021-10-30 14:28:11', '2021-10-30 14:28:11', '96d417a6-ee18-4071-ba11-503bf90641a0'),
(45, 3, NULL, 3, NULL, '2021-10-30 09:02:00', NULL, NULL, '2021-10-30 15:33:37', '2021-10-30 15:33:37', '84014c23-d21e-4a59-a8e0-e255417fd020'),
(46, 3, NULL, 3, NULL, '2021-10-30 09:02:00', NULL, NULL, '2021-10-30 15:33:37', '2021-10-30 15:33:37', 'cc3e3e2d-11b5-4ad0-abf7-67b401311434'),
(47, 3, NULL, 3, NULL, '2021-10-30 09:02:00', NULL, NULL, '2021-10-30 15:35:14', '2021-10-30 15:35:14', 'f4119014-d6ad-4a47-8596-5c8a66e2185e'),
(48, 3, NULL, 3, NULL, '2021-10-30 09:02:00', NULL, NULL, '2021-10-30 15:36:20', '2021-10-30 15:36:20', '4f236164-78cb-4cd1-9fa6-d67ecbdd2503'),
(49, 3, NULL, 3, NULL, '2021-10-30 09:02:00', NULL, NULL, '2021-10-30 15:36:31', '2021-10-30 15:36:31', 'bb9c8220-9455-421b-9b54-c6d9ece28657'),
(50, 1, NULL, 1, 1, '2021-10-30 13:23:00', NULL, NULL, '2021-10-31 10:07:50', '2021-10-31 10:07:50', '5c7643c6-f2e0-4ceb-83ec-cfa1e51ed493'),
(51, 1, NULL, 1, 1, '2021-10-30 08:53:00', NULL, NULL, '2021-10-31 10:09:08', '2021-10-31 10:09:08', 'bb3d659a-bec7-429d-bfa2-13c48f1ec510'),
(52, 1, NULL, 1, 1, '2021-10-30 13:23:00', NULL, NULL, '2021-10-31 10:38:17', '2021-10-31 10:38:17', '86894296-5dce-48c6-a34a-09b574230b41'),
(54, 2, NULL, 2, 1, '2021-10-31 10:50:00', NULL, NULL, '2021-10-31 10:50:57', '2021-10-31 10:50:57', '12f29edf-c927-4894-8ddf-fe4b818acb4b'),
(55, 2, NULL, 2, 1, '2021-10-31 10:50:00', NULL, NULL, '2021-10-31 10:50:57', '2021-10-31 10:50:57', 'aafba5a9-cd63-4717-bad6-cca6182bc567'),
(56, 4, NULL, 4, 1, '2021-10-30 13:32:00', NULL, NULL, '2021-10-31 11:20:24', '2021-10-31 11:20:24', '75a6ef56-1119-468f-a163-ce2f3d9aef65'),
(57, 4, NULL, 4, 1, '2021-10-30 13:32:00', NULL, NULL, '2021-10-31 11:21:27', '2021-10-31 11:21:27', '24711d92-cbb9-4c70-ab13-ae7641d28b8a'),
(434, 5, NULL, 5, 1, '2021-10-31 12:30:00', NULL, NULL, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '1a840d31-07cc-40af-8c1a-d00b1a34f767'),
(444, 5, NULL, 5, 1, '2021-10-31 12:30:00', NULL, NULL, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'ba72fbb8-dcff-4aab-a315-51bbd261c47d'),
(473, 5, NULL, 5, 1, '2021-10-31 12:30:00', NULL, NULL, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '493bb09e-fe39-4431-ba7a-59852be3564a'),
(483, 5, NULL, 5, 1, '2021-10-31 12:30:00', NULL, NULL, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '2ca95a38-7aec-4bea-a9d4-71da269c0ca0'),
(493, 5, NULL, 5, 1, '2021-10-31 12:30:00', NULL, NULL, '2021-10-31 16:03:14', '2021-10-31 16:03:14', '263d75d8-da6c-4259-a014-a6ae1313f0de'),
(504, 5, NULL, 5, 1, '2021-10-31 12:30:00', NULL, NULL, '2021-10-31 16:17:14', '2021-10-31 16:17:14', '87d18027-f529-405a-8c9c-8203b3dc7e9a'),
(514, 1, NULL, 1, 1, '2021-10-30 08:53:00', NULL, NULL, '2021-10-31 16:18:54', '2021-10-31 16:18:54', '65c2062d-0535-41ef-8d91-4a5f03088e1d'),
(515, 5, NULL, 5, 1, '2021-10-31 12:30:00', NULL, NULL, '2021-10-31 16:23:21', '2021-10-31 16:23:21', 'a73f7a8b-07b2-423b-b0e2-8a2903a18e98'),
(525, 1, NULL, 1, 1, '2021-10-30 08:53:00', NULL, NULL, '2021-11-01 06:45:04', '2021-11-01 06:45:04', '2007b2f8-4a8e-4813-9b19-abfeb1bd7d38'),
(526, 1, NULL, 1, 1, '2021-10-30 13:23:00', NULL, NULL, '2021-11-01 06:55:51', '2021-11-01 06:55:51', 'ae5761bf-b0d6-43e3-a732-cbf0e9113c4c'),
(528, 5, NULL, 5, 1, '2021-11-01 07:49:00', NULL, NULL, '2021-11-01 07:49:07', '2021-11-01 07:49:07', '26cf250f-4dd3-4260-b843-3b9c417aed99'),
(530, 5, NULL, 5, 1, '2021-11-01 07:49:00', NULL, NULL, '2021-11-01 07:49:07', '2021-11-01 07:49:07', '54b94633-b1da-4dcc-964c-104c0abdc96a'),
(532, 1, NULL, 1, 1, '2021-10-30 13:23:00', NULL, NULL, '2021-11-01 07:49:20', '2021-11-01 07:49:20', 'b8ef5ab4-dba2-4b12-8e5f-dadf3b6b6a66'),
(533, 1, NULL, 1, 1, '2021-10-30 08:53:00', NULL, NULL, '2021-11-01 07:49:38', '2021-11-01 07:49:38', 'b7b8cc2e-7899-4f65-841f-8a18b753b22a');

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
(1, 1, 1, 'Drinks', 'drinks', 1, 'Drink Name', '', 1, '2021-10-30 07:05:00', '2021-11-01 07:46:44', NULL, '5efc3f24-2fcc-4bdc-a22a-fb295d2d2db9'),
(2, 2, 2, 'News', 'news', 1, 'Headline', '', 1, '2021-10-30 08:43:28', '2021-10-30 08:57:13', NULL, '19b9e6f7-726c-436b-a382-bd9063476ad0'),
(3, 3, 3, 'Homepage', 'homepage', 1, 'Homepage Title', '{section.name|raw}', 1, '2021-10-30 09:02:53', '2021-10-30 15:33:37', NULL, '117076d2-865d-4007-970c-5c970d5a6a89'),
(4, 4, 4, 'About Crafty Coffee', 'aboutCraftyCoffee', 1, 'Page Title', '', 1, '2021-10-30 13:29:25', '2021-10-30 14:27:21', NULL, '2d81f0c0-fc28-42c3-b997-e9c27be40011'),
(5, 5, 10, 'Recipes', 'recipes', 1, 'Recipe Name', '', 1, '2021-10-31 12:16:03', '2021-10-31 16:16:43', NULL, '7abe6584-2c24-4dba-bee5-88399c442fca');

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
(1, 'Common', '2021-10-08 15:12:57', '2021-10-08 15:12:57', '29b5eecd-24ce-4d41-b0a9-a2580ec26dad'),
(2, 'Drinks', '2021-10-30 07:42:53', '2021-10-30 07:42:53', '46d0b950-d8bb-481e-bcdc-b0f6b62a4155'),
(3, 'News', '2021-10-30 08:43:46', '2021-10-30 08:43:46', '37b076b7-fc2d-4570-8fca-06f5e67418d9'),
(4, 'About', '2021-10-30 14:21:53', '2021-10-30 14:21:53', '4471bad0-e360-4c7f-b2d6-b6a67e6b5183'),
(5, 'Recipes', '2021-10-31 12:16:49', '2021-10-31 12:16:49', '4220c21a-0099-4f08-90eb-c9ebf3befb17'),
(6, 'Styles', '2021-10-31 16:08:58', '2021-10-31 16:08:58', '3eaf4b14-aaab-4e2a-ae65-c058f65db41f');

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
(3, 2, 2, 4, 0, 2, '2021-10-30 08:57:13', '2021-10-30 08:57:13', 'd042fa07-cfd6-4773-90f0-34f8c9f37479'),
(4, 2, 2, 3, 0, 1, '2021-10-30 08:57:13', '2021-10-30 08:57:13', '7d6727fd-ff35-4081-8a87-10f0738cbe16'),
(14, 4, 6, 6, 0, 1, '2021-10-30 14:27:21', '2021-10-30 14:27:21', '861a1d8a-0e89-40e3-833c-5fc9ff34ded5'),
(15, 4, 6, 7, 0, 2, '2021-10-30 14:27:21', '2021-10-30 14:27:21', 'e99a2700-bec6-4491-bd11-cb00e8e61f8c'),
(16, 4, 6, 2, 1, 3, '2021-10-30 14:27:21', '2021-10-30 14:27:21', '58fca418-8927-4ab3-9dfc-743c24f28120'),
(17, 3, 7, 6, 0, 1, '2021-10-30 15:33:37', '2021-10-30 15:33:37', '418e630a-0a12-47cc-a12e-c884f72d2b04'),
(37, 5, 20, 10, 0, 2, '2021-10-31 15:59:53', '2021-10-31 15:59:53', '6ec08be9-daa3-42b3-8a72-ea1e323a5cd5'),
(38, 5, 20, 11, 0, 1, '2021-10-31 15:59:53', '2021-10-31 15:59:53', '1fc17e80-b637-4545-a0da-2af095f32d1b'),
(39, 6, 21, 12, 0, 1, '2021-10-31 15:59:53', '2021-10-31 15:59:53', '3ca6f3ca-40c0-49fd-a648-508642eb5b86'),
(40, 7, 22, 13, 0, 1, '2021-10-31 15:59:54', '2021-10-31 15:59:54', 'd14e7096-7e78-405a-bcf0-13cab669a679'),
(41, 8, 23, 14, 0, 2, '2021-10-31 15:59:54', '2021-10-31 15:59:54', '9933ca91-22c9-4cf1-8b7e-6f354c7ceca0'),
(42, 8, 23, 15, 0, 1, '2021-10-31 15:59:54', '2021-10-31 15:59:54', '4f0d6c3c-b0ad-4c9e-9c7a-d72ced6a2205'),
(43, 9, 24, 16, 0, 1, '2021-10-31 15:59:54', '2021-10-31 15:59:54', 'b7e10320-469e-458b-b8eb-58552dedeb3e'),
(46, 11, 26, 18, 0, 1, '2021-10-31 16:11:36', '2021-10-31 16:11:36', '6ae4d009-a69b-47fa-8c30-fb490996b203'),
(47, 10, 27, 19, 0, 1, '2021-10-31 16:16:43', '2021-10-31 16:16:43', '9a40aeeb-d57e-4115-9087-caf6bc102aec'),
(48, 10, 27, 17, 0, 2, '2021-10-31 16:16:43', '2021-10-31 16:16:43', '04f40357-c494-4c6f-95fa-a066a88a9ffb'),
(49, 10, 27, 9, 0, 3, '2021-10-31 16:16:43', '2021-10-31 16:16:43', 'acff3783-1f1f-4ca2-bc19-f8d02bf7bf73'),
(55, 1, 29, 2, 0, 4, '2021-11-01 07:46:44', '2021-11-01 07:46:44', 'dc69b9e2-1f98-4620-bd5b-8449a1c06319'),
(56, 1, 29, 5, 0, 5, '2021-11-01 07:46:44', '2021-11-01 07:46:44', '361496cf-3a4f-4c4a-8666-b616eec1acad'),
(57, 1, 29, 20, 0, 6, '2021-11-01 07:46:44', '2021-11-01 07:46:44', '2128736f-0b36-4879-81b9-7133f4f53ace'),
(58, 1, 29, 8, 0, 3, '2021-11-01 07:46:44', '2021-11-01 07:46:44', '0d1f56d5-c6bb-42e2-96ab-609b2ee8b6ad'),
(59, 1, 29, 19, 0, 1, '2021-11-01 07:46:44', '2021-11-01 07:46:44', '4c68681f-2854-4b0f-b257-2cb1f1f6f53d'),
(60, 1, 29, 1, 0, 2, '2021-11-01 07:46:44', '2021-11-01 07:46:44', 'c219c10b-72d4-48fd-94bf-ddd683659984');

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
(1, 'craft\\elements\\Entry', '2021-10-30 08:53:26', '2021-10-30 08:53:26', NULL, '9ed38d65-ff11-4350-b2a1-b884b717a255'),
(2, 'craft\\elements\\Entry', '2021-10-30 08:57:13', '2021-10-30 08:57:13', NULL, '43ade41a-8839-4638-82d6-b62be4641a6c'),
(3, 'craft\\elements\\Entry', '2021-10-30 09:04:42', '2021-10-30 09:04:42', NULL, 'ad2315cc-a0cb-4992-a940-cec7dcc8b546'),
(4, 'craft\\elements\\Entry', '2021-10-30 14:23:35', '2021-10-30 14:23:35', NULL, '854764cf-ee38-48d1-9f1a-a92f15b751e9'),
(5, 'craft\\elements\\MatrixBlock', '2021-10-31 12:29:12', '2021-10-31 12:29:12', NULL, 'ca30a4c1-269d-40aa-98d9-c3ac0205ad6a'),
(6, 'craft\\elements\\MatrixBlock', '2021-10-31 12:29:13', '2021-10-31 12:29:13', NULL, 'b0cffbb3-c789-47e9-b064-3eaa80bb3dc1'),
(7, 'craft\\elements\\MatrixBlock', '2021-10-31 12:29:14', '2021-10-31 12:29:14', NULL, '513bbd38-3223-4f22-8316-f8a94145f29d'),
(8, 'craft\\elements\\MatrixBlock', '2021-10-31 12:29:15', '2021-10-31 12:29:15', NULL, '4ca12c0e-17b5-4e3f-aca3-def6b6a4ae7e'),
(9, 'craft\\elements\\MatrixBlock', '2021-10-31 12:29:16', '2021-10-31 12:29:16', NULL, '913d402a-7a6a-475e-a4e2-85f9d85bf00a'),
(10, 'craft\\elements\\Entry', '2021-10-31 12:30:07', '2021-10-31 12:30:07', NULL, '4c6a86c9-f08e-4e8f-9141-45ecef20fd12'),
(11, 'craft\\elements\\Category', '2021-10-31 16:11:36', '2021-10-31 16:11:36', NULL, '5ef73e46-5c67-4de8-bd55-abdce29b166d');

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
(2, 2, 'News', 1, '2021-10-30 08:57:13', '2021-10-30 08:57:13', 'a0975085-cd18-4a36-8f88-d64b7079cbae'),
(6, 4, 'About', 1, '2021-10-30 14:27:21', '2021-10-30 14:27:21', '694fe915-7a81-4ec6-ad44-06d0a1bdf80a'),
(7, 3, 'Common', 1, '2021-10-30 15:33:37', '2021-10-30 15:33:37', 'baa3351c-97d5-43ec-a213-5666d459f0f7'),
(20, 5, 'Content', 1, '2021-10-31 15:59:53', '2021-10-31 15:59:53', '89ddb857-d79e-4f88-acaf-35632b9721ed'),
(21, 6, 'Content', 1, '2021-10-31 15:59:53', '2021-10-31 15:59:53', '07498dd1-40ee-4e3b-87ff-fe4d1e546fd3'),
(22, 7, 'Content', 1, '2021-10-31 15:59:54', '2021-10-31 15:59:54', 'c6ac9cd0-9cb5-4d2b-a5c8-dd6696c4cb4f'),
(23, 8, 'Content', 1, '2021-10-31 15:59:54', '2021-10-31 15:59:54', '2ce09dd2-d6f5-4275-a340-2f76380b3843'),
(24, 9, 'Content', 1, '2021-10-31 15:59:54', '2021-10-31 15:59:54', '75152d56-1c6a-4c26-b969-604e57e7348e'),
(26, 11, 'Styles', 1, '2021-10-31 16:11:36', '2021-10-31 16:11:36', '79e27ba8-c03d-4db9-b97f-f3cfb1161748'),
(27, 10, 'Recipes', 1, '2021-10-31 16:16:43', '2021-10-31 16:16:43', 'a23f8936-7e2e-404a-a7ca-172f7f040c70'),
(29, 1, 'Drink Details', 1, '2021-11-01 07:46:44', '2021-11-01 07:46:44', '1d2ca9f9-3dd3-41bc-aca5-6b5b1fe87950');

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
(1, 2, 'Introduction', 'introduction', 'global', 'Short sentence at top of drink page.', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2021-10-30 08:01:01', '2021-10-30 08:01:01', 'd2ba998d-795f-4f1e-aa0b-6b04564565ec'),
(2, 2, 'Page Copy', 'pageCopy', 'global', '', 1, 'none', NULL, 'craft\\redactor\\Field', '{\"redactorConfig\":\"Standard.json\",\"purifierConfig\":\"\",\"cleanupHtml\":true,\"removeInlineStyles\":\"1\",\"removeEmptyTags\":\"1\",\"removeNbsp\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}', '2021-10-30 08:40:10', '2021-10-30 08:40:10', '4ac53921-705b-401d-9bb9-2739d1cb10c3'),
(3, 1, 'Excerpt', 'excerpt', 'global', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2021-10-30 08:45:27', '2021-10-30 08:46:13', '9703ea0e-6465-4b42-913d-c12428792570'),
(4, 3, 'News Body', 'newsBody', 'global', '', 1, 'none', NULL, 'craft\\redactor\\Field', '{\"redactorConfig\":\"\",\"purifierConfig\":\"\",\"cleanupHtml\":true,\"removeInlineStyles\":\"1\",\"removeEmptyTags\":\"1\",\"removeNbsp\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}', '2021-10-30 08:47:11', '2021-10-30 08:47:11', '3149c307-8b38-4033-b7eb-e951301cdca6'),
(5, 2, 'Drink Image', 'drinkImage', 'global', '', 1, 'site', NULL, 'craft\\fields\\Assets', '{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:526be8f2-d24c-4d05-898e-c2f298e91236\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:526be8f2-d24c-4d05-898e-c2f298e91236\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":[\"volume:526be8f2-d24c-4d05-898e-c2f298e91236\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":\"large\",\"limit\":\"1\",\"selectionLabel\":\"Add a drink image\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"}', '2021-10-30 12:21:14', '2021-10-30 12:21:14', '6260aee9-73bc-449e-aff6-3d208acec35e'),
(6, 4, 'Subtitle', 'subtitle', 'global', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2021-10-30 14:22:41', '2021-10-30 14:25:42', '13099bd4-7175-4fd1-a84c-2c8154635242'),
(7, 4, 'Page Intro', 'pageIntro', 'global', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2021-10-30 14:26:04', '2021-10-30 14:26:04', '39f06104-4ce9-48ac-bda3-634abffe5fa7'),
(8, 2, 'Date added to menu', 'dateAddedToMenu', 'global', '', 1, 'none', NULL, 'craft\\fields\\Date', '{\"showDate\":true,\"showTime\":false,\"minuteIncrement\":\"30\"}', '2021-10-31 10:37:36', '2021-10-31 10:37:36', 'aec1fcb3-9fb8-4ec1-8765-89df0e9cfe21'),
(9, 5, 'Recipe Contents', 'recipeContents', 'global', '', 1, 'site', NULL, 'craft\\fields\\Matrix', '{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_recipecontents}}\",\"propagationMethod\":\"all\"}', '2021-10-31 12:29:09', '2021-10-31 15:59:53', 'd99d371a-64de-4ff0-bb0e-b1a4ce816e58'),
(10, NULL, 'Image Caption', 'imageCaption', 'matrixBlockType:d8e26cdc-33ef-4e7f-aa32-6f532578f79e', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2021-10-31 12:29:12', '2021-10-31 15:59:53', 'b5e75135-d67c-4a05-9b74-a73c54a4057b'),
(11, NULL, 'Image', 'image', 'matrixBlockType:d8e26cdc-33ef-4e7f-aa32-6f532578f79e', '', 1, 'site', NULL, 'craft\\fields\\Assets', '{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:526be8f2-d24c-4d05-898e-c2f298e91236\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:526be8f2-d24c-4d05-898e-c2f298e91236\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"}', '2021-10-31 12:29:12', '2021-10-31 15:59:53', 'd43659da-1805-4284-8eca-0ca8437e61fc'),
(12, NULL, 'Tip Content', 'tipContent', 'matrixBlockType:f31ac261-3a8f-4b87-aa28-f9f7e7cdcd35', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2021-10-31 12:29:13', '2021-10-31 15:59:53', '7486f4cb-b894-4539-9853-e7dcbf7fa3f5'),
(13, NULL, 'Body Content', 'bodyContent', 'matrixBlockType:8c06ddf4-d6d8-4962-bf5a-a3df17f4b865', '', 1, 'none', NULL, 'craft\\redactor\\Field', '{\"redactorConfig\":\"\",\"purifierConfig\":\"\",\"cleanupHtml\":true,\"removeInlineStyles\":\"1\",\"removeEmptyTags\":\"1\",\"removeNbsp\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}', '2021-10-31 12:29:14', '2021-10-31 15:59:54', 'dcf20ff3-f400-442d-a03d-581e38068ca8'),
(14, NULL, 'Steps Content', 'stepsContent', 'matrixBlockType:f7fde84d-b7ed-476f-a760-503b0263e82d', '', 1, 'none', NULL, 'craft\\fields\\Table', '{\"addRowLabel\":\"Add a row\",\"maxRows\":\"\",\"minRows\":\"\",\"columns\":{\"col1\":{\"heading\":\"Steps Instructions\",\"handle\":\"stepsInstructions\",\"width\":\"\",\"type\":\"multiline\"}},\"columnType\":\"text\"}', '2021-10-31 12:29:15', '2021-10-31 15:59:54', 'de8c1647-ede2-4eb9-93b5-784e098aab41'),
(15, NULL, 'Steps Title', 'stepsTitle', 'matrixBlockType:f7fde84d-b7ed-476f-a760-503b0263e82d', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2021-10-31 12:29:15', '2021-10-31 15:59:54', 'f1ba5b5a-110f-4849-a70b-8d5cb4d9e36f'),
(16, NULL, 'Ingredients', 'ingredients', 'matrixBlockType:c73c0fee-4c2a-4de1-ac75-b4d6c6d74ce2', '', 1, 'none', NULL, 'craft\\fields\\Table', '{\"addRowLabel\":\"Add a row\",\"maxRows\":\"\",\"minRows\":\"\",\"columns\":{\"col1\":{\"heading\":\"Amount\",\"handle\":\"amount\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Ingredient\",\"handle\":\"ingredient\",\"width\":\"\",\"type\":\"singleline\"}},\"columnType\":\"text\"}', '2021-10-31 12:29:16', '2021-10-31 15:59:54', 'bda6e9dc-e6d0-49bd-84f5-c338659437f2'),
(17, 5, 'Recipe Snapshot', 'recipeSnapshot', 'global', '', 1, 'none', NULL, 'craft\\fields\\Table', '{\"addRowLabel\":\"Add a row\",\"maxRows\":\"\",\"minRows\":\"\",\"columns\":{\"col1\":{\"heading\":\"Snapshot Text\",\"handle\":\"snapshotText\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[{\"col1\":\"\"}],\"columnType\":\"text\"}', '2021-10-31 16:01:14', '2021-10-31 16:01:14', 'd53a8a6f-d589-444a-82cf-b2638164a4a8'),
(18, 6, 'Style Description', 'styleDescription', 'global', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2021-10-31 16:11:07', '2021-10-31 16:11:07', '06bd1d23-c457-49a5-8c15-be0c05f20b1c'),
(19, 6, 'Drink Style', 'drinkStyle', 'global', '', 1, 'site', NULL, 'craft\\fields\\Categories', '{\"allowLimit\":false,\"allowMultipleSources\":false,\"branchLimit\":\"1\",\"sources\":\"*\",\"source\":\"group:a87e584f-142b-48fd-ae9b-6ec0352fd211\",\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":\"Add a drink style\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"}', '2021-10-31 16:16:19', '2021-10-31 16:16:19', 'd026e1d8-9a40-41e2-a7a6-4d3dbd2cd1a3'),
(20, 2, 'Drink Recipe', 'drinkRecipe', 'global', '', 1, 'site', NULL, 'craft\\fields\\Entries', '{\"sources\":[\"section:655f7088-c858-4ec3-860d-716df652f038\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"1\",\"selectionLabel\":\"Add a drink recipe\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"}', '2021-11-01 07:45:54', '2021-11-01 07:45:54', '943e4d86-0830-4297-b580-a8e878551fe0');

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
(1, '3.3.4.1', '3.3.3', 0, '{\"fieldGroups\":{\"29b5eecd-24ce-4d41-b0a9-a2580ec26dad\":{\"name\":\"Common\"},\"46d0b950-d8bb-481e-bcdc-b0f6b62a4155\":{\"name\":\"Drinks\"},\"37b076b7-fc2d-4570-8fca-06f5e67418d9\":{\"name\":\"News\"},\"4471bad0-e360-4c7f-b2d6-b6a67e6b5183\":{\"name\":\"About\"},\"4220c21a-0099-4f08-90eb-c9ebf3befb17\":{\"name\":\"Recipes\"},\"3eaf4b14-aaab-4e2a-ae65-c058f65db41f\":{\"name\":\"Styles\"}},\"siteGroups\":{\"b6df11ba-d2f7-46a4-80a7-1ceec89cab7b\":{\"name\":\"Craftycoffee\"}},\"sites\":{\"706bd896-a738-4b80-a40a-19ef5e2ec936\":{\"baseUrl\":\"$DEFAULT_SITE_URL\",\"handle\":\"default\",\"hasUrls\":true,\"language\":\"en-US\",\"name\":\"Craftycoffee\",\"primary\":true,\"siteGroup\":\"b6df11ba-d2f7-46a4-80a7-1ceec89cab7b\",\"sortOrder\":1}},\"email\":{\"fromEmail\":\"s4jj4n@gmail.com\",\"fromName\":\"Craftycoffee\",\"transportType\":\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"},\"system\":{\"edition\":\"solo\",\"name\":\"Craftycoffee\",\"live\":true,\"schemaVersion\":\"3.3.3\",\"timeZone\":\"Asia/Kathmandu\"},\"users\":{\"requireEmailVerification\":true,\"allowPublicRegistration\":false,\"defaultGroup\":null,\"photoVolumeUid\":null,\"photoSubpath\":\"\"},\"dateModified\":1635752804,\"sections\":{\"d5a4185f-4eb7-4f6b-b6df-2b7fc400ec13\":{\"name\":\"Drinks\",\"handle\":\"drinks\",\"type\":\"channel\",\"enableVersioning\":true,\"propagationMethod\":\"all\",\"siteSettings\":{\"706bd896-a738-4b80-a40a-19ef5e2ec936\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"drinks/{slug}\",\"template\":\"drinks/_entry\"}},\"entryTypes\":{\"5efc3f24-2fcc-4bdc-a22a-fb295d2d2db9\":{\"name\":\"Drinks\",\"handle\":\"drinks\",\"hasTitleField\":true,\"titleLabel\":\"Drink Name\",\"titleFormat\":\"\",\"sortOrder\":1,\"fieldLayouts\":{\"9ed38d65-ff11-4350-b2a1-b884b717a255\":{\"tabs\":[{\"name\":\"Drink Details\",\"sortOrder\":1,\"fields\":{\"4ac53921-705b-401d-9bb9-2739d1cb10c3\":{\"required\":false,\"sortOrder\":4},\"6260aee9-73bc-449e-aff6-3d208acec35e\":{\"required\":false,\"sortOrder\":5},\"943e4d86-0830-4297-b580-a8e878551fe0\":{\"required\":false,\"sortOrder\":6},\"aec1fcb3-9fb8-4ec1-8765-89df0e9cfe21\":{\"required\":false,\"sortOrder\":3},\"d026e1d8-9a40-41e2-a7a6-4d3dbd2cd1a3\":{\"required\":false,\"sortOrder\":1},\"d2ba998d-795f-4f1e-aa0b-6b04564565ec\":{\"required\":false,\"sortOrder\":2}}}]}}}}},\"7761d4f2-acf8-408f-be7c-e8c61624d6c5\":{\"name\":\"News\",\"handle\":\"news\",\"type\":\"channel\",\"enableVersioning\":true,\"propagationMethod\":\"all\",\"siteSettings\":{\"706bd896-a738-4b80-a40a-19ef5e2ec936\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"news/{slug}\",\"template\":\"news/_entry\"}},\"entryTypes\":{\"19b9e6f7-726c-436b-a382-bd9063476ad0\":{\"name\":\"News\",\"handle\":\"news\",\"hasTitleField\":true,\"titleLabel\":\"Headline\",\"titleFormat\":\"\",\"sortOrder\":1,\"fieldLayouts\":{\"43ade41a-8839-4638-82d6-b62be4641a6c\":{\"tabs\":[{\"name\":\"News\",\"sortOrder\":1,\"fields\":{\"3149c307-8b38-4033-b7eb-e951301cdca6\":{\"required\":false,\"sortOrder\":2},\"9703ea0e-6465-4b42-913d-c12428792570\":{\"required\":false,\"sortOrder\":1}}}]}}}}},\"9f91c595-0193-4614-9988-9ce30da5ed90\":{\"name\":\"Homepage\",\"handle\":\"homepage\",\"type\":\"single\",\"enableVersioning\":true,\"propagationMethod\":\"all\",\"siteSettings\":{\"706bd896-a738-4b80-a40a-19ef5e2ec936\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"__home__\",\"template\":\"index\"}},\"entryTypes\":{\"117076d2-865d-4007-970c-5c970d5a6a89\":{\"name\":\"Homepage\",\"handle\":\"homepage\",\"hasTitleField\":true,\"titleLabel\":\"Homepage Title\",\"titleFormat\":\"{section.name|raw}\",\"sortOrder\":1,\"fieldLayouts\":{\"ad2315cc-a0cb-4992-a940-cec7dcc8b546\":{\"tabs\":[{\"name\":\"Common\",\"sortOrder\":1,\"fields\":{\"13099bd4-7175-4fd1-a84c-2c8154635242\":{\"required\":false,\"sortOrder\":1}}}]}}}}},\"dd3ea73f-da34-416e-98ce-e7e02e2a08f2\":{\"name\":\"About Crafty Coffee\",\"handle\":\"aboutCraftyCoffee\",\"type\":\"structure\",\"enableVersioning\":true,\"propagationMethod\":\"all\",\"siteSettings\":{\"706bd896-a738-4b80-a40a-19ef5e2ec936\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"{parent.uri}/{slug}\",\"template\":\"about/_entry\"}},\"structure\":{\"uid\":\"386d439b-e737-446a-8912-ff097e8990c5\",\"maxLevels\":null},\"entryTypes\":{\"2d81f0c0-fc28-42c3-b997-e9c27be40011\":{\"name\":\"About Crafty Coffee\",\"handle\":\"aboutCraftyCoffee\",\"hasTitleField\":true,\"titleLabel\":\"Page Title\",\"titleFormat\":\"\",\"sortOrder\":1,\"fieldLayouts\":{\"854764cf-ee38-48d1-9f1a-a92f15b751e9\":{\"tabs\":[{\"name\":\"About\",\"sortOrder\":1,\"fields\":{\"13099bd4-7175-4fd1-a84c-2c8154635242\":{\"required\":false,\"sortOrder\":1},\"39f06104-4ce9-48ac-bda3-634abffe5fa7\":{\"required\":false,\"sortOrder\":2},\"4ac53921-705b-401d-9bb9-2739d1cb10c3\":{\"required\":true,\"sortOrder\":3}}}]}}}}},\"655f7088-c858-4ec3-860d-716df652f038\":{\"name\":\"Recipes\",\"handle\":\"recipes\",\"type\":\"channel\",\"enableVersioning\":true,\"propagationMethod\":\"all\",\"siteSettings\":{\"706bd896-a738-4b80-a40a-19ef5e2ec936\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"recipes/{slug}\",\"template\":\"recipes/_entry\"}},\"entryTypes\":{\"7abe6584-2c24-4dba-bee5-88399c442fca\":{\"name\":\"Recipes\",\"handle\":\"recipes\",\"hasTitleField\":true,\"titleLabel\":\"Recipe Name\",\"titleFormat\":\"\",\"sortOrder\":1,\"fieldLayouts\":{\"4c6a86c9-f08e-4e8f-9141-45ecef20fd12\":{\"tabs\":[{\"name\":\"Recipes\",\"sortOrder\":1,\"fields\":{\"d026e1d8-9a40-41e2-a7a6-4d3dbd2cd1a3\":{\"required\":false,\"sortOrder\":1},\"d53a8a6f-d589-444a-82cf-b2638164a4a8\":{\"required\":false,\"sortOrder\":2},\"d99d371a-64de-4ff0-bb0e-b1a4ce816e58\":{\"required\":false,\"sortOrder\":3}}}]}}}}}},\"fields\":{\"d2ba998d-795f-4f1e-aa0b-6b04564565ec\":{\"name\":\"Introduction\",\"handle\":\"introduction\",\"instructions\":\"Short sentence at top of drink page.\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"46d0b950-d8bb-481e-bcdc-b0f6b62a4155\"},\"4ac53921-705b-401d-9bb9-2739d1cb10c3\":{\"name\":\"Page Copy\",\"handle\":\"pageCopy\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\redactor\\\\Field\",\"settings\":{\"redactorConfig\":\"Standard.json\",\"purifierConfig\":\"\",\"cleanupHtml\":true,\"removeInlineStyles\":\"1\",\"removeEmptyTags\":\"1\",\"removeNbsp\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"46d0b950-d8bb-481e-bcdc-b0f6b62a4155\"},\"9703ea0e-6465-4b42-913d-c12428792570\":{\"name\":\"Excerpt\",\"handle\":\"excerpt\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"29b5eecd-24ce-4d41-b0a9-a2580ec26dad\"},\"3149c307-8b38-4033-b7eb-e951301cdca6\":{\"name\":\"News Body\",\"handle\":\"newsBody\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\redactor\\\\Field\",\"settings\":{\"redactorConfig\":\"\",\"purifierConfig\":\"\",\"cleanupHtml\":true,\"removeInlineStyles\":\"1\",\"removeEmptyTags\":\"1\",\"removeNbsp\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"37b076b7-fc2d-4570-8fca-06f5e67418d9\"},\"6260aee9-73bc-449e-aff6-3d208acec35e\":{\"name\":\"Drink Image\",\"handle\":\"drinkImage\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Assets\",\"settings\":{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:526be8f2-d24c-4d05-898e-c2f298e91236\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:526be8f2-d24c-4d05-898e-c2f298e91236\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":[\"volume:526be8f2-d24c-4d05-898e-c2f298e91236\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":\"large\",\"limit\":\"1\",\"selectionLabel\":\"Add a drink image\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"},\"contentColumnType\":\"string\",\"fieldGroup\":\"46d0b950-d8bb-481e-bcdc-b0f6b62a4155\"},\"13099bd4-7175-4fd1-a84c-2c8154635242\":{\"name\":\"Subtitle\",\"handle\":\"subtitle\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"4471bad0-e360-4c7f-b2d6-b6a67e6b5183\"},\"39f06104-4ce9-48ac-bda3-634abffe5fa7\":{\"name\":\"Page Intro\",\"handle\":\"pageIntro\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"4471bad0-e360-4c7f-b2d6-b6a67e6b5183\"},\"aec1fcb3-9fb8-4ec1-8765-89df0e9cfe21\":{\"name\":\"Date added to menu\",\"handle\":\"dateAddedToMenu\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Date\",\"settings\":{\"showDate\":true,\"showTime\":false,\"minuteIncrement\":\"30\"},\"contentColumnType\":\"datetime\",\"fieldGroup\":\"46d0b950-d8bb-481e-bcdc-b0f6b62a4155\"},\"d99d371a-64de-4ff0-bb0e-b1a4ce816e58\":{\"name\":\"Recipe Contents\",\"handle\":\"recipeContents\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Matrix\",\"settings\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_recipecontents}}\",\"propagationMethod\":\"all\"},\"contentColumnType\":\"string\",\"fieldGroup\":\"4220c21a-0099-4f08-90eb-c9ebf3befb17\"},\"d53a8a6f-d589-444a-82cf-b2638164a4a8\":{\"name\":\"Recipe Snapshot\",\"handle\":\"recipeSnapshot\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Table\",\"settings\":{\"addRowLabel\":\"Add a row\",\"maxRows\":\"\",\"minRows\":\"\",\"columns\":{\"col1\":{\"heading\":\"Snapshot Text\",\"handle\":\"snapshotText\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[{\"col1\":\"\"}],\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"4220c21a-0099-4f08-90eb-c9ebf3befb17\"},\"06bd1d23-c457-49a5-8c15-be0c05f20b1c\":{\"name\":\"Style Description\",\"handle\":\"styleDescription\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"3eaf4b14-aaab-4e2a-ae65-c058f65db41f\"},\"d026e1d8-9a40-41e2-a7a6-4d3dbd2cd1a3\":{\"name\":\"Drink Style\",\"handle\":\"drinkStyle\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Categories\",\"settings\":{\"allowLimit\":false,\"allowMultipleSources\":false,\"branchLimit\":\"1\",\"sources\":\"*\",\"source\":\"group:a87e584f-142b-48fd-ae9b-6ec0352fd211\",\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":\"Add a drink style\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"},\"contentColumnType\":\"string\",\"fieldGroup\":\"3eaf4b14-aaab-4e2a-ae65-c058f65db41f\"},\"943e4d86-0830-4297-b580-a8e878551fe0\":{\"name\":\"Drink Recipe\",\"handle\":\"drinkRecipe\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Entries\",\"settings\":{\"sources\":[\"section:655f7088-c858-4ec3-860d-716df652f038\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"1\",\"selectionLabel\":\"Add a drink recipe\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"},\"contentColumnType\":\"string\",\"fieldGroup\":\"46d0b950-d8bb-481e-bcdc-b0f6b62a4155\"}},\"plugins\":{\"redactor\":{\"edition\":\"standard\",\"enabled\":true,\"schemaVersion\":\"2.3.0\"}},\"volumes\":{\"526be8f2-d24c-4d05-898e-c2f298e91236\":{\"name\":\"Drinks\",\"handle\":\"drinks\",\"type\":\"craft\\\\volumes\\\\Local\",\"hasUrls\":true,\"url\":\"@web/images/uploads/drinks\",\"settings\":{\"path\":\"@webroot/images/uploads/drinks\"},\"sortOrder\":1}},\"imageTransforms\":{\"15ca9281-396b-460e-9aa5-a8f1bd2cc99d\":{\"format\":null,\"handle\":\"EightFortyTwoHundredThumb\",\"height\":200,\"interlace\":\"none\",\"mode\":\"crop\",\"name\":\"840x200 Thumb\",\"position\":\"center-center\",\"quality\":null,\"width\":840}},\"matrixBlockTypes\":{\"d8e26cdc-33ef-4e7f-aa32-6f532578f79e\":{\"field\":\"d99d371a-64de-4ff0-bb0e-b1a4ce816e58\",\"name\":\"Recipe Image\",\"handle\":\"recipeImage\",\"sortOrder\":1,\"fields\":{\"b5e75135-d67c-4a05-9b74-a73c54a4057b\":{\"name\":\"Image Caption\",\"handle\":\"imageCaption\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":null},\"d43659da-1805-4284-8eca-0ca8437e61fc\":{\"name\":\"Image\",\"handle\":\"image\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Assets\",\"settings\":{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:526be8f2-d24c-4d05-898e-c2f298e91236\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:526be8f2-d24c-4d05-898e-c2f298e91236\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"},\"contentColumnType\":\"string\",\"fieldGroup\":null}},\"fieldLayouts\":{\"ca30a4c1-269d-40aa-98d9-c3ac0205ad6a\":{\"tabs\":[{\"name\":\"Content\",\"sortOrder\":1,\"fields\":{\"b5e75135-d67c-4a05-9b74-a73c54a4057b\":{\"required\":false,\"sortOrder\":2},\"d43659da-1805-4284-8eca-0ca8437e61fc\":{\"required\":false,\"sortOrder\":1}}}]}}},\"f31ac261-3a8f-4b87-aa28-f9f7e7cdcd35\":{\"field\":\"d99d371a-64de-4ff0-bb0e-b1a4ce816e58\",\"name\":\"Recipe Tip\",\"handle\":\"recipeTip\",\"sortOrder\":2,\"fields\":{\"7486f4cb-b894-4539-9853-e7dcbf7fa3f5\":{\"name\":\"Tip Content\",\"handle\":\"tipContent\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":null}},\"fieldLayouts\":{\"b0cffbb3-c789-47e9-b064-3eaa80bb3dc1\":{\"tabs\":[{\"name\":\"Content\",\"sortOrder\":1,\"fields\":{\"7486f4cb-b894-4539-9853-e7dcbf7fa3f5\":{\"required\":false,\"sortOrder\":1}}}]}}},\"8c06ddf4-d6d8-4962-bf5a-a3df17f4b865\":{\"field\":\"d99d371a-64de-4ff0-bb0e-b1a4ce816e58\",\"name\":\"Recipe Copy\",\"handle\":\"recipeCopy\",\"sortOrder\":3,\"fields\":{\"dcf20ff3-f400-442d-a03d-581e38068ca8\":{\"name\":\"Body Content\",\"handle\":\"bodyContent\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\redactor\\\\Field\",\"settings\":{\"redactorConfig\":\"\",\"purifierConfig\":\"\",\"cleanupHtml\":true,\"removeInlineStyles\":\"1\",\"removeEmptyTags\":\"1\",\"removeNbsp\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"},\"contentColumnType\":\"text\",\"fieldGroup\":null}},\"fieldLayouts\":{\"513bbd38-3223-4f22-8316-f8a94145f29d\":{\"tabs\":[{\"name\":\"Content\",\"sortOrder\":1,\"fields\":{\"dcf20ff3-f400-442d-a03d-581e38068ca8\":{\"required\":false,\"sortOrder\":1}}}]}}},\"f7fde84d-b7ed-476f-a760-503b0263e82d\":{\"field\":\"d99d371a-64de-4ff0-bb0e-b1a4ce816e58\",\"name\":\"Recipe Steps\",\"handle\":\"recipeSteps\",\"sortOrder\":4,\"fields\":{\"de8c1647-ede2-4eb9-93b5-784e098aab41\":{\"name\":\"Steps Content\",\"handle\":\"stepsContent\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Table\",\"settings\":{\"addRowLabel\":\"Add a row\",\"maxRows\":\"\",\"minRows\":\"\",\"columns\":{\"col1\":{\"heading\":\"Steps Instructions\",\"handle\":\"stepsInstructions\",\"width\":\"\",\"type\":\"multiline\"}},\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":null},\"f1ba5b5a-110f-4849-a70b-8d5cb4d9e36f\":{\"name\":\"Steps Title\",\"handle\":\"stepsTitle\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":null}},\"fieldLayouts\":{\"4ca12c0e-17b5-4e3f-aca3-def6b6a4ae7e\":{\"tabs\":[{\"name\":\"Content\",\"sortOrder\":1,\"fields\":{\"de8c1647-ede2-4eb9-93b5-784e098aab41\":{\"required\":false,\"sortOrder\":2},\"f1ba5b5a-110f-4849-a70b-8d5cb4d9e36f\":{\"required\":false,\"sortOrder\":1}}}]}}},\"c73c0fee-4c2a-4de1-ac75-b4d6c6d74ce2\":{\"field\":\"d99d371a-64de-4ff0-bb0e-b1a4ce816e58\",\"name\":\"Recipe Ingredients\",\"handle\":\"recipeIngredients\",\"sortOrder\":5,\"fields\":{\"bda6e9dc-e6d0-49bd-84f5-c338659437f2\":{\"name\":\"Ingredients\",\"handle\":\"ingredients\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Table\",\"settings\":{\"addRowLabel\":\"Add a row\",\"maxRows\":\"\",\"minRows\":\"\",\"columns\":{\"col1\":{\"heading\":\"Amount\",\"handle\":\"amount\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Ingredient\",\"handle\":\"ingredient\",\"width\":\"\",\"type\":\"singleline\"}},\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":null}},\"fieldLayouts\":{\"913d402a-7a6a-475e-a4e2-85f9d85bf00a\":{\"tabs\":[{\"name\":\"Content\",\"sortOrder\":1,\"fields\":{\"bda6e9dc-e6d0-49bd-84f5-c338659437f2\":{\"required\":false,\"sortOrder\":1}}}]}}}},\"categoryGroups\":{\"a87e584f-142b-48fd-ae9b-6ec0352fd211\":{\"name\":\"Drink Styles\",\"handle\":\"drinkStyles\",\"structure\":{\"uid\":\"291e4465-e98d-4695-a80d-d1c6f315bf53\",\"maxLevels\":5},\"siteSettings\":{\"706bd896-a738-4b80-a40a-19ef5e2ec936\":{\"hasUrls\":true,\"uriFormat\":\"styles/{slug}\",\"template\":\"styles/_entry\"}},\"fieldLayouts\":{\"5ef73e46-5c67-4de8-bd55-abdce29b166d\":{\"tabs\":[{\"name\":\"Styles\",\"sortOrder\":1,\"fields\":{\"06bd1d23-c457-49a5-8c15-be0c05f20b1c\":{\"required\":false,\"sortOrder\":1}}}]}}}}}', '[]', 'OVDQB5xSdyqd', '2021-10-08 15:12:56', '2021-10-08 15:12:56', 'a09b740b-04c1-46a3-906f-acd152cd918f');

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
(435, 434, 9, 3, 1, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '8d2c0599-0021-46c2-b31b-7e4eb03f6c7b'),
(436, 434, 9, 1, 2, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '0f34ba62-bd26-4460-9d88-07f0111104e9'),
(437, 434, 9, 2, 3, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'dc8915f2-adb9-42d7-82e8-ad17c0dc354b'),
(438, 434, 9, 3, 4, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'fd861b3d-880d-4434-85b7-7b98f7cf4c6d'),
(439, 434, 9, 5, 5, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'f61dd2db-0e0c-4dae-975d-139bb5d65186'),
(440, 434, 9, 4, 6, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'be9e9116-44d6-42dd-883a-2d3bec437596'),
(441, 434, 9, 4, 7, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '8001d7d2-fe33-4d9a-b30b-d94b31d69a8e'),
(442, 434, 9, 2, 8, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'b4bd2105-ea65-45a2-b0b3-82df9a604261'),
(443, 434, 9, 1, 9, 0, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'a87fa640-e2dd-4674-aeed-df3df77d4e5f'),
(445, 444, 9, 3, 1, NULL, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'c392c2cb-0c7e-4b78-b543-c944f77a7086'),
(446, 444, 9, 1, 2, NULL, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '51355994-f911-42d7-865e-aa433e1b9604'),
(447, 444, 9, 2, 3, NULL, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '97787ef4-de14-4415-b74a-6d2f4849dac9'),
(448, 444, 9, 3, 4, NULL, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'a6435fb5-eb08-4883-a9f5-a4e10595d32a'),
(449, 444, 9, 5, 5, NULL, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '0b1b9c83-3fa6-4c73-b2dd-828664df5f1e'),
(450, 444, 9, 4, 6, NULL, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '1374e535-f67c-4a58-b097-8a67e3731cd4'),
(451, 444, 9, 4, 7, NULL, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '6308bd79-31b6-47a4-9cb8-f8d64841d44b'),
(452, 444, 9, 2, 8, NULL, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '985a2813-bd5d-4b60-ad3b-eb34bc70b47d'),
(453, 444, 9, 1, 9, NULL, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'c46387e2-81ff-481d-b83f-913f4af17829'),
(464, 434, 9, 3, 1, NULL, '2021-10-31 14:01:39', '2021-10-31 14:01:39', 'f624b6d8-ecd7-4939-921f-7780795b9d68'),
(465, 434, 9, 1, 2, NULL, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'e3f5e947-f258-42fa-b681-60bd2212ef64'),
(466, 434, 9, 2, 3, NULL, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '86285eba-a599-400d-a3d1-489ee116b65a'),
(467, 434, 9, 3, 4, NULL, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'f4553cea-77e5-4ed6-99e6-ef3c6bcb60d0'),
(468, 434, 9, 5, 5, NULL, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '14f9677a-2975-40b7-afd8-6d3283ae8196'),
(469, 434, 9, 4, 6, NULL, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '0551fe3f-e3c6-4c73-8fd8-b2aa91694cb3'),
(470, 434, 9, 4, 7, NULL, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '50efe26d-b910-44d3-974d-157314249fc4'),
(471, 434, 9, 2, 8, NULL, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '173f6e67-e653-43cc-b060-8ad51af8c2b5'),
(472, 434, 9, 1, 9, NULL, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '7e2166a5-155f-4a0d-b7fe-61cd67722f22'),
(474, 473, 9, 3, 1, NULL, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '89b6949e-3db8-43f6-ad83-81563177b997'),
(475, 473, 9, 1, 2, NULL, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '375d5fd5-fad0-4145-9224-3cdf1e111f9b'),
(476, 473, 9, 2, 3, NULL, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'e44e7fd2-ba83-4377-8982-89bc7039e0eb'),
(477, 473, 9, 3, 4, NULL, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'c901f820-f9cf-4125-a5e4-4886e8a37f03'),
(478, 473, 9, 5, 5, NULL, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'e9307d0c-0efa-407a-987d-04182a86b295'),
(479, 473, 9, 4, 6, NULL, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '4bf17142-1633-4e1b-8083-7420362b4d99'),
(480, 473, 9, 4, 7, NULL, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '01cd3a86-be19-4c93-8492-eced61f2bd82'),
(481, 473, 9, 2, 8, NULL, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'ffb38c25-4815-407f-a133-bbee4cfdb6e4'),
(482, 473, 9, 1, 9, NULL, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '8d94f444-e63a-49dd-91aa-da256aeac973'),
(484, 483, 9, 3, 1, NULL, '2021-10-31 16:02:15', '2021-10-31 16:02:15', 'e882dbd2-4ea1-4ea4-9ad3-2a928d9d7758'),
(485, 483, 9, 1, 2, NULL, '2021-10-31 16:02:15', '2021-10-31 16:02:15', 'a15313dd-536e-42b0-aab5-ab56d7190f87'),
(486, 483, 9, 2, 3, NULL, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '9422f084-ccd3-4ffd-a293-51e9b53f46e6'),
(487, 483, 9, 3, 4, NULL, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '1073c3df-5fd8-4d27-8316-07bbeb50508f'),
(488, 483, 9, 5, 5, NULL, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '1785c4c9-c4b9-44b7-be81-c1bbc2377677'),
(489, 483, 9, 4, 6, NULL, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '548d36f0-f9fb-4cba-9dac-57ba848328a5'),
(490, 483, 9, 4, 7, NULL, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '64291b50-92cd-40a8-8578-d935cf4560ff'),
(491, 483, 9, 2, 8, NULL, '2021-10-31 16:02:15', '2021-10-31 16:02:15', 'f52687cf-608c-4aa2-8ffd-907ff5d2fd20'),
(492, 483, 9, 1, 9, NULL, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '75cc4e57-412b-4d1a-8ea8-ebabb39d4ef4'),
(494, 493, 9, 3, 1, NULL, '2021-10-31 16:03:14', '2021-10-31 16:03:14', 'af7bfa31-57e7-40d4-b162-2a4bd917325e'),
(495, 493, 9, 1, 2, NULL, '2021-10-31 16:03:14', '2021-10-31 16:03:14', '4e5dc1c5-2ae6-4894-9841-51b8ec52a95e'),
(496, 493, 9, 2, 3, NULL, '2021-10-31 16:03:14', '2021-10-31 16:03:14', 'a624ec36-5b7c-4496-9774-89e23dbd80a7'),
(497, 493, 9, 3, 4, NULL, '2021-10-31 16:03:14', '2021-10-31 16:03:14', '842fa019-ce0b-4c14-b5b9-ea6314f44c02'),
(498, 493, 9, 5, 5, NULL, '2021-10-31 16:03:14', '2021-10-31 16:03:14', '60d1bd05-de02-41a5-88aa-d9729956d685'),
(499, 493, 9, 4, 6, NULL, '2021-10-31 16:03:14', '2021-10-31 16:03:14', '93d7a270-499c-4154-8c2b-c450c63d371e'),
(500, 493, 9, 4, 7, NULL, '2021-10-31 16:03:14', '2021-10-31 16:03:14', 'd9b971a3-36ff-4f1f-921d-130b5949145d'),
(501, 493, 9, 2, 8, NULL, '2021-10-31 16:03:14', '2021-10-31 16:03:14', 'becf09d6-9bef-4a93-949f-92b4e2076743'),
(502, 493, 9, 1, 9, NULL, '2021-10-31 16:03:14', '2021-10-31 16:03:14', '26ad8ed8-a3f4-45da-8cfe-d6dba9f0b162'),
(505, 504, 9, 3, 1, NULL, '2021-10-31 16:17:15', '2021-10-31 16:17:15', '0e915146-16e9-4d0a-8ef9-38cd37498f38'),
(506, 504, 9, 1, 2, NULL, '2021-10-31 16:17:15', '2021-10-31 16:17:15', '4d9c8117-003b-40a2-b22e-0e904b7b275f'),
(507, 504, 9, 2, 3, NULL, '2021-10-31 16:17:15', '2021-10-31 16:17:15', '3967af7b-4d18-4da6-a1d3-10cb87c65d99'),
(508, 504, 9, 3, 4, NULL, '2021-10-31 16:17:15', '2021-10-31 16:17:15', '6b27fb89-dd04-45c5-8371-b8c43bc466c8'),
(509, 504, 9, 5, 5, NULL, '2021-10-31 16:17:15', '2021-10-31 16:17:15', '8da6d8e0-7928-4141-af8d-bcdef5d5038a'),
(510, 504, 9, 4, 6, NULL, '2021-10-31 16:17:15', '2021-10-31 16:17:15', 'b8664076-97cb-47d1-b4ad-88e2989269f6'),
(511, 504, 9, 4, 7, NULL, '2021-10-31 16:17:15', '2021-10-31 16:17:15', '4d4e8ffa-da60-499a-b8d8-1e659f624049'),
(512, 504, 9, 2, 8, NULL, '2021-10-31 16:17:15', '2021-10-31 16:17:15', 'fe6bcd6d-b80d-4aab-9802-55c8027fa269'),
(513, 504, 9, 1, 9, NULL, '2021-10-31 16:17:15', '2021-10-31 16:17:15', 'c2bf0d35-89e9-470f-994b-cb1a15cdbdd8'),
(516, 515, 9, 3, 1, NULL, '2021-10-31 16:23:21', '2021-10-31 16:23:21', '25f4cb7b-a8be-4406-ae59-67ce6c2b0ee4'),
(517, 515, 9, 1, 2, NULL, '2021-10-31 16:23:21', '2021-10-31 16:23:21', 'b1a4439c-f3a5-4762-88af-9a2359c117bd'),
(518, 515, 9, 2, 3, NULL, '2021-10-31 16:23:21', '2021-10-31 16:23:21', 'be8b925a-20ba-4f17-98ca-2f88e0ecdb30'),
(519, 515, 9, 3, 4, NULL, '2021-10-31 16:23:21', '2021-10-31 16:23:21', 'daeeae4c-fb55-4db4-87a9-b874630b0994'),
(520, 515, 9, 5, 5, NULL, '2021-10-31 16:23:21', '2021-10-31 16:23:21', '22532f26-8a68-4987-bf9d-efbbbb1ac14f'),
(521, 515, 9, 4, 6, NULL, '2021-10-31 16:23:21', '2021-10-31 16:23:21', 'c5dc7c1b-7722-42b6-9b73-06d8a44c2b2f'),
(522, 515, 9, 4, 7, NULL, '2021-10-31 16:23:21', '2021-10-31 16:23:21', '7437417b-a576-4c60-9337-2a16da6569c5'),
(523, 515, 9, 2, 8, NULL, '2021-10-31 16:23:21', '2021-10-31 16:23:21', '72c60139-5eed-4190-add3-12b19a5c5071'),
(524, 515, 9, 1, 9, NULL, '2021-10-31 16:23:21', '2021-10-31 16:23:21', '22aa69a4-1497-465c-89db-ec7c594db3da'),
(529, 528, 9, 3, 1, NULL, '2021-11-01 07:49:07', '2021-11-01 07:49:07', '3878333a-91e5-46fa-a148-8fd1893077fb'),
(531, 530, 9, 3, 1, NULL, '2021-11-01 07:49:08', '2021-11-01 07:49:08', '8d8fa9d8-bced-4903-a7ef-520c02781748');

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
(1, 9, 5, 'Recipe Image', 'recipeImage', 1, '2021-10-31 12:29:12', '2021-10-31 12:29:12', 'd8e26cdc-33ef-4e7f-aa32-6f532578f79e'),
(2, 9, 6, 'Recipe Tip', 'recipeTip', 2, '2021-10-31 12:29:13', '2021-10-31 12:29:13', 'f31ac261-3a8f-4b87-aa28-f9f7e7cdcd35'),
(3, 9, 7, 'Recipe Copy', 'recipeCopy', 3, '2021-10-31 12:29:14', '2021-10-31 12:29:14', '8c06ddf4-d6d8-4962-bf5a-a3df17f4b865'),
(4, 9, 8, 'Recipe Steps', 'recipeSteps', 4, '2021-10-31 12:29:16', '2021-10-31 12:29:16', 'f7fde84d-b7ed-476f-a760-503b0263e82d'),
(5, 9, 9, 'Recipe Ingredients', 'recipeIngredients', 5, '2021-10-31 12:29:17', '2021-10-31 12:29:17', 'c73c0fee-4c2a-4de1-ac75-b4d6c6d74ce2');

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
  `field_recipeSteps_stepsContent` text,
  `field_recipeSteps_stepsTitle` text,
  `field_recipeIngredients_ingredients` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixcontent_recipecontents`
--

INSERT INTO `matrixcontent_recipecontents` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_recipeImage_imageCaption`, `field_recipeTip_tipContent`, `field_recipeCopy_bodyContent`, `field_recipeSteps_stepsContent`, `field_recipeSteps_stepsTitle`, `field_recipeIngredients_ingredients`) VALUES
(1, 59, 1, '2021-10-31 12:30:21', '2021-10-31 12:30:21', '28aa09e0-9994-4f95-85e7-7fa5c62ed387', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 60, 1, '2021-10-31 12:30:31', '2021-10-31 12:30:31', 'd1e05f33-f0df-4283-8351-22c7071ec05f', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 61, 1, '2021-10-31 12:30:54', '2021-10-31 12:30:54', '401c5dbe-c3d8-4e12-80bc-14cb0f9af014', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 62, 1, '2021-10-31 12:31:03', '2021-10-31 12:31:03', 'c86ab5fd-c713-48af-864b-7b284d0d612e', NULL, NULL, '<p>This is the </p>', NULL, NULL, NULL),
(5, 63, 1, '2021-10-31 12:31:08', '2021-10-31 12:31:08', '0ff8b39b-e0fe-4ad5-aec0-4926a6936d9e', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(6, 64, 1, '2021-10-31 12:31:13', '2021-10-31 12:31:13', '887a57fd-ad0c-475b-b971-a62f6bb422a3', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(7, 65, 1, '2021-10-31 12:31:13', '2021-10-31 12:31:13', '46f5f427-3bd5-44c2-9c16-2e9c9dee651c', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 66, 1, '2021-10-31 12:31:17', '2021-10-31 12:31:17', '59d99c21-da4b-43f3-bac6-d084118fa047', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(9, 67, 1, '2021-10-31 12:31:17', '2021-10-31 12:31:17', 'd6b925c5-ce9a-4169-ac90-fa669c2f7cf0', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 68, 1, '2021-10-31 12:31:21', '2021-10-31 12:31:21', '692f0676-8dfd-4d7b-a276-5d583216def9', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(11, 69, 1, '2021-10-31 12:31:21', '2021-10-31 12:31:21', '5ae20678-fbbf-4f74-be7a-0cc09fee0c6c', 'T', NULL, NULL, NULL, NULL, NULL),
(12, 70, 1, '2021-10-31 12:31:25', '2021-10-31 12:31:25', '82370ec9-78eb-4cd2-b32a-ed10f050dbf7', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(13, 71, 1, '2021-10-31 12:31:25', '2021-10-31 12:31:25', '7aab2eeb-01b1-4fa0-ac85-bcf05b5151aa', 'The perfect espresso', NULL, NULL, NULL, NULL, NULL),
(14, 72, 1, '2021-10-31 12:31:34', '2021-10-31 12:31:34', 'ec67e832-8b55-45a6-8ef0-b0177f25deb8', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(15, 73, 1, '2021-10-31 12:31:34', '2021-10-31 12:31:34', '6002e5d7-cb20-42b7-b90b-045b9be2897e', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(16, 74, 1, '2021-10-31 12:31:36', '2021-10-31 12:31:36', 'f9c8bdee-f0d2-4cf5-af1d-e910aae38c9d', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(17, 75, 1, '2021-10-31 12:31:36', '2021-10-31 12:31:36', '866a083b-b1e3-44e4-825f-6662ceeea324', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(18, 76, 1, '2021-10-31 12:31:36', '2021-10-31 12:31:36', '0824bdbd-8dee-4306-b68b-da57fc0228ba', NULL, NULL, NULL, NULL, NULL, NULL),
(19, 77, 1, '2021-10-31 12:31:46', '2021-10-31 12:31:46', '9ff57789-2ae0-4e77-b575-b150ab644bb4', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(20, 78, 1, '2021-10-31 12:31:46', '2021-10-31 12:31:46', 'b72a0691-a335-43c2-96c2-1ef39b04ba6a', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(21, 79, 1, '2021-10-31 12:31:46', '2021-10-31 12:31:46', '2bb5f0ea-29e6-4197-bd6a-0c284b1fefde', NULL, 'Be careful with the water temperature', NULL, NULL, NULL, NULL),
(22, 80, 1, '2021-10-31 12:31:58', '2021-10-31 12:31:58', '3d0243c8-0725-4ae1-9dda-291c67ed815c', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(23, 81, 1, '2021-10-31 12:31:58', '2021-10-31 12:31:58', 'b372a4d4-0cec-44ec-9895-5d67c9fba97e', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(24, 82, 1, '2021-10-31 12:31:58', '2021-10-31 12:31:58', 'dc25d975-5ddc-4d0c-906a-52e0dc485f30', NULL, 'Be careful with the water temperature! It\'s important that', NULL, NULL, NULL, NULL),
(25, 83, 1, '2021-10-31 12:31:59', '2021-10-31 12:31:59', 'bcb0fa66-0902-4c33-82b6-95aa1433cf20', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(26, 84, 1, '2021-10-31 12:31:59', '2021-10-31 12:31:59', '5dad8ff0-cfb9-439d-8b81-5264648cf2ba', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(27, 85, 1, '2021-10-31 12:31:59', '2021-10-31 12:31:59', '185a59e7-e363-42a0-9654-43e8ff29ff43', NULL, 'Be careful with the water temperature! It\'s important that the', NULL, NULL, NULL, NULL),
(28, 86, 1, '2021-10-31 12:32:06', '2021-10-31 12:32:06', '607460dc-8231-4e64-b2c8-8328ca682775', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(29, 87, 1, '2021-10-31 12:32:07', '2021-10-31 12:32:07', '1379cefc-4b52-4277-ae3b-5c082b93d69d', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(30, 88, 1, '2021-10-31 12:32:07', '2021-10-31 12:32:07', 'af56450e-35bb-4bc5-942e-e2056b4a5636', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not to', NULL, NULL, NULL, NULL),
(31, 89, 1, '2021-10-31 12:32:09', '2021-10-31 12:32:09', '899efa6d-1b18-43be-a0d2-a12d15df0594', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(32, 90, 1, '2021-10-31 12:32:09', '2021-10-31 12:32:09', 'f1c4aadc-f3e2-4c9d-999c-f77609c82fef', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(33, 91, 1, '2021-10-31 12:32:09', '2021-10-31 12:32:09', 'fc73b56a-1c17-4099-9a6f-87debfe58f6b', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(34, 92, 1, '2021-10-31 12:32:11', '2021-10-31 12:32:11', '3f73e98f-de1e-4ee1-ae95-a4e741e8263c', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(35, 93, 1, '2021-10-31 12:32:12', '2021-10-31 12:32:12', '68507d05-fe8d-4d62-b893-9e4b63bc37a1', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(36, 94, 1, '2021-10-31 12:32:12', '2021-10-31 12:32:12', 'cbae4e00-2030-4b58-8bb3-29027a591b0e', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(37, 95, 1, '2021-10-31 12:32:12', '2021-10-31 12:32:12', '375d6ba3-752a-4601-bb20-d854e5b77566', NULL, NULL, NULL, NULL, NULL, NULL),
(38, 96, 1, '2021-10-31 12:32:40', '2021-10-31 12:32:40', '111f8795-609f-4a73-a1c0-1efbec4c2811', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(39, 97, 1, '2021-10-31 12:32:40', '2021-10-31 12:32:40', '6e671848-78f5-4d56-a205-0a42ca70ac0a', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(40, 98, 1, '2021-10-31 12:32:40', '2021-10-31 12:32:40', 'ae2b1abc-26ae-4325-98f1-ca4d79d16b0f', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(41, 99, 1, '2021-10-31 12:32:40', '2021-10-31 12:32:40', '777303f0-59df-408e-b659-13c6aa1be99e', NULL, NULL, '<h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(42, 100, 1, '2021-10-31 12:32:44', '2021-10-31 12:32:44', '8968cf37-cc57-4827-a01d-c31f88b262ad', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(43, 101, 1, '2021-10-31 12:32:44', '2021-10-31 12:32:44', '5bea9742-0ea3-42d9-879e-3cad29158867', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(44, 102, 1, '2021-10-31 12:32:44', '2021-10-31 12:32:44', '73217084-3c46-435e-b91a-cc742747be63', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(45, 103, 1, '2021-10-31 12:32:44', '2021-10-31 12:32:44', '059a5230-0166-4413-9ecb-59d435af8b07', NULL, NULL, '<h2>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></h2><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(46, 104, 1, '2021-10-31 12:32:49', '2021-10-31 12:32:49', 'afb289d1-6ee1-4783-8809-86733752a814', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(47, 105, 1, '2021-10-31 12:32:49', '2021-10-31 12:32:49', '9031a714-5b84-48c9-b551-1c70ac4102a5', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(48, 106, 1, '2021-10-31 12:32:49', '2021-10-31 12:32:49', '4c6f0900-f728-4579-bbdf-7e715ecae84c', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(49, 107, 1, '2021-10-31 12:32:49', '2021-10-31 12:32:49', '19a74a2e-af8d-48eb-9c6f-e70f753214a3', NULL, NULL, '<h2><strong>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</strong><br /></h2><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(50, 108, 1, '2021-10-31 12:32:51', '2021-10-31 12:32:51', 'fcdf854e-6287-4e82-b06b-a417ec852509', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(51, 109, 1, '2021-10-31 12:32:51', '2021-10-31 12:32:51', '10c3dbe1-0e41-4389-bfa1-3cafdbde9682', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(52, 110, 1, '2021-10-31 12:32:51', '2021-10-31 12:32:51', '9f498d7f-f57c-44e1-9e88-c0d6817265a8', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(53, 111, 1, '2021-10-31 12:32:51', '2021-10-31 12:32:51', '70c8931c-ca6b-4e79-9ddb-8fc6d39555bb', NULL, NULL, '<h2><strong>Where does it come from?Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</strong><br /></h2><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(54, 112, 1, '2021-10-31 12:32:52', '2021-10-31 12:32:52', 'fb4df2da-7070-42ad-b773-121982ea735e', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(55, 113, 1, '2021-10-31 12:32:52', '2021-10-31 12:32:52', 'c2ba5244-d386-4d38-b653-ea52a428101c', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(56, 114, 1, '2021-10-31 12:32:52', '2021-10-31 12:32:52', 'f4d5bbcc-040b-408c-b78b-47a0c1f9ad14', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(57, 115, 1, '2021-10-31 12:32:52', '2021-10-31 12:32:52', '2f50a9a9-50d1-4963-814c-138f4829d35f', NULL, NULL, '<h2><strong>Where does it come from?Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.Where does it come from?Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</strong><br /></h2><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(58, 116, 1, '2021-10-31 12:32:54', '2021-10-31 12:32:54', '9be83612-652a-4eac-af62-36c7c3b218f3', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(59, 117, 1, '2021-10-31 12:32:54', '2021-10-31 12:32:54', 'e814db9c-f88c-49db-8167-105a88e3da41', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(60, 118, 1, '2021-10-31 12:32:54', '2021-10-31 12:32:54', '5d358a74-005b-4451-a041-41c8f35a86a8', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(61, 119, 1, '2021-10-31 12:32:54', '2021-10-31 12:32:54', '6f8cf29c-b32a-4050-9b69-c9a1bc4b72c3', NULL, NULL, '<h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(62, 120, 1, '2021-10-31 12:32:57', '2021-10-31 12:32:57', '965de575-2e97-4c2f-ba32-634a984a17ad', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(63, 121, 1, '2021-10-31 12:32:57', '2021-10-31 12:32:57', 'a340cf8f-3f51-480b-86a4-7844b96bb64a', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(64, 122, 1, '2021-10-31 12:32:57', '2021-10-31 12:32:57', '66942ccb-1d5e-4cd7-ac81-e76b3148f0ca', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(65, 123, 1, '2021-10-31 12:32:57', '2021-10-31 12:32:57', '25f6e9ae-2bd2-4407-81b5-ee93ea7137b8', NULL, NULL, '<h2>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></h2><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(66, 124, 1, '2021-10-31 12:33:15', '2021-10-31 12:33:15', 'd9cdc4e8-de87-4eb9-9061-1978515de422', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(67, 125, 1, '2021-10-31 12:33:15', '2021-10-31 12:33:15', '64e98c69-c554-4a7c-984b-28a2d1dabd46', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(68, 126, 1, '2021-10-31 12:33:15', '2021-10-31 12:33:15', '874bdb51-6734-4957-ae69-3b0b45104648', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(69, 127, 1, '2021-10-31 12:33:15', '2021-10-31 12:33:15', '1eb2ee64-2f1d-433b-8af4-2c0264097fac', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(70, 128, 1, '2021-10-31 12:33:27', '2021-10-31 12:33:27', '164201c1-6285-47c4-b187-a42f5215cfee', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(71, 129, 1, '2021-10-31 12:33:27', '2021-10-31 12:33:27', '5b9515c7-48fc-48ff-bdd0-f914995747d1', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(72, 130, 1, '2021-10-31 12:33:27', '2021-10-31 12:33:27', '6a6aaa86-7705-45c5-b8be-eeddef32373c', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(73, 131, 1, '2021-10-31 12:33:27', '2021-10-31 12:33:27', 'db1e1cd2-dfd3-45ee-a39e-db6a2466cdd6', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(74, 132, 1, '2021-10-31 12:33:27', '2021-10-31 12:33:27', '47fc10c9-10a5-43da-9642-156c7b6f3152', NULL, NULL, NULL, NULL, NULL, NULL),
(75, 133, 1, '2021-10-31 12:33:32', '2021-10-31 12:33:32', '8ebb9a5b-50df-4c6a-96ed-7eff76fa9e3c', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(76, 134, 1, '2021-10-31 12:33:32', '2021-10-31 12:33:32', '976f0b70-ddbb-4130-9aa7-823eff48a0b0', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(77, 135, 1, '2021-10-31 12:33:32', '2021-10-31 12:33:32', '077d0ba0-2945-4127-b508-71d4752cabb7', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(78, 136, 1, '2021-10-31 12:33:32', '2021-10-31 12:33:32', '94b034bf-ec44-405e-8a99-cc4aac110af5', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(79, 137, 1, '2021-10-31 12:33:32', '2021-10-31 12:33:32', 'b7e58a52-40ce-423b-ae70-3facbb7a55c4', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"\",\"col2\":\"\"}]'),
(80, 138, 1, '2021-10-31 12:33:34', '2021-10-31 12:33:34', '6a291be7-5118-40f5-ad16-fe1a81d1bb36', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(81, 139, 1, '2021-10-31 12:33:34', '2021-10-31 12:33:34', 'c07f133a-d110-4604-857c-9c65d71cacec', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(82, 140, 1, '2021-10-31 12:33:34', '2021-10-31 12:33:34', 'f4dafb4b-8d30-4ac7-9ced-9392fd83ef49', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(83, 141, 1, '2021-10-31 12:33:34', '2021-10-31 12:33:34', 'a8294bb5-58fc-45be-a0da-23ba38e1413d', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(84, 142, 1, '2021-10-31 12:33:34', '2021-10-31 12:33:34', '8f787e05-eb88-47cc-a1d9-581971bf67ef', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22\",\"col2\":\"\"}]'),
(85, 143, 1, '2021-10-31 12:33:41', '2021-10-31 12:33:41', '199f194a-215d-4d4c-924a-5d8c5e07680d', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(86, 144, 1, '2021-10-31 12:33:41', '2021-10-31 12:33:41', '7b3322a5-bd66-44c2-a82b-ded7dc20002c', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(87, 145, 1, '2021-10-31 12:33:41', '2021-10-31 12:33:41', '39c53867-8ed3-4662-a2d4-928a99acd2ab', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(88, 146, 1, '2021-10-31 12:33:41', '2021-10-31 12:33:41', '02401040-2ee8-4f77-ae46-394dd0f78ce7', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(89, 147, 1, '2021-10-31 12:33:41', '2021-10-31 12:33:41', '214aa7dd-b0f3-4744-8dd4-eafda689141b', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"\",\"col2\":\"\"}]'),
(90, 148, 1, '2021-10-31 12:33:44', '2021-10-31 12:33:44', '5762638b-4007-4463-90e3-edfa1a357210', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(91, 149, 1, '2021-10-31 12:33:44', '2021-10-31 12:33:44', '37462763-51a9-4097-895a-29e3ab76e5b6', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(92, 150, 1, '2021-10-31 12:33:44', '2021-10-31 12:33:44', 'e032325b-1291-4a3c-a97a-0a93a65acaca', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(93, 151, 1, '2021-10-31 12:33:44', '2021-10-31 12:33:44', '926b5edd-cc99-4034-bbf9-6442957ffdf6', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(94, 152, 1, '2021-10-31 12:33:44', '2021-10-31 12:33:44', 'a2411d4b-199e-4b59-809f-f78ccd864fbd', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"\"}]'),
(95, 153, 1, '2021-10-31 12:33:47', '2021-10-31 12:33:47', '6d0e7014-8ec4-4a3e-b27f-67281c341ed6', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(96, 154, 1, '2021-10-31 12:33:47', '2021-10-31 12:33:47', '3e577738-80d7-4237-97e2-b640b4913488', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(97, 155, 1, '2021-10-31 12:33:47', '2021-10-31 12:33:47', '6bf10ad0-5991-45e0-909a-ef6b317dde25', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(98, 156, 1, '2021-10-31 12:33:47', '2021-10-31 12:33:47', 'fc409d73-ac10-4a89-85be-59c89bf20f63', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(99, 157, 1, '2021-10-31 12:33:47', '2021-10-31 12:33:47', 'cc2ef7ab-1efe-46d2-8c06-4a955fff8d29', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"}]'),
(100, 158, 1, '2021-10-31 12:33:52', '2021-10-31 12:33:52', 'e06dff2c-aa04-4ae8-96da-0b197d5f634a', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(101, 159, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '6cc4e91d-75e0-44b0-b373-f1da3205cba4', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(102, 160, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '36a4b5b3-113a-4f58-82d1-0a8614689f9b', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(103, 161, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '4b37192c-e76e-4a8d-b623-00e8fb29f5b0', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(104, 162, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', 'ee9a0782-64cd-49e1-bb74-951a40ce8a66', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"\",\"col2\":\"\"}]'),
(105, 163, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '88cf6c71-0f2f-4292-97b0-ab9d7dfec8be', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(106, 164, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '5a38e3aa-614a-4e7a-8618-f525b8d2ba5c', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(107, 165, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', 'd63be2f1-7306-4531-be86-7be7b75012ee', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(108, 166, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '6e9b83c7-48b6-47f1-a344-311504f556e7', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(109, 167, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '5fceb295-5e52-4638-a283-b7a4d0cc8ec6', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"\",\"col2\":\"\"},{\"col1\":\"\",\"col2\":\"\"}]'),
(110, 168, 1, '2021-10-31 12:33:55', '2021-10-31 12:33:55', '148b0d6d-76b3-470a-89ca-06d3ca2dc541', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(111, 169, 1, '2021-10-31 12:33:55', '2021-10-31 12:33:55', 'e5b30fc1-f9fb-479c-a1fe-ac529fac3d75', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(112, 170, 1, '2021-10-31 12:33:55', '2021-10-31 12:33:55', 'cf5a789d-d634-49ae-88dc-57e747b73594', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(113, 171, 1, '2021-10-31 12:33:55', '2021-10-31 12:33:55', '719078d7-3cc0-4e5a-b223-3d6d56400884', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(114, 172, 1, '2021-10-31 12:33:55', '2021-10-31 12:33:55', 'ba67e110-bdaf-4165-8423-bea70a3a130e', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"\",\"col2\":\"\"}]'),
(115, 173, 1, '2021-10-31 12:33:57', '2021-10-31 12:33:57', '01513579-0420-4b17-8c91-bb0923ab5f73', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(116, 174, 1, '2021-10-31 12:33:57', '2021-10-31 12:33:57', 'a6990651-0b1b-47a3-a477-92d63abe4501', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(117, 175, 1, '2021-10-31 12:33:57', '2021-10-31 12:33:57', 'c09aed6f-0091-4d6e-ad02-acbfcb096836', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(118, 176, 1, '2021-10-31 12:33:57', '2021-10-31 12:33:57', '72bbb5d6-cb31-4beb-ba28-0b9acffc0b5e', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(119, 177, 1, '2021-10-31 12:33:57', '2021-10-31 12:33:57', '11145d89-2dfa-4a5c-b53d-da638a7731b7', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"\"}]'),
(120, 178, 1, '2021-10-31 12:33:58', '2021-10-31 12:33:58', 'b4f2979b-9368-489c-ad88-43b98866139b', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(121, 179, 1, '2021-10-31 12:33:58', '2021-10-31 12:33:58', 'f7fa5dd9-a96d-44c6-9326-830023fe9b88', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(122, 180, 1, '2021-10-31 12:33:58', '2021-10-31 12:33:58', '4fcf8a25-5576-47b8-a206-8bd5e62a10b7', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(123, 181, 1, '2021-10-31 12:33:58', '2021-10-31 12:33:58', '2cf5ad62-bae4-4813-b4c5-7516fff9bec6', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(124, 182, 1, '2021-10-31 12:33:58', '2021-10-31 12:33:58', 'ac9195bf-307e-435e-b480-57fafaeb4f13', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\" \"}]'),
(125, 183, 1, '2021-10-31 12:34:03', '2021-10-31 12:34:03', 'f94ef1b1-3e58-4300-bfc9-e6d4c0eb7dac', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(126, 184, 1, '2021-10-31 12:34:03', '2021-10-31 12:34:03', '902f6213-cd74-49e6-9b8d-f64739773359', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(127, 185, 1, '2021-10-31 12:34:03', '2021-10-31 12:34:03', 'b913534a-fc55-40e1-b271-7faa0a0cdc46', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(128, 186, 1, '2021-10-31 12:34:03', '2021-10-31 12:34:03', '5241677d-ccc0-46e4-aeb7-54a27bf4b2f4', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(129, 187, 1, '2021-10-31 12:34:03', '2021-10-31 12:34:03', '9ccf3570-420c-477a-ae8b-9fbb173d269b', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(130, 188, 1, '2021-10-31 12:34:10', '2021-10-31 12:34:10', '3c13547a-e162-456a-9379-0b151f23bdf8', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(131, 189, 1, '2021-10-31 12:34:10', '2021-10-31 12:34:10', 'ae22242f-5825-4dee-ad11-74b4cbe9014d', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(132, 190, 1, '2021-10-31 12:34:10', '2021-10-31 12:34:10', 'f461ed24-8f92-4af1-abde-6906d4460a7f', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(133, 191, 1, '2021-10-31 12:34:10', '2021-10-31 12:34:10', '5d337d56-3847-4f08-a8c9-3c41caa008b9', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(134, 192, 1, '2021-10-31 12:34:10', '2021-10-31 12:34:10', 'c7636b1a-80e9-4798-b549-663bc862591b', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(135, 193, 1, '2021-10-31 12:34:10', '2021-10-31 12:34:10', 'f6aa8e14-da52-4317-afd2-4cdee7535a85', NULL, NULL, NULL, NULL, NULL, NULL),
(136, 194, 1, '2021-10-31 12:34:16', '2021-10-31 12:34:16', 'd71f4698-7500-4366-835f-de9b56d362fa', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(137, 195, 1, '2021-10-31 12:34:16', '2021-10-31 12:34:16', 'ff3dd22a-d6a4-4d26-96d8-2141d006e96e', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(138, 196, 1, '2021-10-31 12:34:16', '2021-10-31 12:34:16', '2424d39f-3f3d-4b6b-ac96-73e54e1e7781', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_recipecontents` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_recipeImage_imageCaption`, `field_recipeTip_tipContent`, `field_recipeCopy_bodyContent`, `field_recipeSteps_stepsContent`, `field_recipeSteps_stepsTitle`, `field_recipeIngredients_ingredients`) VALUES
(139, 197, 1, '2021-10-31 12:34:16', '2021-10-31 12:34:16', 'a5301760-dafc-44f4-b9cd-b0e60a111315', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(140, 198, 1, '2021-10-31 12:34:16', '2021-10-31 12:34:16', 'a850ce59-f86d-4586-8b66-dfcec4f5e2d1', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(141, 199, 1, '2021-10-31 12:34:17', '2021-10-31 12:34:17', 'af9ad54c-988e-478a-a9c9-159bca4f9c67', NULL, NULL, NULL, NULL, 'Preparin', NULL),
(142, 200, 1, '2021-10-31 12:34:19', '2021-10-31 12:34:19', '0d4237cc-837f-4ebe-af17-b199bbab03ea', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(143, 201, 1, '2021-10-31 12:34:19', '2021-10-31 12:34:19', '319f3f7f-c0a1-4e3b-8ae3-8805481b2766', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(144, 202, 1, '2021-10-31 12:34:19', '2021-10-31 12:34:19', '0081162a-d96f-437b-8217-12def3e8105c', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(145, 203, 1, '2021-10-31 12:34:19', '2021-10-31 12:34:19', 'de73fd44-a16d-4e8d-9464-e92344eab310', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(146, 204, 1, '2021-10-31 12:34:19', '2021-10-31 12:34:19', '8b0488d2-53cd-497b-bcbd-c8b5350eff0b', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(147, 205, 1, '2021-10-31 12:34:19', '2021-10-31 12:34:19', '1448b6b0-27e2-4f67-aead-e48e4cd7c3d1', NULL, NULL, NULL, NULL, 'Preparing Your Work', NULL),
(148, 206, 1, '2021-10-31 12:34:21', '2021-10-31 12:34:21', '265b597f-88e2-400f-94de-971ac80c7962', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(149, 207, 1, '2021-10-31 12:34:21', '2021-10-31 12:34:21', '38092384-36e4-4dbd-8e73-ace8e27a022c', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(150, 208, 1, '2021-10-31 12:34:21', '2021-10-31 12:34:21', '49c0dedc-73f6-4d48-9f5a-85adcab78b5c', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(151, 209, 1, '2021-10-31 12:34:21', '2021-10-31 12:34:21', 'cfca9388-92be-4f53-9747-c26dc35a7ed6', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(152, 210, 1, '2021-10-31 12:34:21', '2021-10-31 12:34:21', '2a926492-0ffa-4f34-bc3c-f1f43222ce05', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(153, 211, 1, '2021-10-31 12:34:21', '2021-10-31 12:34:21', '1ddb083a-521d-406a-89ee-2f789d0e1350', NULL, NULL, NULL, NULL, 'Preparing Your Workspaf', NULL),
(154, 212, 1, '2021-10-31 12:34:23', '2021-10-31 12:34:23', 'c26eb7a5-7b7c-4110-bc3a-844051165f40', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(155, 213, 1, '2021-10-31 12:34:23', '2021-10-31 12:34:23', '1371a75f-533f-4bdd-9acf-c8e434eefc78', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(156, 214, 1, '2021-10-31 12:34:23', '2021-10-31 12:34:23', '86000775-96e6-48dc-91f7-e5163738a8ff', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(157, 215, 1, '2021-10-31 12:34:23', '2021-10-31 12:34:23', '72478555-ab00-4856-ad99-6a103af3bd75', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(158, 216, 1, '2021-10-31 12:34:23', '2021-10-31 12:34:23', 'ddfe8cd8-aa13-4992-bcbb-b2e4403f661a', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(159, 217, 1, '2021-10-31 12:34:23', '2021-10-31 12:34:23', '4366b6a8-d3c4-4aaa-b9a1-9fe4cfce270a', NULL, NULL, NULL, NULL, 'Preparing Your Workspace', NULL),
(160, 218, 1, '2021-10-31 12:34:24', '2021-10-31 12:34:24', '12815fec-60d2-4e2d-88e2-f594a262e709', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(161, 219, 1, '2021-10-31 12:34:24', '2021-10-31 12:34:24', '8da4a53b-5291-46f0-b056-f26d3717ef42', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(162, 220, 1, '2021-10-31 12:34:24', '2021-10-31 12:34:24', 'c693527d-26c8-4582-92aa-ee342cf38f4f', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(163, 221, 1, '2021-10-31 12:34:25', '2021-10-31 12:34:25', '3045841d-0148-4974-8caa-f87fc54940c3', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(164, 222, 1, '2021-10-31 12:34:25', '2021-10-31 12:34:25', 'f88f7a83-7f59-4787-9da3-f792a63d98b1', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(165, 223, 1, '2021-10-31 12:34:25', '2021-10-31 12:34:25', '2dcf28db-ce29-4771-bfc4-d608c90e0e9e', NULL, NULL, NULL, '[{\"col1\":\"\"}]', 'Preparing Your Workspace', NULL),
(166, 224, 1, '2021-10-31 12:34:29', '2021-10-31 12:34:29', '18a69a21-0821-43db-93be-0ef02e8ab855', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(167, 225, 1, '2021-10-31 12:34:29', '2021-10-31 12:34:29', 'ae449318-5ce6-4f41-b0c2-817637d50224', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(168, 226, 1, '2021-10-31 12:34:29', '2021-10-31 12:34:29', '831c3869-275a-4017-8366-323ecae975fb', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(169, 227, 1, '2021-10-31 12:34:29', '2021-10-31 12:34:29', '2c25c500-b630-400d-96be-26c5dad664ab', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(170, 228, 1, '2021-10-31 12:34:29', '2021-10-31 12:34:29', 'a8227f2a-1810-4e3a-80d0-4cb9ded79f12', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(171, 229, 1, '2021-10-31 12:34:29', '2021-10-31 12:34:29', 'a7ed27e3-66a9-4673-8d1c-146ccf846ef3', NULL, NULL, NULL, '[{\"col1\":\"Clean up the ware\"}]', 'Preparing Your Workspace', NULL),
(172, 230, 1, '2021-10-31 12:34:31', '2021-10-31 12:34:31', '4d13cf9d-39e2-4ffc-a1b4-10c38793f0fa', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(173, 231, 1, '2021-10-31 12:34:31', '2021-10-31 12:34:31', 'cce1483f-521c-4e1b-a73e-e19fbfc92c84', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(174, 232, 1, '2021-10-31 12:34:31', '2021-10-31 12:34:31', '854d6731-7f0e-4e8e-ac67-c3cd47ac263e', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(175, 233, 1, '2021-10-31 12:34:31', '2021-10-31 12:34:31', 'd3b8f53a-a932-4aa8-ba31-116a068005e6', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(176, 234, 1, '2021-10-31 12:34:31', '2021-10-31 12:34:31', 'ac9ed71d-431e-46cd-82a2-47238bc46969', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(177, 235, 1, '2021-10-31 12:34:31', '2021-10-31 12:34:31', '29ac1e4f-f882-4e61-80ae-e06b82083085', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area\"}]', 'Preparing Your Workspace', NULL),
(178, 236, 1, '2021-10-31 12:34:34', '2021-10-31 12:34:34', '9458ab6f-a41b-4c86-9639-2d8afdbb6c95', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(179, 237, 1, '2021-10-31 12:34:34', '2021-10-31 12:34:34', '040f5152-6f97-4d45-9707-20f72c22d000', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(180, 238, 1, '2021-10-31 12:34:34', '2021-10-31 12:34:34', '27d2d73d-1dd5-4f61-8243-68cf351fe644', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(181, 239, 1, '2021-10-31 12:34:34', '2021-10-31 12:34:34', '0bb952cb-4dd0-46bc-9572-bf6c5e1b5671', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(182, 240, 1, '2021-10-31 12:34:34', '2021-10-31 12:34:34', '15a1dc3f-ad60-4786-af05-cd462b466f0c', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(183, 241, 1, '2021-10-31 12:34:34', '2021-10-31 12:34:34', '1c4b1fd1-ba5b-4bb5-9dac-2955b81a9a60', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\\n\"}]', 'Preparing Your Workspace', NULL),
(184, 242, 1, '2021-10-31 12:34:35', '2021-10-31 12:34:35', 'faf17619-921c-4f60-8f2c-0ab8a110a539', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(185, 243, 1, '2021-10-31 12:34:35', '2021-10-31 12:34:35', 'e3010f3f-2f0c-46be-8504-3716fa2835a1', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(186, 244, 1, '2021-10-31 12:34:35', '2021-10-31 12:34:35', 'fac0f455-7d39-4bbb-a9c2-027792ef73dd', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(187, 245, 1, '2021-10-31 12:34:35', '2021-10-31 12:34:35', '83ef968c-135c-4d14-bc0a-125ed62ada6f', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(188, 246, 1, '2021-10-31 12:34:35', '2021-10-31 12:34:35', '6505b3e9-cf42-44bd-a829-4b686171a85b', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(189, 247, 1, '2021-10-31 12:34:35', '2021-10-31 12:34:35', '762a8160-0690-4cfa-bd08-39bd5167f950', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"}]', 'Preparing Your Workspace', NULL),
(190, 248, 1, '2021-10-31 12:34:36', '2021-10-31 12:34:36', 'bb5b6781-fee5-4be6-a143-aef97d8ebc92', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(191, 249, 1, '2021-10-31 12:34:36', '2021-10-31 12:34:36', 'bf4c1447-0df0-49d5-81b2-869aec35b5a0', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(192, 250, 1, '2021-10-31 12:34:36', '2021-10-31 12:34:36', '676e8a27-73fa-485e-adbd-893adfb12106', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(193, 251, 1, '2021-10-31 12:34:36', '2021-10-31 12:34:36', '79c3b789-3c77-4a9b-b0cb-c694b8f8a84d', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(194, 252, 1, '2021-10-31 12:34:36', '2021-10-31 12:34:36', '004ac586-fb4b-4fc0-8831-31ed39d03e81', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(195, 253, 1, '2021-10-31 12:34:36', '2021-10-31 12:34:36', '0ca818b3-87b0-475f-bfe5-dffd258e5115', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"\"}]', 'Preparing Your Workspace', NULL),
(196, 254, 1, '2021-10-31 12:34:42', '2021-10-31 12:34:42', '6ed1fc6b-5916-4bd3-b9a2-26b3b08966e2', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(197, 255, 1, '2021-10-31 12:34:42', '2021-10-31 12:34:42', 'd3a6b0ae-97a5-48b3-8463-066cf65abcb2', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(198, 256, 1, '2021-10-31 12:34:42', '2021-10-31 12:34:42', '2f31aa6f-c9a0-4a1b-abb2-8496705a3424', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(199, 257, 1, '2021-10-31 12:34:42', '2021-10-31 12:34:42', 'ee5fb72f-c667-4148-be95-c3ed8864b027', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(200, 258, 1, '2021-10-31 12:34:42', '2021-10-31 12:34:42', 'd5e9d739-c1a4-42ca-9a7e-9afb6351db60', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(201, 259, 1, '2021-10-31 12:34:42', '2021-10-31 12:34:42', 'b45cf61e-95d0-4551-873c-3ae464649ce4', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn\"}]', 'Preparing Your Workspace', NULL),
(202, 260, 1, '2021-10-31 12:34:47', '2021-10-31 12:34:47', '6719fadd-3aa8-45f7-91f2-037da20fcaf4', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(203, 261, 1, '2021-10-31 12:34:47', '2021-10-31 12:34:47', '863ef70f-4539-4798-8b74-7e20f3ccd436', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(204, 262, 1, '2021-10-31 12:34:47', '2021-10-31 12:34:47', '25f43317-e79c-4d7a-973a-58d3050b2f9e', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(205, 263, 1, '2021-10-31 12:34:47', '2021-10-31 12:34:47', '26fb3023-058f-4f95-a874-ad733910f84c', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(206, 264, 1, '2021-10-31 12:34:47', '2021-10-31 12:34:47', '0b07067d-4b72-4ae8-8c3c-0a2a8d720bb5', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(207, 265, 1, '2021-10-31 12:34:47', '2021-10-31 12:34:47', '4af8ae8b-4054-4ed1-8f71-c3fa079349b7', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine;.\"}]', 'Preparing Your Workspace', NULL),
(208, 266, 1, '2021-10-31 12:34:49', '2021-10-31 12:34:49', 'b4a5a8fe-bf9e-4ab2-8e6a-39a91e1ba6a0', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(209, 267, 1, '2021-10-31 12:34:49', '2021-10-31 12:34:49', '1129aa60-43ad-4e77-a412-24a91e53f1d4', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(210, 268, 1, '2021-10-31 12:34:49', '2021-10-31 12:34:49', '002c3695-8695-4a14-84ea-c22c00698b13', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(211, 269, 1, '2021-10-31 12:34:49', '2021-10-31 12:34:49', '55d52796-277d-4b5a-89f5-07cd31ea0b2d', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(212, 270, 1, '2021-10-31 12:34:49', '2021-10-31 12:34:49', '5590864c-0c53-419b-bfef-fcab384f4261', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(213, 271, 1, '2021-10-31 12:34:49', '2021-10-31 12:34:49', 'dae4857f-7385-4006-959c-8902d525706b', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(214, 272, 1, '2021-10-31 12:34:56', '2021-10-31 12:34:56', '0e5825bc-530d-4709-a3d5-e69c112ce4e7', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(215, 273, 1, '2021-10-31 12:34:56', '2021-10-31 12:34:56', 'e21a71b2-6319-4e3f-9387-9724cc38217e', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(216, 274, 1, '2021-10-31 12:34:56', '2021-10-31 12:34:56', '51c38ee8-7907-4bd4-994c-9e6c224a2190', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(217, 275, 1, '2021-10-31 12:34:56', '2021-10-31 12:34:56', '149d3ef0-610a-4f52-9ad4-41dc9c06b557', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(218, 276, 1, '2021-10-31 12:34:56', '2021-10-31 12:34:56', '858269cf-b9fa-40ed-a11e-98ebca60c7f5', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(219, 277, 1, '2021-10-31 12:34:56', '2021-10-31 12:34:56', '00695995-d47e-49e8-8b3c-d18a029fe76d', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(220, 278, 1, '2021-10-31 12:34:56', '2021-10-31 12:34:56', '5e659a04-744b-4b88-a4a1-b6105c69e0b8', NULL, NULL, NULL, NULL, NULL, NULL),
(221, 279, 1, '2021-10-31 12:35:04', '2021-10-31 12:35:04', 'a9a75fb9-c5ec-43fb-99c3-4cae81c8f36b', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(222, 280, 1, '2021-10-31 12:35:04', '2021-10-31 12:35:04', 'daa2e7d6-060b-4470-b2cf-8da196719233', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(223, 281, 1, '2021-10-31 12:35:04', '2021-10-31 12:35:04', 'db6deb82-5f89-496e-99e4-efff511d92a1', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(224, 282, 1, '2021-10-31 12:35:04', '2021-10-31 12:35:04', '3602beec-6ae4-4d8e-972f-540b2cca1d1e', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(225, 283, 1, '2021-10-31 12:35:04', '2021-10-31 12:35:04', 'b15627de-e4c9-4b32-87ca-a0d59cd20edb', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(226, 284, 1, '2021-10-31 12:35:04', '2021-10-31 12:35:04', '7b4529ce-60c6-4a7a-96fb-51ad7fd2ba23', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(227, 285, 1, '2021-10-31 12:35:04', '2021-10-31 12:35:04', 'cdb33619-f0b3-408b-87cf-b342aaaf1c86', NULL, NULL, NULL, NULL, NULL, NULL),
(228, 286, 1, '2021-10-31 12:35:09', '2021-10-31 12:35:09', 'a0a1f236-0f88-4150-8d18-2f2b7d48b046', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(229, 287, 1, '2021-10-31 12:35:09', '2021-10-31 12:35:09', '1ddee4f7-e833-4475-9176-1459eb3cda8d', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(230, 288, 1, '2021-10-31 12:35:09', '2021-10-31 12:35:09', '171c7881-ccc4-4cc2-a27a-6cbac6ca05b3', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(231, 289, 1, '2021-10-31 12:35:09', '2021-10-31 12:35:09', 'fc20ab9a-10d1-496c-9944-da71b2e14bf8', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(232, 290, 1, '2021-10-31 12:35:09', '2021-10-31 12:35:09', '09172ee5-f5e0-4fd8-8c0b-b02605edc0f8', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(233, 291, 1, '2021-10-31 12:35:09', '2021-10-31 12:35:09', '276acf2e-5fa0-498a-9a13-9c350a2360fe', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(234, 292, 1, '2021-10-31 12:35:09', '2021-10-31 12:35:09', 'dad2f2fe-4b16-4c29-9c03-30a4b047ea18', 'Anoth', NULL, NULL, NULL, NULL, NULL),
(235, 293, 1, '2021-10-31 12:35:12', '2021-10-31 12:35:12', '6530d09a-ccf4-4ef4-b796-8be20b857af4', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(236, 294, 1, '2021-10-31 12:35:12', '2021-10-31 12:35:12', 'ed794115-c391-4d8a-8e6a-dce784547367', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(237, 295, 1, '2021-10-31 12:35:12', '2021-10-31 12:35:12', '8245820f-44b0-4e08-8dac-67652c749ad4', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(238, 296, 1, '2021-10-31 12:35:12', '2021-10-31 12:35:12', 'ea776ddc-455a-4896-869e-438624aaf1b3', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(239, 297, 1, '2021-10-31 12:35:12', '2021-10-31 12:35:12', '069c2ca0-da71-473f-9dce-495e4233feb9', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(240, 298, 1, '2021-10-31 12:35:12', '2021-10-31 12:35:12', 'a7cfad84-9e45-4dd8-8835-de984b31708f', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(241, 299, 1, '2021-10-31 12:35:12', '2021-10-31 12:35:12', '93947b84-be46-4ea2-b7b0-a3bb0b69626c', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(242, 300, 1, '2021-10-31 12:35:15', '2021-10-31 12:35:15', '67db273f-4899-4072-9450-d5a20fc1ce4a', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(243, 301, 1, '2021-10-31 12:35:15', '2021-10-31 12:35:15', '0186e75c-a190-4c11-9ff7-1e2718810b6b', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(244, 302, 1, '2021-10-31 12:35:15', '2021-10-31 12:35:15', 'de5bbb87-a6bf-4495-86b4-98eb73fdfb4a', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(245, 303, 1, '2021-10-31 12:35:15', '2021-10-31 12:35:15', '70aba874-7ef6-4d59-bbd7-efdd4bcdcd04', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(246, 304, 1, '2021-10-31 12:35:15', '2021-10-31 12:35:15', 'ca56e81c-a4d4-4eae-ac3e-2e9e3f83a678', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(247, 305, 1, '2021-10-31 12:35:15', '2021-10-31 12:35:15', 'f2021440-353a-40a4-9617-86e25a8fb0de', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(248, 306, 1, '2021-10-31 12:35:15', '2021-10-31 12:35:15', '921e6e36-1456-46e8-8b5b-7a3b36cc7e9b', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(249, 307, 1, '2021-10-31 12:35:15', '2021-10-31 12:35:15', '1f8766e1-7232-4f95-b8a8-7dbc229a4618', NULL, NULL, NULL, NULL, NULL, NULL),
(250, 308, 1, '2021-10-31 12:35:18', '2021-10-31 12:35:18', '9653dbca-44a3-4fb8-9801-b3202382f04f', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(251, 309, 1, '2021-10-31 12:35:18', '2021-10-31 12:35:18', '8e32423d-6983-4c83-9531-92b5f94b8bd8', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(252, 310, 1, '2021-10-31 12:35:18', '2021-10-31 12:35:18', 'f83c2952-dff7-4e4c-a41c-423eb8066607', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(253, 311, 1, '2021-10-31 12:35:18', '2021-10-31 12:35:18', 'c2c7eaea-f095-4e39-9170-13ee3ad436a7', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(254, 312, 1, '2021-10-31 12:35:18', '2021-10-31 12:35:18', '789314dc-22c0-4131-8a0e-192e36834dda', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(255, 313, 1, '2021-10-31 12:35:18', '2021-10-31 12:35:18', '9b48d10b-7b80-4f39-9a05-0414308651ac', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(256, 314, 1, '2021-10-31 12:35:18', '2021-10-31 12:35:18', '4dcf0ae5-105c-436c-8fbc-7a177948a86b', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(257, 315, 1, '2021-10-31 12:35:18', '2021-10-31 12:35:18', '6231faaf-d1e5-496a-8098-a48ca1f130fe', NULL, NULL, NULL, NULL, 'G', NULL),
(258, 316, 1, '2021-10-31 12:35:19', '2021-10-31 12:35:19', 'd2ed43ce-efb2-476c-825b-31e1a9cd9192', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(259, 317, 1, '2021-10-31 12:35:19', '2021-10-31 12:35:19', '9473ae8c-f0d2-49e2-a23c-1ef2a8003a05', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(260, 318, 1, '2021-10-31 12:35:19', '2021-10-31 12:35:19', 'f79103df-0b2c-4b1a-ae08-5ded26cf3b29', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(261, 319, 1, '2021-10-31 12:35:19', '2021-10-31 12:35:19', 'e30e7e7c-1d36-4f3a-8aef-f2f9f8cc11a4', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(262, 320, 1, '2021-10-31 12:35:19', '2021-10-31 12:35:19', 'df1f3c60-4ddb-4961-b112-23891aca7271', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(263, 321, 1, '2021-10-31 12:35:19', '2021-10-31 12:35:19', '46b0eefe-6088-4771-b6de-7c4c6a44132b', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(264, 322, 1, '2021-10-31 12:35:19', '2021-10-31 12:35:19', 'a4663508-2810-4875-9fd4-c710a9b5cee3', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(265, 323, 1, '2021-10-31 12:35:19', '2021-10-31 12:35:19', '6ee628f5-88e1-4623-b5ad-c660d367d5ef', NULL, NULL, NULL, NULL, 'Gri', NULL),
(266, 324, 1, '2021-10-31 12:35:25', '2021-10-31 12:35:25', '3495a0c0-db76-479d-bc65-0bef83a0caa4', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(267, 325, 1, '2021-10-31 12:35:25', '2021-10-31 12:35:25', 'aeae99af-d3b6-46cc-b6dd-e3d9b0f5e9bb', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(268, 326, 1, '2021-10-31 12:35:25', '2021-10-31 12:35:25', 'ccfa936a-ed56-4162-bd9f-a96fa0faa60b', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(269, 327, 1, '2021-10-31 12:35:25', '2021-10-31 12:35:25', '8fa9d262-efc0-40d9-babe-5d4fa531509b', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(270, 328, 1, '2021-10-31 12:35:25', '2021-10-31 12:35:25', 'a5e647ac-44c0-444e-a462-8d5a14db8e3b', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(271, 329, 1, '2021-10-31 12:35:25', '2021-10-31 12:35:25', 'f1a83b9a-1609-4e7d-8346-609e06789f65', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(272, 330, 1, '2021-10-31 12:35:25', '2021-10-31 12:35:25', 'a1925bd3-e127-448f-a78b-cd68a5ea67cb', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(273, 331, 1, '2021-10-31 12:35:25', '2021-10-31 12:35:25', 'ddfc4bc0-6dad-405b-be0c-504587e0e1f5', NULL, NULL, NULL, NULL, 'Grinding the Coffee', NULL),
(274, 332, 1, '2021-10-31 12:35:28', '2021-10-31 12:35:28', 'afe17633-99cd-4701-830d-75247acfd491', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(275, 333, 1, '2021-10-31 12:35:28', '2021-10-31 12:35:28', '25300092-798f-41db-a854-3bb01397372d', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(276, 334, 1, '2021-10-31 12:35:28', '2021-10-31 12:35:28', '13c7082d-936a-4be6-bbc2-09e313b00dd9', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL);
INSERT INTO `matrixcontent_recipecontents` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_recipeImage_imageCaption`, `field_recipeTip_tipContent`, `field_recipeCopy_bodyContent`, `field_recipeSteps_stepsContent`, `field_recipeSteps_stepsTitle`, `field_recipeIngredients_ingredients`) VALUES
(277, 335, 1, '2021-10-31 12:35:28', '2021-10-31 12:35:28', 'ffd61285-58f7-4aa9-ad48-c370ef73e36a', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(278, 336, 1, '2021-10-31 12:35:28', '2021-10-31 12:35:28', '6b517db6-89b5-41ab-8c5e-4e73dd7fdba1', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(279, 337, 1, '2021-10-31 12:35:28', '2021-10-31 12:35:28', '5bb537fe-5835-4137-ac33-6d3e6d12bfe1', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(280, 338, 1, '2021-10-31 12:35:28', '2021-10-31 12:35:28', 'b0e7580f-4606-4af2-8e37-68bf30f45d04', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(281, 339, 1, '2021-10-31 12:35:28', '2021-10-31 12:35:28', 'aec83a1b-34dd-4a15-a074-15b8ef933cb4', NULL, NULL, NULL, '[{\"col1\":\"\"}]', 'Grinding the Coffee', NULL),
(282, 340, 1, '2021-10-31 12:35:31', '2021-10-31 12:35:31', '0951a214-5fed-4370-a07e-0e143681b0d6', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(283, 341, 1, '2021-10-31 12:35:31', '2021-10-31 12:35:31', 'f7885245-890e-42f0-92e7-3033a4904f6f', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(284, 342, 1, '2021-10-31 12:35:31', '2021-10-31 12:35:31', 'cd928bb9-f0f0-46c1-9df4-0f3603f70a71', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(285, 343, 1, '2021-10-31 12:35:31', '2021-10-31 12:35:31', '6140b2c5-2d5e-40cb-b33a-e8d8f758925e', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(286, 344, 1, '2021-10-31 12:35:31', '2021-10-31 12:35:31', '423d9914-f6d1-44ad-9906-9ab2cbe1ad64', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(287, 345, 1, '2021-10-31 12:35:31', '2021-10-31 12:35:31', 'b977a891-9d70-453d-afd2-e4ecbb8966b1', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(288, 346, 1, '2021-10-31 12:35:31', '2021-10-31 12:35:31', '8766ba14-93bb-4681-bf7a-cd29708f9d6d', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(289, 347, 1, '2021-10-31 12:35:31', '2021-10-31 12:35:31', '6bb0644e-91d6-444e-8c8d-df615bed5033', NULL, NULL, NULL, '[{\"col1\":\"Instruction\"}]', 'Grinding the Coffee', NULL),
(290, 348, 1, '2021-10-31 12:35:32', '2021-10-31 12:35:32', 'b37c87fa-123f-4329-a65a-18f4d42c9a30', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(291, 349, 1, '2021-10-31 12:35:32', '2021-10-31 12:35:32', '1d412b8f-c22e-41a7-8ec6-12d1397775e7', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(292, 350, 1, '2021-10-31 12:35:32', '2021-10-31 12:35:32', 'c9faff87-57b6-4c73-a892-f96a68a468e1', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(293, 351, 1, '2021-10-31 12:35:32', '2021-10-31 12:35:32', '1f54338d-6a21-4d89-99c1-972761bc01bc', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(294, 352, 1, '2021-10-31 12:35:32', '2021-10-31 12:35:32', 'a245db27-d64f-4bae-9d93-0e6d6cbd3731', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(295, 353, 1, '2021-10-31 12:35:32', '2021-10-31 12:35:32', 'e14eff6f-dc0e-4297-8e8a-fb1d5cca6526', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(296, 354, 1, '2021-10-31 12:35:32', '2021-10-31 12:35:32', 'f7bea709-6cb3-4df6-82f5-400a7f2589d9', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(297, 355, 1, '2021-10-31 12:35:32', '2021-10-31 12:35:32', 'e633e8d9-81c3-4f6f-8500-e01e4e258a96', NULL, NULL, NULL, '[{\"col1\":\"Instruction 1\"}]', 'Grinding the Coffee', NULL),
(298, 356, 1, '2021-10-31 12:35:34', '2021-10-31 12:35:34', 'a96f3c5f-f096-47ae-82e3-d951ff0b1c54', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(299, 357, 1, '2021-10-31 12:35:34', '2021-10-31 12:35:34', '2cad0145-07e4-4d1b-ba3e-bc7890eabfef', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(300, 358, 1, '2021-10-31 12:35:34', '2021-10-31 12:35:34', 'be3751f2-c827-454d-8cc4-5898bc5ddd61', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(301, 359, 1, '2021-10-31 12:35:34', '2021-10-31 12:35:34', '84a36fb5-bf7b-4df2-b46f-a73890cdc9fe', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(302, 360, 1, '2021-10-31 12:35:34', '2021-10-31 12:35:34', '201ed630-cca4-40c9-9deb-50a172126657', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(303, 361, 1, '2021-10-31 12:35:34', '2021-10-31 12:35:34', 'c6afc6d0-f21e-4a4c-9ea6-185784ff3c37', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(304, 362, 1, '2021-10-31 12:35:34', '2021-10-31 12:35:34', 'e150602c-7a74-45e5-a311-7ab093264977', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(305, 363, 1, '2021-10-31 12:35:34', '2021-10-31 12:35:34', '03498e4e-5b11-4c37-bbb1-64404f5a69d0', NULL, NULL, NULL, '[{\"col1\":\"Instruction 1\"},{\"col1\":\"\"}]', 'Grinding the Coffee', NULL),
(306, 364, 1, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '9291eaf4-2d1c-4395-b136-f711787357c2', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(307, 365, 1, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '07119042-f7df-4de0-9f01-1bb33c965d2e', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(308, 366, 1, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '791253a4-65a6-47c2-84fa-3948ed95a0db', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(309, 367, 1, '2021-10-31 12:35:38', '2021-10-31 12:35:38', 'f033bafc-4f72-4d44-91b5-6cc293ea86f4', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(310, 368, 1, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '265a15d0-0250-433f-b972-d71ca1507929', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(311, 369, 1, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '01ec2f3a-f5be-4624-a4aa-f2a581608c54', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(312, 370, 1, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '670cabd4-4508-40c7-a35a-a24923c61405', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(313, 371, 1, '2021-10-31 12:35:38', '2021-10-31 12:35:38', 'd2147f54-ef75-4120-ae66-6d0387939141', NULL, NULL, NULL, '[{\"col1\":\"Instruction 1\"},{\"col1\":\"Instruction 2\"}]', 'Grinding the Coffee', NULL),
(314, 372, 1, '2021-10-31 12:35:56', '2021-10-31 12:35:56', 'a4426d02-5532-42e5-a7fc-bd2c551cc4a8', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(315, 373, 1, '2021-10-31 12:35:56', '2021-10-31 12:35:56', 'c66cc227-38b9-43a5-9308-4b28f6e7d2ff', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(316, 374, 1, '2021-10-31 12:35:56', '2021-10-31 12:35:56', '888dfdda-00c7-44a3-89b5-7ae523dc135f', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(317, 375, 1, '2021-10-31 12:35:56', '2021-10-31 12:35:56', 'fe67071d-f023-443d-b659-1e322120bb13', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(318, 376, 1, '2021-10-31 12:35:56', '2021-10-31 12:35:56', 'a3ce267b-4511-44a5-8dec-80154f388a93', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(319, 377, 1, '2021-10-31 12:35:56', '2021-10-31 12:35:56', '347a38d2-c5fd-49e7-8e6d-ec2e7abf62d5', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(320, 378, 1, '2021-10-31 12:35:56', '2021-10-31 12:35:56', 'a140d259-9b94-4cd1-945e-92200da18966', NULL, NULL, NULL, '[{\"col1\":\"Instruction 1\"},{\"col1\":\"Instruction 2\"}]', 'Grinding the Coffee', NULL),
(321, 379, 1, '2021-10-31 12:35:56', '2021-10-31 12:35:56', 'ad7a10f9-f17e-49aa-97ba-6de92a2dd7dd', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(322, 380, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '8eef5120-9bc8-4c69-9400-c20850ca5316', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(323, 381, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '1773dc78-cd82-4cd0-b2f8-4f8117c5f482', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(324, 382, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '1662edb7-5e59-4164-acca-77ea6f91f281', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(325, 383, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', 'e84b0289-7249-4e73-b3f0-0df9f8f39b8e', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(326, 384, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', 'a9fd3f63-7eac-40f2-8150-d8887da77572', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(327, 385, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', 'eaf676f5-bb07-4377-a66b-74b3d53856e1', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(328, 386, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', 'fd39b7ab-89dc-4a16-8a94-970993a84f45', NULL, NULL, NULL, NULL, NULL, NULL),
(329, 387, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '676f1b18-0aa5-441e-9490-094c08362ccf', NULL, NULL, NULL, '[{\"col1\":\"Instruction 1\"},{\"col1\":\"Instruction 2\"}]', 'Grinding the Coffee', NULL),
(330, 388, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '69943733-c62b-4f48-95ac-d892c771baad', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(331, 389, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '66d8e477-2e9b-4b08-ab1f-946d370e2b3b', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(332, 390, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '05192d6a-b997-4a19-be3e-48f218370bf6', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(333, 391, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '4716f18c-1508-4ec1-8017-991347fdbc4e', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(334, 392, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', 'bff814d2-b8f0-478d-b4de-d7c8bb33950b', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(335, 393, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '030511d7-bd63-4b1d-b510-9690b616bf8b', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(336, 394, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', 'd20b7bd9-816f-4210-a4f9-47b2da98c362', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(337, 395, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '22f9bac6-a20e-48b1-acd9-8c5143121559', NULL, 'Ge the', NULL, NULL, NULL, NULL),
(338, 396, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '57368783-cb0e-42ea-ab3f-9ff9cae717f8', NULL, NULL, NULL, '[{\"col1\":\"Instruction 1\"},{\"col1\":\"Instruction 2\"}]', 'Grinding the Coffee', NULL),
(339, 397, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '95ad7cf2-ecbf-49ec-8a37-ffb021106802', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(340, 398, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '35674b2b-6ed1-4cbd-802f-2bd46b044fdc', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(341, 399, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '86119658-29da-4ea9-9a9a-8e8cc537291f', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(342, 400, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '1f820088-3f7b-40a6-abcf-16c49926b419', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(343, 401, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '0a3299ec-b61f-4f2d-ab94-b993ab9b3516', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(344, 402, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', 'd73c9ddb-6dc0-4dc8-97dd-b3048d073a51', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(345, 403, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', 'd4bfb42e-352e-4327-9ba3-819869a6a4d1', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(346, 404, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '0352f728-7bb4-4ecf-a383-eed006bbbc22', NULL, 'Ge the best espresso machine you can affort; it makes a', NULL, NULL, NULL, NULL),
(347, 405, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '7f128dcd-59ef-4742-b5c1-802935ce0fc6', NULL, NULL, NULL, '[{\"col1\":\"Instruction 1\"},{\"col1\":\"Instruction 2\"}]', 'Grinding the Coffee', NULL),
(348, 406, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', 'be21b221-74d5-4154-ae76-4c990efe52fe', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(349, 407, 1, '2021-10-31 12:37:14', '2021-10-31 12:37:14', '32c55c28-c85f-42a8-b771-c53eed0c8e9e', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(350, 408, 1, '2021-10-31 12:37:15', '2021-10-31 12:37:15', '11e6039e-d242-4d8f-8e4f-44b3f4c78710', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(351, 409, 1, '2021-10-31 12:37:15', '2021-10-31 12:37:15', '797814b7-30a1-4897-b364-f1eac778cfad', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(352, 410, 1, '2021-10-31 12:37:15', '2021-10-31 12:37:15', '9b1db37b-4f93-436c-a154-1f35cde861db', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(353, 411, 1, '2021-10-31 12:37:15', '2021-10-31 12:37:15', 'd275a714-56c0-4ea3-8186-a25737741d8a', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(354, 412, 1, '2021-10-31 12:37:15', '2021-10-31 12:37:15', '59f14404-149a-4698-8b9b-01c8b750a80c', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(355, 413, 1, '2021-10-31 12:37:15', '2021-10-31 12:37:15', '1288111b-bb01-4e37-8bce-838f2f58eda8', NULL, 'Ge the best espresso machine you can affort; it makes a difference!', NULL, NULL, NULL, NULL),
(356, 414, 1, '2021-10-31 12:37:15', '2021-10-31 12:37:15', '214e9107-f541-4f75-b926-808df255b557', NULL, NULL, NULL, '[{\"col1\":\"Instruction 1\"},{\"col1\":\"Instruction 2\"}]', 'Grinding the Coffee', NULL),
(357, 415, 1, '2021-10-31 12:37:15', '2021-10-31 12:37:15', '3043637d-56fe-4e87-883e-02bc5d36b14a', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(358, 416, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', 'd0abb4e1-9f18-4da5-b0c8-1073c501532f', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(359, 417, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', 'f2bb95dd-2b6e-407c-aaf4-099070d77514', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(360, 418, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '616822f4-da56-4b77-bbe5-d21b0a7ab359', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(361, 419, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '30dfe908-9d1d-47fe-b5cc-20b090424aae', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(362, 420, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', 'b9b6ab36-aeba-4a73-8eae-c6fb6b36bcf6', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(363, 421, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', 'bf34ac0f-f6ab-4f0b-aa42-02c7b5d5d7aa', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(364, 422, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '181c2f03-821a-44fe-b11f-35ff87357f41', NULL, NULL, NULL, '[{\"col1\":\"Instruction 1\"},{\"col1\":\"Instruction 2\"}]', 'Grinding the Coffee', NULL),
(365, 423, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', 'f88d476a-c5db-44b9-b028-51dfe3aec13d', NULL, 'Ge the best espresso machine you can affort; it makes a difference!', NULL, NULL, NULL, NULL),
(366, 424, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', 'a078ea54-44eb-42da-a430-1dd1b54ffc5b', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(376, 435, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '0d3515e6-d51a-4cf8-a18a-388b073b1bfe', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(377, 436, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'd85e929e-6bb4-4145-8d70-6e4f1612edf3', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(378, 437, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'cd6ef736-3cd4-4558-8618-3f5c3d26946c', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(379, 438, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'b79aee8d-3659-4616-98e3-5ec8ea6332b4', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(380, 439, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '079ce4f8-178c-4449-b377-dad63dd12c6d', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(381, 440, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '16838e9a-48a3-4342-bb28-6ba1fb0bd4c8', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(382, 441, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'af87a8fc-2f40-4ae6-8a5c-81c12c74b606', NULL, NULL, NULL, '[{\"col1\":\"Instruction 1\"},{\"col1\":\"Instruction 2\"}]', 'Grinding the Coffee', NULL),
(383, 442, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '3c73e07f-bf69-4af4-848b-46d57a82f77e', NULL, 'Ge the best espresso machine you can affort; it makes a difference!', NULL, NULL, NULL, NULL),
(384, 443, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '6f0c9c87-3e58-4718-b84e-3c6b1a4aaaf8', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(385, 445, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'fa0ca34a-5265-456b-bc83-acdd8fa60654', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(386, 446, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '99506ce3-04a9-42a6-a3cb-4a9c321a9b23', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(387, 447, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '3db787a2-88b7-4e25-a1d1-75dcbae6c252', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(388, 448, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'cc9934ca-9b80-4308-89e4-018e3862a5e3', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(389, 449, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '27e0c188-bdf6-4e1d-b382-12d278690798', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(390, 450, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '8f1eb0fc-5574-4b1b-b5af-9ef56e7b8acc', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(391, 451, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '50ed8d97-63c8-4f36-8b05-aecab8e34c71', NULL, NULL, NULL, '[{\"col1\":\"Instruction 1\"},{\"col1\":\"Instruction 2\"}]', 'Grinding the Coffee', NULL),
(392, 452, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '78450eb4-4576-405c-96f6-46d828bf88c3', NULL, 'Ge the best espresso machine you can affort; it makes a difference!', NULL, NULL, NULL, NULL),
(393, 453, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'd2ffbbd7-4aed-42f3-aad6-7d089630027e', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(403, 464, 1, '2021-10-31 14:01:39', '2021-10-31 16:23:20', '7b9e8690-317f-4a9d-b2a0-2f56e19f6179', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(404, 465, 1, '2021-10-31 14:01:40', '2021-10-31 16:23:20', 'e6f3ab7c-fd8e-4127-bfdf-efbe1aa398eb', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(405, 466, 1, '2021-10-31 14:01:40', '2021-10-31 16:23:20', '60926947-b429-4612-a45a-41f8b4c82f0e', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(406, 467, 1, '2021-10-31 14:01:40', '2021-10-31 16:23:20', 'f6ac90a1-9c59-40ca-b2a2-c32ec56aae82', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(407, 468, 1, '2021-10-31 14:01:40', '2021-10-31 16:23:20', '254b3dd3-e69b-4fed-848f-937f68d51e2b', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(408, 469, 1, '2021-10-31 14:01:40', '2021-10-31 16:23:20', '1a342c25-62f5-498e-9266-ffbe785d3bdc', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(409, 470, 1, '2021-10-31 14:01:40', '2021-10-31 16:23:20', '3ecabe75-d382-46e0-b55d-7f1396e0792b', NULL, NULL, NULL, '[{\"col1\":\"Instruction 1\"},{\"col1\":\"Instruction 2\"}]', 'Grinding the Coffee', NULL),
(410, 471, 1, '2021-10-31 14:01:40', '2021-10-31 16:23:20', '221c17b7-dfdb-4fd9-aaa6-5bbc982444ba', NULL, 'Ge the best espresso machine you can affort; it makes a difference!', NULL, NULL, NULL, NULL),
(411, 472, 1, '2021-10-31 14:01:40', '2021-10-31 16:23:20', '7d198ecd-5fc0-43f9-9ce2-476ab0dec826', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(412, 474, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '5eba5ac6-4d91-45aa-b42f-9450b70f6a7e', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(413, 475, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'a568e8c3-bef2-4cdd-9f47-f0b114b9c9be', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(414, 476, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '060c2007-eb3f-46a3-bef5-99908c71993c', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(415, 477, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'fd1e60a1-027f-47cc-944a-f283efcb46ab', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(416, 478, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'baa0f362-7d73-4961-bd90-ad43773876b7', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(417, 479, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'ddef70ac-653f-4e70-b0d5-08260608c8c1', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(418, 480, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '5ef1be45-420d-4cac-8734-bd01f85923a3', NULL, NULL, NULL, '[{\"col1\":\"Instruction 1\"},{\"col1\":\"Instruction 2\"}]', 'Grinding the Coffee', NULL),
(419, 481, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '56ae1221-42a6-4445-98a4-f893068880d9', NULL, 'Ge the best espresso machine you can affort; it makes a difference!', NULL, NULL, NULL, NULL),
(420, 482, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'eddd5d15-1006-438d-b015-6ac934794b22', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(421, 484, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', 'd93fe564-9487-4263-b16e-e7dd4429e604', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(422, 485, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '75e4c386-51ab-408a-b92b-98affbd416fa', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(423, 486, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '11b7340f-8dc4-4733-9468-1fecb18c4c92', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(424, 487, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '320f2270-4c1b-4b67-aee1-46a73fc7fd66', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(425, 488, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '8760e84c-7dda-4f54-9b02-682a7a14cbe2', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(426, 489, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '3c87b5a1-e728-4f5e-9669-713e40ad5eb6', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(427, 490, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '26d068ea-455c-4022-b13a-6c2e916c9669', NULL, NULL, NULL, '[{\"col1\":\"Instruction 1\"},{\"col1\":\"Instruction 2\"}]', 'Grinding the Coffee', NULL),
(428, 491, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', 'f3f1c0d0-d776-4d59-ab4b-717d5912c41d', NULL, 'Ge the best espresso machine you can affort; it makes a difference!', NULL, NULL, NULL, NULL),
(429, 492, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '7506d2eb-439d-4e7a-995c-dc860b4e5b71', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(430, 494, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', '42fa067e-9760-4c0f-909d-82dc53651d1d', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(431, 495, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', 'c8d4c068-a842-44fc-bb05-8055e04adbdc', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(432, 496, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', '815e8e95-d82d-49dc-a6e3-f911bb0f1fda', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(433, 497, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', '8d9946b9-506c-4761-b674-8e31072fcb7d', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(434, 498, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', 'e5e1e164-2184-4cbb-9716-c15f085c53b1', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(435, 499, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', 'da9ec09f-f284-4f65-ab0a-9ebff3ab9a91', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(436, 500, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', 'ba6401e2-e355-4c9e-a230-2ad9277f75d9', NULL, NULL, NULL, '[{\"col1\":\"Instruction 1\"},{\"col1\":\"Instruction 2\"}]', 'Grinding the Coffee', NULL),
(437, 501, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', '291df228-64db-4b8c-924f-f176577083fb', NULL, 'Ge the best espresso machine you can affort; it makes a difference!', NULL, NULL, NULL, NULL),
(438, 502, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', 'f9b43b69-430c-46ee-a8e1-dae6b084d99e', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(439, 505, 1, '2021-10-31 16:17:15', '2021-10-31 16:17:15', '9f136f94-ab03-47b7-8598-43bc916f3730', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL),
(440, 506, 1, '2021-10-31 16:17:15', '2021-10-31 16:17:15', '75a52afa-f8ba-43c8-98b7-7f45e661e2d5', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(441, 507, 1, '2021-10-31 16:17:15', '2021-10-31 16:17:15', 'd19333b5-8a3b-4cdd-9142-99177de727a5', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(442, 508, 1, '2021-10-31 16:17:15', '2021-10-31 16:17:15', 'b747e9ac-7782-443b-838e-bf225548042a', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(443, 509, 1, '2021-10-31 16:17:15', '2021-10-31 16:17:15', '5d2bf7c8-829e-4e31-ac92-2044e5046d1a', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(444, 510, 1, '2021-10-31 16:17:15', '2021-10-31 16:17:15', '65899903-b38f-4d52-a679-5d01bfe921a4', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(445, 511, 1, '2021-10-31 16:17:15', '2021-10-31 16:17:15', '8fb4ee92-a3ba-4593-8fe2-e3d4112f7f0a', NULL, NULL, NULL, '[{\"col1\":\"Instruction 1\"},{\"col1\":\"Instruction 2\"}]', 'Grinding the Coffee', NULL),
(446, 512, 1, '2021-10-31 16:17:15', '2021-10-31 16:17:15', 'abe37246-82d1-4407-9566-801a2c13f796', NULL, 'Ge the best espresso machine you can affort; it makes a difference!', NULL, NULL, NULL, NULL),
(447, 513, 1, '2021-10-31 16:17:15', '2021-10-31 16:17:15', 'aeab621c-0932-476f-bbae-70c945f03112', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(448, 516, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', '77c4efa2-0fb3-4555-8b32-ad5453fccf6a', NULL, NULL, '<p>This is the initial page copy.</p>', NULL, NULL, NULL);
INSERT INTO `matrixcontent_recipecontents` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_recipeImage_imageCaption`, `field_recipeTip_tipContent`, `field_recipeCopy_bodyContent`, `field_recipeSteps_stepsContent`, `field_recipeSteps_stepsTitle`, `field_recipeIngredients_ingredients`) VALUES
(449, 517, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', '36941618-900d-4b92-8612-afffc5a5f701', 'The perfect espresso. Time to drink!', NULL, NULL, NULL, NULL, NULL),
(450, 518, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', 'f8008a3d-4db9-43c1-9fdc-d6e8b65ab606', NULL, 'Be careful with the water temperature! It\'s important that the water is hot enough but not too hot.', NULL, NULL, NULL, NULL),
(451, 519, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', 'b7616682-7922-4ace-8827-5cf0144cfd5e', NULL, NULL, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br /></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', NULL, NULL, NULL),
(452, 520, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', 'e598935b-aa79-4259-9d91-20660026b15a', NULL, NULL, NULL, NULL, NULL, '[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"4 oz \",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso Machine\"}]'),
(453, 521, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', 'c2fb9b94-922a-4e24-b7e3-80c32372231c', NULL, NULL, NULL, '[{\"col1\":\"Clean up the area.\"},{\"col1\":\"Turn on espresso machine.\"}]', 'Preparing Your Workspace', NULL),
(454, 522, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', '77dd2e70-7999-40cd-bfdc-f40cf54637e1', NULL, NULL, NULL, '[{\"col1\":\"Instruction 1\"},{\"col1\":\"Instruction 2\"}]', 'Grinding the Coffee', NULL),
(455, 523, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', 'b91b779b-3398-455a-b6fb-c33765394f5c', NULL, 'Ge the best espresso machine you can affort; it makes a difference!', NULL, NULL, NULL, NULL),
(456, 524, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', 'b8770da7-f434-4340-9a92-563a1548d85a', 'Another of the same.', NULL, NULL, NULL, NULL, NULL),
(457, 529, 1, '2021-11-01 07:49:07', '2021-11-01 07:49:07', '95bcbed7-4f05-4d14-8359-6f71bfa4335f', NULL, NULL, '<p>placeholder copy here</p>', NULL, NULL, NULL),
(458, 531, 1, '2021-11-01 07:49:08', '2021-11-01 07:49:08', '1c9576e4-5741-4502-8d56-ba6ae186858a', NULL, NULL, '<p>placeholder copy here</p>', NULL, NULL, NULL);

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
(1, NULL, 'app', 'Install', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', 'b11015ed-4907-4a6f-b10c-a9c033056826'),
(2, NULL, 'app', 'm150403_183908_migrations_table_changes', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', 'd4e89a62-90c6-4433-81df-5559fd6f7912'),
(3, NULL, 'app', 'm150403_184247_plugins_table_changes', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2e3079c3-2ffc-4082-8883-805e5fde3dff'),
(4, NULL, 'app', 'm150403_184533_field_version', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', 'e9f726f7-dd1e-4552-931c-5fc8e9ab5a49'),
(5, NULL, 'app', 'm150403_184729_type_columns', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', 'f73a3f2f-8b2d-4ff8-bb96-21b5467240df'),
(6, NULL, 'app', 'm150403_185142_volumes', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '7ea384b8-1c0b-45ef-b96e-ad4035eda041'),
(7, NULL, 'app', 'm150428_231346_userpreferences', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '1316c5f0-3f76-418f-b62c-ee82d8a541be'),
(8, NULL, 'app', 'm150519_150900_fieldversion_conversion', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', 'dcafcdfa-ed12-4569-b98a-8ae5938531a7'),
(9, NULL, 'app', 'm150617_213829_update_email_settings', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '21df1cb5-e9c4-45b7-9337-71e9a0c513e0'),
(10, NULL, 'app', 'm150721_124739_templatecachequeries', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', 'e113162e-264a-4db6-8e79-0fd03731bbe3'),
(11, NULL, 'app', 'm150724_140822_adjust_quality_settings', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', 'd5e519cb-45bb-4597-82a3-bec87ef3407e'),
(12, NULL, 'app', 'm150815_133521_last_login_attempt_ip', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '54006db9-8d9e-4a88-859c-f6aaabad1934'),
(13, NULL, 'app', 'm151002_095935_volume_cache_settings', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '5d2efdc8-a924-4d50-84e9-c77f36748be2'),
(14, NULL, 'app', 'm151005_142750_volume_s3_storage_settings', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '417ea498-bdfc-45ab-9337-5715c6886a7a'),
(15, NULL, 'app', 'm151016_133600_delete_asset_thumbnails', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '35bb95e7-6da9-4d34-8a7c-71feb5539b2f'),
(16, NULL, 'app', 'm151209_000000_move_logo', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '53cc546f-f6db-4495-b12a-4397e93e321b'),
(17, NULL, 'app', 'm151211_000000_rename_fileId_to_assetId', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '405fb29a-de61-4acf-8c42-4faccea3bed6'),
(18, NULL, 'app', 'm151215_000000_rename_asset_permissions', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', 'c84b78d2-cd80-4076-b406-3fc57d960b39'),
(19, NULL, 'app', 'm160707_000001_rename_richtext_assetsource_setting', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '47f4b0ca-1ba5-4e88-a5ce-c62bbaa57524'),
(20, NULL, 'app', 'm160708_185142_volume_hasUrls_setting', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '44105776-1723-4606-aaeb-7fe6a20a1500'),
(21, NULL, 'app', 'm160714_000000_increase_max_asset_filesize', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '2021-10-08 15:12:58', '574f5f0d-f6f0-4cbe-897d-0a3d1e9e1e76'),
(22, NULL, 'app', 'm160727_194637_column_cleanup', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '208df6a3-a9a3-4283-ad57-c1e055feb801'),
(23, NULL, 'app', 'm160804_110002_userphotos_to_assets', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '900bbac9-e9ee-42ff-b284-fa37e88599be'),
(24, NULL, 'app', 'm160807_144858_sites', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '962e486c-c6ca-4ac5-aa1e-dd5952d6adf1'),
(25, NULL, 'app', 'm160829_000000_pending_user_content_cleanup', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '7573a12c-a4b1-4a44-b1d0-8dc9e6bb82b9'),
(26, NULL, 'app', 'm160830_000000_asset_index_uri_increase', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', 'c3ff6501-3325-4eed-b874-3418b89b8d11'),
(27, NULL, 'app', 'm160912_230520_require_entry_type_id', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '952ef27f-9d6a-481b-a23a-3c98aabc3d40'),
(28, NULL, 'app', 'm160913_134730_require_matrix_block_type_id', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', 'e4cd61e1-03eb-4862-95ce-334c33081140'),
(29, NULL, 'app', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2190312d-94c6-43cf-bac7-017e558cdcce'),
(30, NULL, 'app', 'm160920_231045_usergroup_handle_title_unique', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '1e197dea-5fea-404e-92c4-99077bd00def'),
(31, NULL, 'app', 'm160925_113941_route_uri_parts', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '3bef3fc6-24e2-4da1-b9ed-0e9cd98a49ec'),
(32, NULL, 'app', 'm161006_205918_schemaVersion_not_null', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '786f456c-b195-4dbb-90b7-25b4cd53c82a'),
(33, NULL, 'app', 'm161007_130653_update_email_settings', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '6f52bdbc-4af0-4672-9c34-d636b836ef48'),
(34, NULL, 'app', 'm161013_175052_newParentId', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '9c58847e-f646-4e3a-ab1e-e8f3bb1b5a37'),
(35, NULL, 'app', 'm161021_102916_fix_recent_entries_widgets', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '9e834ada-bb79-47ad-b8f3-ef35ebd83650'),
(36, NULL, 'app', 'm161021_182140_rename_get_help_widget', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '35e7944f-b0c8-456f-bd20-294368547d71'),
(37, NULL, 'app', 'm161025_000000_fix_char_columns', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', 'bf4efce7-7e9b-4e52-9738-ec3d85afe332'),
(38, NULL, 'app', 'm161029_124145_email_message_languages', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '3284d09e-7253-4814-a238-860f5cb563cb'),
(39, NULL, 'app', 'm161108_000000_new_version_format', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', 'eacf0687-699e-4e44-9d37-8cfc96970179'),
(40, NULL, 'app', 'm161109_000000_index_shuffle', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', 'f0843731-746d-48d3-82d9-dabc5a113f8a'),
(41, NULL, 'app', 'm161122_185500_no_craft_app', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '5f2c5243-fb81-459a-bb3f-2d87d714fde6'),
(42, NULL, 'app', 'm161125_150752_clear_urlmanager_cache', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '2021-10-08 15:12:59', '261ede71-85ee-4b4a-9f94-6b32de620084'),
(43, NULL, 'app', 'm161220_000000_volumes_hasurl_notnull', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '5fa68a5f-89a8-4fcb-9a11-09319a2b7ed7'),
(44, NULL, 'app', 'm170114_161144_udates_permission', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '9fca99bc-a513-472d-b8a4-c34f4ae250d5'),
(45, NULL, 'app', 'm170120_000000_schema_cleanup', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', 'aa16b27a-c449-44bd-a0b8-2a4682e11cd0'),
(46, NULL, 'app', 'm170126_000000_assets_focal_point', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '70a5d613-9c42-4908-9891-795c4b4543f9'),
(47, NULL, 'app', 'm170206_142126_system_name', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '4728d9d6-25d3-4c06-8735-2d7a7a538ab1'),
(48, NULL, 'app', 'm170217_044740_category_branch_limits', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '89cd3891-9121-4296-90dd-b30d211fd2f0'),
(49, NULL, 'app', 'm170217_120224_asset_indexing_columns', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '9882461a-1887-4c95-8caa-9e7c95bfaafe'),
(50, NULL, 'app', 'm170223_224012_plain_text_settings', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '025a2f99-c8bf-49be-9a06-c6eb5e6335ba'),
(51, NULL, 'app', 'm170227_120814_focal_point_percentage', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '6f59c7f1-8fc0-4668-9603-7ca614134362'),
(52, NULL, 'app', 'm170228_171113_system_messages', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '861a70f6-988d-4a18-9b3c-27ce899cb949'),
(53, NULL, 'app', 'm170303_140500_asset_field_source_settings', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '1a6b0ba8-049f-465b-8700-f747a47ece27'),
(54, NULL, 'app', 'm170306_150500_asset_temporary_uploads', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '67392d39-f972-4aeb-bc5e-e9297270e611'),
(55, NULL, 'app', 'm170523_190652_element_field_layout_ids', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', 'f28ba5a1-edf0-4d3d-adca-ef19338275e4'),
(56, NULL, 'app', 'm170612_000000_route_index_shuffle', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', 'e71ed755-9316-46fb-9a28-4be2913a6528'),
(57, NULL, 'app', 'm170621_195237_format_plugin_handles', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '4ca6478a-a06a-4fef-8333-51e916c0c551'),
(58, NULL, 'app', 'm170630_161027_deprecation_line_nullable', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', 'eb2fb505-4053-4f7b-b854-4bc85fb9c299'),
(59, NULL, 'app', 'm170630_161028_deprecation_changes', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', 'a974bd8c-2981-42b7-a2a6-43c2e7e58fc2'),
(60, NULL, 'app', 'm170703_181539_plugins_table_tweaks', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', 'db9041c0-2419-4dbe-ac7c-df1490ab7af4'),
(61, NULL, 'app', 'm170704_134916_sites_tables', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '4b3e64ce-cfbf-4808-863f-730220890d14'),
(62, NULL, 'app', 'm170706_183216_rename_sequences', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '90b27c1e-98bf-44ee-8bd4-586cdcb3c23b'),
(63, NULL, 'app', 'm170707_094758_delete_compiled_traits', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '06d186c1-790a-46e2-85a7-b4e110842f28'),
(64, NULL, 'app', 'm170731_190138_drop_asset_packagist', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '263f1858-a11c-4a71-9bbb-d69f18c44131'),
(65, NULL, 'app', 'm170810_201318_create_queue_table', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '2021-10-08 15:13:00', '17441c40-c19f-4c6d-bd1f-5624439d7a84'),
(66, NULL, 'app', 'm170816_133741_delete_compiled_behaviors', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '0c5ebb1c-826c-48f3-86c8-52205bc4ba80'),
(67, NULL, 'app', 'm170903_192801_longblob_for_queue_jobs', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '0a44bb31-e1f0-4464-8580-fa45110b4eb2'),
(68, NULL, 'app', 'm170914_204621_asset_cache_shuffle', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '300bfa51-c16f-4639-9411-ddb9728130cc'),
(69, NULL, 'app', 'm171011_214115_site_groups', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', 'c218d8a2-a8f3-4634-84fd-cae2e9428bca'),
(70, NULL, 'app', 'm171012_151440_primary_site', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', 'ed9b1bc3-8ef9-4465-813b-b2db18adea84'),
(71, NULL, 'app', 'm171013_142500_transform_interlace', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '04d4c5f8-4d23-4d6c-83bd-bb742cc33c1b'),
(72, NULL, 'app', 'm171016_092553_drop_position_select', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '71f1e7d0-3099-4d48-8b4d-ec0cfc38e994'),
(73, NULL, 'app', 'm171016_221244_less_strict_translation_method', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '084cb858-1e0b-49dc-aa9f-644a7754fd7d'),
(74, NULL, 'app', 'm171107_000000_assign_group_permissions', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', 'ce02fbdc-f223-4879-b2bc-05a7bf64333b'),
(75, NULL, 'app', 'm171117_000001_templatecache_index_tune', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '3470507a-f527-4833-b01d-6c56443b64d9'),
(76, NULL, 'app', 'm171126_105927_disabled_plugins', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '14d69916-8d09-4828-a979-d07a1ba750a3'),
(77, NULL, 'app', 'm171130_214407_craftidtokens_table', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', 'c9355561-8880-492a-8878-aa55e1aea0b9'),
(78, NULL, 'app', 'm171202_004225_update_email_settings', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '94bc8498-4662-47b0-bafc-90a9c37f0bb6'),
(79, NULL, 'app', 'm171204_000001_templatecache_index_tune_deux', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', 'b55bfc70-5c93-476f-a227-30325e12b510'),
(80, NULL, 'app', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '39aa2ac1-c0cd-4bf4-8c5e-24e5da62ec07'),
(81, NULL, 'app', 'm171218_143135_longtext_query_column', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '774afdf4-d3e1-4cad-9bb3-78ef0e42b89c'),
(82, NULL, 'app', 'm171231_055546_environment_variables_to_aliases', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', 'd8f2637b-f2e7-49b3-9516-ea71db4bd869'),
(83, NULL, 'app', 'm180113_153740_drop_users_archived_column', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '5a5dea3f-a2c8-4ce0-9212-cf07cd2b934e'),
(84, NULL, 'app', 'm180122_213433_propagate_entries_setting', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '63d8821e-4529-41b1-93d3-74dc85465524'),
(85, NULL, 'app', 'm180124_230459_fix_propagate_entries_values', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '7de06bf8-706c-456d-923b-f2ccac9d4232'),
(86, NULL, 'app', 'm180128_235202_set_tag_slugs', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '89199a1e-6ee9-4546-ab1b-b6f266b8cc51'),
(87, NULL, 'app', 'm180202_185551_fix_focal_points', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '3763a585-6cf7-4cb6-9f9d-07e84b18008a'),
(88, NULL, 'app', 'm180217_172123_tiny_ints', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '3f061316-f783-4686-898c-a629411aa7ff'),
(89, NULL, 'app', 'm180321_233505_small_ints', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '2021-10-08 15:13:01', '70740f4e-cea0-43c7-91c3-efeb34dd8267'),
(90, NULL, 'app', 'm180328_115523_new_license_key_statuses', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', 'a42ae4d1-bc09-48c2-9fe4-63b405cd82a3'),
(91, NULL, 'app', 'm180404_182320_edition_changes', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', 'c2de6968-6eff-44a2-a21a-83db88c39466'),
(92, NULL, 'app', 'm180411_102218_fix_db_routes', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', 'aff401d0-abd4-4ffc-a7db-718ff98bdf31'),
(93, NULL, 'app', 'm180416_205628_resourcepaths_table', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '340b4194-672f-407d-ab0e-414e9b4bd28e'),
(94, NULL, 'app', 'm180418_205713_widget_cleanup', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '8bb8ec53-5c24-40c8-9ca9-b7475bdd013b'),
(95, NULL, 'app', 'm180425_203349_searchable_fields', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', 'cc7b34e8-2245-49fa-9d8d-2ca03611146b'),
(96, NULL, 'app', 'm180516_153000_uids_in_field_settings', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2cbadfce-0107-42e2-b775-59bd671177f0'),
(97, NULL, 'app', 'm180517_173000_user_photo_volume_to_uid', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '8f5a3986-efbb-4a91-bb84-c76dfd37dd56'),
(98, NULL, 'app', 'm180518_173000_permissions_to_uid', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', 'f0a6ad3a-c191-424a-b96e-4e2bafac7c91'),
(99, NULL, 'app', 'm180520_173000_matrix_context_to_uids', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', 'e93d9e96-2567-4fb0-93b3-69674b61987d'),
(100, NULL, 'app', 'm180521_173000_initial_yml_and_snapshot', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '88962903-d482-442c-a330-27dd66a10637'),
(101, NULL, 'app', 'm180731_162030_soft_delete_sites', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '0205a3a5-da84-479b-92e1-b597f51299b8'),
(102, NULL, 'app', 'm180810_214427_soft_delete_field_layouts', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '6d08df48-9fd1-47cd-aed1-a1a4dce14d25'),
(103, NULL, 'app', 'm180810_214439_soft_delete_elements', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '377c9610-9bb0-4347-a523-3a66cc318c99'),
(104, NULL, 'app', 'm180824_193422_case_sensitivity_fixes', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '60f9fbc5-a570-4f22-8c88-6cb5c80c746c'),
(105, NULL, 'app', 'm180901_151639_fix_matrixcontent_tables', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '4ab1f1d8-251c-41f9-a516-a673522c95b4'),
(106, NULL, 'app', 'm180904_112109_permission_changes', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', 'c696a0db-b13a-44d1-b453-9a208a822f88'),
(107, NULL, 'app', 'm180910_142030_soft_delete_sitegroups', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', 'eaa8af4a-a23d-411d-931d-31cb75b28d8a'),
(108, NULL, 'app', 'm181011_160000_soft_delete_asset_support', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', 'a2f04b8b-a671-4c40-8232-20d7cdecc0f8'),
(109, NULL, 'app', 'm181016_183648_set_default_user_settings', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', 'd09cf21f-3110-4937-bbad-a4e0fa372212'),
(110, NULL, 'app', 'm181017_225222_system_config_settings', '2021-10-08 15:13:02', '2021-10-08 15:13:02', '2021-10-08 15:13:02', 'a7605dbb-126f-47bf-8bce-041a7cf7bb59'),
(111, NULL, 'app', 'm181018_222343_drop_userpermissions_from_config', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', 'dbb3b2e3-4ffb-4fdf-9ab4-d47099bd65ec'),
(112, NULL, 'app', 'm181029_130000_add_transforms_routes_to_config', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '679ba95a-5c1c-43f2-83e3-1e8c1d2bc878'),
(113, NULL, 'app', 'm181112_203955_sequences_table', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '5e75fb3b-d9ea-4350-842f-04f8c0a76ba8'),
(114, NULL, 'app', 'm181121_001712_cleanup_field_configs', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '00500a64-6fb9-4f13-ad5c-52cb3155e4d9'),
(115, NULL, 'app', 'm181128_193942_fix_project_config', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', 'd11c3933-160b-48c7-9ecd-48e728fe0158'),
(116, NULL, 'app', 'm181130_143040_fix_schema_version', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '670edc8f-bc9f-485e-9a61-8c7d5b18fb1e'),
(117, NULL, 'app', 'm181211_143040_fix_entry_type_uids', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', 'f9eb5776-030f-4da8-b1d0-1d83fe64ebd5'),
(118, NULL, 'app', 'm181213_102500_config_map_aliases', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '1d8a8bfa-a01b-4c47-8943-0b9c580493a6'),
(119, NULL, 'app', 'm181217_153000_fix_structure_uids', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', 'eb0d446e-97ed-47c7-ac11-df4b5e3a5c9e'),
(120, NULL, 'app', 'm190104_152725_store_licensed_plugin_editions', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '840d3d7f-1310-4742-824a-9a060085a3d0'),
(121, NULL, 'app', 'm190108_110000_cleanup_project_config', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '6382ae9b-236c-46b3-a297-211c1af76571'),
(122, NULL, 'app', 'm190108_113000_asset_field_setting_change', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '0bc7a3cf-548d-4696-87d0-f89754b3c22c'),
(123, NULL, 'app', 'm190109_172845_fix_colspan', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '3d88f49d-61ff-4224-ba3c-2605e82cb6ca'),
(124, NULL, 'app', 'm190110_150000_prune_nonexisting_sites', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '6db618c2-cc06-4a59-85ae-f0d094ee3e01'),
(125, NULL, 'app', 'm190110_214819_soft_delete_volumes', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '780483ba-ae23-4e24-82d3-a2e7c38e0c17'),
(126, NULL, 'app', 'm190112_124737_fix_user_settings', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '5b45390f-ad03-4621-989a-9330fd2d35dd'),
(127, NULL, 'app', 'm190112_131225_fix_field_layouts', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '57c0829f-4452-4712-aefa-06e269ff687d'),
(128, NULL, 'app', 'm190112_201010_more_soft_deletes', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '98f34c55-ce6c-4267-a92a-08df1f994398'),
(129, NULL, 'app', 'm190114_143000_more_asset_field_setting_changes', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', 'e6c83062-9d20-489b-a3d5-9c38a26d56d0'),
(130, NULL, 'app', 'm190121_120000_rich_text_config_setting', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '92711319-607b-442b-9fb6-c00ca618f7d3'),
(131, NULL, 'app', 'm190125_191628_fix_email_transport_password', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '32eace4a-7622-44e2-91c1-81fbbc77854b'),
(132, NULL, 'app', 'm190128_181422_cleanup_volume_folders', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', 'c19483af-2f48-4af4-ac1a-17c2f0d54c45'),
(133, NULL, 'app', 'm190205_140000_fix_asset_soft_delete_index', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '57c0ca22-55b9-41e5-b09a-b517aaa92b9c'),
(134, NULL, 'app', 'm190208_140000_reset_project_config_mapping', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '09bbbbed-ba9b-4d8e-bcf0-a553dbbba1fa'),
(135, NULL, 'app', 'm190218_143000_element_index_settings_uid', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '6cc1099e-302f-4392-aeef-985384f122ed'),
(136, NULL, 'app', 'm190312_152740_element_revisions', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '078e4de2-788c-48d2-b697-5af964ec0cd6'),
(137, NULL, 'app', 'm190327_235137_propagation_method', '2021-10-08 15:13:03', '2021-10-08 15:13:03', '2021-10-08 15:13:03', 'd4c6685e-e7d6-462b-ad91-dcaf52d2a185'),
(138, NULL, 'app', 'm190401_223843_drop_old_indexes', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '54adf364-ea76-449b-b475-0bfc53dc45cb'),
(139, NULL, 'app', 'm190416_014525_drop_unique_global_indexes', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '7cd64e6c-d177-4fb3-b51a-4049d5e75a4c'),
(140, NULL, 'app', 'm190417_085010_add_image_editor_permissions', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '696ae7df-5090-4786-8269-93201d9a7fa4'),
(141, NULL, 'app', 'm190502_122019_store_default_user_group_uid', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '2021-10-08 15:13:04', 'ea675460-3274-4acc-a34b-971244e99854'),
(142, NULL, 'app', 'm190504_150349_preview_targets', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '73819b6b-782f-43c1-be86-1e2c8c36b7e1'),
(143, NULL, 'app', 'm190516_184711_job_progress_label', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '330cbd13-3fee-4c5c-8c7a-c1f79548f690'),
(144, NULL, 'app', 'm190523_190303_optional_revision_creators', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '2021-10-08 15:13:04', 'd757a7ac-3b99-494e-8a39-a58dfc89e0ea'),
(145, NULL, 'app', 'm190529_204501_fix_duplicate_uids', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '71dece8a-b6f6-4706-a49e-23c63c9150af'),
(146, NULL, 'app', 'm190605_223807_unsaved_drafts', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '731ed40c-ae4b-4d70-a604-aee22f99e192'),
(147, NULL, 'app', 'm190607_230042_entry_revision_error_tables', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '2021-10-08 15:13:04', 'a679b285-95e8-41b0-87aa-cd88484cd0cd'),
(148, NULL, 'app', 'm190608_033429_drop_elements_uid_idx', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '2021-10-08 15:13:04', 'ebd58412-8a0b-4b35-920d-63cc4cfdf902'),
(149, NULL, 'app', 'm190617_164400_add_gqlschemas_table', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '2021-10-08 15:13:04', 'eca965c6-d55a-4dd4-8afd-9f9aed4d3325'),
(150, NULL, 'app', 'm190624_234204_matrix_propagation_method', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '2021-10-08 15:13:04', 'a1f270ae-4514-4294-9781-61e774c21d78'),
(151, NULL, 'app', 'm190711_153020_drop_snapshots', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '8bf06ca7-6518-4af7-961e-2a9c0edd5c2d'),
(152, NULL, 'app', 'm190712_195914_no_draft_revisions', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '1cb9eadd-7b53-4622-8697-d5d67ff582e5'),
(153, NULL, 'app', 'm190723_140314_fix_preview_targets_column', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '64c9ab6a-1a12-41de-a1d3-c98e71d5057b'),
(154, NULL, 'app', 'm190820_003519_flush_compiled_templates', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '945196a5-bbe2-4162-8aba-d8391b0fb7c3'),
(155, NULL, 'app', 'm190823_020339_optional_draft_creators', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '2021-10-08 15:13:04', '8cbcb62c-e782-4526-8641-f0c360fcf218'),
(156, 1, 'plugin', 'm180430_204710_remove_old_plugins', '2021-10-30 08:36:31', '2021-10-30 08:36:31', '2021-10-30 08:36:31', 'fa304be5-6511-4495-916a-6f565f3eb819'),
(157, 1, 'plugin', 'Install', '2021-10-30 08:36:31', '2021-10-30 08:36:31', '2021-10-30 08:36:31', 'c3246611-cb87-45de-ae82-63c4d188f99a'),
(158, 1, 'plugin', 'm190225_003922_split_cleanup_html_settings', '2021-10-30 08:36:31', '2021-10-30 08:36:31', '2021-10-30 08:36:31', 'f981f80f-de62-4221-b031-7a0f397c2e3e');

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
(1, 'redactor', '2.4.0', '2.3.0', 'unknown', NULL, '2021-10-30 08:36:31', '2021-10-30 08:36:31', '2021-11-01 06:32:33', '274b466e-1147-46a7-8fdd-1eda366868cc');

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
(2, 5, 24, NULL, 23, 1, '2021-10-30 12:22:39', '2021-10-30 12:22:39', '0ace6b32-be40-4614-b24f-6c3e6346b657'),
(6, 5, 29, NULL, 25, 1, '2021-10-30 13:23:46', '2021-10-30 13:23:46', 'e0905a06-2102-498e-882d-9dfcbb67c957'),
(8, 5, 50, NULL, 25, 1, '2021-10-31 10:07:50', '2021-10-31 10:07:50', '97c8641e-8ff7-47fe-a938-9588f320be79'),
(10, 5, 51, NULL, 23, 1, '2021-10-31 10:09:08', '2021-10-31 10:09:08', '5b5b2b86-8e2a-4382-bb30-6e23bde5f37b'),
(12, 5, 52, NULL, 25, 1, '2021-10-31 10:38:17', '2021-10-31 10:38:17', '154c5f71-9a1f-4527-90a1-d22bd473165c'),
(13, 11, 67, NULL, 23, 1, '2021-10-31 12:31:17', '2021-10-31 12:31:17', 'c7fd00f0-e973-455e-93ae-832539fc9bb4'),
(14, 11, 69, NULL, 23, 1, '2021-10-31 12:31:21', '2021-10-31 12:31:21', '8682cb0a-e9c9-4512-a618-60170e036e30'),
(15, 11, 71, NULL, 23, 1, '2021-10-31 12:31:25', '2021-10-31 12:31:25', '8dc22e8b-16b4-4c26-a379-db983ca8eeae'),
(16, 11, 73, NULL, 23, 1, '2021-10-31 12:31:34', '2021-10-31 12:31:34', '5fdb29c9-19e5-4277-962a-9dd2db45106d'),
(17, 11, 75, NULL, 23, 1, '2021-10-31 12:31:36', '2021-10-31 12:31:36', '4f6f9339-45eb-43dd-bf66-eeedf25a7d15'),
(18, 11, 78, NULL, 23, 1, '2021-10-31 12:31:46', '2021-10-31 12:31:46', '9bbfdcb5-39b7-42f8-bce5-30012610f01e'),
(19, 11, 81, NULL, 23, 1, '2021-10-31 12:31:58', '2021-10-31 12:31:58', 'e1cbf7a2-b51e-48d8-863b-fbc8db171827'),
(20, 11, 84, NULL, 23, 1, '2021-10-31 12:31:59', '2021-10-31 12:31:59', 'a7a003f4-90f6-4846-a4cb-e4c436570fcf'),
(21, 11, 87, NULL, 23, 1, '2021-10-31 12:32:07', '2021-10-31 12:32:07', '611570c0-7b95-42b5-acfa-792f7d6a8a32'),
(22, 11, 90, NULL, 23, 1, '2021-10-31 12:32:09', '2021-10-31 12:32:09', '422bee27-b419-4b9b-bc06-5027a54c7251'),
(23, 11, 93, NULL, 23, 1, '2021-10-31 12:32:12', '2021-10-31 12:32:12', 'c1c66faa-27eb-49b0-9373-9c9c89965bd3'),
(24, 11, 97, NULL, 23, 1, '2021-10-31 12:32:40', '2021-10-31 12:32:40', '3c94e6c5-4a29-4cc0-bcba-cf23d278fc32'),
(25, 11, 101, NULL, 23, 1, '2021-10-31 12:32:44', '2021-10-31 12:32:44', 'f883c2aa-681e-4a66-b1b6-d303f6214802'),
(26, 11, 105, NULL, 23, 1, '2021-10-31 12:32:49', '2021-10-31 12:32:49', 'f956e083-81f9-47f1-9a13-5a5ec6bbed52'),
(27, 11, 109, NULL, 23, 1, '2021-10-31 12:32:51', '2021-10-31 12:32:51', 'f0ccfb55-2596-4946-95f7-1d30edb48458'),
(28, 11, 113, NULL, 23, 1, '2021-10-31 12:32:52', '2021-10-31 12:32:52', '430c9dcf-5cb4-4662-9e5f-67b05ff81c81'),
(29, 11, 117, NULL, 23, 1, '2021-10-31 12:32:54', '2021-10-31 12:32:54', '4800ac51-4bb5-486e-8fb3-b0cac9e77417'),
(30, 11, 121, NULL, 23, 1, '2021-10-31 12:32:57', '2021-10-31 12:32:57', '04aed554-1b75-46cb-a93a-470226fc5fca'),
(31, 11, 125, NULL, 23, 1, '2021-10-31 12:33:15', '2021-10-31 12:33:15', '1580fb2e-722a-43c0-8b0a-538144d5ebbb'),
(32, 11, 129, NULL, 23, 1, '2021-10-31 12:33:27', '2021-10-31 12:33:27', '2085482e-d79a-4539-8fc2-79d86f464eae'),
(33, 11, 134, NULL, 23, 1, '2021-10-31 12:33:32', '2021-10-31 12:33:32', 'c8292219-638a-48d3-b30d-d7ff2c4a0b34'),
(34, 11, 139, NULL, 23, 1, '2021-10-31 12:33:34', '2021-10-31 12:33:34', '9cc04af9-04b3-45a5-849f-cc65dc5e8ee2'),
(35, 11, 144, NULL, 23, 1, '2021-10-31 12:33:41', '2021-10-31 12:33:41', '7113527e-3cde-4ef4-8f02-4b8b1dff6a82'),
(36, 11, 149, NULL, 23, 1, '2021-10-31 12:33:44', '2021-10-31 12:33:44', '78de5764-4c6d-4199-833e-e7b60a223fa5'),
(37, 11, 154, NULL, 23, 1, '2021-10-31 12:33:47', '2021-10-31 12:33:47', '64ff7872-365d-4b11-96a4-63cee1c66fea'),
(38, 11, 159, NULL, 23, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '1348f1d9-ee15-4837-9b30-73fe0ef17b71'),
(39, 11, 164, NULL, 23, 1, '2021-10-31 12:33:53', '2021-10-31 12:33:53', '7f5a0f9f-86ed-4711-ba75-6bc9adecbc7b'),
(40, 11, 169, NULL, 23, 1, '2021-10-31 12:33:55', '2021-10-31 12:33:55', '55345142-c74a-4566-bdb9-280927a7a52f'),
(41, 11, 174, NULL, 23, 1, '2021-10-31 12:33:57', '2021-10-31 12:33:57', '5064a048-cd04-4b95-9a86-c60b4f9f60de'),
(42, 11, 179, NULL, 23, 1, '2021-10-31 12:33:58', '2021-10-31 12:33:58', 'bbdd0a19-f06b-4c82-9791-6caad4d15e5d'),
(43, 11, 184, NULL, 23, 1, '2021-10-31 12:34:03', '2021-10-31 12:34:03', '0a9c3b57-c799-4606-875d-cd1a02d707fb'),
(44, 11, 189, NULL, 23, 1, '2021-10-31 12:34:10', '2021-10-31 12:34:10', '960e271a-69fe-410d-802d-efd397e48aff'),
(45, 11, 195, NULL, 23, 1, '2021-10-31 12:34:16', '2021-10-31 12:34:16', '7050f995-42e1-48ae-a35e-1cce7cce2634'),
(46, 11, 201, NULL, 23, 1, '2021-10-31 12:34:19', '2021-10-31 12:34:19', '9267aea6-2565-4d28-8cec-84324ce57d0b'),
(47, 11, 207, NULL, 23, 1, '2021-10-31 12:34:21', '2021-10-31 12:34:21', '93524ef8-7e8f-476f-966e-ab777d59e777'),
(48, 11, 213, NULL, 23, 1, '2021-10-31 12:34:23', '2021-10-31 12:34:23', '8a0c47b7-f8ae-4981-ba46-57d389083e4c'),
(49, 11, 219, NULL, 23, 1, '2021-10-31 12:34:24', '2021-10-31 12:34:24', 'f9a359be-7e4b-4846-9a6a-f004b81db87f'),
(50, 11, 225, NULL, 23, 1, '2021-10-31 12:34:29', '2021-10-31 12:34:29', 'e2a2a654-3321-4ceb-81df-79d3dd9b996f'),
(51, 11, 231, NULL, 23, 1, '2021-10-31 12:34:31', '2021-10-31 12:34:31', '8cc87194-550a-4629-81c0-7fae4474b41f'),
(52, 11, 237, NULL, 23, 1, '2021-10-31 12:34:34', '2021-10-31 12:34:34', '01b7e08b-c3db-435d-b072-ce128cbfc955'),
(53, 11, 243, NULL, 23, 1, '2021-10-31 12:34:35', '2021-10-31 12:34:35', 'abc7c874-58b5-4604-934e-d958ff28fb17'),
(54, 11, 249, NULL, 23, 1, '2021-10-31 12:34:36', '2021-10-31 12:34:36', 'dbc45fd6-e39c-4e1a-a375-351b68cd4aa7'),
(55, 11, 255, NULL, 23, 1, '2021-10-31 12:34:42', '2021-10-31 12:34:42', '0f85716a-faa4-4d9a-9f8e-1ea1c7ec797b'),
(56, 11, 261, NULL, 23, 1, '2021-10-31 12:34:47', '2021-10-31 12:34:47', 'e80ab3f2-4c9d-4662-8029-1ef75997147e'),
(57, 11, 267, NULL, 23, 1, '2021-10-31 12:34:49', '2021-10-31 12:34:49', '4e931b03-0a3e-414f-b199-7f4711c0b293'),
(58, 11, 273, NULL, 23, 1, '2021-10-31 12:34:56', '2021-10-31 12:34:56', '9cad07e5-1c1f-4e20-98ad-39a50647e329'),
(59, 11, 280, NULL, 23, 1, '2021-10-31 12:35:04', '2021-10-31 12:35:04', 'bf10e600-27fa-49c9-9c72-20c011703cf4'),
(60, 11, 285, NULL, 23, 1, '2021-10-31 12:35:04', '2021-10-31 12:35:04', 'dafe3608-df3f-4cc8-a110-09b62d45abe7'),
(61, 11, 287, NULL, 23, 1, '2021-10-31 12:35:09', '2021-10-31 12:35:09', 'b18e9b7e-6270-4de1-8460-163aa05995bd'),
(62, 11, 292, NULL, 23, 1, '2021-10-31 12:35:09', '2021-10-31 12:35:09', '329f7f78-50a1-418e-bd04-c943ba12f8ee'),
(63, 11, 294, NULL, 23, 1, '2021-10-31 12:35:12', '2021-10-31 12:35:12', '306eee4a-a7bb-4ddf-be69-d41796920298'),
(64, 11, 299, NULL, 23, 1, '2021-10-31 12:35:12', '2021-10-31 12:35:12', '463239dc-41f5-4461-8afb-e615fdfb1edf'),
(65, 11, 301, NULL, 23, 1, '2021-10-31 12:35:15', '2021-10-31 12:35:15', '3f453634-8221-4117-b592-5235492e7f41'),
(66, 11, 306, NULL, 23, 1, '2021-10-31 12:35:15', '2021-10-31 12:35:15', 'e6cda5a7-7e27-46e9-9bc9-eeeb0a0fddef'),
(67, 11, 309, NULL, 23, 1, '2021-10-31 12:35:18', '2021-10-31 12:35:18', 'b52c1225-337c-4969-b6fc-64502fbc9a8a'),
(68, 11, 314, NULL, 23, 1, '2021-10-31 12:35:18', '2021-10-31 12:35:18', 'c54c38f5-fe0b-4b17-8099-1634801bb8c9'),
(69, 11, 317, NULL, 23, 1, '2021-10-31 12:35:19', '2021-10-31 12:35:19', '3072a551-8308-4014-b21c-9ad5d3b4bf32'),
(70, 11, 322, NULL, 23, 1, '2021-10-31 12:35:19', '2021-10-31 12:35:19', '30a466ff-f646-45cf-a74f-edb2050f31e5'),
(71, 11, 325, NULL, 23, 1, '2021-10-31 12:35:25', '2021-10-31 12:35:25', '4f989b19-6e58-4ea1-8c61-af552ec99548'),
(72, 11, 330, NULL, 23, 1, '2021-10-31 12:35:25', '2021-10-31 12:35:25', '8daca1d4-c36d-4468-be05-e34c63031049'),
(73, 11, 333, NULL, 23, 1, '2021-10-31 12:35:28', '2021-10-31 12:35:28', '8bd22e74-afa8-48eb-8ff1-3fbe38b56221'),
(74, 11, 338, NULL, 23, 1, '2021-10-31 12:35:28', '2021-10-31 12:35:28', 'e49d4b5c-39c6-45ef-949e-f80fbe0bdc81'),
(75, 11, 341, NULL, 23, 1, '2021-10-31 12:35:31', '2021-10-31 12:35:31', '829f521b-afca-4064-9ab1-5895d4ca5a8c'),
(76, 11, 346, NULL, 23, 1, '2021-10-31 12:35:31', '2021-10-31 12:35:31', 'a5605470-0a09-4d53-9a12-c5b3d73d7c3e'),
(77, 11, 349, NULL, 23, 1, '2021-10-31 12:35:32', '2021-10-31 12:35:32', '88bae94b-db44-4dec-956e-9e058904ff4c'),
(78, 11, 354, NULL, 23, 1, '2021-10-31 12:35:32', '2021-10-31 12:35:32', 'bbc51412-bf16-44f7-b53c-afc05be2fff3'),
(79, 11, 357, NULL, 23, 1, '2021-10-31 12:35:34', '2021-10-31 12:35:34', '0a814e01-4f6d-4cf7-9f16-8d3709ad9885'),
(80, 11, 362, NULL, 23, 1, '2021-10-31 12:35:34', '2021-10-31 12:35:34', 'c1a16ff5-64de-46d6-9959-278e8a3cbcd9'),
(81, 11, 365, NULL, 23, 1, '2021-10-31 12:35:38', '2021-10-31 12:35:38', 'b4c4990c-7137-4f5b-882e-ad31d7af14ee'),
(82, 11, 370, NULL, 23, 1, '2021-10-31 12:35:38', '2021-10-31 12:35:38', '8dabb602-c387-48f5-885e-f504193da0cf'),
(83, 11, 373, NULL, 23, 1, '2021-10-31 12:35:56', '2021-10-31 12:35:56', 'ea8c8294-a1ba-467f-a79e-46c1b5952119'),
(84, 11, 379, NULL, 23, 1, '2021-10-31 12:35:56', '2021-10-31 12:35:56', 'ef36f051-22b9-4f42-ad09-f75c2de3ee53'),
(85, 11, 381, NULL, 23, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', 'faaa76f1-764c-41fb-889e-e64c7ad34c40'),
(86, 11, 388, NULL, 23, 1, '2021-10-31 12:36:57', '2021-10-31 12:36:57', '3528492f-47cd-40e2-9200-cb273b9ff02e'),
(87, 11, 390, NULL, 23, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '0262b94e-22a9-46e0-af0c-8d8f641dcee1'),
(88, 11, 397, NULL, 23, 1, '2021-10-31 12:37:03', '2021-10-31 12:37:03', '083cc298-c334-4dba-8b5d-f21a09fc81d5'),
(89, 11, 399, NULL, 23, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '95ebdffe-a788-4969-af5b-b6494c513e1c'),
(90, 11, 406, NULL, 23, 1, '2021-10-31 12:37:12', '2021-10-31 12:37:12', '62e65cd7-2874-40bd-b638-bbad559e79b6'),
(91, 11, 408, NULL, 23, 1, '2021-10-31 12:37:15', '2021-10-31 12:37:15', 'bfbff520-8e0a-4084-8fee-d0c1e219fbbc'),
(92, 11, 415, NULL, 23, 1, '2021-10-31 12:37:15', '2021-10-31 12:37:15', '1bd08948-f63d-48e6-9981-a4cb10847118'),
(93, 11, 417, NULL, 23, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '99cbf8ba-cbdd-4f5d-897d-553ea2fdabc6'),
(94, 11, 424, NULL, 23, 1, '2021-10-31 12:37:22', '2021-10-31 12:37:22', '3c7e34fe-e9e7-4e0f-94b7-91a7372ee8dd'),
(97, 11, 436, NULL, 23, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '2e5cc541-0899-4360-b2c7-a68e71230956'),
(98, 11, 443, NULL, 23, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'fcfc35a5-8402-457b-8b75-90d2085be117'),
(99, 11, 446, NULL, 23, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', '2f810ae9-62fc-49fd-a898-8c95d851589c'),
(100, 11, 453, NULL, 23, 1, '2021-10-31 12:37:44', '2021-10-31 12:37:44', 'dda64eea-46fe-4e10-b697-525f0212dbdf'),
(113, 11, 475, NULL, 23, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', '17bad9a9-4cfe-4eb5-b362-65a30984284f'),
(114, 11, 482, NULL, 23, 1, '2021-10-31 14:01:40', '2021-10-31 14:01:40', 'c2f4dc21-a2f9-4cc1-b018-4c1c0c078a69'),
(117, 11, 485, NULL, 23, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', '2cf6451f-ff39-48ca-b0b2-d6155507165f'),
(118, 11, 492, NULL, 23, 1, '2021-10-31 16:02:15', '2021-10-31 16:02:15', 'c4bcecb6-fb28-4074-8f8a-31e0d80b4562'),
(121, 11, 495, NULL, 23, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', 'ec7d4730-c4ad-4279-9612-b4724a3eb6c1'),
(122, 11, 502, NULL, 23, 1, '2021-10-31 16:03:14', '2021-10-31 16:03:14', '6508b3e0-8d6f-4fe4-a824-a82fa0daa5d6'),
(126, 19, 504, NULL, 503, 1, '2021-10-31 16:17:14', '2021-10-31 16:17:14', '28424290-152e-42a1-8358-b03364bee1c6'),
(127, 11, 506, NULL, 23, 1, '2021-10-31 16:17:15', '2021-10-31 16:17:15', '8761281b-b666-42ea-9ccc-430337e17064'),
(128, 11, 513, NULL, 23, 1, '2021-10-31 16:17:15', '2021-10-31 16:17:15', '229b07cd-864a-4cae-9834-7f063041e205'),
(131, 19, 514, NULL, 503, 1, '2021-10-31 16:18:54', '2021-10-31 16:18:54', '447ac178-1a54-4c81-8032-ea0a51fe125c'),
(132, 5, 514, NULL, 23, 1, '2021-10-31 16:18:54', '2021-10-31 16:18:54', '27d73001-3160-4d0c-b62c-052919316ffc'),
(133, 19, 434, NULL, 503, 1, '2021-10-31 16:23:20', '2021-10-31 16:23:20', 'a848b438-83eb-483a-a088-ea770b5aac1d'),
(134, 11, 465, NULL, 23, 1, '2021-10-31 16:23:20', '2021-10-31 16:23:20', '987bc599-cc8c-44b4-91fe-d5b34fc236be'),
(135, 11, 472, NULL, 23, 1, '2021-10-31 16:23:20', '2021-10-31 16:23:20', '007531bf-bba7-4978-9210-1795ab07c3a5'),
(136, 19, 515, NULL, 503, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', 'd5ce79a4-bf54-4017-8faf-493f6272014f'),
(137, 11, 517, NULL, 23, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', '1c6504db-2d6b-46f3-9f71-c5a95ac2879a'),
(138, 11, 524, NULL, 23, 1, '2021-10-31 16:23:21', '2021-10-31 16:23:21', 'b386bf5c-5501-4c53-a334-5f9d30882f63'),
(141, 19, 525, NULL, 503, 1, '2021-11-01 06:45:04', '2021-11-01 06:45:04', '9a547047-49df-45ac-9e12-dcb44ceadf71'),
(142, 5, 525, NULL, 23, 1, '2021-11-01 06:45:04', '2021-11-01 06:45:04', '0e715352-be1a-4a40-a584-b3fd41907783'),
(145, 19, 526, NULL, 503, 1, '2021-11-01 06:55:51', '2021-11-01 06:55:51', 'd2b15f19-9c00-4218-9a0b-c6be2681d407'),
(146, 5, 526, NULL, 25, 1, '2021-11-01 06:55:51', '2021-11-01 06:55:51', 'ebf20779-c224-43ad-8970-255f75fcda80'),
(147, 19, 528, NULL, 527, 1, '2021-11-01 07:49:07', '2021-11-01 07:49:07', '788955eb-cd9a-43ff-a2a4-d75ab0a1d512'),
(148, 19, 530, NULL, 527, 1, '2021-11-01 07:49:07', '2021-11-01 07:49:07', '6df73298-e274-4664-bc7f-405e9b38f9e9'),
(149, 19, 28, NULL, 503, 1, '2021-11-01 07:49:20', '2021-11-01 07:49:20', '3c96ae18-63c8-44d0-9122-c7192626a78f'),
(150, 5, 28, NULL, 25, 1, '2021-11-01 07:49:20', '2021-11-01 07:49:20', '9f41a633-85f2-4be8-b124-e25f69104cd6'),
(151, 20, 28, NULL, 528, 1, '2021-11-01 07:49:20', '2021-11-01 07:49:20', '0f0a9ab7-16c5-4225-940d-c81ec721e8f3'),
(152, 19, 532, NULL, 503, 1, '2021-11-01 07:49:20', '2021-11-01 07:49:20', '0ca778a7-a4ba-4680-a838-0946394a2038'),
(153, 5, 532, NULL, 25, 1, '2021-11-01 07:49:20', '2021-11-01 07:49:20', '8cc1857c-c830-4dd5-ab29-8d5a0663dc46'),
(154, 20, 532, NULL, 528, 1, '2021-11-01 07:49:20', '2021-11-01 07:49:20', 'e5b832fa-04c3-40bf-b4bf-7030cdec4068'),
(155, 19, 8, NULL, 503, 1, '2021-11-01 07:49:38', '2021-11-01 07:49:38', '32e3bb1c-a1f1-474e-8c96-11ad56c1daf8'),
(156, 5, 8, NULL, 23, 1, '2021-11-01 07:49:38', '2021-11-01 07:49:38', '06c34cbc-6d04-428f-aa4e-ca4ffb8b8125'),
(157, 20, 8, NULL, 434, 1, '2021-11-01 07:49:38', '2021-11-01 07:49:38', '7956e59e-b7f4-4549-b7de-ccf5951b07d7'),
(158, 19, 533, NULL, 503, 1, '2021-11-01 07:49:38', '2021-11-01 07:49:38', 'b3674617-a403-4a4e-a51d-7ec25cc12d4e'),
(159, 5, 533, NULL, 23, 1, '2021-11-01 07:49:38', '2021-11-01 07:49:38', 'cf44be02-60e3-4ec4-82e9-ce76f0498447'),
(160, 20, 533, NULL, 434, 1, '2021-11-01 07:49:39', '2021-11-01 07:49:39', '6c7b3cb8-602d-4cbd-974c-f36a4c58ff48');

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
('2f0e5fa8', '@craft/web/assets/editsection/dist'),
('2f3371d7', '@app/web/assets/updateswidget/dist'),
('3473f845', '@craft/web/assets/feed/dist'),
('347c1bfe', '@craft/web/assets/edittransform/dist'),
('36072cc', '@craft/web/assets/login/dist'),
('3769b20b', '@lib/jquery-ui'),
('393135b9', '@app/web/assets/installer/dist'),
('3b971dc6', '@app/web/assets/generalsettings/dist'),
('3c6a051f', '@vendor/craftcms/redactor/lib/redactor-plugins/fullscreen'),
('3f6623e8', '@app/web/assets/updater/dist'),
('44150be5', '@app/web/assets/matrixsettings/dist'),
('47df7526', '@lib/element-resize-detector'),
('4d30de8e', '@craft/web/assets/dashboard/dist'),
('50651f2b', '@lib'),
('52fa3de2', '@craft/web/assets/matrixsettings/dist'),
('5637ddfd', '@craft/web/assets/edituser/dist'),
('61cc6865', '@craft/web/assets/editcategory/dist'),
('65e78646', '@lib/jquery.payment'),
('679538fa', '@app/web/assets/tablesettings/dist'),
('684fded3', '@bower/jquery/dist'),
('6d961c8e', '@craft/web/assets/editentry/dist'),
('6ebf56a5', '@app/web/assets/utilities/dist'),
('72b33072', '@craft/web/assets/deprecationerrors/dist'),
('74e181d8', '@craft/web/assets/updates/dist'),
('75df5f8a', '@app/web/assets/feed/dist'),
('79c029ae', '@lib/velocity'),
('81bab86f', '@vendor/craftcms/redactor/lib/redactor'),
('8508d32f', '@lib/timepicker'),
('873ddc53', '@app/web/assets/editsection/dist'),
('8d02176b', '@app/web/assets/plugins/dist'),
('8fa014a', '@app/web/assets/login/dist'),
('92707166', '@craft/web/assets/recententries/dist'),
('a747eaab', '@app/web/assets/edituser/dist'),
('b09bcfd0', '@lib/selectize'),
('b3ffff9', '@vendor/craftcms/redactor/lib/redactor-plugins/video'),
('b66c501', '@craft/web/assets/craftsupport/dist'),
('b6b4ea99', '@craft/web/assets/cp/dist'),
('baf78b5a', '@lib/xregexp'),
('bfcfdae4', '@craft/web/assets/pluginstore/dist'),
('c8ae7436', '@app/web/assets/fields/dist'),
('cc41434', '@app/web/assets/cp/dist'),
('cc7ec850', '@craft/web/assets/fields/dist'),
('ccbb01bd', '@lib/fabric'),
('ce55487d', '@app/web/assets/deprecationerrors/dist'),
('ce7523de', '@yii/debug/assets'),
('cfc95a78', '@app/web/assets/dashboard/dist'),
('d0349509', '@app/web/assets/updates/dist'),
('d32f0677', '@vendor/yiisoft/yii2/assets'),
('d9fdd583', '@lib/garnishjs'),
('e1c7d41f', '@lib/prismjs'),
('e341de96', '@lib/jquery-touch-events'),
('e46c7a25', '@craft/web/assets/tablesettings/dist'),
('e49d062a', '@craft/web/assets/matrix/dist'),
('e4e5e254', '@lib/picturefill'),
('ea40c205', '@lib/d3'),
('ec46d253', '@craft/web/assets/utilities/dist'),
('ef6f9878', '@app/web/assets/editentry/dist'),
('f081d55b', '@app/web/assets/dbbackup/dist'),
('fc0de3aa', '@lib/fileupload'),
('fce025ef', '@craft/redactor/assets/field/dist');

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
(1, 8, 1, 1, NULL),
(2, 13, 1, 1, NULL),
(3, 15, 1, 1, NULL),
(4, 15, 1, 2, NULL),
(5, 15, 1, 3, NULL),
(6, 15, 1, 4, NULL),
(7, 8, 1, 2, NULL),
(8, 28, 1, 1, NULL),
(9, 32, 1, 1, NULL),
(10, 35, 1, 1, NULL),
(11, 38, 1, 1, NULL),
(12, 41, 1, 1, NULL),
(13, 32, 1, 2, NULL),
(14, 15, 1, 5, NULL),
(15, 15, 1, 6, NULL),
(16, 15, 1, 7, NULL),
(17, 15, 1, 8, NULL),
(18, 15, 1, 9, NULL),
(19, 28, 1, 2, NULL),
(20, 8, 1, 3, NULL),
(21, 28, 1, 3, NULL),
(22, 54, 1, 1, NULL),
(23, 35, 1, 2, NULL),
(24, 38, 1, 2, NULL),
(25, 434, 1, 1, NULL),
(26, 434, 1, 2, 'Applied “Draft 1”'),
(27, 434, 1, 3, NULL),
(28, 434, 1, 4, NULL),
(29, 434, 1, 5, NULL),
(30, 8, 1, 4, NULL),
(31, 434, 1, 6, NULL),
(32, 8, 1, 5, NULL),
(33, 28, 1, 4, NULL),
(34, 528, 1, 1, NULL),
(35, 28, 1, 5, NULL),
(36, 8, 1, 6, NULL);

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
(1, 'email', 0, 1, ' s4jj4n gmail com '),
(1, 'slug', 0, 1, ''),
(8, 'slug', 0, 1, ' espresso '),
(8, 'field', 1, 1, ' the best shot you ve ever had '),
(8, 'field', 2, 1, ' craftquest is a comprehensive learning resource with unlimited access to video training to help you with your current and future projects updated weekly with new tutorials on modern web development we help you track your progress on courses lessons and quests resume a video right where you left off keep track of your progress on your personalized dashboard craftquest can help you skill up for a new job or learn the skills to finish an important project we are always here with new content every week to help you reach your goals we help you track your progress on courses lessons and quests resume a video right where you left off keep track of your progress on your personalized dashboard we help you track your progress on courses lessons and quests resume a video right where you left off keep track of your progress on your personalized dashboard we help you track your progress on courses lessons and quests resume a video right where you left off keep track of your progress on your personalized dashboard '),
(13, 'slug', 0, 1, ' new coffee coming soon '),
(13, 'title', 0, 1, ' new coffee coming soon '),
(13, 'field', 3, 1, ' check out the new coffee style coming to crafty coffee '),
(13, 'field', 4, 1, ' redactor fields use html purifier to ensure that no malicious code makes it into its field values to prevent xss attacks and other vulnerabilities you can create custom html purifier configs that will be available to your redactor fields they should be created as json files in your config htmlpurifier folder copy default json as a starting point which is the default config that redactor fields use if no custom html purifier config is selected see the html purifier documentation for a list of available config optio '),
(15, 'slug', 0, 1, ' homepage '),
(15, 'title', 0, 1, ' crafty coffee '),
(15, 'field', 1, 1, ''),
(15, 'field', 3, 1, ''),
(15, 'field', 2, 1, ''),
(22, 'filename', 0, 1, ' boy 6398465_1920 jpg '),
(22, 'extension', 0, 1, ' jpg '),
(22, 'kind', 0, 1, ' image '),
(22, 'slug', 0, 1, ''),
(22, 'title', 0, 1, ' boy 6398465 1920 '),
(23, 'filename', 0, 1, ' espresso shot jpg '),
(23, 'extension', 0, 1, ' jpg '),
(23, 'kind', 0, 1, ' image '),
(23, 'slug', 0, 1, ''),
(23, 'title', 0, 1, ' espresso shot '),
(8, 'field', 5, 1, ' espresso shot '),
(25, 'filename', 0, 1, ' iced coffee jpg '),
(25, 'extension', 0, 1, ' jpg '),
(25, 'kind', 0, 1, ' image '),
(25, 'slug', 0, 1, ''),
(25, 'title', 0, 1, ' iced coffee '),
(28, 'slug', 0, 1, ' iced coffee '),
(28, 'title', 0, 1, ' iced espresso '),
(28, 'field', 5, 1, ' iced coffee '),
(32, 'slug', 0, 1, ' about '),
(32, 'title', 0, 1, ' about '),
(35, 'slug', 0, 1, ' locations '),
(35, 'title', 0, 1, ' locations '),
(38, 'slug', 0, 1, ' austin tx '),
(38, 'title', 0, 1, ' austin tx '),
(41, 'slug', 0, 1, ' mission statement '),
(41, 'title', 0, 1, ' mission statement '),
(32, 'field', 6, 1, ' this is a subtitle '),
(32, 'field', 1, 1, ''),
(32, 'field', 2, 1, ' this is the page copy '),
(35, 'field', 6, 1, ' location sub '),
(35, 'field', 1, 1, ''),
(35, 'field', 2, 1, ' lorem loc '),
(38, 'field', 6, 1, ' live music capitol of the world '),
(38, 'field', 1, 1, ''),
(38, 'field', 2, 1, ' page copy '),
(41, 'field', 6, 1, ''),
(41, 'field', 1, 1, ''),
(41, 'field', 2, 1, ''),
(32, 'field', 7, 1, ' this is a page intro '),
(15, 'field', 6, 1, ' if we wrote it down you can make it at home '),
(28, 'field', 1, 1, ' news article lede or summary '),
(28, 'field', 2, 1, ' contrary to popular belief lorem ipsum is not simply random text it has roots in a piece of classical latin literature from 45 bc making it over 2000 years old richard mcclintock a latin professor at hampden sydney college in virginia looked up one of the more obscure latin words consectetur from a lorem ipsum passage and going through the cites of the word in classical literature discovered the undoubtable source lorem ipsum comes from sections 1 10 32 and 1 10 33 of de finibus bonorum et malorum the extremes of good and evil by cicero written in 45 bc this book is a treatise on the theory of ethics very popular during the renaissance the first line of lorem ipsum lorem ipsum dolor sit amet comes from a line in section 1 10 32 the standard chunk of lorem ipsum used since the 1500s is reproduced below for those interested sections 1 10 32 and 1 10 33 from de finibus bonorum et malorum by cicero are also reproduced in their exact original form accompanied by english versions from the 1914 translation by h rackham '),
(8, 'title', 0, 1, ' perfect espresso '),
(28, 'field', 8, 1, ''),
(54, 'slug', 0, 1, ' acquired by starbucks '),
(54, 'title', 0, 1, ' acquired by starbucks '),
(54, 'field', 3, 1, ' this is amazing '),
(54, 'field', 4, 1, ' contrary to popular belief lorem ipsum is not simply random text it has roots in a piece of classical latin literature from 45 bc making it over 2000 years old richard mcclintock a latin professor at hampden sydney college in virginia looked up one of the more obscure latin words consectetur from a lorem ipsum passage and going through the cites of the word in classical literature discovered the undoubtable source lorem ipsum comes from sections 1 10 32 and 1 10 33 of de finibus bonorum et malorum the extremes of good and evil by cicero written in 45 bc this book is a treatise on the theory of ethics very popular during the renaissance the first line of lorem ipsum lorem ipsum dolor sit amet comes from a line in section 1 10 32 the standard chunk of lorem ipsum used since the 1500s is reproduced below for those interested sections 1 10 32 and 1 10 33 from de finibus bonorum et malorum by cicero are also reproduced in their exact original form accompanied by english versions from the 1914 translation by h rackham '),
(35, 'field', 7, 1, ' loc page intro '),
(38, 'field', 7, 1, ' page intro '),
(434, 'slug', 0, 1, ' perfect espresso '),
(434, 'title', 0, 1, ' perfect espresso '),
(434, 'field', 9, 1, ' this is the initial page copy espresso shot the perfect espresso time to drink be careful with the water temperature it s important that the water is hot enough but not too hot contrary to popular belief lorem ipsum is not simply random text it has roots in a piece of classical latin literature from 45 bc making it over 2000 years old richard mcclintock a latin professor at hampden sydney college in virginia looked up one of the more obscure latin words consectetur from a lorem ipsum passage and going through the cites of the word in classical literature discovered the undoubtable source lorem ipsum comes from sections 1 10 32 and 1 10 33 of de finibus bonorum et malorum the extremes of good and evil by cicero written in 45 bc this book is a treatise on the theory of ethics very popular during the renaissance the first line of lorem ipsum lorem ipsum dolor sit amet comes from a line in section 1 10 32 the standard chunk of lorem ipsum used since the 1500s is reproduced below for those interested sections 1 10 32 and 1 10 33 from de finibus bonorum et malorum by cicero are also reproduced in their exact original form accompanied by english versions from the 1914 translation by h rackham 22 grams ground coffee 22 grams ground coffee 4 oz hot water 4 oz hot water 1 espresso machine 1 espresso machine clean up the area clean up the area turn on espresso machine turn on espresso machine preparing your workspace instruction 1 instruction 1 instruction 2 instruction 2 grinding the coffee ge the best espresso machine you can affort it makes a difference espresso shot another of the same '),
(435, 'slug', 0, 1, ''),
(435, 'field', 13, 1, ' this is the initial page copy '),
(436, 'slug', 0, 1, ''),
(436, 'field', 11, 1, ' espresso shot '),
(436, 'field', 10, 1, ' the perfect espresso time to drink '),
(437, 'slug', 0, 1, ''),
(437, 'field', 12, 1, ' be careful with the water temperature it s important that the water is hot enough but not too hot '),
(438, 'slug', 0, 1, ''),
(438, 'field', 13, 1, ' contrary to popular belief lorem ipsum is not simply random text it has roots in a piece of classical latin literature from 45 bc making it over 2000 years old richard mcclintock a latin professor at hampden sydney college in virginia looked up one of the more obscure latin words consectetur from a lorem ipsum passage and going through the cites of the word in classical literature discovered the undoubtable source lorem ipsum comes from sections 1 10 32 and 1 10 33 of de finibus bonorum et malorum the extremes of good and evil by cicero written in 45 bc this book is a treatise on the theory of ethics very popular during the renaissance the first line of lorem ipsum lorem ipsum dolor sit amet comes from a line in section 1 10 32 the standard chunk of lorem ipsum used since the 1500s is reproduced below for those interested sections 1 10 32 and 1 10 33 from de finibus bonorum et malorum by cicero are also reproduced in their exact original form accompanied by english versions from the 1914 translation by h rackham '),
(439, 'slug', 0, 1, ''),
(439, 'field', 16, 1, ' 22 grams ground coffee 22 grams ground coffee 4 oz hot water 4 oz hot water 1 espresso machine 1 espresso machine '),
(440, 'slug', 0, 1, ''),
(440, 'field', 15, 1, ' preparing your workspace '),
(440, 'field', 14, 1, ' clean up the area clean up the area turn on espresso machine turn on espresso machine '),
(441, 'slug', 0, 1, ''),
(441, 'field', 15, 1, ' grinding the coffee '),
(441, 'field', 14, 1, ' instruction 1 instruction 1 instruction 2 instruction 2 '),
(442, 'slug', 0, 1, ''),
(442, 'field', 12, 1, ' ge the best espresso machine you can affort it makes a difference '),
(443, 'slug', 0, 1, ''),
(443, 'field', 11, 1, ' espresso shot '),
(443, 'field', 10, 1, ' another of the same '),
(464, 'slug', 0, 1, ''),
(464, 'field', 13, 1, ' this is the initial page copy '),
(465, 'slug', 0, 1, ''),
(465, 'field', 11, 1, ' espresso shot '),
(465, 'field', 10, 1, ' the perfect espresso time to drink '),
(466, 'slug', 0, 1, ''),
(466, 'field', 12, 1, ' be careful with the water temperature it s important that the water is hot enough but not too hot '),
(467, 'slug', 0, 1, ''),
(467, 'field', 13, 1, ' contrary to popular belief lorem ipsum is not simply random text it has roots in a piece of classical latin literature from 45 bc making it over 2000 years old richard mcclintock a latin professor at hampden sydney college in virginia looked up one of the more obscure latin words consectetur from a lorem ipsum passage and going through the cites of the word in classical literature discovered the undoubtable source lorem ipsum comes from sections 1 10 32 and 1 10 33 of de finibus bonorum et malorum the extremes of good and evil by cicero written in 45 bc this book is a treatise on the theory of ethics very popular during the renaissance the first line of lorem ipsum lorem ipsum dolor sit amet comes from a line in section 1 10 32 the standard chunk of lorem ipsum used since the 1500s is reproduced below for those interested sections 1 10 32 and 1 10 33 from de finibus bonorum et malorum by cicero are also reproduced in their exact original form accompanied by english versions from the 1914 translation by h rackham '),
(468, 'slug', 0, 1, ''),
(468, 'field', 16, 1, ' 22 grams ground coffee 22 grams ground coffee 4 oz hot water 4 oz hot water 1 espresso machine 1 espresso machine '),
(469, 'slug', 0, 1, ''),
(469, 'field', 15, 1, ' preparing your workspace '),
(469, 'field', 14, 1, ' clean up the area clean up the area turn on espresso machine turn on espresso machine '),
(470, 'slug', 0, 1, ''),
(470, 'field', 15, 1, ' grinding the coffee '),
(470, 'field', 14, 1, ' instruction 1 instruction 1 instruction 2 instruction 2 '),
(471, 'slug', 0, 1, ''),
(471, 'field', 12, 1, ' ge the best espresso machine you can affort it makes a difference '),
(472, 'slug', 0, 1, ''),
(472, 'field', 11, 1, ' espresso shot '),
(472, 'field', 10, 1, ' another of the same '),
(434, 'field', 17, 1, ' difficulty medium difficulty medium time required 10minutes time required 10minutes cost varies cost varies yield one double shot yield one double shot '),
(503, 'slug', 0, 1, ' espresso '),
(503, 'title', 0, 1, ' espresso '),
(503, 'field', 18, 1, ' all drinks made with the delicious espresso roasted bean and pressure brewed technique '),
(434, 'field', 19, 1, ' espresso '),
(8, 'field', 19, 1, ' espresso '),
(8, 'field', 8, 1, ''),
(28, 'field', 19, 1, ' espresso '),
(527, 'slug', 0, 1, ' iced drinks '),
(527, 'title', 0, 1, ' iced drinks '),
(527, 'field', 18, 1, ' iced drinks for hot days '),
(529, 'slug', 0, 1, ''),
(529, 'field', 13, 1, ' placeholder copy here '),
(528, 'slug', 0, 1, ' iced americano '),
(528, 'title', 0, 1, ' iced americano '),
(528, 'field', 19, 1, ' iced drinks '),
(528, 'field', 17, 1, ' difficulty intermediate difficulty intermediate time 15mins time 15mins '),
(528, 'field', 9, 1, ' placeholder copy here '),
(28, 'field', 20, 1, ' iced americano '),
(8, 'field', 20, 1, ' perfect espresso ');

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
(1, NULL, 'Drinks', 'drinks', 'channel', 1, 'all', NULL, '2021-10-30 07:05:00', '2021-11-01 07:46:44', NULL, 'd5a4185f-4eb7-4f6b-b6df-2b7fc400ec13'),
(2, NULL, 'News', 'news', 'channel', 1, 'all', NULL, '2021-10-30 08:43:28', '2021-10-30 08:57:13', NULL, '7761d4f2-acf8-408f-be7c-e8c61624d6c5'),
(3, NULL, 'Homepage', 'homepage', 'single', 1, 'all', NULL, '2021-10-30 09:02:53', '2021-10-30 15:33:36', NULL, '9f91c595-0193-4614-9988-9ce30da5ed90'),
(4, 1, 'About Crafty Coffee', 'aboutCraftyCoffee', 'structure', 1, 'all', NULL, '2021-10-30 13:29:25', '2021-10-30 14:27:21', NULL, 'dd3ea73f-da34-416e-98ce-e7e02e2a08f2'),
(5, NULL, 'Recipes', 'recipes', 'channel', 1, 'all', NULL, '2021-10-31 12:16:03', '2021-10-31 16:16:43', NULL, '655f7088-c858-4ec3-860d-716df652f038');

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
(1, 1, 1, 1, 'drinks/{slug}', 'drinks/_entry', 1, '2021-10-30 07:05:00', '2021-11-01 07:46:44', '43a730a1-0cb6-46cf-a80f-de1108ee7fbf'),
(2, 2, 1, 1, 'news/{slug}', 'news/_entry', 1, '2021-10-30 08:43:28', '2021-10-30 08:57:13', '70d78143-2d76-4368-a89e-77c9ba13a047'),
(3, 3, 1, 1, '__home__', 'index', 1, '2021-10-30 09:02:53', '2021-10-30 15:33:36', 'c46e77a9-91cc-4f2e-8eb8-f97d8c1a5966'),
(4, 4, 1, 1, '{parent.uri}/{slug}', 'about/_entry', 1, '2021-10-30 13:29:25', '2021-10-30 14:27:21', 'fb7a4c83-d5ae-4429-ac90-fc0f04f9c5c4'),
(5, 5, 1, 1, 'recipes/{slug}', 'recipes/_entry', 1, '2021-10-31 12:16:03', '2021-10-31 16:16:43', '0746e706-5c4e-489a-863d-0f0e9f5f8b7f');

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
(1, 1, '9FCxz4hdbL6wRT4XGNg1_sPJmhXESCq_Hjm8XVbyZNKdRFos4dtd5C97SfDBToxGAnuK7lfMRcW2Pqt72rqri6ReZ48XCrwmlW7v', '2021-10-11 10:28:26', '2021-10-11 11:02:55', '04bd192c-919b-45b7-aaf0-7e242d6be82d'),
(2, 1, 'VMbSYGWGcC4MZf6AkN0gc8FIXDfw6T_5gdRoTiV_cjNDnro7tKzTmCeMwOUYYieFlqEMyTWJtku_7h68elgk0jXFTVdwLvq-0uhG', '2021-10-11 12:02:56', '2021-10-11 13:02:49', 'f8cb056a-557b-46ec-84e0-09b1329038f7'),
(3, 1, 'EUaZKIzs1qRJawvzHP3aEh1F9ibjR81K64-ecqnzxLq0Ifa_Ypxq5Y0FE-Ue6Lrl_GcjLH-ijvLC9H_fmL6EBTqae2uUoZ6hWLZ4', '2021-10-11 14:02:50', '2021-10-11 14:02:50', 'e025a1e1-d692-40a4-9b7f-7704ae71e079'),
(4, 1, 'pmbax6B5IMAA9i9eBF9wKwWV-qhumdYQaav1UbgXqTYfQlT_aYcQzaz7sx_xyHiQizt2Z6W1ASb8xI12dybTLr6nidKhQIlqRyW-', '2021-10-11 15:02:51', '2021-10-11 15:02:51', '69a5d6a2-b45f-4b9f-8632-e953c2cbc281'),
(5, 1, 'Ws8q7v-SD-Hp41DL7zuZV2YQsDtvZJUyet8RnXhyD5P2m9L3ij0gc5Z_mlPAUWCAzKBQt7atkszktZ0J5ooiQBJ5p_AdOccVe0bK', '2021-10-18 05:12:56', '2021-10-18 05:13:08', 'd614e349-dc8c-48f8-9e04-6cc7508a8170'),
(6, 1, '6uCn3o4YStmcmMoVSzksuTf6sDx0ztSDjXK1NiD723B2l1y55dqj_K_ISJux7Fka1OInKqzmksjQxlOmTfwMnQmQ9eqcjUBG2aR4', '2021-10-18 06:13:09', '2021-10-18 06:13:09', '23ba2d6e-6054-4f0d-9449-c948f513821e'),
(7, 1, 'svBmULVP0KhvWyj3DdJaEXexU8sLAgSjt8iPt8gWJimJChEZZj4bHBTvKVw4I2WrJ87BK_hrnFUMwx7B498F4veQzN4_g8JrI2sS', '2021-10-18 07:13:10', '2021-10-18 07:13:10', 'e103fdad-b226-40bc-9222-55f0824c7cbc'),
(8, 1, '3QZKDPY-WkB3azKnqvUKIV0Ti59oxm6dfqv_zJqQ5nJ2xN0muNZR8WHhS2yVXZBzZWOA6LqHU9SzI6RcgAXQ3ip_ND22g2g8REQY', '2021-10-18 08:13:12', '2021-10-18 08:13:12', '7dcba734-e2f0-42ec-9f81-8560f75bcefe'),
(9, 1, 'TrUzrswFRsGd0Er99OqACckTcmXZEOLl30fyjTkE0PbChjwew3I6mzlsThKDjQ4rGbfgcwxCG0stqpzJx8kzlX5ReyPevD0zZgon', '2021-10-18 09:13:13', '2021-10-18 09:13:13', '5387454b-86a1-4eba-8897-f915993868f0'),
(10, 1, 'EZU9ClxwQ3bXzIRi-VDgEtB13zWJAh1VZZ2Jm0TPzQR2cleLFg8fwFlslo_vdlbLtz8NTOeYxOHPB21Ua7bGuCEKJ9eIyfVK3IGF', '2021-10-18 10:13:15', '2021-10-18 10:13:33', '6cc746d4-c93e-4cef-843d-02db403f2720'),
(11, 1, 'bhdMpWsg4LN3QhOuM63AQbNtZ22gn_-u22pFmUCFGqYTfG2mIMwkXkaVQvK0tk8lfynKuAg2dy9wy6-ypk7ZsaIlo0KzbdCSW_vz', '2021-10-18 11:13:35', '2021-10-18 11:13:35', 'befb581c-bf3d-4d9b-89f7-5d6538501cda'),
(12, 1, 'dTPtUtc-ukjdwT0iVQCSPJKRrwt23u9LX8S7rwQo62CySvy_RVJayZVOJcpTuthU26wnOU2N-_p5OMjl43aV-OU23nP1vxoZnZqY', '2021-10-18 12:13:46', '2021-10-18 12:33:58', 'da628632-c64a-4c24-b2ef-6021d06a45cb'),
(13, 1, 'BzUUY32J3Z4jnMoz59evjbEv_U_BKHqiz-EASKL90cf3Tck9zwQUkshKXcFct3KkaSJucM160_ItbAnHnp2EcHe5ayrQstK1kQEQ', '2021-10-18 15:50:10', '2021-10-18 15:50:10', '789a9e37-847d-4037-8c76-dfb9752f41ca'),
(14, 1, 'FM13VQvYU0U96d4rOvMe7qFYszXtsboCE2c_DbWacMK8pSCkdF_xX5nRcOtEcE-Th_tHgykoLuvoulHM_JSfAT-lLZXt8APw_w2J', '2021-10-19 04:19:27', '2021-10-19 04:28:40', 'cf1669aa-a07e-4c34-9406-5a489e470676'),
(15, 1, 'tQBHAUVqSclBx4nkUxDj197nPJgyfHmeVrIxMcE7rCw7rbi_b93dJAGG20iayCBSNZom6nx6T9MyaTGn2z09yg1dMhCXTknfoD4n', '2021-10-30 06:37:30', '2021-10-30 06:45:05', '4e3ac653-0bd1-45bb-b671-248dd2cc75ef'),
(16, 1, 'lIYWIaVm9q4YOZOBDYRpJr0_nWbT1uPnG0XRpOjfpJbkfJnwxyieLjxZG0DlvxRxQic0aT8dbxM7roqNx5jvDQW_ibTD5zA8VcWh', '2021-10-30 06:52:18', '2021-10-30 09:45:09', '5d57b10c-13d3-4205-b4b2-e795f9870152'),
(17, 1, 'EPq9HuYGJkuQl4ASaX6F3fMJqueEJiLZhM9RTkqCY-TgH0axw6R7uc8HmiCRLSCJgWX5bIvWqb4sS31njWX7N-nvf-VlVpIxJczG', '2021-10-30 10:45:11', '2021-10-30 15:36:59', 'c8515001-bf5d-4cce-a525-59c487bb9042'),
(18, 1, '-CQwQlcB5bTGi6n1PnggU5SuAAC0zDlVtK070eToI597E5G0d4pL9wTfga1rPmKgIt-GfgRkuhdkczri8Y3_uhxC4j0gYKrocD-s', '2021-10-31 09:26:08', '2021-10-31 14:01:41', '78fb8b83-9c95-4906-94a1-da31e1b19755'),
(19, 1, 'glQepjWj9swBcW0_3W1xc1eWuhXWwTh1sZwn2U8IAKsNGgZX4AiEbi_w6LNhHPZb1fH-ZWOBojdx3AbqlNl96GeMySNhoJ3OgQbx', '2021-10-31 15:01:45', '2021-10-31 16:30:44', '43320168-1b09-4cb4-b264-fb5c710ffccf'),
(20, 1, 'KaAArEIZWsZ8M5ZrxuwsxaXr27w7OM013elZtzT728CsaUY1VGvtbWftLGaBZW7olnHED3tgJ8mEhdgnuh8Ok7HJUsAifaWAdtUY', '2021-11-01 06:32:20', '2021-11-01 07:26:59', '30258a75-fc13-4681-842e-f0fee14acaba'),
(21, 1, 'fjR4hQOTbYXtRrQAbL6DEPN2_kgamLz5Bj2JSyt7vjOYeYyNBv-0vFb5OF69uP4XCzBKTNB9JIywTXNeAq_l44FbDjzml6F_30ZA', '2021-11-01 07:29:50', '2021-11-01 08:41:42', '26fe3b74-dae8-4b13-be18-932aed9a6826'),
(22, 1, 'nubxZuMGa6cPB24JPhBKP3wnbtcsjRpbC35lLA0ELMUpdzC5Czx84ZpbLRQSPZ84tfpcenB4jyTE1bmTesYPdfdWwdYkecHPRdg5', '2021-11-01 09:41:46', '2021-11-01 09:41:46', 'aca5df5c-11b1-4aac-a23b-471d68ddb206');

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
(1, 'Craftycoffee', '2021-10-08 15:12:57', '2021-10-08 15:12:57', NULL, 'b6df11ba-d2f7-46a4-80a7-1ceec89cab7b');

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
(1, 1, 1, 'Craftycoffee', 'default', 'en-US', 1, '$DEFAULT_SITE_URL', 1, '2021-10-08 15:12:57', '2021-10-08 15:12:57', NULL, '706bd896-a738-4b80-a40a-19ef5e2ec936');

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
(1, 1, NULL, 1, 1, 26, 0, '2021-10-30 13:31:28', '2021-10-31 11:21:27', 'f858e889-19d4-49f5-b77f-fdad7c1049d4'),
(3, 1, 32, 1, 2, 21, 1, '2021-10-30 13:31:51', '2021-10-31 11:21:27', '7ea3df55-0597-4c72-b11f-848285b5023d'),
(4, 1, 33, 1, 22, 23, 1, '2021-10-30 13:31:51', '2021-10-31 11:21:27', '051136c6-ef25-4c66-adea-1ef253184ad6'),
(6, 1, 35, 1, 3, 12, 2, '2021-10-30 13:32:39', '2021-10-31 11:21:27', 'bbad536e-5394-4558-bc92-1596c464949f'),
(7, 1, 36, 1, 13, 14, 2, '2021-10-30 13:32:39', '2021-10-31 11:21:27', '8bcb504c-9cc3-43eb-ad0c-3059cfaa834c'),
(9, 1, 38, 1, 4, 5, 3, '2021-10-30 13:33:08', '2021-10-30 13:33:08', 'c82175fd-421a-4637-9be0-9bee78b7aceb'),
(10, 1, 39, 1, 6, 7, 3, '2021-10-30 13:33:08', '2021-10-30 13:33:08', '9d0fa0ab-702e-4823-9831-4a2c257ce1be'),
(12, 1, 41, 1, 15, 16, 2, '2021-10-30 13:33:40', '2021-10-31 11:21:27', '9ddcb8a5-8328-4761-9a8d-03708ea51f09'),
(13, 1, 42, 1, 17, 18, 2, '2021-10-30 13:33:40', '2021-10-31 11:21:27', 'aa990d70-82ed-4114-831d-a8100c37ee0b'),
(14, 1, 43, 1, 8, 9, 3, '2021-10-30 13:37:28', '2021-10-30 13:37:28', 'd9326526-49b5-4041-8117-3b49b31b65c0'),
(15, 1, 44, 1, 24, 25, 1, '2021-10-30 14:28:11', '2021-10-31 11:21:27', '728ec4cc-09b8-46f9-a2ea-c8aee85cb783'),
(16, 1, 56, 1, 19, 20, 2, '2021-10-31 11:20:24', '2021-10-31 11:21:27', 'e61d973b-12f4-4667-9ed5-82e16c94b038'),
(17, 1, 57, 1, 10, 11, 3, '2021-10-31 11:21:27', '2021-10-31 11:21:27', '32f37c46-fcc7-46c1-9adf-864b313d218f'),
(18, 2, NULL, 18, 1, 6, 0, '2021-10-31 16:12:37', '2021-11-01 07:40:17', '2c753659-7da3-42f3-a4aa-01d04c447827'),
(19, 2, 503, 18, 2, 3, 1, '2021-10-31 16:12:37', '2021-10-31 16:12:37', '23ac17f6-251f-44c5-9f75-0b8966170702'),
(20, 2, 527, 18, 4, 5, 1, '2021-11-01 07:40:17', '2021-11-01 07:40:17', 'f06a26bf-d59b-4157-b14c-39e8961a51e9');

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
(1, NULL, '2021-10-30 13:29:25', '2021-10-30 13:29:25', NULL, '386d439b-e737-446a-8912-ff097e8990c5'),
(2, 5, '2021-10-31 16:08:17', '2021-10-31 16:08:17', NULL, '291e4465-e98d-4695-a80d-d1c6f315bf53');

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
(5, 'gVIhDNy41ZkgzixaIIosof_vi08XJrql', '[\"preview/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"sourceId\":434,\"siteId\":1,\"draftId\":21,\"revisionId\":null}]', NULL, NULL, '2021-11-01 13:59:22', '2021-10-31 13:59:22', '2021-10-31 13:59:22', 'bccae1c1-1c42-4977-9c00-3fb236283866');

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
(1, 'admin', NULL, 'Sajjan', 'Shrestha', 's4jj4n@gmail.com', '$2y$13$f7UN8jkOD20q2XcF.yn5mOJ5ITt6KcmxMniJhMwjvA6JpMMTPC726', 1, 0, 0, 0, '2021-11-01 09:41:46', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2021-10-08 15:12:57', '2021-10-08 15:12:57', '2021-11-01 09:41:47', '505680d1-0f92-4141-bf45-4f9370fc09b4');

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
(1, NULL, 1, 'Drinks', '', '2021-10-30 09:42:29', '2021-10-30 09:42:29', '74e1dc45-5fa0-4079-9bc3-2caaffa9f91b'),
(2, NULL, NULL, 'Temporary source', NULL, '2021-10-30 11:43:14', '2021-10-30 11:43:14', 'b315cbfd-cab5-467b-a31d-5b9d4959782b'),
(3, 2, NULL, 'user_1', 'user_1/', '2021-10-30 11:43:14', '2021-10-30 11:43:14', '733919c9-82e1-40a1-8a77-f7c31552df2e');

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
(1, NULL, 'Drinks', 'drinks', 'craft\\volumes\\Local', 1, '@web/images/uploads/drinks', '{\"path\":\"@webroot/images/uploads/drinks\"}', 1, '2021-10-30 09:42:29', '2021-10-30 09:42:29', NULL, '526be8f2-d24c-4d05-898e-c2f298e91236');

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
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}', 1, '2021-10-11 10:28:26', '2021-10-11 10:28:26', '9b43e8ed-11f0-41d4-b49b-f327f239fabc'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2021-10-11 10:28:26', '2021-10-11 10:28:26', '24029043-5183-445c-8ea9-b5394d1d4eb2'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2021-10-11 10:28:27', '2021-10-11 10:28:27', '213ab109-ab55-4d44-9b42-9a5e52d8d0b3'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2021-10-11 10:28:27', '2021-10-11 10:28:27', '0d3a80f3-e32b-4c3c-83ee-963fe94c120c');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=534;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=534;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=459;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
