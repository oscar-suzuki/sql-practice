-- LinkedIn / Data Science Skills

SELECT DISTINCT c1.candidate_id
FROM candidates AS c1
INNER JOIN candidates AS c2
ON c1.candidate_id = c2.candidate_id
INNER JOIN candidates AS c3
ON c1.candidate_id = c3.candidate_id
WHERE c1.skill = 'Python'
AND c2.skill = 'Tableau'
AND c3.skill = 'PostgreSQL';
