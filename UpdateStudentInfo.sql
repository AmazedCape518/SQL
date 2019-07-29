delimiter $$
create procedure getTotalStudent(INOUT total INT)
begin
select count(*) into total
from student;
end $$
delimiter ;
delimiter $$
create procedure getTotalFaculty(INOUT totalFaculty INT)
begin
select count(*) into totalFaculty
from faculty;
end $$
delimiter ;
delimiter $$
create procedure updateStudentTable()
begin
insert into student  values('579312412','Roselyn Smith','Psychology','FR',18);
update student set age=22 where sname = 'Edward Baker';
delete from student where sname = 'Ana Lopez';
end $$
delimiter ;
delimiter $$
create procedure getStudentInfo(IN studentName VARCHAR(255))
begin
select *
from student
where sname = studentName;
end $$
delimiter ;
set @clasees = "";
call getClassInfo21(@classes);
select @classes;