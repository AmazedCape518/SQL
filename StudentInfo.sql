
delimiter $$

create procedure getStudentInfo()
begin
	select *
	from student
	where sname = studentname;
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

delimiter $$
create procedure getClassInfo21(INOUT classList varchar(4000))
begin
declare isDone integer default 0;
declare currentClass varchar(255) default "";
declare currentMeet varchar(255) default "";
declare currentRoom varchar(255) default "";
declare currentFid bigint default 0;
declare classCursor cursor for
select cname, meets_at, room, fid from class;
declare continue handler
for not found set isDone = 1;
open classCursor;
getList: loop
fetch classCursor into currentClass, currentMeet, currentRoom, currentFid;
if isDone = 1 then
leave getList;
end if;
set classList = concat("","\n", classList);
set classList = concat(currentFid, "\t", classList);
set classList = concat(currentRoom,"\t", classList);
set classList = concat(currentMeet,"\t", classList);
set classList = concat(currentClass,"\t", classList);
end loop getList;
close classCursor;
end $$
delimiter ;