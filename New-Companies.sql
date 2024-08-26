/*
query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code
*/

select CM.company_code, CM.founder,
       count(distinct LM.lead_manager_code),
       count(distinct SM.senior_manager_code),
       count(distinct MN.manager_code),
       count(distinct EM.employee_code)
from COMAPNY  CM 
join Lead_Manager  LM 
on CM.company_code = LM.company_code
join Senior_Manager  SM
on LM.lead_manager_code = SM.lead_manager_code
join Manager  MN 
on MN.senior_manager_code = SM.senior_manager_code
join Employee  EM
on EM.manager_code = MN.manager_code
group by CM.company_code, CM.founder
order by CM.company_code;