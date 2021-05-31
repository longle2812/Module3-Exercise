use QuanLySinhVien;

select S.Address, count(*) as Number
from Student S
group by S.Address;

select S.StudentName, S.StudentId, AVG(Mark) as avgMark
from Student S
join Mark M on M.StudentId = S.StudentId
group by M.StudentId
having avgMark > 9;

SELECT S.StudentId, S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);
