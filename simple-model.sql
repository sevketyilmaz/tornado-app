DROP DATABASE IF EXISTS tornadoDB;
CREATE DATABASE IF NOT EXISTS tornadoDB;
USE tornadoDB;

SELECT 'CREATING DATABASE STRUCTURE' as 'INFO';

DROP TABLE IF EXISTS customer_states,
            customers,
            rents,
            rent_item_states,
            bike_park_states,
            bike_park_details,
            rent_items,
            country_lists,
            city_lists,
            places,
            stations,
            parks,
            slots;


CREATE TABLE IF NOT EXISTS customer_states (
  id			            INT(3)         NOT NULL,
  name                VARCHAR(50)     NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS customers (
    id			            INT             NOT NULL,
    birth_date          DATE            NOT NULL,
    first_name          VARCHAR(14)     NOT NULL,
    last_name           VARCHAR(16)     NOT NULL,
    email               VARCHAR(50)     NOT NULL,
    gsm                 VARCHAR(20)     NOT NULL,
    gender              ENUM ('M','F')  NOT NULL,
    password            VARCHAR(50)     NOT NULL,
    customer_state_id   INT DEFAULT 1,
    creation_time       DATETIME DEFAULT CURRENT_TIMESTAMP,
    modification_time   DATETIME ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_state_id) REFERENCES customer_states(id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS rents (
    id			            INT(11)         NOT NULL,
    customer_id	        INT(11)         NOT NULL,
    creation_time       DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS rent_item_states (
  id			            INT(3)          NOT NULL,
  name                VARCHAR(50)     NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS bike_park_states (
  id			            INT(3)         NOT NULL,
  name                VARCHAR(50)    NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS bike_park_details (
  id			            INT(11)         NOT NULL,
  name                VARCHAR(50)     NOT NULL,
  bike_park_state_id  INT(3),
  creation_time       DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (bike_park_state_id) REFERENCES bike_park_states(id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS rent_items (
    id			            INT(11)         NOT NULL,
    rent_id			        INT(11)         NOT NULL,
    bike_park_detail_id	INT(11)         NOT NULL,
    rent_item_state_id	INT(11)         NOT NULL,
    creation_time       DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (bike_park_detail_id) REFERENCES bike_park_details(id),
    FOREIGN KEY (rent_id) REFERENCES rents(id),
    FOREIGN KEY (rent_item_state_id) REFERENCES rent_item_states(id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS country_lists (
  id 		      INT(11) 	  	NOT NULL AUTO_INCREMENT,
  iso 			  CHAR(2) 	  	NOT NULL,
  name 			  VARCHAR(80) 	NOT NULL,
  tr_name 	  VARCHAR(80) 	NOT NULL,
  iso3 			  CHAR(3)   		DEFAULT NULL,
  phone_code 	INT(5) 		  	NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS city_lists (
  id 		          INT(11) 	  	NOT NULL AUTO_INCREMENT,
  country_list_id INT(11)       NOT NULL,
  name 			      VARCHAR(80) 	NOT NULL,
  nice_name       VARCHAR(80) 	NOT NULL,
  plate_number	  INT(4)   		  DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (country_list_id) REFERENCES country_lists(id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS places (
  id 		        INT(11) 	  	NOT NULL AUTO_INCREMENT,
  city_list_id  INT(11)       NOT NULL,
  name 			    VARCHAR(80) 	NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (city_list_id) REFERENCES city_lists(id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS stations (
  id 		        INT(11) 	  	NOT NULL AUTO_INCREMENT,
  place_id       INT(11)       NOT NULL,
  name 			    VARCHAR(80) 	NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (place_id) REFERENCES places(id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS parks (
  id 		        INT(11) 	  	NOT NULL AUTO_INCREMENT,
  station_id    INT(11)       NOT NULL,
  name 			    VARCHAR(80) 	NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (station_id) REFERENCES stations(id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS slots (
  id 		        INT(11) 	  	NOT NULL AUTO_INCREMENT,
  park_id       INT(11)       NOT NULL,
  name 			    VARCHAR(80) 	NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (park_id) REFERENCES parks(id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
