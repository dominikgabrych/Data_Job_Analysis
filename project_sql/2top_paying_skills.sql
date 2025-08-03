-- This query retrieves the top 10 highest-paying remote Data Analyst jobs.
-- Filters jobs with known annual salaries (non-null) and 'Anywhere' location.
-- Joins with company_dim to get company names.
-- Further joins with skills_dim to list required skills for each job.
-- Uses STRING_AGG to group all skills for a job into one comma-separated string.

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM 
        job_postings_fact
    LEFT JOIN 
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT
        10
)

SELECT 
    top_paying_jobs.job_id,
    job_title,
    salary_year_avg,
    company_name,
    STRING_AGG(skills, ', ') AS skill_needed
FROM 
    top_paying_jobs
INNER JOIN 
    skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY 
    top_paying_jobs.job_id,
    job_title,
    salary_year_avg,
    company_name
LIMIT 10;

/*
ANALYSIS:

- The highest-paying remote Data Analyst job offers a salary of over 255,000.
- All 10 entries in the result belong to a **single job posting**, meaning the job likely has multiple listed skills (1 row per skill).
- This was resolved by using STRING_AGG, which consolidates the skills per job into one row.
- The top job titles are high-level (e.g., "Associate Director - Data Insights"), indicating seniority correlates with salary.
- Common top-paying skills include Python, SQL, AWS, PySpark, and Databricks, reflecting demand for cloud and big data expertise.

RESULTS:
[
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skill_needed": "tableau, hadoop, r, python, sql"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skill_needed": "tableau, gitlab, go, snowflake, pandas, numpy, excel, sql, python"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skill_needed": "r, git, bitbucket, atlassian, jira, sql, python, confluence"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skill_needed": "r, python, sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_needed": "jupyter, python, r, azure, databricks, aws, pandas, pyspark, sql, excel, tableau, power bi, powerpoint"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skill_needed": "power bi, sap, tableau, jenkins, bitbucket, atlassian, jira, confluence, snowflake, oracle, aws, azure, python, sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "skill_needed": "sql, flow, tableau, oracle, crystal"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skill_needed": "snowflake, pandas, numpy, excel, tableau, gitlab, sql, python, go"
  }
]
*/




