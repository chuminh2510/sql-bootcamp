-- https://leetcode.com/problems/reformat-department-table/
select
    id,
    MAX(Case when month='Jan' then revenue end) 'Jan_Revenue',
    MAX(Case when month='Feb' then revenue end) 'Feb_Revenue',
    MAX(Case when month='Mar' then revenue end) 'Mar_Revenue',
    MAX(Case when month='Apr' then revenue end) 'Apr_Revenue',
    MAX(Case when month='May' then revenue end) 'May_Revenue',
    MAX(Case when month='Jun' then revenue end) 'Jun_Revenue',
    MAX(Case when month='Jul' then revenue end) 'Jul_Revenue',
    MAX(Case when month='Aug' then revenue end) 'Aug_Revenue',
    MAX(Case when month='Sep' then revenue end) 'Sep_Revenue',
    MAX(Case when month='Oct' then revenue end) 'Oct_Revenue',
    MAX(Case when month='Nov' then revenue end) 'Nov_Revenue',
    MAX(Case when month='Dec' then revenue end) 'Dec_Revenue'
from Department
group by id