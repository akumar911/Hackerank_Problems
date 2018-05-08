/* 
 This would be my favourite question thus far :p
*/



select C1.contest_id, C1.hacker_id, C1.name , sum(S1.total_submissions) , sum(S1.total_accepted_submissions), 
sum(V1.total_views), sum(V1.total_unique_views) from contests as C1 join Colleges as C2 on C1.contest_id = C2.contest_id 
join Challenges as C3 on C2.college_id = C3.college_id 
left join (select challenge_id , sum(total_views) as total_views, sum(total_unique_views) as total_unique_views from View_stats group by challenge_id )as V1 on V1.challenge_id = C3.challenge_id 
left join (select challenge_id , sum(total_submissions) as total_submissions , sum(total_accepted_submissions) as total_accepted_submissions from Submission_Stats group by challenge_id ) as S1 on C3.challenge_id = S1.challenge_id
group by C1.contest_id, C1.hacker_id, C1.name
having sum(S1.total_submissions) > 0 and 
        sum(S1.total_accepted_submissions) >0 and 
        sum(V1.total_views) >0 and 
        sum(V1.total_unique_views) >0 
order by C1.contest_id