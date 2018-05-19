select temp1.hacker_id, temp1.name, sum(temp1.score) from
(select h.hacker_id, h.name, s.challenge_id, max(s.score) as score from hackers as h join submissions as s
on h.hacker_id = s.hacker_id
group by h.hacker_id, h.name, s.challenge_id) temp1
group by temp1.hacker_id, temp1.name
having sum(temp1.score) > 0
order by sum(temp1.score) desc, temp1.hacker_id