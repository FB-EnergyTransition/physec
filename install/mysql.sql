
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `physec`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminuser`
--

CREATE TABLE `adminuser` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `logincookie` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `usersettings` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `adminuser`
--

INSERT INTO `adminuser` (`id`, `username`, `password`, `token`, `logincookie`, `comment`, `active`, `usersettings`) VALUES
(1, 'admin', '', NULL, NULL, 'Adminuser', 1, 'a:0;');

-- --------------------------------------------------------

--
-- Table structure for table `adminuser_privilege`
--

CREATE TABLE `adminuser_privilege` (
  `user` int(11) NOT NULL,
  `privilege` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adminuser_role`
--

CREATE TABLE `adminuser_role` (
  `user` int(11) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `adminuser_role`
--

INSERT INTO `adminuser_role` (`user`, `role`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ahistory`
--

CREATE TABLE `ahistory` (
  `id` int(11) NOT NULL,
  `attachment` int(11) NOT NULL,
  `dtime` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `question` int(11) NOT NULL,
  `answerform` int(11) NOT NULL,
  `answeroption` int(11) DEFAULT NULL,
  `atext` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `answerform`
--

CREATE TABLE `answerform` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `collection` int(11) NOT NULL,
  `dtime` datetime NOT NULL,
  `finished` tinyint(4) DEFAULT 0,
  `implemented` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `answeroption`
--

CREATE TABLE `answeroption` (
  `id` int(11) NOT NULL,
  `question` int(11) NOT NULL,
  `answertext` mediumtext NOT NULL,
  `description` text DEFAULT NULL,
  `mark` enum('good','weak','bad','','neutral') DEFAULT NULL,
  `ordernum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `answer_option`
--

CREATE TABLE `answer_option` (
  `answer` int(11) NOT NULL,
  `answeroption` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attachment`
--

CREATE TABLE `attachment` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `ckey` varchar(254) NOT NULL,
  `dtime` int(11) NOT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `answeroption` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `ordernum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `collection` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ordernum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

CREATE TABLE `collection` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT 0,
  `categorizers` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filelink`
--

CREATE TABLE `filelink` (
  `id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_token`
--

CREATE TABLE `form_token` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_db`
--

CREATE TABLE `log_db` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  `query` text NOT NULL,
  `phpself` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_login`
--

CREATE TABLE `log_login` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `usertype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `privilege`
--

CREATE TABLE `privilege` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `privilege`
--

INSERT INTO `privilege` (`id`, `name`) VALUES
(1, 'create adminuser'),
(40, 'create answeroption'),
(28, 'create attachment'),
(20, 'create category'),
(44, 'create class'),
(32, 'create collection'),
(48, 'create filelink'),
(4, 'create privilege'),
(36, 'create question'),
(24, 'create result'),
(7, 'create role'),
(10, 'create user'),
(3, 'delete adminuser'),
(42, 'delete answeroption'),
(30, 'delete attachment'),
(22, 'delete category'),
(46, 'delete class'),
(34, 'delete collection'),
(50, 'delete filelink'),
(6, 'delete privilege'),
(38, 'delete question'),
(26, 'delete result'),
(9, 'delete role'),
(12, 'delete user'),
(2, 'edit adminuser'),
(41, 'edit answeroption'),
(29, 'edit attachment'),
(21, 'edit category'),
(45, 'edit class'),
(33, 'edit collection'),
(49, 'edit filelink'),
(5, 'edit privilege'),
(37, 'edit question'),
(25, 'edit result'),
(8, 'edit role'),
(16, 'edit self'),
(11, 'edit user'),
(39, 'view answeroption'),
(27, 'view attachment'),
(19, 'view category'),
(43, 'view class'),
(31, 'view collection'),
(47, 'view filelink'),
(35, 'view question'),
(23, 'view result');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `collection` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `qtext` varchar(6000) NOT NULL,
  `description` text DEFAULT NULL,
  `type` enum('radio','check','bool','text') NOT NULL,
  `mark_false` enum('good','weak','bad','','neutral') DEFAULT NULL,
  `mark_true` enum('good','weak','bad','','neutral') DEFAULT NULL,
  `conditions` text DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `question` int(11) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `filelink` int(11) DEFAULT NULL,
  `attach` tinyint(4) NOT NULL DEFAULT 0,
  `rtext` text DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `linkcaption` varchar(255) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `role_privilege`
--

CREATE TABLE `role_privilege` (
  `role` int(11) NOT NULL,
  `privilege` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `role_privilege`
--

INSERT INTO `role_privilege` (`role`, `privilege`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 16);

-- --------------------------------------------------------

--
-- Table structure for table `role_role`
--

CREATE TABLE `role_role` (
  `superrole` int(11) NOT NULL,
  `subrole` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `attribute` varchar(254) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `logincookie` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `accepted` tinyint(4) DEFAULT 0,
  `usersettings` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_privilege`
--

CREATE TABLE `user_privilege` (
  `user` int(11) NOT NULL,
  `privilege` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user` int(11) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminuser`
--
ALTER TABLE `adminuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminuser_privilege`
--
ALTER TABLE `adminuser_privilege`
  ADD PRIMARY KEY (`user`,`privilege`),
  ADD KEY `privilege` (`privilege`);

--
-- Indexes for table `adminuser_role`
--
ALTER TABLE `adminuser_role`
  ADD PRIMARY KEY (`user`,`role`),
  ADD KEY `role` (`role`);

--
-- Indexes for table `ahistory`
--
ALTER TABLE `ahistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attachment` (`attachment`);

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question` (`question`),
  ADD KEY `user` (`answerform`),
  ADD KEY `answeroption` (`answeroption`);

--
-- Indexes for table `answerform`
--
ALTER TABLE `answerform`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `collection` (`collection`);

--
-- Indexes for table `answeroption`
--
ALTER TABLE `answeroption`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question` (`question`);

--
-- Indexes for table `answer_option`
--
ALTER TABLE `answer_option`
  ADD PRIMARY KEY (`answer`,`answeroption`) USING BTREE,
  ADD KEY `answeroption` (`answeroption`);

--
-- Indexes for table `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`ckey`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answeroption` (`answeroption`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collection` (`collection`),
  ADD KEY `ordernum` (`ordernum`);

--
-- Indexes for table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filelink`
--
ALTER TABLE `filelink`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_token`
--
ALTER TABLE `form_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `token` (`token`);

--
-- Indexes for table `log_db`
--
ALTER TABLE `log_db`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_login`
--
ALTER TABLE `log_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privilege`
--
ALTER TABLE `privilege`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collection` (`collection`),
  ADD KEY `class` (`class`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `question` (`question`),
  ADD KEY `filelink` (`filelink`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `role_privilege`
--
ALTER TABLE `role_privilege`
  ADD PRIMARY KEY (`role`,`privilege`),
  ADD KEY `privilege` (`privilege`);

--
-- Indexes for table `role_role`
--
ALTER TABLE `role_role`
  ADD PRIMARY KEY (`superrole`,`subrole`),
  ADD KEY `subrole` (`subrole`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`attribute`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_privilege`
--
ALTER TABLE `user_privilege`
  ADD PRIMARY KEY (`user`,`privilege`),
  ADD KEY `privilege` (`privilege`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user`,`role`),
  ADD KEY `role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminuser`
--
ALTER TABLE `adminuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ahistory`
--
ALTER TABLE `ahistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `answerform`
--
ALTER TABLE `answerform`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `answeroption`
--
ALTER TABLE `answeroption`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `attachment`
--
ALTER TABLE `attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `collection`
--
ALTER TABLE `collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `filelink`
--
ALTER TABLE `filelink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `form_token`
--
ALTER TABLE `form_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3304;

--
-- AUTO_INCREMENT for table `log_db`
--
ALTER TABLE `log_db`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24571;

--
-- AUTO_INCREMENT for table `log_login`
--
ALTER TABLE `log_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1185;

--
-- AUTO_INCREMENT for table `privilege`
--
ALTER TABLE `privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adminuser_privilege`
--
ALTER TABLE `adminuser_privilege`
  ADD CONSTRAINT `adminuser_privilege_ibfk_2` FOREIGN KEY (`privilege`) REFERENCES `privilege` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `adminuser_privilege_ibfk_3` FOREIGN KEY (`user`) REFERENCES `adminuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `adminuser_role`
--
ALTER TABLE `adminuser_role`
  ADD CONSTRAINT `adminuser_role_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `adminuser_role_ibfk_2` FOREIGN KEY (`user`) REFERENCES `adminuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ahistory`
--
ALTER TABLE `ahistory`
  ADD CONSTRAINT `ahistory_ibfk_1` FOREIGN KEY (`attachment`) REFERENCES `attachment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`question`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`answeroption`) REFERENCES `answeroption` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answer_ibfk_3` FOREIGN KEY (`answerform`) REFERENCES `answerform` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `answerform`
--
ALTER TABLE `answerform`
  ADD CONSTRAINT `answerform_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answerform_ibfk_2` FOREIGN KEY (`collection`) REFERENCES `collection` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `answeroption`
--
ALTER TABLE `answeroption`
  ADD CONSTRAINT `answeroption_ibfk_1` FOREIGN KEY (`question`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `answer_option`
--
ALTER TABLE `answer_option`
  ADD CONSTRAINT `answer_option_ibfk_1` FOREIGN KEY (`answer`) REFERENCES `answer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answer_option_ibfk_2` FOREIGN KEY (`answeroption`) REFERENCES `answeroption` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attachment`
--
ALTER TABLE `attachment`
  ADD CONSTRAINT `attachment_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_2` FOREIGN KEY (`answeroption`) REFERENCES `answeroption` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`collection`) REFERENCES `collection` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`collection`) REFERENCES `collection` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `question_ibfk_2` FOREIGN KEY (`class`) REFERENCES `class` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`question`) REFERENCES `question` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `result_ibfk_3` FOREIGN KEY (`filelink`) REFERENCES `filelink` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `role_privilege`
--
ALTER TABLE `role_privilege`
  ADD CONSTRAINT `role_privilege_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_privilege_ibfk_2` FOREIGN KEY (`privilege`) REFERENCES `privilege` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_role`
--
ALTER TABLE `role_role`
  ADD CONSTRAINT `role_role_ibfk_1` FOREIGN KEY (`superrole`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_role_ibfk_2` FOREIGN KEY (`subrole`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_privilege`
--
ALTER TABLE `user_privilege`
  ADD CONSTRAINT `user_privilege_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_privilege_ibfk_2` FOREIGN KEY (`privilege`) REFERENCES `privilege` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
