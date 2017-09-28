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
select s.name, avg(cast(m.mark as float)) as am from students s
inner join marks m on m.student_id = s.id
group  by s.name, s.id order by am;
-----------------------------------------------------------------

--------------------Предметы по убыванюю успеваемости------------------
select sb.name, avg(cast(m.MARK as float)) as mm
from SUBJECTS sb
inner join MARKS m on m.SUBJECT_ID = sb.id
group by sb.name, sb.id
order by mm;
----------------------------------------------------------------