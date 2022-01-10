create database if not exists santer_club;
use santer_club;

create table if not exists _groups(
	group_id int primary key auto_increment,
	group_name varchar(30)
) comment = 'Категории участников';


create table if not exists members(
	id int primary key auto_increment,
	firstname varchar(20),
	lastname varchar(20),
	age int,
	group_id int,
	foreign key (group_id) references _groups(group_id)
) comment = 'Участники клуба';


create table if not exists crew(
	crew_id int primary key auto_increment,
	title varchar(50),
	group_id int,
	foreign key (group_id) references _groups(group_id)
) comment = 'Список экипажей';

create table if not exists crew_members(
	member_id int,
	crew_id int,
	foreign key (member_id) references members(id),
	foreign key (crew_id) references crew(crew_id)
) comment = 'Участники экипажей';

create table if not exists boats(
	boat_id int primary key auto_increment,
	name varchar(40),
	capacity int
) comment = 'Список лодок';

create table if not exists schedule(
	day date,
	started_at time,
	started_on int,
	crew_id int,
	coach int,
	foreign key (started_on) references boats(boat_id),
	foreign key (crew_id) references crew(crew_id),
	foreign key (coach) references members(id)
) comment = 'Расписание';