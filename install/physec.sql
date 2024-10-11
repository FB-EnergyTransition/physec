-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: devsql02
-- Generation Time: Oct 07, 2024 at 05:38 PM
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
-- Database: `physec_1`
--

--
-- Dumping data for table `answeroption`
--

INSERT INTO `answeroption` (`id`, `question`, `answertext`, `description`, `mark`, `ordernum`) VALUES
(58, 29, 'Cloud', 'Sie sind in einer Cloud', 'neutral', 1),
(60, 29, 'Hybrid', NULL, 'good', 2),
(61, 29, 'Lokal', '', 'good', 3),
(62, 30, 'Zugangsbeschränkungen & Videoüberwachung', NULL, 'good', 1),
(63, 30, 'Überwachung durch Kameras oder Personal', '', 'weak', 2),
(64, 30, 'Keine Maßnahmen', '', 'bad', 3),
(67, 32, 'Umfassende Maßnahmen', NULL, 'good', 1),
(68, 32, 'Begrenzte Maßnahmen', '', 'weak', 2),
(69, 32, 'Keine Maßnahmen', NULL, 'bad', 3),
(70, 33, '2-Faktor-Authentifizierung', NULL, 'good', 1),
(71, 33, 'Generierte Passwörter', '', 'weak', 2),
(72, 33, 'Selbsterstellte Passwörter', '', 'bad', 3),
(76, 34, 'Mit regelmäßigen Updates (48h).', '', 'good', 1),
(77, 34, 'Mit regelmäßige Updates in größeren Abständen (mehrere Wochen).', '', 'weak', 2),
(78, 34, 'Sehr selten (Monate/Jahre).', '', 'bad', 3),
(79, 35, 'Mit regelmäßigen Updates (48h).', '', 'good', 1),
(80, 35, 'Updates in größeren Abständen (mehrere Wochen).', '', 'weak', 2),
(81, 35, 'Seltene Upadtes (Monate/Jahre).', '', 'bad', 3),
(82, 36, 'Nein.', '', 'neutral', 1),
(83, 36, 'Ja.', '', 'neutral', 2),
(84, 37, 'Durch klare Sicherheitsrichlinien.', NULL, 'good', 1),
(85, 37, 'Durch begrenzte Richtlinien (z.B. limitierte Auswahl an Apps)', '', 'weak', 2),
(86, 37, 'Es gibt keine Richtlinien', '', 'bad', 3),
(87, 38, 'Nein.', '', 'neutral', 1),
(88, 38, 'Ja.', '', 'neutral', 2),
(89, 39, 'Durch Mobile Device Management (MDM)-Lösungen.', NULL, 'good', 1),
(90, 39, 'Durch vordefinierte Maßnahmen (z.B. VPN).', '', 'weak', 2),
(91, 39, 'Es gibt keine Maßnahmen oder Vorkehrungen.', '', 'bad', 3),
(95, 42, 'Durch regelmäßige Schulungen (jährlich) und Sensibilisierungsmaßnahmen.', NULL, 'good', 1),
(96, 42, 'Durch gelegentlich Schulungen (einmalig) und einige Sicherheitsrichtlinien.', '', 'weak', 2),
(97, 42, 'Es gibt disbezüglich keine speziellen Maßnahmen.', '', 'bad', 3),
(98, 43, 'Es gibt klare Meldewege die durch regelmäßige Schulungen und Workshops angepasst werden.', NULL, 'good', 1),
(99, 43, 'Es werden Bewusstein durch einmalige Schulungen mitgegeben.', '', 'weak', 2),
(100, 43, 'Es gibt keine Meldewege oder Bewusstsein der Mitrabeiter.', '', 'bad', 3),
(104, 45, 'Es gibt umfassende Maßnahmen (gesetzliche Vorschrift).', NULL, 'good', 1),
(105, 45, 'Es werden teilweise die Umsetzung gesetzlicher Vorschriften umgesetzt.', '', 'weak', 2),
(107, 45, 'Es gibt keine Umsetzung gesetzlicher Vorschriften.', '', 'bad', 3),
(108, 46, 'Durch detailierter Vorfallreaktionsplan zur Erkennung, Meldung und Bewältigung von Zwischenfälle.', NULL, 'good', 1),
(109, 46, 'Es gibt einen groben Plan den nur wenige kennen.', '', 'weak', 2),
(110, 46, 'Es gibt keinen Vorfallreaktionsplan.', '', 'bad', 3),
(111, 47, 'Es ist ein detailieres Überwachungssystem für Sicherheitsvorfälle und Compliance-Verletzungen vorhanden.', NULL, 'good', 1),
(112, 47, 'Es sind Überwachungssysteme vorhanden , aber die Berichterstattung fehlt.', '', 'weak', 2),
(113, 47, 'Keine Überwachungssysteme vorhanden', '', 'bad', 3),
(116, 55, 'IDS/IPS (Intrusion Detection Systems/Intrusion Prevention Systems)', NULL, 'good', 1),
(117, 55, 'Firewall', NULL, 'good', 2),
(118, 55, 'keine Maßnahmen', '', 'bad', 3);

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `answeroption`, `name`, `ordernum`) VALUES
(40, 58, '1', 1),
(68, 60, 'hybrid', NULL),
(69, 61, 'lokal', NULL),
(71, 77, 'updates_wochen', NULL),
(72, 78, 'updates_monate_jahre', NULL),
(74, 80, 'mehrere_wochen_updates2', NULL),
(75, 81, 'updates_monate_jahre2', NULL),
(76, 82, 'byod_nein', NULL),
(77, 83, 'byod_ja', NULL),
(78, 85, 'begrenzte_byod', NULL),
(79, 86, 'keine_richtlinien_byod', NULL),
(80, 88, 'mdm_ja', NULL),
(81, 87, 'mdm_nein', NULL),
(82, 90, 'mdm_vpn', NULL),
(83, 91, 'mdm_keine_maßnahmen', NULL),
(84, 63, 'zugang', NULL),
(85, 64, 'zugang_2', NULL),
(86, 68, 'begr_physisch', NULL),
(87, 69, 'keine maßnahmen_phys', NULL),
(88, 71, 'pw_1', NULL),
(89, 72, 'pw_2', NULL),
(90, 118, '', NULL),
(91, 96, '', NULL),
(92, 97, 'schulung_2', NULL),
(93, 99, 'schulung_3', NULL),
(94, 100, 'phishing_2', NULL),
(95, 105, 'it_dsgvo_1', NULL),
(96, 107, 'regu_1', NULL),
(97, 109, 'notfall_1', NULL),
(98, 110, 'notfall_2', NULL),
(99, 112, 'notfall_3', NULL),
(100, 113, '', NULL);

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `collection`, `name`, `ordernum`) VALUES
(6, 6, 'IT-Security und Netzwerksicherheit', 1),
(7, 6, 'Endpunkt- und Gerätesicherheit', 2),
(9, 6, 'Sicherheitsbewusstsein und Schulung', 4),
(10, 6, 'Compliance & Incident Response', 5),
(13, 6, 'IT-Security & Netzwerksicherheit', 7),
(14, 6, 'Endpunkt- und Gerätesicherheit', 8),
(15, 6, 'Sicherheitsbewusstsein und Schulung', 9),
(16, 6, 'Physische Sicherheit', 10),
(17, 6, 'Compliance & Incident Response', 11);

--
-- Dumping data for table `collection`
--

INSERT INTO `collection` (`id`, `name`, `disabled`, `categorizers`) VALUES
(6, 'IT-Sicherheit', 0, 'N;');

--
-- Dumping data for table `filelink`
--

INSERT INTO `filelink` (`id`, `file`, `filename`) VALUES
(6, 'file_664f65a0d4f7a.pdf', 'IT-Notfallkarte'),
(8, 'file_664f66301edc4.pdf', 'Notfallmanagement'),
(9, 'file_664f68af160e4.pdf', 'sichere_Passwörter');

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `collection`, `class`, `name`, `qtext`, `description`, `type`, `mark_false`, `mark_true`, `conditions`, `ordernum`) VALUES
(29, 6, 13, 'IT-Security und Netzwerksicherheit 1', 'Welche Art von Serverinfrastruktur nutzt Ihr Unternehmen?', 'Teilen Sie uns mit, welche Art von Serverinfrastruktur Ihr Unternehmen nutzt.', 'radio', NULL, NULL, 'a:0:{}', 2),
(30, 6, 13, 'IT-Security und Netzwerksicherheit', 'Wie erfolgt die physische Sicherheit Ihrer Server-Räume?', '', 'radio', NULL, NULL, 'a:2:{i:0;O:9:\"Condition\":4:{s:11:\"\0*\0question\";s:2:\"29\";s:11:\"\0*\0operator\";s:2:\"==\";s:8:\"\0*\0value\";s:6:\"Hybrid\";s:7:\"\0*\0link\";N;}i:1;O:9:\"Condition\":4:{s:11:\"\0*\0question\";s:2:\"29\";s:11:\"\0*\0operator\";s:2:\"==\";s:8:\"\0*\0value\";s:5:\"Lokal\";s:7:\"\0*\0link\";N;}}', 3),
(32, 6, 13, 'IT-Security und Netzwerksicherheit', 'Welche Maßnahmen zur physischen Sicherheit werden ergriffen, um den Schutz vor Umweltauswirkungen auf Ihre IT-Infrastruktur zu gewährleisten, wie Feuer, Überschwemmungen oder Stromausfälle?', '', 'radio', NULL, NULL, 'a:2:{i:0;O:9:\"Condition\":4:{s:11:\"\0*\0question\";s:2:\"29\";s:11:\"\0*\0operator\";s:2:\"==\";s:8:\"\0*\0value\";s:6:\"Hybrid\";s:7:\"\0*\0link\";N;}i:1;O:9:\"Condition\":4:{s:11:\"\0*\0question\";s:2:\"29\";s:11:\"\0*\0operator\";s:2:\"==\";s:8:\"\0*\0value\";s:5:\"Lokal\";s:7:\"\0*\0link\";N;}}', 5),
(33, 6, 13, 'IT-Security und Netzwerksicherheit', 'Wie schützen Sie Ihre Benutzerkonten vor fremden Zugriff ?', '', 'radio', NULL, NULL, 'N;', 6),
(34, 6, 7, 'Endpunkt- und Gerätesicherheit', 'Wie schützen Sie Ihre Systeme (Server und Computer) vor Malware und Viren?', '', 'radio', NULL, NULL, 'N;', 7),
(35, 6, 7, 'Endpunkt- und Gerätesicherheit', 'Wie oft werden Sicherheitspatches und Updates auf Endpunktgeräten in\r\nIhrem Unternehmen installiert?', '', 'radio', NULL, NULL, 'N;', 8),
(36, 6, 7, 'Endpunkt- und Gerätesicherheit', 'Erlauben Sie Ihren Mitarbeitern, eigene Geräte (BYOD) für geschäftliche Zwecke zu verwenden?', '', 'radio', NULL, NULL, 'N;', 9),
(37, 6, 7, 'Endpunkt- und Gerätesicherheit', 'Wie sind diese Geräte (BYOD) gesichert?', '', 'radio', NULL, NULL, 'a:1:{i:0;O:9:\"Condition\":4:{s:11:\"\0*\0question\";i:36;s:11:\"\0*\0operator\";s:2:\"==\";s:8:\"\0*\0value\";N;s:7:\"\0*\0link\";i:83;}}', 10),
(38, 6, 7, 'Endpunkt- und Gerätesicherheit', 'Können mobile Geräte auf das Unternehmensnetzwerk zugreifen', '', 'radio', NULL, NULL, 'a:0:{}', 11),
(39, 6, 7, 'Endpunkt- und Gerätesicherheit', 'Wir wird der Zugriff von mobile Geräte auf das Unternehmensnetzwerk abgesichert?', '', 'radio', NULL, NULL, 'N;', 12),
(42, 6, 9, 'Sicherheitsbewusstsein und Schulung', 'Wie wird das Sicherheitsbewusstsein und die Schulung Ihrer Mitarbeiter in Bezug auf IT-Sicherheit gefördert?', '', 'radio', NULL, NULL, 'N;', 13),
(43, 6, 9, 'Sicherheitsbewusstsein und Schulung', 'Wie reagieren Mitarbeiter auf potenzielle Sicherheitsbedrohungen, wie Phishing-E-Mails oder verdächtige Anhänge?', '', 'radio', NULL, NULL, 'N;', 14),
(45, 6, 10, 'Compliance & Incident Response', 'Wie gut erfüllt Ihr Unternehmen gesetzliche und regulatorische Anforderungen in Bezug auf IT-Sicherheit und Datenschutz?', NULL, 'radio', NULL, NULL, 'N;', 15),
(46, 6, 10, 'Compliance & Incident Response', 'Wie reagiert Ihr Unternehmen auf IT-Sicherheitsvorfälle und Zwischenfälle?', NULL, 'radio', NULL, NULL, 'N;', 16),
(47, 6, 10, 'Compliance & Incident Response', 'Welche Maßnahmen zur Überwachung und Berichterstattung von IT-Sicherheitsvorfällen und Compliance-Verletzungen werden in Ihrem Unternehmen ergriffen?', '', 'radio', NULL, NULL, 'a:0:{}', 17),
(52, 6, 13, 'In welcher Branche sind sie tätig?', 'In welcher Branche sind sie tätig?', '', 'text', NULL, NULL, 'N;', 1),
(55, 6, 13, 'Wie erfolgt der Schutz Ihrer Netzwerkarchitektur?', 'Wie erfolgt der Schutz Ihrer Netzwerkarchitektur?', '', 'check', NULL, NULL, 'a:2:{i:0;O:9:\"Condition\":4:{s:11:\"\0*\0question\";i:29;s:11:\"\0*\0operator\";s:2:\"==\";s:8:\"\0*\0value\";s:0:\"\";s:7:\"\0*\0link\";i:60;}i:1;O:9:\"Condition\":4:{s:11:\"\0*\0question\";i:29;s:11:\"\0*\0operator\";s:2:\"==\";s:8:\"\0*\0value\";s:0:\"\";s:7:\"\0*\0link\";i:61;}}', 18);

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `category`, `question`, `file`, `filename`, `filelink`, `attach`, `rtext`, `video`, `link`, `linkcaption`, `ordernum`) VALUES
(74, 40, NULL, NULL, NULL, NULL, 0, 'Stellen Sie sicher, dass Sie einen zuverlässigen Cloud-Anbieter mit starken Sicherheitsmaßnahmen wählen. Regelmäßige Sicherheitsbewertungen und das Management von Zugriffsrechten sind essenziell.', NULL, '', '', NULL),
(75, 68, 29, NULL, NULL, NULL, 0, 'Bei einer hybriden Infrastruktur sollten Sie eine klare Trennung zwischen Cloud- und On-Premise-Ressourcen sicherstellen. Nutzen Sie die Vorteile beider Umgebungen, indem Sie sensible Daten lokal speichern und skalierbare Ressourcen in der Cloud nutzen.', NULL, '', '', NULL),
(76, 69, 29, NULL, NULL, NULL, 0, 'Lokale Server erfordern eine umfassende physische und netzwerkbasierte Sicherheit. Investieren Sie in Firewall-Lösungen, regelmäßige Sicherheitsupdates und Backup-Strategien.', '', '', NULL, NULL),
(78, 71, 34, NULL, NULL, NULL, 0, 'Erhöhen Sie die Frequenz Ihrer Updates. In der heutigen schnelllebigen Bedrohungslandschaft können selbst kurze Verzögerungen bei Updates gefährlich sein.', '', '', NULL, NULL),
(79, 72, 34, NULL, NULL, NULL, 0, 'Dies stellt ein erhebliches Sicherheitsrisiko dar. Implementieren Sie eine strikte Update-Politik und automatisieren Sie den Update-Prozess, um sicherzustellen, dass Ihre Systeme geschützt sind.', '', '', NULL, NULL),
(81, 74, 35, NULL, NULL, NULL, 0, 'Verkürzen Sie die Update-Zyklen, um die Sicherheitslücke zu minimieren.', '', '', NULL, NULL),
(82, 75, 35, NULL, NULL, NULL, 0, 'Implementieren Sie eine Policy für regelmäßige Updates und nutzen Sie Management-Tools zur Überwachung der Update-Status.', '', '', NULL, NULL),
(83, 76, 36, NULL, NULL, NULL, 0, 'Wenn Sie BYOD nicht erlauben, stellen Sie sicher, dass Ihre Mitarbeiter über firmeneigene Geräte verfügen, die sicher und für ihre Aufgaben geeignet sind.', '', '', NULL, NULL),
(84, 77, 36, NULL, NULL, NULL, 0, 'Implementieren Sie eine BYOD-Richtlinie, die klare Anweisungen zur Sicherheit und Verwaltung dieser Geräte enthält. Nutzen Sie Mobile Device Management (MDM)-Lösungen, um die Gerätesicherheit zu gewährleisten.', '', '', NULL, NULL),
(85, 78, 37, NULL, NULL, NULL, 0, 'Erweitern Sie die Richtlinien, um umfassende Sicherheitsmaßnahmen und Anforderungen für BYOD-Geräte zu definieren.', '', 'https://epicenter.academy/index.php/geraete-sicher-machen', NULL, NULL),
(86, 79, 37, NULL, NULL, NULL, 0, 'Beginnen Sie sofort mit der Entwicklung von BYOD-Richtlinien, um das Risiko zu minimieren und die Sicherheit zu gewährleisten.', '', 'https://epicenter.academy/index.php/geraete-sicher-machen', NULL, NULL),
(87, 80, 38, NULL, NULL, NULL, 0, 'Implementieren Sie Sicherheitsrichtlinien und -lösungen wie Mobile Device Management (MDM) und sichere VPN-Verbindungen, um den Zugriff zu kontrollieren und zu sichern.', '', 'https://epicenter.academy/index.php/geraete-sicher-machen#app_berechtigungen/', NULL, NULL),
(88, 81, 38, NULL, NULL, NULL, 0, 'Erwägen Sie die Möglichkeit, mobilen Zugriff unter strengen Sicherheitsvorkehrungen zu erlauben, um Flexibilität und Produktivität zu erhöhen.', '', 'https://epicenter.academy/index.php/geraete-sicher-machen#app_berechtigungen/', NULL, NULL),
(89, 82, 39, NULL, NULL, NULL, 0, 'Ergänzen Sie diese Maßnahmen durch MDM-Lösungen für eine umfassende Sicherheit, um Geräteverwaltung und -sicherheit zu optimieren.', '', '', NULL, NULL),
(90, 83, 39, NULL, NULL, NULL, 0, 'Beginnen Sie unverzüglich mit der Implementierung von Sicherheitsmaßnahmen wie MDM und VPN, um unautorisierten Zugriff und Datenlecks zu verhindern.', '', 'https://epicenter.academy/index.php/geraete-sicher-machen', NULL, NULL),
(91, 84, 30, NULL, NULL, NULL, 0, 'Berücksichtigen Sie die Einrichtung von Zugangsbeschränkungen (versperrbaren Serverschränken, Serverräumen, Schlössern, etc.).', '', '', NULL, NULL),
(92, 85, 30, NULL, NULL, NULL, 0, 'Beginnen Sie umgehend mit der Implementierung grundlegender Sicherheitsmaßnahmen wie Zugangsbeschränkungen und/oder Videoüberwachung. Berücksichtigen Sie ebenfalls die Datenschutz-Maßnahmen bei der Einrichtung von Videoüberwachungen.', '', '', NULL, NULL),
(93, 86, 32, NULL, NULL, NULL, 0, 'Erweitern Sie Ihre Maßnahmen, um einen vollständigen Schutz gegen Naturkatastrophen, Feuer oder Stromausfälle zu gewährleisten.', '', 'https://epicenter.academy/sites/default/files/2022-10/Einfach%20erkla%CC%88rt_Gefahrenmodell_Webversion_0.webm', NULL, NULL),
(94, 87, 32, NULL, NULL, NULL, 0, 'Beginnen Sie unverzüglich mit der Implementierung grundlegender Sicherheitsvorkehrungen, wie z.B. Feuerlöscher, Notstromversorgung und Katastrophenschutzpläne.', 'https://epicenter.academy/sites/default/files/2022-10/Einfach%20erkla%CC%88rt_Gefahrenmodell_Webversion_0.webm', '', NULL, NULL),
(95, 88, 33, NULL, NULL, NULL, 0, 'Nutzen Sie Passwort-Manager, um starke, einzigartige Passwörter für jeden Dienst zu erstellen und sicher zu speichern.', 'https://epicenter.academy/sites/default/files/2022-09/Unknackbar%20aber%20einfach%20zu%20merken%21%20-%20Passwo%CC%88rter%20Einfach%20Erkla%CC%88rt_0.mp4', 'https://epicenter.academy/index.php/passwoerter', NULL, NULL),
(96, 89, 33, NULL, NULL, 9, 1, 'Schulen Sie Ihre Mitarbeiter in der Erstellung starker Passwörter und ermutigen Sie zur regelmäßigen Änderung.', 'https://epicenter.academy/sites/default/files/2022-09/Unknackbarhttps://epicenter.academy/sites/default/files/2022-09/Unknackbarhttps://epicenter.academy/sites/default/files/2022-09/Unknackbarhttps://epicenter.academy/sites/default/files/2022-09/Unknackba', 'https://epicenter.academy/index.php/passwoerter', 'sichere Passwörter', NULL),
(97, 90, 55, NULL, NULL, NULL, 0, 'Es ist kritisch, sofort grundlegende Sicherheitsmaßnahmen wie Firewalls und IDS/IPS zu implementieren.', '', 'https://epicenter.academy/index.php/digitale-kriminalitaet', NULL, NULL),
(98, 91, 42, NULL, NULL, NULL, 0, 'Erhöhen Sie die Häufigkeit und Tiefe der Schulungen, um ein durchgängig hohes Sicherheitsniveau zu gewährleisten.', '', 'https://epicenter.academy/index.php/e-learning', NULL, NULL),
(99, 92, 42, NULL, NULL, NULL, 0, 'Beginnen Sie sofort mit der Implementierung eines Sicherheitsschulungsprogramms. Dies ist eine der kosteneffektivsten Methoden, um die IT-Sicherheit zu verbessern.', '', 'https://epicenter.academy/index.php/e-learning', NULL, NULL),
(100, 93, 43, NULL, NULL, NULL, 0, 'Es ist wichtig, die Schulungsfrequenz zu erhöhen und zu intensivieren, damit Mitarbeiter nicht nur über Bewusstsein verfügen, sondern auch aktiv auf Sicherheitsbedrohungen reagieren können.', 'https://epicenter.academy/sites/default/files/2023-01/1-P-jeden%20treffen-lang_v01_LB.mp4', 'https://epicenter.academy/index.php/phishing', NULL, NULL),
(101, 94, 43, NULL, NULL, NULL, 0, 'Unternehmen müssen umgehend Sicherheitsschulungen einführen und klare Meldewege etablieren, um das Risiko durch fehlendes Bewusstsein und Reaktionsmöglichkeiten auf Sicherheitsbedrohungen zu minimieren.', 'https://epicenter.academy/sites/default/files/2023-01/1-P-jeden%20treffen-lang_v01_LB.mp4', 'https://epicenter.academy/index.php/phishing#phishing/', NULL, NULL),
(102, 95, 45, NULL, NULL, NULL, 0, 'Vorschriften Unternehmen, die nur teilweise konform sind, müssen zuerst ihre Defizite identifizieren und dann einen klaren Aktionsplan erstellen, um diese zu beheben. Ein effektives Risikomanagement hilft dabei, die mit der Nichtkonformität verbundenen Risiken zu minimieren.', NULL, 'https://epicenter.academy/index.php/warum-datenschutz', '', NULL),
(103, 96, 45, NULL, NULL, NULL, 0, 'Unternehmen ohne entsprechende IT-Sicherheits-Maßnahmen müssen umgehend eine gründliche Bewertung durchführen, um eine dringende Compliance-Strategie zu entwickeln. Dabei kann externe Expertise entscheidend sein, um schnell und effektiv alle Anforderungen zu erfüllen.', '', 'https://epicenter.academy/index.php/warum-datenschutz', NULL, NULL),
(104, 97, 46, 'file_664f59b90db57.pdf', 'IT-Notfallkarte_DINA4.pdf', 8, 1, 'Entwickeln Sie einen detaillierteren Plan, der spezifische Schritte zur Erkennung, Untersuchung, Behebung und Kommunikation (innerhalb des Unternehmens) von Sicherheitsvorfällen umfasst.', NULL, 'https://www.bsi.bund.de/DE/Themen/Unternehmen-und-Organisationen/Informationen-und-Empfehlungen/Empfehlungen-nach-Angriffszielen/Unternehmen-allgemein/IT-Notfallkarte/Massnahmenkatalog/massnahmenkatalog_node.html', 'Empfehlungen', NULL),
(105, 98, 46, 'file_664f59e5837de.pdf', 'IT-Notfallkarte_DINA4.pdf', 6, 1, 'Das Fehlen eines Vorfallreaktionsplans stellt ein signifikantes Risiko dar. Beginnen Sie sofort mit der Entwicklung eines umfassenden Plans, um auf Sicherheitsvorfälle reagieren zu können.', NULL, 'https://www.bsi.bund.de/DE/Themen/Unternehmen-und-Organisationen/Informationen-und-Empfehlungen/Empfehlungen-nach-Angriffszielen/Unternehmen-allgemein/IT-Notfallkarte/Massnahmenkatalog/massnahmenkatalog_node.html', 'Empfehlungen', NULL),
(106, 99, 47, 'file_664f5a5d3a083.pdf', 'One-Pager_Einstieg_ins_IT-Notfallmanagement_KMU.pdf', 8, 0, 'Verbessern Sie Ihre Reaktionspläne und Schulungen für das Personal, um sicherzustellen, dass Vorfälle schnell und effektiv behandelt werden.', NULL, '', '', NULL),
(107, 100, 47, 'file_664f5ac7c84a6.pdf', 'One-Pager_Einstieg_ins_IT-Notfallmanagement_KMU.pdf', NULL, 0, 'Beginnen Sie mit der Implementierung von Sicherheitsüberwachungstools und etablieren Sie Prozesse für die Berichterstattung und Reaktion auf Vorfälle. Schulen Sie Ihr Personal und etablieren Sie einen Maßnahmenplan zur Berichterstattung von IT-Sicherheitsvorfällen.', '', '', NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
