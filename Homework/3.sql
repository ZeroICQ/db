--- сколько пропустил'
select
   count(*)
from STUDENTS s
inner join GROUPS g 
    on g.ID = s.GROUP_ID
inner join SUBJECTS sub 
    on sub.GROUP_ID = g.ID
left join MARKS m 
    on m.SUBJECT_ID = sub.ID and m.STUDENT_ID = s.ID
where
    m.id is NUll
    and 
    s.id =21

---готово--
select
    list(birtmonth),
    passed
from
    (select
        list(distinct extract(month from s.BIRTHDAY)) as birtmonth,
        count(*) as passed
    from STUDENTS s
    inner join GROUPS g 
        on g.ID = s.GROUP_ID
    inner join SUBJECTS sub 
        on sub.GROUP_ID = g.ID
    left join MARKS m 
        on m.SUBJECT_ID = sub.ID and m.STUDENT_ID = s.ID
    where
        m.id is NUll
    group by
        s.NAME, s.ID
    )
group by 
    passed
order by 
    passed DESC