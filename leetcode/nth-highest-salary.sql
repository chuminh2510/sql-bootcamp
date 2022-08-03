-- https://leetcode.com/problems/nth-highest-salary/
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    --  Write your MySQL query statement below.
        WITH SalaryRanking AS (
            SELECT
                salary,
                DENSE_RANK() OVER (ORDER BY salary DESC) as ranking
              FROM Employee
        )
      SELECT salary FROM SalaryRanking WHERE ranking = N LIMIT 1
  );
END