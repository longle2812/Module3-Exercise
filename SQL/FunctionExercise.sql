use QuanLySinhVien;

select *
from Subject
group by SubId
having max(Credit) >= all (select max(Credit) from subject group by SubId);

select Subject.SubId, SubName, Credit, Status, max(Mark)
from Subject
left join Mark M on Subject.SubId = M.SubId
group by Subject.SubId
having Max(Mark) >= all (select Max(Mark) from Mark group by MarkId);

select S.StudentName, S.StudentId, S.Address, AVG(Mark)
from Student S
join Mark M on S.StudentId = M.StudentId
join Subject S2 on M.SubId = S2.SubId
group by S.StudentId
order by AVG(Mark) desc;
