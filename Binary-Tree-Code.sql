/*
query to find the node type of Binary Tree ordered by the value of the node
*/

select n ||' '|| 
case when n = (select n from bst where p is null) then 'Root'
when n in ( select n from bst where   n in (select p from bst where p is not null)) then 'Inner'
when n in (select n from bst where n <> p) then 'Leaf'
end tree 
from bst order by n;