create database Test2;
use Test2;

create table Students
(
    StudentID   int(4) primary key,
    StudentName nvarchar(50),
    Age         int(4),
    Email       varchar(100)
);

create table Classes
(
    ClassID   int(4) primary key,
    ClassName nvarchar(50)
);

create table Subjects
(
    SubjectID   int(4) primary key,
    SubjectName nvarchar(50)
);

create table ClassStudent
(
    StudentID int,
    ClassID   int,
    foreign key (ClassID) references Classes (ClassID),
    foreign key (StudentID) references Students (StudentID),
    primary key (StudentID, ClassID)
);


create table Mark
(
    SubjectID int,
    StudentID int,
    Mark      int,
    primary key (SubjectID, StudentID)
);

alter table Mark
add foreign key (SubjectID) references Subjects(subjectid),
    add foreign key (StudentID) references Students(StudentID);

create table Subjects
(
    SubjectID   int(4),
    SubjectName nvarchar(50),
    Age         int(4),
    Email       varchar(100)
);

insert into Students
values (1, 'Nguyen Quang An', 18, 'an@yahoo.com'),
       (2, 'Nguyen Cong Vinh', 20, 'vinh@gmail.com'),
       (3, 'Nguyen Van Quyen', 19, 'quyen'),
       (4, 'Pham Thanh Binh', 25, 'binh@com'),
       (5, 'Nguyen Van Tai Em', 30, 'taiem@sport.vn');

insert into Classes
values (1, 'C0706L'),
       (2, 'C0708G');

insert into ClassStudent
values (1, 1),
       (2, 1),
       (3, 2),
       (4, 2),
       (5, 2);

insert into Subjects
values (1, 'SQL'),
       (2, 'Java'),
       (3, 'C'),
       (4, 'Visual Basic');

insert into Mark
values (1, 1, 8),
       (2, 1, 4),
       (1, 2, 9),
       (1, 3, 7),
       (1, 4, 3),
       (2, 5, 5),
       (3, 3, 8),
       (3, 5, 1),
       (2, 4, 3);

select *
from Students
order by StudentName;

select *
from Subjects;

select *
from Students
where Email like '%@%.%';

select *
from Students
where StudentName like 'Nguyen%';

select *
from Students
         join ClassStudent CS on Students.StudentID = CS.StudentID
         join Classes C on CS.ClassID = C.ClassID
where C.ClassID = 1;

select StudentName, SubjectName, Mark
from Students
         join Mark M on Students.StudentID = M.StudentID
         join Subjects S on M.SubjectID = S.SubjectID;

select *
from Students
where StudentID not in (select StudentID from Mark);

select *
from Subjects
where SubjectID not in (select SubjectID from Mark);

select S.StudentID, S.StudentName, AVG(Mark)
from Mark
         join ClassStudent CS on Mark.StudentID = CS.StudentID
         join Students S on CS.StudentID = S.StudentID
group by StudentID;

select SubjectID, count(*) as number
from Mark
group by SubjectID
having count(SubjectID) = (select count(*) from Mark group by SubjectID limit 1);

select *
from Subjects
where SubjectID = (select SubjectID
                     from Mark
                     where mark = (select max(mark) as maximum
                                   from Mark));


select subID, count(*) as countNumber
from (select Mark as numb, SubjectID as subID
from Mark
group by Mark, SubjectID
having mark < 5) as c2
group by subID
order by countNumber desc limit 1;

select Mark, count(*) as c
from Mark
group by Mark
having mark < 5;

alter table ClassStudent
drop foreign key classstudent_ibfk_1,
drop foreign key classstudent_ibfk_2;

alter table Mark
drop foreign key mark_ibfk_1,
    drop foreign key mark_ibfk_2;

delete from Students
where StudentID = 1;

alter table Students
add StudentStatus bit default 1;

update Students
set StudentStatus = 0;









