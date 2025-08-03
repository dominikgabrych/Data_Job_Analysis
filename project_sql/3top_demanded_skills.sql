-- Identify the top 5 most in-demand skills for Data Analyst roles.
-- Uses job_count CTE to calculate total number of relevant job postings.
-- Joins job_postings_fact with skills tables to count frequency of each skill.
-- Calculates what percentage of all Data Analyst job postings require each skill.
-- Orders skills by frequency and limits to top 5 most demanded.

WITH job_count AS (
SELECT
    COUNT(*) AS job_count
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst')

SELECT
    skills AS skill_name,
    COUNT(*) AS skill_count,
    ROUND(100.0 * COUNT(*) / MAX(job_count), 1) AS Percentage
FROM 
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
CROSS JOIN
    job_count
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skill_name
ORDER BY
    skill_count DESC
LIMIT
    5;

/* 
ANALYSIS: Top 5 In-Demand Skills for Data Analysts

This query identifies the five most frequently requested skills in Data Analyst job postings.
It uses a CTE to count the total number of relevant jobs and calculates the percentage of those
that require each skill.

Why it matters:
- Helps job seekers prioritize learning the most valued skills.
- Shows the relative importance of each skill across the market.
- Useful for career planning and training programs.

How it works:
- Filters jobs to include only those with the title 'Data Analyst'.
- Joins job postings with skills data to count how often each skill appears.
- Calculates the share (%) of postings requiring each skill.

RESULT:
[
  {
    "skill_name": "sql",
    "skill_count": "92628",
    "percentage": "47.1"
  },
  {
    "skill_name": "excel",
    "skill_count": "67031",
    "percentage": "34.1"
  },
  {
    "skill_name": "python",
    "skill_count": "57326",
    "percentage": "29.2"
  },
  {
    "skill_name": "tableau",
    "skill_count": "46554",
    "percentage": "23.7"
  },
  {
    "skill_name": "power bi",
    "skill_count": "39468",
    "percentage": "20.1"
  }
]
*/

