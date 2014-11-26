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
	unique key(`name`,`address`)
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

drop table if exists `movies`;

create table `movies`(
	`id` int(11) not null auto_increment,
	`created` timestamp not null default current_timestamp,
	`name` varchar(100) not null,
	`year` int(4) not null,
	`duration` varchar(5) not null,
	`rating` varchar(10) not null,	
	primary key(`id`),
	unique key(`name`,`year`,`duration`)
)ENGINE=MyISAM DEFAULT CHARSET=latin1;

insert into `movies` (name,year,duration,rating) VALUES
	('The Shawshank Redemption',1994,142,'R'),
	('The Godfather',1972,175,'R'),
	('The Godfather: Part II',1974,200,'R'),
	('The Dark Knight',2008,152,'PG-13'),
	('Pulp Fiction',1994,154,'R'),
	('The Good, the Bad and the Ugly',1996,161,'NR'),
	('Schindler\'s List',1993,195,'R'),
	('12 Angry Men',1957,96,'NR'),
	('The Lord of the Rings: The return of the King',2003,201,'PG-13'),
	('Fight Club',1999,139,'R')
	;