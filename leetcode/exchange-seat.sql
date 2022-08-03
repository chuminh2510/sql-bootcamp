-- https://leetcode.com/problems/exchange-seats/
-- # Write your MySQL query statement below
SELECT
    (CASE
        WHEN MOD(id,2) != 0 AND counts != id THEN id + 1
        WHEN MOD(id,2) != 0 AND counts = id THEN id
        ELSE id - 1
     END
    ) as id,
    student
FROM Seat,
(SELECT count(*) AS counts FROM Seat) AS seat_counts
ORDER BY id ASC