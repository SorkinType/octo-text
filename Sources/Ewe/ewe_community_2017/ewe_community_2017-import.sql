CREATE DATABASE `ewe_community_2017`;

USE ewe_community_2017;

CREATE TABLE `words` (
  `w_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `word_ci` varchar(255) DEFAULT NULL,
  `freq` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`w_id`),
  KEY `word` (`word`),
  KEY `w_id` (`w_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15613 DEFAULT CHARSET=utf8;

CREATE TABLE `sentences` (
  `s_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sentence` text,
  KEY `s_id` (`s_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10174 DEFAULT CHARSET=utf8;

CREATE TABLE `co_s` (
  `w1_id` int(10) unsigned NOT NULL DEFAULT '0',
  `w2_id` int(10) unsigned NOT NULL DEFAULT '0',
  `freq` int(8) unsigned DEFAULT NULL,
  `sig` float DEFAULT NULL,
  PRIMARY KEY (`w1_id`,`w2_id`),
  KEY `w1_sig` (`w1_id`,`sig`),
  KEY `w2_sig` (`w2_id`,`sig`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `co_n` (
  `w1_id` int(10) unsigned NOT NULL DEFAULT '0',
  `w2_id` int(10) unsigned NOT NULL DEFAULT '0',
  `freq` int(8) unsigned DEFAULT NULL,
  `sig` float DEFAULT NULL,
  PRIMARY KEY (`w1_id`,`w2_id`),
  KEY `w1_sig` (`w1_id`,`sig`),
  KEY `w2_sig` (`w2_id`,`sig`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `inv_w` (
  `w_id` int(10) unsigned NOT NULL DEFAULT '0',
  `s_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pos` mediumint(2) unsigned NOT NULL DEFAULT '0',
  KEY `w_id` (`w_id`),
  KEY `s_id` (`s_id`),
  KEY `w_s` (`w_id`,`s_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `inv_so` (
  `so_id` int(10) unsigned NOT NULL DEFAULT '0',
  `s_id` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `s_id` (`s_id`),
  KEY `so_id` (`so_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `sources` (
  `so_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  KEY `so_id` (`so_id`),
  KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=989 DEFAULT CHARSET=utf8;

ALTER TABLE `words` DISABLE KEYS;
ALTER TABLE `sentences` DISABLE KEYS;
ALTER TABLE `co_s` DISABLE KEYS;
ALTER TABLE `co_n` DISABLE KEYS;
ALTER TABLE `inv_w` DISABLE KEYS;
ALTER TABLE `inv_so` DISABLE KEYS;
ALTER TABLE `sources` DISABLE KEYS;

LOAD DATA LOCAL INFILE 'ewe_community_2017-words.txt' INTO TABLE words;
LOAD DATA LOCAL INFILE 'ewe_community_2017-sentences.txt' INTO TABLE sentences;
LOAD DATA LOCAL INFILE 'ewe_community_2017-co_s.txt' INTO TABLE co_s;
LOAD DATA LOCAL INFILE 'ewe_community_2017-co_n.txt' INTO TABLE co_n;
LOAD DATA LOCAL INFILE 'ewe_community_2017-inv_w.txt' INTO TABLE inv_w;
LOAD DATA LOCAL INFILE 'ewe_community_2017-inv_so.txt' INTO TABLE inv_so;
LOAD DATA LOCAL INFILE 'ewe_community_2017-sources.txt' INTO TABLE sources;

ALTER TABLE `words` ENABLE KEYS;
ALTER TABLE `sentences` ENABLE KEYS;
ALTER TABLE `co_s` ENABLE KEYS;
ALTER TABLE `co_n` ENABLE KEYS;
ALTER TABLE `inv_w` ENABLE KEYS;
ALTER TABLE `inv_so` ENABLE KEYS;
ALTER TABLE `sources` ENABLE KEYS;