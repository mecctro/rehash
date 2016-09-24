#
# $Id$
#

DROP TABLE IF EXISTS ajax_ops;
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
