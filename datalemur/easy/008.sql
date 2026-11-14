--　LinkedIn / Duplicate Job Listings

SELECT COUNT(distinct a.company_id) as duplicate_companies
FROM job_listings a
INNER JOIN job_listings b
ON a.company_id = b.company_id
AND a.title = b.title
AND a.description = b.description
AND a.job_id != b.job_id;


-- Alternative Solution
WITH job_count_cts AS (
    SELECT company_id,title, description,COUNT(job_id) as job_count
    FROM job_listings
    GROUP BY company_id, title, description
)
SELECT COUNT(distinct company_id) as duplicate_companies
FROM job_count_cts
WHERE job_count > 1;
