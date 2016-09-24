#
# $Id$
#

ALTER TABLE users_info ADD COLUMN mod_banned date DEFAULT '1000-01-01' AFTER lastaccess_ts;
ALTER TABLE users_comments ADD COLUMN points tinyint DEFAULT '0' NOT NULL AFTER nosigs;

CREATE TABLE ajax_ops (
	id mediumint(5) unsigned NOT NULL AUTO_INCREMENT,
	op varchar(50) NOT NULL DEFAULT '',
	class varchar(100) NOT NULL DEFAULT '',
	subroutine varchar(100) NOT NULL DEFAULT '',
	reskey_name varchar(64) NOT NULL DEFAULT '',
	reskey_type varchar(64) NOT NULL DEFAULT '',
	PRIMARY KEY (`id`),
	UNIQUE KEY op (op)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS moderatorlog (
	id int UNSIGNED NOT NULL auto_increment,
	ipid char(32) DEFAULT '' NOT NULL,
	subnetid char(32) DEFAULT '' NOT NULL,
	uid mediumint UNSIGNED NOT NULL,
	val tinyint DEFAULT '0' NOT NULL,
	sid mediumint UNSIGNED DEFAULT '0' NOT NULL,
	ts datetime DEFAULT '1970-01-01 00:00:00' NOT NULL,
	cid int UNSIGNED NOT NULL,
	cuid mediumint UNSIGNED NOT NULL,
	reason tinyint UNSIGNED DEFAULT '0',
	active tinyint DEFAULT '1' NOT NULL,
	spent tinyint DEFAULT '1' NOT NULL,
	points_orig tinyint DEFAULT NULL,
	PRIMARY KEY (id),
	KEY sid (sid,cid),
	KEY sid_2 (sid,uid,cid),
	KEY cid (cid),
	KEY ipid (ipid),
	KEY subnetid (subnetid),
	KEY uid (uid),
	KEY cuid (cuid),
	KEY ts_uid_sid (ts,uid,sid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS modreasons (
	id tinyint UNSIGNED NOT NULL,
	name char(32) DEFAULT '' NOT NULL,
	m2able tinyint DEFAULT '1' NOT NULL,
	listable tinyint DEFAULT '1' NOT NULL,
	val tinyint DEFAULT '0' NOT NULL,
	karma tinyint DEFAULT '0' NOT NULL,
	fairfrac float DEFAULT '0.5' NOT NULL,
	unfairname varchar(32) DEFAULT '' NOT NULL,
	ordered tinyint UNSIGNED DEFAULT '50' NOT NULL,
	needs_prior_mod tinyint UNSIGNED DEFAULT '0' NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
