/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically 
and displayed underneath its corresponding Occupation. 
The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
*/

select min(case when occupation = 'Doctor' then name else null end) Doctor,
min(case when occupation = 'Professor' then name else null end) Professor,
min(case when occupation = 'Singer' then name else null end) Singer,
min(case when occupation = 'Actor' then name else null end) Actor
 from(
select name,occupation, ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name asc) rn from OCCUPATIONS)
group by rn order by 1,2,3,4
;