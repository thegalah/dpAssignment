drop table if exists `cinemas`;
create table `cinemas`(
	`id` int(11) not null auto_increment,
	`created` timestamp not null default current_timestamp,
	`name` varchar(100) not null,
	`address` varchar(100) not null,
	`latitude` text not null,
	`longitude` text not null,
	`status` enum('open','renovation','bankrupt'),
	primary key(`id`),
	unique key(`name`,`address`)
)ENGINE=MyISAM DEFAULT CHARSET=latin1;