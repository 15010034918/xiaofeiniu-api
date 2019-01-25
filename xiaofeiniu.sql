SET NAMES UTF8;
DROP DATABASE IF EXISTS xiaofeiniu;
CREATE DATABASE xiaofeiniu CHARSET=UTF8;
USE xiaofeiniu;

CREATE TABLE xfn_admin(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  aname VARCHAR(32) UNIQUE,
  apwd  VARCHAR(64)
);
INSERT INTO xfn_admin VALUES(null,'dingding','123456');
INSERT INTO xfn_admin VALUES(null,'dangdang','123456');
INSERT INTO xfn_admin VALUES(null,'tom','123456');

CREATE TABLE xfn_settings(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  appName  VARCHAR(32),
  apiUrl  VARCHAR(64),
  adminUrl  VARCHAR(64),
  appUrl  VARCHAR(64),
  icp  VARCHAR(64),
  copyright  VARCHAR(128)
);
INSERT INTO xfn_settings VALUES(null,'xiaofeiniu','','','','','');

CREATE TABLE xfn_table(
  tid INT PRIMARY KEY AUTO_INCREMENT,
  tname VARCHAR(64),
  type  VARCHAR(16),
  status INT
);
INSERT INTO xfn_table VALUES(null,'梅','4','1');
INSERT INTO xfn_table VALUES(null,'兰','4','1');
INSERT INTO xfn_table VALUES(null,'竹','3','1');
INSERT INTO xfn_table VALUES(null,'菊','3','1');

CREATE TABLE xfn_category(
  tid INT PRIMARY KEY AUTO_INCREMENT,
  cname VARCHAR(32)
);
INSERT INTO xfn_category VALUES(null,'肉类');
INSERT INTO xfn_category VALUES(null,'素材');
INSERT INTO xfn_category VALUES(null,'小料');
INSERT INTO xfn_category VALUES(null,'酒水');

CREATE TABLE xfn_dish(
  did INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(32),
  imgRrl VARCHAR(128),
  price DECIMAL(6,2),
  detail VARCHAR(128),
  categoryId INT Foreign key(categoryId) REFERENCES  xfn_category(cname)
);