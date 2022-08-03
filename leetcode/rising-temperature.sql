-- https://leetcode.com/problems/rising-temperature/
-- # Write your MySQL query statement below
With SortedDateWeather AS (
    select * from Weather order by recordDate ASC
)
select w2.id from SortedDateWeather w1
inner join SortedDateWeather w2
where
    w1.recordDate = DATE_SUB(w2.recordDate, INTERVAL 1 DAY)
    and w1.temperature < w2.temperature