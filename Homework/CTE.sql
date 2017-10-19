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


----2---
with recursive cte(id, name, ch_id, list) as (
    select 
        s.id,
        s.name,
        (select subg.CHILD_ID from SUBGROUPS subg where subg.ID = s.SUBGROUP_ID),
        (select list(subj.NAME) from SUBJ_SUB subj where subj.SUBGROUP_ID = s.SUBGROUP_ID)
    from STUDENTS s
    
    union all
        select
            t.id,
            t.name,
            (select subg.CHILD_ID from SUBGROUPS subg where subg.ID = t.ch_id),
            (select list(subj.NAME) from SUBJ_SUB subj where subj.SUBGROUP_ID = t.ch_id)
        from 
            cte t
        inner join SUBGROUPS sgt on
            t.ch_id = sgt.id
)

select 
    cc.id, 
    cc.name,
    list(cc.list),
    (select s.SUBGROUP_ID from STUDENTS s where s.ID = cc.id)
from cte cc
group by
cc.id, cc.name

---1
with recursive cte(id, r_id, number) as (
    select 
        g.id,
        g.id,
        (select count(*) from STUDENTS s where s.GROUP_ID = g.id)
    from GROUPS g
        
    union all
        select
            t.id,
            sgt.CHILD_ID,
            (select count(*) from STUDENTS ss where ss.GROUP_ID = sgt.CHILD_ID)
        from 
            cte t
        join SUBGROUPS sgt on
            t.r_id = sgt.PARENT_ID
)

select 
    cc.id,
    sum(cc.number)
from cte cc
group by cc.id


--2
with recursive cte(id, name, g_id) as (
    select 
        s.id,
        s.NAME,
        s.GROUP_ID
    from STUDENTS s
        
    union all
        select
            t.id,
            t.NAME,
            sgt.CHILD_ID
        from 
            cte t
        join SUBGROUPS sgt on
            t.g_id = sgt.PARENT_ID
)

select 
    c.name,
    list(distinct sub.id)
from cte c
inner join subjects sub on sub.GROUP_ID = c.g_id
group by c.name
order by c.name