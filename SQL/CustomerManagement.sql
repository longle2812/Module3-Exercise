create database CustomerManagement;
use CustomerManagement;

create table Customer(
cID int primary key unique,
cName varchar(50),
cAge int(50)
);

create table Orders(
oID int primary key unique,
cID int,
oDate datetime,
oTotalPrice double,
foreign key (cID) references Customer (cID)
);

create table Product(
pID int primary key unique,
pName varchar(50),
pPrice double
);

create table OrderDetail(
oID int,
pID int,
odQTY int,
foreign key (oID) references Orders(oID),
foreign key (pID) references Product(pID),
primary key(oID, pID)
);