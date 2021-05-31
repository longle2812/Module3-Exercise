use QuanLySinhVien;

select S.StudentName
from Student S
where S.StudentName like 'h%';

select C.ClassName,C.StartDate
from Class C
where MONTH(StartDate) = 12;

select Sub.SubName, Sub.Credit
from Subject Sub
where Sub.Credit >=3 and sub.Credit <=5;

update Student
set ClassId = '2'
where StudentName ='Hung';

select S.StudentName, S2.SubName, M.Mark
from mark M
join Student S on M.StudentId = S.StudentId
join Subject S2 on M.SubId = S2.SubId
order by S.StudentName ASC, M.Mark DESC;