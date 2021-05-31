create database Store;

use Store;

create table Material
(
    id    int primary key,
    Code  varchar(50),
    name  varchar(255),
    unit  varchar(50),
    price double
);

create table Storage
(
    id         int primary key,
    materialID int,
    quantity   int,
    import     int,
    export     int,
    foreign key (materialID) references Material (id)
);

create table Supplier
(
    id      int primary key,
    code    varchar(50),
    name    varchar(255),
    address varchar(50),
    phone   varchar(50)
);

create table Orders
(
    id         int primary key,
    supplierID int,
    code       varchar(50),
    date       datetime,
    foreign key (supplierID) references Supplier (id)
);

create table GoodRecieveNote
(
    id      int primary key,
    code    varchar(50),
    date    datetime,
    orderID int,
    foreign key (orderID) references Orders (id)
);

create table GoodDeliveryNote
(
    id           int primary key,
    code         varchar(50),
    date         datetime,
    customerName varchar(255)
);

create table OrderDetail
(
    id         int primary key,
    orderID    int,
    foreign key (orderID) references Orders (id),
    materialID int,
    foreign key (materialID) references Material (id),
    quantity   int
);

create table RecieveNoteDetail
(
    id            int primary key,
    recieveNoteID int,
    foreign key (recieveNoteID) references GoodRecieveNote (id),
    materialID    int,
    foreign key (materialID) references Material (id),
    quantity      int,
    price         double,
    note          varchar(255)
);

create table DeliveryNoteDetail
(
    id             int primary key,
    deliveryNoteID int,
    foreign key (deliveryNoteID) references GoodDeliveryNote (id),
    materialID     int,
    foreign key (materialID) references Material (id),
    quantity       int,
    price          double,
    note           varchar(255)
);

insert into Material
values (1, 1, 'Gach', 'vien', 20000),
       (2, 2, 'Cat', 'tan', 10000),
       (3, 3, 'Xi mang', 'tan', 500000),
       (4, 4, 'Thep', 'tan', 100000),
       (5, 5, 'Phu gia', 'tan', 30000);

insert into Storage
values (1, 1, 100, 200, 50),
       (2, 2, 50, 100, 30),
       (3, 3, 300, 40, 10),
       (4, 4, 500, 300, 100),
       (5, 5, 200, 30, 20),
       (6, 1, 250, 100, 50),
       (7, 2, 120, 60, 20),
       (8, 3, 330, 100, 80),
       (9, 4, 700, 100, 60),
       (10, 5, 210, 300, 150);

insert into Supplier
values (1, 1, 'Vin', 'HN', '0934568542'),
       (2, 2, 'FLC', 'HCM', '0988389874'),
       (3, 3, 'Masan', 'DN', '0986325495');

insert into Orders
values (1, 1, 1, '2021-5-24 12:21:30'),
       (2, 3, 2, '2021-5-25 8:27:45'),
       (3, 2, 3, '2021-4-19 6:57:26');

insert into GoodDeliveryNote
values (1, 1, '2021-5-23', 'Long'),
       (2, 2, '2021-2-5', 'Duyet'),
       (3, 3, '2021-2-14', 'Tri');

insert into GoodRecieveNote
values (1, 1, '2021-1-14', 1),
       (2, 2, '2021-1-19', 2),
       (3, 3, '2021-1-20', 3);

insert into OrderDetail
values (1, 1, 3, 100),
       (2, 2, 1, 50),
       (3, 2, 2, 100),
       (4, 3, 4, 140),
       (5, 1, 5, 60),
       (6, 3, 3, 180);

insert into DeliveryNoteDetail
values (1, 1, 1, 200, 30000, ''),
       (2, 1, 2, 300, 20000, ''),
       (3, 2, 2, 200, 22000, ''),
       (4, 2, 3, 100, 450000, ''),
       (5, 3, 4, 100, 100000, ''),
       (6, 3, 5, 230, 32000, '');

insert into RecieveNoteDetail
values (1, 1, 1, 150, 27000, ''),
       (2, 1, 2, 300, 18000, ''),
       (3, 2, 2, 100, 21000, ''),
       (4, 2, 3, 100, 440000, ''),
       (5, 3, 4, 100, 90000, ''),
       (6, 3, 5, 230, 30000, '');

create view vw_CTPNhap as
select id, materialID, quantity, price, price * quantity as value
from RecieveNoteDetail;

create view vw_CTPNhap_VT as
select vw_CTPNhap.id,
       vw_CTPNhap.materialID,
       M.name,
       vw_CTPNhap.quantity,
       vw_CTPNhap.price,
       vw_CTPNhap.price * vw_CTPNhap.quantity as total
from vw_CTPNhap
         join Material M on vw_CTPNhap.materialID = M.id;

create view vw_CTPNhap_VT_PN as
select R.id,
       G.date,
       G.orderID,
       R.materialID,
       M.name,
       R.quantity,
       R.price,
       R.quantity * R.price as total
from RecieveNoteDetail as R
         join GoodRecieveNote as G on G.id = R.id
         join Material M on R.materialID = M.id;

create view vw_CTPNhap_Loc as
select R.recieveNoteID, R.materialID, R.quantity, R.price, R.quantity * R.price as total
from RecieveNoteDetail as R
where R.quantity > 5;

create view vw_CTPNhap_VT_Loc as
select R.recieveNoteID, R.materialID, M.name, R.quantity, R.price, R.quantity * R.price as total
from RecieveNoteDetail as R
         join Material M on R.materialID = M.id
where M.unit like 'vien';

create view vw_CTPXuat as
select D.id, D.materialID, D.quantity, D.price, D.quantity * D.price as total
from DeliveryNoteDetail as D;

create view vw_CTPXuat_VT as
select V.id, V.materialID, M.name, V.price, V.quantity
from vw_CTPXuat as V
         join Material M on V.materialID = M.id;

create view vw_CTXuat_VT_PX as
select D.id, G.customerName, D.materialID, M.name, D.price, D.quantity
from DeliveryNoteDetail as D
         join GoodDeliveryNote as G on G.id = D.deliveryNoteID
         join Material M on D.materialID = M.id;

delimiter //
create procedure MaterialQuantity(
    IN materialID int)
begin
    declare storeQuantity int;
    declare totalImport int;
    declare totalExport int;
    declare result int;

    set storeQuantity = (select S.quantity as quantity
                         from Material as M
                                  join Storage S on M.id = S.materialID
                         where S.id = materialID);
    set totalImport = (select sum(R.quantity)
                       from recievenotedetail as R
                       where materialID = R.materialID);

    set totalExport = (select sum(D.quantity)
                       from deliverynotedetail as D
                       where materialID = D.materialID);
    set result = storeQuantity + totalImport - totalExport;
    select result;
end;
//
delimiter ;


call MaterialQuantity(1);

delimiter //
create procedure totalExport(in materialID int)
begin
    declare totalExport int;
    set totalExport = (select sum(V.price*V.quantity)
                       from vw_CTPXuat_VT as V
                       where V.materialID = materialID);
    select totalExport;
end;
//
delimiter ;

call totalExport(2);

delimiter //
create procedure totalOrderQuantity(in orderID int)
begin
    select T.materialID, T.quantity
    from (select O.materialID, O.quantity
        from OrderDetail as O where O.orderID = orderID) as T;
end;
//
delimiter ;

call totalOrderQuantity(3);

delimiter //
create procedure addNewOrder(
in id int,
in supplierID int,
in code int,
in date datetime)
begin
    insert into Orders value (id, supplierID, code, date);
end;
//
delimiter ;

call addNewOrder(5,3,5,'2021-03-25 08:27:45');


delimiter //
create procedure addNewOrderDetail(
in id int,
in orderID int,
in materialID int,
in quantity int)
begin
    insert into orderdetail value (id, orderID, materialID, quantity);
end;
//
delimiter ;
call addNewOrderDetail(7, 2, 4,150);