Select distinct a.x as w,a.y from functions a ,functions b Where a.x =b.y and b.x = a.y and a.x < b.x 
Union all 
Select a1.x as w,a1.y from functions a1 where a1.x = a1.y group by a1.x,a1.y having count(*)>1 Order by w