-- phpMyAdmin SQL Dump
-- version 3.3.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 07, 2012 at 06:04 PM
-- Server version: 5.1.50
-- PHP Version: 5.2.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `kapasoft`
--
CREATE DATABASE `kapasoft` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `kapasoft`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_assert`
--

CREATE TABLE IF NOT EXISTS `admin_assert` (
  `assert_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `assert_type` varchar(20) NOT NULL DEFAULT '',
  `assert_data` text,
  PRIMARY KEY (`assert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ACL Asserts' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `admin_assert`
--


-- --------------------------------------------------------

--
-- Table structure for table `admin_role`
--

CREATE TABLE IF NOT EXISTS `admin_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tree_level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `role_type` char(1) NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `role_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`role_id`),
  KEY `parent_id` (`parent_id`,`sort_order`),
  KEY `tree_level` (`tree_level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='ACL Roles' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `admin_role`
--

INSERT INTO `admin_role` (`role_id`, `parent_id`, `tree_level`, `sort_order`, `role_type`, `user_id`, `role_name`) VALUES
(1, 0, 1, 1, 'G', 0, 'Administrators'),
(3, 1, 2, 0, 'U', 1, 'Margots');

-- --------------------------------------------------------

--
-- Table structure for table `admin_rule`
--

CREATE TABLE IF NOT EXISTS `admin_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0',
  `resource_id` varchar(255) NOT NULL DEFAULT '',
  `privileges` varchar(20) NOT NULL DEFAULT '',
  `assert_id` int(10) unsigned NOT NULL DEFAULT '0',
  `role_type` char(1) DEFAULT NULL,
  `permission` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`rule_id`),
  KEY `resource` (`resource_id`,`role_id`),
  KEY `role_id` (`role_id`,`resource_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='ACL Rules' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin_rule`
--

INSERT INTO `admin_rule` (`rule_id`, `role_id`, `resource_id`, `privileges`, `assert_id`, `role_type`, `permission`) VALUES
(1, 1, 'all', '', 0, 'G', 'allow');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE IF NOT EXISTS `admin_user` (
  `user_id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL DEFAULT '',
  `lastname` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL DEFAULT '',
  `username` varchar(40) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime DEFAULT NULL,
  `logdate` datetime DEFAULT NULL,
  `lognum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reload_acl_flag` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `extra` text,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UNQ_ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Users' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`user_id`, `firstname`, `lastname`, `email`, `username`, `password`, `created`, `modified`, `logdate`, `lognum`, `reload_acl_flag`, `is_active`, `extra`) VALUES
(1, 'Margots', 'Kapacs', 'makapacs@hotmail.com', 'makapacs', 'cd03d4581f9bc7f1eee4903a2b7265c6:FE', '2010-11-25 14:30:20', '2010-11-25 14:30:20', '2011-01-17 20:11:50', 20, 0, 1, 'a:1:{s:11:"configState";a:17:{s:14:"design_package";s:1:"0";s:12:"design_theme";s:1:"0";s:11:"design_head";s:1:"0";s:13:"design_header";s:1:"1";s:13:"design_footer";s:1:"1";s:16:"design_watermark";s:1:"0";s:17:"design_pagination";s:1:"0";s:11:"cms_wysiwyg";s:1:"1";s:7:"web_url";s:1:"0";s:7:"web_seo";s:1:"0";s:12:"web_unsecure";s:1:"0";s:10:"web_secure";s:1:"0";s:11:"web_default";s:1:"1";s:9:"web_polls";s:1:"0";s:10:"web_cookie";s:1:"0";s:11:"web_session";s:1:"0";s:24:"web_browser_capabilities";s:1:"0";}}');

-- --------------------------------------------------------

--
-- Table structure for table `adminnotification_inbox`
--

CREATE TABLE IF NOT EXISTS `adminnotification_inbox` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `severity` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `url` varchar(255) NOT NULL,
  `is_read` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_remove` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`notification_id`),
  KEY `IDX_SEVERITY` (`severity`),
  KEY `IDX_IS_READ` (`is_read`),
  KEY `IDX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `adminnotification_inbox`
--

INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES
(1, 4, '2008-07-25 01:24:40', 'Magento 1.1 Production Version Now Available', 'We are thrilled to announce the availability of the production release of Magento 1.1. Read more about the release in the Magento Blog.', 'http://www.magentocommerce.com/blog/comments/magento-11-is-here-1/', 0, 0),
(2, 4, '2008-08-02 01:30:16', 'Updated iPhone Theme is now available', 'Updated iPhone theme for Magento 1.1 is now available on Magento Connect and for upgrade through your Magento Connect Manager.', 'http://www.magentocommerce.com/blog/comments/updated-iphone-theme-for-magento-11-is-now-available/', 0, 0),
(3, 3, '2008-08-02 01:40:27', 'Magento version 1.1.2 is now available', 'Magento version 1.1.2 is now available for download and upgrade.', 'http://www.magentocommerce.com/blog/comments/magento-version-112-is-now-available/', 0, 0),
(4, 3, '2008-08-13 17:51:46', 'Magento version 1.1.3 is now available', 'Magento version 1.1.3 is now available', 'http://www.magentocommerce.com/blog/comments/magento-version-113-is-now-available/', 0, 0),
(5, 1, '2008-09-02 21:10:31', 'Magento Version 1.1.4 Security Update Now Available', 'Magento 1.1.4 Security Update Now Available. If you are using Magento version 1.1.x, we highly recommend upgrading to this version as soon as possible.', 'http://www.magentocommerce.com/blog/comments/magento-version-114-security-update/', 0, 0),
(6, 3, '2008-09-15 22:09:54', 'Magento version 1.1.5 Now Available', 'Magento version 1.1.5 Now Available.\n\nThis release includes many bug fixes, a new category manager and a new skin for the default Magento theme.', 'http://www.magentocommerce.com/blog/comments/magento-version-115-now-available/', 0, 0),
(7, 3, '2008-09-17 20:18:35', 'Magento version 1.1.6 Now Available', 'Magento version 1.1.6 Now Available.\n\nThis version includes bug fixes for Magento 1.1.x that are listed in the release notes section.', 'http://www.magentocommerce.com/blog/comments/magento-version-116-now-available/', 0, 0),
(8, 4, '2008-11-07 23:46:42', 'Reminder: Change Magento`s default phone numbers and callouts before site launch', 'Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.', '', 0, 0),
(9, 3, '2008-11-20 01:31:12', 'Magento version 1.1.7 Now Available', 'Magento version 1.1.7 Now Available.\n\nThis version includes over 350 issue resolutions for Magento 1.1.x that are listed in the release notes section, and new functionality that includes:\n\n-Google Website Optimizer integration\n-Google Base integration\n-Scheduled DB logs cleaning option', 'http://www.magentocommerce.com/blog/comments/magento-version-117-now-available/', 0, 0),
(10, 3, '2008-11-26 21:24:50', 'Magento Version 1.1.8 Now Available', 'Magento version 1.1.8 now available.\n\nThis version includes some issue resolutions for Magento 1.1.x that are listed in the release notes section.', 'http://www.magentocommerce.com/blog/comments/magento-version-118-now-available/', 0, 0),
(11, 3, '2008-12-30 07:45:59', 'Magento version 1.2.0 is now available for download and upgrade', 'We are extremely happy to announce the availability of Magento version 1.2.0 for download and upgrade.\n\nThis version includes numerous issue resolutions for Magento version 1.1.x and some highly requested new features such as:\n\n    * Support for Downloadable/Digital Products. \n    * Added Layered Navigation to site search result page.\n    * Improved site search to utilize MySQL fulltext search\n    * Added support for fixed-taxes on product level.\n    * Upgraded Zend Framework to the latest stable version 1.7.2', 'http://www.magentocommerce.com/blog/comments/magento-version-120-is-now-available/', 0, 0),
(12, 2, '2008-12-30 21:59:22', 'Magento version 1.2.0.1 now available', 'Magento version 1.2.0.1 now available.This version includes some issue resolutions for Magento 1.2.x that are listed in the release notes section.', 'http://www.magentocommerce.com/blog/comments/magento-version-1201-available/', 0, 0),
(13, 2, '2009-01-12 20:41:49', 'Magento version 1.2.0.2 now available', 'Magento version 1.2.0.2 is now available for download and upgrade. This version includes an issue resolutions for Magento version 1.2.0.x as listed in the release notes.', 'http://www.magentocommerce.com/blog/comments/magento-version-1202-now-available/', 0, 0),
(14, 3, '2009-01-24 00:25:56', 'Magento version 1.2.0.3 now available', 'Magento version 1.2.0.3 is now available for download and upgrade. This version includes issue resolutions for Magento version 1.2.0.x as listed in the release notes.', 'http://www.magentocommerce.com/blog/comments/magento-version-1203-now-available/', 0, 0),
(15, 3, '2009-02-02 21:57:00', 'Magento version 1.2.1 is now available for download and upgrade', 'We are happy to announce the availability of Magento version 1.2.1 for download and upgrade.\n\nThis version includes some issue resolutions for Magento version 1.2.x. A full list of items included in this release can be found on the release notes page.', 'http://www.magentocommerce.com/blog/comments/magento-version-121-now-available/', 0, 0),
(16, 3, '2009-02-24 00:45:47', 'Magento version 1.2.1.1 now available', 'Magento version 1.2.1.1 now available.This version includes some issue resolutions for Magento 1.2.x that are listed in the release notes section.', 'http://www.magentocommerce.com/blog/comments/magento-version-1211-now-available/', 0, 0),
(17, 3, '2009-02-27 01:39:24', 'CSRF Attack Prevention', 'We have just posted a blog entry about a hypothetical CSRF attack on a Magento admin panel. Please read the post to find out if your Magento installation is at risk at http://www.magentocommerce.com/blog/comments/csrf-vulnerabilities-in-web-application-and-how-to-avoid-them-in-magento/', 'http://www.magentocommerce.com/blog/comments/csrf-vulnerabilities-in-web-application-and-how-to-avoid-them-in-magento/', 0, 0),
(18, 2, '2009-03-03 23:03:58', 'Magento version 1.2.1.2 now available', 'Magento version 1.2.1.2 is now available for download and upgrade.\nThis version includes some updates to improve admin security as described in the release notes page.', 'http://www.magentocommerce.com/blog/comments/magento-version-1212-now-available/', 0, 0),
(19, 3, '2009-03-31 02:22:40', 'Magento version 1.3.0 now available', 'Magento version 1.3.0 is now available for download and upgrade. This version includes numerous issue resolutions for Magento version 1.2.x and new features as described on the release notes page.', 'http://www.magentocommerce.com/blog/comments/magento-version-130-is-now-available/', 0, 0),
(20, 3, '2009-04-18 04:06:02', 'Magento version 1.3.1 now available', 'Magento version 1.3.1 is now available for download and upgrade. This version includes some issue resolutions for Magento version 1.3.x and new features such as Checkout By Amazon and Amazon Flexible Payment. To see a full list of updates please check the release notes page.', 'http://www.magentocommerce.com/blog/comments/magento-version-131-now-available/', 0, 0),
(21, 3, '2009-05-19 22:31:21', 'Magento version 1.3.1.1 now available', 'Magento version 1.3.1.1 is now available for download and upgrade. This version includes some issue resolutions for Magento version 1.3.x and a security update for Magento installations that run on multiple domains or sub-domains. If you are running Magento with multiple domains or sub-domains we highly recommend upgrading to this version.', 'http://www.magentocommerce.com/blog/comments/magento-version-1311-now-available/', 0, 0),
(22, 3, '2009-05-29 22:54:06', 'Magento version 1.3.2 now available', 'This version includes some improvements and issue resolutions for version 1.3.x that are listed on the release notes page. also included is a Beta version of the Compile module.', 'http://www.magentocommerce.com/blog/comments/magento-version-132-now-available/', 0, 0),
(23, 3, '2009-06-01 19:32:52', 'Magento version 1.3.2.1 now available', 'Magento version 1.3.2.1 now available for download and upgrade.\n\nThis release solves an issue for users running Magento with PHP 5.2.0, and changes to index.php to support the new Compiler Module.', 'http://www.magentocommerce.com/blog/comments/magento-version-1321-now-available/', 0, 0),
(24, 3, '2009-07-02 01:21:44', 'Magento version 1.3.2.2 now available', 'Magento version 1.3.2.2 is now available for download and upgrade.\n\nThis release includes issue resolution for Magento version 1.3.x. To see a full list of changes please visit the release notes page http://www.magentocommerce.com/download/release_notes.', 'http://www.magentocommerce.com/blog/comments/magento-version-1322-now-available/', 0, 0),
(25, 3, '2009-07-23 06:48:54', 'Magento version 1.3.2.3 now available', 'Magento version 1.3.2.3 is now available for download and upgrade.\n\nThis release includes issue resolution for Magento version 1.3.x. We recommend to upgrade to this version if PayPal payment modules are in use. To see a full list of changes please visit the release notes page http://www.magentocommerce.com/download/release_notes.', 'http://www.magentocommerce.com/blog/comments/magento-version-1323-now-available/', 0, 0),
(26, 4, '2009-08-28 18:26:28', 'PayPal is updating Payflow Pro and Website Payments Pro (Payflow Edition) UK.', 'If you are using Payflow Pro and/or Website Payments Pro (Payflow Edition) UK.  payment methods, you will need to update the URL‘s in your Magento Administrator Panel in order to process transactions after September 1, 2009. Full details are available here: http://www.magentocommerce.com/wiki/paypal_payflow_changes', 'http://www.magentocommerce.com/wiki/paypal_payflow_changes', 0, 0),
(27, 2, '2009-09-23 20:16:49', 'Magento Version 1.3.2.4 Security Update', 'Magento Version 1.3.2.4 is now available. This version includes a security updates for Magento 1.3.x that solves possible XSS vulnerability issue on customer registration page and is available through SVN, Download Page and through the Magento Connect Manager.', 'http://www.magentocommerce.com/blog/comments/magento-version-1324-security-update/', 0, 0),
(28, 4, '2009-09-25 14:57:54', 'Magento Preview Version 1.4.0.0-alpha2 is now available', 'We are happy to announce the availability of Magento Preview Version 1.4.0.0-alpha2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.', 'http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-alpha2-now-available/', 0, 0),
(29, 4, '2009-10-07 00:55:40', 'Magento Preview Version 1.4.0.0-alpha3 is now available', 'We are happy to announce the availability of Magento Preview Version 1.4.0.0-alpha3 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.', 'http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-alpha3-now-available/', 0, 0),
(30, 4, '2009-12-08 23:30:36', 'Magento Preview Version 1.4.0.0-beta1 is now available', 'We are happy to announce the availability of Magento Preview Version 1.4.0.0-beta1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.', 'http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-beta1-now-available/', 0, 0),
(31, 4, '2009-12-31 09:22:12', 'Magento Preview Version 1.4.0.0-rc1 is now available', 'We are happy to announce the availability of Magento Preview Version 1.4.0.0-rc1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.', 'http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-rc1-now-available/', 0, 0),
(32, 4, '2010-02-13 03:39:53', 'Magento CE Version 1.4.0.0 Stable is now available', 'We are excited to announce the availability of Magento CE Version 1.4.0.0 Stable for upgrade and download.', 'http://bit.ly/c53rpK', 0, 0),
(33, 3, '2010-02-20 02:39:36', 'Magento CE Version 1.4.0.1 Stable is now available', 'Magento CE 1.4.0.1 Stable is now available for upgrade and download.', 'http://www.magentocommerce.com/blog/comments/magento-ce-version-1401-stable-now-available/', 0, 0),
(34, 4, '2010-04-23 20:09:03', 'Magento Version CE 1.3.3.0 Stable - Now Available With Support for 3-D Secure', 'Based on community requests, we are excited to announce the release of Magento CE 1.3.3.0-Stable with support for 3-D Secure. This release is intended for Magento merchants using version 1.3.x, who want to add support for 3-D Secure.', 'http://www.magentocommerce.com/blog/comments/magento-version-ce-1330-stable-now-available-with-support-for-3-d-secure/', 0, 0),
(35, 4, '2010-05-31 17:20:21', 'Announcing the Launch of Magento Mobile', 'The Magento team is pleased to announce the launch of Magento mobile, a new product that will allow Magento merchants to easily create branded, native mobile storefront applications that are deeply integrated with Magento’s market-leading eCommerce platform. The product includes a new administrative manager, a native iPhone app that is fully customizable, and a service where Magento manages the submission and maintenance process for the iTunes App Store.\n\nLearn more by visiting the Magento mobile product page and sign-up to be the first to launch a native mobile commerce app, fully integrated with Magento.', 'http://www.magentocommerce.com/product/mobile', 0, 0),
(36, 4, '2010-06-10 20:08:08', 'Magento CE Version 1.4.1.0 Stable is now available', 'We are excited to announce the availability of Magento CE Version 1.4.1.0 Stable for upgrade and download. Some of the highlights of this release include: Enhanced PayPal integration (more info to follow), Change of Database structure of the Sales module to no longer use EAV, and much more.', 'http://www.magentocommerce.com/blog/comments/magento-ce-version-1410-stable-now-available/', 0, 0),
(37, 4, '2010-07-26 21:37:34', 'Magento CE Version 1.4.1.1 Stable is now available', 'We are excited to announce the availability of Magento CE Version 1.4.1.1 Stable for download and upgrade.', 'http://www.magentocommerce.com/blog/comments/magento-ce-version-1411-stable-now-available/', 0, 0),
(38, 4, '2010-07-28 05:12:12', 'Magento CE Version 1.4.2.0-beta1 Preview Release Now Available', 'This release gives a preview of the new Magento Connect Manager.', 'http://www.magentocommerce.com/blog/comments/magento-preview-version-1420-beta1-now-available/', 0, 0),
(39, 4, '2010-07-28 20:15:01', 'Magento CE Version 1.4.1.1 Patch Available', 'As some users experienced issues with upgrading to CE 1.4.1.1 through PEAR channels we provided a patch for it that is available on our blog http://www.magentocommerce.com/blog/comments/magento-ce-version-1411-stable-patch/', 'http://www.magentocommerce.com/blog/comments/magento-ce-version-1411-stable-patch/', 0, 0),
(40, 4, '2010-11-08 21:52:06', 'Magento CE Version 1.4.2.0-RC1 Preview Release Now Available', 'We are happy to announce the availability of Magento Preview Version 1.4.2.0-RC1 for download.', 'http://www.magentocommerce.com/blog/comments/magento-preview-version-1420-rc1-now-available/', 0, 0),
(41, 4, '2010-12-02 20:33:00', 'Magento CE Version 1.4.2.0-RC2 Preview Release Now Available', 'We are happy to announce the availability of Magento Preview Version 1.4.2.0-RC2 for download.', 'http://www.magentocommerce.com/blog/comments/magento-preview-version-1420-rc2-now-available/', 0, 0),
(42, 4, '2010-12-08 22:29:55', 'Magento CE Version 1.4.2.0 Stable is now available', 'We are excited to announce the availability of Magento CE Version 1.4.2.0 Stable for download and upgrade.', 'http://www.magentocommerce.com/blog/comments/magento-ce-version-1420-stable-now-available/', 0, 0),
(43, 4, '2010-12-17 23:23:55', 'Magento Preview Version CE 1.5.0.0-alpha1 is now available', 'We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-alpha1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.', 'http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-alpha1-now-available/', 0, 0),
(44, 4, '2010-12-29 23:51:08', 'Magento Preview Version CE 1.5.0.0-alpha2 is now available', 'We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-alpha2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.', 'http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-alpha2-now-available/', 0, 0),
(45, 4, '2011-01-14 00:35:36', 'Magento Preview Version CE 1.5.0.0-beta1 is now available', 'We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-beta1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.', 'http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-beta1-now-available/', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `api_assert`
--

CREATE TABLE IF NOT EXISTS `api_assert` (
  `assert_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `assert_type` varchar(20) NOT NULL DEFAULT '',
  `assert_data` text,
  PRIMARY KEY (`assert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Asserts' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `api_assert`
--


-- --------------------------------------------------------

--
-- Table structure for table `api_role`
--

CREATE TABLE IF NOT EXISTS `api_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tree_level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `role_type` char(1) NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `role_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`role_id`),
  KEY `parent_id` (`parent_id`,`sort_order`),
  KEY `tree_level` (`tree_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Roles' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `api_role`
--


-- --------------------------------------------------------

--
-- Table structure for table `api_rule`
--

CREATE TABLE IF NOT EXISTS `api_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0',
  `resource_id` varchar(255) NOT NULL DEFAULT '',
  `privileges` varchar(20) NOT NULL DEFAULT '',
  `assert_id` int(10) unsigned NOT NULL DEFAULT '0',
  `role_type` char(1) DEFAULT NULL,
  `permission` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`rule_id`),
  KEY `resource` (`resource_id`,`role_id`),
  KEY `role_id` (`role_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Rules' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `api_rule`
--


-- --------------------------------------------------------

--
-- Table structure for table `api_session`
--

CREATE TABLE IF NOT EXISTS `api_session` (
  `user_id` mediumint(9) unsigned NOT NULL,
  `logdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sessid` varchar(40) NOT NULL DEFAULT '',
  KEY `API_SESSION_USER` (`user_id`),
  KEY `API_SESSION_SESSID` (`sessid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Sessions';

--
-- Dumping data for table `api_session`
--


-- --------------------------------------------------------

--
-- Table structure for table `api_user`
--

CREATE TABLE IF NOT EXISTS `api_user` (
  `user_id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL DEFAULT '',
  `lastname` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL DEFAULT '',
  `username` varchar(40) NOT NULL DEFAULT '',
  `api_key` varchar(40) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime DEFAULT NULL,
  `lognum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reload_acl_flag` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Users' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `api_user`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity`
--

CREATE TABLE IF NOT EXISTS `catalog_category_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `path` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `children_count` int(11) NOT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_LEVEL` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Category Entities' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `catalog_category_entity`
--

INSERT INTO `catalog_category_entity` (`entity_id`, `entity_type_id`, `attribute_set_id`, `parent_id`, `created_at`, `updated_at`, `path`, `position`, `level`, `children_count`) VALUES
(1, 3, 0, 0, '0000-00-00 00:00:00', '2010-11-25 14:27:14', '1', 0, 0, 1),
(2, 3, 3, 1, '2010-11-25 14:27:15', '2010-11-25 14:27:15', '1/2', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_datetime`
--

CREATE TABLE IF NOT EXISTS `catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` datetime DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DATETIME_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_category_entity_datetime`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_decimal`
--

CREATE TABLE IF NOT EXISTS `catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_category_entity_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_int`
--

CREATE TABLE IF NOT EXISTS `catalog_category_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_INT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_EMTITY_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_EMTITY_INT_STORE` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `catalog_category_entity_int`
--

INSERT INTO `catalog_category_entity_int` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 3, 34, 0, 2, 1),
(2, 3, 34, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_text`
--

CREATE TABLE IF NOT EXISTS `catalog_category_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_TEXT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_TEXT_STORE` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `catalog_category_entity_text`
--

INSERT INTO `catalog_category_entity_text` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 3, 58, 0, 1, ''),
(2, 3, 58, 1, 1, ''),
(3, 3, 58, 0, 2, ''),
(4, 3, 58, 1, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_varchar`
--

CREATE TABLE IF NOT EXISTS `catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`) USING BTREE,
  KEY `FK_ATTRIBUTE_VARCHAR_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `catalog_category_entity_varchar`
--

INSERT INTO `catalog_category_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 3, 33, 0, 1, 'Root Catalog'),
(2, 3, 33, 1, 1, 'Root Catalog'),
(3, 3, 35, 0, 1, 'root-catalog'),
(4, 3, 33, 0, 2, 'Default Category'),
(5, 3, 33, 1, 2, 'Default Category'),
(6, 3, 41, 1, 2, 'PRODUCTS'),
(7, 3, 35, 0, 2, 'default-category');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product`
--

CREATE TABLE IF NOT EXISTS `catalog_category_product` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `UNQ_CATEGORY_PRODUCT` (`category_id`,`product_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_CATEGORY` (`category_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalog_category_product`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index`
--

CREATE TABLE IF NOT EXISTS `catalog_category_product_index` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(10) NOT NULL DEFAULT '0',
  `is_parent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `visibility` tinyint(3) unsigned NOT NULL,
  UNIQUE KEY `UNQ_CATEGORY_PRODUCT` (`category_id`,`product_id`,`store_id`),
  KEY `FK_CATALOG_CATEGORY_PRODUCT_INDEX_CATEGORY_ENTITY` (`category_id`),
  KEY `IDX_JOIN` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_BASE` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalog_category_product_index`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_compare_item`
--

CREATE TABLE IF NOT EXISTS `catalog_compare_item` (
  `catalog_compare_item_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` int(11) unsigned NOT NULL DEFAULT '0',
  `customer_id` int(11) unsigned DEFAULT NULL,
  `product_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`catalog_compare_item_id`),
  KEY `FK_CATALOG_COMPARE_ITEM_CUSTOMER` (`customer_id`),
  KEY `FK_CATALOG_COMPARE_ITEM_PRODUCT` (`product_id`),
  KEY `IDX_VISITOR_PRODUCTS` (`visitor_id`,`product_id`),
  KEY `IDX_CUSTOMER_PRODUCTS` (`customer_id`,`product_id`),
  KEY `FK_CATALOG_COMPARE_ITEM_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_compare_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_eav_attribute`
--

CREATE TABLE IF NOT EXISTS `catalog_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `frontend_input_renderer` varchar(255) DEFAULT NULL,
  `is_global` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_searchable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_comparable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_visible_on_front` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_html_allowed_on_front` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_used_for_price_rules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_filterable_in_search` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `used_in_product_listing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `used_for_sort_by` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `apply_to` varchar(255) NOT NULL,
  `is_visible_in_advanced_search` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL,
  `is_wysiwyg_enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`attribute_id`),
  KEY `IDX_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `IDX_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=507 ;

--
-- Dumping data for table `catalog_eav_attribute`
--

INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`) VALUES
(33, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(34, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(35, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(36, '', 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, '', 0, 0, 1),
(37, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(38, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(39, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(40, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(41, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(42, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(43, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(44, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(45, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(46, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(47, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(48, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(49, '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(50, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(51, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(52, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(53, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(54, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(55, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(56, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(57, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(58, 'adminhtml/catalog_category_helper_sortby_available', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(59, 'adminhtml/catalog_category_helper_sortby_default', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(60, '', 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, '', 1, 0, 0),
(61, '', 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, '', 1, 0, 1),
(62, '', 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, '', 1, 0, 1),
(63, '', 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, '', 1, 0, 0),
(64, '', 2, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 'simple,configurable,virtual,bundle,downloadable', 1, 0, 0),
(65, '', 2, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0),
(66, '', 2, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0),
(67, '', 2, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0),
(68, '', 2, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 'simple,virtual,downloadable', 0, 0, 0),
(69, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 'simple,bundle', 0, 0, 0),
(70, '', 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 'simple', 1, 0, 0),
(71, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(72, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(73, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(74, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(75, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, '', 0, 0, 0),
(76, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, '', 0, 0, 0),
(77, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(78, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(79, '', 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0),
(80, '', 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 'simple', 1, 0, 0),
(81, '', 2, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, '', 0, 0, 0),
(82, '', 2, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, '', 0, 0, 0),
(83, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(84, '', 2, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, '', 0, 0, 0),
(85, '', 2, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 1, 0, 0),
(86, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, '', 0, 0, 0),
(87, '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(88, '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0),
(89, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(90, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(91, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(92, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(93, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(94, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(95, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(96, '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(97, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, '', 0, 0, 0),
(98, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(99, '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, '', 0, 0, 0),
(100, '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, '', 0, 0, 0),
(101, '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, '', 0, 0, 0),
(102, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(103, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, '', 0, 0, 0),
(477, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '', 0, 0, 0),
(497, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0),
(498, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 'bundle', 0, 0, 0),
(499, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 'bundle', 0, 0, 0),
(500, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 'bundle', 0, 0, 0),
(501, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 'bundle', 0, 0, 0),
(502, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 'bundle', 0, 0, 0),
(503, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 'downloadable', 0, 0, 0),
(504, '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 'downloadable', 0, 0, 0),
(505, '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 'downloadable', 0, 0, 0),
(506, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 'downloadable', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_option`
--

CREATE TABLE IF NOT EXISTS `catalog_product_bundle_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`option_id`),
  KEY `FK_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bundle Options' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_bundle_option`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_option_value`
--

CREATE TABLE IF NOT EXISTS `catalog_product_bundle_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_OPTION_STORE` (`option_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bundle Selections' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_bundle_option_value`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_price_index`
--

CREATE TABLE IF NOT EXISTS `catalog_product_bundle_price_index` (
  `entity_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `customer_group_id` smallint(3) unsigned NOT NULL,
  `min_price` decimal(12,4) NOT NULL,
  `max_price` decimal(12,4) NOT NULL,
  PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalog_product_bundle_price_index`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_selection`
--

CREATE TABLE IF NOT EXISTS `catalog_product_bundle_selection` (
  `selection_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL,
  `parent_product_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `selection_price_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `selection_qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `selection_can_change_qty` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`selection_id`),
  KEY `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION` (`option_id`),
  KEY `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bundle Selections' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_bundle_selection`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_stock_index`
--

CREATE TABLE IF NOT EXISTS `catalog_product_bundle_stock_index` (
  `entity_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `stock_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `stock_status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`entity_id`,`stock_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalog_product_bundle_stock_index`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_enabled_index`
--

CREATE TABLE IF NOT EXISTS `catalog_product_enabled_index` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `visibility` smallint(5) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `UNQ_PRODUCT_STORE` (`product_id`,`store_id`),
  KEY `IDX_PRODUCT_VISIBILITY_IN_STORE` (`product_id`,`store_id`,`visibility`),
  KEY `FK_CATALOG_PRODUCT_ENABLED_INDEX_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalog_product_enabled_index`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple',
  `sku` varchar(64) DEFAULT NULL,
  `has_options` smallint(1) NOT NULL DEFAULT '0',
  `required_options` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `sku` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Entities' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_entity`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_datetime`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` datetime DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DATETIME_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DATETIME_PRODUCT_ENTITY` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_entity_datetime`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_decimal`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_entity_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_gallery`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_GALLERY_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_GALLERY_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_GALLERY_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_entity_gallery`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_int`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_INT_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_INT_PRODUCT_ENTITY` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_entity_int`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_media_gallery`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_media_gallery` (
  `value_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  KEY `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ENTITY` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog product media gallery' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_entity_media_gallery`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_media_gallery_value`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_media_gallery_value` (
  `value_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `label` varchar(255) DEFAULT NULL,
  `position` int(11) unsigned DEFAULT NULL,
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_MEDIA_GALLERY_VALUE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog product media gallery values';

--
-- Dumping data for table `catalog_product_entity_media_gallery_value`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_text`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TEXT_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TEXT_PRODUCT_ENTITY` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_entity_text`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_tier_price`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `all_groups` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `qty` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_TIER_PRICE` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TIER_PRICE_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TIER_PRICE_GROUP` (`customer_group_id`),
  KEY `FK_CATALOG_PRODUCT_TIER_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_entity_tier_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_varchar`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_PRODUCT_ENTITY` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_entity_varchar`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_eav` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalog_product_index_eav`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_decimal`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_decimal` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` decimal(12,4) NOT NULL,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalog_product_index_eav_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned DEFAULT '0',
  `price` decimal(12,4) DEFAULT NULL,
  `final_price` decimal(12,4) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  KEY `IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalog_product_index_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_tier_price`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_tier_price` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER` (`customer_group_id`),
  KEY `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalog_product_index_tier_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_website`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_website` (
  `website_id` smallint(5) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `rate` float(12,4) unsigned DEFAULT '1.0000',
  PRIMARY KEY (`website_id`),
  KEY `IDX_DATE` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalog_product_index_website`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link`
--

CREATE TABLE IF NOT EXISTS `catalog_product_link` (
  `link_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `linked_product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `link_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`link_id`),
  KEY `FK_LINK_PRODUCT` (`product_id`),
  KEY `FK_LINKED_PRODUCT` (`linked_product_id`),
  KEY `FK_PRODUCT_LINK_TYPE` (`link_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Related products' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute`
--

CREATE TABLE IF NOT EXISTS `catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `link_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `product_link_attribute_code` varchar(32) NOT NULL DEFAULT '',
  `data_type` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`product_link_attribute_id`),
  KEY `FK_ATTRIBUTE_PRODUCT_LINK_TYPE` (`link_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Attributes for product link' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `catalog_product_link_attribute`
--

INSERT INTO `catalog_product_link_attribute` (`product_link_attribute_id`, `link_type_id`, `product_link_attribute_code`, `data_type`) VALUES
(1, 2, 'qty', 'decimal'),
(2, 1, 'position', 'int'),
(3, 4, 'position', 'int'),
(4, 5, 'position', 'int'),
(6, 1, 'qty', 'decimal'),
(7, 3, 'position', 'int'),
(8, 3, 'qty', 'decimal');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute_decimal`
--

CREATE TABLE IF NOT EXISTS `catalog_product_link_attribute_decimal` (
  `value_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_link_attribute_id` smallint(6) unsigned DEFAULT NULL,
  `link_id` int(11) unsigned DEFAULT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`value_id`),
  KEY `FK_DECIMAL_PRODUCT_LINK_ATTRIBUTE` (`product_link_attribute_id`),
  KEY `FK_DECIMAL_LINK` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Decimal attributes values' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_link_attribute_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute_int`
--

CREATE TABLE IF NOT EXISTS `catalog_product_link_attribute_int` (
  `value_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_link_attribute_id` smallint(6) unsigned DEFAULT NULL,
  `link_id` int(11) unsigned DEFAULT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`),
  KEY `FK_INT_PRODUCT_LINK_ATTRIBUTE` (`product_link_attribute_id`),
  KEY `FK_INT_PRODUCT_LINK` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_link_attribute_int`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute_varchar`
--

CREATE TABLE IF NOT EXISTS `catalog_product_link_attribute_varchar` (
  `value_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_link_attribute_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `link_id` int(11) unsigned DEFAULT NULL,
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  KEY `FK_VARCHAR_PRODUCT_LINK_ATTRIBUTE` (`product_link_attribute_id`),
  KEY `FK_VARCHAR_LINK` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Varchar attributes values' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_link_attribute_varchar`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_type`
--

CREATE TABLE IF NOT EXISTS `catalog_product_link_type` (
  `link_type_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Types of product link(Related, superproduct, bundles)' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `catalog_product_link_type`
--

INSERT INTO `catalog_product_link_type` (`link_type_id`, `code`) VALUES
(1, 'relation'),
(2, 'bundle'),
(3, 'super'),
(4, 'up_sell'),
(5, 'cross_sell');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option`
--

CREATE TABLE IF NOT EXISTS `catalog_product_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `is_require` tinyint(1) NOT NULL DEFAULT '1',
  `sku` varchar(64) NOT NULL DEFAULT '',
  `max_characters` int(10) unsigned DEFAULT NULL,
  `file_extension` varchar(50) DEFAULT NULL,
  `image_size_x` smallint(5) unsigned NOT NULL,
  `image_size_y` smallint(5) unsigned NOT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_option`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_price`
--

CREATE TABLE IF NOT EXISTS `catalog_product_option_price` (
  `option_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
  PRIMARY KEY (`option_price_id`),
  UNIQUE KEY `UNQ_OPTION_STORE` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRICE_OPTION` (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_option_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_title`
--

CREATE TABLE IF NOT EXISTS `catalog_product_option_title` (
  `option_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`option_title_id`),
  UNIQUE KEY `UNQ_OPTION_STORE` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_OPTION` (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_option_title`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_type_price`
--

CREATE TABLE IF NOT EXISTS `catalog_product_option_type_price` (
  `option_type_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
  PRIMARY KEY (`option_type_price_id`),
  UNIQUE KEY `UNQ_OPTION_TYPE_STORE` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE` (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_option_type_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_type_title`
--

CREATE TABLE IF NOT EXISTS `catalog_product_option_type_title` (
  `option_type_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`option_type_title_id`),
  UNIQUE KEY `UNQ_OPTION_TYPE_STORE` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION` (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_option_type_title`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_type_value`
--

CREATE TABLE IF NOT EXISTS `catalog_product_option_type_value` (
  `option_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sku` varchar(64) NOT NULL DEFAULT '',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_option_type_value`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_relation`
--

CREATE TABLE IF NOT EXISTS `catalog_product_relation` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`parent_id`,`child_id`),
  KEY `IDX_CHILD` (`child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- Dumping data for table `catalog_product_relation`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_attribute`
--

CREATE TABLE IF NOT EXISTS `catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_super_attribute_id`),
  KEY `FK_SUPER_PRODUCT_ATTRIBUTE_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_super_attribute`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_attribute_label`
--

CREATE TABLE IF NOT EXISTS `catalog_product_super_attribute_label` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `use_default` tinyint(1) unsigned DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_ATTRIBUTE_STORE` (`product_super_attribute_id`,`store_id`),
  KEY `FK_SUPER_PRODUCT_ATTRIBUTE_LABEL` (`product_super_attribute_id`),
  KEY `FK_CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_super_attribute_label`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_attribute_pricing`
--

CREATE TABLE IF NOT EXISTS `catalog_product_super_attribute_pricing` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value_index` varchar(255) NOT NULL DEFAULT '',
  `is_percent` tinyint(1) unsigned DEFAULT '0',
  `pricing_value` decimal(10,4) DEFAULT NULL,
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`),
  KEY `FK_SUPER_PRODUCT_ATTRIBUTE_PRICING` (`product_super_attribute_id`),
  KEY `FK_CATALOG_PRODUCT_SUPER_PRICE_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_super_attribute_pricing`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_link`
--

CREATE TABLE IF NOT EXISTS `catalog_product_super_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`link_id`),
  KEY `FK_SUPER_PRODUCT_LINK_PARENT` (`parent_id`),
  KEY `FK_catalog_product_super_link` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_super_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_website`
--

CREATE TABLE IF NOT EXISTS `catalog_product_website` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`website_id`),
  KEY `FK_CATALOG_PRODUCT_WEBSITE_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalog_product_website`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogindex_aggregation`
--

CREATE TABLE IF NOT EXISTS `catalogindex_aggregation` (
  `aggregation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `data` mediumtext,
  PRIMARY KEY (`aggregation_id`),
  UNIQUE KEY `IDX_STORE_KEY` (`store_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalogindex_aggregation`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogindex_aggregation_tag`
--

CREATE TABLE IF NOT EXISTS `catalogindex_aggregation_tag` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_code` varchar(255) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `IDX_CODE` (`tag_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalogindex_aggregation_tag`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogindex_aggregation_to_tag`
--

CREATE TABLE IF NOT EXISTS `catalogindex_aggregation_to_tag` (
  `aggregation_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `IDX_AGGREGATION_TAG` (`aggregation_id`,`tag_id`),
  KEY `FK_CATALOGINDEX_AGGREGATION_TO_TAG_TAG` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalogindex_aggregation_to_tag`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogindex_eav`
--

CREATE TABLE IF NOT EXISTS `catalogindex_eav` (
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`store_id`,`entity_id`,`attribute_id`,`value`),
  KEY `IDX_VALUE` (`value`),
  KEY `FK_CATALOGINDEX_EAV_ENTITY` (`entity_id`),
  KEY `FK_CATALOGINDEX_EAV_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOGINDEX_EAV_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalogindex_eav`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogindex_minimal_price`
--

CREATE TABLE IF NOT EXISTS `catalogindex_minimal_price` (
  `index_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `customer_group_id` smallint(3) unsigned NOT NULL DEFAULT '0',
  `qty` decimal(12,4) unsigned NOT NULL DEFAULT '0.0000',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_class_id` smallint(6) NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`index_id`),
  KEY `IDX_VALUE` (`value`),
  KEY `IDX_QTY` (`qty`),
  KEY `FK_CATALOGINDEX_MINIMAL_PRICE_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `FK_CI_MINIMAL_PRICE_WEBSITE_ID` (`website_id`),
  KEY `IDX_FULL` (`entity_id`,`qty`,`customer_group_id`,`value`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalogindex_minimal_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogindex_price`
--

CREATE TABLE IF NOT EXISTS `catalogindex_price` (
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `customer_group_id` smallint(3) unsigned NOT NULL DEFAULT '0',
  `qty` decimal(12,4) unsigned NOT NULL DEFAULT '0.0000',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_class_id` smallint(6) NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned DEFAULT NULL,
  KEY `IDX_VALUE` (`value`),
  KEY `IDX_QTY` (`qty`),
  KEY `FK_CATALOGINDEX_PRICE_ENTITY` (`entity_id`),
  KEY `FK_CATALOGINDEX_PRICE_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOGINDEX_PRICE_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_RANGE_VALUE` (`entity_id`,`attribute_id`,`customer_group_id`,`value`),
  KEY `FK_CI_PRICE_WEBSITE_ID` (`website_id`),
  KEY `IDX_FULL` (`entity_id`,`attribute_id`,`customer_group_id`,`value`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalogindex_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock`
--

CREATE TABLE IF NOT EXISTS `cataloginventory_stock` (
  `stock_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `stock_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog inventory Stocks list' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cataloginventory_stock`
--

INSERT INTO `cataloginventory_stock` (`stock_id`, `stock_name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_item`
--

CREATE TABLE IF NOT EXISTS `cataloginventory_stock_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `stock_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `min_qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `use_config_min_qty` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_qty_decimal` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `backorders` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `use_config_backorders` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `use_config_min_sale_qty` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `use_config_max_sale_qty` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_in_stock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `low_stock_date` datetime DEFAULT NULL,
  `notify_stock_qty` decimal(12,4) DEFAULT NULL,
  `use_config_notify_stock_qty` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `manage_stock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `use_config_manage_stock` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `stock_status_changed_automatically` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `IDX_STOCK_PRODUCT` (`product_id`,`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_ITEM_PRODUCT` (`product_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_ITEM_STOCK` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Inventory Stock Item Data' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cataloginventory_stock_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_status`
--

CREATE TABLE IF NOT EXISTS `cataloginventory_stock_status` (
  `product_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `stock_id` smallint(4) unsigned NOT NULL,
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `stock_status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_STOCK` (`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cataloginventory_stock_status`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogrule`
--

CREATE TABLE IF NOT EXISTS `catalogrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `customer_group_ids` varchar(255) NOT NULL DEFAULT '',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `conditions_serialized` mediumtext NOT NULL,
  `actions_serialized` mediumtext NOT NULL,
  `stop_rules_processing` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `simple_action` varchar(32) NOT NULL,
  `discount_amount` decimal(12,4) NOT NULL,
  `website_ids` text,
  PRIMARY KEY (`rule_id`),
  KEY `sort_order` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalogrule`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_affected_product`
--

CREATE TABLE IF NOT EXISTS `catalogrule_affected_product` (
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalogrule_affected_product`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_group_website`
--

CREATE TABLE IF NOT EXISTS `catalogrule_group_website` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `rule_id` (`rule_id`),
  KEY `customer_group_id` (`customer_group_id`),
  KEY `website_id` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `catalogrule_group_website`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_product`
--

CREATE TABLE IF NOT EXISTS `catalogrule_product` (
  `rule_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0',
  `from_time` int(10) unsigned NOT NULL DEFAULT '0',
  `to_time` int(10) unsigned NOT NULL DEFAULT '0',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `action_operator` enum('to_fixed','to_percent','by_fixed','by_percent') NOT NULL DEFAULT 'to_fixed',
  `action_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `action_stop` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `sort_order` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `FK_catalogrule_product_rule` (`rule_id`),
  KEY `FK_catalogrule_product_customergroup` (`customer_group_id`),
  KEY `FK_catalogrule_product_website` (`website_id`),
  KEY `FK_CATALOGRULE_PRODUCT_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalogrule_product`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_product_price`
--

CREATE TABLE IF NOT EXISTS `catalogrule_product_price` (
  `rule_product_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_date` date NOT NULL DEFAULT '0000-00-00',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `website_id` smallint(5) unsigned NOT NULL,
  `latest_start_date` date DEFAULT NULL,
  `earliest_end_date` date DEFAULT NULL,
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `rule_date` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `FK_catalogrule_product_price_customergroup` (`customer_group_id`),
  KEY `FK_catalogrule_product_price_website` (`website_id`),
  KEY `FK_CATALOGRULE_PRODUCT_PRICE_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalogrule_product_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogsearch_fulltext`
--

CREATE TABLE IF NOT EXISTS `catalogsearch_fulltext` (
  `product_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `data_index` longtext NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`),
  FULLTEXT KEY `data_index` (`data_index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalogsearch_fulltext`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogsearch_query`
--

CREATE TABLE IF NOT EXISTS `catalogsearch_query` (
  `query_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `query_text` varchar(255) NOT NULL DEFAULT '',
  `num_results` int(10) unsigned NOT NULL DEFAULT '0',
  `popularity` int(10) unsigned NOT NULL DEFAULT '0',
  `redirect` varchar(255) NOT NULL DEFAULT '',
  `synonym_for` varchar(255) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `display_in_terms` tinyint(1) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) DEFAULT '1',
  `is_processed` tinyint(1) DEFAULT '0',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`query_id`),
  KEY `FK_CATALOGSEARCH_QUERY_STORE` (`store_id`),
  KEY `IDX_SEARCH_QUERY` (`query_text`,`store_id`,`popularity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catalogsearch_query`
--


-- --------------------------------------------------------

--
-- Table structure for table `catalogsearch_result`
--

CREATE TABLE IF NOT EXISTS `catalogsearch_result` (
  `query_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `relevance` decimal(6,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`query_id`,`product_id`),
  KEY `IDX_QUERY` (`query_id`),
  KEY `IDX_PRODUCT` (`product_id`),
  KEY `IDX_RELEVANCE` (`query_id`,`relevance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalogsearch_result`
--


-- --------------------------------------------------------

--
-- Table structure for table `checkout_agreement`
--

CREATE TABLE IF NOT EXISTS `checkout_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `content_height` varchar(25) DEFAULT NULL,
  `checkbox_text` text NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  `is_html` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `checkout_agreement`
--


-- --------------------------------------------------------

--
-- Table structure for table `checkout_agreement_store`
--

CREATE TABLE IF NOT EXISTS `checkout_agreement_store` (
  `agreement_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `agreement_id` (`agreement_id`,`store_id`),
  KEY `FK_CHECKOUT_AGREEMENT_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `checkout_agreement_store`
--


-- --------------------------------------------------------

--
-- Table structure for table `cms_block`
--

CREATE TABLE IF NOT EXISTS `cms_block` (
  `block_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `content` mediumtext,
  `creation_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='CMS Blocks' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `cms_block`
--

INSERT INTO `cms_block` (`block_id`, `title`, `identifier`, `content`, `creation_time`, `update_time`, `is_active`) VALUES
(5, 'Footer Links', 'footer_links', '<ul>\r\n<li><a href="{{store direct_url="about-magento-demo-store"}}">About Us</a></li>\r\n<li class="last"><a href="{{store direct_url="customer-service"}}">Customer Service</a></li>\r\n</ul>', '2010-11-25 08:27:09', '2010-11-25 08:27:09', 1),
(6, 'Top Header Horizontal Menu', 'top_horizontal_menu', ' <ul>\r\n<li><a href="developing-kapasoft-web-design-for-client"><span class="linkPadding" >How It<br/>Works?</span></a></li>\r\n<li><a href="contact-kapasoft-web-design"><span class="linkPadding" >Contact Us</span></a></li>\r\n<li><a href="what-is-kapasoft-web-design"><span class="linkPadding" >About Us</span></a></li>\r\n<li><a href="get-quote-from-KapaSoft-web-design"><span class="linkPadding" >Get Quote</span></a></li>\r\n</ul>', '2010-11-26 19:50:54', '2010-11-28 22:02:29', 1),
(7, 'Main Menu', 'main_menu', '<ul>\r\n<li><a href="how-can-kapasoft-web-design-help" id="mainLinkOne"><span class="mainLinkSpan">How can we help?</span></a></li>\r\n<li><a href="why-Kapasoft-web-design" id="mainLinkTwo"><span class="mainLinkSpan">Why us?</span></a></li>\r\n<li><a href="kapasoft-web-design-portfolio" id="mainLinkThree"><span class="mainLinkSpan">What we done?</span></a></li>\r\n<li><a href="what-others-say-kapasoft-web-design" id="mainLinkFour"><span class="mainLinkSpan">What others say?</span></a></li>\r\n</ul>', '2010-11-28 21:33:42', '2010-11-28 21:53:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_block_store`
--

CREATE TABLE IF NOT EXISTS `cms_block_store` (
  `block_id` smallint(6) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`block_id`,`store_id`),
  KEY `FK_CMS_BLOCK_STORE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Blocks to Stores';

--
-- Dumping data for table `cms_block_store`
--

INSERT INTO `cms_block_store` (`block_id`, `store_id`) VALUES
(5, 0),
(6, 1),
(7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_page`
--

CREATE TABLE IF NOT EXISTS `cms_page` (
  `page_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `root_template` varchar(255) NOT NULL DEFAULT '',
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `identifier` varchar(100) NOT NULL DEFAULT '',
  `content_heading` varchar(255) NOT NULL DEFAULT '',
  `content` mediumtext,
  `creation_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` tinyint(4) NOT NULL DEFAULT '0',
  `layout_update_xml` text,
  `custom_theme` varchar(100) DEFAULT NULL,
  `custom_root_template` varchar(255) NOT NULL DEFAULT '',
  `custom_layout_update_xml` text,
  `custom_theme_from` date DEFAULT NULL,
  `custom_theme_to` date DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='CMS pages' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `cms_page`
--

INSERT INTO `cms_page` (`page_id`, `title`, `root_template`, `meta_keywords`, `meta_description`, `identifier`, `content_heading`, `content`, `creation_time`, `update_time`, `is_active`, `sort_order`, `layout_update_xml`, `custom_theme`, `custom_root_template`, `custom_layout_update_xml`, `custom_theme_from`, `custom_theme_to`) VALUES
(1, '404 Not Found 1', 'three_columns', 'Page keywords', 'Page description', 'no-route', 'Sorry, our bad..', '<div class="col-1"><p><span class="underlineSpan">The page you requested was not found, and we have a fine guess why</span> </p>\r\n<ul class="ulFormat">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul>\r\n</div>\r\n<br/>\r\n<div class="col-2"><p><span class="underlineSpan">What can you do?</span></p>\r\n<ul class="ulFormat">\r\n<li><a onclick="history.go(-1); return false;" href="#">Go back</a> to the previous page.</li>\r\n<li>Follow these links to get you back on track!<br /><a href="{{store url=""}}">KapaSoft Home page</a></li>\r\n</ul>\r\n</div>', '2007-06-20 18:38:32', '2010-11-28 21:12:27', 1, 0, '', '', '', '', NULL, NULL),
(2, 'Home page', 'three_columns', '', '', 'home', 'Home Page Title', '<div class="col-1">\r\n<p>homepage comes her eand it his home page homepage comes her eand it his home pagehomepage comes her eand it his home pagehomepage comes her eand it his home pagehomepage comes her eand it his home pagehomepage comes her eand it his home pagehomepage comes her eand it his home pagehomepage comes her eand it his home pagehomepage comes her eand it his home pagehomepage comes her eand it his home pagehomepage comes her eand it his home pagehomepage comes her eand it his home pagehomepage comes her eand it his home pagehomepage comes her eand it his home pagehomepage comes her eand it his home page</p>\r\n</div>', '2007-08-23 10:03:25', '2010-11-28 16:40:43', 1, 0, '<!--<reference name="content">\r\n<block type="catalog/product_new" name="home.catalog.product.new" alias="product_new" template="catalog/product/new.phtml" after="cms_page"><action method="addPriceBlockType"><type>bundle</type><block>bundle/catalog_product_price</block><template>bundle/catalog/product/price.phtml</template></action></block>\r\n<block type="reports/product_viewed" name="home.reports.product.viewed" alias="product_viewed" template="reports/home_product_viewed.phtml" after="product_new"><action method="addPriceBlockType"><type>bundle</type><block>bundle/catalog_product_price</block><template>bundle/catalog/product/price.phtml</template></action></block>\r\n<block type="reports/product_compared" name="home.reports.product.compared" template="reports/home_product_compared.phtml" after="product_viewed"><action method="addPriceBlockType"><type>bundle</type><block>bundle/catalog_product_price</block><template>bundle/catalog/product/price.phtml</template></action></block>\r\n</reference><reference name="right">\r\n<action method="unsetChild"><alias>right.reports.product.viewed</alias></action>\r\n<action method="unsetChild"><alias>right.reports.product.compared</alias></action>\r\n</reference>-->', '', '', '', NULL, NULL),
(4, 'Customer Service', 'three_columns', '', '', 'customer-service', '', '<div class="page-title">\r\n<h1>Customer Service</h1>\r\n</div>\r\n<ul class="disc">\r\n<li><a href="#answer1">Shipping &amp; Delivery</a></li>\r\n<li><a href="#answer2">Privacy &amp; Security</a></li>\r\n<li><a href="#answer3">Returns &amp; Replacements</a></li>\r\n<li><a href="#answer4">Ordering</a></li>\r\n<li><a href="#answer5">Payment, Pricing &amp; Promotions</a></li>\r\n<li><a href="#answer6">Viewing Orders</a></li>\r\n<li><a href="#answer7">Updating Account Information</a></li>\r\n</ul>\r\n<dl>\r\n<dt id="answer1">Shipping &amp; Delivery</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id="answer2">Privacy &amp; Security</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id="answer3">Returns &amp; Replacements</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id="answer4">Ordering</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id="answer5">Payment, Pricing &amp; Promotions</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id="answer6">Viewing Orders</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id="answer7">Updating Account Information</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n</dl>', '2007-08-30 14:02:20', '2007-08-30 14:03:37', 1, 0, NULL, NULL, '', NULL, NULL, NULL),
(5, 'Enable Cookies', 'three_columns', '', '', 'enable-cookies', '', '<div class="std">\r\n    <ul class="messages">\r\n        <li class="notice-msg">\r\n            <ul>\r\n                <li>Please enable cookies in your web browser to continue.</li>\r\n            </ul>\r\n        </li>\r\n    </ul>\r\n    <div class="page-title">\r\n        <h1><a name="top"></a>What are Cookies?</h1>\r\n    </div>\r\n    <p>Cookies are short pieces of data that are sent to your computer when you visit a website. On later visits, this data is then returned to that website. Cookies allow us to recognize you automatically whenever you visit our site so that we can personalize your experience and provide you with better service. We also use cookies (and similar browser data, such as Flash cookies) for fraud prevention and other purposes. If your web browser is set to refuse cookies from our website, you will not be able to complete a purchase or take advantage of certain features of our website, such as storing items in your Shopping Cart or receiving personalized recommendations. As a result, we strongly encourage you to configure your web browser to accept cookies from our website.</p>\r\n    <h2 class="subtitle">Enabling Cookies</h2>\r\n    <ul class="disc">\r\n        <li><a href="#ie7">Internet Explorer 7.x</a></li>\r\n        <li><a href="#ie6">Internet Explorer 6.x</a></li>\r\n        <li><a href="#firefox">Mozilla/Firefox</a></li>\r\n        <li><a href="#opera">Opera 7.x</a></li>\r\n    </ul>\r\n    <h3><a name="ie7"></a>Internet Explorer 7.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Start Internet Explorer</p>\r\n        </li>\r\n        <li>\r\n            <p>Under the <strong>Tools</strong> menu, click <strong>Internet Options</strong></p>\r\n            <p><img src="{{skin url="images/cookies/ie7-1.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Privacy</strong> tab</p>\r\n            <p><img src="{{skin url="images/cookies/ie7-2.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Advanced</strong> button</p>\r\n            <p><img src="{{skin url="images/cookies/ie7-3.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Put a check mark in the box for <strong>Override Automatic Cookie Handling</strong>, put another check mark in the <strong>Always accept session cookies </strong>box</p>\r\n            <p><img src="{{skin url="images/cookies/ie7-4.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click <strong>OK</strong></p>\r\n            <p><img src="{{skin url="images/cookies/ie7-5.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click <strong>OK</strong></p>\r\n            <p><img src="{{skin url="images/cookies/ie7-6.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Restart Internet Explore</p>\r\n        </li>\r\n    </ol>\r\n    <p class="a-top"><a href="#top">Back to Top</a></p>\r\n    <h3><a name="ie6"></a>Internet Explorer 6.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Select <strong>Internet Options</strong> from the Tools menu</p>\r\n            <p><img src="{{skin url="images/cookies/ie6-1.gif"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> tab</p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Default</strong> button (or manually slide the bar down to <strong>Medium</strong>) under <strong>Settings</strong>. Click <strong>OK</strong></p>\r\n            <p><img src="{{skin url="images/cookies/ie6-2.gif"}}" alt="" /></p>\r\n        </li>\r\n    </ol>\r\n    <p class="a-top"><a href="#top">Back to Top</a></p>\r\n    <h3><a name="firefox"></a>Mozilla/Firefox</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Click on the <strong>Tools</strong>-menu in Mozilla</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Options...</strong> item in the menu - a new window open</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> selection in the left part of the window. (See image below)</p>\r\n            <p><img src="{{skin url="images/cookies/firefox.png"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Expand the <strong>Cookies</strong> section</p>\r\n        </li>\r\n        <li>\r\n            <p>Check the <strong>Enable cookies</strong> and <strong>Accept cookies normally</strong> checkboxes</p>\r\n        </li>\r\n        <li>\r\n            <p>Save changes by clicking <strong>Ok</strong>.</p>\r\n        </li>\r\n    </ol>\r\n    <p class="a-top"><a href="#top">Back to Top</a></p>\r\n    <h3><a name="opera"></a>Opera 7.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Click on the <strong>Tools</strong> menu in Opera</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Preferences...</strong> item in the menu - a new window open</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> selection near the bottom left of the window. (See image below)</p>\r\n            <p><img src="{{skin url="images/cookies/opera.png"}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>The <strong>Enable cookies</strong> checkbox must be checked, and <strong>Accept all cookies</strong> should be selected in the &quot;<strong>Normal cookies</strong>&quot; drop-down</p>\r\n        </li>\r\n        <li>\r\n            <p>Save changes by clicking <strong>Ok</strong></p>\r\n        </li>\r\n    </ol>\r\n    <p class="a-top"><a href="#top">Back to Top</a></p>\r\n</div>\r\n', '2010-11-25 14:27:09', '2010-12-13 00:37:02', 1, 0, '', '', '', '', NULL, NULL),
(6, 'ABOUT US', 'three_columns', '', '', 'what-is-kapasoft-web-design', 'About US', '<div class="col-1">\r\n<p><span class="boldSpan">Mission:</span> Work closely with clients to bring them the most efficient and qualitative software which can be easily modified to accommodate changing needs.</p>\r\n<br>\r\n<p><span class="boldSpan">Vision:</span> Use most current technology together with creativity to realize small or medium business organizational goals.</p>\r\n</div>\r\n<br>\r\n<br>\r\n<div class="col-2">\r\n<h4>Who Are We</h4>\r\n<p>The founder is Margot Kapacs who is finishing master''s degree in Computer Science and envisions a company to work for others. As the result, the KapaSoft was founded to  allow founder and other similar minded individuals pursuing the passion of technology without limits.</p>\r\n</div>\r\n<br>\r\n<div class="col-3">\r\n<p>Margots is from the small and beautiful Eastern European country of Latvia. When he was 19, he came to US, with little English language skills, to study Computer Science,  Economics and Finance. The hardships of adapting to a new environment, studying science in a different language and paying for his education have taught Margots  motivation and dedication. He is a committed person who believes that anything is possible. He is excited about the new venture and wants to apply the learned  computer science concepts in real life while inventing software that makes the world a better place.</p>\r\n</div>', '2010-11-28 20:26:29', '2010-12-12 20:11:05', 1, 0, '', '', '', '', NULL, NULL),
(7, 'WHY US', 'three_columns', '', '', 'why-Kapasoft-web-design', 'Why Us', '<div class="col-1">\r\n<p><span class="underlineSpan">We develop customized product.</span> We don''t use WYSIWYG(What You See Is What You Get) technology that limits development to only generic product and lacks the sophistication that is  required in today''s world. Instead, we use the most recent technologies such CSS, Ajex, JavaScript, PHP, Magento, Zend to develop efficient, durable and customized product.</p>\r\n</div>\r\n<p>&nbsp;</p>\r\n<div class="col-2">\r\n<p><span class="underlineSpan">No maintenance or update costs afterwards.</span> After product final product is delivered, many developers charge their customers for changing and updating content.  Instead, we create an interface to allow clients to easy and quickly update, change and maintain without our help. There are no other costs associated once  website is developed.</p>\r\n</div>\r\n<p>&nbsp;</p>\r\n<div class="col-3">\r\n<p><span class="underlineSpan">Tailored to client''s needs with innovative solutions.</span>Other developers do not involve costumers in their web development process. Costumers have little or no input until the final product is delivered to them. It''s different for our clients who are part of development process consistently provide feedback to our designer and developer. This is done virtually to make it easy and convenient. When everyone works together, new innovative solutions are discovered and implemented.</p>\r\n</div>', '2010-11-28 20:35:10', '2010-12-12 20:11:40', 1, 0, '', '', '', '', NULL, NULL),
(8, 'WHAT OTHERS SAY', 'three_columns', '', '', 'what-others-say-kapasoft-web-design', 'What Others Say', '<div class="col-1">\r\n<div class="othersComment"><img src="{{config path="web/unsecure/base_url"}}/skin/frontend/kapasoft/webdesign/images/leftQuotes.png" class="leftQuote" alt="left quote" />Margots has a surprising sense of taste. He can take notions such as "I like textures" and "I like deep colour with contrasts" and come up with a firm starting place for a website. Changing minute details in the site is never a problem. He is well versed in the possibilities for websites and builds your site with the technologies that fit what you want it to be able to do. My website, although new, comes up much higher in Google searches than I expected because Margots built it with that in mind ("clean", he says) and made sure that I followed through with keywords and optimization. He is always available to me to answer technical questions and seems genuinely invested in my website''s and my business'' success.<img src="{{config path="web/unsecure/base_url"}}/skin/frontend/kapasoft/webdesign/images/rightQuotes.png" class="rightQuote" alt="right quote" /></div>\r\n<div class="commentPerson">-Melissa Cathcart, L.Ac.       <a href="http://www.barefoot-doctor.net" target="_blank">Barefoot Doctor Community Healthcare</a></div>\r\n</div>\r\n\r\n<div class="col-2">\r\n<div class="othersComment"><img src="{{config path="web/unsecure/base_url"}}/skin/frontend/kapasoft/webdesign/images/leftQuotes.png" class="leftQuote" alt="left quote" />Margots exceeded our expectations. His creative designs were so much better than the templates out there we used before. We wanted our website to look different and now it does. Thank you Margots <img src="{{config path="web/unsecure/base_url"}}/skin/frontend/kapasoft/webdesign/images/rightQuotes.png" class="rightQuote" alt="right quote" /></div>\r\n<div class="commentPerson">-Lawrence Tan     <a href="http://www.lta-insurance.com" target="_blank">LTA Insurance</a></div>\r\n</div>', '2010-11-28 20:48:23', '2010-12-12 23:28:39', 1, 0, '', '', '', '', NULL, NULL),
(9, 'CONTACT US', 'three_columns', 'creative web design company in Minneapolis, web design templates Twin Cities, ecommerce Minneapolis, magento themes, magento templates, magento commerce, magento hosting, magento tutorial', 'Contact web design company in Minneapolis by submitting contact form and the web designer will respond to you soon', 'contact-web-design-company-minneapolis', 'Contact Us', '<div class="col-1">\r\n\r\n<!– CONTACT FORM –>\r\n{{block type="core/template" name="contactForm" form_action="/contacts/index/post" template="contactsKapasoft/form.phtml"}}\r\n<!– END OF CONTACT FORM –>\r\n\r\n</div>', '2010-11-28 20:50:20', '2011-01-17 20:17:55', 1, 0, '', '', '', '', NULL, NULL),
(10, 'HOW IT WORKS', 'three_columns', '', '', 'developing-kapasoft-web-design-for-client', 'How It Works', '<div class="col-1">\r\n<h4>Pre-Stage - Quick On-line Estimate</h4>\r\n<p>\r\nFor quick estimate, users may choose to fill out the online estimate form. After users have filled out and submitted the online estimate form, \r\nKapaSoft evaluates it and comes up with estimate of developing the user''s product. Clients are provided an estimate.   When client wants to proceed, \r\nKapaSoft sets up an appointment for client to meet the KapaSoft team. \r\n</p>\r\n<br/>\r\n<h4>Stage 1 - Learning Client Needs</h4>\r\n<p>\r\nIn stage one, the KapaSoft designer, manager and developer meets with the client. The client explains his/her needs as well provides KapaSoft with the \r\ncontent (text) for his/her potential product. Next, the KapaSoft designer, developer and manager each question client about different aspects of his/her \r\npotential product while better learning the client''s needs. After the meeting within 48 hours, KapaSoft provides the client with the final estimate of \r\ndeveloping the client''s product. This estimate breaks down all costs, so that clients can see what they are paying for and will decide development priority. \r\n</p>\r\n</div>\r\n<br/>\r\n<div class="col-2">\r\n<h4>Stage 2 - Agreement Is Achieved and Contract Is Signed</h4>\r\n<p>\r\nOnce the client and KapaSoft agree on cost, KapaSoft asks the client to sign a contract and make a down payment of 50% of the estimated investment. After \r\nthe agreement is signed and payment is made, client is provided with a KapaSoft online account that the client will use to participate in development process.\r\n</p>\r\n<br/>\r\n<h4>Stage 3 - Demos(Examples of Design) Proposed</h4>\r\n<p>\r\nStage 3 is the first design stage of development. Based on the client''s desires and needs, the KapaSoft designer develops three different possible designs, \r\nnamed product demo.  Then, the client receives an e-mail from KapaSoft in which client is asked to evaluate the three demos through his/her KapaSoft online \r\naccount. Once the client has evaluated the three demos, KapaSoft designer and client meet to agree on the details of client''s chosen design. Afterward, \r\nthe KapaSoft designer makes all changes and produces the final design of the product. Client accepts the final design and the implementation stage can begin.\r\n</p>\r\n</div>\r\n<br/>\r\n<div class="col-3">\r\n<h4>Stage 4 - Implementation With Continues Feedback.</h4>\r\n<p>\r\nDuring implementation, the developer will work closely with the client to better satisfy the client''s needs. At every development stage, the developer asks \r\nthe user to try out and provide feedback for the developed product. The client accesses the prototype of the product on KapaSoft Website and leaves feedback \r\nat his/her convenience. After receiving feedback from the user, the developer makes the changes and continues with the next development stage. (We found that \r\nby having client part of our development process, we not only better tailor client''s needs but also, along the way, discover innovative ways to increase value \r\nto the end product.)\r\n</p>\r\n</br>\r\n<h4>Stage 5 - Final Stage</h4>\r\n<p>\r\nOnce the product is developed, KapaSoft tests it for all possible bugs and faults. After the testing phase is completed, the client is asked for final time to \r\ntest the product online. If the client accepts the product as one that satisfies his/her needs, it is delivered to the client. At this time, the remaining balance is due.\r\n</p>\r\n<br/>\r\n<h4>Step 6 - Follow Up On Clients</h4>\r\n<p>\r\nDepending on client''s needs, after product delivery within 30 days, a KapaSoft expert follows up with the client to make sure everything is working as client expected. \r\n</p>\r\n</div>', '2010-11-28 21:21:33', '2010-12-12 20:10:27', 1, 0, '', '', '', '', NULL, NULL),
(11, 'GET QUOTE', 'three_columns', '', '', 'get-quote-from-KapaSoft-web-design', 'Get Quote', '<div class="col-1">\r\n<p>This page is under construction</p>\r\n</div>', '2010-11-28 21:25:42', '2010-12-12 20:09:32', 1, 0, '', '', '', '', NULL, NULL),
(12, 'WHAT WE DONE', 'three_columns', '', '', 'kapasoft-web-design-portfolio', 'What We Done', '<div class="col-1">\r\n\r\n<div class="portfolioImg"><a href="http://www.sidrabi.com" target="_blank"><img src="{{config path="web/unsecure/base_url"}}/skin/frontend/kapasoft/webdesign/images/porfolio/sidrabiImg.gif" alt="image of sidrabi website"/> </a></div>\r\n<div class="portfolioText">Bed & Breakfast "Sidrabi"  <button onClick="window.open(''http://www.sidrabi.com'')">View Website</button></div>\r\n</div>\r\n\r\n<div class="col-2">\r\n<div class="portfolioImg"><a href="http://www.lta-insurance.com" target="_blank"><img src="{{config path="web/unsecure/base_url"}}/skin/frontend/kapasoft/webdesign/images/porfolio/ltaInsuranceImg.png" alt="image of sidrabi website"/> </a></div>\r\n<div class="portfolioText">LTA Insurance LLC  <button onClick="window.open(''http://www.lta-insurance.com'')">View Website</button></div>\r\n</div>\r\n\r\n<div class="col-3">\r\n<div class="portfolioImg"><a href="http://www.barefoot-doctor.net" target="_blank"><img src="{{config path="web/unsecure/base_url"}}/skin/frontend/kapasoft/webdesign/images/porfolio/barefootImg.png" alt="image of barefoot doctor website"/> </a></div>\r\n<div class="portfolioText">Barefoot Doctor  <button onClick="window.open(''http://www.barefoot-doctor.net'')">View Website</button></div>\r\n</div>\r\n\r\n<div class="col-3">\r\n<div class="portfolioImg"><a href="http://www.anita888margots.com" target="_blank"><img src="{{config path="web/unsecure/base_url"}}/skin/frontend/kapasoft/webdesign/images/porfolio/anita888margotsImg.png" alt="image of antita and margots website"/> </a></div>\r\n<div class="portfolioText">Anitas and Margots Website  <button onClick="window.open(''http://www.anita888margots.com'')">View Website</button></div>\r\n</div>', '2010-11-28 21:30:33', '2010-12-12 20:08:11', 1, 0, '', '', '', '', NULL, NULL),
(13, 'HOW CAN WE HELP?', 'three_columns', '', '', 'how-can-kapasoft-web-design-help', 'How can we help', '<div class="col-1">\r\n<p>\r\n<span class="underlineSpan">Build a Website you actually like</span> - our unique custom specific Website designs with its original look will best promote the true identity of your business. Special attention is given to simplicity and website usability to earn the favor of your target audiences. Built on sound open source framework it provides the freedom and flexibility to take full control of your website and to adapt to new changes in the future.\r\n</p>\r\n</div>\r\n<br />\r\n<div class="col-2">\r\n<p>\r\n<span class="underlineSpan">Create an online store that is more than a store</span> – integrated on an award winning open source framework – Magento. Your store has all the features and capabilities an owner of an online store needs. Order and shipment management, built-in search index, reports on sales and Google products integrations just to name a few. If there is ever anything missing, there is a large open source community to provide the newest pre-tested solutions available for you to plug into your store at any time. This is the most cost effective method while having all the tools and features to get into or be successful in the e-commerce business.\r\n</p>\r\n</div>\r\n<br />\r\n<div class="col-3">\r\n<p>\r\n<span class="underlineSpan">Web application solutions</span>– whether it is reaching your new customers or cutting operational costs, we have the expertise as well the experience to bring you the most effective solutions for your needs. Our experts use their knowledge about current innovations in web technology to present you with all possible alternative solutions so that you can choose the one that will achieve your goals in the most effective and efficient way. We are passionate geeks that are eager to be challenged! Please, let us hear your need!\r\n</p>\r\n</div>', '2010-11-28 21:46:29', '2010-12-16 00:21:15', 1, 0, '', '', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_page_store`
--

CREATE TABLE IF NOT EXISTS `cms_page_store` (
  `page_id` smallint(6) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`page_id`,`store_id`),
  KEY `FK_CMS_PAGE_STORE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Pages to Stores';

--
-- Dumping data for table `cms_page_store`
--

INSERT INTO `cms_page_store` (`page_id`, `store_id`) VALUES
(4, 0),
(1, 1),
(2, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_cache`
--

CREATE TABLE IF NOT EXISTS `core_cache` (
  `id` varchar(255) NOT NULL,
  `data` mediumblob,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `expire_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_cache`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_cache_option`
--

CREATE TABLE IF NOT EXISTS `core_cache_option` (
  `code` varchar(32) NOT NULL,
  `value` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_cache_option`
--

INSERT INTO `core_cache_option` (`code`, `value`) VALUES
('block_html', 1),
('collections', 1),
('config', 1),
('config_api', 1),
('eav', 1),
('layout', 1),
('translate', 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_cache_tag`
--

CREATE TABLE IF NOT EXISTS `core_cache_tag` (
  `tag` varchar(255) NOT NULL,
  `cache_id` varchar(255) NOT NULL,
  KEY `IDX_TAG` (`tag`),
  KEY `IDX_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_cache_tag`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_config_data`
--

CREATE TABLE IF NOT EXISTS `core_config_data` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scope` enum('default','websites','stores','config') NOT NULL DEFAULT 'default',
  `scope_id` int(11) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT 'general',
  `value` text NOT NULL,
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `config_scope` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=78 ;

--
-- Dumping data for table `core_config_data`
--

INSERT INTO `core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`) VALUES
(1, 'default', 0, 'catalog/category/root_id', '2'),
(2, 'default', 0, 'web/unsecure/base_url', 'http://testkapasoft.com/'),
(3, 'default', 0, 'web/secure/base_url', 'http://testkapasoft.com/'),
(4, 'default', 0, 'general/locale/code', 'en_US'),
(5, 'default', 0, 'general/locale/timezone', 'America/Chicago'),
(6, 'default', 0, 'currency/options/base', 'USD'),
(7, 'default', 0, 'currency/options/default', 'USD'),
(8, 'default', 0, 'currency/options/allow', 'USD'),
(9, 'default', 0, 'design/package/name', 'kapasoft'),
(10, 'default', 0, 'design/package/ua_regexp', 'a:0:{}'),
(11, 'default', 0, 'design/theme/locale', ''),
(12, 'default', 0, 'design/theme/template', ''),
(13, 'default', 0, 'design/theme/template_ua_regexp', 'a:0:{}'),
(14, 'default', 0, 'design/theme/skin', ''),
(15, 'default', 0, 'design/theme/skin_ua_regexp', 'a:0:{}'),
(16, 'default', 0, 'design/theme/layout', ''),
(17, 'default', 0, 'design/theme/layout_ua_regexp', 'a:0:{}'),
(18, 'default', 0, 'design/theme/default', 'webdesign'),
(19, 'default', 0, 'design/theme/default_ua_regexp', 'a:0:{}'),
(20, 'default', 0, 'design/head/default_title', 'KapaSoft Web Design'),
(21, 'default', 0, 'design/head/title_prefix', ''),
(22, 'default', 0, 'design/head/title_suffix', ''),
(23, 'default', 0, 'design/head/default_description', 'KapaSoft Web Design'),
(24, 'default', 0, 'design/head/default_keywords', 'Web Design, Website development, Application development'),
(25, 'default', 0, 'design/head/default_robots', 'INDEX,FOLLOW'),
(26, 'default', 0, 'design/head/includes', ''),
(27, 'default', 0, 'design/head/demonotice', '0'),
(28, 'default', 0, 'design/header/logo_src', 'images/logo.png'),
(29, 'default', 0, 'design/header/logo_alt', 'KapaSoft Web Design'),
(30, 'default', 0, 'design/header/welcome', 'Default welcome msg!'),
(31, 'default', 0, 'design/footer/copyright', '&copy; 2010 KapaSoft Web Design. All Rights Reserved.'),
(32, 'default', 0, 'design/footer/absolute_footer', ''),
(33, 'default', 0, 'design/watermark/image_size', ''),
(34, 'default', 0, 'design/watermark/image_imageOpacity', ''),
(35, 'default', 0, 'design/watermark/image_position', 'stretch'),
(36, 'default', 0, 'design/watermark/small_image_size', ''),
(37, 'default', 0, 'design/watermark/small_image_imageOpacity', ''),
(38, 'default', 0, 'design/watermark/small_image_position', 'stretch'),
(39, 'default', 0, 'design/watermark/thumbnail_size', ''),
(40, 'default', 0, 'design/watermark/thumbnail_imageOpacity', ''),
(41, 'default', 0, 'design/watermark/thumbnail_position', 'stretch'),
(42, 'default', 0, 'design/pagination/pagination_frame', '5'),
(43, 'default', 0, 'design/pagination/pagination_frame_skip', ''),
(44, 'default', 0, 'design/pagination/anchor_text_for_previous', ''),
(45, 'default', 0, 'design/pagination/anchor_text_for_next', ''),
(46, 'default', 0, 'cms/wysiwyg/enabled', 'hidden'),
(47, 'default', 0, 'web/url/use_store', '0'),
(48, 'default', 0, 'web/url/redirect_to_base', '1'),
(49, 'default', 0, 'web/seo/use_rewrites', '0'),
(50, 'default', 0, 'web/unsecure/base_link_url', '{{unsecure_base_url}}'),
(51, 'default', 0, 'web/unsecure/base_skin_url', '{{unsecure_base_url}}skin/'),
(52, 'default', 0, 'web/unsecure/base_media_url', '{{unsecure_base_url}}media/'),
(53, 'default', 0, 'web/unsecure/base_js_url', '{{unsecure_base_url}}js/'),
(54, 'default', 0, 'web/secure/base_link_url', '{{secure_base_url}}'),
(55, 'default', 0, 'web/secure/base_skin_url', '{{secure_base_url}}skin/'),
(56, 'default', 0, 'web/secure/base_media_url', '{{secure_base_url}}media/'),
(57, 'default', 0, 'web/secure/base_js_url', '{{secure_base_url}}js/'),
(58, 'default', 0, 'web/secure/use_in_frontend', '0'),
(59, 'default', 0, 'web/secure/use_in_adminhtml', '0'),
(60, 'default', 0, 'web/default/front', 'cms'),
(61, 'default', 0, 'web/default/cms_home_page', 'how-can-kapasoft-web-design-help'),
(62, 'default', 0, 'web/default/no_route', 'cms/index/noRoute'),
(63, 'default', 0, 'web/default/cms_no_route', 'no-route'),
(64, 'default', 0, 'web/default/cms_no_cookies', 'enable-cookies'),
(65, 'default', 0, 'web/default/show_cms_breadcrumbs', '1'),
(66, 'default', 0, 'web/polls/poll_check_by_ip', '0'),
(67, 'default', 0, 'web/cookie/cookie_lifetime', '3600'),
(68, 'default', 0, 'web/cookie/cookie_path', ''),
(69, 'default', 0, 'web/cookie/cookie_domain', ''),
(70, 'default', 0, 'web/cookie/cookie_httponly', '1'),
(71, 'default', 0, 'web/session/use_remote_addr', '0'),
(72, 'default', 0, 'web/session/use_http_via', '0'),
(73, 'default', 0, 'web/session/use_http_x_forwarded_for', '0'),
(74, 'default', 0, 'web/session/use_http_user_agent', '0'),
(75, 'default', 0, 'web/session/use_frontend_sid', '1'),
(76, 'default', 0, 'web/browser_capabilities/cookies', '1'),
(77, 'default', 0, 'web/browser_capabilities/javascript', '1');

-- --------------------------------------------------------

--
-- Table structure for table `core_email_template`
--

CREATE TABLE IF NOT EXISTS `core_email_template` (
  `template_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `template_code` varchar(150) DEFAULT NULL,
  `template_text` text,
  `template_styles` text,
  `template_type` int(3) unsigned DEFAULT NULL,
  `template_subject` varchar(200) DEFAULT NULL,
  `template_sender_name` varchar(200) DEFAULT NULL,
  `template_sender_email` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `added_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `orig_template_code` varchar(200) DEFAULT NULL,
  `orig_template_variables` text NOT NULL,
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `template_code` (`template_code`),
  KEY `added_at` (`added_at`),
  KEY `modified_at` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email templates' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `core_email_template`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_flag`
--

CREATE TABLE IF NOT EXISTS `core_flag` (
  `flag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flag_code` varchar(255) NOT NULL,
  `state` smallint(5) unsigned NOT NULL DEFAULT '0',
  `flag_data` text,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`flag_id`),
  KEY `last_update` (`last_update`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `core_flag`
--

INSERT INTO `core_flag` (`flag_id`, `flag_code`, `state`, `flag_data`, `last_update`) VALUES
(1, 'admin_notification_survey', 0, 'a:1:{s:13:"survey_viewed";b:1;}', '2010-11-25 14:30:22');

-- --------------------------------------------------------

--
-- Table structure for table `core_layout_link`
--

CREATE TABLE IF NOT EXISTS `core_layout_link` (
  `layout_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `area` varchar(64) NOT NULL DEFAULT '',
  `package` varchar(64) NOT NULL DEFAULT '',
  `theme` varchar(64) NOT NULL DEFAULT '',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`layout_link_id`),
  UNIQUE KEY `store_id` (`store_id`,`package`,`theme`,`layout_update_id`),
  KEY `FK_core_layout_link_update` (`layout_update_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `core_layout_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_layout_update`
--

CREATE TABLE IF NOT EXISTS `core_layout_update` (
  `layout_update_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) DEFAULT NULL,
  `xml` text,
  `sort_order` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`layout_update_id`),
  KEY `handle` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `core_layout_update`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_resource`
--

CREATE TABLE IF NOT EXISTS `core_resource` (
  `code` varchar(50) NOT NULL DEFAULT '',
  `version` varchar(50) NOT NULL DEFAULT '',
  `data_version` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resource version registry';

--
-- Dumping data for table `core_resource`
--

INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES
('adminnotification_setup', '1.0.0', '1.0.0'),
('admin_setup', '0.7.2', '0.7.2'),
('api_setup', '0.8.1', '0.8.1'),
('backup_setup', '0.7.0', '0.7.0'),
('bundle_setup', '0.1.11', '0.1.11'),
('catalogindex_setup', '0.7.10', '0.7.10'),
('cataloginventory_setup', '0.7.5', '0.7.5'),
('catalogrule_setup', '0.7.8', '0.7.8'),
('catalogsearch_setup', '0.7.7', '0.7.7'),
('catalog_setup', '1.4.0.0.21', '1.4.0.0.21'),
('checkout_setup', '0.9.5', '0.9.5'),
('cms_setup', '0.7.13', '0.7.13'),
('compiler_setup', '0.1.0', '0.1.0'),
('contacts_setup', '0.8.0', '0.8.0'),
('core_setup', '0.8.26', '0.8.26'),
('cron_setup', '0.7.1', '0.7.1'),
('customer_setup', '1.4.0.0.6', '1.4.0.0.6'),
('dataflow_setup', '0.7.4', '0.7.4'),
('directory_setup', '0.8.10', '0.8.10'),
('downloadable_setup', '0.1.16', '0.1.16'),
('eav_setup', '0.7.15', '0.7.15'),
('giftmessage_setup', '0.7.2', '0.7.2'),
('googlebase_setup', '0.1.1', '0.1.1'),
('googlecheckout_setup', '0.7.3', '0.7.3'),
('googleoptimizer_setup', '0.1.2', '0.1.2'),
('index_setup', '1.4.0.2', '1.4.0.2'),
('log_setup', '0.7.7', '0.7.7'),
('moneybookers_setup', '1.2', '1.2'),
('newsletter_setup', '0.8.2', '0.8.2'),
('paygate_setup', '0.7.1', '0.7.1'),
('payment_setup', '0.7.0', '0.7.0'),
('paypaluk_setup', '0.7.0', '0.7.0'),
('paypal_setup', '0.7.4', '0.7.4'),
('poll_setup', '0.7.2', '0.7.2'),
('productalert_setup', '0.7.2', '0.7.2'),
('rating_setup', '0.7.2', '0.7.2'),
('reports_setup', '0.7.10', '0.7.10'),
('review_setup', '0.7.6', '0.7.6'),
('salesrule_setup', '0.7.12', '0.7.12'),
('sales_setup', '0.9.56', '0.9.56'),
('sendfriend_setup', '0.7.4', '0.7.4'),
('shipping_setup', '0.7.0', '0.7.0'),
('sitemap_setup', '0.7.2', '0.7.2'),
('tag_setup', '0.7.5', '0.7.5'),
('tax_setup', '0.7.11', '0.7.11'),
('usa_setup', '0.7.1', '0.7.1'),
('weee_setup', '0.13', '0.13'),
('widget_setup', '1.4.0.0.0', '1.4.0.0.0'),
('wishlist_setup', '0.7.7', '0.7.7');

-- --------------------------------------------------------

--
-- Table structure for table `core_session`
--

CREATE TABLE IF NOT EXISTS `core_session` (
  `session_id` varchar(255) NOT NULL DEFAULT '',
  `website_id` smallint(5) unsigned DEFAULT NULL,
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `session_data` mediumblob NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `FK_SESSION_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Session data store';

--
-- Dumping data for table `core_session`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_store`
--

CREATE TABLE IF NOT EXISTS `core_store` (
  `store_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL DEFAULT '',
  `website_id` smallint(5) unsigned DEFAULT '0',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK_STORE_WEBSITE` (`website_id`),
  KEY `is_active` (`is_active`,`sort_order`),
  KEY `FK_STORE_GROUP` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `core_store`
--

INSERT INTO `core_store` (`store_id`, `code`, `website_id`, `group_id`, `name`, `sort_order`, `is_active`) VALUES
(0, 'admin', 0, 0, 'Admin', 0, 1),
(1, 'default', 1, 1, 'Default Store View', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_store_group`
--

CREATE TABLE IF NOT EXISTS `core_store_group` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `root_category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `default_store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`),
  KEY `FK_STORE_GROUP_WEBSITE` (`website_id`),
  KEY `default_store_id` (`default_store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `core_store_group`
--

INSERT INTO `core_store_group` (`group_id`, `website_id`, `name`, `root_category_id`, `default_store_id`) VALUES
(0, 0, 'Default', 0, 0),
(1, 1, 'Main Website Store', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_translate`
--

CREATE TABLE IF NOT EXISTS `core_translate` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `string` varchar(255) NOT NULL DEFAULT '',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `translate` varchar(255) NOT NULL DEFAULT '',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US',
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `IDX_CODE` (`store_id`,`locale`,`string`),
  KEY `FK_CORE_TRANSLATE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Translation data' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `core_translate`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_url_rewrite`
--

CREATE TABLE IF NOT EXISTS `core_url_rewrite` (
  `url_rewrite_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `category_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `id_path` varchar(255) NOT NULL DEFAULT '',
  `request_path` varchar(255) NOT NULL DEFAULT '',
  `target_path` varchar(255) NOT NULL DEFAULT '',
  `is_system` tinyint(1) unsigned DEFAULT '1',
  `options` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`url_rewrite_id`),
  UNIQUE KEY `UNQ_REQUEST_PATH` (`request_path`,`store_id`),
  UNIQUE KEY `UNQ_PATH` (`id_path`,`is_system`,`store_id`),
  KEY `FK_CORE_URL_REWRITE_STORE` (`store_id`),
  KEY `IDX_ID_PATH` (`id_path`),
  KEY `IDX_TARGET_PATH` (`target_path`,`store_id`),
  KEY `FK_CORE_URL_REWRITE_PRODUCT` (`product_id`),
  KEY `IDX_CATEGORY_REWRITE` (`category_id`,`is_system`,`product_id`,`store_id`,`id_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `core_url_rewrite`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_variable`
--

CREATE TABLE IF NOT EXISTS `core_variable` (
  `variable_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`variable_id`),
  UNIQUE KEY `IDX_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `core_variable`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_variable_value`
--

CREATE TABLE IF NOT EXISTS `core_variable_value` (
  `value_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `variable_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `plain_value` text NOT NULL,
  `html_value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_VARIABLE_STORE` (`variable_id`,`store_id`),
  KEY `IDX_VARIABLE_ID` (`variable_id`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `core_variable_value`
--


-- --------------------------------------------------------

--
-- Table structure for table `core_website`
--

CREATE TABLE IF NOT EXISTS `core_website` (
  `website_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `default_group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`website_id`),
  UNIQUE KEY `code` (`code`),
  KEY `sort_order` (`sort_order`),
  KEY `default_group_id` (`default_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Websites' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `core_website`
--

INSERT INTO `core_website` (`website_id`, `code`, `name`, `sort_order`, `default_group_id`, `is_default`) VALUES
(0, 'admin', 'Admin', 0, 0, 0),
(1, 'base', 'Main Website', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_aggregated`
--

CREATE TABLE IF NOT EXISTS `coupon_aggregated` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `coupon_code` varchar(50) NOT NULL DEFAULT '',
  `coupon_uses` int(11) NOT NULL DEFAULT '0',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_COUPON_AGGREGATED_PSOC` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `coupon_aggregated`
--


-- --------------------------------------------------------

--
-- Table structure for table `coupon_aggregated_order`
--

CREATE TABLE IF NOT EXISTS `coupon_aggregated_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `coupon_code` varchar(50) NOT NULL DEFAULT '',
  `coupon_uses` int(11) NOT NULL DEFAULT '0',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_COUPON_AGGREGATED_ORDER_PSOC` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `coupon_aggregated_order`
--


-- --------------------------------------------------------

--
-- Table structure for table `cron_schedule`
--

CREATE TABLE IF NOT EXISTS `cron_schedule` (
  `schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_code` varchar(255) NOT NULL DEFAULT '0',
  `status` enum('pending','running','success','missed','error') NOT NULL DEFAULT 'pending',
  `messages` text,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `executed_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `finished_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`schedule_id`),
  KEY `task_name` (`job_code`),
  KEY `scheduled_at` (`scheduled_at`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cron_schedule`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity`
--

CREATE TABLE IF NOT EXISTS `customer_address_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `increment_id` varchar(50) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entity_id`),
  KEY `FK_CUSTOMER_ADDRESS_CUSTOMER_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Customer Address Entities' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_address_entity`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_datetime`
--

CREATE TABLE IF NOT EXISTS `customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_address_entity_datetime`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_decimal`
--

CREATE TABLE IF NOT EXISTS `customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_address_entity_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_int`
--

CREATE TABLE IF NOT EXISTS `customer_address_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_address_entity_int`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_text`
--

CREATE TABLE IF NOT EXISTS `customer_address_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ENTITY` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_address_entity_text`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_varchar`
--

CREATE TABLE IF NOT EXISTS `customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_address_entity_varchar`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_eav_attribute`
--

CREATE TABLE IF NOT EXISTS `customer_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `is_visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_visible_on_front` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `input_filter` varchar(255) NOT NULL,
  `lines_to_divide_multiline` smallint(5) unsigned NOT NULL DEFAULT '0',
  `min_text_length` int(11) unsigned NOT NULL DEFAULT '0',
  `max_text_length` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `customer_eav_attribute`
--

INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `is_visible_on_front`, `input_filter`, `lines_to_divide_multiline`, `min_text_length`, `max_text_length`) VALUES
(1, 1, 0, '', 0, 0, 0),
(2, 0, 0, '', 0, 0, 0),
(3, 1, 0, '', 0, 0, 0),
(4, 1, 0, '', 0, 0, 0),
(5, 1, 0, '', 0, 0, 0),
(6, 1, 0, '', 0, 0, 0),
(7, 1, 0, '', 0, 0, 0),
(8, 1, 0, '', 0, 0, 0),
(9, 1, 0, '', 0, 0, 0),
(10, 1, 0, '', 0, 0, 0),
(11, 1, 0, '', 0, 0, 0),
(12, 1, 0, '', 0, 0, 0),
(13, 0, 0, '', 0, 0, 0),
(14, 0, 0, '', 0, 0, 0),
(15, 1, 0, '', 0, 0, 0),
(16, 0, 0, '', 0, 0, 0),
(17, 0, 0, '', 0, 0, 0),
(18, 1, 0, '', 0, 0, 0),
(19, 1, 0, '', 0, 0, 0),
(20, 1, 0, '', 0, 0, 0),
(21, 1, 0, '', 0, 0, 0),
(22, 1, 0, '', 0, 0, 0),
(23, 1, 0, '', 0, 0, 0),
(24, 1, 0, '', 0, 0, 0),
(25, 1, 0, '', 0, 0, 0),
(26, 1, 0, '', 0, 0, 0),
(27, 1, 0, '', 0, 0, 0),
(28, 1, 0, '', 0, 0, 0),
(29, 1, 0, '', 0, 0, 0),
(30, 1, 0, '', 0, 0, 0),
(31, 1, 0, '', 0, 0, 0),
(32, 1, 0, '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity`
--

CREATE TABLE IF NOT EXISTS `customer_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `group_id` smallint(3) unsigned NOT NULL DEFAULT '0',
  `increment_id` varchar(50) NOT NULL DEFAULT '',
  `store_id` smallint(5) unsigned DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entity_id`),
  KEY `FK_CUSTOMER_ENTITY_STORE` (`store_id`),
  KEY `IDX_ENTITY_TYPE` (`entity_type_id`),
  KEY `IDX_AUTH` (`email`,`website_id`),
  KEY `FK_CUSTOMER_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Customer Entityies' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_entity`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_datetime`
--

CREATE TABLE IF NOT EXISTS `customer_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_DATETIME_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_entity_datetime`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_decimal`
--

CREATE TABLE IF NOT EXISTS `customer_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_DECIMAL_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_entity_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_int`
--

CREATE TABLE IF NOT EXISTS `customer_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_INT_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_entity_int`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_text`
--

CREATE TABLE IF NOT EXISTS `customer_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_TEXT_ENTITY` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_entity_text`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_varchar`
--

CREATE TABLE IF NOT EXISTS `customer_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_VARCHAR_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer_entity_varchar`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer_group`
--

CREATE TABLE IF NOT EXISTS `customer_group` (
  `customer_group_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_code` varchar(32) NOT NULL DEFAULT '',
  `tax_class_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Customer groups' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_group`
--

INSERT INTO `customer_group` (`customer_group_id`, `customer_group_code`, `tax_class_id`) VALUES
(0, 'NOT LOGGED IN', 3),
(1, 'General', 3),
(2, 'Wholesale', 3),
(3, 'Retailer', 3);

-- --------------------------------------------------------

--
-- Table structure for table `dataflow_batch`
--

CREATE TABLE IF NOT EXISTS `dataflow_batch` (
  `batch_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `adapter` varchar(128) DEFAULT NULL,
  `params` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`batch_id`),
  KEY `FK_DATAFLOW_BATCH_PROFILE` (`profile_id`),
  KEY `FK_DATAFLOW_BATCH_STORE` (`store_id`),
  KEY `IDX_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dataflow_batch`
--


-- --------------------------------------------------------

--
-- Table structure for table `dataflow_batch_export`
--

CREATE TABLE IF NOT EXISTS `dataflow_batch_export` (
  `batch_export_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` int(10) unsigned NOT NULL DEFAULT '0',
  `batch_data` longtext,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`batch_export_id`),
  KEY `FK_DATAFLOW_BATCH_EXPORT_BATCH` (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dataflow_batch_export`
--


-- --------------------------------------------------------

--
-- Table structure for table `dataflow_batch_import`
--

CREATE TABLE IF NOT EXISTS `dataflow_batch_import` (
  `batch_import_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` int(10) unsigned NOT NULL DEFAULT '0',
  `batch_data` longtext,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`batch_import_id`),
  KEY `FK_DATAFLOW_BATCH_IMPORT_BATCH` (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dataflow_batch_import`
--


-- --------------------------------------------------------

--
-- Table structure for table `dataflow_import_data`
--

CREATE TABLE IF NOT EXISTS `dataflow_import_data` (
  `import_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `serial_number` int(11) NOT NULL DEFAULT '0',
  `value` text,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`import_id`),
  KEY `FK_dataflow_import_data` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dataflow_import_data`
--


-- --------------------------------------------------------

--
-- Table structure for table `dataflow_profile`
--

CREATE TABLE IF NOT EXISTS `dataflow_profile` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `actions_xml` text,
  `gui_data` text,
  `direction` enum('import','export') DEFAULT NULL,
  `entity_type` varchar(64) NOT NULL DEFAULT '',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `data_transfer` enum('file','interactive') DEFAULT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `dataflow_profile`
--

INSERT INTO `dataflow_profile` (`profile_id`, `name`, `created_at`, `updated_at`, `actions_xml`, `gui_data`, `direction`, `entity_type`, `store_id`, `data_transfer`) VALUES
(1, 'Export All Products', '2010-11-25 08:27:09', '2010-11-25 08:27:09', '<action type="catalog/convert_adapter_product" method="load">\r\n    <var name="store"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type="catalog/convert_parser_product" method="unparse">\r\n    <var name="store"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type="dataflow/convert_mapper_column" method="map">\r\n</action>\r\n\r\n<action type="dataflow/convert_parser_csv" method="unparse">\r\n    <var name="delimiter"><![CDATA[,]]></var>\r\n    <var name="enclose"><![CDATA["]]></var>\r\n    <var name="fieldnames">true</var>\r\n</action>\r\n\r\n<action type="dataflow/convert_adapter_io" method="save">\r\n    <var name="type">file</var>\r\n    <var name="path">var/export</var>\r\n    <var name="filename"><![CDATA[export_all_products.csv]]></var>\r\n</action>\r\n\r\n', 'a:5:{s:4:"file";a:7:{s:4:"type";s:4:"file";s:8:"filename";s:23:"export_all_products.csv";s:4:"path";s:10:"var/export";s:4:"host";s:0:"";s:4:"user";s:0:"";s:8:"password";s:0:"";s:7:"passive";s:0:"";}s:5:"parse";a:5:{s:4:"type";s:3:"csv";s:12:"single_sheet";s:0:"";s:9:"delimiter";s:1:",";s:7:"enclose";s:1:""";s:10:"fieldnames";s:4:"true";}s:3:"map";a:3:{s:14:"only_specified";s:0:"";s:7:"product";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}s:8:"customer";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}}s:7:"product";a:1:{s:6:"filter";a:8:{s:4:"name";s:0:"";s:3:"sku";s:0:"";s:4:"type";s:1:"0";s:13:"attribute_set";s:0:"";s:5:"price";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:3:"qty";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:10:"visibility";s:1:"0";s:6:"status";s:1:"0";}}s:8:"customer";a:1:{s:6:"filter";a:10:{s:9:"firstname";s:0:"";s:8:"lastname";s:0:"";s:5:"email";s:0:"";s:5:"group";s:1:"0";s:10:"adressType";s:15:"default_billing";s:9:"telephone";s:0:"";s:8:"postcode";s:0:"";s:7:"country";s:0:"";s:6:"region";s:0:"";s:10:"created_at";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}}}}', 'export', 'product', 0, 'file'),
(2, 'Export Product Stocks', '2010-11-25 08:27:09', '2010-11-25 08:27:09', '<action type="catalog/convert_adapter_product" method="load">\r\n    <var name="store"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type="catalog/convert_parser_product" method="unparse">\r\n    <var name="store"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type="dataflow/convert_mapper_column" method="map">\r\n    <var name="map">\r\n        <map name="store"><![CDATA[store]]></map>\r\n        <map name="sku"><![CDATA[sku]]></map>\r\n        <map name="qty"><![CDATA[qty]]></map>\r\n        <map name="is_in_stock"><![CDATA[is_in_stock]]></map>\r\n    </var>\r\n    <var name="_only_specified">true</var>\r\n</action>\r\n\r\n<action type="dataflow/convert_parser_csv" method="unparse">\r\n    <var name="delimiter"><![CDATA[,]]></var>\r\n    <var name="enclose"><![CDATA["]]></var>\r\n    <var name="fieldnames">true</var>\r\n</action>\r\n\r\n<action type="dataflow/convert_adapter_io" method="save">\r\n    <var name="type">file</var>\r\n    <var name="path">var/export</var>\r\n    <var name="filename"><![CDATA[export_product_stocks.csv]]></var>\r\n</action>\r\n\r\n', 'a:5:{s:4:"file";a:7:{s:4:"type";s:4:"file";s:8:"filename";s:25:"export_product_stocks.csv";s:4:"path";s:10:"var/export";s:4:"host";s:0:"";s:4:"user";s:0:"";s:8:"password";s:0:"";s:7:"passive";s:0:"";}s:5:"parse";a:5:{s:4:"type";s:3:"csv";s:12:"single_sheet";s:0:"";s:9:"delimiter";s:1:",";s:7:"enclose";s:1:""";s:10:"fieldnames";s:4:"true";}s:3:"map";a:3:{s:14:"only_specified";s:4:"true";s:7:"product";a:2:{s:2:"db";a:4:{i:1;s:5:"store";i:2;s:3:"sku";i:3;s:3:"qty";i:4;s:11:"is_in_stock";}s:4:"file";a:4:{i:1;s:5:"store";i:2;s:3:"sku";i:3;s:3:"qty";i:4;s:11:"is_in_stock";}}s:8:"customer";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}}s:7:"product";a:1:{s:6:"filter";a:8:{s:4:"name";s:0:"";s:3:"sku";s:0:"";s:4:"type";s:1:"0";s:13:"attribute_set";s:0:"";s:5:"price";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:3:"qty";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:10:"visibility";s:1:"0";s:6:"status";s:1:"0";}}s:8:"customer";a:1:{s:6:"filter";a:10:{s:9:"firstname";s:0:"";s:8:"lastname";s:0:"";s:5:"email";s:0:"";s:5:"group";s:1:"0";s:10:"adressType";s:15:"default_billing";s:9:"telephone";s:0:"";s:8:"postcode";s:0:"";s:7:"country";s:0:"";s:6:"region";s:0:"";s:10:"created_at";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}}}}', 'export', 'product', 0, 'file'),
(3, 'Import All Products', '2010-11-25 08:27:09', '2010-11-25 08:27:09', '<action type="dataflow/convert_parser_csv" method="parse">\r\n    <var name="delimiter"><![CDATA[,]]></var>\r\n    <var name="enclose"><![CDATA["]]></var>\r\n    <var name="fieldnames">true</var>\r\n    <var name="store"><![CDATA[0]]></var>\r\n    <var name="adapter">catalog/convert_adapter_product</var>\r\n    <var name="method">parse</var>\r\n</action>', 'a:5:{s:4:"file";a:7:{s:4:"type";s:4:"file";s:8:"filename";s:23:"export_all_products.csv";s:4:"path";s:10:"var/export";s:4:"host";s:0:"";s:4:"user";s:0:"";s:8:"password";s:0:"";s:7:"passive";s:0:"";}s:5:"parse";a:5:{s:4:"type";s:3:"csv";s:12:"single_sheet";s:0:"";s:9:"delimiter";s:1:",";s:7:"enclose";s:1:""";s:10:"fieldnames";s:4:"true";}s:3:"map";a:3:{s:14:"only_specified";s:0:"";s:7:"product";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}s:8:"customer";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}}s:7:"product";a:1:{s:6:"filter";a:8:{s:4:"name";s:0:"";s:3:"sku";s:0:"";s:4:"type";s:1:"0";s:13:"attribute_set";s:0:"";s:5:"price";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:3:"qty";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:10:"visibility";s:1:"0";s:6:"status";s:1:"0";}}s:8:"customer";a:1:{s:6:"filter";a:10:{s:9:"firstname";s:0:"";s:8:"lastname";s:0:"";s:5:"email";s:0:"";s:5:"group";s:1:"0";s:10:"adressType";s:15:"default_billing";s:9:"telephone";s:0:"";s:8:"postcode";s:0:"";s:7:"country";s:0:"";s:6:"region";s:0:"";s:10:"created_at";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}}}}', 'import', 'product', 0, 'interactive'),
(4, 'Import Product Stocks', '2010-11-25 08:27:09', '2010-11-25 08:27:09', '<action type="dataflow/convert_parser_csv" method="parse">\r\n    <var name="delimiter"><![CDATA[,]]></var>\r\n    <var name="enclose"><![CDATA["]]></var>\r\n    <var name="fieldnames">true</var>\r\n    <var name="store"><![CDATA[0]]></var>\r\n    <var name="adapter">catalog/convert_adapter_product</var>\r\n    <var name="method">parse</var>\r\n</action>', 'a:5:{s:4:"file";a:7:{s:4:"type";s:4:"file";s:8:"filename";s:18:"export_product.csv";s:4:"path";s:10:"var/export";s:4:"host";s:0:"";s:4:"user";s:0:"";s:8:"password";s:0:"";s:7:"passive";s:0:"";}s:5:"parse";a:5:{s:4:"type";s:3:"csv";s:12:"single_sheet";s:0:"";s:9:"delimiter";s:1:",";s:7:"enclose";s:1:""";s:10:"fieldnames";s:4:"true";}s:3:"map";a:3:{s:14:"only_specified";s:0:"";s:7:"product";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}s:8:"customer";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}}s:7:"product";a:1:{s:6:"filter";a:8:{s:4:"name";s:0:"";s:3:"sku";s:0:"";s:4:"type";s:1:"0";s:13:"attribute_set";s:0:"";s:5:"price";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:3:"qty";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:10:"visibility";s:1:"0";s:6:"status";s:1:"0";}}s:8:"customer";a:1:{s:6:"filter";a:10:{s:9:"firstname";s:0:"";s:8:"lastname";s:0:"";s:5:"email";s:0:"";s:5:"group";s:1:"0";s:10:"adressType";s:15:"default_billing";s:9:"telephone";s:0:"";s:8:"postcode";s:0:"";s:7:"country";s:0:"";s:6:"region";s:0:"";s:10:"created_at";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}}}}', 'import', 'product', 0, 'interactive'),
(5, 'Export Customers', '2010-11-25 08:27:09', '2010-11-25 08:27:09', '<action type="customer/convert_adapter_customer" method="load">\r\n    <var name="store"><![CDATA[0]]></var>\r\n    <var name="filter/adressType"><![CDATA[default_billing]]></var>\r\n</action>\r\n\r\n<action type="customer/convert_parser_customer" method="unparse">\r\n    <var name="store"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type="dataflow/convert_mapper_column" method="map">\r\n</action>\r\n\r\n<action type="dataflow/convert_parser_csv" method="unparse">\r\n    <var name="delimiter"><![CDATA[,]]></var>\r\n    <var name="enclose"><![CDATA["]]></var>\r\n    <var name="fieldnames">true</var>\r\n</action>\r\n\r\n<action type="dataflow/convert_adapter_io" method="save">\r\n    <var name="type">file</var>\r\n    <var name="path">var/export</var>\r\n    <var name="filename"><![CDATA[export_customers.csv]]></var>\r\n</action>\r\n\r\n', 'a:5:{s:4:"file";a:7:{s:4:"type";s:4:"file";s:8:"filename";s:20:"export_customers.csv";s:4:"path";s:10:"var/export";s:4:"host";s:0:"";s:4:"user";s:0:"";s:8:"password";s:0:"";s:7:"passive";s:0:"";}s:5:"parse";a:5:{s:4:"type";s:3:"csv";s:12:"single_sheet";s:0:"";s:9:"delimiter";s:1:",";s:7:"enclose";s:1:""";s:10:"fieldnames";s:4:"true";}s:3:"map";a:3:{s:14:"only_specified";s:0:"";s:7:"product";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}s:8:"customer";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}}s:7:"product";a:1:{s:6:"filter";a:8:{s:4:"name";s:0:"";s:3:"sku";s:0:"";s:4:"type";s:1:"0";s:13:"attribute_set";s:0:"";s:5:"price";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:3:"qty";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:10:"visibility";s:1:"0";s:6:"status";s:1:"0";}}s:8:"customer";a:1:{s:6:"filter";a:10:{s:9:"firstname";s:0:"";s:8:"lastname";s:0:"";s:5:"email";s:0:"";s:5:"group";s:1:"0";s:10:"adressType";s:15:"default_billing";s:9:"telephone";s:0:"";s:8:"postcode";s:0:"";s:7:"country";s:0:"";s:6:"region";s:0:"";s:10:"created_at";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}}}}', 'export', 'customer', 0, 'file'),
(6, 'Import Customers', '2010-11-25 08:27:09', '2010-11-25 08:27:09', '<action type="dataflow/convert_parser_csv" method="parse">\r\n    <var name="delimiter"><![CDATA[,]]></var>\r\n    <var name="enclose"><![CDATA["]]></var>\r\n    <var name="fieldnames">true</var>\r\n    <var name="store"><![CDATA[0]]></var>\r\n    <var name="adapter">customer/convert_adapter_customer</var>\r\n    <var name="method">parse</var>\r\n</action>', 'a:5:{s:4:"file";a:7:{s:4:"type";s:4:"file";s:8:"filename";s:19:"export_customer.csv";s:4:"path";s:10:"var/export";s:4:"host";s:0:"";s:4:"user";s:0:"";s:8:"password";s:0:"";s:7:"passive";s:0:"";}s:5:"parse";a:5:{s:4:"type";s:3:"csv";s:12:"single_sheet";s:0:"";s:9:"delimiter";s:1:",";s:7:"enclose";s:1:""";s:10:"fieldnames";s:4:"true";}s:3:"map";a:3:{s:14:"only_specified";s:0:"";s:7:"product";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}s:8:"customer";a:2:{s:2:"db";a:0:{}s:4:"file";a:0:{}}}s:7:"product";a:1:{s:6:"filter";a:8:{s:4:"name";s:0:"";s:3:"sku";s:0:"";s:4:"type";s:1:"0";s:13:"attribute_set";s:0:"";s:5:"price";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:3:"qty";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}s:10:"visibility";s:1:"0";s:6:"status";s:1:"0";}}s:8:"customer";a:1:{s:6:"filter";a:10:{s:9:"firstname";s:0:"";s:8:"lastname";s:0:"";s:5:"email";s:0:"";s:5:"group";s:1:"0";s:10:"adressType";s:15:"default_billing";s:9:"telephone";s:0:"";s:8:"postcode";s:0:"";s:7:"country";s:0:"";s:6:"region";s:0:"";s:10:"created_at";a:2:{s:4:"from";s:0:"";s:2:"to";s:0:"";}}}}', 'import', 'customer', 0, 'interactive');

-- --------------------------------------------------------

--
-- Table structure for table `dataflow_profile_history`
--

CREATE TABLE IF NOT EXISTS `dataflow_profile_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0',
  `action_code` varchar(64) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `performed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `FK_dataflow_profile_history` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dataflow_profile_history`
--


-- --------------------------------------------------------

--
-- Table structure for table `dataflow_session`
--

CREATE TABLE IF NOT EXISTS `dataflow_session` (
  `session_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `direction` varchar(32) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dataflow_session`
--


-- --------------------------------------------------------

--
-- Table structure for table `design_change`
--

CREATE TABLE IF NOT EXISTS `design_change` (
  `design_change_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `design` varchar(255) NOT NULL DEFAULT '',
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  PRIMARY KEY (`design_change_id`),
  KEY `FK_DESIGN_CHANGE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `design_change`
--


-- --------------------------------------------------------

--
-- Table structure for table `directory_country`
--

CREATE TABLE IF NOT EXISTS `directory_country` (
  `country_id` varchar(2) NOT NULL DEFAULT '',
  `iso2_code` varchar(2) NOT NULL DEFAULT '',
  `iso3_code` varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Countries';

--
-- Dumping data for table `directory_country`
--

INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES
('AD', 'AD', 'AND'),
('AE', 'AE', 'ARE'),
('AF', 'AF', 'AFG'),
('AG', 'AG', 'ATG'),
('AI', 'AI', 'AIA'),
('AL', 'AL', 'ALB'),
('AM', 'AM', 'ARM'),
('AN', 'AN', 'ANT'),
('AO', 'AO', 'AGO'),
('AQ', 'AQ', 'ATA'),
('AR', 'AR', 'ARG'),
('AS', 'AS', 'ASM'),
('AT', 'AT', 'AUT'),
('AU', 'AU', 'AUS'),
('AW', 'AW', 'ABW'),
('AX', 'AX', 'ALA'),
('AZ', 'AZ', 'AZE'),
('BA', 'BA', 'BIH'),
('BB', 'BB', 'BRB'),
('BD', 'BD', 'BGD'),
('BE', 'BE', 'BEL'),
('BF', 'BF', 'BFA'),
('BG', 'BG', 'BGR'),
('BH', 'BH', 'BHR'),
('BI', 'BI', 'BDI'),
('BJ', 'BJ', 'BEN'),
('BL', 'BL', 'BLM'),
('BM', 'BM', 'BMU'),
('BN', 'BN', 'BRN'),
('BO', 'BO', 'BOL'),
('BR', 'BR', 'BRA'),
('BS', 'BS', 'BHS'),
('BT', 'BT', 'BTN'),
('BV', 'BV', 'BVT'),
('BW', 'BW', 'BWA'),
('BY', 'BY', 'BLR'),
('BZ', 'BZ', 'BLZ'),
('CA', 'CA', 'CAN'),
('CC', 'CC', 'CCK'),
('CD', 'CD', 'COD'),
('CF', 'CF', 'CAF'),
('CG', 'CG', 'COG'),
('CH', 'CH', 'CHE'),
('CI', 'CI', 'CIV'),
('CK', 'CK', 'COK'),
('CL', 'CL', 'CHL'),
('CM', 'CM', 'CMR'),
('CN', 'CN', 'CHN'),
('CO', 'CO', 'COL'),
('CR', 'CR', 'CRI'),
('CU', 'CU', 'CUB'),
('CV', 'CV', 'CPV'),
('CX', 'CX', 'CXR'),
('CY', 'CY', 'CYP'),
('CZ', 'CZ', 'CZE'),
('DE', 'DE', 'DEU'),
('DJ', 'DJ', 'DJI'),
('DK', 'DK', 'DNK'),
('DM', 'DM', 'DMA'),
('DO', 'DO', 'DOM'),
('DZ', 'DZ', 'DZA'),
('EC', 'EC', 'ECU'),
('EE', 'EE', 'EST'),
('EG', 'EG', 'EGY'),
('EH', 'EH', 'ESH'),
('ER', 'ER', 'ERI'),
('ES', 'ES', 'ESP'),
('ET', 'ET', 'ETH'),
('FI', 'FI', 'FIN'),
('FJ', 'FJ', 'FJI'),
('FK', 'FK', 'FLK'),
('FM', 'FM', 'FSM'),
('FO', 'FO', 'FRO'),
('FR', 'FR', 'FRA'),
('GA', 'GA', 'GAB'),
('GB', 'GB', 'GBR'),
('GD', 'GD', 'GRD'),
('GE', 'GE', 'GEO'),
('GF', 'GF', 'GUF'),
('GG', 'GG', 'GGY'),
('GH', 'GH', 'GHA'),
('GI', 'GI', 'GIB'),
('GL', 'GL', 'GRL'),
('GM', 'GM', 'GMB'),
('GN', 'GN', 'GIN'),
('GP', 'GP', 'GLP'),
('GQ', 'GQ', 'GNQ'),
('GR', 'GR', 'GRC'),
('GS', 'GS', 'SGS'),
('GT', 'GT', 'GTM'),
('GU', 'GU', 'GUM'),
('GW', 'GW', 'GNB'),
('GY', 'GY', 'GUY'),
('HK', 'HK', 'HKG'),
('HM', 'HM', 'HMD'),
('HN', 'HN', 'HND'),
('HR', 'HR', 'HRV'),
('HT', 'HT', 'HTI'),
('HU', 'HU', 'HUN'),
('ID', 'ID', 'IDN'),
('IE', 'IE', 'IRL'),
('IL', 'IL', 'ISR'),
('IM', 'IM', 'IMN'),
('IN', 'IN', 'IND'),
('IO', 'IO', 'IOT'),
('IQ', 'IQ', 'IRQ'),
('IR', 'IR', 'IRN'),
('IS', 'IS', 'ISL'),
('IT', 'IT', 'ITA'),
('JE', 'JE', 'JEY'),
('JM', 'JM', 'JAM'),
('JO', 'JO', 'JOR'),
('JP', 'JP', 'JPN'),
('KE', 'KE', 'KEN'),
('KG', 'KG', 'KGZ'),
('KH', 'KH', 'KHM'),
('KI', 'KI', 'KIR'),
('KM', 'KM', 'COM'),
('KN', 'KN', 'KNA'),
('KP', 'KP', 'PRK'),
('KR', 'KR', 'KOR'),
('KW', 'KW', 'KWT'),
('KY', 'KY', 'CYM'),
('KZ', 'KZ', 'KAZ'),
('LA', 'LA', 'LAO'),
('LB', 'LB', 'LBN'),
('LC', 'LC', 'LCA'),
('LI', 'LI', 'LIE'),
('LK', 'LK', 'LKA'),
('LR', 'LR', 'LBR'),
('LS', 'LS', 'LSO'),
('LT', 'LT', 'LTU'),
('LU', 'LU', 'LUX'),
('LV', 'LV', 'LVA'),
('LY', 'LY', 'LBY'),
('MA', 'MA', 'MAR'),
('MC', 'MC', 'MCO'),
('MD', 'MD', 'MDA'),
('ME', 'ME', 'MNE'),
('MF', 'MF', 'MAF'),
('MG', 'MG', 'MDG'),
('MH', 'MH', 'MHL'),
('MK', 'MK', 'MKD'),
('ML', 'ML', 'MLI'),
('MM', 'MM', 'MMR'),
('MN', 'MN', 'MNG'),
('MO', 'MO', 'MAC'),
('MP', 'MP', 'MNP'),
('MQ', 'MQ', 'MTQ'),
('MR', 'MR', 'MRT'),
('MS', 'MS', 'MSR'),
('MT', 'MT', 'MLT'),
('MU', 'MU', 'MUS'),
('MV', 'MV', 'MDV'),
('MW', 'MW', 'MWI'),
('MX', 'MX', 'MEX'),
('MY', 'MY', 'MYS'),
('MZ', 'MZ', 'MOZ'),
('NA', 'NA', 'NAM'),
('NC', 'NC', 'NCL'),
('NE', 'NE', 'NER'),
('NF', 'NF', 'NFK'),
('NG', 'NG', 'NGA'),
('NI', 'NI', 'NIC'),
('NL', 'NL', 'NLD'),
('NO', 'NO', 'NOR'),
('NP', 'NP', 'NPL'),
('NR', 'NR', 'NRU'),
('NU', 'NU', 'NIU'),
('NZ', 'NZ', 'NZL'),
('OM', 'OM', 'OMN'),
('PA', 'PA', 'PAN'),
('PE', 'PE', 'PER'),
('PF', 'PF', 'PYF'),
('PG', 'PG', 'PNG'),
('PH', 'PH', 'PHL'),
('PK', 'PK', 'PAK'),
('PL', 'PL', 'POL'),
('PM', 'PM', 'SPM'),
('PN', 'PN', 'PCN'),
('PR', 'PR', 'PRI'),
('PS', 'PS', 'PSE'),
('PT', 'PT', 'PRT'),
('PW', 'PW', 'PLW'),
('PY', 'PY', 'PRY'),
('QA', 'QA', 'QAT'),
('RE', 'RE', 'REU'),
('RO', 'RO', 'ROU'),
('RS', 'RS', 'SRB'),
('RU', 'RU', 'RUS'),
('RW', 'RW', 'RWA'),
('SA', 'SA', 'SAU'),
('SB', 'SB', 'SLB'),
('SC', 'SC', 'SYC'),
('SD', 'SD', 'SDN'),
('SE', 'SE', 'SWE'),
('SG', 'SG', 'SGP'),
('SH', 'SH', 'SHN'),
('SI', 'SI', 'SVN'),
('SJ', 'SJ', 'SJM'),
('SK', 'SK', 'SVK'),
('SL', 'SL', 'SLE'),
('SM', 'SM', 'SMR'),
('SN', 'SN', 'SEN'),
('SO', 'SO', 'SOM'),
('SR', 'SR', 'SUR'),
('ST', 'ST', 'STP'),
('SV', 'SV', 'SLV'),
('SY', 'SY', 'SYR'),
('SZ', 'SZ', 'SWZ'),
('TC', 'TC', 'TCA'),
('TD', 'TD', 'TCD'),
('TF', 'TF', 'ATF'),
('TG', 'TG', 'TGO'),
('TH', 'TH', 'THA'),
('TJ', 'TJ', 'TJK'),
('TK', 'TK', 'TKL'),
('TL', 'TL', 'TLS'),
('TM', 'TM', 'TKM'),
('TN', 'TN', 'TUN'),
('TO', 'TO', 'TON'),
('TR', 'TR', 'TUR'),
('TT', 'TT', 'TTO'),
('TV', 'TV', 'TUV'),
('TW', 'TW', 'TWN'),
('TZ', 'TZ', 'TZA'),
('UA', 'UA', 'UKR'),
('UG', 'UG', 'UGA'),
('UM', 'UM', 'UMI'),
('US', 'US', 'USA'),
('UY', 'UY', 'URY'),
('UZ', 'UZ', 'UZB'),
('VA', 'VA', 'VAT'),
('VC', 'VC', 'VCT'),
('VE', 'VE', 'VEN'),
('VG', 'VG', 'VGB'),
('VI', 'VI', 'VIR'),
('VN', 'VN', 'VNM'),
('VU', 'VU', 'VUT'),
('WF', 'WF', 'WLF'),
('WS', 'WS', 'WSM'),
('YE', 'YE', 'YEM'),
('YT', 'YT', 'MYT'),
('ZA', 'ZA', 'ZAF'),
('ZM', 'ZM', 'ZMB'),
('ZW', 'ZW', 'ZWE');

-- --------------------------------------------------------

--
-- Table structure for table `directory_country_format`
--

CREATE TABLE IF NOT EXISTS `directory_country_format` (
  `country_format_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` varchar(2) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '',
  `format` text NOT NULL,
  PRIMARY KEY (`country_format_id`),
  UNIQUE KEY `country_type` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Countries format' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `directory_country_format`
--


-- --------------------------------------------------------

--
-- Table structure for table `directory_country_region`
--

CREATE TABLE IF NOT EXISTS `directory_country_region` (
  `region_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` varchar(4) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL DEFAULT '',
  `default_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`region_id`),
  KEY `FK_REGION_COUNTRY` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Country regions' AUTO_INCREMENT=320 ;

--
-- Dumping data for table `directory_country_region`
--

INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES
(1, 'US', 'AL', 'Alabama'),
(2, 'US', 'AK', 'Alaska'),
(3, 'US', 'AS', 'American Samoa'),
(4, 'US', 'AZ', 'Arizona'),
(5, 'US', 'AR', 'Arkansas'),
(6, 'US', 'AF', 'Armed Forces Africa'),
(7, 'US', 'AA', 'Armed Forces Americas'),
(8, 'US', 'AC', 'Armed Forces Canada'),
(9, 'US', 'AE', 'Armed Forces Europe'),
(10, 'US', 'AM', 'Armed Forces Middle East'),
(11, 'US', 'AP', 'Armed Forces Pacific'),
(12, 'US', 'CA', 'California'),
(13, 'US', 'CO', 'Colorado'),
(14, 'US', 'CT', 'Connecticut'),
(15, 'US', 'DE', 'Delaware'),
(16, 'US', 'DC', 'District of Columbia'),
(17, 'US', 'FM', 'Federated States Of Micronesia'),
(18, 'US', 'FL', 'Florida'),
(19, 'US', 'GA', 'Georgia'),
(20, 'US', 'GU', 'Guam'),
(21, 'US', 'HI', 'Hawaii'),
(22, 'US', 'ID', 'Idaho'),
(23, 'US', 'IL', 'Illinois'),
(24, 'US', 'IN', 'Indiana'),
(25, 'US', 'IA', 'Iowa'),
(26, 'US', 'KS', 'Kansas'),
(27, 'US', 'KY', 'Kentucky'),
(28, 'US', 'LA', 'Louisiana'),
(29, 'US', 'ME', 'Maine'),
(30, 'US', 'MH', 'Marshall Islands'),
(31, 'US', 'MD', 'Maryland'),
(32, 'US', 'MA', 'Massachusetts'),
(33, 'US', 'MI', 'Michigan'),
(34, 'US', 'MN', 'Minnesota'),
(35, 'US', 'MS', 'Mississippi'),
(36, 'US', 'MO', 'Missouri'),
(37, 'US', 'MT', 'Montana'),
(38, 'US', 'NE', 'Nebraska'),
(39, 'US', 'NV', 'Nevada'),
(40, 'US', 'NH', 'New Hampshire'),
(41, 'US', 'NJ', 'New Jersey'),
(42, 'US', 'NM', 'New Mexico'),
(43, 'US', 'NY', 'New York'),
(44, 'US', 'NC', 'North Carolina'),
(45, 'US', 'ND', 'North Dakota'),
(46, 'US', 'MP', 'Northern Mariana Islands'),
(47, 'US', 'OH', 'Ohio'),
(48, 'US', 'OK', 'Oklahoma'),
(49, 'US', 'OR', 'Oregon'),
(50, 'US', 'PW', 'Palau'),
(51, 'US', 'PA', 'Pennsylvania'),
(52, 'US', 'PR', 'Puerto Rico'),
(53, 'US', 'RI', 'Rhode Island'),
(54, 'US', 'SC', 'South Carolina'),
(55, 'US', 'SD', 'South Dakota'),
(56, 'US', 'TN', 'Tennessee'),
(57, 'US', 'TX', 'Texas'),
(58, 'US', 'UT', 'Utah'),
(59, 'US', 'VT', 'Vermont'),
(60, 'US', 'VI', 'Virgin Islands'),
(61, 'US', 'VA', 'Virginia'),
(62, 'US', 'WA', 'Washington'),
(63, 'US', 'WV', 'West Virginia'),
(64, 'US', 'WI', 'Wisconsin'),
(65, 'US', 'WY', 'Wyoming'),
(66, 'CA', 'AB', 'Alberta'),
(67, 'CA', 'BC', 'British Columbia'),
(68, 'CA', 'MB', 'Manitoba'),
(69, 'CA', 'NL', 'Newfoundland and Labrador'),
(70, 'CA', 'NB', 'New Brunswick'),
(71, 'CA', 'NS', 'Nova Scotia'),
(72, 'CA', 'NT', 'Northwest Territories'),
(73, 'CA', 'NU', 'Nunavut'),
(74, 'CA', 'ON', 'Ontario'),
(75, 'CA', 'PE', 'Prince Edward Island'),
(76, 'CA', 'QC', 'Quebec'),
(77, 'CA', 'SK', 'Saskatchewan'),
(78, 'CA', 'YT', 'Yukon Territory'),
(79, 'DE', 'NDS', 'Niedersachsen'),
(80, 'DE', 'BAW', 'Baden-Württemberg'),
(81, 'DE', 'BAY', 'Bayern'),
(82, 'DE', 'BER', 'Berlin'),
(83, 'DE', 'BRG', 'Brandenburg'),
(84, 'DE', 'BRE', 'Bremen'),
(85, 'DE', 'HAM', 'Hamburg'),
(86, 'DE', 'HES', 'Hessen'),
(87, 'DE', 'MEC', 'Mecklenburg-Vorpommern'),
(88, 'DE', 'NRW', 'Nordrhein-Westfalen'),
(89, 'DE', 'RHE', 'Rheinland-Pfalz'),
(90, 'DE', 'SAR', 'Saarland'),
(91, 'DE', 'SAS', 'Sachsen'),
(92, 'DE', 'SAC', 'Sachsen-Anhalt'),
(93, 'DE', 'SCN', 'Schleswig-Holstein'),
(94, 'DE', 'THE', 'Thüringen'),
(95, 'AT', 'WI', 'Wien'),
(96, 'AT', 'NO', 'Niederösterreich'),
(97, 'AT', 'OO', 'Oberösterreich'),
(98, 'AT', 'SB', 'Salzburg'),
(99, 'AT', 'KN', 'Kärnten'),
(100, 'AT', 'ST', 'Steiermark'),
(101, 'AT', 'TI', 'Tirol'),
(102, 'AT', 'BL', 'Burgenland'),
(103, 'AT', 'VB', 'Voralberg'),
(104, 'CH', 'AG', 'Aargau'),
(105, 'CH', 'AI', 'Appenzell Innerrhoden'),
(106, 'CH', 'AR', 'Appenzell Ausserrhoden'),
(107, 'CH', 'BE', 'Bern'),
(108, 'CH', 'BL', 'Basel-Landschaft'),
(109, 'CH', 'BS', 'Basel-Stadt'),
(110, 'CH', 'FR', 'Freiburg'),
(111, 'CH', 'GE', 'Genf'),
(112, 'CH', 'GL', 'Glarus'),
(113, 'CH', 'GR', 'Graubünden'),
(114, 'CH', 'JU', 'Jura'),
(115, 'CH', 'LU', 'Luzern'),
(116, 'CH', 'NE', 'Neuenburg'),
(117, 'CH', 'NW', 'Nidwalden'),
(118, 'CH', 'OW', 'Obwalden'),
(119, 'CH', 'SG', 'St. Gallen'),
(120, 'CH', 'SH', 'Schaffhausen'),
(121, 'CH', 'SO', 'Solothurn'),
(122, 'CH', 'SZ', 'Schwyz'),
(123, 'CH', 'TG', 'Thurgau'),
(124, 'CH', 'TI', 'Tessin'),
(125, 'CH', 'UR', 'Uri'),
(126, 'CH', 'VD', 'Waadt'),
(127, 'CH', 'VS', 'Wallis'),
(128, 'CH', 'ZG', 'Zug'),
(129, 'CH', 'ZH', 'Zürich'),
(130, 'ES', 'A Coruсa', 'A Coruña'),
(131, 'ES', 'Alava', 'Alava'),
(132, 'ES', 'Albacete', 'Albacete'),
(133, 'ES', 'Alicante', 'Alicante'),
(134, 'ES', 'Almeria', 'Almeria'),
(135, 'ES', 'Asturias', 'Asturias'),
(136, 'ES', 'Avila', 'Avila'),
(137, 'ES', 'Badajoz', 'Badajoz'),
(138, 'ES', 'Baleares', 'Baleares'),
(139, 'ES', 'Barcelona', 'Barcelona'),
(140, 'ES', 'Burgos', 'Burgos'),
(141, 'ES', 'Caceres', 'Caceres'),
(142, 'ES', 'Cadiz', 'Cadiz'),
(143, 'ES', 'Cantabria', 'Cantabria'),
(144, 'ES', 'Castellon', 'Castellon'),
(145, 'ES', 'Ceuta', 'Ceuta'),
(146, 'ES', 'Ciudad Real', 'Ciudad Real'),
(147, 'ES', 'Cordoba', 'Cordoba'),
(148, 'ES', 'Cuenca', 'Cuenca'),
(149, 'ES', 'Girona', 'Girona'),
(150, 'ES', 'Granada', 'Granada'),
(151, 'ES', 'Guadalajara', 'Guadalajara'),
(152, 'ES', 'Guipuzcoa', 'Guipuzcoa'),
(153, 'ES', 'Huelva', 'Huelva'),
(154, 'ES', 'Huesca', 'Huesca'),
(155, 'ES', 'Jaen', 'Jaen'),
(156, 'ES', 'La Rioja', 'La Rioja'),
(157, 'ES', 'Las Palmas', 'Las Palmas'),
(158, 'ES', 'Leon', 'Leon'),
(159, 'ES', 'Lleida', 'Lleida'),
(160, 'ES', 'Lugo', 'Lugo'),
(161, 'ES', 'Madrid', 'Madrid'),
(162, 'ES', 'Malaga', 'Malaga'),
(163, 'ES', 'Melilla', 'Melilla'),
(164, 'ES', 'Murcia', 'Murcia'),
(165, 'ES', 'Navarra', 'Navarra'),
(166, 'ES', 'Ourense', 'Ourense'),
(167, 'ES', 'Palencia', 'Palencia'),
(168, 'ES', 'Pontevedra', 'Pontevedra'),
(169, 'ES', 'Salamanca', 'Salamanca'),
(170, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 'ES', 'Segovia', 'Segovia'),
(172, 'ES', 'Sevilla', 'Sevilla'),
(173, 'ES', 'Soria', 'Soria'),
(174, 'ES', 'Tarragona', 'Tarragona'),
(175, 'ES', 'Teruel', 'Teruel'),
(176, 'ES', 'Toledo', 'Toledo'),
(177, 'ES', 'Valencia', 'Valencia'),
(178, 'ES', 'Valladolid', 'Valladolid'),
(179, 'ES', 'Vizcaya', 'Vizcaya'),
(180, 'ES', 'Zamora', 'Zamora'),
(181, 'ES', 'Zaragoza', 'Zaragoza'),
(182, 'FR', '01', 'Ain'),
(183, 'FR', '02', 'Aisne'),
(184, 'FR', '03', 'Allier'),
(185, 'FR', '04', 'Alpes-de-Haute-Provence'),
(186, 'FR', '05', 'Hautes-Alpes'),
(187, 'FR', '06', 'Alpes-Maritimes'),
(188, 'FR', '07', 'Ardèche'),
(189, 'FR', '08', 'Ardennes'),
(190, 'FR', '09', 'Ariège'),
(191, 'FR', '10', 'Aube'),
(192, 'FR', '11', 'Aude'),
(193, 'FR', '12', 'Aveyron'),
(194, 'FR', '13', 'Bouches-du-Rhône'),
(195, 'FR', '14', 'Calvados'),
(196, 'FR', '15', 'Cantal'),
(197, 'FR', '16', 'Charente'),
(198, 'FR', '17', 'Charente-Maritime'),
(199, 'FR', '18', 'Cher'),
(200, 'FR', '19', 'Corrèze'),
(201, 'FR', '2A', 'Corse-du-Sud'),
(202, 'FR', '2B', 'Haute-Corse'),
(203, 'FR', '21', 'Côte-d''Or'),
(204, 'FR', '22', 'Côtes-d''Armor'),
(205, 'FR', '23', 'Creuse'),
(206, 'FR', '24', 'Dordogne'),
(207, 'FR', '25', 'Doubs'),
(208, 'FR', '26', 'Drôme'),
(209, 'FR', '27', 'Eure'),
(210, 'FR', '28', 'Eure-et-Loir'),
(211, 'FR', '29', 'Finistère'),
(212, 'FR', '30', 'Gard'),
(213, 'FR', '31', 'Haute-Garonne'),
(214, 'FR', '32', 'Gers'),
(215, 'FR', '33', 'Gironde'),
(216, 'FR', '34', 'Hérault'),
(217, 'FR', '35', 'Ille-et-Vilaine'),
(218, 'FR', '36', 'Indre'),
(219, 'FR', '37', 'Indre-et-Loire'),
(220, 'FR', '38', 'Isère'),
(221, 'FR', '39', 'Jura'),
(222, 'FR', '40', 'Landes'),
(223, 'FR', '41', 'Loir-et-Cher'),
(224, 'FR', '42', 'Loire'),
(225, 'FR', '43', 'Haute-Loire'),
(226, 'FR', '44', 'Loire-Atlantique'),
(227, 'FR', '45', 'Loiret'),
(228, 'FR', '46', 'Lot'),
(229, 'FR', '47', 'Lot-et-Garonne'),
(230, 'FR', '48', 'Lozère'),
(231, 'FR', '49', 'Maine-et-Loire'),
(232, 'FR', '50', 'Manche'),
(233, 'FR', '51', 'Marne'),
(234, 'FR', '52', 'Haute-Marne'),
(235, 'FR', '53', 'Mayenne'),
(236, 'FR', '54', 'Meurthe-et-Moselle'),
(237, 'FR', '55', 'Meuse'),
(238, 'FR', '56', 'Morbihan'),
(239, 'FR', '57', 'Moselle'),
(240, 'FR', '58', 'Nièvre'),
(241, 'FR', '59', 'Nord'),
(242, 'FR', '60', 'Oise'),
(243, 'FR', '61', 'Orne'),
(244, 'FR', '62', 'Pas-de-Calais'),
(245, 'FR', '63', 'Puy-de-Dôme'),
(246, 'FR', '64', 'Pyrénées-Atlantiques'),
(247, 'FR', '65', 'Hautes-Pyrénées'),
(248, 'FR', '66', 'Pyrénées-Orientales'),
(249, 'FR', '67', 'Bas-Rhin'),
(250, 'FR', '68', 'Haut-Rhin'),
(251, 'FR', '69', 'Rhône'),
(252, 'FR', '70', 'Haute-Saône'),
(253, 'FR', '71', 'Saône-et-Loire'),
(254, 'FR', '72', 'Sarthe'),
(255, 'FR', '73', 'Savoie'),
(256, 'FR', '74', 'Haute-Savoie'),
(257, 'FR', '75', 'Paris'),
(258, 'FR', '76', 'Seine-Maritime'),
(259, 'FR', '77', 'Seine-et-Marne'),
(260, 'FR', '78', 'Yvelines'),
(261, 'FR', '79', 'Deux-Sèvres'),
(262, 'FR', '80', 'Somme'),
(263, 'FR', '81', 'Tarn'),
(264, 'FR', '82', 'Tarn-et-Garonne'),
(265, 'FR', '83', 'Var'),
(266, 'FR', '84', 'Vaucluse'),
(267, 'FR', '85', 'Vendée'),
(268, 'FR', '86', 'Vienne'),
(269, 'FR', '87', 'Haute-Vienne'),
(270, 'FR', '88', 'Vosges'),
(271, 'FR', '89', 'Yonne'),
(272, 'FR', '90', 'Territoire-de-Belfort'),
(273, 'FR', '91', 'Essonne'),
(274, 'FR', '92', 'Hauts-de-Seine'),
(275, 'FR', '93', 'Seine-Saint-Denis'),
(276, 'FR', '94', 'Val-de-Marne'),
(277, 'FR', '95', 'Val-d''Oise'),
(278, 'RO', 'AB', 'Alba'),
(279, 'RO', 'AR', 'Arad'),
(280, 'RO', 'AG', 'Argeş'),
(281, 'RO', 'BC', 'Bacău'),
(282, 'RO', 'BH', 'Bihor'),
(283, 'RO', 'BN', 'Bistriţa-Năsăud'),
(284, 'RO', 'BT', 'Botoşani'),
(285, 'RO', 'BV', 'Braşov'),
(286, 'RO', 'BR', 'Brăila'),
(287, 'RO', 'B', 'Bucureşti'),
(288, 'RO', 'BZ', 'Buzău'),
(289, 'RO', 'CS', 'Caraş-Severin'),
(290, 'RO', 'CL', 'Călăraşi'),
(291, 'RO', 'CJ', 'Cluj'),
(292, 'RO', 'CT', 'Constanţa'),
(293, 'RO', 'CV', 'Covasna'),
(294, 'RO', 'DB', 'Dâmboviţa'),
(295, 'RO', 'DJ', 'Dolj'),
(296, 'RO', 'GL', 'Galaţi'),
(297, 'RO', 'GR', 'Giurgiu'),
(298, 'RO', 'GJ', 'Gorj'),
(299, 'RO', 'HR', 'Harghita'),
(300, 'RO', 'HD', 'Hunedoara'),
(301, 'RO', 'IL', 'Ialomiţa'),
(302, 'RO', 'IS', 'Iaşi'),
(303, 'RO', 'IF', 'Ilfov'),
(304, 'RO', 'MM', 'Maramureş'),
(305, 'RO', 'MH', 'Mehedinţi'),
(306, 'RO', 'MS', 'Mureş'),
(307, 'RO', 'NT', 'Neamţ'),
(308, 'RO', 'OT', 'Olt'),
(309, 'RO', 'PH', 'Prahova'),
(310, 'RO', 'SM', 'Satu-Mare'),
(311, 'RO', 'SJ', 'Sălaj'),
(312, 'RO', 'SB', 'Sibiu'),
(313, 'RO', 'SV', 'Suceava'),
(314, 'RO', 'TR', 'Teleorman'),
(315, 'RO', 'TM', 'Timiş'),
(316, 'RO', 'TL', 'Tulcea'),
(317, 'RO', 'VS', 'Vaslui'),
(318, 'RO', 'VL', 'Vâlcea'),
(319, 'RO', 'VN', 'Vrancea');

-- --------------------------------------------------------

--
-- Table structure for table `directory_country_region_name`
--

CREATE TABLE IF NOT EXISTS `directory_country_region_name` (
  `locale` varchar(8) NOT NULL DEFAULT '',
  `region_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`locale`,`region_id`),
  KEY `FK_DIRECTORY_REGION_NAME_REGION` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Regions names';

--
-- Dumping data for table `directory_country_region_name`
--

INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES
('en_US', 1, 'Alabama'),
('en_US', 2, 'Alaska'),
('en_US', 3, 'American Samoa'),
('en_US', 4, 'Arizona'),
('en_US', 5, 'Arkansas'),
('en_US', 6, 'Armed Forces Africa'),
('en_US', 7, 'Armed Forces Americas'),
('en_US', 8, 'Armed Forces Canada'),
('en_US', 9, 'Armed Forces Europe'),
('en_US', 10, 'Armed Forces Middle East'),
('en_US', 11, 'Armed Forces Pacific'),
('en_US', 12, 'California'),
('en_US', 13, 'Colorado'),
('en_US', 14, 'Connecticut'),
('en_US', 15, 'Delaware'),
('en_US', 16, 'District of Columbia'),
('en_US', 17, 'Federated States Of Micronesia'),
('en_US', 18, 'Florida'),
('en_US', 19, 'Georgia'),
('en_US', 20, 'Guam'),
('en_US', 21, 'Hawaii'),
('en_US', 22, 'Idaho'),
('en_US', 23, 'Illinois'),
('en_US', 24, 'Indiana'),
('en_US', 25, 'Iowa'),
('en_US', 26, 'Kansas'),
('en_US', 27, 'Kentucky'),
('en_US', 28, 'Louisiana'),
('en_US', 29, 'Maine'),
('en_US', 30, 'Marshall Islands'),
('en_US', 31, 'Maryland'),
('en_US', 32, 'Massachusetts'),
('en_US', 33, 'Michigan'),
('en_US', 34, 'Minnesota'),
('en_US', 35, 'Mississippi'),
('en_US', 36, 'Missouri'),
('en_US', 37, 'Montana'),
('en_US', 38, 'Nebraska'),
('en_US', 39, 'Nevada'),
('en_US', 40, 'New Hampshire'),
('en_US', 41, 'New Jersey'),
('en_US', 42, 'New Mexico'),
('en_US', 43, 'New York'),
('en_US', 44, 'North Carolina'),
('en_US', 45, 'North Dakota'),
('en_US', 46, 'Northern Mariana Islands'),
('en_US', 47, 'Ohio'),
('en_US', 48, 'Oklahoma'),
('en_US', 49, 'Oregon'),
('en_US', 50, 'Palau'),
('en_US', 51, 'Pennsylvania'),
('en_US', 52, 'Puerto Rico'),
('en_US', 53, 'Rhode Island'),
('en_US', 54, 'South Carolina'),
('en_US', 55, 'South Dakota'),
('en_US', 56, 'Tennessee'),
('en_US', 57, 'Texas'),
('en_US', 58, 'Utah'),
('en_US', 59, 'Vermont'),
('en_US', 60, 'Virgin Islands'),
('en_US', 61, 'Virginia'),
('en_US', 62, 'Washington'),
('en_US', 63, 'West Virginia'),
('en_US', 64, 'Wisconsin'),
('en_US', 65, 'Wyoming'),
('en_US', 66, 'Alberta'),
('en_US', 67, 'British Columbia'),
('en_US', 68, 'Manitoba'),
('en_US', 69, 'Newfoundland and Labrador'),
('en_US', 70, 'New Brunswick'),
('en_US', 71, 'Nova Scotia'),
('en_US', 72, 'Northwest Territories'),
('en_US', 73, 'Nunavut'),
('en_US', 74, 'Ontario'),
('en_US', 75, 'Prince Edward Island'),
('en_US', 76, 'Quebec'),
('en_US', 77, 'Saskatchewan'),
('en_US', 78, 'Yukon Territory'),
('en_US', 79, 'Niedersachsen'),
('en_US', 80, 'Baden-Württemberg'),
('en_US', 81, 'Bayern'),
('en_US', 82, 'Berlin'),
('en_US', 83, 'Brandenburg'),
('en_US', 84, 'Bremen'),
('en_US', 85, 'Hamburg'),
('en_US', 86, 'Hessen'),
('en_US', 87, 'Mecklenburg-Vorpommern'),
('en_US', 88, 'Nordrhein-Westfalen'),
('en_US', 89, 'Rheinland-Pfalz'),
('en_US', 90, 'Saarland'),
('en_US', 91, 'Sachsen'),
('en_US', 92, 'Sachsen-Anhalt'),
('en_US', 93, 'Schleswig-Holstein'),
('en_US', 94, 'Thüringen'),
('en_US', 95, 'Wien'),
('en_US', 96, 'Niederösterreich'),
('en_US', 97, 'Oberösterreich'),
('en_US', 98, 'Salzburg'),
('en_US', 99, 'Kärnten'),
('en_US', 100, 'Steiermark'),
('en_US', 101, 'Tirol'),
('en_US', 102, 'Burgenland'),
('en_US', 103, 'Voralberg'),
('en_US', 104, 'Aargau'),
('en_US', 105, 'Appenzell Innerrhoden'),
('en_US', 106, 'Appenzell Ausserrhoden'),
('en_US', 107, 'Bern'),
('en_US', 108, 'Basel-Landschaft'),
('en_US', 109, 'Basel-Stadt'),
('en_US', 110, 'Freiburg'),
('en_US', 111, 'Genf'),
('en_US', 112, 'Glarus'),
('en_US', 113, 'Graubünden'),
('en_US', 114, 'Jura'),
('en_US', 115, 'Luzern'),
('en_US', 116, 'Neuenburg'),
('en_US', 117, 'Nidwalden'),
('en_US', 118, 'Obwalden'),
('en_US', 119, 'St. Gallen'),
('en_US', 120, 'Schaffhausen'),
('en_US', 121, 'Solothurn'),
('en_US', 122, 'Schwyz'),
('en_US', 123, 'Thurgau'),
('en_US', 124, 'Tessin'),
('en_US', 125, 'Uri'),
('en_US', 126, 'Waadt'),
('en_US', 127, 'Wallis'),
('en_US', 128, 'Zug'),
('en_US', 129, 'Zürich'),
('en_US', 130, 'A Coruña'),
('en_US', 131, 'Alava'),
('en_US', 132, 'Albacete'),
('en_US', 133, 'Alicante'),
('en_US', 134, 'Almeria'),
('en_US', 135, 'Asturias'),
('en_US', 136, 'Avila'),
('en_US', 137, 'Badajoz'),
('en_US', 138, 'Baleares'),
('en_US', 139, 'Barcelona'),
('en_US', 140, 'Burgos'),
('en_US', 141, 'Caceres'),
('en_US', 142, 'Cadiz'),
('en_US', 143, 'Cantabria'),
('en_US', 144, 'Castellon'),
('en_US', 145, 'Ceuta'),
('en_US', 146, 'Ciudad Real'),
('en_US', 147, 'Cordoba'),
('en_US', 148, 'Cuenca'),
('en_US', 149, 'Girona'),
('en_US', 150, 'Granada'),
('en_US', 151, 'Guadalajara'),
('en_US', 152, 'Guipuzcoa'),
('en_US', 153, 'Huelva'),
('en_US', 154, 'Huesca'),
('en_US', 155, 'Jaen'),
('en_US', 156, 'La Rioja'),
('en_US', 157, 'Las Palmas'),
('en_US', 158, 'Leon'),
('en_US', 159, 'Lleida'),
('en_US', 160, 'Lugo'),
('en_US', 161, 'Madrid'),
('en_US', 162, 'Malaga'),
('en_US', 163, 'Melilla'),
('en_US', 164, 'Murcia'),
('en_US', 165, 'Navarra'),
('en_US', 166, 'Ourense'),
('en_US', 167, 'Palencia'),
('en_US', 168, 'Pontevedra'),
('en_US', 169, 'Salamanca'),
('en_US', 170, 'Santa Cruz de Tenerife'),
('en_US', 171, 'Segovia'),
('en_US', 172, 'Sevilla'),
('en_US', 173, 'Soria'),
('en_US', 174, 'Tarragona'),
('en_US', 175, 'Teruel'),
('en_US', 176, 'Toledo'),
('en_US', 177, 'Valencia'),
('en_US', 178, 'Valladolid'),
('en_US', 179, 'Vizcaya'),
('en_US', 180, 'Zamora'),
('en_US', 181, 'Zaragoza'),
('en_US', 182, 'Ain'),
('en_US', 183, 'Aisne'),
('en_US', 184, 'Allier'),
('en_US', 185, 'Alpes-de-Haute-Provence'),
('en_US', 186, 'Hautes-Alpes'),
('en_US', 187, 'Alpes-Maritimes'),
('en_US', 188, 'Ardèche'),
('en_US', 189, 'Ardennes'),
('en_US', 190, 'Ariège'),
('en_US', 191, 'Aube'),
('en_US', 192, 'Aude'),
('en_US', 193, 'Aveyron'),
('en_US', 194, 'Bouches-du-Rhône'),
('en_US', 195, 'Calvados'),
('en_US', 196, 'Cantal'),
('en_US', 197, 'Charente'),
('en_US', 198, 'Charente-Maritime'),
('en_US', 199, 'Cher'),
('en_US', 200, 'Corrèze'),
('en_US', 201, 'Corse-du-Sud'),
('en_US', 202, 'Haute-Corse'),
('en_US', 203, 'Côte-d''Or'),
('en_US', 204, 'Côtes-d''Armor'),
('en_US', 205, 'Creuse'),
('en_US', 206, 'Dordogne'),
('en_US', 207, 'Doubs'),
('en_US', 208, 'Drôme'),
('en_US', 209, 'Eure'),
('en_US', 210, 'Eure-et-Loir'),
('en_US', 211, 'Finistère'),
('en_US', 212, 'Gard'),
('en_US', 213, 'Haute-Garonne'),
('en_US', 214, 'Gers'),
('en_US', 215, 'Gironde'),
('en_US', 216, 'Hérault'),
('en_US', 217, 'Ille-et-Vilaine'),
('en_US', 218, 'Indre'),
('en_US', 219, 'Indre-et-Loire'),
('en_US', 220, 'Isère'),
('en_US', 221, 'Jura'),
('en_US', 222, 'Landes'),
('en_US', 223, 'Loir-et-Cher'),
('en_US', 224, 'Loire'),
('en_US', 225, 'Haute-Loire'),
('en_US', 226, 'Loire-Atlantique'),
('en_US', 227, 'Loiret'),
('en_US', 228, 'Lot'),
('en_US', 229, 'Lot-et-Garonne'),
('en_US', 230, 'Lozère'),
('en_US', 231, 'Maine-et-Loire'),
('en_US', 232, 'Manche'),
('en_US', 233, 'Marne'),
('en_US', 234, 'Haute-Marne'),
('en_US', 235, 'Mayenne'),
('en_US', 236, 'Meurthe-et-Moselle'),
('en_US', 237, 'Meuse'),
('en_US', 238, 'Morbihan'),
('en_US', 239, 'Moselle'),
('en_US', 240, 'Nièvre'),
('en_US', 241, 'Nord'),
('en_US', 242, 'Oise'),
('en_US', 243, 'Orne'),
('en_US', 244, 'Pas-de-Calais'),
('en_US', 245, 'Puy-de-Dôme'),
('en_US', 246, 'Pyrénées-Atlantiques'),
('en_US', 247, 'Hautes-Pyrénées'),
('en_US', 248, 'Pyrénées-Orientales'),
('en_US', 249, 'Bas-Rhin'),
('en_US', 250, 'Haut-Rhin'),
('en_US', 251, 'Rhône'),
('en_US', 252, 'Haute-Saône'),
('en_US', 253, 'Saône-et-Loire'),
('en_US', 254, 'Sarthe'),
('en_US', 255, 'Savoie'),
('en_US', 256, 'Haute-Savoie'),
('en_US', 257, 'Paris'),
('en_US', 258, 'Seine-Maritime'),
('en_US', 259, 'Seine-et-Marne'),
('en_US', 260, 'Yvelines'),
('en_US', 261, 'Deux-Sèvres'),
('en_US', 262, 'Somme'),
('en_US', 263, 'Tarn'),
('en_US', 264, 'Tarn-et-Garonne'),
('en_US', 265, 'Var'),
('en_US', 266, 'Vaucluse'),
('en_US', 267, 'Vendée'),
('en_US', 268, 'Vienne'),
('en_US', 269, 'Haute-Vienne'),
('en_US', 270, 'Vosges'),
('en_US', 271, 'Yonne'),
('en_US', 272, 'Territoire-de-Belfort'),
('en_US', 273, 'Essonne'),
('en_US', 274, 'Hauts-de-Seine'),
('en_US', 275, 'Seine-Saint-Denis'),
('en_US', 276, 'Val-de-Marne'),
('en_US', 277, 'Val-d''Oise'),
('en_US', 278, 'Alba'),
('en_US', 279, 'Arad'),
('en_US', 280, 'Argeş'),
('en_US', 281, 'Bacău'),
('en_US', 282, 'Bihor'),
('en_US', 283, 'Bistriţa-Năsăud'),
('en_US', 284, 'Botoşani'),
('en_US', 285, 'Braşov'),
('en_US', 286, 'Brăila'),
('en_US', 287, 'Bucureşti'),
('en_US', 288, 'Buzău'),
('en_US', 289, 'Caraş-Severin'),
('en_US', 290, 'Călăraşi'),
('en_US', 291, 'Cluj'),
('en_US', 292, 'Constanţa'),
('en_US', 293, 'Covasna'),
('en_US', 294, 'Dâmboviţa'),
('en_US', 295, 'Dolj'),
('en_US', 296, 'Galaţi'),
('en_US', 297, 'Giurgiu'),
('en_US', 298, 'Gorj'),
('en_US', 299, 'Harghita'),
('en_US', 300, 'Hunedoara'),
('en_US', 301, 'Ialomiţa'),
('en_US', 302, 'Iaşi'),
('en_US', 303, 'Ilfov'),
('en_US', 304, 'Maramureş'),
('en_US', 305, 'Mehedinţi'),
('en_US', 306, 'Mureş'),
('en_US', 307, 'Neamţ'),
('en_US', 308, 'Olt'),
('en_US', 309, 'Prahova'),
('en_US', 310, 'Satu-Mare'),
('en_US', 311, 'Sălaj'),
('en_US', 312, 'Sibiu'),
('en_US', 313, 'Suceava'),
('en_US', 314, 'Teleorman'),
('en_US', 315, 'Timiş'),
('en_US', 316, 'Tulcea'),
('en_US', 317, 'Vaslui'),
('en_US', 318, 'Vâlcea'),
('en_US', 319, 'Vrancea');

-- --------------------------------------------------------

--
-- Table structure for table `directory_currency_rate`
--

CREATE TABLE IF NOT EXISTS `directory_currency_rate` (
  `currency_from` char(3) NOT NULL DEFAULT '',
  `currency_to` char(3) NOT NULL DEFAULT '',
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000',
  PRIMARY KEY (`currency_from`,`currency_to`),
  KEY `FK_CURRENCY_RATE_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `directory_currency_rate`
--

INSERT INTO `directory_currency_rate` (`currency_from`, `currency_to`, `rate`) VALUES
('EUR', 'EUR', 1.000000000000),
('EUR', 'USD', 1.415000000000),
('USD', 'EUR', 0.706700000000),
('USD', 'USD', 1.000000000000);

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link`
--

CREATE TABLE IF NOT EXISTS `downloadable_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `number_of_downloads` int(10) unsigned DEFAULT NULL,
  `is_shareable` smallint(1) unsigned NOT NULL DEFAULT '0',
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_file` varchar(255) NOT NULL DEFAULT '',
  `link_type` varchar(20) NOT NULL DEFAULT '',
  `sample_url` varchar(255) NOT NULL DEFAULT '',
  `sample_file` varchar(255) NOT NULL DEFAULT '',
  `sample_type` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `DOWNLODABLE_LINK_PRODUCT` (`product_id`),
  KEY `DOWNLODABLE_LINK_PRODUCT_SORT_ORDER` (`product_id`,`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `downloadable_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_price`
--

CREATE TABLE IF NOT EXISTS `downloadable_link_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link_id` int(10) unsigned NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`price_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_LINK` (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `downloadable_link_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_purchased`
--

CREATE TABLE IF NOT EXISTS `downloadable_link_purchased` (
  `purchased_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order_increment_id` varchar(50) NOT NULL DEFAULT '',
  `order_item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `product_sku` varchar(255) NOT NULL DEFAULT '',
  `link_section_title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`purchased_id`),
  KEY `DOWNLOADABLE_ORDER_ID` (`order_id`),
  KEY `DOWNLOADABLE_CUSTOMER_ID` (`customer_id`),
  KEY `KEY_DOWNLOADABLE_ORDER_ITEM_ID` (`order_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `downloadable_link_purchased`
--


-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_purchased_item`
--

CREATE TABLE IF NOT EXISTS `downloadable_link_purchased_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchased_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order_item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned DEFAULT '0',
  `link_hash` varchar(255) NOT NULL DEFAULT '',
  `number_of_downloads_bought` int(10) unsigned NOT NULL DEFAULT '0',
  `number_of_downloads_used` int(10) unsigned NOT NULL DEFAULT '0',
  `link_id` int(20) unsigned NOT NULL DEFAULT '0',
  `link_title` varchar(255) NOT NULL DEFAULT '',
  `is_shareable` smallint(1) unsigned NOT NULL DEFAULT '0',
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_file` varchar(255) NOT NULL DEFAULT '',
  `link_type` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(50) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ID` (`purchased_id`),
  KEY `DOWNLOADABLE_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADALBE_LINK_HASH` (`link_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `downloadable_link_purchased_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_title`
--

CREATE TABLE IF NOT EXISTS `downloadable_link_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `UNQ_LINK_TITLE_STORE` (`link_id`,`store_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_LINK` (`link_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `downloadable_link_title`
--


-- --------------------------------------------------------

--
-- Table structure for table `downloadable_sample`
--

CREATE TABLE IF NOT EXISTS `downloadable_sample` (
  `sample_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sample_url` varchar(255) NOT NULL DEFAULT '',
  `sample_file` varchar(255) NOT NULL DEFAULT '',
  `sample_type` varchar(20) NOT NULL DEFAULT '',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sample_id`),
  KEY `DOWNLODABLE_SAMPLE_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `downloadable_sample`
--


-- --------------------------------------------------------

--
-- Table structure for table `downloadable_sample_title`
--

CREATE TABLE IF NOT EXISTS `downloadable_sample_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sample_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `UNQ_SAMPLE_TITLE_STORE` (`sample_id`,`store_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_SAMPLE` (`sample_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `downloadable_sample_title`
--


-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute`
--

CREATE TABLE IF NOT EXISTS `eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_code` varchar(255) NOT NULL DEFAULT '',
  `attribute_model` varchar(255) DEFAULT NULL,
  `backend_model` varchar(255) DEFAULT NULL,
  `backend_type` enum('static','datetime','decimal','int','text','varchar') NOT NULL DEFAULT 'static',
  `backend_table` varchar(255) DEFAULT NULL,
  `frontend_model` varchar(255) DEFAULT NULL,
  `frontend_input` varchar(50) DEFAULT NULL,
  `frontend_label` varchar(255) DEFAULT NULL,
  `frontend_class` varchar(255) DEFAULT NULL,
  `source_model` varchar(255) DEFAULT NULL,
  `is_required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_value` text,
  `is_unique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL,
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `entity_type_id` (`entity_type_id`,`attribute_code`),
  KEY `IDX_USED_FOR_SORT_BY` (`entity_type_id`),
  KEY `IDX_USED_IN_PRODUCT_LISTING` (`entity_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=525 ;

--
-- Dumping data for table `eav_attribute`
--

INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES
(1, 1, 'website_id', NULL, 'customer/customer_attribute_backend_website', 'static', '', '', 'select', 'Associate to Website', '', 'customer/customer_attribute_source_website', 1, 0, '', 0, ''),
(2, 1, 'store_id', NULL, 'customer/customer_attribute_backend_store', 'static', '', '', 'select', 'Create In', '', 'customer/customer_attribute_source_store', 1, 0, '', 0, ''),
(3, 1, 'created_in', NULL, '', 'varchar', '', '', 'text', 'Created From', '', '', 1, 0, '', 0, ''),
(4, 1, 'prefix', NULL, '', 'varchar', '', '', 'text', 'Prefix', '', '', 0, 0, '', 0, ''),
(5, 1, 'firstname', NULL, '', 'varchar', '', '', 'text', 'First Name', '', '', 1, 0, '', 0, ''),
(6, 1, 'middlename', NULL, '', 'varchar', '', '', 'text', 'Middle Name/Initial', '', '', 0, 0, '', 0, ''),
(7, 1, 'lastname', NULL, '', 'varchar', '', '', 'text', 'Last Name', '', '', 1, 0, '', 0, ''),
(8, 1, 'suffix', NULL, '', 'varchar', '', '', 'text', 'Suffix', '', '', 0, 0, '', 0, ''),
(9, 1, 'email', NULL, '', 'static', '', '', 'text', 'Email', '', '', 1, 0, '', 0, ''),
(10, 1, 'group_id', NULL, '', 'static', '', '', 'select', 'Group', '', 'customer/customer_attribute_source_group', 1, 0, '', 0, ''),
(11, 1, 'dob', NULL, '', 'datetime', '', '', 'date', 'Date Of Birth', '', '', 0, 0, '', 0, ''),
(12, 1, 'password_hash', NULL, 'customer/customer_attribute_backend_password', 'varchar', '', '', 'hidden', '', '', '', 0, 0, '', 0, ''),
(13, 1, 'default_billing', NULL, 'customer/customer_attribute_backend_billing', 'int', '', '', 'text', 'Default Billing Address', '', '', 0, 0, '', 0, ''),
(14, 1, 'default_shipping', NULL, 'customer/customer_attribute_backend_shipping', 'int', '', '', 'text', 'Default Shipping Address', '', '', 0, 0, '', 0, ''),
(15, 1, 'taxvat', NULL, '', 'varchar', '', '', 'text', 'Tax/VAT Number', '', '', 0, 0, '', 0, ''),
(16, 1, 'confirmation', NULL, '', 'varchar', '', '', 'text', 'Is Confirmed', '', '', 0, 0, '', 0, ''),
(17, 1, 'created_at', NULL, '', 'static', '', '', 'date', 'Created At', '', '', 0, 0, '', 0, ''),
(18, 2, 'prefix', NULL, '', 'varchar', '', '', 'text', 'Prefix', '', '', 0, 0, '', 0, ''),
(19, 2, 'firstname', NULL, '', 'varchar', '', '', 'text', 'First Name', '', '', 1, 0, '', 0, ''),
(20, 2, 'middlename', NULL, '', 'varchar', '', '', 'text', 'Middle Name/Initial', '', '', 0, 0, '', 0, ''),
(21, 2, 'lastname', NULL, '', 'varchar', '', '', 'text', 'Last Name', '', '', 1, 0, '', 0, ''),
(22, 2, 'suffix', NULL, '', 'varchar', '', '', 'text', 'Suffix', '', '', 0, 0, '', 0, ''),
(23, 2, 'company', NULL, '', 'varchar', '', '', 'text', 'Company', '', '', 0, 0, '', 0, ''),
(24, 2, 'street', NULL, 'customer_entity/address_attribute_backend_street', 'text', '', '', 'multiline', 'Street Address', '', '', 1, 0, '', 0, ''),
(25, 2, 'city', NULL, '', 'varchar', '', '', 'text', 'City', '', '', 1, 0, '', 0, ''),
(26, 2, 'country_id', NULL, '', 'varchar', '', '', 'select', 'Country', '', 'customer_entity/address_attribute_source_country', 1, 0, '', 0, ''),
(27, 2, 'region', NULL, 'customer_entity/address_attribute_backend_region', 'varchar', '', '', 'text', 'State/Province', '', '', 1, 0, '', 0, ''),
(28, 2, 'region_id', NULL, '', 'int', '', '', 'hidden', 'State/Province', '', 'customer_entity/address_attribute_source_region', 0, 0, '', 0, ''),
(29, 2, 'postcode', NULL, '', 'varchar', '', '', 'text', 'Zip/Postal Code', '', '', 1, 0, '', 0, ''),
(30, 2, 'telephone', NULL, '', 'varchar', '', '', 'text', 'Telephone', '', '', 1, 0, '', 0, ''),
(31, 2, 'fax', NULL, '', 'varchar', '', '', 'text', 'Fax', '', '', 0, 0, '', 0, ''),
(32, 1, 'gender', NULL, '', 'int', '', '', 'select', 'Gender', '', 'eav/entity_attribute_source_table', 0, 0, '', 0, ''),
(33, 3, 'name', NULL, '', 'varchar', '', '', 'text', 'Name', '', '', 1, 0, '', 0, ''),
(34, 3, 'is_active', NULL, '', 'int', '', '', 'select', 'Is Active', '', 'eav/entity_attribute_source_boolean', 1, 0, '', 0, ''),
(35, 3, 'url_key', NULL, 'catalog/category_attribute_backend_urlkey', 'varchar', '', '', 'text', 'URL key', '', '', 0, 0, '', 0, ''),
(36, 3, 'description', NULL, '', 'text', '', '', 'textarea', 'Description', '', '', 0, 0, '', 0, ''),
(37, 3, 'image', NULL, 'catalog/category_attribute_backend_image', 'varchar', '', '', 'image', 'Image', '', '', 0, 0, '', 0, ''),
(38, 3, 'meta_title', NULL, '', 'varchar', '', '', 'text', 'Page Title', '', '', 0, 0, '', 0, ''),
(39, 3, 'meta_keywords', NULL, '', 'text', '', '', 'textarea', 'Meta Keywords', '', '', 0, 0, '', 0, ''),
(40, 3, 'meta_description', NULL, '', 'text', '', '', 'textarea', 'Meta Description', '', '', 0, 0, '', 0, ''),
(41, 3, 'display_mode', NULL, '', 'varchar', '', '', 'select', 'Display Mode', '', 'catalog/category_attribute_source_mode', 0, 0, '', 0, ''),
(42, 3, 'landing_page', NULL, '', 'int', '', '', 'select', 'CMS Block', '', 'catalog/category_attribute_source_page', 0, 0, '', 0, ''),
(43, 3, 'is_anchor', NULL, '', 'int', '', '', 'select', 'Is Anchor', '', 'eav/entity_attribute_source_boolean', 0, 0, '', 0, ''),
(44, 3, 'path', NULL, '', 'static', '', '', '', 'Path', '', '', 0, 0, '', 0, ''),
(45, 3, 'position', NULL, '', 'static', '', '', '', 'Position', '', '', 0, 0, '', 0, ''),
(46, 3, 'all_children', NULL, '', 'text', '', '', '', '', '', '', 0, 0, '', 0, ''),
(47, 3, 'path_in_store', NULL, '', 'text', '', '', '', '', '', '', 0, 0, '', 0, ''),
(48, 3, 'children', NULL, '', 'text', '', '', '', '', '', '', 0, 0, '', 0, ''),
(49, 3, 'url_path', NULL, '', 'varchar', '', '', '', '', '', '', 0, 0, '', 0, ''),
(50, 3, 'custom_design', NULL, '', 'varchar', '', '', 'select', 'Custom Design', '', 'core/design_source_design', 0, 0, '', 0, ''),
(51, 3, 'custom_design_apply', NULL, '', 'int', '', '', 'select', 'Apply To', '', 'core/design_source_apply', 0, 0, '', 0, ''),
(52, 3, 'custom_design_from', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', '', '', 'date', 'Active From', '', '', 0, 0, '', 0, ''),
(53, 3, 'custom_design_to', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', '', '', 'date', 'Active To', '', '', 0, 0, '', 0, ''),
(54, 3, 'page_layout', NULL, '', 'varchar', '', '', 'select', 'Page Layout', '', 'catalog/category_attribute_source_layout', 0, 0, '', 0, ''),
(55, 3, 'custom_layout_update', NULL, '', 'text', '', '', 'textarea', 'Custom Layout Update', '', '', 0, 0, '', 0, ''),
(56, 3, 'level', NULL, '', 'static', '', '', '', 'Level', '', '', 0, 0, '', 0, ''),
(57, 3, 'children_count', NULL, '', 'static', '', '', '', 'Children Count', '', '', 0, 0, '', 0, ''),
(58, 3, 'available_sort_by', NULL, 'catalog/category_attribute_backend_sortby', 'text', '', '', 'multiselect', 'Available Product Listing Sort by', '', 'catalog/category_attribute_source_sortby', 1, 0, '', 0, ''),
(59, 3, 'default_sort_by', NULL, 'catalog/category_attribute_backend_sortby', 'varchar', '', '', 'select', 'Default Product Listing Sort by', '', 'catalog/category_attribute_source_sortby', 1, 0, '', 0, ''),
(60, 4, 'name', NULL, '', 'varchar', '', '', 'text', 'Name', '', '', 1, 0, '', 0, ''),
(61, 4, 'description', NULL, '', 'text', '', '', 'textarea', 'Description', '', '', 1, 0, '', 0, ''),
(62, 4, 'short_description', NULL, '', 'text', '', '', 'textarea', 'Short Description', '', '', 1, 0, '', 0, ''),
(63, 4, 'sku', NULL, '', 'static', '', '', 'text', 'SKU', '', '', 1, 0, '', 1, ''),
(64, 4, 'price', NULL, 'catalog/product_attribute_backend_price', 'decimal', '', '', 'price', 'Price', '', '', 1, 0, '', 0, ''),
(65, 4, 'special_price', NULL, 'catalog/product_attribute_backend_price', 'decimal', '', '', 'price', 'Special Price', '', '', 0, 0, '', 0, ''),
(66, 4, 'special_from_date', NULL, 'catalog/product_attribute_backend_startdate', 'datetime', '', '', 'date', 'Special Price From Date', '', '', 0, 0, '', 0, ''),
(67, 4, 'special_to_date', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', '', '', 'date', 'Special Price To Date', '', '', 0, 0, '', 0, ''),
(68, 4, 'cost', NULL, 'catalog/product_attribute_backend_price', 'decimal', '', '', 'price', 'Cost', '', '', 0, 1, '', 0, ''),
(69, 4, 'weight', NULL, '', 'decimal', '', '', 'text', 'Weight', '', '', 1, 0, '', 0, ''),
(70, 4, 'manufacturer', NULL, '', 'int', '', '', 'select', 'Manufacturer', '', '', 0, 1, '', 0, ''),
(71, 4, 'meta_title', NULL, '', 'varchar', '', '', 'text', 'Meta Title', '', '', 0, 0, '', 0, ''),
(72, 4, 'meta_keyword', NULL, '', 'text', '', '', 'textarea', 'Meta Keywords', '', '', 0, 0, '', 0, ''),
(73, 4, 'meta_description', NULL, '', 'varchar', '', '', 'textarea', 'Meta Description', '', '', 0, 0, '', 0, 'Maximum 255 chars'),
(74, 4, 'image', NULL, '', 'varchar', '', 'catalog/product_attribute_frontend_image', 'media_image', 'Base Image', '', '', 0, 0, '', 0, ''),
(75, 4, 'small_image', NULL, '', 'varchar', '', 'catalog/product_attribute_frontend_image', 'media_image', 'Small Image', '', '', 0, 0, '', 0, ''),
(76, 4, 'thumbnail', NULL, '', 'varchar', '', 'catalog/product_attribute_frontend_image', 'media_image', 'Thumbnail', '', '', 0, 0, '', 0, ''),
(77, 4, 'media_gallery', NULL, 'catalog/product_attribute_backend_media', 'varchar', '', '', 'gallery', 'Media Gallery', '', '', 0, 0, '', 0, ''),
(78, 4, 'old_id', NULL, '', 'int', '', '', '', '', '', '', 0, 0, '', 0, ''),
(79, 4, 'tier_price', NULL, 'catalog/product_attribute_backend_tierprice', 'decimal', '', '', 'text', 'Tier Price', '', '', 0, 0, '', 0, ''),
(80, 4, 'color', NULL, '', 'int', '', '', 'select', 'Color', '', '', 0, 1, '', 0, ''),
(81, 4, 'news_from_date', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', '', '', 'date', 'Set Product as New from Date', '', '', 0, 0, '', 0, ''),
(82, 4, 'news_to_date', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', '', '', 'date', 'Set Product as New to Date', '', '', 0, 0, '', 0, ''),
(83, 4, 'gallery', NULL, '', 'varchar', '', '', 'gallery', 'Image Gallery', '', '', 0, 0, '', 0, ''),
(84, 4, 'status', NULL, '', 'int', '', '', 'select', 'Status', '', 'catalog/product_status', 1, 0, '', 0, ''),
(85, 4, 'tax_class_id', NULL, '', 'int', '', '', 'select', 'Tax Class', '', 'tax/class_source_product', 1, 0, '', 0, ''),
(86, 4, 'url_key', NULL, 'catalog/product_attribute_backend_urlkey', 'varchar', '', '', 'text', 'URL key', '', '', 0, 0, '', 0, ''),
(87, 4, 'url_path', NULL, '', 'varchar', '', '', '', '', '', '', 0, 0, '', 0, ''),
(88, 4, 'minimal_price', NULL, '', 'decimal', '', '', 'price', 'Minimal Price', '', '', 1, 0, '', 0, ''),
(89, 4, 'visibility', NULL, '', 'int', '', '', 'select', 'Visibility', '', 'catalog/product_visibility', 1, 0, '4', 0, ''),
(90, 4, 'custom_design', NULL, '', 'varchar', '', '', 'select', 'Custom Design', '', 'core/design_source_design', 0, 0, '', 0, ''),
(91, 4, 'custom_design_from', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', '', '', 'date', 'Active From', '', '', 0, 0, '', 0, ''),
(92, 4, 'custom_design_to', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', '', '', 'date', 'Active To', '', '', 0, 0, '', 0, ''),
(93, 4, 'custom_layout_update', NULL, '', 'text', '', '', 'textarea', 'Custom Layout Update', '', '', 0, 0, '', 0, ''),
(94, 4, 'page_layout', NULL, '', 'varchar', '', '', 'select', 'Page Layout', '', 'catalog/product_attribute_source_layout', 0, 0, '', 0, ''),
(95, 4, 'category_ids', NULL, '', 'static', '', '', '', '', '', '', 0, 0, '', 0, ''),
(96, 4, 'options_container', NULL, '', 'varchar', '', '', 'select', 'Display product options in', '', 'catalog/entity_product_attribute_design_options_container', 0, 0, 'container2', 0, ''),
(97, 4, 'required_options', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(98, 4, 'has_options', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(99, 4, 'image_label', NULL, '', 'varchar', '', '', 'text', 'Image Label', '', '', 0, 0, '', 0, ''),
(100, 4, 'small_image_label', NULL, '', 'varchar', '', '', 'text', 'Small Image Label', '', '', 0, 0, '', 0, ''),
(101, 4, 'thumbnail_label', NULL, '', 'varchar', '', '', 'text', 'Thumbnail Label', '', '', 0, 0, '', 0, ''),
(102, 4, 'created_at', NULL, 'eav/entity_attribute_backend_time_created', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(103, 4, 'updated_at', NULL, 'eav/entity_attribute_backend_time_updated', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(104, 11, 'entity_id', NULL, 'sales_entity/order_attribute_backend_parent', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(105, 11, 'store_id', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(106, 11, 'store_name', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(107, 11, 'remote_ip', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(108, 11, 'status', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(109, 11, 'state', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(110, 11, 'hold_before_status', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(111, 11, 'hold_before_state', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(112, 11, 'relation_parent_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(113, 11, 'relation_parent_real_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(114, 11, 'relation_child_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(115, 11, 'relation_child_real_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(116, 11, 'original_increment_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(117, 11, 'edit_increment', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(118, 11, 'ext_order_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(119, 11, 'ext_customer_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(120, 11, 'quote_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(121, 11, 'quote_address_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(122, 11, 'billing_address_id', NULL, 'sales_entity/order_attribute_backend_billing', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(123, 11, 'shipping_address_id', NULL, 'sales_entity/order_attribute_backend_shipping', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(124, 11, 'coupon_code', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(125, 11, 'applied_rule_ids', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(126, 11, 'global_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(127, 11, 'base_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(128, 11, 'store_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(129, 11, 'order_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(130, 11, 'store_to_base_rate', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(131, 11, 'store_to_order_rate', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(132, 11, 'base_to_global_rate', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(133, 11, 'base_to_order_rate', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(134, 11, 'is_virtual', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(135, 11, 'shipping_method', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(136, 11, 'shipping_description', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(137, 11, 'weight', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(138, 11, 'tax_amount', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(139, 11, 'shipping_amount', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(140, 11, 'shipping_tax_amount', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(141, 11, 'discount_amount', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(142, 11, 'subtotal', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(143, 11, 'grand_total', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(144, 11, 'total_paid', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(145, 11, 'total_due', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(146, 11, 'total_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(147, 11, 'total_qty_ordered', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(148, 11, 'total_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(149, 11, 'total_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(150, 11, 'total_online_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(151, 11, 'total_offline_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(152, 11, 'adjustment_positive', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(153, 11, 'adjustment_negative', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(154, 11, 'base_tax_amount', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(155, 11, 'base_shipping_amount', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(156, 11, 'base_shipping_tax_amount', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(157, 11, 'base_discount_amount', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(158, 11, 'base_subtotal', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(159, 11, 'base_grand_total', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(160, 11, 'base_total_paid', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(161, 11, 'base_total_due', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(162, 11, 'base_total_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(163, 11, 'base_total_qty_ordered', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(164, 11, 'base_total_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(165, 11, 'base_total_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(166, 11, 'base_total_online_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(167, 11, 'base_total_offline_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(168, 11, 'base_adjustment_positive', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(169, 11, 'base_adjustment_negative', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(170, 11, 'subtotal_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(171, 11, 'subtotal_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(172, 11, 'discount_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(173, 11, 'discount_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(174, 11, 'discount_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(175, 11, 'subtotal_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(176, 11, 'tax_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(177, 11, 'tax_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(178, 11, 'tax_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(179, 11, 'shipping_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(180, 11, 'shipping_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(181, 11, 'shipping_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(182, 11, 'base_subtotal_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(183, 11, 'base_subtotal_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(184, 11, 'base_discount_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(185, 11, 'base_discount_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(186, 11, 'base_discount_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(187, 11, 'base_subtotal_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(188, 11, 'base_tax_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(189, 11, 'base_tax_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(190, 11, 'base_tax_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(191, 11, 'base_shipping_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(192, 11, 'base_shipping_canceled', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(193, 11, 'base_shipping_invoiced', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(194, 11, 'protect_code', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(195, 11, 'customer_id', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(196, 11, 'customer_group_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(197, 11, 'customer_email', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(198, 11, 'customer_prefix', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(199, 11, 'customer_firstname', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(200, 11, 'customer_middlename', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(201, 11, 'customer_lastname', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(202, 11, 'customer_suffix', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(203, 11, 'customer_note', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(204, 11, 'customer_note_notify', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(205, 11, 'customer_is_guest', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(206, 11, 'email_sent', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(207, 11, 'customer_taxvat', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(208, 11, 'customer_dob', NULL, '', 'datetime', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(209, 11, 'customer_gender', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(210, 12, 'parent_id', NULL, 'sales_entity/order_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(211, 12, 'quote_address_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(212, 12, 'address_type', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(213, 12, 'customer_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(214, 12, 'customer_address_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(215, 12, 'email', NULL, '', 'varchar', '', '', 'text', 'Email', '', '', 1, 0, '', 0, ''),
(216, 12, 'prefix', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(217, 12, 'firstname', NULL, '', 'varchar', '', '', 'text', 'First Name', '', '', 1, 0, '', 0, ''),
(218, 12, 'middlename', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(219, 12, 'lastname', NULL, '', 'varchar', '', '', 'text', 'Last Name', '', '', 1, 0, '', 0, ''),
(220, 12, 'suffix', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(221, 12, 'company', NULL, '', 'varchar', '', '', 'text', 'Company', '', '', 1, 0, '', 0, ''),
(222, 12, 'street', NULL, '', 'varchar', '', '', 'text', 'Street Address', '', '', 1, 0, '', 0, ''),
(223, 12, 'city', NULL, '', 'varchar', '', '', 'text', 'City', '', '', 1, 0, '', 0, ''),
(224, 12, 'region', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(225, 12, 'region_id', NULL, '', 'int', '', '', 'text', 'State/Province', '', '', 1, 0, '', 0, ''),
(226, 12, 'postcode', NULL, '', 'varchar', '', '', 'text', 'Zip/Postal Code', '', '', 1, 0, '', 0, ''),
(227, 12, 'country_id', NULL, '', 'varchar', '', '', 'text', 'Country', '', '', 1, 0, '', 0, ''),
(228, 12, 'telephone', NULL, '', 'varchar', '', '', 'text', 'Telephone', '', '', 1, 0, '', 0, ''),
(229, 12, 'fax', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(230, 13, 'parent_id', NULL, 'sales_entity/order_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(231, 13, 'quote_item_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(232, 13, 'product_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(233, 13, 'super_product_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(234, 13, 'parent_product_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(235, 13, 'is_virtual', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(236, 13, 'sku', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(237, 13, 'name', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(238, 13, 'description', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(239, 13, 'weight', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(240, 13, 'is_qty_decimal', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(241, 13, 'qty_ordered', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(242, 13, 'qty_backordered', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(243, 13, 'qty_invoiced', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(244, 13, 'qty_canceled', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(245, 13, 'qty_shipped', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(246, 13, 'qty_refunded', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(247, 13, 'original_price', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(248, 13, 'price', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(249, 13, 'base_cost', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(250, 13, 'discount_percent', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(251, 13, 'discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(252, 13, 'discount_invoiced', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(253, 13, 'tax_percent', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(254, 13, 'tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(255, 13, 'tax_invoiced', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(256, 13, 'row_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(257, 13, 'row_weight', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(258, 13, 'row_invoiced', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(259, 13, 'invoiced_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(260, 13, 'amount_refunded', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(261, 13, 'base_price', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(262, 13, 'base_original_price', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(263, 13, 'base_discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(264, 13, 'base_discount_invoiced', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(265, 13, 'base_tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(266, 13, 'base_tax_invoiced', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(267, 13, 'base_row_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(268, 13, 'base_row_invoiced', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(269, 13, 'base_invoiced_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(270, 13, 'base_amount_refunded', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(271, 13, 'applied_rule_ids', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(272, 13, 'additional_data', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(273, 14, 'parent_id', NULL, 'sales_entity/order_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(274, 14, 'quote_payment_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(275, 14, 'method', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(276, 14, 'additional_data', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(277, 14, 'last_trans_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(278, 14, 'po_number', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(279, 14, 'cc_type', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(280, 14, 'cc_number_enc', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(281, 14, 'cc_last4', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(282, 14, 'cc_owner', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(283, 14, 'cc_exp_month', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(284, 14, 'cc_exp_year', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(285, 14, 'cc_ss_issue', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(286, 14, 'cc_ss_start_month', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(287, 14, 'cc_ss_start_year', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(288, 14, 'cc_status', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(289, 14, 'cc_status_description', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(290, 14, 'cc_trans_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(291, 14, 'cc_approval', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(292, 14, 'cc_avs_status', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(293, 14, 'cc_cid_status', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(294, 14, 'cc_debug_request_body', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(295, 14, 'cc_debug_response_body', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(296, 14, 'cc_debug_response_serialized', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(297, 14, 'anet_trans_method', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(298, 14, 'echeck_routing_number', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(299, 14, 'echeck_bank_name', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(300, 14, 'echeck_account_type', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(301, 14, 'echeck_account_name', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(302, 14, 'echeck_type', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(303, 14, 'amount_ordered', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(304, 14, 'amount_authorized', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(305, 14, 'amount_paid', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(306, 14, 'amount_canceled', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(307, 14, 'amount_refunded', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(308, 14, 'shipping_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(309, 14, 'shipping_captured', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(310, 14, 'shipping_refunded', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(311, 14, 'base_amount_ordered', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(312, 14, 'base_amount_authorized', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(313, 14, 'base_amount_paid', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(314, 14, 'base_amount_paid_online', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(315, 14, 'base_amount_canceled', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(316, 14, 'base_amount_refunded', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(317, 14, 'base_amount_refunded_online', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(318, 14, 'base_shipping_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(319, 14, 'base_shipping_captured', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(320, 14, 'base_shipping_refunded', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(321, 15, 'parent_id', NULL, 'sales_entity/order_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(322, 15, 'status', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(323, 15, 'comment', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(324, 15, 'is_customer_notified', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(325, 16, 'entity_id', NULL, 'sales_entity/order_invoice_attribute_backend_parent', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(326, 16, 'state', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(327, 16, 'is_used_for_refund', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(328, 16, 'transaction_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(329, 16, 'order_id', NULL, 'sales_entity/order_invoice_attribute_backend_order', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(330, 16, 'billing_address_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(331, 16, 'shipping_address_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(332, 16, 'global_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(333, 16, 'base_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(334, 16, 'store_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(335, 16, 'order_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(336, 16, 'store_to_base_rate', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(337, 16, 'store_to_order_rate', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(338, 16, 'base_to_global_rate', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(339, 16, 'base_to_order_rate', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(340, 16, 'subtotal', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(341, 16, 'discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(342, 16, 'tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(343, 16, 'shipping_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(344, 16, 'grand_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(345, 16, 'total_qty', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(346, 16, 'can_void_flag', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(347, 16, 'base_subtotal', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(348, 16, 'base_discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(349, 16, 'base_tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(350, 16, 'base_shipping_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(351, 16, 'base_grand_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(352, 16, 'email_sent', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(353, 16, 'store_id', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(354, 17, 'parent_id', NULL, 'sales_entity/order_invoice_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(355, 17, 'order_item_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(356, 17, 'product_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(357, 17, 'name', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(358, 17, 'description', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(359, 17, 'sku', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(360, 17, 'qty', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(361, 17, 'base_cost', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(362, 17, 'price', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(363, 17, 'discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(364, 17, 'tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(365, 17, 'row_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(366, 17, 'base_price', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(367, 17, 'base_discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(368, 17, 'base_tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(369, 17, 'base_row_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(370, 17, 'additional_data', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(371, 18, 'parent_id', NULL, 'sales_entity/order_invoice_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(372, 18, 'comment', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(373, 18, 'is_customer_notified', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(374, 19, 'entity_id', NULL, 'sales_entity/order_shipment_attribute_backend_parent', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(375, 19, 'customer_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(376, 19, 'order_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(377, 19, 'shipment_status', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(378, 19, 'billing_address_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(379, 19, 'shipping_address_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(380, 19, 'total_qty', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(381, 19, 'total_weight', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(382, 19, 'email_sent', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(383, 19, 'store_id', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(384, 20, 'parent_id', NULL, 'sales_entity/order_shipment_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(385, 20, 'order_item_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(386, 20, 'product_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(387, 20, 'name', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(388, 20, 'description', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(389, 20, 'sku', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(390, 20, 'qty', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(391, 20, 'price', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(392, 20, 'weight', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(393, 20, 'row_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(394, 20, 'additional_data', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(395, 21, 'parent_id', NULL, 'sales_entity/order_shipment_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(396, 21, 'comment', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(397, 21, 'is_customer_notified', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(398, 22, 'parent_id', NULL, 'sales_entity/order_shipment_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(399, 22, 'order_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(400, 22, 'number', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(401, 22, 'carrier_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(402, 22, 'title', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(403, 22, 'description', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(404, 22, 'qty', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(405, 22, 'weight', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(406, 23, 'entity_id', NULL, 'sales_entity/order_creditmemo_attribute_backend_parent', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(407, 23, 'state', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(408, 23, 'invoice_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(409, 23, 'transaction_id', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(410, 23, 'order_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(411, 23, 'creditmemo_status', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(412, 23, 'billing_address_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(413, 23, 'shipping_address_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(414, 23, 'global_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(415, 23, 'base_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(416, 23, 'store_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(417, 23, 'order_currency_code', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(418, 23, 'store_to_base_rate', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(419, 23, 'store_to_order_rate', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(420, 23, 'base_to_global_rate', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(421, 23, 'base_to_order_rate', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(422, 23, 'subtotal', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(423, 23, 'discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(424, 23, 'tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(425, 23, 'shipping_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(426, 23, 'adjustment', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(427, 23, 'adjustment_positive', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(428, 23, 'adjustment_negative', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(429, 23, 'grand_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(430, 23, 'base_subtotal', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(431, 23, 'base_discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(432, 23, 'base_tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(433, 23, 'base_shipping_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(434, 23, 'base_adjustment', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(435, 23, 'base_adjustment_positive', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(436, 23, 'base_adjustment_negative', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(437, 23, 'base_grand_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(438, 23, 'email_sent', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(439, 23, 'store_id', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(440, 24, 'parent_id', NULL, 'sales_entity/order_creditmemo_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(441, 24, 'order_item_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(442, 24, 'product_id', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(443, 24, 'name', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(444, 24, 'description', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(445, 24, 'sku', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(446, 24, 'qty', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(447, 24, 'base_cost', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(448, 24, 'price', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(449, 24, 'discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(450, 24, 'tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(451, 24, 'row_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(452, 24, 'base_price', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(453, 24, 'base_discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(454, 24, 'base_tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(455, 24, 'base_row_total', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(456, 24, 'additional_data', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(457, 25, 'parent_id', NULL, 'sales_entity/order_creditmemo_attribute_backend_child', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(458, 25, 'comment', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(459, 25, 'is_customer_notified', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(460, 13, 'product_type', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(461, 11, 'can_ship_partially', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(462, 11, 'can_ship_partially_item', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(463, 11, 'payment_authorization_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(464, 11, 'payment_authorization_expiration', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(465, 11, 'shipping_tax_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(466, 11, 'base_shipping_tax_refunded', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(468, 11, 'forced_do_shipment_with_invoice', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '0', 0, ''),
(469, 11, 'base_total_invoiced_cost', NULL, '', 'static', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(470, 11, 'x_forwarded_for', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(471, 14, 'additional_information', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(472, 11, 'discount_description', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(473, 11, 'shipping_discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(474, 11, 'base_shipping_discount_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(475, 11, 'paypal_ipn_customer_notified', NULL, '', 'int', '', '', 'text', '', '', '', 1, 0, '0', 0, ''),
(476, 14, 'cc_secure_verify', NULL, '', 'varchar', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(477, 4, 'enable_googlecheckout', NULL, '', 'int', '', '', 'select', 'Is product available for purchase with Google Checkout', '', 'eav/entity_attribute_source_boolean', 0, 0, '1', 0, ''),
(478, 16, 'shipping_tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(479, 16, 'base_shipping_tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(480, 23, 'shipping_tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(481, 23, 'base_shipping_tax_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(482, 11, 'subtotal_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(483, 11, 'base_subtotal_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(484, 17, 'price_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(485, 17, 'base_price_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(486, 17, 'row_total_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(487, 17, 'base_row_total_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(488, 16, 'subtotal_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(489, 16, 'base_subtotal_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(490, 24, 'price_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(491, 24, 'base_price_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(492, 24, 'row_total_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(493, 24, 'base_row_total_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(494, 23, 'subtotal_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(495, 23, 'base_subtotal_incl_tax', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(496, 11, 'gift_message_id', NULL, '', 'int', '', '', 'text', '', '', '', 0, 0, '', 0, ''),
(497, 4, 'gift_message_available', NULL, 'giftmessage/entity_attribute_backend_boolean_config', 'varchar', '', '', 'select', 'Allow Gift Message', '', 'giftmessage/entity_attribute_source_boolean_config', 0, 0, '2', 0, '');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES
(498, 4, 'price_type', NULL, '', 'int', '', '', '', '', '', '', 1, 0, '', 0, ''),
(499, 4, 'sku_type', NULL, '', 'int', '', '', '', '', '', '', 1, 0, '', 0, ''),
(500, 4, 'weight_type', NULL, '', 'int', '', '', '', '', '', '', 1, 0, '', 0, ''),
(501, 4, 'price_view', NULL, '', 'int', '', '', 'select', 'Price View', '', 'bundle/product_attribute_source_price_view', 1, 0, '', 0, ''),
(502, 4, 'shipment_type', NULL, '', 'int', '', '', '', 'Shipment', '', '', 1, 0, '', 0, ''),
(503, 4, 'links_purchased_separately', NULL, '', 'int', '', '', '', 'Links can be purchased separately', '', '', 1, 0, '', 0, ''),
(504, 4, 'samples_title', NULL, '', 'varchar', '', '', '', 'Samples title', '', '', 1, 0, '', 0, ''),
(505, 4, 'links_title', NULL, '', 'varchar', '', '', '', 'Links title', '', '', 1, 0, '', 0, ''),
(506, 4, 'links_exist', NULL, '', 'int', '', '', '', '', '', '', 0, 0, '0', 0, ''),
(507, 24, 'base_weee_tax_applied_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(508, 24, 'base_weee_tax_applied_row_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(509, 24, 'weee_tax_applied_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(510, 24, 'weee_tax_applied_row_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(511, 17, 'base_weee_tax_applied_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(512, 17, 'base_weee_tax_applied_row_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(513, 17, 'weee_tax_applied_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(514, 17, 'weee_tax_applied_row_amount', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(515, 17, 'weee_tax_applied', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(516, 24, 'weee_tax_applied', NULL, '', 'text', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(517, 24, 'weee_tax_disposition', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(518, 24, 'weee_tax_row_disposition', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(519, 24, 'base_weee_tax_disposition', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(520, 24, 'base_weee_tax_row_disposition', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(521, 17, 'weee_tax_disposition', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(522, 17, 'weee_tax_row_disposition', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(523, 17, 'base_weee_tax_disposition', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, ''),
(524, 17, 'base_weee_tax_row_disposition', NULL, '', 'decimal', '', '', 'text', '', '', '', 1, 0, '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_group`
--

CREATE TABLE IF NOT EXISTS `eav_attribute_group` (
  `attribute_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_group_name` varchar(255) NOT NULL DEFAULT '',
  `sort_order` smallint(6) NOT NULL DEFAULT '0',
  `default_id` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`attribute_group_id`),
  UNIQUE KEY `attribute_set_id` (`attribute_set_id`,`attribute_group_name`),
  KEY `attribute_set_id_2` (`attribute_set_id`,`sort_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `eav_attribute_group`
--

INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`) VALUES
(1, 1, 'General', 1, 1),
(2, 2, 'General', 1, 1),
(3, 3, 'General Information', 10, 1),
(4, 4, 'General', 1, 1),
(5, 4, 'Prices', 2, 0),
(6, 4, 'Meta Information', 3, 0),
(7, 4, 'Images', 4, 0),
(8, 4, 'Design', 6, 0),
(9, 3, 'Display Settings', 20, 0),
(10, 3, 'Custom Design', 30, 0),
(11, 5, 'General', 1, 1),
(12, 6, 'General', 1, 1),
(13, 7, 'General', 1, 1),
(14, 8, 'General', 1, 1),
(15, 9, 'General', 1, 1),
(16, 10, 'General', 1, 1),
(17, 11, 'General', 1, 1),
(18, 12, 'General', 1, 1),
(19, 13, 'General', 1, 1),
(20, 14, 'General', 1, 1),
(21, 15, 'General', 1, 1),
(22, 16, 'General', 1, 1),
(23, 17, 'General', 1, 1),
(24, 18, 'General', 1, 1),
(25, 19, 'General', 1, 1),
(26, 20, 'General', 1, 1),
(27, 21, 'General', 1, 1),
(28, 22, 'General', 1, 1),
(29, 23, 'General', 1, 1),
(30, 24, 'General', 1, 1),
(31, 25, 'General', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_label`
--

CREATE TABLE IF NOT EXISTS `eav_attribute_label` (
  `attribute_label_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`attribute_label_id`),
  KEY `IDX_ATTRIBUTE_LABEL_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_ATTRIBUTE_LABEL_STORE` (`store_id`),
  KEY `IDX_ATTRIBUTE_LABEL_ATTRIBUTE_STORE` (`attribute_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `eav_attribute_label`
--


-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_option`
--

CREATE TABLE IF NOT EXISTS `eav_attribute_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_id`),
  KEY `FK_ATTRIBUTE_OPTION_ATTRIBUTE` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Attributes option (for source model)' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `eav_attribute_option`
--

INSERT INTO `eav_attribute_option` (`option_id`, `attribute_id`, `sort_order`) VALUES
(1, 32, 0),
(2, 32, 1);

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_option_value`
--

CREATE TABLE IF NOT EXISTS `eav_attribute_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  KEY `FK_ATTRIBUTE_OPTION_VALUE_OPTION` (`option_id`),
  KEY `FK_ATTRIBUTE_OPTION_VALUE_STORE` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Attribute option values per store' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `eav_attribute_option_value`
--

INSERT INTO `eav_attribute_option_value` (`value_id`, `option_id`, `store_id`, `value`) VALUES
(1, 1, 0, 'Male'),
(2, 2, 0, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_set`
--

CREATE TABLE IF NOT EXISTS `eav_attribute_set` (
  `attribute_set_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_set_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL DEFAULT '',
  `sort_order` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attribute_set_id`),
  UNIQUE KEY `entity_type_id` (`entity_type_id`,`attribute_set_name`),
  KEY `entity_type_id_2` (`entity_type_id`,`sort_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `eav_attribute_set`
--

INSERT INTO `eav_attribute_set` (`attribute_set_id`, `entity_type_id`, `attribute_set_name`, `sort_order`) VALUES
(1, 1, 'Default', 1),
(2, 2, 'Default', 1),
(3, 3, 'Default', 1),
(4, 4, 'Default', 1),
(5, 5, 'Default', 1),
(6, 6, 'Default', 1),
(7, 7, 'Default', 1),
(8, 8, 'Default', 1),
(9, 9, 'Default', 1),
(10, 10, 'Default', 1),
(11, 11, 'Default', 1),
(12, 12, 'Default', 1),
(13, 13, 'Default', 1),
(14, 14, 'Default', 1),
(15, 15, 'Default', 1),
(16, 16, 'Default', 1),
(17, 17, 'Default', 1),
(18, 18, 'Default', 1),
(19, 19, 'Default', 1),
(20, 20, 'Default', 1),
(21, 21, 'Default', 1),
(22, 22, 'Default', 1),
(23, 23, 'Default', 1),
(24, 24, 'Default', 1),
(25, 25, 'Default', 1);

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity`
--

CREATE TABLE IF NOT EXISTS `eav_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `increment_id` varchar(50) NOT NULL DEFAULT '',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entity_id`),
  KEY `FK_ENTITY_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ENTITY_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Entityies' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `eav_entity`
--


-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_attribute`
--

CREATE TABLE IF NOT EXISTS `eav_entity_attribute` (
  `entity_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entity_attribute_id`),
  UNIQUE KEY `attribute_set_id_2` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `attribute_group_id` (`attribute_group_id`,`attribute_id`),
  KEY `attribute_set_id_3` (`attribute_set_id`,`sort_order`),
  KEY `FK_EAV_ENTITY_ATTRIVUTE_ATTRIBUTE` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=523 ;

--
-- Dumping data for table `eav_entity_attribute`
--

INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES
(1, 1, 1, 1, 1, 10),
(2, 1, 1, 1, 2, 20),
(3, 1, 1, 1, 3, 30),
(4, 1, 1, 1, 4, 37),
(5, 1, 1, 1, 5, 40),
(6, 1, 1, 1, 6, 43),
(7, 1, 1, 1, 7, 50),
(8, 1, 1, 1, 8, 53),
(9, 1, 1, 1, 9, 60),
(10, 1, 1, 1, 10, 70),
(11, 1, 1, 1, 11, 80),
(12, 1, 1, 1, 12, 81),
(13, 1, 1, 1, 13, 82),
(14, 1, 1, 1, 14, 83),
(15, 1, 1, 1, 15, 84),
(16, 1, 1, 1, 16, 85),
(17, 1, 1, 1, 17, 86),
(18, 2, 2, 2, 18, 7),
(19, 2, 2, 2, 19, 10),
(20, 2, 2, 2, 20, 13),
(21, 2, 2, 2, 21, 20),
(22, 2, 2, 2, 22, 23),
(23, 2, 2, 2, 23, 30),
(24, 2, 2, 2, 24, 40),
(25, 2, 2, 2, 25, 50),
(26, 2, 2, 2, 26, 60),
(27, 2, 2, 2, 27, 70),
(28, 2, 2, 2, 28, 80),
(29, 2, 2, 2, 29, 90),
(30, 2, 2, 2, 30, 100),
(31, 2, 2, 2, 31, 110),
(32, 1, 1, 1, 32, 87),
(33, 3, 3, 3, 33, 1),
(34, 3, 3, 3, 34, 2),
(35, 3, 3, 3, 35, 3),
(36, 3, 3, 3, 36, 4),
(37, 3, 3, 3, 37, 5),
(38, 3, 3, 3, 38, 6),
(39, 3, 3, 3, 39, 7),
(40, 3, 3, 3, 40, 8),
(41, 3, 3, 9, 41, 10),
(42, 3, 3, 9, 42, 20),
(43, 3, 3, 9, 43, 30),
(44, 3, 3, 3, 44, 12),
(45, 3, 3, 3, 45, 13),
(46, 3, 3, 3, 46, 14),
(47, 3, 3, 3, 47, 15),
(48, 3, 3, 3, 48, 16),
(49, 3, 3, 3, 49, 17),
(50, 3, 3, 10, 50, 10),
(51, 3, 3, 10, 51, 20),
(52, 3, 3, 10, 52, 30),
(53, 3, 3, 10, 53, 40),
(54, 3, 3, 10, 54, 50),
(55, 3, 3, 10, 55, 60),
(56, 3, 3, 3, 56, 24),
(57, 3, 3, 3, 57, 25),
(58, 3, 3, 9, 58, 40),
(59, 3, 3, 9, 59, 50),
(60, 4, 4, 4, 60, 1),
(61, 4, 4, 4, 61, 2),
(62, 4, 4, 4, 62, 3),
(63, 4, 4, 4, 63, 4),
(64, 4, 4, 5, 64, 1),
(65, 4, 4, 5, 65, 2),
(66, 4, 4, 5, 66, 3),
(67, 4, 4, 5, 67, 4),
(68, 4, 4, 5, 68, 5),
(69, 4, 4, 4, 69, 5),
(70, 4, 4, 6, 71, 1),
(71, 4, 4, 6, 72, 2),
(72, 4, 4, 6, 73, 3),
(73, 4, 4, 7, 74, 1),
(74, 4, 4, 7, 75, 2),
(75, 4, 4, 7, 76, 3),
(76, 4, 4, 7, 77, 4),
(77, 4, 4, 4, 78, 6),
(78, 4, 4, 5, 79, 6),
(79, 4, 4, 4, 81, 7),
(80, 4, 4, 4, 82, 8),
(81, 4, 4, 7, 83, 5),
(82, 4, 4, 4, 84, 9),
(83, 4, 4, 5, 85, 7),
(84, 4, 4, 4, 86, 10),
(85, 4, 4, 4, 87, 11),
(86, 4, 4, 5, 88, 8),
(87, 4, 4, 4, 89, 12),
(88, 4, 4, 8, 90, 1),
(89, 4, 4, 8, 91, 2),
(90, 4, 4, 8, 92, 3),
(91, 4, 4, 8, 93, 4),
(92, 4, 4, 8, 94, 5),
(93, 4, 4, 4, 95, 13),
(94, 4, 4, 8, 96, 6),
(95, 4, 4, 4, 97, 14),
(96, 4, 4, 4, 98, 15),
(97, 4, 4, 4, 99, 16),
(98, 4, 4, 4, 100, 17),
(99, 4, 4, 4, 101, 18),
(100, 4, 4, 4, 102, 19),
(101, 4, 4, 4, 103, 20),
(102, 11, 11, 17, 104, 1),
(103, 11, 11, 17, 105, 2),
(104, 11, 11, 17, 106, 3),
(105, 11, 11, 17, 107, 4),
(106, 11, 11, 17, 108, 5),
(107, 11, 11, 17, 109, 6),
(108, 11, 11, 17, 110, 7),
(109, 11, 11, 17, 111, 8),
(110, 11, 11, 17, 112, 9),
(111, 11, 11, 17, 113, 10),
(112, 11, 11, 17, 114, 11),
(113, 11, 11, 17, 115, 12),
(114, 11, 11, 17, 116, 13),
(115, 11, 11, 17, 117, 14),
(116, 11, 11, 17, 118, 15),
(117, 11, 11, 17, 119, 16),
(118, 11, 11, 17, 120, 17),
(119, 11, 11, 17, 121, 18),
(120, 11, 11, 17, 122, 19),
(121, 11, 11, 17, 123, 20),
(122, 11, 11, 17, 124, 21),
(123, 11, 11, 17, 125, 22),
(124, 11, 11, 17, 126, 23),
(125, 11, 11, 17, 127, 24),
(126, 11, 11, 17, 128, 25),
(127, 11, 11, 17, 129, 26),
(128, 11, 11, 17, 130, 27),
(129, 11, 11, 17, 131, 28),
(130, 11, 11, 17, 132, 29),
(131, 11, 11, 17, 133, 30),
(132, 11, 11, 17, 134, 31),
(133, 11, 11, 17, 135, 32),
(134, 11, 11, 17, 136, 33),
(135, 11, 11, 17, 137, 34),
(136, 11, 11, 17, 138, 35),
(137, 11, 11, 17, 139, 36),
(138, 11, 11, 17, 140, 37),
(139, 11, 11, 17, 141, 38),
(140, 11, 11, 17, 142, 39),
(141, 11, 11, 17, 143, 40),
(142, 11, 11, 17, 144, 41),
(143, 11, 11, 17, 145, 42),
(144, 11, 11, 17, 146, 43),
(145, 11, 11, 17, 147, 44),
(146, 11, 11, 17, 148, 45),
(147, 11, 11, 17, 149, 46),
(148, 11, 11, 17, 150, 47),
(149, 11, 11, 17, 151, 48),
(150, 11, 11, 17, 152, 49),
(151, 11, 11, 17, 153, 50),
(152, 11, 11, 17, 154, 51),
(153, 11, 11, 17, 155, 52),
(154, 11, 11, 17, 156, 53),
(155, 11, 11, 17, 157, 54),
(156, 11, 11, 17, 158, 55),
(157, 11, 11, 17, 159, 56),
(158, 11, 11, 17, 160, 57),
(159, 11, 11, 17, 161, 58),
(160, 11, 11, 17, 162, 59),
(161, 11, 11, 17, 163, 60),
(162, 11, 11, 17, 164, 61),
(163, 11, 11, 17, 165, 62),
(164, 11, 11, 17, 166, 63),
(165, 11, 11, 17, 167, 64),
(166, 11, 11, 17, 168, 65),
(167, 11, 11, 17, 169, 66),
(168, 11, 11, 17, 170, 67),
(169, 11, 11, 17, 171, 68),
(170, 11, 11, 17, 172, 69),
(171, 11, 11, 17, 173, 70),
(172, 11, 11, 17, 174, 71),
(173, 11, 11, 17, 175, 72),
(174, 11, 11, 17, 176, 73),
(175, 11, 11, 17, 177, 74),
(176, 11, 11, 17, 178, 75),
(177, 11, 11, 17, 179, 76),
(178, 11, 11, 17, 180, 77),
(179, 11, 11, 17, 181, 78),
(180, 11, 11, 17, 182, 79),
(181, 11, 11, 17, 183, 80),
(182, 11, 11, 17, 184, 81),
(183, 11, 11, 17, 185, 82),
(184, 11, 11, 17, 186, 83),
(185, 11, 11, 17, 187, 84),
(186, 11, 11, 17, 188, 85),
(187, 11, 11, 17, 189, 86),
(188, 11, 11, 17, 190, 87),
(189, 11, 11, 17, 191, 88),
(190, 11, 11, 17, 192, 89),
(191, 11, 11, 17, 193, 90),
(192, 11, 11, 17, 194, 91),
(193, 11, 11, 17, 195, 92),
(194, 11, 11, 17, 196, 93),
(195, 11, 11, 17, 197, 94),
(196, 11, 11, 17, 198, 95),
(197, 11, 11, 17, 199, 96),
(198, 11, 11, 17, 200, 97),
(199, 11, 11, 17, 201, 98),
(200, 11, 11, 17, 202, 99),
(201, 11, 11, 17, 203, 100),
(202, 11, 11, 17, 204, 101),
(203, 11, 11, 17, 205, 102),
(204, 11, 11, 17, 206, 103),
(205, 11, 11, 17, 207, 104),
(206, 11, 11, 17, 208, 105),
(207, 11, 11, 17, 209, 106),
(208, 12, 12, 18, 210, 1),
(209, 12, 12, 18, 211, 2),
(210, 12, 12, 18, 212, 3),
(211, 12, 12, 18, 213, 4),
(212, 12, 12, 18, 214, 5),
(213, 12, 12, 18, 215, 6),
(214, 12, 12, 18, 216, 7),
(215, 12, 12, 18, 217, 8),
(216, 12, 12, 18, 218, 9),
(217, 12, 12, 18, 219, 10),
(218, 12, 12, 18, 220, 11),
(219, 12, 12, 18, 221, 12),
(220, 12, 12, 18, 222, 13),
(221, 12, 12, 18, 223, 14),
(222, 12, 12, 18, 224, 15),
(223, 12, 12, 18, 225, 16),
(224, 12, 12, 18, 226, 17),
(225, 12, 12, 18, 227, 18),
(226, 12, 12, 18, 228, 19),
(227, 12, 12, 18, 229, 20),
(228, 13, 13, 19, 230, 1),
(229, 13, 13, 19, 231, 2),
(230, 13, 13, 19, 232, 3),
(231, 13, 13, 19, 233, 4),
(232, 13, 13, 19, 234, 5),
(233, 13, 13, 19, 235, 6),
(234, 13, 13, 19, 236, 7),
(235, 13, 13, 19, 237, 8),
(236, 13, 13, 19, 238, 9),
(237, 13, 13, 19, 239, 10),
(238, 13, 13, 19, 240, 11),
(239, 13, 13, 19, 241, 12),
(240, 13, 13, 19, 242, 13),
(241, 13, 13, 19, 243, 14),
(242, 13, 13, 19, 244, 15),
(243, 13, 13, 19, 245, 16),
(244, 13, 13, 19, 246, 17),
(245, 13, 13, 19, 247, 18),
(246, 13, 13, 19, 248, 19),
(247, 13, 13, 19, 249, 20),
(248, 13, 13, 19, 250, 21),
(249, 13, 13, 19, 251, 22),
(250, 13, 13, 19, 252, 23),
(251, 13, 13, 19, 253, 24),
(252, 13, 13, 19, 254, 25),
(253, 13, 13, 19, 255, 26),
(254, 13, 13, 19, 256, 27),
(255, 13, 13, 19, 257, 28),
(256, 13, 13, 19, 258, 29),
(257, 13, 13, 19, 259, 30),
(258, 13, 13, 19, 260, 31),
(259, 13, 13, 19, 261, 32),
(260, 13, 13, 19, 262, 33),
(261, 13, 13, 19, 263, 34),
(262, 13, 13, 19, 264, 35),
(263, 13, 13, 19, 265, 36),
(264, 13, 13, 19, 266, 37),
(265, 13, 13, 19, 267, 38),
(266, 13, 13, 19, 268, 39),
(267, 13, 13, 19, 269, 40),
(268, 13, 13, 19, 270, 41),
(269, 13, 13, 19, 271, 42),
(270, 13, 13, 19, 272, 43),
(271, 14, 14, 20, 273, 1),
(272, 14, 14, 20, 274, 2),
(273, 14, 14, 20, 275, 3),
(274, 14, 14, 20, 276, 4),
(275, 14, 14, 20, 277, 5),
(276, 14, 14, 20, 278, 6),
(277, 14, 14, 20, 279, 7),
(278, 14, 14, 20, 280, 8),
(279, 14, 14, 20, 281, 9),
(280, 14, 14, 20, 282, 10),
(281, 14, 14, 20, 283, 11),
(282, 14, 14, 20, 284, 12),
(283, 14, 14, 20, 285, 13),
(284, 14, 14, 20, 286, 14),
(285, 14, 14, 20, 287, 15),
(286, 14, 14, 20, 288, 16),
(287, 14, 14, 20, 289, 17),
(288, 14, 14, 20, 290, 18),
(289, 14, 14, 20, 291, 19),
(290, 14, 14, 20, 292, 20),
(291, 14, 14, 20, 293, 21),
(292, 14, 14, 20, 294, 22),
(293, 14, 14, 20, 295, 23),
(294, 14, 14, 20, 296, 24),
(295, 14, 14, 20, 297, 25),
(296, 14, 14, 20, 298, 26),
(297, 14, 14, 20, 299, 27),
(298, 14, 14, 20, 300, 28),
(299, 14, 14, 20, 301, 29),
(300, 14, 14, 20, 302, 30),
(301, 14, 14, 20, 303, 31),
(302, 14, 14, 20, 304, 32),
(303, 14, 14, 20, 305, 33),
(304, 14, 14, 20, 306, 34),
(305, 14, 14, 20, 307, 35),
(306, 14, 14, 20, 308, 36),
(307, 14, 14, 20, 309, 37),
(308, 14, 14, 20, 310, 38),
(309, 14, 14, 20, 311, 39),
(310, 14, 14, 20, 312, 40),
(311, 14, 14, 20, 313, 41),
(312, 14, 14, 20, 314, 42),
(313, 14, 14, 20, 315, 43),
(314, 14, 14, 20, 316, 44),
(315, 14, 14, 20, 317, 45),
(316, 14, 14, 20, 318, 46),
(317, 14, 14, 20, 319, 47),
(318, 14, 14, 20, 320, 48),
(319, 15, 15, 21, 321, 1),
(320, 15, 15, 21, 322, 2),
(321, 15, 15, 21, 323, 3),
(322, 15, 15, 21, 324, 4),
(323, 16, 16, 22, 325, 1),
(324, 16, 16, 22, 326, 2),
(325, 16, 16, 22, 327, 3),
(326, 16, 16, 22, 328, 4),
(327, 16, 16, 22, 329, 5),
(328, 16, 16, 22, 330, 6),
(329, 16, 16, 22, 331, 7),
(330, 16, 16, 22, 332, 8),
(331, 16, 16, 22, 333, 9),
(332, 16, 16, 22, 334, 10),
(333, 16, 16, 22, 335, 11),
(334, 16, 16, 22, 336, 12),
(335, 16, 16, 22, 337, 13),
(336, 16, 16, 22, 338, 14),
(337, 16, 16, 22, 339, 15),
(338, 16, 16, 22, 340, 16),
(339, 16, 16, 22, 341, 17),
(340, 16, 16, 22, 342, 18),
(341, 16, 16, 22, 343, 19),
(342, 16, 16, 22, 344, 20),
(343, 16, 16, 22, 345, 21),
(344, 16, 16, 22, 346, 22),
(345, 16, 16, 22, 347, 23),
(346, 16, 16, 22, 348, 24),
(347, 16, 16, 22, 349, 25),
(348, 16, 16, 22, 350, 26),
(349, 16, 16, 22, 351, 27),
(350, 16, 16, 22, 352, 28),
(351, 16, 16, 22, 353, 29),
(352, 17, 17, 23, 354, 1),
(353, 17, 17, 23, 355, 2),
(354, 17, 17, 23, 356, 3),
(355, 17, 17, 23, 357, 4),
(356, 17, 17, 23, 358, 5),
(357, 17, 17, 23, 359, 6),
(358, 17, 17, 23, 360, 7),
(359, 17, 17, 23, 361, 8),
(360, 17, 17, 23, 362, 9),
(361, 17, 17, 23, 363, 10),
(362, 17, 17, 23, 364, 11),
(363, 17, 17, 23, 365, 12),
(364, 17, 17, 23, 366, 13),
(365, 17, 17, 23, 367, 14),
(366, 17, 17, 23, 368, 15),
(367, 17, 17, 23, 369, 16),
(368, 17, 17, 23, 370, 17),
(369, 18, 18, 24, 371, 1),
(370, 18, 18, 24, 372, 2),
(371, 18, 18, 24, 373, 3),
(372, 19, 19, 25, 374, 1),
(373, 19, 19, 25, 375, 2),
(374, 19, 19, 25, 376, 3),
(375, 19, 19, 25, 377, 4),
(376, 19, 19, 25, 378, 5),
(377, 19, 19, 25, 379, 6),
(378, 19, 19, 25, 380, 7),
(379, 19, 19, 25, 381, 8),
(380, 19, 19, 25, 382, 9),
(381, 19, 19, 25, 383, 10),
(382, 20, 20, 26, 384, 1),
(383, 20, 20, 26, 385, 2),
(384, 20, 20, 26, 386, 3),
(385, 20, 20, 26, 387, 4),
(386, 20, 20, 26, 388, 5),
(387, 20, 20, 26, 389, 6),
(388, 20, 20, 26, 390, 7),
(389, 20, 20, 26, 391, 8),
(390, 20, 20, 26, 392, 9),
(391, 20, 20, 26, 393, 10),
(392, 20, 20, 26, 394, 11),
(393, 21, 21, 27, 395, 1),
(394, 21, 21, 27, 396, 2),
(395, 21, 21, 27, 397, 3),
(396, 22, 22, 28, 398, 1),
(397, 22, 22, 28, 399, 2),
(398, 22, 22, 28, 400, 3),
(399, 22, 22, 28, 401, 4),
(400, 22, 22, 28, 402, 5),
(401, 22, 22, 28, 403, 6),
(402, 22, 22, 28, 404, 7),
(403, 22, 22, 28, 405, 8),
(404, 23, 23, 29, 406, 1),
(405, 23, 23, 29, 407, 2),
(406, 23, 23, 29, 408, 3),
(407, 23, 23, 29, 409, 4),
(408, 23, 23, 29, 410, 5),
(409, 23, 23, 29, 411, 6),
(410, 23, 23, 29, 412, 7),
(411, 23, 23, 29, 413, 8),
(412, 23, 23, 29, 414, 9),
(413, 23, 23, 29, 415, 10),
(414, 23, 23, 29, 416, 11),
(415, 23, 23, 29, 417, 12),
(416, 23, 23, 29, 418, 13),
(417, 23, 23, 29, 419, 14),
(418, 23, 23, 29, 420, 15),
(419, 23, 23, 29, 421, 16),
(420, 23, 23, 29, 422, 17),
(421, 23, 23, 29, 423, 18),
(422, 23, 23, 29, 424, 19),
(423, 23, 23, 29, 425, 20),
(424, 23, 23, 29, 426, 21),
(425, 23, 23, 29, 427, 22),
(426, 23, 23, 29, 428, 23),
(427, 23, 23, 29, 429, 24),
(428, 23, 23, 29, 430, 25),
(429, 23, 23, 29, 431, 26),
(430, 23, 23, 29, 432, 27),
(431, 23, 23, 29, 433, 28),
(432, 23, 23, 29, 434, 29),
(433, 23, 23, 29, 435, 30),
(434, 23, 23, 29, 436, 31),
(435, 23, 23, 29, 437, 32),
(436, 23, 23, 29, 438, 33),
(437, 23, 23, 29, 439, 34),
(438, 24, 24, 30, 440, 1),
(439, 24, 24, 30, 441, 2),
(440, 24, 24, 30, 442, 3),
(441, 24, 24, 30, 443, 4),
(442, 24, 24, 30, 444, 5),
(443, 24, 24, 30, 445, 6),
(444, 24, 24, 30, 446, 7),
(445, 24, 24, 30, 447, 8),
(446, 24, 24, 30, 448, 9),
(447, 24, 24, 30, 449, 10),
(448, 24, 24, 30, 450, 11),
(449, 24, 24, 30, 451, 12),
(450, 24, 24, 30, 452, 13),
(451, 24, 24, 30, 453, 14),
(452, 24, 24, 30, 454, 15),
(453, 24, 24, 30, 455, 16),
(454, 24, 24, 30, 456, 17),
(455, 25, 25, 31, 457, 1),
(456, 25, 25, 31, 458, 2),
(457, 25, 25, 31, 459, 3),
(458, 13, 13, 19, 460, 44),
(459, 11, 11, 17, 461, 107),
(460, 11, 11, 17, 462, 108),
(461, 11, 11, 17, 463, 109),
(462, 11, 11, 17, 464, 110),
(463, 11, 11, 17, 465, 111),
(464, 11, 11, 17, 466, 112),
(465, 11, 11, 17, 467, 113),
(466, 11, 11, 17, 468, 114),
(467, 11, 11, 17, 469, 115),
(468, 11, 11, 17, 470, 116),
(469, 14, 14, 20, 471, 49),
(470, 11, 11, 17, 472, 117),
(471, 11, 11, 17, 473, 118),
(472, 11, 11, 17, 474, 119),
(473, 11, 11, 17, 475, 120),
(474, 14, 14, 20, 476, 50),
(475, 4, 4, 5, 477, 21),
(476, 16, 16, 22, 478, 30),
(477, 16, 16, 22, 479, 31),
(478, 23, 23, 29, 480, 35),
(479, 23, 23, 29, 481, 36),
(480, 11, 11, 17, 482, 121),
(481, 11, 11, 17, 483, 122),
(482, 17, 17, 23, 484, 18),
(483, 17, 17, 23, 485, 19),
(484, 17, 17, 23, 486, 20),
(485, 17, 17, 23, 487, 21),
(486, 16, 16, 22, 488, 32),
(487, 16, 16, 22, 489, 33),
(488, 24, 24, 30, 490, 18),
(489, 24, 24, 30, 491, 19),
(490, 24, 24, 30, 492, 20),
(491, 24, 24, 30, 493, 21),
(492, 23, 23, 29, 494, 37),
(493, 23, 23, 29, 495, 38),
(494, 11, 11, 17, 496, 123),
(495, 4, 4, 4, 497, 21),
(496, 4, 4, 4, 498, 22),
(497, 4, 4, 4, 499, 23),
(498, 4, 4, 4, 500, 24),
(499, 4, 4, 5, 501, 22),
(500, 4, 4, 4, 502, 25),
(501, 4, 4, 4, 503, 26),
(502, 4, 4, 4, 504, 27),
(503, 4, 4, 4, 505, 28),
(504, 4, 4, 4, 506, 29),
(505, 24, 24, 30, 507, 22),
(506, 24, 24, 30, 508, 23),
(507, 24, 24, 30, 509, 24),
(508, 24, 24, 30, 510, 25),
(509, 17, 17, 23, 511, 22),
(510, 17, 17, 23, 512, 23),
(511, 17, 17, 23, 513, 24),
(512, 17, 17, 23, 514, 25),
(513, 17, 17, 23, 515, 26),
(514, 24, 24, 30, 516, 26),
(515, 24, 24, 30, 517, 27),
(516, 24, 24, 30, 518, 28),
(517, 24, 24, 30, 519, 29),
(518, 24, 24, 30, 520, 30),
(519, 17, 17, 23, 521, 27),
(520, 17, 17, 23, 522, 28),
(521, 17, 17, 23, 523, 29),
(522, 17, 17, 23, 524, 30);

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_datetime`
--

CREATE TABLE IF NOT EXISTS `eav_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`value_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_DATETIME_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Datetime values of attributes' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `eav_entity_datetime`
--


-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_decimal`
--

CREATE TABLE IF NOT EXISTS `eav_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`value_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Decimal values of attributes' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `eav_entity_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_int`
--

CREATE TABLE IF NOT EXISTS `eav_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`),
  KEY `FK_ATTRIBUTE_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_INT_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_INT_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Integer values of attributes' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `eav_entity_int`
--


-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_store`
--

CREATE TABLE IF NOT EXISTS `eav_entity_store` (
  `entity_store_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `increment_prefix` varchar(20) NOT NULL DEFAULT '',
  `increment_last_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`entity_store_id`),
  KEY `FK_eav_entity_store_entity_type` (`entity_type_id`),
  KEY `FK_eav_entity_store_store` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `eav_entity_store`
--


-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_text`
--

CREATE TABLE IF NOT EXISTS `eav_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  KEY `FK_ATTRIBUTE_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_TEXT_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_TEXT_ENTITY` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Text values of attributes' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `eav_entity_text`
--


-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_type`
--

CREATE TABLE IF NOT EXISTS `eav_entity_type` (
  `entity_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_code` varchar(50) NOT NULL DEFAULT '',
  `entity_model` varchar(255) NOT NULL,
  `attribute_model` varchar(255) NOT NULL,
  `entity_table` varchar(255) NOT NULL DEFAULT '',
  `value_table_prefix` varchar(255) NOT NULL DEFAULT '',
  `entity_id_field` varchar(255) NOT NULL DEFAULT '',
  `is_data_sharing` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `data_sharing_key` varchar(100) DEFAULT 'default',
  `default_attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `increment_model` varchar(255) NOT NULL DEFAULT '',
  `increment_per_store` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `increment_pad_length` tinyint(8) unsigned NOT NULL DEFAULT '8',
  `increment_pad_char` char(1) NOT NULL DEFAULT '0',
  `additional_attribute_table` varchar(255) NOT NULL DEFAULT '',
  `entity_attribute_collection` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`entity_type_id`),
  KEY `entity_name` (`entity_type_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `eav_entity_type`
--

INSERT INTO `eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_model`, `attribute_model`, `entity_table`, `value_table_prefix`, `entity_id_field`, `is_data_sharing`, `data_sharing_key`, `default_attribute_set_id`, `increment_model`, `increment_per_store`, `increment_pad_length`, `increment_pad_char`, `additional_attribute_table`, `entity_attribute_collection`) VALUES
(1, 'customer', 'customer/customer', '', 'customer/entity', '', '', 1, 'default', 1, 'eav/entity_increment_numeric', 0, 8, '0', 'customer/eav_attribute', 'customer/eav_attribute'),
(2, 'customer_address', 'customer/customer_address', '', 'customer/address_entity', '', '', 1, 'default', 2, '', 0, 8, '0', 'customer/eav_attribute', 'customer/eav_attribute'),
(3, 'catalog_category', 'catalog/category', 'catalog/resource_eav_attribute', 'catalog/category', '', '', 1, 'default', 3, '', 0, 8, '0', 'catalog/eav_attribute', 'catalog/category_attribute_collection'),
(4, 'catalog_product', 'catalog/product', 'catalog/resource_eav_attribute', 'catalog/product', '', '', 1, 'default', 4, '', 0, 8, '0', 'catalog/eav_attribute', 'catalog/product_attribute_collection'),
(5, 'quote', 'sales/quote', '', 'sales/quote', '', '', 1, 'default', 5, '', 0, 8, '0', '', ''),
(6, 'quote_item', 'sales/quote_item', '', 'sales/quote_item', '', '', 1, 'default', 6, '', 0, 8, '0', '', ''),
(7, 'quote_address', 'sales/quote_address', '', 'sales/quote_address', '', '', 1, 'default', 7, '', 0, 8, '0', '', ''),
(8, 'quote_address_item', 'sales/quote_address_item', '', 'sales/quote_entity', '', '', 1, 'default', 8, '', 0, 8, '0', '', ''),
(9, 'quote_address_rate', 'sales/quote_address_rate', '', 'sales/quote_entity', '', '', 1, 'default', 9, '', 0, 8, '0', '', ''),
(10, 'quote_payment', 'sales/quote_payment', '', 'sales/quote_entity', '', '', 1, 'default', 10, '', 0, 8, '0', '', ''),
(11, 'order', 'sales/order', '', 'sales/order', '', '', 1, 'default', 11, 'eav/entity_increment_numeric', 1, 8, '0', '', ''),
(12, 'order_address', 'sales/order_address', '', 'sales/order_entity', '', '', 1, 'default', 12, '', 0, 8, '0', '', ''),
(13, 'order_item', 'sales/order_item', '', 'sales/order_entity', '', '', 1, 'default', 13, '', 0, 8, '0', '', ''),
(14, 'order_payment', 'sales/order_payment', '', 'sales/order_entity', '', '', 1, 'default', 14, '', 0, 8, '0', '', ''),
(15, 'order_status_history', 'sales/order_status_history', '', 'sales/order_entity', '', '', 1, 'default', 15, '', 0, 8, '0', '', ''),
(16, 'invoice', 'sales/order_invoice', '', 'sales/order_entity', '', '', 1, 'default', 16, 'eav/entity_increment_numeric', 1, 8, '0', '', ''),
(17, 'invoice_item', 'sales/order_invoice_item', '', 'sales/order_entity', '', '', 1, 'default', 17, '', 0, 8, '0', '', ''),
(18, 'invoice_comment', 'sales/order_invoice_comment', '', 'sales/order_entity', '', '', 1, 'default', 18, '', 0, 8, '0', '', ''),
(19, 'shipment', 'sales/order_shipment', '', 'sales/order_entity', '', '', 1, 'default', 19, 'eav/entity_increment_numeric', 1, 8, '0', '', ''),
(20, 'shipment_item', 'sales/order_shipment_item', '', 'sales/order_entity', '', '', 1, 'default', 20, '', 0, 8, '0', '', ''),
(21, 'shipment_comment', 'sales/order_shipment_comment', '', 'sales/order_entity', '', '', 1, 'default', 21, '', 0, 8, '0', '', ''),
(22, 'shipment_track', 'sales/order_shipment_track', '', 'sales/order_entity', '', '', 1, 'default', 22, '', 0, 8, '0', '', ''),
(23, 'creditmemo', 'sales/order_creditmemo', '', 'sales/order_entity', '', '', 1, 'default', 23, 'eav/entity_increment_numeric', 1, 8, '0', '', ''),
(24, 'creditmemo_item', 'sales/order_creditmemo_item', '', 'sales/order_entity', '', '', 1, 'default', 24, '', 0, 8, '0', '', ''),
(25, 'creditmemo_comment', 'sales/order_creditmemo_comment', '', 'sales/order_entity', '', '', 1, 'default', 25, '', 0, 8, '0', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_varchar`
--

CREATE TABLE IF NOT EXISTS `eav_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Varchar values of attributes' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `eav_entity_varchar`
--


-- --------------------------------------------------------

--
-- Table structure for table `eav_form_element`
--

CREATE TABLE IF NOT EXISTS `eav_form_element` (
  `element_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` smallint(5) unsigned NOT NULL,
  `fieldset_id` smallint(5) unsigned DEFAULT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`element_id`),
  UNIQUE KEY `UNQ_FORM_ATTRIBUTE` (`type_id`,`attribute_id`),
  KEY `IDX_FORM_TYPE` (`type_id`),
  KEY `IDX_FORM_FIELDSET` (`fieldset_id`),
  KEY `IDX_FORM_ATTRIBUTE` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=69 ;

--
-- Dumping data for table `eav_form_element`
--

INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES
(1, 1, 1, 5, 0),
(2, 1, 1, 7, 1),
(3, 1, 1, 9, 2),
(4, 2, 2, 5, 0),
(5, 2, 2, 7, 1),
(6, 2, 2, 9, 2),
(7, 3, 3, 19, 0),
(8, 3, 3, 21, 1),
(9, 3, 3, 23, 2),
(10, 3, 3, 30, 3),
(11, 3, 3, 31, 4),
(12, 3, 4, 24, 0),
(13, 3, 4, 25, 1),
(14, 3, 4, 27, 2),
(15, 3, 4, 29, 3),
(16, 3, 4, 26, 4),
(17, 4, NULL, 19, 0),
(18, 4, NULL, 21, 1),
(19, 4, NULL, 23, 2),
(20, 4, NULL, 9, 3),
(21, 4, NULL, 24, 4),
(22, 4, NULL, 25, 5),
(23, 4, NULL, 27, 6),
(24, 4, NULL, 29, 7),
(25, 4, NULL, 26, 8),
(26, 4, NULL, 30, 9),
(27, 4, NULL, 31, 10),
(28, 5, NULL, 19, 0),
(29, 5, NULL, 21, 1),
(30, 5, NULL, 23, 2),
(31, 5, NULL, 9, 3),
(32, 5, NULL, 24, 4),
(33, 5, NULL, 25, 5),
(34, 5, NULL, 27, 6),
(35, 5, NULL, 29, 7),
(36, 5, NULL, 26, 8),
(37, 5, NULL, 30, 9),
(38, 5, NULL, 31, 10),
(39, 6, NULL, 19, 0),
(40, 6, NULL, 21, 1),
(41, 6, NULL, 23, 2),
(42, 6, NULL, 24, 3),
(43, 6, NULL, 25, 4),
(44, 6, NULL, 27, 5),
(45, 6, NULL, 29, 6),
(46, 6, NULL, 26, 7),
(47, 6, NULL, 30, 8),
(48, 6, NULL, 31, 9),
(49, 7, NULL, 19, 0),
(50, 7, NULL, 21, 1),
(51, 7, NULL, 23, 2),
(52, 7, NULL, 24, 3),
(53, 7, NULL, 25, 4),
(54, 7, NULL, 27, 5),
(55, 7, NULL, 29, 6),
(56, 7, NULL, 26, 7),
(57, 7, NULL, 30, 8),
(58, 7, NULL, 31, 9),
(59, 8, 5, 5, 0),
(60, 8, 5, 7, 1),
(61, 8, 5, 9, 2),
(62, 8, 6, 23, 0),
(63, 8, 6, 30, 1),
(64, 8, 6, 24, 2),
(65, 8, 6, 25, 3),
(66, 8, 6, 27, 4),
(67, 8, 6, 29, 5),
(68, 8, 6, 26, 6);

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_fieldset`
--

CREATE TABLE IF NOT EXISTS `eav_form_fieldset` (
  `fieldset_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` smallint(5) unsigned NOT NULL,
  `code` char(64) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `UNQ_FORM_FIELDSET_CODE` (`type_id`,`code`),
  KEY `IDX_FORM_TYPE` (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `eav_form_fieldset`
--

INSERT INTO `eav_form_fieldset` (`fieldset_id`, `type_id`, `code`, `sort_order`) VALUES
(1, 1, 'general', 1),
(2, 2, 'general', 1),
(3, 3, 'contact', 1),
(4, 3, 'address', 2),
(5, 8, 'general', 1),
(6, 8, 'address', 2);

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_fieldset_label`
--

CREATE TABLE IF NOT EXISTS `eav_form_fieldset_label` (
  `fieldset_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`fieldset_id`,`store_id`),
  KEY `IDX_FORM_FIELDSET` (`fieldset_id`),
  KEY `IDX_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `eav_form_fieldset_label`
--

INSERT INTO `eav_form_fieldset_label` (`fieldset_id`, `store_id`, `label`) VALUES
(1, 0, 'Personal Information'),
(2, 0, 'Account Information'),
(3, 0, 'Contact Information'),
(4, 0, 'Address'),
(5, 0, 'Personal Information'),
(6, 0, 'Address Information');

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_type`
--

CREATE TABLE IF NOT EXISTS `eav_form_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(64) NOT NULL,
  `label` varchar(255) NOT NULL,
  `is_system` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `theme` varchar(64) NOT NULL DEFAULT '',
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `UNQ_FORM_TYPE_CODE` (`code`,`theme`,`store_id`),
  KEY `IDX_STORE` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `eav_form_type`
--

INSERT INTO `eav_form_type` (`type_id`, `code`, `label`, `is_system`, `theme`, `store_id`) VALUES
(1, 'customer_account_create', 'customer_account_create', 1, '', 0),
(2, 'customer_account_edit', 'customer_account_edit', 1, '', 0),
(3, 'customer_address_edit', 'customer_address_edit', 1, '', 0),
(4, 'checkout_onepage_register', 'checkout_onepage_register', 1, '', 0),
(5, 'checkout_onepage_register_guest', 'checkout_onepage_register_guest', 1, '', 0),
(6, 'checkout_onepage_billing_address', 'checkout_onepage_billing_address', 1, '', 0),
(7, 'checkout_onepage_shipping_address', 'checkout_onepage_shipping_address', 1, '', 0),
(8, 'checkout_multishipping_register', 'checkout_multishipping_register', 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_type_entity`
--

CREATE TABLE IF NOT EXISTS `eav_form_type_entity` (
  `type_id` smallint(5) unsigned NOT NULL,
  `entity_type_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`type_id`,`entity_type_id`),
  KEY `IDX_EAV_ENTITY_TYPE` (`entity_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `eav_form_type_entity`
--

INSERT INTO `eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES
(1, 1),
(2, 1),
(4, 1),
(5, 1),
(8, 1),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `gift_message`
--

CREATE TABLE IF NOT EXISTS `gift_message` (
  `gift_message_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(7) unsigned NOT NULL DEFAULT '0',
  `sender` varchar(255) NOT NULL DEFAULT '',
  `recipient` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gift_message`
--


-- --------------------------------------------------------

--
-- Table structure for table `googlebase_attributes`
--

CREATE TABLE IF NOT EXISTS `googlebase_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `gbase_attribute` varchar(255) NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `GOOGLEBASE_ATTRIBUTES_ATTRIBUTE_ID` (`attribute_id`),
  KEY `GOOGLEBASE_ATTRIBUTES_TYPE_ID` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Base Attributes link Product Attributes' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `googlebase_attributes`
--


-- --------------------------------------------------------

--
-- Table structure for table `googlebase_items`
--

CREATE TABLE IF NOT EXISTS `googlebase_items` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `gbase_item_id` varchar(255) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `published` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `impr` smallint(5) unsigned NOT NULL DEFAULT '0',
  `clicks` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_hidden` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `GOOGLEBASE_ITEMS_PRODUCT_ID` (`product_id`),
  KEY `GOOGLEBASE_ITEMS_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Base Items Products' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `googlebase_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `googlebase_types`
--

CREATE TABLE IF NOT EXISTS `googlebase_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` smallint(5) unsigned NOT NULL,
  `gbase_itemtype` varchar(255) NOT NULL,
  `target_country` varchar(2) NOT NULL DEFAULT 'US',
  PRIMARY KEY (`type_id`),
  KEY `GOOGLEBASE_TYPES_ATTRIBUTE_SET_ID` (`attribute_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Base Item Types link Attribute Sets' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `googlebase_types`
--


-- --------------------------------------------------------

--
-- Table structure for table `googlecheckout_api_debug`
--

CREATE TABLE IF NOT EXISTS `googlecheckout_api_debug` (
  `debug_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dir` enum('in','out') DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY (`debug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `googlecheckout_api_debug`
--


-- --------------------------------------------------------

--
-- Table structure for table `googleoptimizer_code`
--

CREATE TABLE IF NOT EXISTS `googleoptimizer_code` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_type` varchar(50) NOT NULL DEFAULT '',
  `store_id` smallint(5) unsigned NOT NULL,
  `control_script` text,
  `tracking_script` text,
  `conversion_script` text,
  `conversion_page` varchar(255) NOT NULL DEFAULT '',
  `additional_data` text,
  PRIMARY KEY (`code_id`),
  KEY `GOOGLEOPTIMIZER_CODE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `googleoptimizer_code`
--


-- --------------------------------------------------------

--
-- Table structure for table `index_event`
--

CREATE TABLE IF NOT EXISTS `index_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(64) NOT NULL,
  `entity` varchar(64) NOT NULL,
  `entity_pk` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `old_data` mediumtext,
  `new_data` mediumtext,
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `IDX_UNIQUE_EVENT` (`type`,`entity`,`entity_pk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `index_event`
--

INSERT INTO `index_event` (`event_id`, `type`, `entity`, `entity_pk`, `created_at`, `old_data`, `new_data`) VALUES
(1, 'save', 'catalog_category', 1, '2010-11-25 14:27:15', 'a:2:{s:30:"Mage_Catalog_Model_Indexer_Url";N;s:43:"Mage_Catalog_Model_Category_Indexer_Product";N;}', 'a:7:{s:35:"cataloginventory_stock_match_result";b:0;s:34:"catalog_product_price_match_result";b:0;s:24:"catalog_url_match_result";b:1;s:30:"Mage_Catalog_Model_Indexer_Url";N;s:37:"catalog_category_product_match_result";b:1;s:43:"Mage_Catalog_Model_Category_Indexer_Product";N;s:35:"catalogsearch_fulltext_match_result";b:0;}'),
(2, 'save', 'catalog_category', 2, '2010-11-25 14:27:15', 'a:2:{s:30:"Mage_Catalog_Model_Indexer_Url";N;s:43:"Mage_Catalog_Model_Category_Indexer_Product";N;}', 'a:7:{s:35:"cataloginventory_stock_match_result";b:0;s:34:"catalog_product_price_match_result";b:0;s:24:"catalog_url_match_result";b:1;s:30:"Mage_Catalog_Model_Indexer_Url";N;s:37:"catalog_category_product_match_result";b:1;s:43:"Mage_Catalog_Model_Category_Indexer_Product";N;s:35:"catalogsearch_fulltext_match_result";b:0;}');

-- --------------------------------------------------------

--
-- Table structure for table `index_process`
--

CREATE TABLE IF NOT EXISTS `index_process` (
  `process_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `indexer_code` varchar(32) NOT NULL,
  `status` enum('pending','working','require_reindex') NOT NULL DEFAULT 'pending',
  `started_at` datetime DEFAULT NULL,
  `ended_at` datetime DEFAULT NULL,
  `mode` enum('real_time','manual') NOT NULL DEFAULT 'real_time',
  PRIMARY KEY (`process_id`),
  UNIQUE KEY `IDX_CODE` (`indexer_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `index_process`
--

INSERT INTO `index_process` (`process_id`, `indexer_code`, `status`, `started_at`, `ended_at`, `mode`) VALUES
(1, 'catalog_product_attribute', 'require_reindex', NULL, NULL, 'real_time'),
(2, 'catalog_product_price', 'require_reindex', NULL, NULL, 'real_time'),
(3, 'catalog_url', 'require_reindex', NULL, NULL, 'real_time'),
(4, 'catalog_product_flat', 'require_reindex', NULL, NULL, 'real_time'),
(5, 'catalog_category_flat', 'require_reindex', NULL, NULL, 'real_time'),
(6, 'catalog_category_product', 'require_reindex', NULL, NULL, 'real_time'),
(7, 'catalogsearch_fulltext', 'require_reindex', NULL, NULL, 'real_time'),
(8, 'cataloginventory_stock', 'require_reindex', NULL, NULL, 'real_time');

-- --------------------------------------------------------

--
-- Table structure for table `index_process_event`
--

CREATE TABLE IF NOT EXISTS `index_process_event` (
  `process_id` int(10) unsigned NOT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `status` enum('new','working','done','error') NOT NULL DEFAULT 'new',
  PRIMARY KEY (`process_id`,`event_id`),
  KEY `FK_INDEX_EVNT_PROCESS` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `index_process_event`
--

INSERT INTO `index_process_event` (`process_id`, `event_id`, `status`) VALUES
(3, 1, 'done'),
(3, 2, 'done'),
(6, 1, 'done'),
(6, 2, 'done');

-- --------------------------------------------------------

--
-- Table structure for table `log_customer`
--

CREATE TABLE IF NOT EXISTS `log_customer` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` bigint(20) unsigned DEFAULT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `login_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `logout_at` datetime DEFAULT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `IDX_VISITOR` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customers log information' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `log_customer`
--


-- --------------------------------------------------------

--
-- Table structure for table `log_quote`
--

CREATE TABLE IF NOT EXISTS `log_quote` (
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0',
  `visitor_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quote log data';

--
-- Dumping data for table `log_quote`
--


-- --------------------------------------------------------

--
-- Table structure for table `log_summary`
--

CREATE TABLE IF NOT EXISTS `log_summary` (
  `summary_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned NOT NULL,
  `type_id` smallint(5) unsigned DEFAULT NULL,
  `visitor_count` int(11) NOT NULL DEFAULT '0',
  `customer_count` int(11) NOT NULL DEFAULT '0',
  `add_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`summary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Summary log information' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `log_summary`
--


-- --------------------------------------------------------

--
-- Table structure for table `log_summary_type`
--

CREATE TABLE IF NOT EXISTS `log_summary_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type_code` varchar(64) NOT NULL DEFAULT '',
  `period` smallint(5) unsigned NOT NULL DEFAULT '0',
  `period_type` enum('MINUTE','HOUR','DAY','WEEK','MONTH') NOT NULL DEFAULT 'MINUTE',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Type of summary information' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `log_summary_type`
--

INSERT INTO `log_summary_type` (`type_id`, `type_code`, `period`, `period_type`) VALUES
(1, 'hour', 1, 'HOUR'),
(2, 'day', 1, 'DAY');

-- --------------------------------------------------------

--
-- Table structure for table `log_url`
--

CREATE TABLE IF NOT EXISTS `log_url` (
  `url_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `visitor_id` bigint(20) unsigned DEFAULT NULL,
  `visit_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`url_id`),
  KEY `IDX_VISITOR` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='URL visiting history';

--
-- Dumping data for table `log_url`
--

INSERT INTO `log_url` (`url_id`, `visitor_id`, `visit_time`) VALUES
(1, 1, '2010-11-25 14:30:31'),
(2, 1, '2010-11-25 14:44:59'),
(3, 1, '2010-11-25 15:07:33'),
(4, 1, '2010-11-25 15:09:20'),
(5, 1, '2010-11-25 15:11:44'),
(6, 1, '2010-11-25 15:12:41'),
(7, 1, '2010-11-25 15:13:03'),
(8, 1, '2010-11-25 15:15:04'),
(9, 1, '2010-11-25 15:15:12'),
(10, 1, '2010-11-25 15:16:17'),
(11, 1, '2010-11-25 15:16:34'),
(12, 1, '2010-11-25 15:19:04'),
(13, 2, '2010-11-25 16:30:02'),
(14, 2, '2010-11-25 16:30:31'),
(15, 2, '2010-11-25 16:30:59'),
(16, 2, '2010-11-25 16:32:29'),
(17, 2, '2010-11-25 16:35:10'),
(18, 2, '2010-11-25 16:36:32'),
(19, 2, '2010-11-25 16:45:14'),
(20, 2, '2010-11-25 16:45:51'),
(21, 2, '2010-11-25 16:46:10'),
(22, 2, '2010-11-25 16:46:35'),
(23, 2, '2010-11-25 16:47:24'),
(24, 2, '2010-11-25 16:47:58'),
(25, 2, '2010-11-25 16:48:08'),
(26, 2, '2010-11-25 16:48:19'),
(27, 2, '2010-11-25 16:49:02'),
(28, 2, '2010-11-25 16:49:36'),
(29, 2, '2010-11-25 16:51:38'),
(30, 2, '2010-11-25 16:55:04'),
(31, 2, '2010-11-25 17:08:10'),
(32, 2, '2010-11-25 17:09:03'),
(33, 2, '2010-11-25 17:09:12'),
(34, 2, '2010-11-25 17:10:28'),
(35, 2, '2010-11-25 17:11:06'),
(36, 2, '2010-11-25 17:12:17'),
(37, 2, '2010-11-25 17:21:33'),
(38, 2, '2010-11-25 17:23:25'),
(39, 2, '2010-11-25 17:29:44'),
(40, 2, '2010-11-25 17:30:40'),
(41, 2, '2010-11-25 17:31:20'),
(42, 3, '2010-11-26 14:15:15'),
(43, 3, '2010-11-26 14:22:13'),
(44, 3, '2010-11-26 14:22:36'),
(45, 3, '2010-11-26 14:25:56'),
(46, 3, '2010-11-26 14:33:05'),
(47, 3, '2010-11-26 14:38:49'),
(48, 3, '2010-11-26 14:40:45'),
(49, 3, '2010-11-26 14:41:32'),
(50, 3, '2010-11-26 14:42:00'),
(51, 3, '2010-11-26 14:43:56'),
(52, 3, '2010-11-26 14:44:38'),
(53, 3, '2010-11-26 14:49:52'),
(54, 3, '2010-11-26 15:02:27'),
(55, 3, '2010-11-26 15:03:14'),
(56, 3, '2010-11-26 15:03:44'),
(57, 3, '2010-11-26 15:04:30'),
(58, 4, '2010-11-26 15:05:03'),
(59, 3, '2010-11-26 15:09:17'),
(60, 3, '2010-11-26 15:12:19'),
(61, 3, '2010-11-26 15:12:37'),
(62, 3, '2010-11-26 15:19:00'),
(63, 3, '2010-11-26 15:19:49'),
(64, 3, '2010-11-26 15:20:43'),
(65, 3, '2010-11-26 15:27:54'),
(66, 3, '2010-11-26 15:28:11'),
(67, 3, '2010-11-26 15:37:27'),
(68, 3, '2010-11-26 15:37:34'),
(69, 3, '2010-11-26 15:38:47'),
(70, 3, '2010-11-26 15:39:17'),
(71, 3, '2010-11-26 15:41:13'),
(72, 3, '2010-11-26 15:46:22'),
(73, 3, '2010-11-26 15:46:38'),
(74, 3, '2010-11-26 15:46:42'),
(75, 3, '2010-11-26 15:47:14'),
(76, 3, '2010-11-26 15:47:51'),
(77, 3, '2010-11-26 15:53:31'),
(78, 3, '2010-11-26 15:53:36'),
(79, 3, '2010-11-26 15:53:42'),
(80, 3, '2010-11-26 15:54:51'),
(81, 3, '2010-11-26 15:57:35'),
(82, 3, '2010-11-26 15:58:49'),
(83, 3, '2010-11-26 15:59:17'),
(84, 3, '2010-11-26 16:00:06'),
(85, 3, '2010-11-26 16:00:13'),
(86, 3, '2010-11-26 16:00:31'),
(87, 3, '2010-11-26 16:00:34'),
(88, 3, '2010-11-26 16:00:37'),
(89, 3, '2010-11-26 16:00:51'),
(90, 3, '2010-11-26 16:00:53'),
(91, 3, '2010-11-26 16:00:55'),
(92, 3, '2010-11-26 16:00:59'),
(93, 3, '2010-11-26 16:01:02'),
(94, 3, '2010-11-26 16:01:05'),
(95, 3, '2010-11-26 16:01:08'),
(96, 3, '2010-11-26 16:01:12'),
(97, 3, '2010-11-26 16:01:20'),
(98, 3, '2010-11-26 16:01:22'),
(99, 3, '2010-11-26 16:01:25'),
(100, 3, '2010-11-26 16:01:40'),
(101, 3, '2010-11-26 16:01:43'),
(102, 3, '2010-11-26 16:01:48'),
(103, 3, '2010-11-26 16:01:57'),
(104, 3, '2010-11-26 16:02:03'),
(105, 3, '2010-11-26 16:02:17'),
(106, 3, '2010-11-26 16:02:23'),
(107, 3, '2010-11-26 16:02:34'),
(108, 3, '2010-11-26 16:02:47'),
(109, 3, '2010-11-26 16:02:52'),
(110, 3, '2010-11-26 16:02:58'),
(111, 3, '2010-11-26 16:03:13'),
(112, 3, '2010-11-26 16:03:17'),
(113, 3, '2010-11-26 16:03:24'),
(114, 5, '2010-11-26 16:06:56'),
(115, 5, '2010-11-26 16:07:02'),
(116, 5, '2010-11-26 16:07:10'),
(117, 5, '2010-11-26 16:07:19'),
(118, 5, '2010-11-26 16:11:06'),
(119, 3, '2010-11-26 16:16:07'),
(120, 3, '2010-11-26 16:17:33'),
(121, 3, '2010-11-26 16:17:41'),
(122, 5, '2010-11-26 16:17:51'),
(123, 5, '2010-11-26 16:17:59'),
(124, 5, '2010-11-26 16:18:40'),
(125, 3, '2010-11-26 16:18:45'),
(126, 3, '2010-11-26 16:22:38'),
(127, 3, '2010-11-26 16:24:30'),
(128, 3, '2010-11-26 16:28:35'),
(129, 3, '2010-11-26 16:29:54'),
(130, 3, '2010-11-26 16:30:50'),
(131, 3, '2010-11-26 16:31:09'),
(132, 3, '2010-11-26 16:31:25'),
(133, 3, '2010-11-26 16:32:08'),
(134, 3, '2010-11-26 16:33:21'),
(135, 3, '2010-11-26 16:34:07'),
(136, 3, '2010-11-26 16:34:24'),
(137, 3, '2010-11-26 16:34:51'),
(138, 3, '2010-11-26 16:35:19'),
(139, 3, '2010-11-26 16:37:50'),
(140, 3, '2010-11-26 16:40:01'),
(141, 3, '2010-11-26 16:41:08'),
(142, 3, '2010-11-26 16:43:18'),
(143, 3, '2010-11-26 16:44:01'),
(144, 3, '2010-11-26 16:44:23'),
(145, 3, '2010-11-26 16:45:09'),
(146, 3, '2010-11-26 16:45:56'),
(147, 3, '2010-11-26 16:46:36'),
(148, 3, '2010-11-26 16:47:01'),
(149, 3, '2010-11-26 16:47:31'),
(150, 3, '2010-11-26 16:48:37'),
(151, 3, '2010-11-26 16:49:17'),
(152, 3, '2010-11-26 16:49:52'),
(153, 3, '2010-11-26 16:50:52'),
(154, 3, '2010-11-26 16:51:23'),
(155, 3, '2010-11-26 16:52:20'),
(156, 3, '2010-11-26 16:52:34'),
(157, 3, '2010-11-26 16:53:09'),
(158, 3, '2010-11-26 16:53:57'),
(159, 3, '2010-11-26 16:54:24'),
(160, 3, '2010-11-26 16:54:42'),
(161, 3, '2010-11-26 16:56:53'),
(162, 3, '2010-11-26 16:58:40'),
(163, 3, '2010-11-26 17:01:41'),
(164, 3, '2010-11-26 17:03:32'),
(165, 3, '2010-11-26 17:04:20'),
(166, 3, '2010-11-26 17:04:40'),
(167, 3, '2010-11-26 17:04:42'),
(168, 3, '2010-11-26 17:04:59'),
(169, 3, '2010-11-26 17:05:01'),
(170, 3, '2010-11-26 17:05:12'),
(171, 3, '2010-11-26 17:05:31'),
(172, 3, '2010-11-26 17:06:11'),
(173, 3, '2010-11-26 17:19:05'),
(174, 3, '2010-11-26 17:19:46'),
(175, 3, '2010-11-26 17:22:55'),
(176, 3, '2010-11-26 17:23:22'),
(177, 3, '2010-11-26 17:24:35'),
(178, 3, '2010-11-26 17:24:59'),
(179, 3, '2010-11-26 17:26:06'),
(180, 3, '2010-11-26 17:26:33'),
(181, 3, '2010-11-26 17:27:27'),
(182, 3, '2010-11-26 17:27:54'),
(183, 3, '2010-11-26 17:31:00'),
(184, 3, '2010-11-26 17:32:19'),
(185, 3, '2010-11-26 17:33:12'),
(186, 3, '2010-11-26 17:33:41'),
(187, 3, '2010-11-26 17:33:58'),
(188, 3, '2010-11-26 17:34:18'),
(189, 3, '2010-11-26 17:34:45'),
(190, 3, '2010-11-26 17:35:35'),
(191, 3, '2010-11-26 17:36:30'),
(192, 3, '2010-11-26 17:36:52'),
(193, 3, '2010-11-26 17:38:06'),
(194, 3, '2010-11-26 17:39:12'),
(195, 3, '2010-11-26 17:41:02'),
(196, 3, '2010-11-26 17:41:27'),
(197, 3, '2010-11-26 17:42:08'),
(198, 3, '2010-11-26 17:42:44'),
(199, 3, '2010-11-26 17:42:53'),
(200, 3, '2010-11-26 17:42:53'),
(201, 3, '2010-11-26 17:43:25'),
(202, 6, '2010-11-26 17:45:10'),
(203, 7, '2010-11-26 17:45:33'),
(204, 3, '2010-11-26 17:46:18'),
(205, 3, '2010-11-26 17:46:22'),
(206, 3, '2010-11-26 17:46:23'),
(207, 3, '2010-11-26 17:46:23'),
(208, 3, '2010-11-26 17:46:23'),
(209, 3, '2010-11-26 17:46:24'),
(210, 3, '2010-11-26 17:47:58'),
(211, 6, '2010-11-26 17:48:13'),
(212, 7, '2010-11-26 17:48:22'),
(213, 3, '2010-11-26 17:48:42'),
(214, 3, '2010-11-26 17:52:18'),
(215, 3, '2010-11-26 17:52:34'),
(216, 3, '2010-11-26 17:53:53'),
(217, 3, '2010-11-26 17:56:43'),
(218, 3, '2010-11-26 17:57:32'),
(219, 3, '2010-11-26 17:58:07'),
(220, 3, '2010-11-26 17:59:07'),
(221, 3, '2010-11-26 18:00:08'),
(222, 3, '2010-11-26 18:00:32'),
(223, 3, '2010-11-26 18:00:49'),
(224, 6, '2010-11-26 18:00:58'),
(225, 7, '2010-11-26 18:01:05'),
(226, 3, '2010-11-26 18:05:51'),
(227, 3, '2010-11-26 18:05:53'),
(228, 3, '2010-11-26 18:06:11'),
(229, 3, '2010-11-26 18:06:59'),
(230, 3, '2010-11-26 18:07:28'),
(231, 3, '2010-11-26 18:08:15'),
(232, 6, '2010-11-26 18:08:24'),
(233, 7, '2010-11-26 18:08:48'),
(234, 8, '2010-11-26 19:41:44'),
(235, 8, '2010-11-26 19:43:18'),
(236, 8, '2010-11-26 19:44:25'),
(237, 8, '2010-11-26 19:44:45'),
(238, 8, '2010-11-26 19:46:06'),
(239, 8, '2010-11-26 19:54:45'),
(240, 8, '2010-11-26 19:55:07'),
(241, 8, '2010-11-26 20:05:37'),
(242, 8, '2010-11-26 20:06:52'),
(243, 8, '2010-11-26 20:07:13'),
(244, 8, '2010-11-26 20:14:26'),
(245, 8, '2010-11-26 20:15:12'),
(246, 8, '2010-11-26 20:17:35'),
(247, 8, '2010-11-26 20:18:29'),
(248, 8, '2010-11-26 20:23:18'),
(249, 8, '2010-11-26 20:23:20'),
(250, 8, '2010-11-26 20:23:30'),
(251, 8, '2010-11-26 20:24:28'),
(252, 8, '2010-11-26 20:24:54'),
(253, 8, '2010-11-26 20:30:22'),
(254, 8, '2010-11-26 20:30:35'),
(255, 8, '2010-11-26 20:34:22'),
(256, 8, '2010-11-26 20:35:54'),
(257, 8, '2010-11-26 20:36:30'),
(258, 8, '2010-11-26 20:36:55'),
(259, 8, '2010-11-26 20:38:50'),
(260, 8, '2010-11-26 20:39:52'),
(261, 8, '2010-11-26 20:39:54'),
(262, 8, '2010-11-26 20:40:33'),
(263, 8, '2010-11-26 20:45:26'),
(264, 8, '2010-11-26 20:46:20'),
(265, 8, '2010-11-26 20:46:39'),
(266, 8, '2010-11-26 20:47:26'),
(267, 8, '2010-11-26 20:48:42'),
(268, 8, '2010-11-26 20:49:27'),
(269, 8, '2010-11-26 20:50:53'),
(270, 8, '2010-11-26 20:51:13'),
(271, 8, '2010-11-26 20:54:38'),
(272, 8, '2010-11-26 20:55:08'),
(273, 8, '2010-11-26 20:57:36'),
(274, 8, '2010-11-26 20:58:01'),
(275, 8, '2010-11-26 20:59:28'),
(276, 8, '2010-11-26 20:59:51'),
(277, 8, '2010-11-26 21:00:08'),
(278, 8, '2010-11-26 21:02:35'),
(279, 8, '2010-11-26 21:03:08'),
(280, 8, '2010-11-26 21:03:31'),
(281, 8, '2010-11-26 21:07:16'),
(282, 8, '2010-11-26 21:09:25'),
(283, 8, '2010-11-26 21:09:38'),
(284, 8, '2010-11-26 21:09:38'),
(285, 8, '2010-11-26 21:09:55'),
(286, 8, '2010-11-26 21:09:55'),
(287, 8, '2010-11-26 21:10:02'),
(288, 8, '2010-11-26 21:10:02'),
(289, 8, '2010-11-26 21:10:04'),
(290, 8, '2010-11-26 21:10:06'),
(291, 8, '2010-11-26 21:10:14'),
(292, 8, '2010-11-26 21:10:15'),
(293, 8, '2010-11-26 21:10:25'),
(294, 8, '2010-11-26 21:10:46'),
(295, 8, '2010-11-26 21:12:18'),
(296, 8, '2010-11-26 21:12:48'),
(297, 8, '2010-11-26 21:12:49'),
(298, 8, '2010-11-26 21:13:02'),
(299, 8, '2010-11-26 21:13:16'),
(300, 8, '2010-11-26 21:13:49'),
(301, 8, '2010-11-26 21:14:12'),
(302, 8, '2010-11-26 21:15:02'),
(303, 8, '2010-11-26 21:15:10'),
(304, 8, '2010-11-26 21:15:18'),
(305, 8, '2010-11-26 21:16:54'),
(306, 8, '2010-11-26 21:17:03'),
(307, 8, '2010-11-26 21:18:22'),
(308, 8, '2010-11-26 21:18:30'),
(309, 8, '2010-11-26 21:23:10'),
(310, 8, '2010-11-26 21:23:12'),
(311, 8, '2010-11-26 21:24:06'),
(312, 8, '2010-11-26 21:24:54'),
(313, 8, '2010-11-26 21:25:48'),
(314, 8, '2010-11-26 21:25:50'),
(315, 8, '2010-11-26 21:26:36'),
(316, 8, '2010-11-26 21:27:33'),
(317, 8, '2010-11-26 21:29:31'),
(318, 8, '2010-11-26 21:31:08'),
(319, 8, '2010-11-26 21:31:43'),
(320, 8, '2010-11-26 21:32:33'),
(321, 8, '2010-11-26 21:34:10'),
(322, 8, '2010-11-26 21:34:18'),
(323, 8, '2010-11-26 21:35:05'),
(324, 8, '2010-11-26 21:35:28'),
(325, 8, '2010-11-26 21:36:05'),
(326, 8, '2010-11-26 21:36:44'),
(327, 8, '2010-11-26 21:37:33'),
(328, 8, '2010-11-26 21:37:51'),
(329, 8, '2010-11-26 21:38:19'),
(330, 8, '2010-11-26 21:38:22'),
(331, 8, '2010-11-26 21:38:51'),
(332, 8, '2010-11-26 21:39:30'),
(333, 8, '2010-11-26 21:39:55'),
(334, 9, '2010-11-27 13:39:03'),
(335, 9, '2010-11-27 13:41:15'),
(336, 9, '2010-11-27 13:54:06'),
(337, 9, '2010-11-27 13:55:29'),
(338, 9, '2010-11-27 13:55:46'),
(339, 9, '2010-11-27 13:56:21'),
(340, 9, '2010-11-27 14:42:36'),
(341, 9, '2010-11-27 14:43:41'),
(342, 9, '2010-11-27 14:44:21'),
(343, 9, '2010-11-27 14:44:38'),
(344, 9, '2010-11-27 14:52:42'),
(345, 9, '2010-11-27 14:57:59'),
(346, 9, '2010-11-27 14:59:26'),
(347, 9, '2010-11-27 15:01:06'),
(348, 9, '2010-11-27 15:11:59'),
(349, 9, '2010-11-27 15:13:41'),
(350, 9, '2010-11-27 15:14:27'),
(351, 9, '2010-11-27 15:14:29'),
(352, 9, '2010-11-27 15:15:05'),
(353, 9, '2010-11-27 15:15:23'),
(354, 9, '2010-11-27 15:16:07'),
(355, 9, '2010-11-27 15:16:41'),
(356, 9, '2010-11-27 15:16:53'),
(357, 9, '2010-11-27 15:17:11'),
(358, 9, '2010-11-27 15:19:36'),
(359, 9, '2010-11-27 15:19:55'),
(360, 9, '2010-11-27 15:20:17'),
(361, 9, '2010-11-27 15:20:42'),
(362, 10, '2010-11-27 17:52:56'),
(363, 10, '2010-11-27 17:53:08'),
(364, 10, '2010-11-27 17:53:50'),
(365, 10, '2010-11-27 17:55:36'),
(366, 10, '2010-11-27 17:56:16'),
(367, 10, '2010-11-27 17:56:17'),
(368, 10, '2010-11-27 17:57:42'),
(369, 10, '2010-11-27 17:57:43'),
(370, 10, '2010-11-27 17:57:43'),
(371, 10, '2010-11-27 18:02:07'),
(372, 10, '2010-11-27 18:04:21'),
(373, 10, '2010-11-27 18:05:00'),
(374, 10, '2010-11-27 18:05:20'),
(375, 10, '2010-11-27 18:06:01'),
(376, 10, '2010-11-27 18:08:05'),
(377, 10, '2010-11-27 18:10:06'),
(378, 10, '2010-11-27 18:10:38'),
(379, 10, '2010-11-27 18:13:58'),
(380, 11, '2010-11-27 18:14:47'),
(381, 10, '2010-11-27 18:15:37'),
(382, 10, '2010-11-27 18:16:15'),
(383, 10, '2010-11-27 18:17:01'),
(384, 10, '2010-11-27 18:19:33'),
(385, 10, '2010-11-27 18:20:44'),
(386, 10, '2010-11-27 18:23:56'),
(387, 10, '2010-11-27 18:27:22'),
(388, 10, '2010-11-27 18:29:22'),
(389, 10, '2010-11-27 18:31:05'),
(390, 10, '2010-11-27 18:31:53'),
(391, 10, '2010-11-27 18:32:15'),
(392, 10, '2010-11-27 18:33:06'),
(393, 10, '2010-11-27 18:33:11'),
(394, 10, '2010-11-27 18:35:55'),
(395, 10, '2010-11-27 18:36:36'),
(396, 10, '2010-11-27 18:38:28'),
(397, 10, '2010-11-27 18:38:53'),
(398, 10, '2010-11-27 18:39:06'),
(399, 10, '2010-11-27 18:39:21'),
(400, 10, '2010-11-27 18:40:21'),
(401, 10, '2010-11-27 18:40:35'),
(402, 10, '2010-11-27 18:42:05'),
(403, 10, '2010-11-27 18:42:24'),
(404, 10, '2010-11-27 18:42:39'),
(405, 10, '2010-11-27 18:44:17'),
(406, 10, '2010-11-27 18:44:39'),
(407, 10, '2010-11-27 18:45:16'),
(408, 10, '2010-11-27 18:45:43'),
(409, 10, '2010-11-27 18:46:02'),
(410, 10, '2010-11-27 18:47:36'),
(411, 10, '2010-11-27 18:47:55'),
(412, 10, '2010-11-27 18:49:12'),
(413, 10, '2010-11-27 18:49:51'),
(414, 10, '2010-11-27 18:51:05'),
(415, 10, '2010-11-27 18:51:20'),
(416, 10, '2010-11-27 18:51:43'),
(417, 10, '2010-11-27 18:52:13'),
(418, 10, '2010-11-27 18:52:33'),
(419, 10, '2010-11-27 18:56:40'),
(420, 10, '2010-11-27 18:57:00'),
(421, 10, '2010-11-27 18:59:32'),
(422, 10, '2010-11-27 19:00:07'),
(423, 10, '2010-11-27 19:00:38'),
(424, 10, '2010-11-27 19:00:49'),
(425, 10, '2010-11-27 19:01:21'),
(426, 10, '2010-11-27 19:01:59'),
(427, 10, '2010-11-27 19:02:14'),
(428, 10, '2010-11-27 19:02:26'),
(429, 10, '2010-11-27 19:02:51'),
(430, 10, '2010-11-27 19:03:16'),
(431, 10, '2010-11-27 19:03:38'),
(432, 12, '2010-11-27 19:17:34'),
(433, 10, '2010-11-27 19:23:03'),
(434, 10, '2010-11-27 19:23:26'),
(435, 10, '2010-11-27 19:23:58'),
(436, 10, '2010-11-27 19:24:18'),
(437, 10, '2010-11-27 19:24:36'),
(438, 10, '2010-11-27 19:25:20'),
(439, 10, '2010-11-27 19:26:23'),
(440, 10, '2010-11-27 19:26:33'),
(441, 10, '2010-11-27 19:26:44'),
(442, 10, '2010-11-27 19:29:22'),
(443, 10, '2010-11-27 19:31:28'),
(444, 10, '2010-11-27 19:34:19'),
(445, 10, '2010-11-27 19:34:21'),
(446, 10, '2010-11-27 19:34:57'),
(447, 10, '2010-11-27 19:36:52'),
(448, 10, '2010-11-27 19:37:57'),
(449, 10, '2010-11-27 19:38:05'),
(450, 10, '2010-11-27 19:39:09'),
(451, 10, '2010-11-27 19:40:11'),
(452, 10, '2010-11-27 19:42:08'),
(453, 10, '2010-11-27 19:42:24'),
(454, 10, '2010-11-27 19:42:38'),
(455, 10, '2010-11-27 19:42:58'),
(456, 10, '2010-11-27 19:47:00'),
(457, 10, '2010-11-27 19:47:35'),
(458, 10, '2010-11-27 19:48:48'),
(459, 10, '2010-11-27 19:49:22'),
(460, 10, '2010-11-27 19:49:51'),
(461, 10, '2010-11-27 19:50:42'),
(462, 10, '2010-11-27 19:51:29'),
(463, 10, '2010-11-27 19:52:07'),
(464, 10, '2010-11-27 19:52:59'),
(465, 10, '2010-11-27 19:53:40'),
(466, 10, '2010-11-27 19:54:13'),
(467, 10, '2010-11-27 19:54:51'),
(468, 10, '2010-11-27 19:56:08'),
(469, 10, '2010-11-27 20:00:20'),
(470, 10, '2010-11-27 20:16:18'),
(471, 10, '2010-11-27 20:17:02'),
(472, 10, '2010-11-27 20:17:20'),
(473, 10, '2010-11-27 20:17:31'),
(474, 10, '2010-11-27 20:18:52'),
(475, 10, '2010-11-27 20:21:26'),
(476, 10, '2010-11-27 20:25:42'),
(477, 10, '2010-11-27 20:26:06'),
(478, 10, '2010-11-27 20:26:15'),
(479, 10, '2010-11-27 20:26:31'),
(480, 10, '2010-11-27 20:33:46'),
(481, 10, '2010-11-27 20:33:48'),
(482, 10, '2010-11-27 20:34:16'),
(483, 10, '2010-11-27 20:35:01'),
(484, 10, '2010-11-27 20:39:01'),
(485, 10, '2010-11-27 20:40:44'),
(486, 10, '2010-11-27 20:43:45'),
(487, 10, '2010-11-27 20:43:58'),
(488, 10, '2010-11-27 20:43:59'),
(489, 10, '2010-11-27 20:43:59'),
(490, 10, '2010-11-27 20:44:00'),
(491, 10, '2010-11-27 20:44:00'),
(492, 10, '2010-11-27 20:44:01'),
(493, 10, '2010-11-27 20:44:01'),
(494, 10, '2010-11-27 20:44:20'),
(495, 10, '2010-11-27 20:45:33'),
(496, 10, '2010-11-27 20:45:36'),
(497, 10, '2010-11-27 20:45:55'),
(498, 10, '2010-11-27 20:45:55'),
(499, 10, '2010-11-27 20:45:55'),
(500, 10, '2010-11-27 20:45:56'),
(501, 10, '2010-11-27 20:45:56'),
(502, 10, '2010-11-27 20:45:56'),
(503, 10, '2010-11-27 20:45:57'),
(504, 10, '2010-11-27 20:46:06'),
(505, 10, '2010-11-27 20:49:39'),
(506, 10, '2010-11-27 20:49:45'),
(507, 10, '2010-11-27 20:49:45'),
(508, 10, '2010-11-27 20:53:15'),
(509, 10, '2010-11-27 20:53:54'),
(510, 10, '2010-11-27 20:54:27'),
(511, 10, '2010-11-27 20:55:45'),
(512, 10, '2010-11-27 20:56:08'),
(513, 10, '2010-11-27 20:56:25'),
(514, 10, '2010-11-27 20:57:05'),
(515, 10, '2010-11-27 20:57:40'),
(516, 10, '2010-11-27 20:58:10'),
(517, 10, '2010-11-27 20:58:12'),
(518, 10, '2010-11-27 20:58:13'),
(519, 10, '2010-11-27 20:58:13'),
(520, 10, '2010-11-27 20:58:23'),
(521, 10, '2010-11-27 20:58:25'),
(522, 10, '2010-11-27 20:58:25'),
(523, 10, '2010-11-27 20:59:06'),
(524, 10, '2010-11-27 21:00:32'),
(525, 10, '2010-11-27 21:17:59'),
(526, 10, '2010-11-27 21:18:01'),
(527, 10, '2010-11-27 21:18:42'),
(528, 10, '2010-11-27 21:20:39'),
(529, 10, '2010-11-27 21:21:53'),
(530, 10, '2010-11-27 21:22:48'),
(531, 10, '2010-11-27 21:28:04'),
(532, 10, '2010-11-27 21:28:39'),
(533, 10, '2010-11-27 21:29:23'),
(534, 10, '2010-11-27 21:29:35'),
(535, 10, '2010-11-27 21:29:51'),
(536, 10, '2010-11-27 21:30:01'),
(537, 10, '2010-11-27 21:30:24'),
(538, 10, '2010-11-27 21:32:44'),
(539, 10, '2010-11-27 21:32:57'),
(540, 10, '2010-11-27 21:35:30'),
(541, 10, '2010-11-27 21:35:58'),
(542, 10, '2010-11-27 21:36:39'),
(543, 10, '2010-11-27 21:37:00'),
(544, 10, '2010-11-27 21:37:14'),
(545, 10, '2010-11-27 21:37:33'),
(546, 10, '2010-11-27 21:38:03'),
(547, 10, '2010-11-27 21:38:33'),
(548, 10, '2010-11-27 21:39:05'),
(549, 10, '2010-11-27 21:39:08'),
(550, 10, '2010-11-27 21:39:54'),
(551, 10, '2010-11-27 21:39:56'),
(552, 10, '2010-11-27 21:39:57'),
(553, 10, '2010-11-27 21:40:32'),
(554, 10, '2010-11-27 21:40:59'),
(555, 13, '2010-11-28 01:07:39'),
(556, 13, '2010-11-28 01:08:22'),
(557, 13, '2010-11-28 01:08:50'),
(558, 13, '2010-11-28 01:08:52'),
(559, 13, '2010-11-28 01:09:11'),
(560, 13, '2010-11-28 01:10:29'),
(561, 13, '2010-11-28 01:14:24'),
(562, 13, '2010-11-28 01:14:47'),
(563, 13, '2010-11-28 01:14:49'),
(564, 13, '2010-11-28 01:27:28'),
(565, 13, '2010-11-28 01:27:58'),
(566, 13, '2010-11-28 01:28:16'),
(567, 13, '2010-11-28 01:28:21'),
(568, 13, '2010-11-28 01:29:11'),
(569, 13, '2010-11-28 01:30:04'),
(570, 13, '2010-11-28 01:30:46'),
(571, 13, '2010-11-28 02:03:36'),
(572, 13, '2010-11-28 02:13:34'),
(573, 13, '2010-11-28 02:14:15'),
(574, 13, '2010-11-28 02:14:45'),
(575, 13, '2010-11-28 02:15:21'),
(576, 13, '2010-11-28 02:20:10'),
(577, 13, '2010-11-28 02:20:40'),
(578, 13, '2010-11-28 02:20:54'),
(579, 13, '2010-11-28 02:50:26'),
(580, 13, '2010-11-28 02:51:03'),
(581, 13, '2010-11-28 02:51:30'),
(582, 13, '2010-11-28 02:53:05'),
(583, 13, '2010-11-28 02:53:39'),
(584, 13, '2010-11-28 02:54:27'),
(585, 13, '2010-11-28 02:55:33'),
(586, 13, '2010-11-28 03:07:10'),
(587, 13, '2010-11-28 03:09:05'),
(588, 13, '2010-11-28 03:09:07'),
(589, 13, '2010-11-28 03:09:46'),
(590, 13, '2010-11-28 03:11:43'),
(591, 13, '2010-11-28 03:12:38'),
(592, 13, '2010-11-28 03:12:52'),
(593, 13, '2010-11-28 03:14:03'),
(594, 13, '2010-11-28 03:14:42'),
(595, 13, '2010-11-28 03:23:41'),
(596, 13, '2010-11-28 03:28:11'),
(597, 13, '2010-11-28 03:31:31'),
(598, 13, '2010-11-28 03:34:10'),
(599, 13, '2010-11-28 03:34:32'),
(600, 13, '2010-11-28 03:34:46'),
(601, 13, '2010-11-28 04:06:11'),
(602, 13, '2010-11-28 04:06:45'),
(603, 13, '2010-11-28 04:07:37'),
(604, 13, '2010-11-28 04:09:05'),
(605, 13, '2010-11-28 04:09:07'),
(606, 13, '2010-11-28 04:09:52'),
(607, 13, '2010-11-28 04:10:36'),
(608, 13, '2010-11-28 04:10:53'),
(609, 13, '2010-11-28 04:11:17'),
(610, 13, '2010-11-28 04:11:37'),
(611, 13, '2010-11-28 04:11:52'),
(612, 13, '2010-11-28 04:12:30'),
(613, 14, '2010-11-28 12:14:33'),
(614, 14, '2010-11-28 12:24:20'),
(615, 14, '2010-11-28 12:27:32'),
(616, 14, '2010-11-28 12:27:53'),
(617, 14, '2010-11-28 12:38:09'),
(618, 14, '2010-11-28 12:39:37'),
(619, 14, '2010-11-28 12:43:21'),
(620, 14, '2010-11-28 12:46:44'),
(621, 14, '2010-11-28 12:47:43'),
(622, 14, '2010-11-28 12:48:16'),
(623, 14, '2010-11-28 12:49:47'),
(624, 14, '2010-11-28 12:51:31'),
(625, 14, '2010-11-28 12:52:11'),
(626, 14, '2010-11-28 13:02:24'),
(627, 14, '2010-11-28 13:03:36'),
(628, 14, '2010-11-28 13:06:11'),
(629, 14, '2010-11-28 13:07:32'),
(630, 14, '2010-11-28 13:08:49'),
(631, 14, '2010-11-28 13:10:10'),
(632, 14, '2010-11-28 13:11:07'),
(633, 14, '2010-11-28 13:12:06'),
(634, 14, '2010-11-28 13:14:10'),
(635, 14, '2010-11-28 13:15:09'),
(636, 14, '2010-11-28 13:16:00'),
(637, 14, '2010-11-28 13:17:24'),
(638, 14, '2010-11-28 13:19:20'),
(639, 14, '2010-11-28 13:19:23'),
(640, 14, '2010-11-28 13:19:25'),
(641, 14, '2010-11-28 13:20:42'),
(642, 14, '2010-11-28 13:22:21'),
(643, 14, '2010-11-28 13:24:48'),
(644, 14, '2010-11-28 13:25:25'),
(645, 14, '2010-11-28 13:26:02'),
(646, 14, '2010-11-28 13:26:19'),
(647, 14, '2010-11-28 13:26:45'),
(648, 14, '2010-11-28 13:27:14'),
(649, 14, '2010-11-28 13:35:41'),
(650, 14, '2010-11-28 13:36:06'),
(651, 14, '2010-11-28 13:36:33'),
(652, 14, '2010-11-28 13:36:50'),
(653, 14, '2010-11-28 13:37:37'),
(654, 14, '2010-11-28 13:37:49'),
(655, 14, '2010-11-28 13:38:05'),
(656, 14, '2010-11-28 13:38:16'),
(657, 14, '2010-11-28 13:39:01'),
(658, 14, '2010-11-28 13:39:22'),
(659, 14, '2010-11-28 13:45:17'),
(660, 14, '2010-11-28 13:52:08'),
(661, 14, '2010-11-28 13:52:48'),
(662, 14, '2010-11-28 13:54:29'),
(663, 14, '2010-11-28 13:56:00'),
(664, 14, '2010-11-28 13:59:50'),
(665, 14, '2010-11-28 14:01:13'),
(666, 14, '2010-11-28 14:03:23'),
(667, 14, '2010-11-28 14:04:11'),
(668, 14, '2010-11-28 14:09:26'),
(669, 14, '2010-11-28 14:10:19'),
(670, 14, '2010-11-28 14:11:08'),
(671, 14, '2010-11-28 14:17:10'),
(672, 14, '2010-11-28 14:18:31'),
(673, 14, '2010-11-28 14:19:02'),
(674, 14, '2010-11-28 14:19:51'),
(675, 14, '2010-11-28 14:21:31'),
(676, 14, '2010-11-28 14:22:28'),
(677, 14, '2010-11-28 14:23:26'),
(678, 14, '2010-11-28 14:24:22'),
(679, 14, '2010-11-28 14:26:43'),
(680, 14, '2010-11-28 14:27:26'),
(681, 14, '2010-11-28 14:28:51'),
(682, 14, '2010-11-28 14:29:19'),
(683, 14, '2010-11-28 14:30:09'),
(684, 14, '2010-11-28 14:31:53'),
(685, 14, '2010-11-28 14:32:37'),
(686, 14, '2010-11-28 14:33:11'),
(687, 14, '2010-11-28 14:33:45'),
(688, 15, '2010-11-28 15:55:18'),
(689, 16, '2010-11-28 15:56:18'),
(690, 16, '2010-11-28 15:58:31'),
(691, 16, '2010-11-28 16:03:55'),
(692, 16, '2010-11-28 16:04:52'),
(693, 16, '2010-11-28 16:06:23'),
(694, 16, '2010-11-28 16:08:32'),
(695, 16, '2010-11-28 16:08:57'),
(696, 16, '2010-11-28 16:14:53'),
(697, 16, '2010-11-28 16:15:15'),
(698, 16, '2010-11-28 16:15:39'),
(699, 16, '2010-11-28 16:16:22'),
(700, 16, '2010-11-28 16:16:34'),
(701, 16, '2010-11-28 16:16:55'),
(702, 16, '2010-11-28 16:17:05'),
(703, 16, '2010-11-28 16:17:18'),
(704, 16, '2010-11-28 16:17:42'),
(705, 16, '2010-11-28 16:17:54'),
(706, 16, '2010-11-28 16:20:31'),
(707, 16, '2010-11-28 16:21:39'),
(708, 16, '2010-11-28 16:22:27'),
(709, 16, '2010-11-28 16:23:11'),
(710, 16, '2010-11-28 16:23:47'),
(711, 16, '2010-11-28 16:24:06'),
(712, 16, '2010-11-28 16:24:32'),
(713, 16, '2010-11-28 16:33:11'),
(714, 16, '2010-11-28 16:34:31'),
(715, 16, '2010-11-28 16:36:00'),
(716, 16, '2010-11-28 16:36:48'),
(717, 16, '2010-11-28 16:37:05'),
(718, 16, '2010-11-28 16:37:46'),
(719, 16, '2010-11-28 16:37:55'),
(720, 16, '2010-11-28 16:38:05'),
(721, 16, '2010-11-28 16:38:23'),
(722, 16, '2010-11-28 16:40:52'),
(723, 16, '2010-11-28 16:41:18'),
(724, 16, '2010-11-28 16:41:39'),
(725, 16, '2010-11-28 16:42:28'),
(726, 16, '2010-11-28 16:42:40'),
(727, 16, '2010-11-28 16:43:01'),
(728, 16, '2010-11-28 16:44:13'),
(729, 16, '2010-11-28 16:44:15'),
(730, 16, '2010-11-28 16:44:52'),
(731, 16, '2010-11-28 16:45:09'),
(732, 16, '2010-11-28 16:48:12'),
(733, 16, '2010-11-28 16:48:26'),
(734, 16, '2010-11-28 16:48:53'),
(735, 16, '2010-11-28 16:49:53'),
(736, 16, '2010-11-28 16:50:03'),
(737, 16, '2010-11-28 16:54:50'),
(738, 16, '2010-11-28 16:55:07'),
(739, 16, '2010-11-28 16:55:28'),
(740, 16, '2010-11-28 16:56:09'),
(741, 16, '2010-11-28 16:56:47'),
(742, 16, '2010-11-28 16:57:05'),
(743, 16, '2010-11-28 16:57:14'),
(744, 16, '2010-11-28 16:57:23'),
(745, 16, '2010-11-28 16:57:28'),
(746, 16, '2010-11-28 16:57:31'),
(747, 16, '2010-11-28 16:58:18'),
(748, 16, '2010-11-28 16:58:34'),
(749, 16, '2010-11-28 16:58:43'),
(750, 16, '2010-11-28 16:59:38'),
(751, 16, '2010-11-28 16:59:43'),
(752, 16, '2010-11-28 16:59:48'),
(753, 16, '2010-11-28 16:59:52'),
(754, 16, '2010-11-28 16:59:57'),
(755, 16, '2010-11-28 17:18:13'),
(756, 16, '2010-11-28 17:22:49'),
(757, 16, '2010-11-28 17:23:27'),
(758, 16, '2010-11-28 17:24:06'),
(759, 16, '2010-11-28 17:24:50'),
(760, 16, '2010-11-28 17:26:39'),
(761, 16, '2010-11-28 17:27:39'),
(762, 16, '2010-11-28 17:28:41'),
(763, 16, '2010-11-28 17:29:00'),
(764, 16, '2010-11-28 17:29:04'),
(765, 16, '2010-11-28 17:29:08'),
(766, 16, '2010-11-28 17:29:11'),
(767, 16, '2010-11-28 17:29:11'),
(768, 16, '2010-11-28 17:29:11'),
(769, 16, '2010-11-28 17:29:12'),
(770, 16, '2010-11-28 17:29:12'),
(771, 16, '2010-11-28 17:29:12'),
(772, 16, '2010-11-28 17:29:13'),
(773, 16, '2010-11-28 17:29:13'),
(774, 16, '2010-11-28 17:29:14'),
(775, 16, '2010-11-28 17:29:14'),
(776, 16, '2010-11-28 17:29:15'),
(777, 16, '2010-11-28 17:29:15'),
(778, 16, '2010-11-28 17:29:15'),
(779, 16, '2010-11-28 17:29:16'),
(780, 16, '2010-11-28 17:29:16'),
(781, 16, '2010-11-28 17:29:16'),
(782, 16, '2010-11-28 17:29:17'),
(783, 16, '2010-11-28 17:29:17'),
(784, 16, '2010-11-28 17:29:17'),
(785, 16, '2010-11-28 17:29:18'),
(786, 16, '2010-11-28 17:29:18'),
(787, 16, '2010-11-28 17:29:18'),
(788, 16, '2010-11-28 17:29:18'),
(789, 16, '2010-11-28 17:29:19'),
(790, 16, '2010-11-28 17:29:38'),
(791, 16, '2010-11-28 17:30:25'),
(792, 16, '2010-11-28 17:31:26'),
(793, 16, '2010-11-28 17:31:50'),
(794, 16, '2010-11-28 17:32:03'),
(795, 16, '2010-11-28 17:32:13'),
(796, 16, '2010-11-28 17:32:18'),
(797, 16, '2010-11-28 17:35:02'),
(798, 16, '2010-11-28 17:35:25'),
(799, 16, '2010-11-28 17:44:02'),
(800, 16, '2010-11-28 17:44:23'),
(801, 16, '2010-11-28 18:09:22'),
(802, 16, '2010-11-28 18:15:49'),
(803, 16, '2010-11-28 18:18:36'),
(804, 16, '2010-11-28 18:19:58'),
(805, 16, '2010-11-28 18:23:34'),
(806, 16, '2010-11-28 18:26:35'),
(807, 16, '2010-11-28 18:27:29'),
(808, 16, '2010-11-28 18:28:29'),
(809, 17, '2010-11-28 18:31:23'),
(810, 16, '2010-11-28 18:33:03'),
(811, 18, '2010-11-28 18:34:26'),
(812, 16, '2010-11-28 19:11:28'),
(813, 16, '2010-11-28 19:11:42'),
(814, 16, '2010-11-28 19:11:49'),
(815, 16, '2010-11-28 19:12:32'),
(816, 19, '2010-11-28 20:27:08'),
(817, 19, '2010-11-28 20:30:59'),
(818, 19, '2010-11-28 20:35:17'),
(819, 19, '2010-11-28 20:35:36'),
(820, 19, '2010-11-28 20:39:50'),
(821, 19, '2010-11-28 20:41:05'),
(822, 19, '2010-11-28 20:44:06'),
(823, 19, '2010-11-28 20:48:46'),
(824, 19, '2010-11-28 20:50:32'),
(825, 19, '2010-11-28 20:53:36'),
(826, 19, '2010-11-28 20:58:28'),
(827, 19, '2010-11-28 20:58:56'),
(828, 19, '2010-11-28 20:58:59'),
(829, 19, '2010-11-28 21:03:07'),
(830, 19, '2010-11-28 21:05:49'),
(831, 19, '2010-11-28 21:06:42'),
(832, 19, '2010-11-28 21:07:06'),
(833, 19, '2010-11-28 21:11:19'),
(834, 19, '2010-11-28 21:12:55'),
(835, 19, '2010-11-28 21:13:34'),
(836, 19, '2010-11-28 21:14:11'),
(837, 19, '2010-11-28 21:15:15'),
(838, 19, '2010-11-28 21:15:46'),
(839, 19, '2010-11-28 21:21:38'),
(840, 19, '2010-11-28 21:22:25'),
(841, 19, '2010-11-28 21:25:49'),
(842, 19, '2010-11-28 21:31:19'),
(843, 19, '2010-11-28 21:34:35'),
(844, 19, '2010-11-28 21:34:52'),
(845, 19, '2010-11-28 21:46:38'),
(846, 19, '2010-11-28 21:47:09'),
(847, 19, '2010-11-28 21:48:06'),
(848, 19, '2010-11-28 21:48:08'),
(849, 19, '2010-11-28 21:48:35'),
(850, 19, '2010-11-28 21:48:39'),
(851, 19, '2010-11-28 21:48:53'),
(852, 19, '2010-11-28 21:48:55'),
(853, 19, '2010-11-28 21:49:02'),
(854, 19, '2010-11-28 21:49:04'),
(855, 19, '2010-11-28 21:53:45'),
(856, 19, '2010-11-28 21:53:47'),
(857, 19, '2010-11-28 21:53:52'),
(858, 19, '2010-11-28 21:53:57'),
(859, 19, '2010-11-28 21:53:59'),
(860, 19, '2010-11-28 21:57:28'),
(861, 19, '2010-11-28 21:58:25'),
(862, 19, '2010-11-28 21:58:45'),
(863, 19, '2010-11-28 22:01:01'),
(864, 19, '2010-11-28 22:01:09'),
(865, 19, '2010-11-28 22:01:15'),
(866, 19, '2010-11-28 22:02:41'),
(867, 19, '2010-11-28 22:02:44'),
(868, 19, '2010-11-28 22:05:08'),
(869, 19, '2010-11-28 22:11:06'),
(870, 19, '2010-11-28 22:11:43'),
(871, 20, '2010-11-29 23:27:44'),
(872, 21, '2010-11-30 22:46:27'),
(873, 21, '2010-11-30 22:47:28'),
(874, 21, '2010-11-30 22:49:43'),
(875, 21, '2010-11-30 22:50:20'),
(876, 21, '2010-11-30 22:57:08'),
(877, 21, '2010-11-30 22:57:55'),
(878, 22, '2010-12-05 20:51:14'),
(879, 23, '2010-12-05 21:02:09'),
(880, 24, '2010-12-05 22:41:39'),
(881, 25, '2010-12-07 02:31:28'),
(882, 26, '2010-12-08 23:42:17'),
(883, 27, '2010-12-09 01:04:05'),
(884, 27, '2010-12-09 01:04:50'),
(885, 27, '2010-12-09 01:13:47'),
(886, 27, '2010-12-09 01:15:39'),
(887, 28, '2010-12-09 01:20:16'),
(888, 28, '2010-12-09 01:25:29'),
(889, 28, '2010-12-09 01:25:39'),
(890, 28, '2010-12-09 01:26:37'),
(891, 28, '2010-12-09 01:26:47'),
(892, 28, '2010-12-09 01:26:56'),
(893, 28, '2010-12-09 01:27:00'),
(894, 28, '2010-12-09 01:51:10'),
(895, 28, '2010-12-09 01:51:44'),
(896, 28, '2010-12-09 01:56:29'),
(897, 28, '2010-12-09 02:05:48'),
(898, 28, '2010-12-09 02:06:39'),
(899, 28, '2010-12-09 02:07:41'),
(900, 28, '2010-12-09 02:09:22'),
(901, 28, '2010-12-09 02:10:22'),
(902, 28, '2010-12-09 02:10:30'),
(903, 28, '2010-12-09 02:10:34'),
(904, 28, '2010-12-09 02:11:09'),
(905, 28, '2010-12-09 02:12:08'),
(906, 28, '2010-12-09 02:13:46'),
(907, 28, '2010-12-09 02:13:59'),
(908, 28, '2010-12-09 02:17:07'),
(909, 28, '2010-12-09 02:24:12'),
(910, 28, '2010-12-09 02:24:15'),
(911, 28, '2010-12-09 02:24:29'),
(912, 29, '2010-12-09 02:24:49'),
(913, 29, '2010-12-09 02:25:00'),
(914, 29, '2010-12-09 02:26:21'),
(915, 29, '2010-12-09 02:26:24'),
(916, 30, '2010-12-09 02:26:53'),
(917, 30, '2010-12-09 02:29:05'),
(918, 30, '2010-12-09 02:31:38'),
(919, 30, '2010-12-09 02:31:50'),
(920, 31, '2010-12-09 02:33:43'),
(921, 31, '2010-12-09 02:53:21'),
(922, 31, '2010-12-09 02:55:13'),
(923, 31, '2010-12-09 02:55:30'),
(924, 30, '2010-12-09 03:05:10'),
(925, 30, '2010-12-09 03:06:44'),
(926, 32, '2010-12-09 23:42:21'),
(927, 32, '2010-12-09 23:42:32'),
(928, 32, '2010-12-09 23:43:06'),
(929, 33, '2010-12-09 23:45:19'),
(930, 33, '2010-12-09 23:47:16'),
(931, 34, '2010-12-09 23:47:28'),
(932, 34, '2010-12-09 23:51:02'),
(933, 34, '2010-12-09 23:52:31'),
(934, 34, '2010-12-09 23:57:12'),
(935, 34, '2010-12-09 23:57:13'),
(936, 34, '2010-12-09 23:57:40'),
(937, 34, '2010-12-09 23:57:53'),
(938, 34, '2010-12-09 23:57:54'),
(939, 34, '2010-12-09 23:57:54'),
(940, 32, '2010-12-09 23:59:56'),
(941, 34, '2010-12-10 00:02:31'),
(942, 34, '2010-12-10 00:02:39'),
(943, 34, '2010-12-10 00:04:14'),
(944, 34, '2010-12-10 00:07:04'),
(945, 34, '2010-12-10 00:12:32'),
(946, 34, '2010-12-10 00:16:01'),
(947, 34, '2010-12-10 00:20:23'),
(948, 34, '2010-12-10 00:20:49'),
(949, 34, '2010-12-10 00:22:04'),
(950, 34, '2010-12-10 00:22:06'),
(951, 34, '2010-12-10 00:22:49'),
(952, 34, '2010-12-10 00:25:06'),
(953, 34, '2010-12-10 00:26:44'),
(954, 34, '2010-12-10 00:27:49'),
(955, 34, '2010-12-10 00:28:59'),
(956, 34, '2010-12-10 00:30:18'),
(957, 34, '2010-12-10 00:30:20'),
(958, 34, '2010-12-10 00:30:23'),
(959, 35, '2010-12-10 00:30:44'),
(960, 35, '2010-12-10 00:31:28'),
(961, 35, '2010-12-10 00:32:52'),
(962, 36, '2010-12-12 19:06:01'),
(963, 36, '2010-12-12 19:06:07'),
(964, 36, '2010-12-12 19:16:02'),
(965, 36, '2010-12-12 19:16:04'),
(966, 36, '2010-12-12 19:17:13'),
(967, 36, '2010-12-12 19:26:48'),
(968, 36, '2010-12-12 19:28:26'),
(969, 36, '2010-12-12 19:28:29'),
(970, 36, '2010-12-12 19:29:09'),
(971, 36, '2010-12-12 19:29:17'),
(972, 36, '2010-12-12 19:34:08'),
(973, 36, '2010-12-12 19:34:27'),
(974, 36, '2010-12-12 19:34:50'),
(975, 36, '2010-12-12 19:34:57'),
(976, 37, '2010-12-12 19:37:06'),
(977, 37, '2010-12-12 19:37:14'),
(978, 38, '2010-12-12 19:38:41'),
(979, 38, '2010-12-12 19:39:02'),
(980, 39, '2010-12-12 19:39:53'),
(981, 40, '2010-12-12 19:41:47'),
(982, 40, '2010-12-12 19:42:39'),
(983, 40, '2010-12-12 19:43:50'),
(984, 40, '2010-12-12 19:47:38'),
(985, 40, '2010-12-12 19:52:35'),
(986, 40, '2010-12-12 19:53:03'),
(987, 41, '2010-12-12 19:57:44'),
(988, 40, '2010-12-12 20:00:15'),
(989, 40, '2010-12-12 20:01:35'),
(990, 40, '2010-12-12 20:01:52'),
(991, 41, '2010-12-12 20:08:20'),
(992, 41, '2010-12-12 20:15:38'),
(993, 41, '2010-12-12 20:26:53'),
(994, 41, '2010-12-12 20:34:45'),
(995, 41, '2010-12-12 20:35:19'),
(996, 41, '2010-12-12 20:36:01'),
(997, 41, '2010-12-12 20:37:20'),
(998, 41, '2010-12-12 20:39:39'),
(999, 41, '2010-12-12 20:40:13'),
(1000, 41, '2010-12-12 20:44:24'),
(1001, 41, '2010-12-12 20:44:53'),
(1002, 41, '2010-12-12 20:45:16'),
(1003, 41, '2010-12-12 20:45:41'),
(1004, 41, '2010-12-12 20:46:31'),
(1005, 41, '2010-12-12 20:46:55'),
(1006, 41, '2010-12-12 20:47:13'),
(1007, 41, '2010-12-12 20:47:42'),
(1008, 41, '2010-12-12 20:49:00'),
(1009, 41, '2010-12-12 20:52:20'),
(1010, 41, '2010-12-12 20:53:00'),
(1011, 41, '2010-12-12 20:53:24'),
(1012, 41, '2010-12-12 20:53:55'),
(1013, 41, '2010-12-12 20:54:14'),
(1014, 41, '2010-12-12 20:54:42'),
(1015, 41, '2010-12-12 20:56:09'),
(1016, 41, '2010-12-12 20:56:19'),
(1017, 41, '2010-12-12 20:57:11'),
(1018, 42, '2010-12-12 22:55:15'),
(1019, 42, '2010-12-12 22:56:07'),
(1020, 43, '2010-12-12 22:57:14'),
(1021, 43, '2010-12-12 22:57:18'),
(1022, 42, '2010-12-12 22:57:52'),
(1023, 42, '2010-12-12 23:00:22'),
(1024, 42, '2010-12-12 23:00:51'),
(1025, 42, '2010-12-12 23:00:53'),
(1026, 42, '2010-12-12 23:01:04'),
(1027, 42, '2010-12-12 23:02:19'),
(1028, 42, '2010-12-12 23:02:26'),
(1029, 42, '2010-12-12 23:02:57'),
(1030, 42, '2010-12-12 23:27:45'),
(1031, 42, '2010-12-12 23:28:58'),
(1032, 42, '2010-12-12 23:29:25'),
(1033, 43, '2010-12-12 23:32:32'),
(1034, 43, '2010-12-12 23:32:51'),
(1035, 43, '2010-12-12 23:33:10'),
(1036, 42, '2010-12-12 23:36:11'),
(1037, 42, '2010-12-12 23:50:00'),
(1038, 42, '2010-12-12 23:50:03'),
(1039, 42, '2010-12-12 23:51:00'),
(1040, 42, '2010-12-12 23:52:09'),
(1041, 42, '2010-12-12 23:53:04'),
(1042, 42, '2010-12-12 23:54:46'),
(1043, 42, '2010-12-12 23:59:57'),
(1044, 42, '2010-12-13 00:00:33'),
(1045, 42, '2010-12-13 00:04:39'),
(1046, 42, '2010-12-13 00:05:00'),
(1047, 42, '2010-12-13 00:05:10'),
(1048, 42, '2010-12-13 00:05:26'),
(1049, 42, '2010-12-13 00:05:47'),
(1050, 42, '2010-12-13 00:07:17'),
(1051, 42, '2010-12-13 00:07:39'),
(1052, 42, '2010-12-13 00:11:12'),
(1053, 42, '2010-12-13 00:11:15'),
(1054, 42, '2010-12-13 00:11:23'),
(1055, 42, '2010-12-13 00:11:36'),
(1056, 42, '2010-12-13 00:12:18'),
(1057, 42, '2010-12-13 00:12:43'),
(1058, 42, '2010-12-13 00:13:00'),
(1059, 42, '2010-12-13 00:14:57'),
(1060, 42, '2010-12-13 00:15:18'),
(1061, 42, '2010-12-13 00:16:58'),
(1062, 42, '2010-12-13 00:17:21'),
(1063, 42, '2010-12-13 00:18:36'),
(1064, 42, '2010-12-13 00:19:33'),
(1065, 42, '2010-12-13 00:24:44'),
(1066, 42, '2010-12-13 00:25:52'),
(1067, 42, '2010-12-13 00:26:51'),
(1068, 42, '2010-12-13 00:27:25'),
(1069, 42, '2010-12-13 00:28:01'),
(1070, 42, '2010-12-13 00:28:32'),
(1071, 42, '2010-12-13 00:29:52'),
(1072, 42, '2010-12-13 00:30:20'),
(1073, 42, '2010-12-13 00:31:31'),
(1074, 42, '2010-12-13 00:31:56'),
(1075, 42, '2010-12-13 00:31:58'),
(1076, 42, '2010-12-13 00:32:42'),
(1077, 42, '2010-12-13 00:34:09'),
(1078, 42, '2010-12-13 00:34:46'),
(1079, 42, '2010-12-13 00:35:20'),
(1080, 42, '2010-12-13 00:35:21'),
(1081, 42, '2010-12-13 00:37:28'),
(1082, 42, '2010-12-13 00:37:31'),
(1083, 42, '2010-12-13 00:37:33'),
(1084, 42, '2010-12-13 00:37:44'),
(1085, 42, '2010-12-13 00:37:47'),
(1086, 42, '2010-12-13 00:38:25'),
(1087, 42, '2010-12-13 00:38:26'),
(1088, 42, '2010-12-13 00:39:35'),
(1089, 42, '2010-12-13 00:56:49'),
(1090, 42, '2010-12-13 00:57:03'),
(1091, 42, '2010-12-13 00:57:10'),
(1092, 42, '2010-12-13 00:57:18'),
(1093, 42, '2010-12-13 00:58:18'),
(1094, 42, '2010-12-13 00:59:29'),
(1095, 42, '2010-12-13 01:02:15'),
(1096, 42, '2010-12-13 01:07:04'),
(1097, 42, '2010-12-13 01:07:20'),
(1098, 42, '2010-12-13 01:07:50'),
(1099, 42, '2010-12-13 01:08:58'),
(1100, 42, '2010-12-13 01:09:18'),
(1101, 42, '2010-12-13 01:09:38'),
(1102, 42, '2010-12-13 01:09:39'),
(1103, 42, '2010-12-13 01:11:38'),
(1104, 42, '2010-12-13 01:19:27'),
(1105, 42, '2010-12-13 01:23:56'),
(1106, 42, '2010-12-13 01:28:42'),
(1107, 42, '2010-12-13 01:28:51'),
(1108, 44, '2010-12-13 01:31:32'),
(1109, 44, '2010-12-13 01:31:41'),
(1110, 44, '2010-12-13 01:31:53'),
(1111, 44, '2010-12-13 01:31:58'),
(1112, 44, '2010-12-13 01:32:18'),
(1113, 44, '2010-12-13 01:32:18'),
(1114, 44, '2010-12-13 01:42:58'),
(1115, 44, '2010-12-13 01:43:02'),
(1116, 44, '2010-12-13 01:56:23'),
(1117, 44, '2010-12-13 01:56:30'),
(1118, 44, '2010-12-13 01:56:50'),
(1119, 44, '2010-12-13 01:56:51'),
(1120, 45, '2010-12-13 01:57:10'),
(1121, 46, '2010-12-15 11:32:08'),
(1122, 46, '2010-12-15 11:38:30'),
(1123, 48, '2010-12-15 23:49:03'),
(1124, 47, '2010-12-15 23:49:03'),
(1125, 48, '2010-12-15 23:49:18'),
(1126, 48, '2010-12-15 23:49:20'),
(1127, 48, '2010-12-15 23:50:05'),
(1128, 48, '2010-12-15 23:50:06'),
(1129, 48, '2010-12-15 23:53:40'),
(1130, 48, '2010-12-15 23:53:44'),
(1131, 48, '2010-12-15 23:53:51'),
(1132, 48, '2010-12-15 23:53:53'),
(1133, 48, '2010-12-15 23:54:43'),
(1134, 48, '2010-12-15 23:54:43'),
(1135, 48, '2010-12-15 23:59:30'),
(1136, 48, '2010-12-15 23:59:43'),
(1137, 48, '2010-12-16 00:00:13'),
(1138, 48, '2010-12-16 00:00:13'),
(1139, 48, '2010-12-16 00:11:52'),
(1140, 48, '2010-12-16 00:12:01'),
(1141, 48, '2010-12-16 00:12:05'),
(1142, 48, '2010-12-16 00:13:13'),
(1143, 48, '2010-12-16 00:16:02'),
(1144, 48, '2010-12-16 00:17:14'),
(1145, 48, '2010-12-16 00:20:53'),
(1146, 49, '2010-12-18 13:49:37'),
(1147, 50, '2011-01-07 01:30:12'),
(1148, 50, '2011-01-07 01:30:23'),
(1149, 50, '2011-01-07 01:33:41'),
(1150, 50, '2011-01-07 01:40:20'),
(1151, 50, '2011-01-07 01:45:02'),
(1152, 50, '2011-01-07 01:45:05'),
(1153, 50, '2011-01-07 01:45:36'),
(1154, 50, '2011-01-07 01:48:42'),
(1155, 50, '2011-01-07 01:52:27'),
(1156, 51, '2011-01-17 20:11:32'),
(1157, 52, '2012-07-07 18:35:46'),
(1158, 52, '2012-07-07 18:35:52'),
(1159, 52, '2012-07-07 18:36:05'),
(1160, 52, '2012-07-07 18:36:12'),
(1161, 52, '2012-07-07 18:36:41'),
(1162, 52, '2012-07-07 18:36:43'),
(1163, 52, '2012-07-07 18:37:21'),
(1164, 52, '2012-07-07 18:37:24'),
(1165, 52, '2012-07-07 18:37:26'),
(1166, 52, '2012-07-07 18:37:34'),
(1167, 52, '2012-07-07 18:40:13'),
(1168, 52, '2012-07-07 18:40:51'),
(1169, 52, '2012-07-07 18:47:54'),
(1170, 52, '2012-07-07 18:47:58'),
(1171, 52, '2012-07-07 18:47:59');

-- --------------------------------------------------------

--
-- Table structure for table `log_url_info`
--

CREATE TABLE IF NOT EXISTS `log_url_info` (
  `url_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `referer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`url_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Detale information about url visit' AUTO_INCREMENT=1172 ;

--
-- Dumping data for table `log_url_info`
--

INSERT INTO `log_url_info` (`url_id`, `url`, `referer`) VALUES
(1, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/install/wizard/end/'),
(2, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/install/wizard/end/'),
(3, 'http://kapasoft.com/', ''),
(4, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/install/wizard/end/'),
(5, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/install/wizard/end/'),
(6, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/install/wizard/end/'),
(7, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/install/wizard/end/'),
(8, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/install/wizard/end/'),
(9, 'http://kapasoft.com/', ''),
(10, 'http://kapasoft.com/', ''),
(11, 'http://kapasoft.com/', ''),
(12, 'http://kapasoft.com/', ''),
(13, 'http://kapasoft.com/', ''),
(14, 'http://kapasoft.com/', ''),
(15, 'http://kapasoft.com/', ''),
(16, 'http://kapasoft.com/', ''),
(17, 'http://kapasoft.com/', ''),
(18, 'http://kapasoft.com/', ''),
(19, 'http://kapasoft.com/', ''),
(20, 'http://kapasoft.com/', ''),
(21, 'http://kapasoft.com/', ''),
(22, 'http://kapasoft.com/', ''),
(23, 'http://kapasoft.com/', ''),
(24, 'http://kapasoft.com/', ''),
(25, 'http://kapasoft.com/', ''),
(26, 'http://kapasoft.com/', ''),
(27, 'http://kapasoft.com/', ''),
(28, 'http://kapasoft.com/', ''),
(29, 'http://kapasoft.com/', ''),
(30, 'http://kapasoft.com/', ''),
(31, 'http://kapasoft.com/', ''),
(32, 'http://kapasoft.com/', ''),
(33, 'http://kapasoft.com/', ''),
(34, 'http://kapasoft.com/', ''),
(35, 'http://kapasoft.com/', ''),
(36, 'http://kapasoft.com/', ''),
(37, 'http://kapasoft.com/', ''),
(38, 'http://kapasoft.com/', ''),
(39, 'http://kapasoft.com/', ''),
(40, 'http://kapasoft.com/', ''),
(41, 'http://kapasoft.com/', ''),
(42, 'http://kapasoft.com/', ''),
(43, 'http://kapasoft.com/', ''),
(44, 'http://kapasoft.com/', ''),
(45, 'http://kapasoft.com/', ''),
(46, 'http://kapasoft.com/', ''),
(47, 'http://kapasoft.com/', ''),
(48, 'http://kapasoft.com/', ''),
(49, 'http://kapasoft.com/', ''),
(50, 'http://kapasoft.com/', ''),
(51, 'http://kapasoft.com/', ''),
(52, 'http://kapasoft.com/', ''),
(53, 'http://kapasoft.com/', ''),
(54, 'http://kapasoft.com/', ''),
(55, 'http://kapasoft.com/', ''),
(56, 'http://kapasoft.com/', ''),
(57, 'http://kapasoft.com/', ''),
(58, 'http://kapasoft.com/', ''),
(59, 'http://kapasoft.com/', ''),
(60, 'http://kapasoft.com/', ''),
(61, 'http://kapasoft.com/', ''),
(62, 'http://kapasoft.com/', ''),
(63, 'http://kapasoft.com/', ''),
(64, 'http://kapasoft.com/', ''),
(65, 'http://kapasoft.com/about-magento-demo-store', ''),
(66, 'http://kapasoft.com/', ''),
(67, 'http://kapasoft.com/', ''),
(68, 'http://kapasoft.com/about-magento-demo-store', ''),
(69, 'http://kapasoft.com/about-magento-demo-store', ''),
(70, 'http://kapasoft.com/about-magento-demo-store', ''),
(71, 'http://kapasoft.com/about-magento-demo-store', ''),
(72, 'http://kapasoft.com/about-magento-demo-store', ''),
(73, 'http://kapasoft.com/', ''),
(74, 'http://kapasoft.com/', ''),
(75, 'http://kapasoft.com/', ''),
(76, 'http://kapasoft.com/about-magento-demo-store', ''),
(77, 'http://kapasoft.com/about-magento-demo-store', ''),
(78, 'http://kapasoft.com/', ''),
(79, 'http://kapasoft.com/about-magento-demo-store', ''),
(80, 'http://kapasoft.com/about-magento-demo-store', ''),
(81, 'http://kapasoft.com/about-magento-demo-store', ''),
(82, 'http://kapasoft.com/', ''),
(83, 'http://kapasoft.com/about-magento-demo-store', ''),
(84, 'http://kapasoft.com/about-magento-demo-store', ''),
(85, 'http://kapasoft.com/', ''),
(86, 'http://kapasoft.com/about-magento-demo-store', ''),
(87, 'http://kapasoft.com/', ''),
(88, 'http://kapasoft.com/about-magento-demo-store', ''),
(89, 'http://kapasoft.com/', ''),
(90, 'http://kapasoft.com/about-magento-demo-store', ''),
(91, 'http://kapasoft.com/about-magento-demo-store', ''),
(92, 'http://kapasoft.com/', ''),
(93, 'http://kapasoft.com/about-magento-demo-store', ''),
(94, 'http://kapasoft.com/', ''),
(95, 'http://kapasoft.com/about-magento-demo-store', ''),
(96, 'http://kapasoft.com/', ''),
(97, 'http://kapasoft.com/about-magento-demo-store', ''),
(98, 'http://kapasoft.com/', ''),
(99, 'http://kapasoft.com/about-magento-demo-store', ''),
(100, 'http://kapasoft.com/about-magento-demo-store', ''),
(101, 'http://kapasoft.com/', ''),
(102, 'http://kapasoft.com/about-magento-demo-store', ''),
(103, 'http://kapasoft.com/about-magento-demo-store', ''),
(104, 'http://kapasoft.com/', ''),
(105, 'http://kapasoft.com/', ''),
(106, 'http://kapasoft.com/about-magento-demo-store', ''),
(107, 'http://kapasoft.com/about-magento-demo-store', ''),
(108, 'http://kapasoft.com/about-magento-demo-store', ''),
(109, 'http://kapasoft.com/', ''),
(110, 'http://kapasoft.com/about-magento-demo-store', ''),
(111, 'http://kapasoft.com/about-magento-demo-store', ''),
(112, 'http://kapasoft.com/', ''),
(113, 'http://kapasoft.com/about-magento-demo-store', ''),
(114, 'http://kapasoft.com/', ''),
(115, 'http://kapasoft.com/', ''),
(116, 'http://kapasoft.com/about-magento-demo-store', ''),
(117, 'http://kapasoft.com/', ''),
(118, 'http://kapasoft.com/', ''),
(119, 'http://kapasoft.com/about-magento-demo-store', ''),
(120, 'http://kapasoft.com/about-magento-demo-store', ''),
(121, 'http://kapasoft.com/', ''),
(122, 'http://kapasoft.com/', ''),
(123, 'http://kapasoft.com/about-magento-demo-store', ''),
(124, 'http://kapasoft.com/about-magento-demo-store', ''),
(125, 'http://kapasoft.com/', ''),
(126, 'http://kapasoft.com/', ''),
(127, 'http://kapasoft.com/', ''),
(128, 'http://kapasoft.com/', ''),
(129, 'http://kapasoft.com/', ''),
(130, 'http://kapasoft.com/', ''),
(131, 'http://kapasoft.com/', ''),
(132, 'http://kapasoft.com/', ''),
(133, 'http://kapasoft.com/', ''),
(134, 'http://kapasoft.com/', ''),
(135, 'http://kapasoft.com/', ''),
(136, 'http://kapasoft.com/', ''),
(137, 'http://kapasoft.com/', ''),
(138, 'http://kapasoft.com/', ''),
(139, 'http://kapasoft.com/', ''),
(140, 'http://kapasoft.com/', ''),
(141, 'http://kapasoft.com/', ''),
(142, 'http://kapasoft.com/', ''),
(143, 'http://kapasoft.com/', ''),
(144, 'http://kapasoft.com/', ''),
(145, 'http://kapasoft.com/', ''),
(146, 'http://kapasoft.com/', ''),
(147, 'http://kapasoft.com/', ''),
(148, 'http://kapasoft.com/', ''),
(149, 'http://kapasoft.com/', ''),
(150, 'http://kapasoft.com/', ''),
(151, 'http://kapasoft.com/', ''),
(152, 'http://kapasoft.com/', ''),
(153, 'http://kapasoft.com/', ''),
(154, 'http://kapasoft.com/', ''),
(155, 'http://kapasoft.com/', ''),
(156, 'http://kapasoft.com/', ''),
(157, 'http://kapasoft.com/', ''),
(158, 'http://kapasoft.com/', ''),
(159, 'http://kapasoft.com/', ''),
(160, 'http://kapasoft.com/', ''),
(161, 'http://kapasoft.com/', ''),
(162, 'http://kapasoft.com/', ''),
(163, 'http://kapasoft.com/', ''),
(164, 'http://kapasoft.com/', ''),
(165, 'http://kapasoft.com/', ''),
(166, 'http://kapasoft.com/', ''),
(167, 'http://kapasoft.com/', ''),
(168, 'http://kapasoft.com/', ''),
(169, 'http://kapasoft.com/', ''),
(170, 'http://kapasoft.com/', ''),
(171, 'http://kapasoft.com/', ''),
(172, 'http://kapasoft.com/', ''),
(173, 'http://kapasoft.com/', ''),
(174, 'http://kapasoft.com/', ''),
(175, 'http://kapasoft.com/', ''),
(176, 'http://kapasoft.com/', ''),
(177, 'http://kapasoft.com/', ''),
(178, 'http://kapasoft.com/', ''),
(179, 'http://kapasoft.com/', ''),
(180, 'http://kapasoft.com/', ''),
(181, 'http://kapasoft.com/', ''),
(182, 'http://kapasoft.com/', ''),
(183, 'http://kapasoft.com/', ''),
(184, 'http://kapasoft.com/', ''),
(185, 'http://kapasoft.com/', ''),
(186, 'http://kapasoft.com/', ''),
(187, 'http://kapasoft.com/', ''),
(188, 'http://kapasoft.com/', ''),
(189, 'http://kapasoft.com/', ''),
(190, 'http://kapasoft.com/', ''),
(191, 'http://kapasoft.com/', ''),
(192, 'http://kapasoft.com/', ''),
(193, 'http://kapasoft.com/', ''),
(194, 'http://kapasoft.com/', ''),
(195, 'http://kapasoft.com/', ''),
(196, 'http://kapasoft.com/', ''),
(197, 'http://kapasoft.com/', ''),
(198, 'http://kapasoft.com/', ''),
(199, 'http://kapasoft.com/', ''),
(200, 'http://kapasoft.com/', ''),
(201, 'http://kapasoft.com/', ''),
(202, 'http://kapasoft.com/about-magento-demo-store', ''),
(203, 'http://kapasoft.com/', ''),
(204, 'http://kapasoft.com/', ''),
(205, 'http://kapasoft.com/', ''),
(206, 'http://kapasoft.com/', ''),
(207, 'http://kapasoft.com/', ''),
(208, 'http://kapasoft.com/', ''),
(209, 'http://kapasoft.com/', ''),
(210, 'http://kapasoft.com/', ''),
(211, 'http://kapasoft.com/about-magento-demo-store', ''),
(212, 'http://kapasoft.com/', ''),
(213, 'http://kapasoft.com/', ''),
(214, 'http://kapasoft.com/', ''),
(215, 'http://kapasoft.com/', ''),
(216, 'http://kapasoft.com/', ''),
(217, 'http://kapasoft.com/', ''),
(218, 'http://kapasoft.com/', ''),
(219, 'http://kapasoft.com/', ''),
(220, 'http://kapasoft.com/', ''),
(221, 'http://kapasoft.com/', ''),
(222, 'http://kapasoft.com/', ''),
(223, 'http://kapasoft.com/', ''),
(224, 'http://kapasoft.com/about-magento-demo-store', ''),
(225, 'http://kapasoft.com/', ''),
(226, 'http://kapasoft.com/', ''),
(227, 'http://kapasoft.com/', ''),
(228, 'http://kapasoft.com/', ''),
(229, 'http://kapasoft.com/', ''),
(230, 'http://kapasoft.com/', ''),
(231, 'http://kapasoft.com/', ''),
(232, 'http://kapasoft.com/about-magento-demo-store', ''),
(233, 'http://kapasoft.com/', ''),
(234, 'http://kapasoft.com/', ''),
(235, 'http://kapasoft.com/', ''),
(236, 'http://kapasoft.com/', ''),
(237, 'http://kapasoft.com/', ''),
(238, 'http://kapasoft.com/', ''),
(239, 'http://kapasoft.com/', ''),
(240, 'http://kapasoft.com/', ''),
(241, 'http://kapasoft.com/', ''),
(242, 'http://kapasoft.com/', ''),
(243, 'http://kapasoft.com/', ''),
(244, 'http://kapasoft.com/', ''),
(245, 'http://kapasoft.com/', ''),
(246, 'http://kapasoft.com/', ''),
(247, 'http://kapasoft.com/', ''),
(248, 'http://kapasoft.com/', ''),
(249, 'http://kapasoft.com/', ''),
(250, 'http://kapasoft.com/', ''),
(251, 'http://kapasoft.com/', ''),
(252, 'http://kapasoft.com/', ''),
(253, 'http://kapasoft.com/', ''),
(254, 'http://kapasoft.com/', ''),
(255, 'http://kapasoft.com/', ''),
(256, 'http://kapasoft.com/', ''),
(257, 'http://kapasoft.com/', ''),
(258, 'http://kapasoft.com/', ''),
(259, 'http://kapasoft.com/', ''),
(260, 'http://kapasoft.com/', ''),
(261, 'http://kapasoft.com/', ''),
(262, 'http://kapasoft.com/', ''),
(263, 'http://kapasoft.com/', ''),
(264, 'http://kapasoft.com/', ''),
(265, 'http://kapasoft.com/', ''),
(266, 'http://kapasoft.com/', ''),
(267, 'http://kapasoft.com/', ''),
(268, 'http://kapasoft.com/', ''),
(269, 'http://kapasoft.com/', ''),
(270, 'http://kapasoft.com/', ''),
(271, 'http://kapasoft.com/', ''),
(272, 'http://kapasoft.com/', ''),
(273, 'http://kapasoft.com/', ''),
(274, 'http://kapasoft.com/', ''),
(275, 'http://kapasoft.com/', ''),
(276, 'http://kapasoft.com/', ''),
(277, 'http://kapasoft.com/', ''),
(278, 'http://kapasoft.com/', ''),
(279, 'http://kapasoft.com/', ''),
(280, 'http://kapasoft.com/', ''),
(281, 'http://kapasoft.com/', ''),
(282, 'http://kapasoft.com/', ''),
(283, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/'),
(284, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/'),
(285, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(286, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/'),
(287, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(288, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(289, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(290, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(291, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(292, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(293, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(294, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(295, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(296, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(297, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(298, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(299, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(300, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(301, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(302, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(303, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(304, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(305, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(306, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(307, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(308, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(309, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(310, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(311, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(312, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(313, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(314, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(315, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(316, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(317, 'http://kapasoft.com/index.php/', ''),
(318, 'http://kapasoft.com/index.php/', ''),
(319, 'http://kapasoft.com/index.php/', ''),
(320, 'http://kapasoft.com/index.php/', ''),
(321, 'http://kapasoft.com/index.php/', ''),
(322, 'http://kapasoft.com/index.php/', ''),
(323, 'http://kapasoft.com/index.php/', ''),
(324, 'http://kapasoft.com/index.php/', ''),
(325, 'http://kapasoft.com/index.php/', ''),
(326, 'http://kapasoft.com/index.php/', ''),
(327, 'http://kapasoft.com/index.php/', ''),
(328, 'http://kapasoft.com/index.php/', ''),
(329, 'http://kapasoft.com/index.php/', ''),
(330, 'http://kapasoft.com/index.php/', ''),
(331, 'http://kapasoft.com/index.php/', ''),
(332, 'http://kapasoft.com/index.php/', ''),
(333, 'http://kapasoft.com/index.php/', ''),
(334, 'http://kapasoft.com/index.php/', ''),
(335, 'http://kapasoft.com/index.php/', ''),
(336, 'http://kapasoft.com/index.php/', ''),
(337, 'http://kapasoft.com/index.php/', ''),
(338, 'http://kapasoft.com/index.php/', ''),
(339, 'http://kapasoft.com/index.php/', ''),
(340, 'http://kapasoft.com/index.php/', ''),
(341, 'http://kapasoft.com/index.php/', ''),
(342, 'http://kapasoft.com/index.php/', ''),
(343, 'http://kapasoft.com/index.php/', ''),
(344, 'http://kapasoft.com/index.php/', ''),
(345, 'http://kapasoft.com/index.php/', ''),
(346, 'http://kapasoft.com/index.php/', ''),
(347, 'http://kapasoft.com/index.php/', ''),
(348, 'http://kapasoft.com/index.php/', ''),
(349, 'http://kapasoft.com/index.php/', ''),
(350, 'http://kapasoft.com/index.php/', ''),
(351, 'http://kapasoft.com/index.php/', ''),
(352, 'http://kapasoft.com/index.php/', ''),
(353, 'http://kapasoft.com/index.php/', ''),
(354, 'http://kapasoft.com/index.php/', ''),
(355, 'http://kapasoft.com/index.php/', ''),
(356, 'http://kapasoft.com/index.php/', ''),
(357, 'http://kapasoft.com/index.php/', ''),
(358, 'http://kapasoft.com/index.php/', ''),
(359, 'http://kapasoft.com/index.php/', ''),
(360, 'http://kapasoft.com/index.php/', ''),
(361, 'http://kapasoft.com/index.php/', ''),
(362, 'http://kapasoft.com/index.php/', ''),
(363, 'http://kapasoft.com/index.php/', ''),
(364, 'http://kapasoft.com/index.php/', ''),
(365, 'http://kapasoft.com/index.php/', ''),
(366, 'http://kapasoft.com/index.php/', ''),
(367, 'http://kapasoft.com/index.php/', ''),
(368, 'http://kapasoft.com/index.php/', ''),
(369, 'http://kapasoft.com/index.php/', ''),
(370, 'http://kapasoft.com/index.php/', ''),
(371, 'http://kapasoft.com/index.php/', ''),
(372, 'http://kapasoft.com/index.php/', ''),
(373, 'http://kapasoft.com/index.php/', ''),
(374, 'http://kapasoft.com/index.php/', ''),
(375, 'http://kapasoft.com/index.php/', ''),
(376, 'http://kapasoft.com/index.php/', ''),
(377, 'http://kapasoft.com/index.php/', ''),
(378, 'http://kapasoft.com/index.php/', ''),
(379, 'http://kapasoft.com/index.php/', ''),
(380, 'http://kapasoft.com/', ''),
(381, 'http://kapasoft.com/index.php/', ''),
(382, 'http://kapasoft.com/index.php/', ''),
(383, 'http://kapasoft.com/index.php/', ''),
(384, 'http://kapasoft.com/index.php/', ''),
(385, 'http://kapasoft.com/index.php/', ''),
(386, 'http://kapasoft.com/index.php/', ''),
(387, 'http://kapasoft.com/index.php/', ''),
(388, 'http://kapasoft.com/index.php/', ''),
(389, 'http://kapasoft.com/index.php/', ''),
(390, 'http://kapasoft.com/index.php/', ''),
(391, 'http://kapasoft.com/index.php/', ''),
(392, 'http://kapasoft.com/index.php/', ''),
(393, 'http://kapasoft.com/index.php/', ''),
(394, 'http://kapasoft.com/index.php/', ''),
(395, 'http://kapasoft.com/index.php/', ''),
(396, 'http://kapasoft.com/index.php/', ''),
(397, 'http://kapasoft.com/index.php/', ''),
(398, 'http://kapasoft.com/index.php/', ''),
(399, 'http://kapasoft.com/index.php/', ''),
(400, 'http://kapasoft.com/index.php/', ''),
(401, 'http://kapasoft.com/index.php/', ''),
(402, 'http://kapasoft.com/index.php/', ''),
(403, 'http://kapasoft.com/index.php/', ''),
(404, 'http://kapasoft.com/index.php/', ''),
(405, 'http://kapasoft.com/index.php/', ''),
(406, 'http://kapasoft.com/index.php/', ''),
(407, 'http://kapasoft.com/index.php/', ''),
(408, 'http://kapasoft.com/index.php/', ''),
(409, 'http://kapasoft.com/index.php/', ''),
(410, 'http://kapasoft.com/index.php/', ''),
(411, 'http://kapasoft.com/index.php/', ''),
(412, 'http://kapasoft.com/index.php/', ''),
(413, 'http://kapasoft.com/index.php/', ''),
(414, 'http://kapasoft.com/index.php/', ''),
(415, 'http://kapasoft.com/index.php/', ''),
(416, 'http://kapasoft.com/index.php/', ''),
(417, 'http://kapasoft.com/index.php/', ''),
(418, 'http://kapasoft.com/index.php/', ''),
(419, 'http://kapasoft.com/index.php/', ''),
(420, 'http://kapasoft.com/index.php/', ''),
(421, 'http://kapasoft.com/index.php/', ''),
(422, 'http://kapasoft.com/index.php/', ''),
(423, 'http://kapasoft.com/index.php/', ''),
(424, 'http://kapasoft.com/index.php/', ''),
(425, 'http://kapasoft.com/index.php/', ''),
(426, 'http://kapasoft.com/index.php/', ''),
(427, 'http://kapasoft.com/index.php/', ''),
(428, 'http://kapasoft.com/index.php/', ''),
(429, 'http://kapasoft.com/index.php/', ''),
(430, 'http://kapasoft.com/index.php/', ''),
(431, 'http://kapasoft.com/index.php/', ''),
(432, 'http://kapasoft.com/', ''),
(433, 'http://kapasoft.com/index.php/', ''),
(434, 'http://kapasoft.com/index.php/', ''),
(435, 'http://kapasoft.com/index.php/', ''),
(436, 'http://kapasoft.com/index.php/', ''),
(437, 'http://kapasoft.com/index.php/', ''),
(438, 'http://kapasoft.com/index.php/', ''),
(439, 'http://kapasoft.com/index.php/', ''),
(440, 'http://kapasoft.com/index.php/', ''),
(441, 'http://kapasoft.com/index.php/', ''),
(442, 'http://kapasoft.com/index.php/', ''),
(443, 'http://kapasoft.com/index.php/', ''),
(444, 'http://kapasoft.com/index.php/', ''),
(445, 'http://kapasoft.com/index.php/', ''),
(446, 'http://kapasoft.com/index.php/', ''),
(447, 'http://kapasoft.com/index.php/', ''),
(448, 'http://kapasoft.com/index.php/', ''),
(449, 'http://kapasoft.com/index.php/', ''),
(450, 'http://kapasoft.com/index.php/', ''),
(451, 'http://kapasoft.com/index.php/', ''),
(452, 'http://kapasoft.com/index.php/', ''),
(453, 'http://kapasoft.com/index.php/', ''),
(454, 'http://kapasoft.com/index.php/', ''),
(455, 'http://kapasoft.com/index.php/', ''),
(456, 'http://kapasoft.com/index.php/', ''),
(457, 'http://kapasoft.com/index.php/', ''),
(458, 'http://kapasoft.com/index.php/', ''),
(459, 'http://kapasoft.com/index.php/', ''),
(460, 'http://kapasoft.com/index.php/', ''),
(461, 'http://kapasoft.com/index.php/', ''),
(462, 'http://kapasoft.com/index.php/', ''),
(463, 'http://kapasoft.com/index.php/', ''),
(464, 'http://kapasoft.com/index.php/', ''),
(465, 'http://kapasoft.com/index.php/', ''),
(466, 'http://kapasoft.com/index.php/', ''),
(467, 'http://kapasoft.com/index.php/', ''),
(468, 'http://kapasoft.com/index.php/', ''),
(469, 'http://kapasoft.com/index.php/', ''),
(470, 'http://kapasoft.com/index.php/', ''),
(471, 'http://kapasoft.com/index.php/', ''),
(472, 'http://kapasoft.com/index.php/', ''),
(473, 'http://kapasoft.com/index.php/', ''),
(474, 'http://kapasoft.com/index.php/catalog/seo_sitemap/category/', 'http://kapasoft.com/index.php/'),
(475, 'http://kapasoft.com/index.php/', ''),
(476, 'http://kapasoft.com/index.php/', ''),
(477, 'http://kapasoft.com/index.php/', ''),
(478, 'http://kapasoft.com/index.php/', ''),
(479, 'http://kapasoft.com/index.php/', ''),
(480, 'http://kapasoft.com/index.php/', ''),
(481, 'http://kapasoft.com/index.php/', ''),
(482, 'http://kapasoft.com/index.php/', ''),
(483, 'http://kapasoft.com/index.php/', ''),
(484, 'http://kapasoft.com/index.php/', ''),
(485, 'http://kapasoft.com/index.php/', ''),
(486, 'http://kapasoft.com/index.php/', ''),
(487, 'http://kapasoft.com/index.php/', ''),
(488, 'http://kapasoft.com/index.php/', ''),
(489, 'http://kapasoft.com/index.php/', ''),
(490, 'http://kapasoft.com/index.php/', ''),
(491, 'http://kapasoft.com/index.php/', ''),
(492, 'http://kapasoft.com/index.php/', ''),
(493, 'http://kapasoft.com/index.php/', ''),
(494, 'http://kapasoft.com/index.php/', ''),
(495, 'http://kapasoft.com/index.php/', ''),
(496, 'http://kapasoft.com/index.php/', ''),
(497, 'http://kapasoft.com/index.php/', ''),
(498, 'http://kapasoft.com/index.php/', ''),
(499, 'http://kapasoft.com/index.php/', ''),
(500, 'http://kapasoft.com/index.php/', ''),
(501, 'http://kapasoft.com/index.php/', ''),
(502, 'http://kapasoft.com/index.php/', ''),
(503, 'http://kapasoft.com/index.php/', ''),
(504, 'http://kapasoft.com/index.php/', ''),
(505, 'http://kapasoft.com/index.php/', ''),
(506, 'http://kapasoft.com/index.php/', ''),
(507, 'http://kapasoft.com/index.php/', ''),
(508, 'http://kapasoft.com/index.php/', ''),
(509, 'http://kapasoft.com/index.php/', ''),
(510, 'http://kapasoft.com/index.php/', ''),
(511, 'http://kapasoft.com/index.php/', ''),
(512, 'http://kapasoft.com/index.php/', ''),
(513, 'http://kapasoft.com/index.php/', ''),
(514, 'http://kapasoft.com/index.php/', ''),
(515, 'http://kapasoft.com/index.php/', ''),
(516, 'http://kapasoft.com/index.php/', ''),
(517, 'http://kapasoft.com/index.php/', ''),
(518, 'http://kapasoft.com/index.php/', ''),
(519, 'http://kapasoft.com/index.php/', ''),
(520, 'http://kapasoft.com/index.php/', ''),
(521, 'http://kapasoft.com/index.php/', ''),
(522, 'http://kapasoft.com/index.php/', ''),
(523, 'http://kapasoft.com/index.php/', ''),
(524, 'http://kapasoft.com/index.php/', ''),
(525, 'http://kapasoft.com/index.php/', ''),
(526, 'http://kapasoft.com/index.php/', ''),
(527, 'http://kapasoft.com/index.php/', ''),
(528, 'http://kapasoft.com/index.php/', ''),
(529, 'http://kapasoft.com/index.php/', ''),
(530, 'http://kapasoft.com/index.php/', ''),
(531, 'http://kapasoft.com/index.php/', ''),
(532, 'http://kapasoft.com/index.php/', ''),
(533, 'http://kapasoft.com/index.php/', ''),
(534, 'http://kapasoft.com/index.php/', ''),
(535, 'http://kapasoft.com/index.php/', ''),
(536, 'http://kapasoft.com/index.php/', ''),
(537, 'http://kapasoft.com/index.php/', ''),
(538, 'http://kapasoft.com/index.php/', ''),
(539, 'http://kapasoft.com/index.php/', ''),
(540, 'http://kapasoft.com/index.php/', ''),
(541, 'http://kapasoft.com/index.php/', ''),
(542, 'http://kapasoft.com/index.php/', ''),
(543, 'http://kapasoft.com/index.php/', ''),
(544, 'http://kapasoft.com/index.php/', ''),
(545, 'http://kapasoft.com/index.php/', ''),
(546, 'http://kapasoft.com/index.php/', ''),
(547, 'http://kapasoft.com/index.php/', ''),
(548, 'http://kapasoft.com/index.php/', ''),
(549, 'http://kapasoft.com/index.php/', ''),
(550, 'http://kapasoft.com/index.php/', ''),
(551, 'http://kapasoft.com/index.php/', ''),
(552, 'http://kapasoft.com/index.php/', ''),
(553, 'http://kapasoft.com/index.php/', ''),
(554, 'http://kapasoft.com/index.php/', ''),
(555, 'http://kapasoft.com/index.php/', ''),
(556, 'http://kapasoft.com/index.php/', ''),
(557, 'http://kapasoft.com/index.php/', ''),
(558, 'http://kapasoft.com/index.php/', ''),
(559, 'http://kapasoft.com/index.php/', ''),
(560, 'http://kapasoft.com/index.php/', ''),
(561, 'http://kapasoft.com/index.php/', ''),
(562, 'http://kapasoft.com/index.php/', ''),
(563, 'http://kapasoft.com/index.php/', ''),
(564, 'http://kapasoft.com/index.php/', ''),
(565, 'http://kapasoft.com/index.php/', ''),
(566, 'http://kapasoft.com/index.php/', ''),
(567, 'http://kapasoft.com/index.php/', ''),
(568, 'http://kapasoft.com/index.php/', ''),
(569, 'http://kapasoft.com/index.php/', ''),
(570, 'http://kapasoft.com/index.php/', ''),
(571, 'http://kapasoft.com/index.php/', ''),
(572, 'http://kapasoft.com/index.php/', ''),
(573, 'http://kapasoft.com/index.php/', ''),
(574, 'http://kapasoft.com/index.php/', ''),
(575, 'http://kapasoft.com/index.php/', ''),
(576, 'http://kapasoft.com/index.php/', ''),
(577, 'http://kapasoft.com/index.php/', ''),
(578, 'http://kapasoft.com/index.php/', ''),
(579, 'http://kapasoft.com/index.php/', ''),
(580, 'http://kapasoft.com/index.php/', ''),
(581, 'http://kapasoft.com/index.php/', ''),
(582, 'http://kapasoft.com/index.php/', ''),
(583, 'http://kapasoft.com/index.php/', ''),
(584, 'http://kapasoft.com/index.php/', ''),
(585, 'http://kapasoft.com/index.php/', ''),
(586, 'http://kapasoft.com/index.php/', ''),
(587, 'http://kapasoft.com/index.php/', ''),
(588, 'http://kapasoft.com/index.php/', ''),
(589, 'http://kapasoft.com/index.php/', ''),
(590, 'http://kapasoft.com/index.php/', ''),
(591, 'http://kapasoft.com/index.php/', ''),
(592, 'http://kapasoft.com/index.php/', ''),
(593, 'http://kapasoft.com/index.php/', ''),
(594, 'http://kapasoft.com/index.php/', ''),
(595, 'http://kapasoft.com/index.php/', ''),
(596, 'http://kapasoft.com/index.php/', ''),
(597, 'http://kapasoft.com/index.php/', ''),
(598, 'http://kapasoft.com/index.php/', ''),
(599, 'http://kapasoft.com/index.php/', ''),
(600, 'http://kapasoft.com/index.php/', ''),
(601, 'http://kapasoft.com/index.php/', ''),
(602, 'http://kapasoft.com/index.php/', ''),
(603, 'http://kapasoft.com/index.php/', ''),
(604, 'http://kapasoft.com/index.php/', ''),
(605, 'http://kapasoft.com/index.php/', ''),
(606, 'http://kapasoft.com/index.php/', ''),
(607, 'http://kapasoft.com/index.php/', ''),
(608, 'http://kapasoft.com/index.php/', ''),
(609, 'http://kapasoft.com/index.php/', ''),
(610, 'http://kapasoft.com/index.php/', ''),
(611, 'http://kapasoft.com/index.php/', ''),
(612, 'http://kapasoft.com/index.php/', ''),
(613, 'http://kapasoft.com/index.php/', ''),
(614, 'http://kapasoft.com/index.php/', ''),
(615, 'http://kapasoft.com/index.php/', ''),
(616, 'http://kapasoft.com/index.php/', ''),
(617, 'http://kapasoft.com/index.php/', ''),
(618, 'http://kapasoft.com/index.php/', ''),
(619, 'http://kapasoft.com/index.php/', ''),
(620, 'http://kapasoft.com/index.php/', ''),
(621, 'http://kapasoft.com/index.php/', ''),
(622, 'http://kapasoft.com/index.php/', ''),
(623, 'http://kapasoft.com/index.php/', ''),
(624, 'http://kapasoft.com/index.php/', ''),
(625, 'http://kapasoft.com/index.php/', ''),
(626, 'http://kapasoft.com/index.php/', ''),
(627, 'http://kapasoft.com/index.php/', ''),
(628, 'http://kapasoft.com/index.php/', ''),
(629, 'http://kapasoft.com/index.php/', ''),
(630, 'http://kapasoft.com/index.php/', ''),
(631, 'http://kapasoft.com/index.php/', ''),
(632, 'http://kapasoft.com/index.php/', ''),
(633, 'http://kapasoft.com/index.php/', ''),
(634, 'http://kapasoft.com/index.php/', ''),
(635, 'http://kapasoft.com/index.php/', ''),
(636, 'http://kapasoft.com/index.php/', ''),
(637, 'http://kapasoft.com/index.php/', ''),
(638, 'http://kapasoft.com/index.php/', ''),
(639, 'http://kapasoft.com/index.php/', ''),
(640, 'http://kapasoft.com/index.php/', ''),
(641, 'http://kapasoft.com/index.php/', ''),
(642, 'http://kapasoft.com/index.php/', ''),
(643, 'http://kapasoft.com/index.php/', ''),
(644, 'http://kapasoft.com/index.php/', ''),
(645, 'http://kapasoft.com/index.php/', ''),
(646, 'http://kapasoft.com/index.php/', ''),
(647, 'http://kapasoft.com/index.php/', ''),
(648, 'http://kapasoft.com/index.php/', ''),
(649, 'http://kapasoft.com/index.php/', ''),
(650, 'http://kapasoft.com/index.php/', ''),
(651, 'http://kapasoft.com/index.php/', ''),
(652, 'http://kapasoft.com/index.php/', ''),
(653, 'http://kapasoft.com/index.php/', ''),
(654, 'http://kapasoft.com/index.php/', ''),
(655, 'http://kapasoft.com/index.php/', ''),
(656, 'http://kapasoft.com/index.php/', ''),
(657, 'http://kapasoft.com/index.php/', ''),
(658, 'http://kapasoft.com/index.php/', ''),
(659, 'http://kapasoft.com/index.php/', ''),
(660, 'http://kapasoft.com/index.php/', ''),
(661, 'http://kapasoft.com/index.php/', ''),
(662, 'http://kapasoft.com/index.php/', ''),
(663, 'http://kapasoft.com/index.php/', ''),
(664, 'http://kapasoft.com/index.php/', ''),
(665, 'http://kapasoft.com/index.php/', ''),
(666, 'http://kapasoft.com/index.php/', ''),
(667, 'http://kapasoft.com/index.php/', ''),
(668, 'http://kapasoft.com/index.php/', ''),
(669, 'http://kapasoft.com/index.php/', ''),
(670, 'http://kapasoft.com/index.php/', ''),
(671, 'http://kapasoft.com/index.php/', ''),
(672, 'http://kapasoft.com/index.php/', ''),
(673, 'http://kapasoft.com/index.php/', ''),
(674, 'http://kapasoft.com/index.php/', ''),
(675, 'http://kapasoft.com/index.php/', ''),
(676, 'http://kapasoft.com/index.php/', ''),
(677, 'http://kapasoft.com/index.php/', ''),
(678, 'http://kapasoft.com/index.php/', ''),
(679, 'http://kapasoft.com/index.php/', ''),
(680, 'http://kapasoft.com/index.php/', ''),
(681, 'http://kapasoft.com/index.php/', ''),
(682, 'http://kapasoft.com/index.php/', ''),
(683, 'http://kapasoft.com/index.php/', ''),
(684, 'http://kapasoft.com/index.php/', ''),
(685, 'http://kapasoft.com/index.php/', ''),
(686, 'http://kapasoft.com/index.php/', ''),
(687, 'http://kapasoft.com/index.php/', ''),
(688, 'http://kapasoft.com/about-magento-demo-store', ''),
(689, 'http://kapasoft.com/about-magento-demo-store', ''),
(690, 'http://kapasoft.com/about-magento-demo-store', ''),
(691, 'http://kapasoft.com/about-magento-demo-store', ''),
(692, 'http://kapasoft.com/about-magento-demo-store', ''),
(693, 'http://kapasoft.com/about-magento-demo-store', ''),
(694, 'http://kapasoft.com/about-magento-demo-store', ''),
(695, 'http://kapasoft.com/about-magento-demo-store', ''),
(696, 'http://kapasoft.com/about-magento-demo-store', ''),
(697, 'http://kapasoft.com/about-magento-demo-store', ''),
(698, 'http://kapasoft.com/about-magento-demo-store', ''),
(699, 'http://kapasoft.com/about-magento-demo-store', ''),
(700, 'http://kapasoft.com/about-magento-demo-store', ''),
(701, 'http://kapasoft.com/about-magento-demo-store', ''),
(702, 'http://kapasoft.com/about-magento-demo-store', ''),
(703, 'http://kapasoft.com/about-magento-demo-store', ''),
(704, 'http://kapasoft.com/about-magento-demo-store', ''),
(705, 'http://kapasoft.com/about-magento-demo-store', ''),
(706, 'http://kapasoft.com/about-magento-demo-store', ''),
(707, 'http://kapasoft.com/about-magento-demo-store', ''),
(708, 'http://kapasoft.com/about-magento-demo-store', ''),
(709, 'http://kapasoft.com/about-magento-demo-store', ''),
(710, 'http://kapasoft.com/about-magento-demo-store', ''),
(711, 'http://kapasoft.com/about-magento-demo-store', ''),
(712, 'http://kapasoft.com/about-magento-demo-store', ''),
(713, 'http://kapasoft.com/about-magento-demo-store', ''),
(714, 'http://kapasoft.com/about-magento-demo-store', ''),
(715, 'http://kapasoft.com/about-magento-demo-store', ''),
(716, 'http://kapasoft.com/about-magento-demo-store', ''),
(717, 'http://kapasoft.com/about-magento-demo-store', ''),
(718, 'http://kapasoft.com/about-magento-demo-store', ''),
(719, 'http://kapasoft.com/about-magento-demo-store', ''),
(720, 'http://kapasoft.com/', ''),
(721, 'http://kapasoft.com/about-magento-demo-store', ''),
(722, 'http://kapasoft.com/', ''),
(723, 'http://kapasoft.com/', ''),
(724, 'http://kapasoft.com/', ''),
(725, 'http://kapasoft.com/about-magento-demo-store', ''),
(726, 'http://kapasoft.com/', ''),
(727, 'http://kapasoft.com/about-magento-demo-store', ''),
(728, 'http://kapasoft.com/about-magento-demo-store', ''),
(729, 'http://kapasoft.com/about-magento-demo-store', ''),
(730, 'http://kapasoft.com/about-magento-demo-store', ''),
(731, 'http://kapasoft.com/about-magento-demo-store', ''),
(732, 'http://kapasoft.com/about-magento-demo-store', ''),
(733, 'http://kapasoft.com/about-magento-demo-store', ''),
(734, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/about-magento-demo-store'),
(735, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/about-magento-demo-store'),
(736, 'http://kapasoft.com/about-magento-demo-store', ''),
(737, 'http://kapasoft.com/about-magento-demo-store', ''),
(738, 'http://kapasoft.com/about-magento-demo-store', ''),
(739, 'http://kapasoft.com/', ''),
(740, 'http://kapasoft.com/about-magento-demo-store', ''),
(741, 'http://kapasoft.com/about-magento-demo-store', ''),
(742, 'http://kapasoft.com/about-magento-demo-store', ''),
(743, 'http://kapasoft.com/', ''),
(744, 'http://kapasoft.com/about-magento-demo-store', ''),
(745, 'http://kapasoft.com/', ''),
(746, 'http://kapasoft.com/about-magento-demo-store', ''),
(747, 'http://kapasoft.com/about-magento-demo-store', ''),
(748, 'http://kapasoft.com/about-magento-demo-store', ''),
(749, 'http://kapasoft.com/', ''),
(750, 'http://kapasoft.com/', ''),
(751, 'http://kapasoft.com/about-magento-demo-store', ''),
(752, 'http://kapasoft.com/', ''),
(753, 'http://kapasoft.com/about-magento-demo-store', ''),
(754, 'http://kapasoft.com/', ''),
(755, 'http://kapasoft.com/', ''),
(756, 'http://kapasoft.com/', ''),
(757, 'http://kapasoft.com/', ''),
(758, 'http://kapasoft.com/about-magento-demo-store', ''),
(759, 'http://kapasoft.com/index.php/', ''),
(760, 'http://kapasoft.com/index.php/', ''),
(761, 'http://kapasoft.com/index.php/', ''),
(762, 'http://kapasoft.com/index.php/', ''),
(763, 'http://kapasoft.com/index.php/', ''),
(764, 'http://kapasoft.com/index.php/', ''),
(765, 'http://kapasoft.com/', ''),
(766, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(767, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(768, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(769, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(770, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(771, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(772, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(773, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(774, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(775, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(776, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(777, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(778, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(779, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(780, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(781, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(782, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(783, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(784, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(785, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(786, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(787, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(788, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(789, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/'),
(790, 'http://kapasoft.com/about-magento-demo-store', ''),
(791, 'http://kapasoft.com/about-magento-demo-store', ''),
(792, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/about-magento-demo-store'),
(793, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/about-magento-demo-store'),
(794, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/about-magento-demo-store'),
(795, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/about-magento-demo-store'),
(796, 'http://kapasoft.com/about-magento-demo-store', ''),
(797, 'http://kapasoft.com/about-magento-demo-store', ''),
(798, 'http://kapasoft.com/about-magento-demo-store', ''),
(799, 'http://kapasoft.com/about-magento-demo-store', ''),
(800, 'http://kapasoft.com/about-magento-demo-store', ''),
(801, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/about-magento-demo-store'),
(802, 'http://kapasoft.com/about-magento-demo-store', ''),
(803, 'http://kapasoft.com/about-magento-demo-store', ''),
(804, 'http://kapasoft.com/about-magento-demo-store', ''),
(805, 'http://kapasoft.com/about-magento-demo-store', ''),
(806, 'http://kapasoft.com/about-magento-demo-store', ''),
(807, 'http://kapasoft.com/about-magento-demo-store', ''),
(808, 'http://kapasoft.com/about-magento-demo-store', ''),
(809, 'http://kapasoft.com/', ''),
(810, 'http://kapasoft.com/about-magento-demo-store', ''),
(811, 'http://kapasoft.com/about-magento-demo-store', ''),
(812, 'http://kapasoft.com/about-magento-demo-store', ''),
(813, 'http://kapasoft.com/about-magento-demo-store', ''),
(814, 'http://kapasoft.com/', ''),
(815, 'http://kapasoft.com/', ''),
(816, 'http://kapasoft.com/index.php/what-is-kapasoft-web-design?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(817, 'http://kapasoft.com/index.php/what-is-kapasoft-web-design?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(818, 'http://kapasoft.com/index.php/why-Kapasoft-web-design-online-stores?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(819, 'http://kapasoft.com/index.php/why-Kapasoft-web-design-online-stores?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(820, 'http://kapasoft.com/index.php/why-Kapasoft-web-design-online-stores?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(821, 'http://kapasoft.com/index.php/why-Kapasoft-web-design-online-stores?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(822, 'http://kapasoft.com/index.php/why-Kapasoft-web-design-online-stores?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(823, 'http://kapasoft.com/index.php/what-others-say-kapasoft-web-design?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(824, 'http://kapasoft.com/index.php/contact-kapasoft-web-design?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(825, 'http://kapasoft.com/index.php/contact-kapasoft-web-design?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(826, 'http://kapasoft.com/index.php/no-route?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(827, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/no-route?___store=default'),
(828, 'http://kapasoft.com/index.php/no-route?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(829, 'http://kapasoft.com/index.php/no-route?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(830, 'http://kapasoft.com/index.php/no-route?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(831, 'http://kapasoft.com/index.php/no-route?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(832, 'http://kapasoft.com/index.php/no-route?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(833, 'http://kapasoft.com/index.php/no-route?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(834, 'http://kapasoft.com/index.php/no-route?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(835, 'http://kapasoft.com/index.php/no-route?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(836, 'http://kapasoft.com/index.php/no-route?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(837, 'http://kapasoft.com/index.php/no-route?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(838, 'http://kapasoft.com/index.php/', 'http://kapasoft.com/index.php/no-route?___store=default'),
(839, 'http://kapasoft.com/index.php/developing-kapasoft-web-design-for-client?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(840, 'http://kapasoft.com/index.php/developing-kapasoft-web-design-for-client?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(841, 'http://kapasoft.com/index.php/get-quote-from-KapaSoft-web-design?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(842, 'http://kapasoft.com/index.php/kapasoft-web-design-portfolio?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(843, 'http://kapasoft.com/index.php/kapasoft-web-design-portfolio?___store=default', ''),
(844, 'http://kapasoft.com/index.php/kapasoft-web-design-portfolio?___store=default', ''),
(845, 'http://kapasoft.com/index.php/how-can-kapasoft-web-design-help?___store=default', 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/'),
(846, 'http://kapasoft.com/index.php/how-can-kapasoft-web-design-help', ''),
(847, 'http://kapasoft.com/index.php/how-can-kapasoft-web-design-help', ''),
(848, 'http://kapasoft.com/index.php/index.php/how-can-kapasoft-web-design-help', 'http://kapasoft.com/index.php/how-can-kapasoft-web-design-help'),
(849, 'http://kapasoft.com/index.php/index.php/how-can-kapasoft-web-design-help', 'http://kapasoft.com/index.php/how-can-kapasoft-web-design-help'),
(850, 'http://kapasoft.com/index.php/index.php/how-can-kapasoft-web-design-help', 'http://kapasoft.com/index.php/index.php/how-can-kapasoft-web-design-help'),
(851, 'http://kapasoft.com/index.php/index.php/how-can-kapasoft-web-design-help', 'http://kapasoft.com/index.php/index.php/how-can-kapasoft-web-design-help'),
(852, 'http://kapasoft.com/index.php/index.php/how-can-kapasoft-web-design-help', 'http://kapasoft.com/index.php/index.php/how-can-kapasoft-web-design-help'),
(853, 'http://kapasoft.com/', ''),
(854, 'http://kapasoft.com/how-can-kapasoft-web-design-help', 'http://kapasoft.com/'),
(855, 'http://kapasoft.com/how-can-kapasoft-web-design-help', 'http://kapasoft.com/'),
(856, 'http://kapasoft.com/why-Kapasoft-web-design', 'http://kapasoft.com/how-can-kapasoft-web-design-help'),
(857, 'http://kapasoft.com/kapasoft-web-design-portfolio', 'http://kapasoft.com/why-Kapasoft-web-design'),
(858, 'http://kapasoft.com/what-others-say-kapasoft-web-design', 'http://kapasoft.com/kapasoft-web-design-portfolio'),
(859, 'http://kapasoft.com/how-can-kapasoft-web-design-help', 'http://kapasoft.com/what-others-say-kapasoft-web-design'),
(860, 'http://kapasoft.com/how-can-kapasoft-web-design-help', 'http://kapasoft.com/what-others-say-kapasoft-web-design'),
(861, 'http://kapasoft.com/how-can-kapasoft-web-design-help', 'http://kapasoft.com/what-others-say-kapasoft-web-design'),
(862, 'http://kapasoft.com/how-can-kapasoft-web-design-help', 'http://kapasoft.com/what-others-say-kapasoft-web-design'),
(863, 'http://kapasoft.com/how-can-kapasoft-web-design-help', 'http://kapasoft.com/what-others-say-kapasoft-web-design'),
(864, 'http://kapasoft.com/contact-kapasoft-web-design', 'http://kapasoft.com/how-can-kapasoft-web-design-help'),
(865, 'http://kapasoft.com/what-is-kapasoft-web-design', 'http://kapasoft.com/contact-kapasoft-web-design'),
(866, 'http://kapasoft.com/what-is-kapasoft-web-design', 'http://kapasoft.com/contact-kapasoft-web-design'),
(867, 'http://kapasoft.com/what-others-say-kapasoft-web-design', 'http://kapasoft.com/what-is-kapasoft-web-design'),
(868, 'http://kapasoft.com/what-others-say-kapasoft-web-design', 'http://kapasoft.com/what-is-kapasoft-web-design'),
(869, 'http://kapasoft.com/what-others-say-kapasoft-web-design', 'http://kapasoft.com/what-is-kapasoft-web-design'),
(870, 'http://kapasoft.com/what-others-say-kapasoft-web-design', 'http://kapasoft.com/what-is-kapasoft-web-design'),
(871, 'http://kapasoft.com/', ''),
(872, 'http://kapasoft.com/', 'http://localhost/'),
(873, 'http://kapasoft.com/', 'http://localhost/'),
(874, 'http://kapasoft.com/', 'http://localhost/'),
(875, 'http://kapasoft.com/', 'http://localhost/'),
(876, 'http://kapasoft.com/', 'http://localhost/'),
(877, 'http://kapasoft.com/', 'http://localhost/'),
(878, 'http://kapasoft.com/', ''),
(879, 'http://testkapasoft.com/', ''),
(880, 'http://testkapasoft.com/', ''),
(881, 'http://testkapasoft.com/', ''),
(882, 'http://testkapasoft.com/', ''),
(883, 'http://testkapasoft.com/', ''),
(884, 'http://testkapasoft.com/', ''),
(885, 'http://testkapasoft.com/', ''),
(886, 'http://testkapasoft.com/', ''),
(887, 'http://testkapasoft.com/', ''),
(888, 'http://testkapasoft.com/', ''),
(889, 'http://testkapasoft.com/', ''),
(890, 'http://testkapasoft.com/', ''),
(891, 'http://testkapasoft.com/', ''),
(892, 'http://testkapasoft.com/why-Kapasoft-web-design', 'http://testkapasoft.com/'),
(893, 'http://testkapasoft.com/how-can-kapasoft-web-design-help', 'http://testkapasoft.com/why-Kapasoft-web-design'),
(894, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(895, 'http://testkapasoft.com/', ''),
(896, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(897, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(898, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(899, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(900, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(901, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(902, 'http://testkapasoft.com/www.sidrabi.com', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(903, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(904, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(905, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(906, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(907, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(908, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(909, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(910, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(911, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(912, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(913, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(914, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(915, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(916, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(917, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(918, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(919, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(920, 'http://testkapasoft.com/', ''),
(921, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(922, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(923, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(924, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(925, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(926, 'http://testkapasoft.com/', ''),
(927, 'http://testkapasoft.com/', ''),
(928, 'http://testkapasoft.com/', ''),
(929, 'http://testkapasoft.com/', ''),
(930, 'http://testkapasoft.com/', ''),
(931, 'http://testkapasoft.com/', ''),
(932, 'http://testkapasoft.com/', ''),
(933, 'http://testkapasoft.com/', ''),
(934, 'http://testkapasoft.com/', ''),
(935, 'http://testkapasoft.com/index.php//skin/frontend/kapasoft/webdesign/images/centralContentBG.gif', 'http://testkapasoft.com/'),
(936, 'http://testkapasoft.com/index.php//skin/frontend/kapasoft/webdesign/images/centralContentBG.gif', ''),
(937, 'http://testkapasoft.com/', ''),
(938, 'http://testkapasoft.com/', ''),
(939, 'http://testkapasoft.com/index.php/skin/frontend/kapasoft/webdesign/images/centralContentBG.gif', 'http://testkapasoft.com/'),
(940, 'http://testkapasoft.com/', ''),
(941, 'http://testkapasoft.com/', ''),
(942, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(943, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(944, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(945, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/');
INSERT INTO `log_url_info` (`url_id`, `url`, `referer`) VALUES
(946, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(947, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(948, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(949, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(950, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(951, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(952, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(953, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(954, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(955, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(956, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(957, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(958, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(959, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(960, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(961, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(962, 'http://testkapasoft.com/', ''),
(963, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(964, 'http://testkapasoft.com/', ''),
(965, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(966, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(967, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(968, 'http://testkapasoft.com/', ''),
(969, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(970, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(971, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/what-others-say-kapasoft-web-design'),
(972, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/what-others-say-kapasoft-web-design'),
(973, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/what-others-say-kapasoft-web-design'),
(974, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/what-others-say-kapasoft-web-design'),
(975, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/what-others-say-kapasoft-web-design'),
(976, 'http://testkapasoft.com/', ''),
(977, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(978, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(979, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(980, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(981, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(982, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(983, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(984, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(985, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(986, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(987, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/what-others-say-kapasoft-web-design'),
(988, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(989, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(990, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/'),
(991, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/what-others-say-kapasoft-web-design'),
(992, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(993, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(994, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(995, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(996, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(997, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(998, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(999, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1000, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1001, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1002, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1003, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1004, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1005, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1006, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1007, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1008, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1009, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1010, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1011, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1012, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1013, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1014, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1015, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1016, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1017, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1018, 'http://testkapasoft.com/', ''),
(1019, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/'),
(1020, 'http://testkapasoft.com/', ''),
(1021, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/'),
(1022, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/'),
(1023, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/'),
(1024, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/'),
(1025, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/'),
(1026, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/'),
(1027, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/'),
(1028, 'http://testkapasoft.com/barefoot-doctor.net', 'http://testkapasoft.com/what-others-say-kapasoft-web-design'),
(1029, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/'),
(1030, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/'),
(1031, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/'),
(1032, 'http://testkapasoft.com/how-can-kapasoft-web-design-help', 'http://testkapasoft.com/what-others-say-kapasoft-web-design'),
(1033, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/'),
(1034, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/'),
(1035, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/what-others-say-kapasoft-web-design'),
(1036, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1037, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1038, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1039, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1040, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1041, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1042, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1043, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1044, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1045, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1046, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1047, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1048, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1049, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1050, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1051, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1052, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1053, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1054, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1055, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1056, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1057, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1058, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1059, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1060, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1061, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1062, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1063, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1064, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1065, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1066, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1067, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1068, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1069, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1070, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1071, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1072, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1073, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1074, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1075, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1076, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1077, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1078, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1079, 'http://testkapasoft.com/contacts/index/post', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1080, 'http://testkapasoft.com/index.php/contacts/index/', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1081, 'http://testkapasoft.com/index.php/contacts/index/contact-kapasoft-web-design', 'http://testkapasoft.com/index.php/contacts/index/'),
(1082, 'http://testkapasoft.com/index.php/contacts/index/contact-kapasoft-web-design', 'http://testkapasoft.com/index.php/contacts/index/contact-kapasoft-web-design'),
(1083, 'http://testkapasoft.com/index.php/contacts/index/what-is-kapasoft-web-design', 'http://testkapasoft.com/index.php/contacts/index/contact-kapasoft-web-design'),
(1084, 'http://testkapasoft.com/', ''),
(1085, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/'),
(1086, 'http://testkapasoft.com/contacts/index/post', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1087, 'http://testkapasoft.com/index.php/contacts/index/', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1088, 'http://testkapasoft.com/index.php/contacts/index/', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1089, 'http://testkapasoft.com/index.php/contacts/index/?handles=true', ''),
(1090, 'http://testkapasoft.com/index.php/contacts/index/?showHandles=true', ''),
(1091, 'http://testkapasoft.com/index.php/contacts/index/?showHandlers=true', ''),
(1092, 'http://testkapasoft.com/index.php/contacts/index/?showHandles=true', ''),
(1093, 'http://testkapasoft.com/index.php/contacts/index/?showHandles=true', ''),
(1094, 'http://testkapasoft.com/index.php/contacts/index/?showLayout=true', ''),
(1095, 'http://testkapasoft.com/index.php/contacts/index/?showHandles=page', ''),
(1096, 'http://testkapasoft.com/', ''),
(1097, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/'),
(1098, 'http://testkapasoft.com/contacts/index/post', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1099, 'http://testkapasoft.com/', ''),
(1100, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/'),
(1101, 'http://testkapasoft.com/contacts/index/post', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1102, 'http://testkapasoft.com/index.php/contacts/index/', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1103, 'http://testkapasoft.com/index.php/contacts/index/', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1104, 'http://testkapasoft.com/index.php/contacts/index/', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1105, 'http://testkapasoft.com/index.php/contacts/index/', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1106, 'http://testkapasoft.com/index.php/contacts/index/contact-kapasoft-web-design', 'http://testkapasoft.com/index.php/contacts/index/'),
(1107, 'http://testkapasoft.com/contact-kapasoft-web-design', ''),
(1108, 'http://testkapasoft.com/contact/index/index', ''),
(1109, 'http://testkapasoft.com/index.php/contact/index/index', ''),
(1110, 'http://testkapasoft.com/index.php/contact/index/contact-kapasoft-web-design', 'http://testkapasoft.com/index.php/contact/index/index'),
(1111, 'http://testkapasoft.com/contact-kapasoft-web-design', ''),
(1112, 'http://testkapasoft.com/contacts/index/post', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1113, 'http://testkapasoft.com/index.php/contacts/index/', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1114, 'http://testkapasoft.com/', ''),
(1115, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/'),
(1116, 'http://testkapasoft.com/', ''),
(1117, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/'),
(1118, 'http://testkapasoft.com/contacts/index/post', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1119, 'http://testkapasoft.com/index.php/contacts/index/', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1120, 'http://testkapasoft.com/index.php/contacts/index/', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1121, 'http://testkapasoft.com/', ''),
(1122, 'http://testkapasoft.com/index.php/contacts/index/', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1123, 'http://testkapasoft.com/index.php/contacts/index/contact-kapasoft-web-design', 'http://testkapasoft.com/index.php/contacts/index/'),
(1124, 'http://testkapasoft.com/index.php/contacts/index/contact-kapasoft-web-design', 'http://testkapasoft.com/index.php/contacts/index/'),
(1125, 'http://testkapasoft.com/', ''),
(1126, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/'),
(1127, 'http://testkapasoft.com/contacts/index/post', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1128, 'http://testkapasoft.com/index.php/contacts/index/', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1129, 'http://testkapasoft.com/index.php/contacts/index/', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1130, 'http://testkapasoft.com/index.php/contacts/index/contact-kapasoft-web-design', 'http://testkapasoft.com/index.php/contacts/index/'),
(1131, 'http://testkapasoft.com/', ''),
(1132, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/'),
(1133, 'http://testkapasoft.com/contacts/index/post', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1134, 'http://testkapasoft.com/index.php/contacts/index/', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1135, 'http://testkapasoft.com/', ''),
(1136, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/'),
(1137, 'http://testkapasoft.com/contacts/index/post', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1138, 'http://testkapasoft.com/index.php/contacts/index/', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1139, 'http://testkapasoft.com/index.php/contacts/index/developing-kapasoft-web-design-for-client', 'http://testkapasoft.com/index.php/contacts/index/'),
(1140, 'http://testkapasoft.com/', ''),
(1141, 'http://testkapasoft.com/developing-kapasoft-web-design-for-client', 'http://testkapasoft.com/'),
(1142, 'http://testkapasoft.com/how-can-kapasoft-web-design-help', 'http://testkapasoft.com/developing-kapasoft-web-design-for-client'),
(1143, 'http://testkapasoft.com/how-can-kapasoft-web-design-help', 'http://testkapasoft.com/developing-kapasoft-web-design-for-client'),
(1144, 'http://testkapasoft.com/how-can-kapasoft-web-design-help', 'http://testkapasoft.com/developing-kapasoft-web-design-for-client'),
(1145, 'http://testkapasoft.com/how-can-kapasoft-web-design-help', 'http://testkapasoft.com/developing-kapasoft-web-design-for-client'),
(1146, 'http://testkapasoft.com/', ''),
(1147, 'http://testkapasoft.com/', 'http://localhost/kapasoft2/'),
(1148, 'http://testkapasoft.com/index.php/', 'http://testkapasoft.com/'),
(1149, 'http://testkapasoft.com/index.php/what-is-kapasoft-web-design', 'http://testkapasoft.com/index.php/'),
(1150, 'http://testkapasoft.com/index.php/what-is-kapasoft-web-design', 'http://testkapasoft.com/index.php/'),
(1151, 'http://testkapasoft.com/index.php/what-is-kapasoft-web-design', 'http://testkapasoft.com/index.php/'),
(1152, 'http://testkapasoft.com/index.php/what-is-kapasoft-web-design', 'http://testkapasoft.com/index.php/'),
(1153, 'http://testkapasoft.com/index.php/what-is-kapasoft-web-design', 'http://testkapasoft.com/index.php/'),
(1154, 'http://testkapasoft.com/index.php/what-is-kapasoft-web-design', 'http://testkapasoft.com/index.php/'),
(1155, 'http://testkapasoft.com/index.php/what-is-kapasoft-web-design', 'http://testkapasoft.com/index.php/'),
(1156, 'http://testkapasoft.com/', 'http://localhost/kapasoft2/'),
(1157, 'http://testkapasoft.com/', ''),
(1158, 'http://testkapasoft.com/how-can-kapasoft-web-design-help', 'http://testkapasoft.com/'),
(1159, 'http://testkapasoft.com/why-Kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1160, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/why-Kapasoft-web-design'),
(1161, 'http://testkapasoft.com/kapasoft-web-design-portfolio', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1162, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'http://testkapasoft.com/kapasoft-web-design-portfolio'),
(1163, 'http://testkapasoft.com/get-quote-from-KapaSoft-web-design', 'http://testkapasoft.com/what-others-say-kapasoft-web-design'),
(1164, 'http://testkapasoft.com/what-is-kapasoft-web-design', 'http://testkapasoft.com/get-quote-from-KapaSoft-web-design'),
(1165, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/what-is-kapasoft-web-design'),
(1166, 'http://testkapasoft.com/developing-kapasoft-web-design-for-client', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1167, 'http://testkapasoft.com/how-can-kapasoft-web-design-help', 'http://testkapasoft.com/developing-kapasoft-web-design-for-client'),
(1168, 'http://testkapasoft.com/why-Kapasoft-web-design', 'http://testkapasoft.com/how-can-kapasoft-web-design-help'),
(1169, 'http://testkapasoft.com/contact-kapasoft-web-design', 'http://testkapasoft.com/why-Kapasoft-web-design'),
(1170, 'http://testkapasoft.com/what-is-kapasoft-web-design', 'http://testkapasoft.com/contact-kapasoft-web-design'),
(1171, 'http://testkapasoft.com/get-quote-from-KapaSoft-web-design', 'http://testkapasoft.com/what-is-kapasoft-web-design');

-- --------------------------------------------------------

--
-- Table structure for table `log_visitor`
--

CREATE TABLE IF NOT EXISTS `log_visitor` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` char(64) NOT NULL DEFAULT '',
  `first_visit_at` datetime DEFAULT NULL,
  `last_visit_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_url_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='System visitors log' AUTO_INCREMENT=53 ;

--
-- Dumping data for table `log_visitor`
--

INSERT INTO `log_visitor` (`visitor_id`, `session_id`, `first_visit_at`, `last_visit_at`, `last_url_id`, `store_id`) VALUES
(1, '5a575fdf35219e19b3a2a362c51750c3', '2010-11-25 14:30:30', '2010-11-25 15:19:04', 12, 1),
(2, '13a247ce50980595ff4b3a4914f8c03d', '2010-11-25 16:30:01', '2010-11-25 17:31:20', 41, 1),
(3, '862b03b64851a210f80d33762240f3f1', '2010-11-26 14:15:15', '2010-11-26 18:08:15', 231, 1),
(4, 'e3a04b406019566835dd7d082035727f', '2010-11-26 15:05:02', '2010-11-26 15:05:03', 58, 1),
(5, '703f6438f321552f19d6bb2ba6c579d2', '2010-11-26 16:06:55', '2010-11-26 16:18:40', 124, 1),
(6, '67d44d5ffb3945b98f6383be821e2fbe', '2010-11-26 17:45:10', '2010-11-26 18:08:24', 232, 1),
(7, 'bcf09185f0b9f58adbe785288fdedf93', '2010-11-26 17:45:33', '2010-11-26 18:08:48', 233, 1),
(8, 'eac588358eeed06252e4a193a93b5a1f', '2010-11-26 19:41:43', '2010-11-26 21:39:55', 333, 1),
(9, '2fef9463d1ac00334001defbb17043ac', '2010-11-27 13:39:03', '2010-11-27 15:20:42', 361, 1),
(10, '6fff8c5d144d8c3b26e2623420927b84', '2010-11-27 17:52:55', '2010-11-27 21:40:59', 554, 1),
(11, '39a65d1b9d98047a261bfea486a72072', '2010-11-27 18:14:46', '2010-11-27 18:14:47', 380, 1),
(12, 'd28fab59a060e2e64da39db948553a38', '2010-11-27 19:17:33', '2010-11-27 19:17:34', 432, 1),
(13, 'db30ef726e619cc613fa585f19a5a609', '2010-11-28 01:07:39', '2010-11-28 04:12:30', 612, 1),
(14, 'cd52b80c730fc537ee8b86f0bf121826', '2010-11-28 12:14:33', '2010-11-28 14:33:45', 687, 1),
(15, '634a11b3513fd3029cb2124bcf5cd070', '2010-11-28 15:55:17', '2010-11-28 15:55:18', 688, 1),
(16, 'd18b09f986003a5c06ff93113d903b51', '2010-11-28 15:56:18', '2010-11-28 19:12:32', 815, 1),
(17, 'b4987c61cd56f8d42884b8d0c5daad18', '2010-11-28 18:31:22', '2010-11-28 18:31:23', 809, 1),
(18, 'a569e1de0ba9e69b90321480130e5685', '2010-11-28 18:34:25', '2010-11-28 18:34:26', 811, 1),
(19, 'c970b1578a7806bd4d3d0ff1e623e474', '2010-11-28 20:27:08', '2010-11-28 22:11:43', 870, 1),
(20, 'cced4c5dd6a72aef3711359d230279aa', '2010-11-29 23:27:43', '2010-11-29 23:27:44', 871, 1),
(21, 'e8b673c84ac88f36feb379adfc474c6e', '2010-11-30 22:46:26', '2010-11-30 22:57:55', 877, 1),
(22, 'cabaf91e4e9025192def57b4db7a0e26', '2010-12-05 20:51:11', '2010-12-05 20:51:14', 878, 1),
(23, '4676d7b5d71ad952b9eb77b3d9d8c006', '2010-12-05 21:02:08', '2010-12-05 21:02:09', 879, 1),
(24, '61e38ceafb5879cba2bce4fcefc05ebd', '2010-12-05 22:41:39', '2010-12-05 22:41:39', 880, 1),
(25, '78ef8200f75cc9a2eddaad836ecad1d1', '2010-12-07 02:31:25', '2010-12-07 02:31:28', 881, 1),
(26, 'dd28263ab4a7a8fbcf1e9603d6cfe265', '2010-12-08 23:42:12', '2010-12-08 23:42:17', 882, 1),
(27, '10bf22b5f121ffbad69bf31b15a5524c', '2010-12-09 01:04:05', '2010-12-09 01:15:39', 886, 1),
(28, '00aa25b0f651904fa84c39f41aa2694c', '2010-12-09 01:20:15', '2010-12-09 02:24:29', 911, 1),
(29, '73c52b28ff40de67f41797f3fd81c654', '2010-12-09 02:24:48', '2010-12-09 02:26:24', 915, 1),
(30, '88787610cdbc287b53b06206293d3de4', '2010-12-09 02:26:52', '2010-12-09 03:06:44', 925, 1),
(31, '33857e459fe748d824d3125f4ece2e66', '2010-12-09 02:33:42', '2010-12-09 02:55:30', 923, 1),
(32, '405e5e5efdad4659b6d9ba494ccddd43', '2010-12-09 23:42:20', '2010-12-09 23:59:56', 940, 1),
(33, '79bf212527414a8b5c71ee3aaf463641', '2010-12-09 23:45:19', '2010-12-09 23:47:16', 930, 1),
(34, 'c0267082e769c92c98b75418ec0ad0f4', '2010-12-09 23:47:27', '2010-12-10 00:30:23', 958, 1),
(35, 'b354e45c44c6796bbdfc992accc2fb59', '2010-12-10 00:30:43', '2010-12-10 00:32:52', 961, 1),
(36, '4a6892ab5b383b893bf8b00bb256d764', '2010-12-12 19:06:00', '2010-12-12 19:34:57', 975, 1),
(37, '614bb90c9729c3841dde39065f62686a', '2010-12-12 19:37:06', '2010-12-12 19:37:14', 977, 1),
(38, '02ba3a59e8b4d761d171331dcd47a497', '2010-12-12 19:38:41', '2010-12-12 19:39:02', 979, 1),
(39, '1c6686e9cd6c23661a7f30d539402248', '2010-12-12 19:39:53', '2010-12-12 19:39:53', 980, 1),
(40, 'f31fdbe00cc192f705ef1ca1d2f07e7e', '2010-12-12 19:41:46', '2010-12-12 20:01:52', 990, 1),
(41, '4a6892ab5b383b893bf8b00bb256d764', '2010-12-12 19:57:43', '2010-12-12 20:57:11', 1017, 1),
(42, 'ec3291411968f9afe3b7aa00f2459516', '2010-12-12 22:54:53', '2010-12-13 01:28:51', 1107, 1),
(43, 'a1d77455e58074fbc0aabf9ab0d2e7ba', '2010-12-12 22:57:14', '2010-12-12 23:33:10', 1035, 1),
(44, 'ec3291411968f9afe3b7aa00f2459516', '2010-12-13 01:31:31', '2010-12-13 01:56:51', 1119, 1),
(45, 'ec3291411968f9afe3b7aa00f2459516', '2010-12-13 01:57:09', '2010-12-13 01:57:10', 1120, 1),
(46, 'a21b541b827bc206b0656e990f41eb60', '2010-12-15 11:32:05', '2010-12-15 11:38:30', 1122, 1),
(47, 'd599d38e0efbe339f8a18069fd68e5b7', '2010-12-15 23:49:01', '2010-12-15 23:49:03', 1124, 1),
(48, '87e21a16e2a98ec107b40fb9e8b9d335', '2010-12-15 23:49:01', '2010-12-16 00:20:53', 1145, 1),
(49, 'f1a665fef9ed89fa925518b96f8d15f0', '2010-12-18 13:49:35', '2010-12-18 13:49:37', 1146, 1),
(50, 'b8888dcfd6bc53e9471af5669f2074ca', '2011-01-07 01:30:10', '2011-01-07 01:52:27', 1155, 1),
(51, 'e6bf4fac3ef6121eca50365f66330d2a', '2011-01-17 20:11:28', '2011-01-17 20:11:32', 1156, 1),
(52, '107800b54ed194e2746a93110dad45ea', '2012-07-07 18:35:45', '2012-07-07 18:47:59', 1171, 1);

-- --------------------------------------------------------

--
-- Table structure for table `log_visitor_info`
--

CREATE TABLE IF NOT EXISTS `log_visitor_info` (
  `visitor_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `http_referer` varchar(255) DEFAULT NULL,
  `http_user_agent` varchar(255) DEFAULT NULL,
  `http_accept_charset` varchar(255) DEFAULT NULL,
  `http_accept_language` varchar(255) DEFAULT NULL,
  `server_addr` bigint(20) DEFAULT NULL,
  `remote_addr` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Additional information by visitor';

--
-- Dumping data for table `log_visitor_info`
--

INSERT INTO `log_visitor_info` (`visitor_id`, `http_referer`, `http_user_agent`, `http_accept_charset`, `http_accept_language`, `server_addr`, `remote_addr`) VALUES
(1, 'http://kapasoft.com/index.php/install/wizard/end/', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(2, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(3, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(4, '', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; MALC)', '', 'en-US', 2130706433, 2130706433),
(5, '', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; MALC)', '', 'en-US', 2130706433, 2130706433),
(6, '', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; MALC)', '', 'en-US', 2130706433, 2130706433),
(7, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.44 Safari/534.7', 'ISO-8859-1,utf-8;q=0.7,*;q=0.3', 'en-US,en;q=0.8', 2130706433, 2130706433),
(8, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(9, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(10, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(11, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.44 Safari/534.7', 'ISO-8859-1,utf-8;q=0.7,*;q=0.3', 'en-US,en;q=0.8', 2130706433, 2130706433),
(12, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.44 Safari/534.7', 'ISO-8859-1,utf-8;q=0.7,*;q=0.3', 'en-US,en;q=0.8', 2130706433, 2130706433),
(13, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(14, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(15, '', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; MALC)', '', 'en-US', 2130706433, 2130706433),
(16, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(17, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.44 Safari/534.7', 'ISO-8859-1,utf-8;q=0.7,*;q=0.3', 'en-US,en;q=0.8', 2130706433, 2130706433),
(18, '', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; MALC)', '', 'en-US', 2130706433, 2130706433),
(19, 'http://kapasoft.com/index.php/admin/cms_page/index/key/9961448b1b0a5727a55c276af15ef834/', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(20, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(21, 'http://localhost/', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(22, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(23, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(24, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(25, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.215 Safari/534.10', 'ISO-8859-1,utf-8;q=0.7,*;q=0.3', 'en-US,en;q=0.8', 2130706433, 2130706433),
(26, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(27, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.215 Safari/534.10', 'ISO-8859-1,utf-8;q=0.7,*;q=0.3', 'en-US,en;q=0.8', 2130706433, 2130706433),
(28, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(29, 'http://testkapasoft.com/how-can-kapasoft-web-design-help', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(30, 'http://testkapasoft.com/how-can-kapasoft-web-design-help', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(31, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.215 Safari/534.10', 'ISO-8859-1,utf-8;q=0.7,*;q=0.3', 'en-US,en;q=0.8', 2130706433, 2130706433),
(32, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.215 Safari/534.10', 'ISO-8859-1,utf-8;q=0.7,*;q=0.3', 'en-US,en;q=0.8', 2130706433, 2130706433),
(33, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(34, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(35, 'http://testkapasoft.com/', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(36, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.215 Safari/534.10', 'ISO-8859-1,utf-8;q=0.7,*;q=0.3', 'en-US,en;q=0.8', 2130706433, 2130706433),
(37, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(38, 'http://testkapasoft.com/', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(39, 'http://testkapasoft.com/', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(40, 'http://testkapasoft.com/', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(41, 'http://testkapasoft.com/what-others-say-kapasoft-web-design', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.215 Safari/534.10', 'ISO-8859-1,utf-8;q=0.7,*;q=0.3', 'en-US,en;q=0.8', 2130706433, 2130706433),
(42, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(43, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.215 Safari/534.10', 'ISO-8859-1,utf-8;q=0.7,*;q=0.3', 'en-US,en;q=0.8', 2130706433, 2130706433),
(44, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(45, 'http://testkapasoft.com/contact-kapasoft-web-design', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(46, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(47, 'http://testkapasoft.com/index.php/contacts/index/', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(48, 'http://testkapasoft.com/index.php/contacts/index/', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12', 'ISO-8859-1,utf-8;q=0.7,*;q=0.7', 'en-us,en;q=0.5', 2130706433, 2130706433),
(49, '', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.224 Safari/534.10', 'ISO-8859-1,utf-8;q=0.7,*;q=0.3', 'en-US,en;q=0.8', 2130706433, 2130706433),
(50, 'http://localhost/kapasoft2/', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.224 Safari/534.10', 'ISO-8859-1,utf-8;q=0.7,*;q=0.3', 'en-US,en;q=0.8', 2130706433, 2130706433),
(51, 'http://localhost/kapasoft2/', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.224 Safari/534.10', 'ISO-8859-1,utf-8;q=0.7,*;q=0.3', 'en-US,en;q=0.8', 2130706433, 2130706433),
(52, '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.47 Safari/536.11', 'ISO-8859-1,utf-8;q=0.7,*;q=0.3', 'en-US,en;q=0.8', 2130706433, 2130706433);

-- --------------------------------------------------------

--
-- Table structure for table `log_visitor_online`
--

CREATE TABLE IF NOT EXISTS `log_visitor_online` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_type` char(1) NOT NULL,
  `remote_addr` bigint(20) NOT NULL,
  `first_visit_at` datetime DEFAULT NULL,
  `last_visit_at` datetime DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `last_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`visitor_id`),
  KEY `IDX_VISITOR_TYPE` (`visitor_type`),
  KEY `IDX_VISIT_TIME` (`first_visit_at`,`last_visit_at`),
  KEY `IDX_CUSTOMER` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `log_visitor_online`
--


-- --------------------------------------------------------

--
-- Table structure for table `newsletter_problem`
--

CREATE TABLE IF NOT EXISTS `newsletter_problem` (
  `problem_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(7) unsigned DEFAULT NULL,
  `queue_id` int(7) unsigned NOT NULL DEFAULT '0',
  `problem_error_code` int(3) unsigned DEFAULT '0',
  `problem_error_text` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`problem_id`),
  KEY `FK_PROBLEM_SUBSCRIBER` (`subscriber_id`),
  KEY `FK_PROBLEM_QUEUE` (`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter problems' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `newsletter_problem`
--


-- --------------------------------------------------------

--
-- Table structure for table `newsletter_queue`
--

CREATE TABLE IF NOT EXISTS `newsletter_queue` (
  `queue_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(7) unsigned NOT NULL DEFAULT '0',
  `queue_status` int(3) unsigned NOT NULL DEFAULT '0',
  `queue_start_at` datetime DEFAULT NULL,
  `queue_finish_at` datetime DEFAULT NULL,
  PRIMARY KEY (`queue_id`),
  KEY `FK_QUEUE_TEMPLATE` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter queue' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `newsletter_queue`
--


-- --------------------------------------------------------

--
-- Table structure for table `newsletter_queue_link`
--

CREATE TABLE IF NOT EXISTS `newsletter_queue_link` (
  `queue_link_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `queue_id` int(7) unsigned NOT NULL DEFAULT '0',
  `subscriber_id` int(7) unsigned NOT NULL DEFAULT '0',
  `letter_sent_at` datetime DEFAULT NULL,
  PRIMARY KEY (`queue_link_id`),
  KEY `FK_QUEUE_LINK_SUBSCRIBER` (`subscriber_id`),
  KEY `FK_QUEUE_LINK_QUEUE` (`queue_id`),
  KEY `IDX_NEWSLETTER_QUEUE_LINK_SEND_AT` (`queue_id`,`letter_sent_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter queue to subscriber link' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `newsletter_queue_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `newsletter_queue_store_link`
--

CREATE TABLE IF NOT EXISTS `newsletter_queue_store_link` (
  `queue_id` int(7) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`queue_id`,`store_id`),
  KEY `FK_NEWSLETTER_QUEUE_STORE_LINK_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `newsletter_queue_store_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscriber`
--

CREATE TABLE IF NOT EXISTS `newsletter_subscriber` (
  `subscriber_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned DEFAULT '0',
  `change_status_at` datetime DEFAULT NULL,
  `customer_id` int(11) unsigned NOT NULL DEFAULT '0',
  `subscriber_email` varchar(150) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `subscriber_status` int(3) NOT NULL DEFAULT '0',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL',
  PRIMARY KEY (`subscriber_id`),
  KEY `FK_SUBSCRIBER_CUSTOMER` (`customer_id`),
  KEY `FK_NEWSLETTER_SUBSCRIBER_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter subscribers' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `newsletter_subscriber`
--


-- --------------------------------------------------------

--
-- Table structure for table `newsletter_template`
--

CREATE TABLE IF NOT EXISTS `newsletter_template` (
  `template_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `template_code` varchar(150) DEFAULT NULL,
  `template_text` text,
  `template_text_preprocessed` text,
  `template_styles` text,
  `template_type` int(3) unsigned DEFAULT NULL,
  `template_subject` varchar(200) DEFAULT NULL,
  `template_sender_name` varchar(200) DEFAULT NULL,
  `template_sender_email` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `template_actual` tinyint(1) unsigned DEFAULT '1',
  `added_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_actual` (`template_actual`),
  KEY `added_at` (`added_at`),
  KEY `modified_at` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter templates' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `newsletter_template`
--


-- --------------------------------------------------------

--
-- Table structure for table `paygate_authorizenet_debug`
--

CREATE TABLE IF NOT EXISTS `paygate_authorizenet_debug` (
  `debug_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request_body` text,
  `response_body` text,
  `request_serialized` text,
  `result_serialized` text,
  `request_dump` text,
  `result_dump` text,
  PRIMARY KEY (`debug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `paygate_authorizenet_debug`
--


-- --------------------------------------------------------

--
-- Table structure for table `paypal_api_debug`
--

CREATE TABLE IF NOT EXISTS `paypal_api_debug` (
  `debug_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `debug_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `paypal_api_debug`
--


-- --------------------------------------------------------

--
-- Table structure for table `paypaluk_api_debug`
--

CREATE TABLE IF NOT EXISTS `paypaluk_api_debug` (
  `debug_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `debug_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `paypaluk_api_debug`
--


-- --------------------------------------------------------

--
-- Table structure for table `poll`
--

CREATE TABLE IF NOT EXISTS `poll` (
  `poll_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poll_title` varchar(255) NOT NULL DEFAULT '',
  `votes_count` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned DEFAULT '0',
  `date_posted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_closed` datetime DEFAULT NULL,
  `active` smallint(6) NOT NULL DEFAULT '1',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `answers_display` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`poll_id`),
  KEY `FK_POLL_STORE` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `poll`
--

INSERT INTO `poll` (`poll_id`, `poll_title`, `votes_count`, `store_id`, `date_posted`, `date_closed`, `active`, `closed`, `answers_display`) VALUES
(1, 'What is your favorite color', 5, 1, '2010-11-25 08:27:37', NULL, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `poll_answer`
--

CREATE TABLE IF NOT EXISTS `poll_answer` (
  `answer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0',
  `answer_title` varchar(255) NOT NULL DEFAULT '',
  `votes_count` int(10) unsigned NOT NULL DEFAULT '0',
  `answer_order` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`answer_id`),
  KEY `FK_POLL_PARENT` (`poll_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `poll_answer`
--

INSERT INTO `poll_answer` (`answer_id`, `poll_id`, `answer_title`, `votes_count`, `answer_order`) VALUES
(1, 1, 'Green', 4, 0),
(2, 1, 'Red', 1, 0),
(3, 1, 'Black', 0, 0),
(4, 1, 'Magenta', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `poll_store`
--

CREATE TABLE IF NOT EXISTS `poll_store` (
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`poll_id`,`store_id`),
  KEY `FK_POLL_STORE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `poll_store`
--

INSERT INTO `poll_store` (`poll_id`, `store_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `poll_vote`
--

CREATE TABLE IF NOT EXISTS `poll_vote` (
  `vote_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0',
  `poll_answer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` bigint(20) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `vote_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vote_id`),
  KEY `FK_POLL_ANSWER` (`poll_answer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `poll_vote`
--


-- --------------------------------------------------------

--
-- Table structure for table `product_alert_price`
--

CREATE TABLE IF NOT EXISTS `product_alert_price` (
  `alert_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `add_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_send_date` datetime DEFAULT NULL,
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`alert_price_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_CUSTOMER` (`customer_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_PRODUCT` (`product_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `product_alert_price`
--


-- --------------------------------------------------------

--
-- Table structure for table `product_alert_stock`
--

CREATE TABLE IF NOT EXISTS `product_alert_stock` (
  `alert_stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `add_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `send_date` datetime DEFAULT NULL,
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`alert_stock_id`),
  KEY `FK_PRODUCT_ALERT_STOCK_CUSTOMER` (`customer_id`),
  KEY `FK_PRODUCT_ALERT_STOCK_PRODUCT` (`product_id`),
  KEY `FK_PRODUCT_ALERT_STOCK_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `product_alert_stock`
--


-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `rating_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `rating_code` varchar(64) NOT NULL DEFAULT '',
  `position` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `IDX_CODE` (`rating_code`),
  KEY `FK_RATING_ENTITY` (`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='ratings' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`rating_id`, `entity_id`, `rating_code`, `position`) VALUES
(1, 1, 'Quality', 0),
(2, 1, 'Value', 0),
(3, 1, 'Price', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rating_entity`
--

CREATE TABLE IF NOT EXISTS `rating_entity` (
  `entity_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `IDX_CODE` (`entity_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Rating entities' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `rating_entity`
--

INSERT INTO `rating_entity` (`entity_id`, `entity_code`) VALUES
(1, 'product'),
(2, 'product_review'),
(3, 'review');

-- --------------------------------------------------------

--
-- Table structure for table `rating_option`
--

CREATE TABLE IF NOT EXISTS `rating_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rating_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL DEFAULT '',
  `value` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `position` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_id`),
  KEY `FK_RATING_OPTION_RATING` (`rating_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Rating options' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `rating_option`
--

INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES
(1, 1, '1', 1, 1),
(2, 1, '2', 2, 2),
(3, 1, '3', 3, 3),
(4, 1, '4', 4, 4),
(5, 1, '5', 5, 5),
(6, 2, '1', 1, 1),
(7, 2, '2', 2, 2),
(8, 2, '3', 3, 3),
(9, 2, '4', 4, 4),
(10, 2, '5', 5, 5),
(11, 3, '1', 1, 1),
(12, 3, '2', 2, 2),
(13, 3, '3', 3, 3),
(14, 3, '4', 4, 4),
(15, 3, '5', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `rating_option_vote`
--

CREATE TABLE IF NOT EXISTS `rating_option_vote` (
  `vote_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `remote_ip` varchar(16) NOT NULL DEFAULT '',
  `remote_ip_long` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) unsigned DEFAULT '0',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0',
  `rating_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `review_id` bigint(20) unsigned DEFAULT NULL,
  `percent` tinyint(3) NOT NULL DEFAULT '0',
  `value` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vote_id`),
  KEY `FK_RATING_OPTION_VALUE_OPTION` (`option_id`),
  KEY `FK_RATING_OPTION_REVIEW_ID` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating option values' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `rating_option_vote`
--


-- --------------------------------------------------------

--
-- Table structure for table `rating_option_vote_aggregated`
--

CREATE TABLE IF NOT EXISTS `rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL AUTO_INCREMENT,
  `rating_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0',
  `vote_value_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `percent` tinyint(3) NOT NULL DEFAULT '0',
  `percent_approved` tinyint(3) DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`primary_id`),
  KEY `FK_RATING_OPTION_VALUE_AGGREGATE` (`rating_id`),
  KEY `FK_RATING_OPTION_VOTE_AGGREGATED_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `rating_option_vote_aggregated`
--


-- --------------------------------------------------------

--
-- Table structure for table `rating_store`
--

CREATE TABLE IF NOT EXISTS `rating_store` (
  `rating_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `FK_RATING_STORE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rating_store`
--


-- --------------------------------------------------------

--
-- Table structure for table `rating_title`
--

CREATE TABLE IF NOT EXISTS `rating_title` (
  `rating_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `FK_RATING_TITLE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rating_title`
--


-- --------------------------------------------------------

--
-- Table structure for table `report_compared_product_index`
--

CREATE TABLE IF NOT EXISTS `report_compared_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` int(10) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `added_at` datetime NOT NULL,
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `UNQ_BY_VISITOR` (`visitor_id`,`product_id`),
  UNIQUE KEY `UNQ_BY_CUSTOMER` (`customer_id`,`product_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_SORT_ADDED_AT` (`added_at`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `report_compared_product_index`
--


-- --------------------------------------------------------

--
-- Table structure for table `report_event`
--

CREATE TABLE IF NOT EXISTS `report_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `logged_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `event_type_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `subject_id` int(10) unsigned NOT NULL DEFAULT '0',
  `subtype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `IDX_EVENT_TYPE` (`event_type_id`),
  KEY `IDX_SUBJECT` (`subject_id`),
  KEY `IDX_OBJECT` (`object_id`),
  KEY `IDX_SUBTYPE` (`subtype`),
  KEY `FK_REPORT_EVENT_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `report_event`
--


-- --------------------------------------------------------

--
-- Table structure for table `report_event_types`
--

CREATE TABLE IF NOT EXISTS `report_event_types` (
  `event_type_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `event_name` varchar(64) NOT NULL,
  `customer_login` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `report_event_types`
--

INSERT INTO `report_event_types` (`event_type_id`, `event_name`, `customer_login`) VALUES
(1, 'catalog_product_view', 1),
(2, 'sendfriend_product', 1),
(3, 'catalog_product_compare_add_product', 1),
(4, 'checkout_cart_add_product', 1),
(5, 'wishlist_add_product', 1),
(6, 'wishlist_share', 1);

-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_index`
--

CREATE TABLE IF NOT EXISTS `report_viewed_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` int(10) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `added_at` datetime NOT NULL,
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `UNQ_BY_VISITOR` (`visitor_id`,`product_id`),
  UNIQUE KEY `UNQ_BY_CUSTOMER` (`customer_id`,`product_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_SORT_ADDED_AT` (`added_at`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `report_viewed_product_index`
--


-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `review_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_pk_value` int(10) unsigned NOT NULL DEFAULT '0',
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`review_id`),
  KEY `FK_REVIEW_ENTITY` (`entity_id`),
  KEY `FK_REVIEW_STATUS` (`status_id`),
  KEY `FK_REVIEW_PARENT_PRODUCT` (`entity_pk_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review base information' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `review`
--


-- --------------------------------------------------------

--
-- Table structure for table `review_detail`
--

CREATE TABLE IF NOT EXISTS `review_detail` (
  `detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `detail` text NOT NULL,
  `nickname` varchar(128) NOT NULL DEFAULT '',
  `customer_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `FK_REVIEW_DETAIL_REVIEW` (`review_id`),
  KEY `FK_REVIEW_DETAIL_STORE` (`store_id`),
  KEY `FK_REVIEW_DETAIL_CUSTOMER` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review detail information' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `review_detail`
--


-- --------------------------------------------------------

--
-- Table structure for table `review_entity`
--

CREATE TABLE IF NOT EXISTS `review_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Review entities' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `review_entity`
--

INSERT INTO `review_entity` (`entity_id`, `entity_code`) VALUES
(1, 'product'),
(2, 'customer'),
(3, 'category');

-- --------------------------------------------------------

--
-- Table structure for table `review_entity_summary`
--

CREATE TABLE IF NOT EXISTS `review_entity_summary` (
  `primary_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_pk_value` bigint(20) NOT NULL DEFAULT '0',
  `entity_type` tinyint(4) NOT NULL DEFAULT '0',
  `reviews_count` smallint(6) NOT NULL DEFAULT '0',
  `rating_summary` tinyint(4) NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`primary_id`),
  KEY `FK_REVIEW_ENTITY_SUMMARY_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `review_entity_summary`
--


-- --------------------------------------------------------

--
-- Table structure for table `review_status`
--

CREATE TABLE IF NOT EXISTS `review_status` (
  `status_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `status_code` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Review statuses' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `review_status`
--

INSERT INTO `review_status` (`status_id`, `status_code`) VALUES
(1, 'Approved'),
(2, 'Pending'),
(3, 'Not Approved');

-- --------------------------------------------------------

--
-- Table structure for table `review_store`
--

CREATE TABLE IF NOT EXISTS `review_store` (
  `review_id` bigint(20) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`review_id`,`store_id`),
  KEY `FK_REVIEW_STORE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `review_store`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_order_item`
--

CREATE TABLE IF NOT EXISTS `sales_flat_order_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_item_id` int(10) unsigned DEFAULT NULL,
  `quote_item_id` int(10) unsigned DEFAULT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `product_options` text,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `is_virtual` tinyint(1) unsigned DEFAULT NULL,
  `sku` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `applied_rule_ids` text,
  `additional_data` text,
  `free_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_qty_decimal` tinyint(1) unsigned DEFAULT NULL,
  `no_discount` tinyint(1) unsigned DEFAULT '0',
  `qty_backordered` decimal(12,4) DEFAULT '0.0000',
  `qty_canceled` decimal(12,4) DEFAULT '0.0000',
  `qty_invoiced` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` decimal(12,4) DEFAULT '0.0000',
  `qty_refunded` decimal(12,4) DEFAULT '0.0000',
  `qty_shipped` decimal(12,4) DEFAULT '0.0000',
  `base_cost` decimal(12,4) DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `original_price` decimal(12,4) DEFAULT NULL,
  `base_original_price` decimal(12,4) DEFAULT NULL,
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `row_weight` decimal(12,4) DEFAULT '0.0000',
  `gift_message_id` int(10) DEFAULT NULL,
  `gift_message_available` int(10) DEFAULT NULL,
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL,
  `tax_before_discount` decimal(12,4) DEFAULT NULL,
  `ext_order_item_id` varchar(255) DEFAULT NULL,
  `locked_do_invoice` int(10) unsigned DEFAULT NULL,
  `locked_do_ship` int(10) unsigned DEFAULT NULL,
  `price_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL,
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `weee_tax_applied` text,
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `IDX_ORDER` (`order_id`),
  KEY `FK_SALES_ORDER_ITEM_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_flat_order_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote`
--

CREATE TABLE IF NOT EXISTS `sales_flat_quote` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `converted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned DEFAULT '1',
  `is_virtual` tinyint(1) unsigned DEFAULT '0',
  `is_multi_shipping` tinyint(1) unsigned DEFAULT '0',
  `items_count` int(10) unsigned DEFAULT '0',
  `items_qty` decimal(12,4) DEFAULT '0.0000',
  `orig_order_id` int(10) unsigned DEFAULT '0',
  `store_to_base_rate` decimal(12,4) DEFAULT '0.0000',
  `store_to_quote_rate` decimal(12,4) DEFAULT '0.0000',
  `base_currency_code` varchar(255) DEFAULT NULL,
  `store_currency_code` varchar(255) DEFAULT NULL,
  `quote_currency_code` varchar(255) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `checkout_method` varchar(255) DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT '0',
  `customer_tax_class_id` int(10) unsigned DEFAULT '0',
  `customer_group_id` int(10) unsigned DEFAULT '0',
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_prefix` varchar(40) DEFAULT NULL,
  `customer_firstname` varchar(255) DEFAULT NULL,
  `customer_middlename` varchar(40) DEFAULT NULL,
  `customer_lastname` varchar(255) DEFAULT NULL,
  `customer_suffix` varchar(40) DEFAULT NULL,
  `customer_dob` datetime DEFAULT NULL,
  `customer_note` varchar(255) DEFAULT NULL,
  `customer_note_notify` tinyint(1) unsigned DEFAULT '1',
  `customer_is_guest` tinyint(1) unsigned DEFAULT '0',
  `remote_ip` varchar(32) DEFAULT NULL,
  `applied_rule_ids` varchar(255) DEFAULT NULL,
  `reserved_order_id` varchar(64) DEFAULT '',
  `password_hash` varchar(255) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `global_currency_code` varchar(255) DEFAULT NULL,
  `base_to_global_rate` decimal(12,4) DEFAULT NULL,
  `base_to_quote_rate` decimal(12,4) DEFAULT NULL,
  `customer_taxvat` varchar(255) DEFAULT NULL,
  `customer_gender` varchar(255) DEFAULT NULL,
  `subtotal` decimal(12,4) DEFAULT NULL,
  `base_subtotal` decimal(12,4) DEFAULT NULL,
  `subtotal_with_discount` decimal(12,4) DEFAULT NULL,
  `base_subtotal_with_discount` decimal(12,4) DEFAULT NULL,
  `is_changed` int(10) unsigned DEFAULT NULL,
  `trigger_recollect` tinyint(1) NOT NULL DEFAULT '0',
  `ext_shipping_info` text,
  `gift_message_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `FK_SALES_QUOTE_STORE` (`store_id`),
  KEY `IDX_CUSTOMER` (`customer_id`,`store_id`,`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_flat_quote`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote_address`
--

CREATE TABLE IF NOT EXISTS `sales_flat_quote_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `customer_id` int(10) unsigned DEFAULT NULL,
  `save_in_address_book` tinyint(1) DEFAULT '0',
  `customer_address_id` int(10) unsigned DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `prefix` varchar(40) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(40) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `suffix` varchar(40) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `region_id` int(10) unsigned DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `country_id` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `same_as_billing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `collect_shipping_rates` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_method` varchar(255) NOT NULL DEFAULT '',
  `shipping_description` varchar(255) NOT NULL DEFAULT '',
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `customer_notes` text,
  `applied_taxes` text,
  `discount_description` varchar(255) DEFAULT NULL,
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL,
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL,
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_subtotal_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `gift_message_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `FK_SALES_QUOTE_ADDRESS_SALES_QUOTE` (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_flat_quote_address`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote_address_item`
--

CREATE TABLE IF NOT EXISTS `sales_flat_quote_address_item` (
  `address_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_item_id` int(10) unsigned DEFAULT NULL,
  `quote_address_id` int(10) unsigned NOT NULL DEFAULT '0',
  `quote_item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `applied_rule_ids` text,
  `additional_data` text,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `row_weight` decimal(12,4) DEFAULT '0.0000',
  `product_id` int(10) unsigned DEFAULT NULL,
  `super_product_id` int(10) unsigned DEFAULT NULL,
  `parent_product_id` int(10) unsigned DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `free_shipping` int(10) unsigned DEFAULT NULL,
  `is_qty_decimal` int(10) unsigned DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `discount_percent` decimal(12,4) DEFAULT NULL,
  `no_discount` int(10) unsigned DEFAULT NULL,
  `tax_percent` decimal(12,4) DEFAULT NULL,
  `base_price` decimal(12,4) DEFAULT NULL,
  `base_cost` decimal(12,4) DEFAULT NULL,
  `price_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL,
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `gift_message_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`address_item_id`),
  KEY `FK_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS` (`quote_address_id`),
  KEY `FK_SALES_QUOTE_ADDRESS_ITEM_QUOTE_ITEM` (`quote_item_id`),
  KEY `IDX_PARENT_ITEM_ID` (`parent_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_flat_quote_address_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote_item`
--

CREATE TABLE IF NOT EXISTS `sales_flat_quote_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_id` int(10) unsigned DEFAULT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `parent_item_id` int(10) unsigned DEFAULT NULL,
  `is_virtual` tinyint(1) unsigned DEFAULT NULL,
  `sku` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `applied_rule_ids` text,
  `additional_data` text,
  `free_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_qty_decimal` tinyint(1) unsigned DEFAULT NULL,
  `no_discount` tinyint(1) unsigned DEFAULT '0',
  `weight` decimal(12,4) DEFAULT '0.0000',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `custom_price` decimal(12,4) DEFAULT NULL,
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000',
  `row_weight` decimal(12,4) DEFAULT '0.0000',
  `product_type` varchar(255) DEFAULT NULL,
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL,
  `tax_before_discount` decimal(12,4) DEFAULT NULL,
  `original_custom_price` decimal(12,4) DEFAULT NULL,
  `redirect_url` varchar(255) DEFAULT NULL,
  `base_cost` decimal(12,4) DEFAULT NULL,
  `price_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL,
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `gift_message_id` int(10) unsigned DEFAULT NULL,
  `weee_tax_applied` text,
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_SALES_QUOTE_ITEM_SALES_QUOTE` (`quote_id`),
  KEY `FK_SALES_FLAT_QUOTE_ITEM_PARENT_ITEM` (`parent_item_id`),
  KEY `FK_SALES_QUOTE_ITEM_CATALOG_PRODUCT_ENTITY` (`product_id`),
  KEY `FK_SALES_QUOTE_ITEM_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_flat_quote_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote_item_option`
--

CREATE TABLE IF NOT EXISTS `sales_flat_quote_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`option_id`),
  KEY `FK_SALES_QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Additional options for quote item' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_flat_quote_item_option`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote_payment`
--

CREATE TABLE IF NOT EXISTS `sales_flat_quote_payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `method` varchar(255) DEFAULT '',
  `cc_type` varchar(255) DEFAULT '',
  `cc_number_enc` varchar(255) DEFAULT '',
  `cc_last4` varchar(255) DEFAULT '',
  `cc_cid_enc` varchar(255) DEFAULT '',
  `cc_owner` varchar(255) DEFAULT '',
  `cc_exp_month` tinyint(2) unsigned DEFAULT '0',
  `cc_exp_year` smallint(4) unsigned DEFAULT '0',
  `cc_ss_owner` varchar(255) DEFAULT '',
  `cc_ss_start_month` tinyint(2) unsigned DEFAULT '0',
  `cc_ss_start_year` smallint(4) unsigned DEFAULT '0',
  `cybersource_token` varchar(255) DEFAULT '',
  `paypal_correlation_id` varchar(255) DEFAULT '',
  `paypal_payer_id` varchar(255) DEFAULT '',
  `paypal_payer_status` varchar(255) DEFAULT '',
  `po_number` varchar(255) DEFAULT '',
  `additional_data` text,
  `cc_ss_issue` varchar(255) DEFAULT NULL,
  `additional_information` text,
  PRIMARY KEY (`payment_id`),
  KEY `FK_SALES_QUOTE_PAYMENT_SALES_QUOTE` (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_flat_quote_payment`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_flat_quote_shipping_rate`
--

CREATE TABLE IF NOT EXISTS `sales_flat_quote_shipping_rate` (
  `rate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `carrier` varchar(255) DEFAULT NULL,
  `carrier_title` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `method_description` text,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `error_message` text,
  `method_title` text,
  PRIMARY KEY (`rate_id`),
  KEY `FK_SALES_QUOTE_SHIPPING_RATE_ADDRESS` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_flat_quote_shipping_rate`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_invoiced_aggregated`
--

CREATE TABLE IF NOT EXISTS `sales_invoiced_aggregated` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `orders_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `invoiced_captured` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `invoiced_not_captured` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_invoiced_aggregated`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_invoiced_aggregated_order`
--

CREATE TABLE IF NOT EXISTS `sales_invoiced_aggregated_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `orders_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `invoiced_captured` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `invoiced_not_captured` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_invoiced_aggregated_order`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_order`
--

CREATE TABLE IF NOT EXISTS `sales_order` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `increment_id` varchar(50) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `customer_id` int(10) unsigned DEFAULT NULL,
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_paid` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_canceled` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_online_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_offline_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_paid` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_canceled` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_online_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_offline_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `subtotal_refunded` decimal(12,4) DEFAULT NULL,
  `subtotal_canceled` decimal(12,4) DEFAULT NULL,
  `discount_refunded` decimal(12,4) DEFAULT NULL,
  `discount_canceled` decimal(12,4) DEFAULT NULL,
  `discount_invoiced` decimal(12,4) DEFAULT NULL,
  `tax_refunded` decimal(12,4) DEFAULT NULL,
  `tax_canceled` decimal(12,4) DEFAULT NULL,
  `shipping_refunded` decimal(12,4) DEFAULT NULL,
  `shipping_canceled` decimal(12,4) DEFAULT NULL,
  `base_subtotal_refunded` decimal(12,4) DEFAULT NULL,
  `base_subtotal_canceled` decimal(12,4) DEFAULT NULL,
  `base_discount_refunded` decimal(12,4) DEFAULT NULL,
  `base_discount_canceled` decimal(12,4) DEFAULT NULL,
  `base_discount_invoiced` decimal(12,4) DEFAULT NULL,
  `base_tax_refunded` decimal(12,4) DEFAULT NULL,
  `base_tax_canceled` decimal(12,4) DEFAULT NULL,
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL,
  `base_shipping_canceled` decimal(12,4) DEFAULT NULL,
  `subtotal_invoiced` decimal(12,4) DEFAULT NULL,
  `tax_invoiced` decimal(12,4) DEFAULT NULL,
  `shipping_invoiced` decimal(12,4) DEFAULT NULL,
  `base_subtotal_invoiced` decimal(12,4) DEFAULT NULL,
  `base_tax_invoiced` decimal(12,4) DEFAULT NULL,
  `base_shipping_invoiced` decimal(12,4) DEFAULT NULL,
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `shipping_tax_refunded` decimal(12,4) DEFAULT NULL,
  `base_shipping_tax_refunded` decimal(12,4) DEFAULT NULL,
  `base_total_invoiced_cost` decimal(12,4) DEFAULT NULL,
  `protect_code` varchar(6) DEFAULT NULL,
  `store_to_base_rate` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `store_to_order_rate` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_to_global_rate` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_to_order_rate` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `is_virtual` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_description` varchar(255) NOT NULL DEFAULT '',
  `coupon_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `FK_SALES_ORDER_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_STORE` (`store_id`),
  KEY `IDX_CUSTOMER` (`customer_id`),
  KEY `IDX_INCREMENT_ID` (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_order`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_order_aggregated_created`
--

CREATE TABLE IF NOT EXISTS `sales_order_aggregated_created` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_grand_total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_order_aggregated_created`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_order_datetime`
--

CREATE TABLE IF NOT EXISTS `sales_order_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_DATETIME` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_order_datetime`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_order_decimal`
--

CREATE TABLE IF NOT EXISTS `sales_order_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_DECIMAL` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_order_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_order_entity`
--

CREATE TABLE IF NOT EXISTS `sales_order_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `increment_id` varchar(50) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entity_id`),
  KEY `FK_SALES_ORDER_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_STORE` (`store_id`),
  KEY `IDX_SALES_ORDER_ENTITY_PARENT` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_order_entity`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_order_entity_datetime`
--

CREATE TABLE IF NOT EXISTS `sales_order_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_ENTITY_DATETIME` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_order_entity_datetime`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_order_entity_decimal`
--

CREATE TABLE IF NOT EXISTS `sales_order_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_ENTITY_DECIMAL` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_order_entity_decimal`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_order_entity_int`
--

CREATE TABLE IF NOT EXISTS `sales_order_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_ENTITY_INT` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_order_entity_int`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_order_entity_text`
--

CREATE TABLE IF NOT EXISTS `sales_order_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_ENTITY_TEXT` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_order_entity_text`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_order_entity_varchar`
--

CREATE TABLE IF NOT EXISTS `sales_order_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_ENTITY_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_ENTITY_VARCHAR` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_order_entity_varchar`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_order_int`
--

CREATE TABLE IF NOT EXISTS `sales_order_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_INT` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_order_int`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_order_tax`
--

CREATE TABLE IF NOT EXISTS `sales_order_tax` (
  `tax_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `percent` decimal(12,4) NOT NULL,
  `amount` decimal(12,4) NOT NULL,
  `priority` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `base_amount` decimal(12,4) NOT NULL,
  `process` smallint(6) NOT NULL,
  `base_real_amount` decimal(12,4) NOT NULL,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tax_id`),
  KEY `IDX_ORDER_TAX` (`order_id`,`priority`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_order_tax`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_order_text`
--

CREATE TABLE IF NOT EXISTS `sales_order_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_TEXT` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_order_text`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_order_varchar`
--

CREATE TABLE IF NOT EXISTS `sales_order_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_ENTITY_ATTRIBUTE_TYPE` (`entity_id`,`attribute_id`,`entity_type_id`),
  KEY `FK_SALES_ORDER_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_SALES_ORDER_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_SALES_ORDER_VARCHAR` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_order_varchar`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_payment_transaction`
--

CREATE TABLE IF NOT EXISTS `sales_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `payment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `txn_id` varchar(100) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(100) DEFAULT NULL,
  `txn_type` varchar(15) NOT NULL DEFAULT '',
  `is_closed` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `additional_information` blob,
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `UNQ_ORDER_PAYMENT_TXN` (`order_id`,`payment_id`,`txn_id`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  KEY `IDX_PAYMENT_ID` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_payment_transaction`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_refunded_aggregated`
--

CREATE TABLE IF NOT EXISTS `sales_refunded_aggregated` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `online_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `offline_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_refunded_aggregated`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_refunded_aggregated_order`
--

CREATE TABLE IF NOT EXISTS `sales_refunded_aggregated_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `online_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `offline_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_refunded_aggregated_order`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_shipping_aggregated`
--

CREATE TABLE IF NOT EXISTS `sales_shipping_aggregated` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `shipping_description` varchar(255) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `total_shipping` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_shipping_aggregated`
--


-- --------------------------------------------------------

--
-- Table structure for table `sales_shipping_aggregated_order`
--

CREATE TABLE IF NOT EXISTS `sales_shipping_aggregated_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `shipping_description` varchar(255) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `total_shipping` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sales_shipping_aggregated_order`
--


-- --------------------------------------------------------

--
-- Table structure for table `salesrule`
--

CREATE TABLE IF NOT EXISTS `salesrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `from_date` date DEFAULT '0000-00-00',
  `to_date` date DEFAULT '0000-00-00',
  `coupon_code` varchar(255) DEFAULT NULL,
  `uses_per_coupon` int(11) NOT NULL DEFAULT '0',
  `uses_per_customer` int(11) NOT NULL DEFAULT '0',
  `customer_group_ids` varchar(255) NOT NULL DEFAULT '',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `conditions_serialized` mediumtext NOT NULL,
  `actions_serialized` mediumtext NOT NULL,
  `stop_rules_processing` tinyint(1) NOT NULL DEFAULT '1',
  `is_advanced` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `product_ids` text,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `simple_action` varchar(32) NOT NULL DEFAULT '',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_qty` decimal(12,4) unsigned DEFAULT NULL,
  `discount_step` int(10) unsigned NOT NULL,
  `simple_free_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `apply_to_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `times_used` int(11) unsigned NOT NULL DEFAULT '0',
  `is_rss` tinyint(4) NOT NULL DEFAULT '0',
  `website_ids` text,
  PRIMARY KEY (`rule_id`),
  KEY `sort_order` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `salesrule`
--


-- --------------------------------------------------------

--
-- Table structure for table `salesrule_customer`
--

CREATE TABLE IF NOT EXISTS `salesrule_customer` (
  `rule_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `times_used` smallint(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rule_customer_id`),
  KEY `rule_id` (`rule_id`,`customer_id`),
  KEY `customer_id` (`customer_id`,`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `salesrule_customer`
--


-- --------------------------------------------------------

--
-- Table structure for table `salesrule_label`
--

CREATE TABLE IF NOT EXISTS `salesrule_label` (
  `label_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `IDX_RULE_STORE` (`rule_id`,`store_id`),
  KEY `FK_SALESRULE_LABEL_STORE` (`store_id`),
  KEY `FK_SALESRULE_LABEL_RULE` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `salesrule_label`
--


-- --------------------------------------------------------

--
-- Table structure for table `sendfriend_log`
--

CREATE TABLE IF NOT EXISTS `sendfriend_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` bigint(20) NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL,
  `website_id` smallint(5) NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `IDX_REMOTE_ADDR` (`ip`),
  KEY `IDX_LOG_TIME` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sendfriend_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `shipping_tablerate`
--

CREATE TABLE IF NOT EXISTS `shipping_tablerate` (
  `pk` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) NOT NULL DEFAULT '0',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0',
  `dest_region_id` int(10) NOT NULL DEFAULT '0',
  `dest_zip` varchar(10) NOT NULL DEFAULT '',
  `condition_name` varchar(20) NOT NULL DEFAULT '',
  `condition_value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `cost` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `dest_country` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shipping_tablerate`
--


-- --------------------------------------------------------

--
-- Table structure for table `sitemap`
--

CREATE TABLE IF NOT EXISTS `sitemap` (
  `sitemap_id` int(11) NOT NULL AUTO_INCREMENT,
  `sitemap_type` varchar(32) DEFAULT NULL,
  `sitemap_filename` varchar(32) DEFAULT NULL,
  `sitemap_path` tinytext,
  `sitemap_time` timestamp NULL DEFAULT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`sitemap_id`),
  KEY `FK_SITEMAP_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sitemap`
--


-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `tag_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT '0',
  `first_customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `first_store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tag`
--


-- --------------------------------------------------------

--
-- Table structure for table `tag_relation`
--

CREATE TABLE IF NOT EXISTS `tag_relation` (
  `tag_relation_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) unsigned NOT NULL DEFAULT '0',
  `customer_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(6) unsigned NOT NULL DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`tag_relation_id`),
  KEY `IDX_PRODUCT` (`product_id`),
  KEY `IDX_TAG` (`tag_id`),
  KEY `IDX_CUSTOMER` (`customer_id`),
  KEY `IDX_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tag_relation`
--


-- --------------------------------------------------------

--
-- Table structure for table `tag_summary`
--

CREATE TABLE IF NOT EXISTS `tag_summary` (
  `tag_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `customers` int(11) unsigned NOT NULL DEFAULT '0',
  `products` int(11) unsigned NOT NULL DEFAULT '0',
  `uses` int(11) unsigned NOT NULL DEFAULT '0',
  `historical_uses` int(11) unsigned NOT NULL DEFAULT '0',
  `popularity` int(11) unsigned NOT NULL DEFAULT '0',
  `base_popularity` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tag_id`,`store_id`),
  KEY `FK_TAG_SUMMARY_STORE` (`store_id`),
  KEY `IDX_TAG` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag_summary`
--


-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation`
--

CREATE TABLE IF NOT EXISTS `tax_calculation` (
  `tax_calculation_rate_id` int(11) NOT NULL,
  `tax_calculation_rule_id` int(11) NOT NULL,
  `customer_tax_class_id` smallint(6) NOT NULL,
  `product_tax_class_id` smallint(6) NOT NULL,
  KEY `FK_TAX_CALCULATION_RULE` (`tax_calculation_rule_id`),
  KEY `FK_TAX_CALCULATION_RATE` (`tax_calculation_rate_id`),
  KEY `FK_TAX_CALCULATION_CTC` (`customer_tax_class_id`),
  KEY `FK_TAX_CALCULATION_PTC` (`product_tax_class_id`),
  KEY `IDX_TAX_CALCULATION` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tax_calculation`
--

INSERT INTO `tax_calculation` (`tax_calculation_rate_id`, `tax_calculation_rule_id`, `customer_tax_class_id`, `product_tax_class_id`) VALUES
(1, 1, 3, 2),
(2, 1, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation_rate`
--

CREATE TABLE IF NOT EXISTS `tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_country_id` char(2) NOT NULL,
  `tax_region_id` mediumint(9) NOT NULL,
  `tax_postcode` varchar(12) NOT NULL,
  `code` varchar(255) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `zip_is_range` tinyint(1) DEFAULT NULL,
  `zip_from` varchar(10) DEFAULT NULL,
  `zip_to` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`tax_calculation_rate_id`),
  KEY `IDX_TAX_CALCULATION_RATE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `IDX_TAX_CALCULATION_RATE_CODE` (`code`),
  KEY `IDX_TAX_CALCULATION_RATE_RANGE` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tax_calculation_rate`
--

INSERT INTO `tax_calculation_rate` (`tax_calculation_rate_id`, `tax_country_id`, `tax_region_id`, `tax_postcode`, `code`, `rate`, `zip_is_range`, `zip_from`, `zip_to`) VALUES
(1, 'US', 12, '*', 'US-CA-*-Rate 1', 8.2500, NULL, NULL, NULL),
(2, 'US', 43, '*', 'US-NY-*-Rate 1', 8.3750, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation_rate_title`
--

CREATE TABLE IF NOT EXISTS `tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_calculation_rate_id` int(11) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`tax_calculation_rate_title_id`),
  KEY `IDX_TAX_CALCULATION_RATE_TITLE` (`tax_calculation_rate_id`,`store_id`),
  KEY `FK_TAX_CALCULATION_RATE_TITLE_RATE` (`tax_calculation_rate_id`),
  KEY `FK_TAX_CALCULATION_RATE_TITLE_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tax_calculation_rate_title`
--


-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation_rule`
--

CREATE TABLE IF NOT EXISTS `tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `priority` mediumint(9) NOT NULL,
  `position` mediumint(9) NOT NULL,
  PRIMARY KEY (`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALCULATION_RULE` (`priority`,`position`,`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tax_calculation_rule`
--

INSERT INTO `tax_calculation_rule` (`tax_calculation_rule_id`, `code`, `priority`, `position`) VALUES
(1, 'Retail Customer-Taxable Goods-Rate 1', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tax_class`
--

CREATE TABLE IF NOT EXISTS `tax_class` (
  `class_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL DEFAULT '',
  `class_type` enum('CUSTOMER','PRODUCT') NOT NULL DEFAULT 'CUSTOMER',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tax_class`
--

INSERT INTO `tax_class` (`class_id`, `class_name`, `class_type`) VALUES
(2, 'Taxable Goods', 'PRODUCT'),
(3, 'Retail Customer', 'CUSTOMER'),
(4, 'Shipping', 'PRODUCT');

-- --------------------------------------------------------

--
-- Table structure for table `tax_order_aggregated_created`
--

CREATE TABLE IF NOT EXISTS `tax_order_aggregated_created` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `code` varchar(255) NOT NULL DEFAULT '',
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `percent` float(12,4) NOT NULL DEFAULT '0.0000',
  `orders_count` int(11) unsigned NOT NULL DEFAULT '0',
  `tax_base_amount_sum` float(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_CODE_ORDER_STATUS` (`period`,`store_id`,`code`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tax_order_aggregated_created`
--


-- --------------------------------------------------------

--
-- Table structure for table `weee_discount`
--

CREATE TABLE IF NOT EXISTS `weee_discount` (
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_WEBSITE` (`website_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_GROUP` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `weee_discount`
--


-- --------------------------------------------------------

--
-- Table structure for table `weee_tax`
--

CREATE TABLE IF NOT EXISTS `weee_tax` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `country` varchar(2) NOT NULL DEFAULT '',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `state` varchar(255) NOT NULL DEFAULT '*',
  `attribute_id` smallint(5) unsigned NOT NULL,
  `entity_type_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`value_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_WEBSITE` (`website_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_COUNTRY` (`country`),
  KEY `FK_WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `weee_tax`
--


-- --------------------------------------------------------

--
-- Table structure for table `widget`
--

CREATE TABLE IF NOT EXISTS `widget` (
  `widget_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `parameters` text,
  PRIMARY KEY (`widget_id`),
  KEY `IDX_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preconfigured Widgets' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `widget`
--


-- --------------------------------------------------------

--
-- Table structure for table `widget_instance`
--

CREATE TABLE IF NOT EXISTS `widget_instance` (
  `instance_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `package_theme` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `store_ids` varchar(255) NOT NULL DEFAULT '0',
  `widget_parameters` text,
  `sort_order` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `widget_instance`
--


-- --------------------------------------------------------

--
-- Table structure for table `widget_instance_page`
--

CREATE TABLE IF NOT EXISTS `widget_instance_page` (
  `page_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) unsigned NOT NULL DEFAULT '0',
  `group` varchar(25) NOT NULL DEFAULT '',
  `layout_handle` varchar(255) NOT NULL DEFAULT '',
  `block_reference` varchar(255) NOT NULL DEFAULT '',
  `for` varchar(25) NOT NULL DEFAULT '',
  `entities` text,
  `template` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`page_id`),
  KEY `IDX_WIDGET_WIDGET_INSTANCE_ID` (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `widget_instance_page`
--


-- --------------------------------------------------------

--
-- Table structure for table `widget_instance_page_layout`
--

CREATE TABLE IF NOT EXISTS `widget_instance_page_layout` (
  `page_id` int(11) unsigned NOT NULL DEFAULT '0',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `page_id` (`page_id`,`layout_update_id`),
  KEY `IDX_WIDGET_WIDGET_INSTANCE_PAGE_ID` (`page_id`),
  KEY `IDX_WIDGET_WIDGET_INSTANCE_LAYOUT_UPDATE_ID` (`layout_update_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `widget_instance_page_layout`
--


-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE IF NOT EXISTS `wishlist` (
  `wishlist_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `shared` tinyint(1) unsigned DEFAULT '0',
  `sharing_code` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `UNQ_CUSTOMER` (`customer_id`),
  KEY `IDX_IS_SHARED` (`shared`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Wishlist main' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wishlist`
--


-- --------------------------------------------------------

--
-- Table structure for table `wishlist_item`
--

CREATE TABLE IF NOT EXISTS `wishlist_item` (
  `wishlist_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wishlist_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `added_at` datetime DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`wishlist_item_id`),
  KEY `IDX_WISHLIST` (`wishlist_id`),
  KEY `IDX_PRODUCT` (`product_id`),
  KEY `IDX_STORE` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wishlist_item`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_rule`
--
ALTER TABLE `admin_rule`
  ADD CONSTRAINT `FK_admin_rule` FOREIGN KEY (`role_id`) REFERENCES `admin_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `api_rule`
--
ALTER TABLE `api_rule`
  ADD CONSTRAINT `FK_api_rule` FOREIGN KEY (`role_id`) REFERENCES `api_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `api_session`
--
ALTER TABLE `api_session`
  ADD CONSTRAINT `FK_API_SESSION_USER` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_datetime`
--
ALTER TABLE `catalog_category_entity_datetime`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_decimal`
--
ALTER TABLE `catalog_category_entity_decimal`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_int`
--
ALTER TABLE `catalog_category_entity_int`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_EMTITY_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_EMTITY_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_EMTITY_INT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_text`
--
ALTER TABLE `catalog_category_entity_text`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_varchar`
--
ALTER TABLE `catalog_category_entity_varchar`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_product`
--
ALTER TABLE `catalog_category_product`
  ADD CONSTRAINT `CATALOG_CATEGORY_PRODUCT_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CATALOG_CATEGORY_PRODUCT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_product_index`
--
ALTER TABLE `catalog_category_product_index`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_PRODUCT_INDEX_CATEGORY_ENTITY` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_PRODUCT_INDEX_PRODUCT_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATEGORY_PRODUCT_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_compare_item`
--
ALTER TABLE `catalog_compare_item`
  ADD CONSTRAINT `FK_CATALOG_COMPARE_ITEM_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_COMPARE_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_COMPARE_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `catalog_eav_attribute`
--
ALTER TABLE `catalog_eav_attribute`
  ADD CONSTRAINT `FK_CATALOG_EAV_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_bundle_option`
--
ALTER TABLE `catalog_product_bundle_option`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_bundle_option_value`
--
ALTER TABLE `catalog_product_bundle_option_value`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_OPTION_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_bundle_price_index`
--
ALTER TABLE `catalog_product_bundle_price_index`
  ADD CONSTRAINT `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_bundle_selection`
--
ALTER TABLE `catalog_product_bundle_selection`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_enabled_index`
--
ALTER TABLE `catalog_product_enabled_index`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENABLED_INDEX_PRODUCT_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENABLED_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity`
--
ALTER TABLE `catalog_product_entity`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_datetime`
--
ALTER TABLE `catalog_product_entity_datetime`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DATETIME_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DATETIME_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_decimal`
--
ALTER TABLE `catalog_product_entity_decimal`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_gallery`
--
ALTER TABLE `catalog_product_entity_gallery`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_int`
--
ALTER TABLE `catalog_product_entity_int`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_media_gallery`
--
ALTER TABLE `catalog_product_entity_media_gallery`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_entity_media_gallery_value`
--
ALTER TABLE `catalog_product_entity_media_gallery_value`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_VALUE_GALLERY` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_VALUE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_entity_text`
--
ALTER TABLE `catalog_product_entity_text`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_tier_price`
--
ALTER TABLE `catalog_product_entity_tier_price`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TIER_PRICE_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TIER_PRICE_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_TIER_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_varchar`
--
ALTER TABLE `catalog_product_entity_varchar`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_eav`
--
ALTER TABLE `catalog_product_index_eav`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_eav_decimal`
--
ALTER TABLE `catalog_product_index_eav_decimal`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_price`
--
ALTER TABLE `catalog_product_index_price`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_tier_price`
--
ALTER TABLE `catalog_product_index_tier_price`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_website`
--
ALTER TABLE `catalog_product_index_website`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_link`
--
ALTER TABLE `catalog_product_link`
  ADD CONSTRAINT `FK_PRODUCT_LINK_LINKED_PRODUCT` FOREIGN KEY (`linked_product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_LINK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_LINK_TYPE` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute`
--
ALTER TABLE `catalog_product_link_attribute`
  ADD CONSTRAINT `FK_ATTRIBUTE_PRODUCT_LINK_TYPE` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute_decimal`
--
ALTER TABLE `catalog_product_link_attribute_decimal`
  ADD CONSTRAINT `FK_DECIMAL_LINK` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DECIMAL_PRODUCT_LINK_ATTRIBUTE` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute_int`
--
ALTER TABLE `catalog_product_link_attribute_int`
  ADD CONSTRAINT `FK_INT_PRODUCT_LINK` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_INT_PRODUCT_LINK_ATTRIBUTE` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute_varchar`
--
ALTER TABLE `catalog_product_link_attribute_varchar`
  ADD CONSTRAINT `FK_VARCHAR_LINK` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VARCHAR_PRODUCT_LINK_ATTRIBUTE` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option`
--
ALTER TABLE `catalog_product_option`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_price`
--
ALTER TABLE `catalog_product_option_price`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRICE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRICE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_title`
--
ALTER TABLE `catalog_product_option_title`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TITLE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_type_price`
--
ALTER TABLE `catalog_product_option_type_price`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_type_title`
--
ALTER TABLE `catalog_product_option_type_title`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_type_value`
--
ALTER TABLE `catalog_product_option_type_value`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_relation`
--
ALTER TABLE `catalog_product_relation`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_RELATION_CHILD` FOREIGN KEY (`child_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_RELATION_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_super_attribute`
--
ALTER TABLE `catalog_product_super_attribute`
  ADD CONSTRAINT `FK_SUPER_PRODUCT_ATTRIBUTE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_super_attribute_label`
--
ALTER TABLE `catalog_product_super_attribute_label`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_ATTRIBUTE` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_super_attribute_pricing`
--
ALTER TABLE `catalog_product_super_attribute_pricing`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_SUPER_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SUPER_PRODUCT_ATTRIBUTE_PRICING` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_super_link`
--
ALTER TABLE `catalog_product_super_link`
  ADD CONSTRAINT `FK_SUPER_PRODUCT_LINK_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SUPER_PRODUCT_LINK_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_website`
--
ALTER TABLE `catalog_product_website`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_WEBSITE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_WEBSITE_PRODUCT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogindex_aggregation`
--
ALTER TABLE `catalogindex_aggregation`
  ADD CONSTRAINT `FK_CATALOGINDEX_AGGREGATION_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogindex_aggregation_to_tag`
--
ALTER TABLE `catalogindex_aggregation_to_tag`
  ADD CONSTRAINT `FK_CATALOGINDEX_AGGREGATION_TO_TAG_AGGREGATION` FOREIGN KEY (`aggregation_id`) REFERENCES `catalogindex_aggregation` (`aggregation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGINDEX_AGGREGATION_TO_TAG_TAG` FOREIGN KEY (`tag_id`) REFERENCES `catalogindex_aggregation_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogindex_eav`
--
ALTER TABLE `catalogindex_eav`
  ADD CONSTRAINT `FK_CATALOGINDEX_EAV_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGINDEX_EAV_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGINDEX_EAV_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogindex_minimal_price`
--
ALTER TABLE `catalogindex_minimal_price`
  ADD CONSTRAINT `FK_CATALOGINDEX_MINIMAL_PRICE_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGINDEX_MINIMAL_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CI_MINIMAL_PRICE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogindex_price`
--
ALTER TABLE `catalogindex_price`
  ADD CONSTRAINT `FK_CATALOGINDEX_PRICE_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGINDEX_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CI_PRICE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cataloginventory_stock_item`
--
ALTER TABLE `cataloginventory_stock_item`
  ADD CONSTRAINT `FK_CATALOGINVENTORY_STOCK_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGINVENTORY_STOCK_ITEM_STOCK` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cataloginventory_stock_status`
--
ALTER TABLE `cataloginventory_stock_status`
  ADD CONSTRAINT `FK_CATALOGINVENTORY_STOCK_STATUS_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGINVENTORY_STOCK_STATUS_STOCK` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGINVENTORY_STOCK_STATUS_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogrule_group_website`
--
ALTER TABLE `catalogrule_group_website`
  ADD CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_RULE` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogrule_product`
--
ALTER TABLE `catalogrule_product`
  ADD CONSTRAINT `FK_catalogrule_product_customergroup` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGRULE_PRODUCT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_catalogrule_product_rule` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_catalogrule_product_website` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogrule_product_price`
--
ALTER TABLE `catalogrule_product_price`
  ADD CONSTRAINT `FK_catalogrule_product_price_customergroup` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGRULE_PRODUCT_PRICE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_catalogrule_product_price_website` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogsearch_query`
--
ALTER TABLE `catalogsearch_query`
  ADD CONSTRAINT `FK_CATALOGSEARCH_QUERY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogsearch_result`
--
ALTER TABLE `catalogsearch_result`
  ADD CONSTRAINT `FK_CATALOGSEARCH_RESULT_CATALOG_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGSEARCH_RESULT_QUERY` FOREIGN KEY (`query_id`) REFERENCES `catalogsearch_query` (`query_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `checkout_agreement_store`
--
ALTER TABLE `checkout_agreement_store`
  ADD CONSTRAINT `FK_CHECKOUT_AGREEMENT` FOREIGN KEY (`agreement_id`) REFERENCES `checkout_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CHECKOUT_AGREEMENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cms_block_store`
--
ALTER TABLE `cms_block_store`
  ADD CONSTRAINT `FK_CMS_BLOCK_STORE_BLOCK` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`block_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CMS_BLOCK_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cms_page_store`
--
ALTER TABLE `cms_page_store`
  ADD CONSTRAINT `FK_CMS_PAGE_STORE_PAGE` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CMS_PAGE_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_cache_tag`
--
ALTER TABLE `core_cache_tag`
  ADD CONSTRAINT `FK_CORE_CACHE_TAG` FOREIGN KEY (`cache_id`) REFERENCES `core_cache` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_layout_link`
--
ALTER TABLE `core_layout_link`
  ADD CONSTRAINT `FK_CORE_LAYOUT_LINK_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_LAYOUT_LINK_UPDATE` FOREIGN KEY (`layout_update_id`) REFERENCES `core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_session`
--
ALTER TABLE `core_session`
  ADD CONSTRAINT `FK_SESSION_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_store`
--
ALTER TABLE `core_store`
  ADD CONSTRAINT `FK_STORE_GROUP_STORE` FOREIGN KEY (`group_id`) REFERENCES `core_store_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_STORE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_store_group`
--
ALTER TABLE `core_store_group`
  ADD CONSTRAINT `FK_STORE_GROUP_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_translate`
--
ALTER TABLE `core_translate`
  ADD CONSTRAINT `FK_CORE_TRANSLATE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_url_rewrite`
--
ALTER TABLE `core_url_rewrite`
  ADD CONSTRAINT `FK_CORE_URL_REWRITE_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_URL_REWRITE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_URL_REWRITE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_variable_value`
--
ALTER TABLE `core_variable_value`
  ADD CONSTRAINT `FK_CORE_VARIABLE_VALUE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_VARIABLE_VALUE_VARIABLE_ID` FOREIGN KEY (`variable_id`) REFERENCES `core_variable` (`variable_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coupon_aggregated`
--
ALTER TABLE `coupon_aggregated`
  ADD CONSTRAINT `FK_SALESTRULE_COUPON_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coupon_aggregated_order`
--
ALTER TABLE `coupon_aggregated_order`
  ADD CONSTRAINT `FK_SALESTRULE_COUPON_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity`
--
ALTER TABLE `customer_address_entity`
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_CUSTOMER_ID` FOREIGN KEY (`parent_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_datetime`
--
ALTER TABLE `customer_address_entity_datetime`
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_decimal`
--
ALTER TABLE `customer_address_entity_decimal`
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_int`
--
ALTER TABLE `customer_address_entity_int`
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_text`
--
ALTER TABLE `customer_address_entity_text`
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_varchar`
--
ALTER TABLE `customer_address_entity_varchar`
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_eav_attribute`
--
ALTER TABLE `customer_eav_attribute`
  ADD CONSTRAINT `FK_CUSTOMER_EAV_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity`
--
ALTER TABLE `customer_entity`
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_datetime`
--
ALTER TABLE `customer_entity_datetime`
  ADD CONSTRAINT `FK_CUSTOMER_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_decimal`
--
ALTER TABLE `customer_entity_decimal`
  ADD CONSTRAINT `FK_CUSTOMER_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_int`
--
ALTER TABLE `customer_entity_int`
  ADD CONSTRAINT `FK_CUSTOMER_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_text`
--
ALTER TABLE `customer_entity_text`
  ADD CONSTRAINT `FK_CUSTOMER_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_varchar`
--
ALTER TABLE `customer_entity_varchar`
  ADD CONSTRAINT `FK_CUSTOMER_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dataflow_batch`
--
ALTER TABLE `dataflow_batch`
  ADD CONSTRAINT `FK_DATAFLOW_BATCH_PROFILE` FOREIGN KEY (`profile_id`) REFERENCES `dataflow_profile` (`profile_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DATAFLOW_BATCH_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `dataflow_batch_export`
--
ALTER TABLE `dataflow_batch_export`
  ADD CONSTRAINT `FK_DATAFLOW_BATCH_EXPORT_BATCH` FOREIGN KEY (`batch_id`) REFERENCES `dataflow_batch` (`batch_id`) ON DELETE CASCADE;

--
-- Constraints for table `dataflow_batch_import`
--
ALTER TABLE `dataflow_batch_import`
  ADD CONSTRAINT `FK_DATAFLOW_BATCH_IMPORT_BATCH` FOREIGN KEY (`batch_id`) REFERENCES `dataflow_batch` (`batch_id`) ON DELETE CASCADE;

--
-- Constraints for table `dataflow_import_data`
--
ALTER TABLE `dataflow_import_data`
  ADD CONSTRAINT `FK_dataflow_import_data` FOREIGN KEY (`session_id`) REFERENCES `dataflow_session` (`session_id`);

--
-- Constraints for table `dataflow_profile_history`
--
ALTER TABLE `dataflow_profile_history`
  ADD CONSTRAINT `FK_dataflow_profile_history` FOREIGN KEY (`profile_id`) REFERENCES `dataflow_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `design_change`
--
ALTER TABLE `design_change`
  ADD CONSTRAINT `FK_DESIGN_CHANGE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `directory_country_region_name`
--
ALTER TABLE `directory_country_region_name`
  ADD CONSTRAINT `FK_DIRECTORY_REGION_NAME_REGION` FOREIGN KEY (`region_id`) REFERENCES `directory_country_region` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link`
--
ALTER TABLE `downloadable_link`
  ADD CONSTRAINT `FK_DOWNLODABLE_LINK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link_price`
--
ALTER TABLE `downloadable_link_price`
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_LINK` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  ADD CONSTRAINT `FK_DOWNLOADABLE_ORDER_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_PURCHASED_ORDER_ITEM_ID` FOREIGN KEY (`order_item_id`) REFERENCES `sales_flat_order_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link_purchased_item`
--
ALTER TABLE `downloadable_link_purchased_item`
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_PURCHASED_ID` FOREIGN KEY (`purchased_id`) REFERENCES `downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_ORDER_ITEM_ID` FOREIGN KEY (`order_item_id`) REFERENCES `sales_flat_order_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link_title`
--
ALTER TABLE `downloadable_link_title`
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_LINK` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_sample`
--
ALTER TABLE `downloadable_sample`
  ADD CONSTRAINT `FK_DOWNLODABLE_SAMPLE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_sample_title`
--
ALTER TABLE `downloadable_sample_title`
  ADD CONSTRAINT `FK_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE` FOREIGN KEY (`sample_id`) REFERENCES `downloadable_sample` (`sample_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_SAMPLE_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute`
--
ALTER TABLE `eav_attribute`
  ADD CONSTRAINT `FK_eav_attribute` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_group`
--
ALTER TABLE `eav_attribute_group`
  ADD CONSTRAINT `FK_eav_attribute_group` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_label`
--
ALTER TABLE `eav_attribute_label`
  ADD CONSTRAINT `FK_ATTRIBUTE_LABEL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ATTRIBUTE_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  ADD CONSTRAINT `FK_ATTRIBUTE_OPTION_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_option_value`
--
ALTER TABLE `eav_attribute_option_value`
  ADD CONSTRAINT `FK_ATTRIBUTE_OPTION_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ATTRIBUTE_OPTION_VALUE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_set`
--
ALTER TABLE `eav_attribute_set`
  ADD CONSTRAINT `FK_eav_attribute_set` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity`
--
ALTER TABLE `eav_entity`
  ADD CONSTRAINT `FK_eav_entity` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_eav_entity_store` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_attribute`
--
ALTER TABLE `eav_entity_attribute`
  ADD CONSTRAINT `FK_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_ATTRIBUTE_GROUP` FOREIGN KEY (`attribute_group_id`) REFERENCES `eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_datetime`
--
ALTER TABLE `eav_entity_datetime`
  ADD CONSTRAINT `FK_EAV_ENTITY_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_DATETIME_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_decimal`
--
ALTER TABLE `eav_entity_decimal`
  ADD CONSTRAINT `FK_EAV_ENTITY_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_int`
--
ALTER TABLE `eav_entity_int`
  ADD CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_INT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_store`
--
ALTER TABLE `eav_entity_store`
  ADD CONSTRAINT `FK_eav_entity_store_entity_type` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_eav_entity_store_store` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_text`
--
ALTER TABLE `eav_entity_text`
  ADD CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_TEXT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_varchar`
--
ALTER TABLE `eav_entity_varchar`
  ADD CONSTRAINT `FK_EAV_ENTITY_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_VARCHAR_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_element`
--
ALTER TABLE `eav_form_element`
  ADD CONSTRAINT `FK_EAV_FORM_ELEMENT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_ELEMENT_FORM_FIELDSET` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_ELEMENT_FORM_TYPE` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_fieldset`
--
ALTER TABLE `eav_form_fieldset`
  ADD CONSTRAINT `FK_EAV_FORM_FIELDSET_FORM_TYPE` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_fieldset_label`
--
ALTER TABLE `eav_form_fieldset_label`
  ADD CONSTRAINT `FK_EAV_FORM_FIELDSET_LABEL_FORM_FIELDSET` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_FIELDSET_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_type`
--
ALTER TABLE `eav_form_type`
  ADD CONSTRAINT `FK_EAV_FORM_TYPE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_type_entity`
--
ALTER TABLE `eav_form_type_entity`
  ADD CONSTRAINT `FK_EAV_FORM_TYPE_ENTITY_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_TYPE_ENTITY_FORM_TYPE` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `googlebase_attributes`
--
ALTER TABLE `googlebase_attributes`
  ADD CONSTRAINT `GOOGLEBASE_ATTRIBUTES_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `GOOGLEBASE_ATTRIBUTES_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `googlebase_types` (`type_id`) ON DELETE CASCADE;

--
-- Constraints for table `googlebase_items`
--
ALTER TABLE `googlebase_items`
  ADD CONSTRAINT `GOOGLEBASE_ITEMS_PRODUCT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `GOOGLEBASE_ITEMS_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `googlebase_types`
--
ALTER TABLE `googlebase_types`
  ADD CONSTRAINT `GOOGLEBASE_TYPES_ATTRIBUTE_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE;

--
-- Constraints for table `googleoptimizer_code`
--
ALTER TABLE `googleoptimizer_code`
  ADD CONSTRAINT `FK_GOOGLEOPTIMIZER_CODE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `index_process_event`
--
ALTER TABLE `index_process_event`
  ADD CONSTRAINT `FK_INDEX_EVNT_PROCESS` FOREIGN KEY (`event_id`) REFERENCES `index_event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_INDEX_PROCESS_EVENT` FOREIGN KEY (`process_id`) REFERENCES `index_process` (`process_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsletter_problem`
--
ALTER TABLE `newsletter_problem`
  ADD CONSTRAINT `FK_PROBLEM_QUEUE` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`),
  ADD CONSTRAINT `FK_PROBLEM_SUBSCRIBER` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`);

--
-- Constraints for table `newsletter_queue`
--
ALTER TABLE `newsletter_queue`
  ADD CONSTRAINT `FK_QUEUE_TEMPLATE` FOREIGN KEY (`template_id`) REFERENCES `newsletter_template` (`template_id`) ON DELETE CASCADE;

--
-- Constraints for table `newsletter_queue_link`
--
ALTER TABLE `newsletter_queue_link`
  ADD CONSTRAINT `FK_QUEUE_LINK_QUEUE` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_QUEUE_LINK_SUBSCRIBER` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE;

--
-- Constraints for table `newsletter_queue_store_link`
--
ALTER TABLE `newsletter_queue_store_link`
  ADD CONSTRAINT `FK_LINK_QUEUE` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_NEWSLETTER_QUEUE_STORE_LINK_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsletter_subscriber`
--
ALTER TABLE `newsletter_subscriber`
  ADD CONSTRAINT `FK_NEWSLETTER_SUBSCRIBER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `poll`
--
ALTER TABLE `poll`
  ADD CONSTRAINT `FK_POLL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `poll_answer`
--
ALTER TABLE `poll_answer`
  ADD CONSTRAINT `FK_POLL_PARENT` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `poll_store`
--
ALTER TABLE `poll_store`
  ADD CONSTRAINT `FK_POLL_STORE_POLL` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_POLL_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `poll_vote`
--
ALTER TABLE `poll_vote`
  ADD CONSTRAINT `FK_POLL_ANSWER` FOREIGN KEY (`poll_answer_id`) REFERENCES `poll_answer` (`answer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_alert_price`
--
ALTER TABLE `product_alert_price`
  ADD CONSTRAINT `FK_PRODUCT_ALERT_PRICE_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_PRICE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_alert_stock`
--
ALTER TABLE `product_alert_stock`
  ADD CONSTRAINT `FK_PRODUCT_ALERT_STOCK_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_STOCK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_STOCK_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `FK_RATING_ENTITY_KEY` FOREIGN KEY (`entity_id`) REFERENCES `rating_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_option`
--
ALTER TABLE `rating_option`
  ADD CONSTRAINT `FK_RATING_OPTION_RATING` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_option_vote`
--
ALTER TABLE `rating_option_vote`
  ADD CONSTRAINT `FK_RATING_OPTION_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RATING_OPTION_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `rating_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_option_vote_aggregated`
--
ALTER TABLE `rating_option_vote_aggregated`
  ADD CONSTRAINT `FK_RATING_OPTION_VALUE_AGGREGATE` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RATING_OPTION_VOTE_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_store`
--
ALTER TABLE `rating_store`
  ADD CONSTRAINT `FK_RATING_STORE_RATING` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_RATING_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_title`
--
ALTER TABLE `rating_title`
  ADD CONSTRAINT `FK_RATING_TITLE` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RATING_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_compared_product_index`
--
ALTER TABLE `report_compared_product_index`
  ADD CONSTRAINT `FK_REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_COMPARED_PRODUCT_INDEX_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_COMPARED_PRODUCT_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `report_event`
--
ALTER TABLE `report_event`
  ADD CONSTRAINT `FK_REPORT_EVENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_EVENT_TYPE` FOREIGN KEY (`event_type_id`) REFERENCES `report_event_types` (`event_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_viewed_product_index`
--
ALTER TABLE `report_viewed_product_index`
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRODUCT_INDEX_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRODUCT_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_REVIEW_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `review_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_STATUS` FOREIGN KEY (`status_id`) REFERENCES `review_status` (`status_id`);

--
-- Constraints for table `review_detail`
--
ALTER TABLE `review_detail`
  ADD CONSTRAINT `FK_REVIEW_DETAIL_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_DETAIL_REVIEW` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_DETAIL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `review_entity_summary`
--
ALTER TABLE `review_entity_summary`
  ADD CONSTRAINT `FK_REVIEW_ENTITY_SUMMARY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review_store`
--
ALTER TABLE `review_store`
  ADD CONSTRAINT `FK_REVIEW_STORE_REVIEW` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_order_item`
--
ALTER TABLE `sales_flat_order_item`
  ADD CONSTRAINT `FK_SALES_ORDER_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote`
--
ALTER TABLE `sales_flat_quote`
  ADD CONSTRAINT `FK_SALES_QUOTE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote_address`
--
ALTER TABLE `sales_flat_quote_address`
  ADD CONSTRAINT `FK_SALES_QUOTE_ADDRESS_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote_address_item`
--
ALTER TABLE `sales_flat_quote_address_item`
  ADD CONSTRAINT `FK_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS` FOREIGN KEY (`quote_address_id`) REFERENCES `sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_FLAT_QUOTE_ADDRESS_ITEM_PARENT` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_flat_quote_address_item` (`address_item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_QUOTE_ADDRESS_ITEM_QUOTE_ITEM` FOREIGN KEY (`quote_item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote_item`
--
ALTER TABLE `sales_flat_quote_item`
  ADD CONSTRAINT `FK_SALES_FLAT_QUOTE_ITEM_PARENT_ITEM` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_QUOTE_ITEM_CATALOG_PRODUCT_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_QUOTE_ITEM_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_QUOTE_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote_item_option`
--
ALTER TABLE `sales_flat_quote_item_option`
  ADD CONSTRAINT `FK_SALES_QUOTE_ITEM_OPTION_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote_payment`
--
ALTER TABLE `sales_flat_quote_payment`
  ADD CONSTRAINT `FK_SALES_QUOTE_PAYMENT_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_flat_quote_shipping_rate`
--
ALTER TABLE `sales_flat_quote_shipping_rate`
  ADD CONSTRAINT `FK_SALES_QUOTE_SHIPPING_RATE_ADDRESS` FOREIGN KEY (`address_id`) REFERENCES `sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_invoiced_aggregated`
--
ALTER TABLE `sales_invoiced_aggregated`
  ADD CONSTRAINT `FK_SALES_INVOICED_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_invoiced_aggregated_order`
--
ALTER TABLE `sales_invoiced_aggregated_order`
  ADD CONSTRAINT `FK_SALES_INVOICED_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_order`
--
ALTER TABLE `sales_order`
  ADD CONSTRAINT `FK_SALES_ORDER_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALE_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALE_ORDER_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_aggregated_created`
--
ALTER TABLE `sales_order_aggregated_created`
  ADD CONSTRAINT `FK_SALES_ORDER_AGGREGATED_CREATED` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_datetime`
--
ALTER TABLE `sales_order_datetime`
  ADD CONSTRAINT `FK_SALES_ORDER_DATETIME` FOREIGN KEY (`entity_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_decimal`
--
ALTER TABLE `sales_order_decimal`
  ADD CONSTRAINT `FK_SALES_ORDER_DECIMAL` FOREIGN KEY (`entity_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_entity`
--
ALTER TABLE `sales_order_entity`
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALE_ORDER_ENTITY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_entity_datetime`
--
ALTER TABLE `sales_order_entity_datetime`
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_DATETIME` FOREIGN KEY (`entity_id`) REFERENCES `sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_entity_decimal`
--
ALTER TABLE `sales_order_entity_decimal`
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_DECIMAL` FOREIGN KEY (`entity_id`) REFERENCES `sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_entity_int`
--
ALTER TABLE `sales_order_entity_int`
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_INT` FOREIGN KEY (`entity_id`) REFERENCES `sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_entity_text`
--
ALTER TABLE `sales_order_entity_text`
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_TEXT` FOREIGN KEY (`entity_id`) REFERENCES `sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_entity_varchar`
--
ALTER TABLE `sales_order_entity_varchar`
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_VARCHAR` FOREIGN KEY (`entity_id`) REFERENCES `sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ENTITY_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_int`
--
ALTER TABLE `sales_order_int`
  ADD CONSTRAINT `FK_SALES_ORDER_INT` FOREIGN KEY (`entity_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_tax`
--
ALTER TABLE `sales_order_tax`
  ADD CONSTRAINT `FK_SALES_ORDER_TAX_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_text`
--
ALTER TABLE `sales_order_text`
  ADD CONSTRAINT `FK_SALES_ORDER_TEXT` FOREIGN KEY (`entity_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_varchar`
--
ALTER TABLE `sales_order_varchar`
  ADD CONSTRAINT `FK_SALES_ORDER_VARCHAR` FOREIGN KEY (`entity_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_payment_transaction`
--
ALTER TABLE `sales_payment_transaction`
  ADD CONSTRAINT `FK_SALES_PAYMENT_TRANSACTION_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_PAYMENT_TRANSACTION_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_PAYMENT_TRANSACTION_PAYMENT` FOREIGN KEY (`payment_id`) REFERENCES `sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_refunded_aggregated`
--
ALTER TABLE `sales_refunded_aggregated`
  ADD CONSTRAINT `FK_SALES_REFUNDED_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_refunded_aggregated_order`
--
ALTER TABLE `sales_refunded_aggregated_order`
  ADD CONSTRAINT `FK_SALES_REFUNDED_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_shipping_aggregated`
--
ALTER TABLE `sales_shipping_aggregated`
  ADD CONSTRAINT `FK_SALES_SHIPPING_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_shipping_aggregated_order`
--
ALTER TABLE `sales_shipping_aggregated_order`
  ADD CONSTRAINT `FK_SALES_SHIPPING_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_customer`
--
ALTER TABLE `salesrule_customer`
  ADD CONSTRAINT `FK_salesrule_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_salesrule_customer_rule` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_label`
--
ALTER TABLE `salesrule_label`
  ADD CONSTRAINT `FK_SALESRULE_LABEL_RULE` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALESRULE_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sitemap`
--
ALTER TABLE `sitemap`
  ADD CONSTRAINT `FK_SITEMAP_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tag_relation`
--
ALTER TABLE `tag_relation`
  ADD CONSTRAINT `FK_TAG_RELATION_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAG_RELATION_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAG_RELATION_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAG_RELATION_TAG` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tag_summary`
--
ALTER TABLE `tag_summary`
  ADD CONSTRAINT `FK_TAG_SUMMARY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAG_SUMMARY_TAG` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tax_calculation`
--
ALTER TABLE `tax_calculation`
  ADD CONSTRAINT `FK_TAX_CALCULATION_CTC` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALCULATION_PTC` FOREIGN KEY (`product_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALCULATION_RATE` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALCULATION_RULE` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tax_calculation_rate_title`
--
ALTER TABLE `tax_calculation_rate_title`
  ADD CONSTRAINT `FK_TAX_CALCULATION_RATE_TITLE_RATE` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALCULATION_RATE_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tax_order_aggregated_created`
--
ALTER TABLE `tax_order_aggregated_created`
  ADD CONSTRAINT `FK_TAX_ORDER_AGGREGATED_CREATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `weee_discount`
--
ALTER TABLE `weee_discount`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `weee_tax`
--
ALTER TABLE `weee_tax`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_COUNTRY` FOREIGN KEY (`country`) REFERENCES `directory_country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WEEE_TAX_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `widget_instance_page`
--
ALTER TABLE `widget_instance_page`
  ADD CONSTRAINT `FK_WIDGET_WIDGET_INSTANCE_ID` FOREIGN KEY (`instance_id`) REFERENCES `widget_instance` (`instance_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `widget_instance_page_layout`
--
ALTER TABLE `widget_instance_page_layout`
  ADD CONSTRAINT `FK_WIDGET_WIDGET_INSTANCE_LAYOUT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WIDGET_WIDGET_INSTANCE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `widget_instance_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `FK_WISHLIST_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist_item`
--
ALTER TABLE `wishlist_item`
  ADD CONSTRAINT `FK_WISHLIST_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WISHLIST_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WISHLIST_ITEM_WISHLIST` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`) ON DELETE CASCADE ON UPDATE CASCADE;
