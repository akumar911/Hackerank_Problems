#Top Competitor 
select h.hacker_id, h.name from hackers as h 
join submissions as s
on h.hacker_id = s.hacker_id
join challenges as c on s.challenge_id = c.challenge_id
join difficulty as d on c.difficulty_level = d.difficulty_level
where s.score = d.score 
group by h.name , h.hacker_id
having count(*) > 1
order by count(*) desc, h.hacker_id asc
