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