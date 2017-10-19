select s.name, sub.name, min(m.MARK), max(m.mark) from STUDENTS s
inner join marks m on s.ID = m.STUDENT_ID
inner join SUBJECTS sub on sub.ID = m.SUBJECT_ID
group by s.name, sub.name