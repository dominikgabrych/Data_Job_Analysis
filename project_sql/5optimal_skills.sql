-- Top Data Analyst Skills by Salary and Demand
-- Objective:
-- Combine demand and salary data to identify the most valuable technical skills 
-- for Data Analyst positions that include salary information.
-- 
-- Step 1 (skills_demand): Counts how often each skill appears in job postings 
--         for Data Analysts with known salaries.
-- Step 2 (average_salary): Calculates the average salary for each skill.
-- Step 3: Joins both datasets on skill_id and filters for skills that appear in 
--         more than 10 job listings to ensure statistical relevance.
-- 
-- Final Output:
-- - skill_id: unique identifier of the skill
-- - skill_name: name of the skill (e.g., Python, SQL)
-- - skill_count: number of job postings mentioning this skill
-- - salary: average salary for postings requiring that skill
-- 
-- Sorted by salary (highest first) to highlight the most financially valuable skills.
-- Ties broken by demand (skill_count).

WITH skills_demand AS (
SELECT
    skills_dim.skill_id,
    skills_dim.skills AS skill_name,
    COUNT(*) AS skill_count
FROM 
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
), average_salary AS (
SELECT
    skills_job_dim.skill_id,
    skills,
    ROUND(AVG(salary_year_avg),2) AS salary
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND 
    salary_year_avg IS NOT NULL
GROUP BY
    skills_job_dim.skill_id,
    skills_dim.skills
)

SELECT
    skills_demand.skill_id,
    skills_demand.skill_name,
    skill_count,
    salary
FROM
    skills_demand
INNER JOIN 
    average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    skill_count > 10
ORDER BY
    salary DESC,
    skill_count DESC
LIMIT
    25;

/*
ANALYSIS:
This query identifies the most valuable technical skills for Data Analyst roles by combining both demand and salary data.

- It filters for postings that include a salary to ensure reliability.
- It calculates how frequently each skill appears across those postings.
- It also computes the average salary for each skill.

By joining both insights, we can identify skills that are not only in high demand but also command higher average salaries.

Filtered to show only skills that appear in more than 10 job postings to reduce noise from outliers.

Sorted by descending average salary and demand to highlight the most lucrative and sought-after skills.

This gives actionable insight into which tools and technologies are worth investing time in.

RESULT:
[
  {
    "skill_id": 98,
    "skill_name": "kafka",
    "skill_count": "40",
    "salary": "129999.16"
  },
  {
    "skill_id": 101,
    "skill_name": "pytorch",
    "skill_count": "20",
    "salary": "125226.20"
  },
  {
    "skill_id": 31,
    "skill_name": "perl",
    "skill_count": "20",
    "salary": "124685.75"
  },
  {
    "skill_id": 99,
    "skill_name": "tensorflow",
    "skill_count": "24",
    "salary": "120646.83"
  },
  {
    "skill_id": 63,
    "skill_name": "cassandra",
    "skill_count": "11",
    "salary": "118406.68"
  },
  {
    "skill_id": 219,
    "skill_name": "atlassian",
    "skill_count": "15",
    "salary": "117965.60"
  },
  {
    "skill_id": 96,
    "skill_name": "airflow",
    "skill_count": "71",
    "salary": "116387.26"
  },
  {
    "skill_id": 3,
    "skill_name": "scala",
    "skill_count": "59",
    "salary": "115479.53"
  },
  {
    "skill_id": 169,
    "skill_name": "linux",
    "skill_count": "58",
    "salary": "114883.20"
  },
  {
    "skill_id": 234,
    "skill_name": "confluence",
    "skill_count": "62",
    "salary": "114153.12"
  },
  {
    "skill_id": 95,
    "skill_name": "pyspark",
    "skill_count": "49",
    "salary": "114057.87"
  },
  {
    "skill_id": 18,
    "skill_name": "mongodb",
    "skill_count": "26",
    "salary": "113607.71"
  },
  {
    "skill_id": 62,
    "skill_name": "mongodb",
    "skill_count": "26",
    "salary": "113607.71"
  },
  {
    "skill_id": 81,
    "skill_name": "gcp",
    "skill_count": "78",
    "salary": "113065.48"
  },
  {
    "skill_id": 92,
    "skill_name": "spark",
    "skill_count": "187",
    "salary": "113001.94"
  },
  {
    "skill_id": 193,
    "skill_name": "splunk",
    "skill_count": "15",
    "salary": "112927.60"
  },
  {
    "skill_id": 75,
    "skill_name": "databricks",
    "skill_count": "102",
    "salary": "112880.74"
  },
  {
    "skill_id": 210,
    "skill_name": "git",
    "skill_count": "74",
    "salary": "112249.64"
  },
  {
    "skill_id": 80,
    "skill_name": "snowflake",
    "skill_count": "241",
    "salary": "111577.72"
  },
  {
    "skill_id": 6,
    "skill_name": "shell",
    "skill_count": "44",
    "salary": "111496.45"
  },
  {
    "skill_id": 168,
    "skill_name": "unix",
    "skill_count": "37",
    "salary": "111123.32"
  },
  {
    "skill_id": 97,
    "skill_name": "hadoop",
    "skill_count": "140",
    "salary": "110888.27"
  },
  {
    "skill_id": 93,
    "skill_name": "pandas",
    "skill_count": "90",
    "salary": "110767.07"
  },
  {
    "skill_id": 137,
    "skill_name": "phoenix",
    "skill_count": "23",
    "salary": "109259.09"
  },
  {
    "skill_id": 25,
    "skill_name": "php",
    "skill_count": "29",
    "salary": "109051.51"
  }
]
*/
