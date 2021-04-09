#
# Table structure for table 'tt_content'
#
CREATE TABLE tt_content (
    columns_size varchar(20) DEFAULT '' NOT NULL,
  	overtitle varchar(255) DEFAULT '' NOT NULL,
  	enable_mobile_slider tinyint(1) DEFAULT 0 NOT NULL,
    accordion_open_first INT(11) DEFAULT 0 NOT NULL,
    accordion_allow_multiple INT(11) DEFAULT 0 NOT NULL,
    colPos INT DEFAULT 0 NOT NULL,
    layout varchar(255) DEFAULT '' NOT NULL
);
