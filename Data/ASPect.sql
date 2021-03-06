CREATE DATABASE IF NOT EXISTS aspect;

CREATE USER IF NOT EXISTS 'aspector'@'localhost' IDENTIFIED BY 'tcepsa';
CREATE USER IF NOT EXISTS 'aspector'@'%' IDENTIFIED BY 'tcepsa';
GRANT ALL ON aspect.* TO 'aspector'@'localhost';
GRANT ALL ON aspect.* TO 'aspector'@'%';

USE aspect;

DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS aspnetuserroles;
DROP TABLE IF EXISTS aspnetroles;
DROP TABLE IF EXISTS aspnetusers;

CREATE TABLE aspnetusers(
	userid TINYTEXT
	, firstname TINYTEXT
	, lastname TINYTEXT
	, set TINYTEXT
	, email TINYTEXT
	, passwordhash TINYTEXT
	, PRIMARY KEY (userid)
);
CREATE TABLE aspnetroles(
	roleid TINYTEXT
	, name TINYTEXT
	, PRIMARY KEY (roleid)
);

CREATE TABLE aspnetuserroles(
	userid TINYTEXT
	, roleid TINYTEXT
	, FOREIGN KEY (userid) REFERENCES aspnetusers(userid)
	, FOREIGN KEY (roleid) REFERENCES aspnetroles(roleid)
);

CREATE TABLE course(
	courseid TINYTEXT
	, coursetitle TINYTEXT
	, term TINYTEXT
	, projectoutline TINYTEXT
	, instructorid TINYTEXT
	, course TINYTEXT
	, PRIMARY KEY (courseid)
	, FOREIGN KEY (instructorid) REFERENCES aspnetusers(userid)
);






