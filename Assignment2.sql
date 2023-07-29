create database assignment2;

use assignment2;

create table Department (
Departmet_ID int(200) auto_increment primary key,
Department_Name varchar(100)
);

create table Position (
Position_ID int(200) auto_increment primary key ,
Position_Name enum('Dev','Test','Scrum Master','PM')
);

create table `Account` (
Account_ID int auto_increment primary key,
Email text,
Username varchar(100) unique key,
Full_Name varchar(100),
Departmet_ID int(200),
Position_ID int(200),
Create_Date date,
foreign key (Departmet_ID) references Department (Departmet_ID),
foreign key (Position_ID) references Position (Position_ID)
);

create table `Group` (
Group_ID int(200) auto_increment primary key,
Group_Name varchar(100),
Creator_ID int(100) unique key,
Create_Date date
);

create table `GroupAccount` (
Group_ID int,
Account_ID int,
Join_Date date,
foreign key (Group_ID) references `Group` (Group_ID),
foreign key (Account_ID) references `Account` (Account_ID)
);

create table TypeQuestion (
Type_ID int primary key,
Type_Name varchar(100) unique key
);

create table CategoryQuestion (
Category_ID int primary key,
Category_Name varchar(100) unique key
);

create table Question (
Question_ID int auto_increment primary key,
Content text,
Category_ID int,
Type_ID int,
Creator_ID int,
Create_Date date,
foreign key (Category_ID) references CategoryQuestion (Category_ID),
foreign key (Type_ID) references TypeQuestion (Type_ID),
foreign key (Creator_ID) references `Group` (Creator_ID)
);

create table Answer (
Answer_ID int auto_increment primary key,
Content text,
Question_ID int,
is_Correct enum('Dung','Sai') unique key,
foreign key (Question_ID) references Question (Question_ID)
);

create table Answer (
Answer_ID int auto_increment primary key,
Content text,
Question_ID int,
is_Correct enum('Dung','Sai'),
foreign key (Question_ID) references Question (Question_ID)
);

create table Exam (
Exam_ID int auto_increment primary key,
`Code` varchar(20) unique key,
Title text,
Category_ID int,
Duration int,
Creator_ID int, 
Create_Date date,
foreign key (Category_ID) references CategoryQuestion (Category_ID),
foreign key (Creator_ID) references `Group` (Creator_ID)
);

create table ExamQuestion (
Exam_ID int,
Question_ID int,
foreign key (Exam_ID) references Exam (Exam_ID), 
foreign key (Question_ID) references Question (Question_ID)
);
