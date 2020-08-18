select to_char(l.scheduled_time,'YYYY-MM-DD')as day, u.id as tutor_id, avg(q.tech_quality)::NUMERIC(10,2) as avg_score
from lessons l
INNER JOIN participants p
on l.event_id = p.event_id
AND l.subject = 'phys'
INNER JOIN users u 
on p.user_id = u.id
and u.role = 'tutor'
INNER JOIN quality q 
on q.lesson_id = l.id
WHERE q.tech_quality IS NOT NULL
GROUP BY  u.id, to_char(l.scheduled_time, 'YYYY-MM-DD'), q.tech_quality
ORDER by q.tech_quality ASC;