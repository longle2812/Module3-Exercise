use CustomerManagement;

insert into Customer
values (1, 'Minh Quan', 10),
       (2, 'Ngoc Oanh', 20),
       (3, 'Hong Ha', 50);

insert into Orders
values (1, 1, '2006/3/21', Null),
       (2, 2, '2006/3/23', NULL),
       (3, 1, '2006/3/16', NULL);

insert into Product
values (1, 'May Giat', 3),
       (2, 'Tu Lanh', 5),
       (3, 'Dieu Hoa', 7),
       (4, 'Quat', 1),
       (5, 'Bep Dien', 2);

insert into OrderDetail
values (1, 1, 3),
       (1, 3, 7),
       (1, 4, 2),
       (2, 1, 1),
       (3, 1, 8),
       (2, 5, 4),
       (2, 3, 3);

select oID, oDate, oTotalPrice
from Orders;

select C.cName, P.pName, OrderDetail.odQTY
from OrderDetail
         join Orders O on OrderDetail.oID = O.oID
         join Customer C on O.cID = C.cID
         join Product P on OrderDetail.pID = P.pID;

SELECT C.cName
FROM Customer C
LEFT JOIN Orders O on C.cID = O.cID
WHERE O.oID IS NULL;

select O.oID, O.oDate, OrderDetail.odQTY * P.pPrice
from OrderDetail
join Orders O on OrderDetail.oID = O.oID
join Product P on OrderDetail.pID = P.pID
