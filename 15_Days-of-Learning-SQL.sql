/*
query to print total number of unique hackers who made at least  submission each day 
(starting on the first day of the contest), and find the hacker_id and name of the hacker who made maximum number 
of submissions each day. If more than one such hacker has a maximum number of submissions, print the lowest hacker_id. 
The query should print this information for each day of the contest, sorted by the date.
*/

with a as (
SELECT SUBMISSION_DATE submission_Date ,dense_rank() over(order by SUBMISSION_DATE ) date_rank,
HACKER_ID hacker_id,dense_rank() OVER (PARTITION BY HACKER_ID ORDER BY SUBMISSION_DATE ) hacker_rank
from SUBMISSIONS
),
b as (
    select distinct S3.SUBMISSION_DATE SUBMISSION_DATE ,FIRST_VALUE(HACKER_ID) OVER (PARTITION BY S3.SUBMISSION_DATE order by S3.S_ID DESC) HACKER_ID from(
select SUBMISSION_DATE,HACKER_ID, COUNT(SUBMISSION_ID) OVER (PARTITION by SUBMISSION_DATE,HACKER_ID ORDER BY SUBMISSION_DATE) S_ID
from SUBMISSIONS ) S3
)
select a.SUBMISSION_DATE ,count(distinct a.HACKER_ID) ,b.HACKER_ID, c.name
from a,b,HACKERS c
where a.hacker_rank = a.date_rank and a.submission_Date = b.submission_Date and c.hacker_id = b.hacker_id
GROUP by a.SUBMISSION_DATE,b.HACKER_ID,c.name
order by 1,3
;