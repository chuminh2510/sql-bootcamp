-- https://leetcode.com/problems/human-traffic-of-stadium/
# Write your MySQL query statement below
With tbl_group as (
    select
        s1.id,
        s1.visit_date,
        s1.people,
        (s1.id - ROW_NUMBER() OVER (ORDER BY s1.id)) as diff
    from Stadium s1
    where
        s1.people >= 100
)
select g1.id, g1.visit_date, g1.people from tbl_group g1
where g1.diff IN (select g2.diff from tbl_group g2 group by g2.diff having count(*) >= 3)