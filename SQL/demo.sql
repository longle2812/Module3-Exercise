create database demo;
use demo;

create table Products
(
    id                 int primary key,
    productCode        int,
    productName        varchar(50),
    productPrice       double,
    productAmount      double,
    productDescription varchar(255),
    productStatus      bit default 0
);


alter table Products
    add unique index idx_product_code (productCode);
alter table Products
    add unique index idx_composite (productName, productPrice);

explain
select *
from Products;

create view information_view as
select productCode, productName, productPrice, productStatus
from Products;

CREATE OR REPLACE VIEW information_view as
select id, productCode, productName, productPrice, productStatus
from Products;

drop view information_view;

delimiter //
create procedure getInformation()
begin
    select *
    from Products;
end //
delimiter ;

delimiter //
create procedure addNew(
    in id int,
    productCode int,
    productName varchar(50),
    productPrice double,
    productAmount double,
    productDescription varchar(255),
    productStatus bit
)
begin
    insert into Products
    values (id, productCode, productName, productPrice, productAmount, productDescription, productStatus);
end //
delimiter ;

delimiter //
create procedure editID(
    in id int
)
begin
    update Products
    set productStatus = 0
    where Products.id = id;
end //
delimiter ;

delimiter //
create procedure deleteProduct(
in id int
)
begin
    delete
    from Products
    where Products.id = id;
    end //
delimiter ;

call addNew(1,1,1,1,1,1,1)
call editID(1);
call deleteProduct(1);

