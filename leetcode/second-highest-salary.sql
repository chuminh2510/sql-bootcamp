-- https://leetcode.com/problems/second-highest-salary/submissions/
-- # Write your MySQL query statement below
WITH SalaryRanking AS (
    SELECT
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) as Ranking
    FROM Employee
)
SELECT IFNULL((SELECT salary FROM SalaryRanking WHERE Ranking = 2 LIMIT 1), NULL) AS SecondHighestSalary