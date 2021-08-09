create database labproject
use labproject
go
create table Log_in
(
  user_code nvarchar(20),
  pass nvarchar(15)
)
create table Location
(
  location_name nvarchar(200),
  area_name varchar(200),
  city varchar(50),
  primary key (location_name, area_name, city)
)
create table hospital
(
  hospital_id nvarchar(50) primary key,
  hospital_name varchar(200) not null,
  contact_number nvarchar(20) not null,
  location_name nvarchar(200),
  area_name varchar(200),
  city varchar(50),
  constraint fk_hospital foreign key (location_name, area_name, city) references [dbo].[Location]
)

create table Donor 
( 
   donor_id nvarchar(100) primary key,
      name varchar(150) not null,
   age int not null,
   gender varchar(10) default null,
   blood_type varchar(10) not null,
   contact_number nvarchar(20) not null,
   email_id nvarchar(200) default null,
   location_name nvarchar(200),
   area_name varchar(200),
   city varchar(50),  
   hospital_id nvarchar(50), 
   constraint fk_donor foreign key (location_name, area_name, city) references [dbo].[Location],
   constraint fk3_donor foreign key (hospital_id) references [dbo].[hospital],
  
)
create table Patient
(  patient_id nvarchar(100) primary key,
   name varchar(150) not null,
   age int not null,
   gender varchar(10) default null,
   blood_type varchar(10) not null,
   contact_number nvarchar(20) not null,
   email_id nvarchar(200) default null,
   location_name nvarchar(200),
   area_name varchar(200),
   city varchar(50),  
   hospital_id nvarchar(50), 
   constraint fk_patient foreign key (location_name, area_name, city) references [dbo].[Location],
   constraint fk3_patient foreign key (hospital_id) references [dbo].[hospital], 
)
create table Blood
(
   blood_type varchar(10) not null,
   donor_id nvarchar(100) foreign key (donor_id) references [dbo].[Donor],
   patient_id nvarchar(100) foreign key (patient_id) references [dbo].[Patient]
)
create table Plasma
(
   blood_type varchar(10),
   donor_id nvarchar(100) foreign key (donor_id) references [dbo].[Donor],
   patient_id nvarchar(100) foreign key (patient_id) references [dbo].[Patient],
   covid_recovered varchar(05),
   date_recovered Date
)


insert into Location values ('Banasree','Rampura','Dhaka'),('Taltotala','Khilgaon','Dhaka'),('Gulshan 1','Gulshan','Dhaka'),('Banani 11','Banani','Dhaka')

insert into Hospital values ('DCAP1012','Apollo Hospital & Diagonostic Centre','+0229566540','Gulshan 1','Gulshan','Dhaka'),('DCSQ1023','Square Hospital','+0229534540','Banasree','Rampura','Dhaka')

insert into donor values ('dK1209','Samantha Islam',24, 'female','A+','0125478921','smstha@gmail.com','Taltotala','Khilgaon','Dhaka','DCAP1012'),
('ctg1365','Karimul Ahsan',30, 'male','AB+','0125847631','ahsanK@gmail.com','Taltotala','Khilgaon','Dhaka','DCAP1012')

insert into patient values ('15879PR','Eshmam Noel',58,'Male','O+','01874569855','ethan.nl@yahoo.com ','Banasree','Rampura','Dhaka','DCSQ1023'),
('15061mR','Samara Begum',24,'Female','O+','01912458601','Ssamara@yahoo.com ','Gulshan 1','Gulshan','Dhaka','DCSQ1023')

insert into blood values ('O+','dK1209','15879PR')


insert into plasma values ('AB+','ctg1365','15879PR','no',null)

select * from [dbo].[Blood]
select * from [dbo].[Blood_Group]
select * from [dbo].[Location]
select * from [dbo].[Donor]
select * from [dbo].[hospital]

select * from [dbo].[Log_in]
select * from [dbo].[Patient]
select * from [dbo].[Plasma]