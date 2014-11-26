drop table if exists `cinemas`;
create table `cinemas`(
	`id` int(11) not null auto_increment,
	`created` timestamp not null default current_timestamp,
	`name` varchar(100) not null,
	`address` varchar(100) not null,
	`latitude` text not null,
	`longitude` text not null,
	`status` enum('open','renovation','bankrupt') DEFAULT 'open',
	primary key(`id`),
	unique key(`name`)
)ENGINE=MyISAM DEFAULT CHARSET=latin1;
insert into `cinemas` (name,address,longitude,latitude,status) VALUES
	('A','Shanghai','121.47','31.23','open'),
	('B','Bombay','72.82','18.96','open'),
	('C','Karachi','67.01','24.86','open'),
	('D','Buenos Aires','-58.37','-34.61','bankrupt'),
	('E','Delhi','77.21','28.67','open'),
	('F','Istanbul','29','41.1','open'),
	('G','Manila','120.97','14.62','renovation'),
	('H','Sao Paulo','-46.63','-23.53','open'),
	('I','Moscow','37.62','55.75','open'),
	('J','Dhaka','90.39','23.7','bankrupt'),
	('K','Soul','126.99','37.56','open'),
	('L','Lagos','3.35','6.5','open'),
	('M','Kinshasa','15.32','-4.31','bankrupt'),
	('N','Tokyo','139.77','35.67','open'),
	('O','Mexico City','-99.14','19.43','open'),
	('P','Jakarta','106.83','-6.18','open'),
	('Q','New York','-73.94','40.67','open'),
	('R','Tehran','51.43','35.67','open');