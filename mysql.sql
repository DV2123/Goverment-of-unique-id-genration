create database if not exists govunique;
use govunique;

create table person (
first_name varchar(20),
middle_name varchar(20),
last_name varchar(20),
age int,
gender varchar(8) not null,
address varchar(100) not null,
email_id varchar(50) primary key,
dob date not null,
person_id int not null
);

create table phone(
email_id varchar(50),
phone_no bigint not null,
foreign key(email_id) references person (email_id),
primary key (email_id, phone_no)
);

create table voter_card (
first_name varchar(20),
middle_name varchar(20),
last_name varchar(20),
voter_id_no mediumint primary key,
gender varchar(8) not null,
address varchar(100) not null
);

create table driving_licence (
licence_no mediumint primary key,
dob date not null,
validity date not null,
first_name varchar(20),
middle_name varchar(20),
last_name varchar(20),
address varchar(100) not null
);

create table vehicle(
licence_no mediumint,
vehicle_type varchar(10),
foreign key(licence_no) references driving_licence(licence_no),
primary key (licence_no, vehicle_type)
);

create table aadhar_card (
aadhar_no bigint primary key,
first_name varchar(20),
middle_name varchar(20),
last_name varchar(20),
address varchar(100) not null,
dob date not null
);

create table passport (
passport_no varchar(25) primary key,
first_name varchar(20),
middle_name varchar(20),
last_name varchar(20),
validity date not null,
address varchar(200) not null,
dob date not null
);

create table leaving_certy (
unique_id_no mediumint primary key,
certy_no varchar(50) unique not null,
gr_no int not null,
first_name varchar(20),
middle_name varchar(20),
last_name varchar(20),
last_school varchar(30) not null,
dob date not null,
place_of_birth varchar(50),
religion varchar(20) not null,
cast varchar(10) not null
);

create table birth_certy (
certy_no varchar(20) primary key,
first_name varchar(20),
middle_name varchar(20),
last_name varchar(20),
mother_name varchar(20) not null,
address varchar(200) not null,
dob date not null,
date_of_issue date not null,
place_of_birth varchar(20) not null,
gender varchar(8) not null
);

create table pan_card (
pan_no varchar(50) primary key,
first_name varchar(20),
middle_name varchar(20),
last_name varchar(20),
address varchar(100) not null,
esign tinyint,
without_sign tinyint
);

create table documents (
unique_id mediumint,
bcerty_id varchar(20),
voter_id mediumint,
passport_id varchar(25),
pan_id varchar(50),
licence_id mediumint,
aadhar_id bigint,
foreign key(unique_id) references leaving_certy(unique_id_no),
foreign key(bcerty_id) references birth_certy(certy_no),
foreign key(voter_id) references voter_card(voter_id_no),
foreign key(passport_id) references passport(passport_no),
foreign key(pan_id) references pan_card(pan_no),
foreign key(licence_id) references driving_licence(licence_no),
foreign key(aadhar_id) references aadhar_card(aadhar_no)
);

create table account (
person_id_no int primary key,
foreign key(person_id_no) references branch(person_id_no)
);

create table account_details(
person_id_no int,
account_type varchar(20) not null,
account_no bigint ,
account_balance double not null,
foreign key(person_id_no) references account(person_id_no),
primary key(person_id_no, account_type, account_no, account_balance)
);

create table branch (
person_id_no int primary key,
foreign key(person_id_no) references bank(person_id_no)
);

create table branch_detail(
person_id_no int,
branch_name varchar(50),
address varchar(100),
ifsc_code varchar(25),
foreign key(person_id_no) references branch(person_id_no),
primary key (person_id_no, branch_name, address, ifsc_code)
);

create table bank (
person_id_no int primary key,
foreign key(person_id_no) references varification(person_id_no)
);

create table bank_details(
person_id_no int,
bank_name varchar(20),
bank_address varchar(200),
bank_code int,
foreign key(person_id_no) references bank(person_id_no),
primary key(person_id_no, bank_name, bank_address, bank_code)
);

create table varification (
person_id_no int unique,
email_id_no varchar(50),
aadhar_id_no bigint primary key,
foreign key (email_id_no) references person(email_id),
foreign key (aadhar_id_no) references documents(aadhar_id)
);

create table government_dept (
uid varchar(50) primary key,
verification_status varchar(50),
person_id_no varchar(50),
foreign key(person_id_no) references varification(email_id_no)
);

insert into person
    (first_name, middle_name, last_name, gender, address, email_id, dob, person_id) values 
        ("rahul", "rakeshbhai", "menon", "male", "bhopal", "rahul243@gmail.com", '1987-05-23', 1001),
        ("gautamkumar", "shreyasbhai", "kapur", "male", "mumbai", "gautam1243@gmail.com", '1999-09-02', 1002),
        ("sachin", "ramesh", "tendulkar", "male", "kashi", "sachincr100@gmail.com", '1965-12-25', 1003),
        ("smirti", "alpesh", "mandhana", "female", "kasmir", "smirti567@gmail.com", '1992-12-12', 1004),
        ("isha", "mukeshbhai", "ambani", "female", "mumbai", "isha920@gmail.com", '1989-01-31', 1005);

insert into phone
    (phone_no, email_id) values
        (1234567890, "rahul243@gmail.com"),
        (8934564590, "rahul243@gmail.com"),
        (4324352542, "sachincr100@gmail.com"),
        (3785297324, "gautam1243@gmail.com"),
        (3778327324, "gautam1243@gmail.com"),
        (7236876126, "smirti567@gmail.com"),
        (2576567587, "isha920@gmail.com");
        
insert into voter_card
    (first_name, middle_name, last_name, voter_id_no, gender, address) values
        ("rahul", "rakeshbhai", "menon", 456234, "male", "bhopal"),
        ("gautamkumar", "shreyasbhai", "kapur", 234079, "male", "mumbai"), 
        ("sachin", "ramesh", "tendulkar", 895345, "male", "kashi"),
        ("smirti", "alpesh", "mandhana", 875438, "female", "kasmir"),
        ("isha", "mukeshbhai", "ambani", 757493, "female", "mumbai");
        
insert into driving_licence
    (first_name, middle_name, last_name, address, dob, licence_no, validity) value
        ("rahul", "rakeshbhai", "menon", "bhopal", '1987-05-23',  759374, '2042-08-02'),
        ("gautamkumar", "shreyasbhai", "kapur", "mumbai", '1999-09-02', 565457, '2037-06-20'),
        ("sachin", "ramesh", "tendulkar", "kashi", '1965-12-25', 956869, '1925-1-25'),
        ("smirti", "alpesh", "mandhana", "kasmir", '1992-12-12', 375783, '2035-07-09'),
        ("isha", "mukeshbhai", "ambani", "mumbai", '1989-01-31', 753977, '2030-09-11');
        
insert into vehicle
    (licence_no, vehicle_type) value
        (759374,  "lmv"),
        (759374, "mcwg"),
        (565457, "mcwg"),
        (956869, "lmv"),
        (375783, "lmv"),
        (375783, "mcg"),
        (753977, "lmv");
 
 insert into aadhar_card
    (first_name, middle_name, last_name, address, dob, aadhar_no) values
        ("rahul", "rakeshbhai", "menon", "bhopal", '1987-05-23', 123456788765 ),
        ("gautamkumar", "shreyasbhai", "kapur", "mumbai", '1999-09-02', 123412344321 ),
        ("sachin", "ramesh", "tendulkar", "kashi", '1965-12-25', 876956743546),
        ("smirti", "alpesh", "mandhana", "kasmir", '1992-12-12', 205937573482 ),
        ("isha", "mukeshbhai", "ambani", "mumbai", '1989-01-31', 567839290586);
    
insert into passport
    (first_name, middle_name, last_name, address, dob, passport_no, validity) value
        ("rahul", "rakeshbhai", "menon", "bhopal", '1987-05-23',  "L3434346", '2042-10-02'),
        ("gautamkumar", "shreyasbhai", "kapur", "mumbai", '1999-09-02', "K3726778", '2037-05-20'),
        ("sachin", "ramesh", "tendulkar", "kashi", '1965-12-25', "L9474757", '1925-02-25'),
        ("smirti", "alpesh", "mandhana", "kasmir", '1992-12-12', "H9830123", '2035-11-09'),
        ("isha", "mukeshbhai", "ambani", "mumbai", '1989-01-31', "L4658904", '2030-12-11');
        
insert into leaving_certy
    (first_name, middle_name, last_name, dob, unique_id_no, certy_no, gr_no, last_school, place_of_birth, religion, cast) values
        ("rahul", "rakeshbhai", "menon", "1987-05-23", 568760, 6004, 6005, "school of achiever", "mumbai", "hindu", "patel"),
        ("gautamkumar", "shreyasbhai", "kapur", '1999-09-02', 244134, 7867, 4545, "sant kabir", "delhi","hindu", "patel"),
        ("sachin", "ramesh", "tendulkar", '1965-12-25', 864456, 8989, 9876, "gayatri vidhyalay", "ahmedabad", "hindu", "kothari"),
        ("smirti", "alpesh", "mandhana", '1992-12-12', 209348, 0856, 9898, "sahjanand vidhyalay", "bhavanagar", "hindu", "rabari"),
        ("isha", "mukeshbhai", "ambani", '1989-01-31', 565056, 1207, 9999, "chankya vidhyalay", "Nnashik", "hindu", "darbar");
