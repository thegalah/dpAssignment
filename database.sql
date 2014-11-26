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

drop table if exists `session_times`;

create table `session_times`(
	`id` int(11) not null auto_increment,
	`created` timestamp not null default current_timestamp,
	`movie_id` int(11) not null,
	`cinema_id` int(11) not null,
	`time_start` timestamp not null,	
	primary key(`id`),
	unique key(`movie_id`,`cinema_id`,`time_start`)
)ENGINE=MyISAM DEFAULT CHARSET=latin1;

insert into `session_times`(movie_id,cinema_id,time_start) VALUES
	(1,14,now()+INTERVAL 1 HOUR),
	(2,15,now()+INTERVAL 5 HOUR),
	(3,16,now()+INTERVAL 6 HOUR),
	(4,17,now()+INTERVAL 5 HOUR),
	(5,18,now()+INTERVAL 5 HOUR),
	(6,17,now()+INTERVAL 4 HOUR),
	(7,16,now()+INTERVAL 7 HOUR),
	(8,15,now()+INTERVAL 1 HOUR),
	(9,14,now()+INTERVAL 3 HOUR),
	(10,13,now()+INTERVAL 2 HOUR),
	(1,12,now()+INTERVAL 4 HOUR),
	(2,11,now()+INTERVAL 3 HOUR),
	(3,10,now()+INTERVAL 4 HOUR),
	(4,9,now()+INTERVAL 2 HOUR),
	(5,8,now()+INTERVAL 1 HOUR),
	(6,7,now()+INTERVAL 0 HOUR),
	(7,6,now()+INTERVAL 0 HOUR),
	(8,5,now()+INTERVAL 2 HOUR),
	(9,4,now()+INTERVAL 1 HOUR),
	(10,3,now()+INTERVAL 1 HOUR),
	(1,2,DATE_SUB(now(),INTERVAL 2 HOUR)),
	(2,1,DATE_SUB(now(),INTERVAL 6 HOUR)),
	(3,1,now()+INTERVAL 3 HOUR),
	(4,2,now()+INTERVAL 2 HOUR),
	(5,3,now()+INTERVAL 4 HOUR),
	(6,4,now()+INTERVAL 3 HOUR),
	(7,5,now()+INTERVAL 2 HOUR),
	(8,6,now()+INTERVAL 2 HOUR),
	(9,7,now()+INTERVAL 2 HOUR),
	(10,8,DATE_SUB(now(),INTERVAL 2 HOUR)),
	(1,9,now()+INTERVAL 2 HOUR),
	(2,10,now()+INTERVAL 3 HOUR),
	(3,11,now()+INTERVAL 4 HOUR),
	(4,12,now()+INTERVAL 3 HOUR),
	(5,13,now()+INTERVAL 3 HOUR),
	(6,14,now()+INTERVAL 2 HOUR),
	(7,15,now()+INTERVAL 1 HOUR),
	(8,16,now()+INTERVAL 1 HOUR),
	(9,17,now()+INTERVAL 1 HOUR),
	(10,18,now()+INTERVAL 1 HOUR)
	;