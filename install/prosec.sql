-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: devsql02
-- Generation Time: Oct 07, 2024 at 05:41 PM
-- Server version: 5.7.44-log
-- PHP Version: 8.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
SET FOREIGN_KEY_CHECKS=0;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prosec_1`
--

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `question`, `answerform`, `answeroption`, `atext`) VALUES
(120, 52, 22, NULL, 'Mein Unternhemen'),
(121, 53, 22, 129, NULL),
(122, 54, 22, NULL, 'Forschung'),
(123, 55, 22, NULL, '50'),
(125, 57, 22, 130, NULL),
(126, 58, 22, 132, NULL),
(127, 59, 22, NULL, NULL),
(128, 68, 22, 172, NULL),
(129, 60, 22, 141, NULL),
(130, 88, 22, 228, NULL),
(131, 62, 22, 150, NULL),
(132, 63, 22, 153, NULL),
(133, 89, 22, 232, NULL),
(134, 69, 22, NULL, NULL),
(135, 64, 22, 155, NULL),
(136, 65, 22, 229, NULL),
(137, 67, 22, 171, NULL),
(138, 70, 22, 179, NULL),
(139, 71, 22, 180, NULL),
(140, 72, 22, 184, NULL),
(141, 73, 22, 187, NULL),
(142, 75, 22, 190, NULL),
(143, 76, 22, 194, NULL),
(144, 78, 22, 199, NULL),
(145, 79, 22, NULL, NULL),
(146, 80, 22, 204, NULL),
(147, 86, 22, 226, NULL),
(148, 81, 22, 207, NULL),
(149, 82, 22, 209, NULL),
(150, 83, 22, NULL, NULL),
(151, 84, 22, NULL, NULL),
(152, 85, 22, 223, NULL);

--
-- Dumping data for table `answeroption`
--

INSERT INTO `answeroption` (`id`, `question`, `answertext`, `description`, `mark`, `ordernum`) VALUES
(123, 53, 'Gesundheitswesen', NULL, 'neutral', 1),
(124, 53, 'Finanzdienstleistungen', NULL, 'neutral', 2),
(125, 53, 'Bildung', NULL, 'neutral', 3),
(126, 53, 'Öffentlicher Sektor', NULL, 'neutral', 4),
(127, 53, 'Rechtswesen', NULL, 'neutral', 5),
(128, 53, 'Technologie & IT', NULL, 'neutral', 6),
(129, 53, 'Sonstiges', NULL, 'neutral', 7),
(130, 57, 'Ja', NULL, 'good', 1),
(131, 57, 'Nein', NULL, 'bad', 2),
(132, 58, 'Ja', NULL, 'good', 1),
(133, 58, 'Nein', NULL, 'bad', 2),
(134, 58, 'ist in Planung', NULL, 'weak', 3),
(136, 59, 'Unser Unternehmen verarbeitet personenbezogene Daten als Kernaktivität.', NULL, 'neutral', 2),
(137, 59, 'Die Datenverarbeitung beinhaltet die regelmäßige und systematische Überwachung von betroffenen Personen in großem Umfang.', NULL, 'neutral', 3),
(138, 59, 'Unser Unternehmen verarbeitet besondere Kategorien personenbezogener Daten (z.B. Gesundheitsdaten, Daten über politische Meinungen) oder Daten über strafrechtliche Verurteilungen und Straftaten.', NULL, 'neutral', 4),
(139, 59, 'Keine der obigen Aussagen trifft zu', '', 'neutral', 5),
(140, 60, 'Ja, alle', NULL, 'good', 1),
(141, 60, 'teilweise', '', 'weak', 2),
(142, 60, 'Nein', '', 'bad', 3),
(149, 62, 'Ja, in Intervallen', '', 'good', 1),
(150, 62, 'Nur im Einstellungsgespräch', '', 'weak', 2),
(151, 62, 'Nein', NULL, 'bad', 3),
(152, 63, 'Ja', NULL, 'good', 1),
(153, 63, 'Nein', '', 'bad', 2),
(154, 64, 'Ja', '', 'neutral', 1),
(155, 64, 'Nein', NULL, 'neutral', 2),
(157, 65, 'Ja', NULL, 'good', 1),
(158, 65, 'Nein', '', 'weak', 2),
(170, 67, 'Ja', NULL, 'good', 1),
(171, 67, 'Nein', '', 'bad', 2),
(172, 68, 'Ja', '', 'bad', 1),
(173, 68, 'Nein', '', 'good', 2),
(174, 69, 'schriftlich (auf Papier)', NULL, 'good', 1),
(175, 69, 'elektronisch', NULL, 'good', 2),
(176, 69, 'Nein', '', 'bad', 3),
(178, 70, 'Ja', NULL, 'good', 1),
(179, 70, 'Nein', '', 'bad', 2),
(180, 71, 'Ja', NULL, 'good', 1),
(181, 71, 'Nein', '', 'weak', 2),
(182, 72, 'Ja (innerlhalb von 24 Stunden nach Kenntnis)', NULL, 'good', 1),
(183, 72, 'Ja (innerhalb von 72 Stunden nach Kenntnis)', NULL, 'good', 2),
(184, 72, 'Ja, wir melden den Vorfall (ca. nach einer Woche)', NULL, 'weak', 3),
(185, 72, 'Nein', NULL, 'bad', 4),
(186, 73, 'Ja', NULL, 'good', 1),
(187, 73, 'Nein', '', 'weak', 2),
(190, 75, 'Ja', NULL, 'good', 1),
(191, 75, 'Nein', '', 'bad', 2),
(193, 76, 'Ja', '', 'neutral', 1),
(194, 76, 'Nein', NULL, 'neutral', 2),
(195, 77, 'Ja', NULL, 'good', 1),
(196, 77, 'teilweise', NULL, 'weak', 2),
(197, 77, 'Nein', NULL, 'bad', 3),
(198, 77, 'ich bin mir nicht sicher', NULL, 'bad', 4),
(199, 78, 'Ja', NULL, 'neutral', 1),
(200, 78, 'Nein', NULL, 'neutral', 2),
(201, 79, 'Impressum', NULL, 'good', 1),
(202, 79, 'Datenschutzerklärung', NULL, 'good', 2),
(203, 79, 'nichts dergleichen', '', 'bad', 3),
(204, 80, 'Ja', '', 'neutral', 1),
(205, 80, 'Nein', '', 'neutral', 2),
(206, 80, 'keine Ahnung', '', 'weak', 3),
(207, 81, 'Ja', NULL, 'good', 1),
(208, 81, 'Nein', '', 'bad', 2),
(209, 82, 'Ja', NULL, 'good', 1),
(210, 82, 'Nein', '', 'weak', 2),
(211, 82, 'keine Ahnung', '', 'weak', 3),
(212, 83, 'Verschlüsselung', NULL, 'good', 1),
(213, 83, 'Zugangskontrollen', NULL, 'good', 2),
(214, 83, 'IT-Sicherheits Maßnahmen', NULL, 'good', 3),
(215, 83, 'nichts dergleichen', '', 'bad', 4),
(216, 84, 'Virenscanner', NULL, 'good', 1),
(217, 84, 'Firewall', NULL, 'good', 2),
(218, 84, 'Zwei-Faktor Autehtifizierung', NULL, 'good', 3),
(219, 84, 'Passwort Richtlinien', NULL, 'good', 4),
(220, 84, 'regelmäßige Datensicherungen', NULL, 'good', 5),
(221, 84, 'Mobile Device Management System', NULL, 'good', 6),
(222, 84, 'nichts dergleichen', '', 'bad', 7),
(223, 85, 'Ja', NULL, 'good', 1),
(224, 85, 'Nein', '', 'weak', 2),
(225, 86, 'Ja', '', 'bad', 1),
(226, 86, 'Nein', NULL, 'good', 2),
(227, 88, 'Ja', NULL, 'good', 1),
(228, 88, 'Nein', '', 'bad', 2),
(229, 65, 'Was ist das?', '', 'bad', 3),
(230, 75, 'ich bin mir nicht sicher', '', 'bad', 3),
(231, 89, 'Ja', NULL, 'good', 1),
(232, 89, 'Nein', '', 'bad', 2);

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `answeroption`, `name`, `ordernum`) VALUES
(68, 123, '0', NULL),
(69, 124, '01', NULL),
(70, 125, '02', NULL),
(71, 126, '03', NULL),
(72, 127, '04', NULL),
(73, 128, '05', NULL),
(74, 131, 'Grundlagen DSGVO', NULL),
(75, 133, 'DBeauftragter 1', NULL),
(76, 134, '1', NULL),
(77, 136, '2', NULL),
(78, 137, '3', NULL),
(79, 138, '4', NULL),
(80, 139, '5', NULL),
(81, 172, '6', NULL),
(82, 173, '7', NULL),
(83, 141, '8', NULL),
(84, 142, '9', NULL),
(85, 228, '10', NULL),
(86, 150, '11', NULL),
(87, 151, '12', NULL),
(88, 153, '13', NULL),
(89, 176, '14', NULL),
(90, 154, '15', NULL),
(91, 158, '16', NULL),
(92, 229, '17', NULL),
(93, 171, '19', NULL),
(94, 179, '18', NULL),
(95, 181, '20', NULL),
(96, 184, '21', NULL),
(97, 187, '22', NULL),
(98, 191, '23', NULL),
(99, 230, '24', NULL),
(100, 193, '25', NULL),
(102, 203, '26', NULL),
(103, 205, '27', NULL),
(104, 204, '28', NULL),
(105, 206, '29', NULL),
(107, 225, '30', NULL),
(108, 208, '31', NULL),
(109, 210, '32', NULL),
(110, 211, '33', NULL),
(111, 215, '34', NULL),
(112, 222, '35', NULL),
(113, 224, '36', NULL),
(114, 232, '37', NULL);

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `collection`, `name`, `ordernum`) VALUES
(18, 9, 'Allgemeine Informationen zur DSGVO', 1),
(19, 9, 'Bewusstseinsbildung und Schulungsmaßnahmen', 2),
(21, 9, 'Datenerfassung und -verarbeitung', 4),
(22, 9, 'Datensicherheit und technische-organisatorische-Maßnahmen (TOMs)', 5);

--
-- Dumping data for table `collection`
--

INSERT INTO `collection` (`id`, `name`, `disabled`, `categorizers`) VALUES
(9, 'Prosec', 0, 'N;');

--
-- Dumping data for table `filelink`
--

INSERT INTO `filelink` (`id`, `file`, `filename`) VALUES
(1, 'file_6604191f6cb9b.pdf', 'branchen_empfehlungen.pdf'),
(2, 'file_66041926bf912.pdf', 'data_breach_prozess.pdf'),
(3, 'file_6604192e5fa4b.pdf', 'Empfehlungen für Einwilligungen.pdf'),
(4, 'file_66041935c42eb.pdf', 'grundlagen_empfehlungen.pdf'),
(5, 'file_66041941a71a4.docx', 'Muster_auftragsverarbeitungsvereinbarung.docx'),
(6, 'file_6604194ac7d0e.xlsx', 'MUSTER_bewertung_datenschutzfolgeabschaetzung.xlsx'),
(7, 'file_6604196bdc52f.docx', 'Erklärung zum Datengeheimnis'),
(8, 'file_6604197ff377c.docx', 'Muster_Loschkonzept.docx'),
(9, 'file_660419926ecb8.docx', 'MUSTER_schulungsprotokoll.docx'),
(10, 'file_660419afb873c.xlsx', 'Muster_Verarbeitungsverzeichnis.xlsx'),
(11, 'file_660419ba20c05.docx', 'selbstcheck_datenschutz_mitarbeiter.docx'),
(12, 'file_660424934e68f.pptx', 'MUSTER_datenschutz_unterweisung.pptx');

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `collection`, `class`, `name`, `qtext`, `description`, `type`, `mark_false`, `mark_true`, `conditions`, `ordernum`) VALUES
(52, 9, 18, 'Name des Unternehmens:', 'Name des Unternehmens:', NULL, 'text', NULL, NULL, 'N;', 2),
(53, 9, 18, 'Geben Sie bitte Ihre Branche an:', 'Geben Sie bitte Ihre Branche an:', NULL, 'radio', NULL, NULL, 'a:0:{}', 3),
(54, 9, 18, 'In welcher Branche ist Ihr Unternehmen tätig?', 'In welcher Branche ist Ihr Unternehmen tätig?', NULL, 'text', NULL, NULL, 'a:1:{i:0;O:9:\"Condition\":4:{s:11:\"\0*\0question\";i:53;s:11:\"\0*\0operator\";s:2:\"==\";s:8:\"\0*\0value\";s:0:\"\";s:7:\"\0*\0link\";i:129;}}', 4),
(55, 9, 18, 'Wie viele Mitarbeiter:innen sind in Ihrem Unternehmen beschäftigt?', 'Wie viele Mitarbeiter:innen sind in Ihrem Unternehmen beschäftigt?', NULL, 'text', NULL, NULL, 'N;', 5),
(57, 9, 18, 'Ist Ihrem Unternehmen bewusst, dass es der DSGVO unterliegt?', 'Ist Ihrem Unternehmen bewusst, dass es der DSGVO unterliegt?', NULL, 'radio', NULL, NULL, 'N;', 6),
(58, 9, 18, 'Gibt es in Ihrem Unternehmen eine ernannte Person zum Thema Datenschutz? (Datenschutzbeauftragten)? Details: https://www.jusline.at/gesetz/dsg/paragraf/artikel2zu5', 'Gibt es in Ihrem Unternehmen eine ernannte Person zum Thema Datenschutz? (Datenschutzbeauftragten)?', NULL, 'radio', NULL, NULL, 'N;', 8),
(59, 9, 18, 'Welche der folgenden Aussagen trifft auf Ihr Unternehmen zu? ', 'Welche der folgenden Aussagen trifft auf Ihr Unternehmen zu? ', '', 'check', NULL, NULL, 'N;', 7),
(60, 9, 19, 'Wurden Ihre Mitarbeiter:innen über die DSGVO und den Datenschutz informiert?', 'Wurden Ihre Mitarbeiter:innen über die DSGVO und den Datenschutz informiert?', '', 'radio', NULL, NULL, 'N;', 9),
(62, 9, 19, 'Werden DSGVO-Inhalte laufend über einen kontinuierlichen Prozess (z.B. Schulung) hinweg kommuniziert?', 'Werden DSGVO-Inhalte laufend über einen kontinuierlichen Prozess (z.B. Schulung) hinweg kommuniziert?', NULL, 'radio', NULL, NULL, 'N;', 11),
(63, 9, 19, 'Wurden Einwilligungen von Ihren Mitarbeiter:innen zur Verarbeitung derer Daten eingeholt? (z.B. Fotos, Identifikationsdaten, etc.?)', 'Wurden Einwilligungen von Ihren Mitarbeiter:innen zur Verarbeitung derer Daten eingeholt? (z.B. Fotos, Identifikationsdaten, etc.?)', 'z.B.\r\n•	Fotos auf der Website\r\n•	Videoaufnahmen\r\n•	Verpflichtung zum Datengeheimnis\r\n•	Identifikationsdaten\r\n', 'radio', NULL, NULL, 'N;', 12),
(64, 9, 21, 'Überträgt Ihr Unternehmen personenbezogene Daten in Länder außerhalb der EU?', 'Überträgt Ihr Unternehmen personenbezogene Daten in Länder außerhalb der EU?', '', 'radio', NULL, NULL, 'N;', 15),
(65, 9, 21, 'Führen Sie ein Verarbeitungsverzeichnis?', 'Führen Sie ein Verarbeitungsverzeichnis?', '', 'radio', NULL, NULL, 'N;', 16),
(67, 9, 21, 'Informieren Sie Betroffene über die Datenerfassung und -verarbeitung?', 'Informieren Sie Betroffene (Kund:innen, Lierferant:innen, etc. ...) über die Datenerfassung und -verarbeitung?', '', 'radio', NULL, NULL, 'N;', 17),
(68, 9, 18, 'Erfassen Sie sensible Daten in Ihrem Unternehmen? (z.B. Rassische/ethnische Herkunft, Politische Meinung/Zugehörigkeit, Religiöse/weltanschauliche Überzeugung, Gewerkschaftszugehörigkeit, ...) Details unter: https://www.jusline.at/gesetz/dsgvo/paragraf/9', 'Erfassen Sie sensible Daten in Ihrem Unternehmen?', '(z.B. Rassische/ethnische Herkunft, Politische Meinung/Zugehörigkeit, Religiöse/weltanschauliche Überzeugung, Gewerkschaftszugehörigkeit, ...)\r\nDetails unter: https://www.jusline.at/gesetz/dsgvo/paragraf/9', 'radio', NULL, NULL, 'N;', 1),
(69, 9, 21, 'Wird eine Zustimmung zur Datenverarbeitung von Betroffenen eingeholt (z.B. Speicherung von Bewerbungen)?', 'Wird eine Zustimmung zur Datenverarbeitung von Betroffenen eingeholt?', 'z.B. Speicherung von Bewerbungen', 'check', NULL, NULL, 'N;', 14),
(70, 9, 21, 'Gibt es interne Prozesse zur Aktualisierung oder Widerrufung von Zustimmungen von Betroffenen?', 'Gibt es interne Prozesse zur Aktualisierung oder Widerrufung von Zustimmungen von Betroffenen?', '', 'radio', NULL, NULL, 'N;', 18),
(71, 9, 21, 'Gibt es in Ihrem Unternehmen einen Prozess zur Meldung von Datenschutzverletzungen (z.B. Verlust von einem Notebook, USB-Stick, etc.)?', 'Gibt es in Ihrem Unternehmen einen Prozess zur Meldung von Datenschutzverletzungen (z.B. Verlust von einem Notebook, USB-Stick, etc.)?', '', 'radio', NULL, NULL, 'N;', 19),
(72, 9, 21, 'Tritt eine Datenschutzverletzung im Unternehmen auf, wird diese gemeldet? ', 'Tritt eine Datenschutzverletzung im Unternehmen auf, wird diese gemeldet? ', NULL, 'radio', NULL, NULL, 'N;', 20),
(73, 9, 21, 'Werden im Unternehmen Datenschutz-Folgenabschätzungen erfasst?', 'Werden im Unternehmen Datenschutz-Folgenabschätzungen erfasst?', '', 'radio', NULL, NULL, 'N;', 21),
(75, 9, 21, 'Werden regelmäßige Risikobewertungen zum Thema Datenschutz in Ihrem Unternehmen durchgeführt?', 'Werden regelmäßige Risikobewertungen zum Thema Datenschutz in Ihrem Unternehmen durchgeführt?', '', 'radio', NULL, NULL, 'N;', 22),
(76, 9, 21, 'Haben Sie als Unternehmen einen externen Dienstleister beauftragt (Lohnverrechnet, Buchhalter, Steuerberater, IT-Dienstleister, etc.?', 'Haben Sie als Unternehmen einen externen Dienstleister beauftragt (Lohnverrechnet, Buchhalter, Steuerberater, IT-Dienstleister, etc.?', '', 'radio', NULL, NULL, 'N;', 23),
(77, 9, 21, 'Haben Sie für die jeweiligen Dienstleister eine Auftragsverarbeitungsvereinbarung eingeholt?', 'Haben Sie für die jeweiligen Dienstleister eine Auftragsverarbeitungsvereinbarung eingeholt?', '', 'radio', NULL, NULL, 'a:1:{i:0;O:9:\"Condition\":4:{s:11:\"\0*\0question\";i:76;s:11:\"\0*\0operator\";s:2:\"==\";s:8:\"\0*\0value\";s:0:\"\";s:7:\"\0*\0link\";i:193;}}', 24),
(78, 9, 21, 'Betreibt Ihr Unternehmen eine Website?', 'Betreibt Ihr Unternehmen eine Website?', '', 'radio', NULL, NULL, 'N;', 25),
(79, 9, 21, 'Welche Inhalte sind in Ihrer Website angeführt?', 'Welche Inhalte sind in Ihrer Website angeführt?', '', 'check', NULL, NULL, 'N;', 26),
(80, 9, 21, 'Bietet Ihre Website die Möglichkeit einen Newsletter zu abonnieren?', 'Bietet Ihre Website die Möglichkeit einen Newsletter zu abonnieren?', '', 'radio', NULL, NULL, 'N;', 27),
(81, 9, 22, 'Stellen Sie sicher, dass Daten in Ihrem Unternehmen nicht länger als notwendig gespeichert werden?', 'Stellen Sie sicher, dass Daten in Ihrem Unternehmen nicht länger als notwendig gespeichert werden?', '', 'radio', NULL, NULL, 'N;', 29),
(82, 9, 22, 'Haben Sie ein Löschkonzept dokumentiert?', 'Haben Sie ein Löschkonzept dokumentiert?', '', 'radio', NULL, NULL, 'N;', 30),
(83, 9, 22, 'Welche Maßnahmen wurden gesetzt, um die Sicherheit personenbezogener Daten zu gewährleisten? ', 'Welche Maßnahmen wurden gesetzt, um die Sicherheit personenbezogener Daten zu gewährleisten? ', '', 'check', NULL, NULL, 'N;', 31),
(84, 9, 22, 'Welche konkreten IT-Sicherheits Maßnahmen haben Sie im Unternehmen getroffen?', 'Welche konkreten IT-Sicherheits Maßnahmen haben Sie im Unternehmen getroffen?', '', 'check', NULL, NULL, 'a:1:{i:0;O:9:\"Condition\":4:{s:11:\"\0*\0question\";i:83;s:11:\"\0*\0operator\";s:2:\"==\";s:8:\"\0*\0value\";s:0:\"\";s:7:\"\0*\0link\";i:214;}}', 32),
(85, 9, 22, 'Führt Ihr Unternehmen bzw. Ihr IT-Dienstleister eine Dokumentation der IT-Systeme und dem Daten-Sicherungskonzept?', 'Führt Ihr Unternehmen bzw. Ihr IT-Dienstleister eine Dokumentation der IT-Systeme und dem Daten-Sicherungskonzept?', '', 'radio', NULL, NULL, 'N;', 33),
(86, 9, 22, 'Verwenden Sie Whatsapp im Unternehmen?', 'Verwenden Sie und Ihre Mitarbeiter:innen \"Whatsapp\" für die Kommunikation im Unternehmen?', '', 'radio', NULL, NULL, 'N;', 28),
(88, 9, 19, 'Werden den Mitarbeiter:innen folgende Inhalte im Rahmen einer Schulung vermittelt?', 'Werden den Mitarbeiter:innen folgende Inhalte im Rahmen einer Schulung vermittelt?', 'o	Grundlagen DSGVO (Rechtmäßigkeit d. Verarbeitung, Transparenz, Zweckbindung, etc.)\r\no	Rechte der Betroffenen\r\no	Technische und organisatorische Maßnahmen (Privacy by Design and by Default)\r\no	Meldung von Datenschutzverletzungen\r\no	Sicherer Umgang mit Daten (springe bei diesen Punkten zur nächsten Frage)', 'radio', NULL, NULL, 'N;', 10),
(89, 9, 19, 'Wurden von Ihren Mitarbeiter:innen Einwillugungen zur Geheimhaltung vertrauenswürdiger Informationen des Unternehmens eingeholt?', 'Wurden von Ihren Mitarbeiter:innen Einwillugungen zur Geheimhaltung vertrauenswürdiger Informationen des Unternehmens eingeholt?', '', 'radio', NULL, NULL, 'N;', 13);

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `category`, `question`, `file`, `filename`, `filelink`, `attach`, `rtext`, `video`, `link`, `linkcaption`, `ordernum`) VALUES
(72, 68, 53, 'file_66029296dc105.pdf', 'branchen_empfehlungen.pdf', 1, 1, 'Die Datenschutz-Grundverordnung (DSGVO) setzt branchenübergreifend Maßstäbe für den Umgang mit personenbezogenen Daten in der EU. Die Anforderungen variieren jedoch je nach Sektor. Im Anhang finden Sie weitere Empfehlungen zu den jeweiligen Branchen. Versuchen Sie diese in Ihrem Unternehmen zu berücksichtigen!', NULL, '', NULL, NULL),
(73, 69, 53, 'file_660293849c1cf.pdf', 'branchen_empfehlungen.pdf', 1, 1, 'Die Datenschutz-Grundverordnung (DSGVO) setzt branchenübergreifend Maßstäbe für den Umgang mit personenbezogenen Daten in der EU. Die Anforderungen variieren jedoch je nach Sektor. Im Anhang finden Sie weitere Empfehlungen zu den jeweiligen Branchen. Versuchen Sie diese in Ihrem Unternehmen zu berücksichtigen!', NULL, '', '', NULL),
(74, 70, 53, 'file_6602939399708.pdf', 'branchen_empfehlungen.pdf', 1, 1, 'Die Datenschutz-Grundverordnung (DSGVO) setzt branchenübergreifend Maßstäbe für den Umgang mit personenbezogenen Daten in der EU. Die Anforderungen variieren jedoch je nach Sektor. Im Anhang finden Sie weitere Empfehlungen zu den jeweiligen Branchen. Versuchen Sie diese in Ihrem Unternehmen zu berücksichtigen!', NULL, '', '', NULL),
(75, 71, 53, 'file_660293a702779.pdf', 'branchen_empfehlungen.pdf', 1, 1, 'Die Datenschutz-Grundverordnung (DSGVO) setzt branchenübergreifend Maßstäbe für den Umgang mit personenbezogenen Daten in der EU. Die Anforderungen variieren jedoch je nach Sektor. Im Anhang finden Sie weitere Empfehlungen zu den jeweiligen Branchen. Versuchen Sie diese in Ihrem Unternehmen zu berücksichtigen!', NULL, '', '', NULL),
(76, 72, 53, 'file_660293b570cb9.pdf', 'branchen_empfehlungen.pdf', 1, 1, 'Die Datenschutz-Grundverordnung (DSGVO) setzt branchenübergreifend Maßstäbe für den Umgang mit personenbezogenen Daten in der EU. Die Anforderungen variieren jedoch je nach Sektor. Im Anhang finden Sie weitere Empfehlungen zu den jeweiligen Branchen. Versuchen Sie diese in Ihrem Unternehmen zu berücksichtigen!', NULL, '', '', NULL),
(77, 73, 53, 'file_660293cb8ce3e.pdf', 'branchen_empfehlungen.pdf', 1, 1, 'Die Datenschutz-Grundverordnung (DSGVO) setzt branchenübergreifend Maßstäbe für den Umgang mit personenbezogenen Daten in der EU. Die Anforderungen variieren jedoch je nach Sektor. Im Anhang finden Sie weitere Empfehlungen zu den jeweiligen Branchen. Versuchen Sie diese in Ihrem Unternehmen zu berücksichtigen!', NULL, '', '', NULL),
(78, 74, 57, 'file_6602a7ce40798.pdf', 'grundlagen_empfehlungen.pdf', 4, 0, 'Für KMUs, die sich der Anforderungen der DSGVO nicht bewusst sind, wäre es ratsam, einen strukturierten Ansatz zur Compliance zu verfolgen. (siehe Anhang)', NULL, '', '', NULL),
(79, 75, 58, NULL, NULL, NULL, 0, 'In Ihrem Unternehmen ist es generell ratsam, einen Datenschutzbeauftragten zu bestellen. In bestimmten Fällen ist dieser auch vorgeschrieben (siehe Link)', NULL, 'https://www.jusline.at/gesetz/dsg/paragraf/artikel2zu5', 'Paragraf-Jusline', NULL),
(80, 76, 58, NULL, NULL, NULL, 0, 'In Ihrem Unternehmen ist es generell ratsam, einen Datenschutzbeauftragten zu bestellen. In bestimmten Fällen ist dieser auch vorgeschrieben (siehe Link)', NULL, 'https://www.jusline.at/gesetz/dsg/paragraf/artikel2zu5', 'Paragraf-Jusline', NULL),
(81, 77, 59, NULL, NULL, NULL, 0, 'Eine Bestellung eines Datenschutzbeauftragten ist zwingend notwendig, berücksichtigen Sie die Einrichtung dieser Instanz in Ihrem Unternehmen.', '', 'https://www.jusline.at/gesetz/dsg/paragraf/artikel2zu5', NULL, NULL),
(82, 78, 59, NULL, NULL, NULL, 0, 'Eine Bestellung eines Datenschutzbeauftragten ist zwingend notwendig, berücksichtigen Sie die Einrichtung dieser Instanz in Ihrem Unternehmen.', '', '', NULL, NULL),
(83, 79, 59, NULL, NULL, NULL, 0, 'Eine Bestellung eines Datenschutzbeauftragten ist zwingend notwendig, berücksichtigen Sie die Einrichtung dieser Instanz in Ihrem Unternehmen.', '', '', NULL, NULL),
(84, 80, 59, NULL, NULL, NULL, 0, 'Es ist wahrscheinlich kein Datenschutzbeauftragter erforderlich, es sei denn, es gibt spezifische nationale Gesetze oder andere Faktoren, die in Betracht gezogen werden müssen.', '', '', NULL, NULL),
(85, 81, 68, NULL, NULL, 4, 1, 'Bei der Erfassung sensibler Daten muss ein Unternehmen die Einwilligung der Betroffenen einholen, Datenschutzmaßnahmen wie Verschlüsselung einführen, Risiken durch Datenschutz-Folgenabschätzungen bewerten, Mitarbeiter schulen, seine Verarbeitungstätigkeiten dokumentieren und eventuell einen Datenschutzbeauftragten benennen, um die DSGVO-Compliance sicherzustellen.\r\n\r\nNotwendige Dokumente zur Umsetzung der DSGVO finden Sie im Bereich Vorlagen (links in der Navigation)', NULL, '', NULL, NULL),
(86, 82, 68, NULL, NULL, NULL, 0, 'Auch wenn ein Unternehmen keine sensiblen Daten erfasst, ist es wichtig, die verarbeiteten Datenarten regelmäßig zu überprüfen, um unbeabsichtigte Erfassung zu vermeiden. Grundlegende Datenschutzprinzipien müssen weiterhin beachtet werden, und das Unternehmen sollte bereit sein, seine Datenschutzmaßnahmen anzupassen, falls es in Zukunft sensible Daten verarbeiten möchte. Die Einhaltung der Datenschutz-Grundverordnung (DSGVO), einschließlich der Rechte der Betroffenen und der Meldung von Datenschutzverletzungen, bleibt essentiell, unabhängig von der Art der verarbeiteten Daten.', '', '', NULL, NULL),
(87, 83, 60, NULL, NULL, 9, 1, 'Führen Sie mit all Ihren Mitarbeiter:innen in regelmäßigen Intervallen (z.B.: jährlich) interne Schulungen durch und dokumentieren Sie diese! Schulungsinhalte inkl. Schulungsprotokolle finden Sie in den Vorlagen (siehe Navigation links)', NULL, '', NULL, NULL),
(88, 84, 60, NULL, NULL, 12, 1, 'Führen Sie mit all Ihren Mitarbeiter:innen in regelmäßigen Intervallen (z.B.: jährlich) interne Schulungen durch und dokumentieren Sie diese! Schulungsinhalte inkl. Schulungsprotokolle finden Sie in den Vorlagen (siehe Navigation links)', NULL, '', NULL, NULL),
(89, 85, 88, NULL, NULL, 12, 1, 'Führen Sie laufend Schulungen mit Ihren Mitarbeiter:innen und nutzen Sie dafür die Vorlage (siehe Vorlagen)', NULL, '', NULL, NULL),
(90, 86, 62, NULL, NULL, NULL, 0, 'Führen Sie laufend Schulungen mit Ihren Mitarbeiter:innen. Nicht nur im Zuge Einstellungsgespräch! Empfohlen werden laufende Intervalle, zumindest 1 mal jährlich.', NULL, '', NULL, NULL),
(92, 87, NULL, NULL, NULL, 12, 1, 'Führen Sie laufend Schulungen mit Ihren Mitarbeiter:innen. Verwenden Sie dazu die Präsentation laut Vorlage und ergänzen Sie diese durch aktuelle Änderungen und Ereignisse. (siehe Vorlagen in der linken Navigation)', NULL, '', NULL, NULL),
(93, 88, 63, 'file_6602e472b1436.pdf', 'Empfehlungen für Einwilligungen.pdf', 3, 1, 'Ob eine Einwilligung zur Verarbeitung personenbezogener Daten eingeholt werden muss, hängt von der Rechtsgrundlage ab, auf die sich die Datenverarbeitung stützt. Details finden Sie im Anhang.', NULL, '', NULL, NULL),
(94, 89, 69, NULL, NULL, 3, 1, 'Prüfen Sie alternative Rechtsgrundlagen für die Datenverarbeitung und stellen Sie bei Fehlen eine rechtmäßige Einwilligung sicher. Passen Sie Verarbeitungsprozesse an die DSGVO an.', NULL, '', NULL, NULL),
(95, 90, 64, NULL, NULL, NULL, 0, 'Es ist ratsam, dass KMUs sich rechtlich beraten lassen, um sicherzustellen, dass alle Anforderungen der DSGVO erfüllt sind und die Datenübertragung in Drittländer rechtskonform erfolgt.', '', '', NULL, NULL),
(96, 91, 65, 'file_66042707a5b26.xlsx', 'Muster_Verarbeitungsverzeichnis.xlsx', NULL, 0, 'Kleine und mittlere Unternehmen (KMU) in Österreich müssen ein Verarbeitungsverzeichnis führen, wenn sie personenbezogene Daten verarbeiten, und zwar unter folgenden Bedingungen: wenn sie mehr als 250 Mitarbeiter haben, die Datenverarbeitung ein Risiko für die Rechte der betroffenen Personen darstellt, besondere Kategorien personenbezogener Daten verarbeitet werden, oder die Datenverarbeitung nicht nur gelegentlich erfolgt. Diese Anforderung basiert auf der Datenschutz-Grundverordnung (DSGVO) der EU. ', '', '', NULL, NULL),
(97, 92, 65, 'file_6604271867546.xlsx', 'Muster_Verarbeitungsverzeichnis.xlsx', NULL, 0, 'Kleine und mittlere Unternehmen (KMU) in Österreich müssen ein Verarbeitungsverzeichnis führen, wenn sie personenbezogene Daten verarbeiten, und zwar unter folgenden Bedingungen: wenn sie mehr als 250 Mitarbeiter haben, die Datenverarbeitung ein Risiko für die Rechte der betroffenen Personen darstellt, besondere Kategorien personenbezogener Daten verarbeitet werden, oder die Datenverarbeitung nicht nur gelegentlich erfolgt. Diese Anforderung basiert auf der Datenschutz-Grundverordnung (DSGVO) der EU. ', '', '', NULL, NULL),
(98, 93, 67, NULL, NULL, NULL, 0, 'KMU in Österreich sollten betroffene Personen aktiv über Datenerfassung und -verarbeitung informieren, indem sie eine klare Datenschutzerklärung bereitstellen, Einwilligungen einholen, über Datenschutzrechte aufklären, Verantwortlichkeiten intern klären, Risiken bewerten und Kontaktinformationen für Datenschutzfragen angeben, um DSGVO-konform zu handeln und Vertrauen zu stärken.', '', '', NULL, NULL),
(99, 94, 70, NULL, NULL, NULL, 0, 'Entwickeln Sie umgehend interne Prozesse, um Zustimmungen aktualisieren oder widerrufen zu können, und schulen Sie Ihr Personal entsprechend.', '', '', NULL, NULL),
(100, 95, 71, 'file_660428e04dc57.pdf', 'data_breach_prozess.pdf', NULL, 0, 'Entwickeln Sie umgehend ein Verfahren zur Meldung von Datenschutzverletzungen, das den Anforderungen der DSGVO entspricht. (siehe Vorlage)', '', '', NULL, NULL),
(101, 96, 72, 'file_6604292235a2d.docx', 'Muster_data_breach_vorlage.docx', NULL, 0, 'Gemäß der Datenschutz-Grundverordnung (DSGVO) müssen Datenschutzverletzungen, auch als \"Data Breaches\" bekannt, innerhalb von 72 Stunden, nachdem der Verantwortliche davon Kenntnis erlangt hat, an die zuständige Aufsichtsbehörde gemeldet werden. Diese Regelung findet sich in Artikel 33 DSGVO.', '', '', NULL, NULL),
(102, 97, 73, 'file_66042a0bde79e.xlsx', 'MUSTER_datenschutzfolgeeinschaetzung.xlsx', 6, 1, 'Beginnen Sie umgehend damit, Datenschutz-Folgenabschätzungen für Verarbeitungstätigkeiten durchzuführen, die ein hohes Risiko für die Rechte und Freiheiten natürlicher Personen darstellen könnten, um DSGVO-konform zu sein. Verwenden Sie dazu unsere Vorlage.', NULL, '', NULL, NULL),
(103, 98, 75, 'file_66042a7c445e1.xlsx', 'MUSTER_bewertung_datenschutzfolgeabschaetzung.xlsx', NULL, 0, 'Implementieren Sie umgehend ein Verfahren für regelmäßige Datenschutz-Risikobewertungen, um potenzielle Risiken proaktiv zu identifizieren und zu mindern.', '', '', NULL, NULL),
(104, 99, 75, 'file_66042aa321218.xlsx', 'MUSTER_bewertung_datenschutzfolgeabschaetzung.xlsx', NULL, 0, 'Fragen Sie Ihren Datenschutzbeauftragten und implementieren Sie umgehend ein Verfahren für regelmäßige Datenschutz-Risikobewertungen, um potenzielle Risiken proaktiv zu identifizieren und zu mindern.', '', '', NULL, NULL),
(105, 100, 76, 'file_66042ae5c447a.docx', 'Muster_auftragsverarbeitungsvereinbarung.docx', NULL, 0, 'Laut Datenschutz-Grundverordnung (DSGVO) müssen Auftragsverarbeitungsvereinbarungen (AV-Verträge) immer dann eingeholt werden, wenn ein Verantwortlicher (das Unternehmen oder die Organisation, die über die Zwecke und Mittel der Verarbeitung von personenbezogenen Daten entscheidet) einen Auftragsverarbeiter (einen externen Dienstleister, der personenbezogene Daten im Auftrag des Verantwortlichen verarbeitet) beauftragt, personenbezogene Daten zu verarbeiten. Diese Anforderung ist in Artikel 28 der DSGVO festgelegt.', '', '', NULL, NULL),
(110, 102, 79, NULL, NULL, NULL, 0, 'Es ist dringend empfohlen, umgehend ein Impressum und eine Datenschutzerklärung auf Ihrer Website zu implementieren, um gesetzlichen Anforderungen, insbesondere der DSGVO und nationalen Gesetzen, zu entsprechen.', '', '', NULL, NULL),
(111, 103, 80, NULL, NULL, NULL, 0, 'Stellen Sie sicher, dass das Abonnementverfahren den Anforderungen der DSGVO entspricht, indem Sie eine explizite Einwilligung der Nutzer einholen und Informationen darüber bereitstellen, wie ihre Daten verwendet werden. Bieten Sie zudem eine einfache Möglichkeit, das Abonnement zu kündigen.', '', '', NULL, NULL),
(112, 104, 80, 'file_66042d893e1ea.pdf', 'Empfehlungen für Einwilligungen.pdf', NULL, 0, 'Stellen Sie sicher, dass das Abonnementverfahren den Anforderungen der DSGVO entspricht, indem Sie eine explizite Einwilligung der Nutzer einholen und Informationen darüber bereitstellen, wie ihre Daten verwendet werden. Bieten Sie zudem eine einfache Möglichkeit, das Abonnement zu kündigen.', '', '', NULL, NULL),
(113, 105, 80, 'file_66042dac1a43e.pdf', 'Empfehlungen für Einwilligungen.pdf', NULL, 0, 'Überprüfen Sie ob Sie eine Newsletter-Funktion anbieten. Stellen Sie sicher, dass das Abonnementverfahren den Anforderungen der DSGVO entspricht, indem Sie eine explizite Einwilligung der Nutzer einholen und Informationen darüber bereitstellen, wie ihre Daten verwendet werden. Bieten Sie zudem eine einfache Möglichkeit, das Abonnement zu kündigen.', '', '', NULL, NULL),
(115, 107, 86, NULL, NULL, NULL, 0, 'Überprüfen Sie die Datenschutzkonformität der Whatsapp-Nutzung im Unternehmen und erwägen Sie Alternativen, wenn nötig.', NULL, 'https://www.brevo.com/de/blog/whatsapp-business-dsgvo/', NULL, NULL),
(116, 108, 81, 'file_66042edbc073d.docx', 'Muster_Loschkonzept.docx', NULL, 0, 'Entwickeln Sie Richtlinien und Verfahren, um sicherzustellen, dass Daten nicht länger als notwendig aufbewahrt werden.', '', '', NULL, NULL),
(117, 109, 82, 'file_66042efedbc17.docx', 'Muster_Loschkonzept.docx', NULL, 0, 'Entwickeln Sie Richtlinien und Verfahren, um sicherzustellen, dass Daten nicht länger als notwendig aufbewahrt werden.', '', '', NULL, NULL),
(118, 110, 82, 'file_66042f29689ce.docx', 'Muster_Loschkonzept.docx', NULL, 0, 'Hinterfragen Sie, ob Sie ein Löschkonzept im Unternehmen implementiert haben. Entwickeln Sie Richtlinien und Verfahren, um sicherzustellen, dass Daten nicht länger als notwendig aufbewahrt werden.', '', '', NULL, NULL),
(119, 111, 83, NULL, NULL, NULL, 0, 'Implementieren Sie technisch-organisatorische Maßnahmen in Ihrem Unternehmen und kommunizieren Sie diese mit Ihren Mitarbeiter:innen.', '', 'https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Grundschutz/sonstiges/Informationssicherheit_mit_System.html?nn=128656', NULL, NULL),
(120, 112, 84, NULL, NULL, NULL, 0, 'Implementieren Sie technisch-organisatorische Maßnahmen in Ihrem Unternehmen und kommunizieren Sie diese mit Ihren Mitarbeiter:innen.', '', 'https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Grundschutz/sonstiges/Informationssicherheit_mit_System.html?nn=128656', NULL, NULL),
(121, 113, 85, NULL, NULL, NULL, 0, 'Ersuchen Sie Ihren IT-Dienstleister bzw. Ihre interne IT-Abteilung um eine Netzwerk- und IT Dokumentation.', '', '', NULL, NULL),
(122, 114, 89, 'file_660431356c96a.docx', 'Muster_erklaerung-zum-datengeheimnis.docx', NULL, 0, 'Holen Sie die Einwilligung für die Geheimhaltung von Ihren Mitarbeiter:innen ein.', '', '', NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
