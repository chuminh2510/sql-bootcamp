-- https://leetcode.com/problems/trips-and-users/

select
    t1.request_at as Day,
    IFNULL(s2.cancelRate, 0.00) as 'Cancellation Rate'
from Trips t1
inner join Users u1 on u1.users_id = t1.client_id
inner join Users u2 on u2.users_id = t1.driver_id
left join (
    select 
        t.request_at,
        round(SUM(case when t.status != 'completed' then 1 else 0 end)/count(*), 2) as cancelRate
    from Trips t
    inner join Users u1 on u1.users_id = t.client_id
    inner join Users u2 on u2.users_id = t.driver_id
    where
        t.request_at between '2013-10-01' and '2013-10-03'
        and u1.banned = 'No'
        and u2.banned = 'No'
    group by t.request_at
) as s2 on t1.request_at = s2.request_at
where
    t1.request_at between '2013-10-01' and '2013-10-03'
    and u1.banned = 'No'
        and u2.banned = 'No'
group by t1.request_at
