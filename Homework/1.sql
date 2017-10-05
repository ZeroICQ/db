-----Для каждой группы список месяцев, в которых есть др студентов------
select 
    g.name, 
    (
        select list(distinct extract(month from s.BIRTHDAY))
        from STUDENTS s
        where s.GROUP_ID = g.ID
    )
from GROUPS g;

select
    g.name, 
    list(distinct extract(month from s.BIRTHDAY))
from GROUPS g
inner join STUDENTS s on g.id = s.GROUP_ID
group by g.name, g.id;

-------------------------------------------------------------------------

---------------Студенты отсортированные по убыванию среднего балла--------------
select s.name, avg(cast(m.mark as float)) as am 
from students s
inner join marks m on m.student_id = s.id
group  by s.name, s.id
order by am desc;
-----------------------------------------------------------------

--------------------Предметы по убыванюю успеваемости------------------
select sb.name, avg(cast(m.MARK as float)) as mm
from SUBJECTS sb
inner join MARKS m on m.SUBJECT_ID = sb.id
group by sb.name, sb.id
order by mm desc;
----------------------------------------------------------------

--------Доска-------------
select
(select st1.name
    from students st1
    where st1.ID = (
            select m1.STUDENT_ID
            from marks m1
            where m1.SUBJECT_ID=sub.id AND m1.mark = max(m.mark) rows 1
        )
    rows 1
),
sub.name, max(m.mark)
from subjects sub
inner join marks m on m.SUBJECT_ID = sub.id
group by sub.name, sub.id;

----------Класс---
select sb.name, count(distinct m.STUDENT_ID) as mm
from SUBJECTS sb
inner join MARKS m on m.SUBJECT_ID = sb.id
group by sb.name, sb.id
order by mm desc;

select 
    sb.name,
    count(distinct m.STUDENT_ID) as mm,
    --(select count(*) from STUDENTS s where s.GROUP_ID = sb.GROUP_ID) as cnty
from SUBJECTS sb
inner join MARKS m on m.SUBJECT_ID = sb.id
group by sb.name, sb.id
order by mm desc




select 
    sb.name,
    (select count(distinct m.STUDENT_ID) from marks m where m.SUBJECT_ID = sb.ID) as mm,
    (select count(*) from STUDENTS s where s.GROUP_ID = sb.GROUP_ID) as cnt
from SUBJECTS sb
order by mm desc

select 
    name, 
    att, 
    cnt,
    cast(att as float)/cast(cnt as float) as divide
    from (
    select 
        sb.name,
        (select count(distinct m.STUDENT_ID) from marks m where m.SUBJECT_ID = sb.ID) as att,
        (select count(*) from STUDENTS s where s.GROUP_ID = sb.GROUP_ID) as cnt
    from SUBJECTS sb
    order by att desc
)
order by divide desc


select * from( 
    select 
        (select s.GROUP_ID from STUDENTS s where s.ID = m.STUDENT_ID) g1,
        (select sj.group_id from subjects sj where sj.ID = m.SUBJECT_ID) g2 
    from marks m) 
where g1 <> g2



set term !! ;
create procedure test as 
begin
    insert into groups values (10, 'mem');
end!!


set term !! ;
recreate procedure test(n varchar(100)) as 
declare variable i integer;
begin
     i = 1;
    while (i < 10) do begin
        insert into groups values (:i, :n);
        i = i +1;
    end 
end!!


set term !! ;
recreate procedure test(n Integer)
returns(x integer)
as 
declare variable i integer;
begin
    i = n;
    while (i < 10) do begin
        x = i;
        suspend;
        i = i +1;
    end 
end!!

select * from test(5);
