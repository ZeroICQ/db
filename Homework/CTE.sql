---1---
with recursive cte(id, name, ch_id, number) as (
    select 
        subg.id,
        subg.name,
        subg.CHILD_ID,
        (select count(*) from STUDENTS s where s.SUBGROUP_ID = subg.ID)
    from SUBGROUPS subg
    
    union all
        select
            t.id,
            t.name,
            sgt.CHILD_ID,
            (select count(*) from STUDENTS ss where ss.SUBGROUP_ID = sgt.ID)
        from 
            cte t
        inner join SUBGROUPS sgt on
            t.ch_id = sgt.id
)

select 
    cc.id, 
    cc.name,
    sum(cc.number)
from cte cc
group by cc.id, cc.name
