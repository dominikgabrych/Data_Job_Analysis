# 📊 Data Analyst Job Market SQL Project

## Introduction

Dive into the data job market! Focusing on data analyst roles, this project explores:

* 💰 Top-paying jobs
* 🔥 In-demand skills
* 📈 Skills where high demand meets high salary

🔍 **Check out the SQL queries** in the `/project_sql` folder.

---

## Background

This project was born from a desire to better understand the data analyst job market by identifying top-paid and most sought-after skills. The analysis is based on data provided in an SQL course, covering job titles, salaries, work settings, and required skills.

### Questions I wanted to answer:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

---

## 🛠 Tools Used

* **SQL**: Querying and transforming data
* **PostgreSQL**: Database engine
* **Visual Studio Code**: SQL development
* **Git & GitHub**: Version control and sharing

---

## The Analysis

### 1. 💸 Top-Paying Data Analyst Jobs

This query identifies the highest-paying remote roles for data analysts.

```sql
SELECT
  job_id,
  job_title,
  job_location,
  job_schedule_type,
  salary_year_avg,
  job_posted_date,
  name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
  job_title_short = 'Data Analyst' AND
  job_location = 'Anywhere' AND
  salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
```

### Insights:

* Salaries range from \$184,000 to \$650,000
* Companies: Meta, SmartAsset, AT\&T, etc.
* Roles vary from **Analyst** to **Director of Analytics**

---

### 2. 🧠 Skills for Top-Paying Jobs

```sql
WITH top_paying_jobs AS (
  SELECT
    job_id,
    job_title,
    salary_year_avg,
    name AS company_name
  FROM job_postings_fact
  LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
  WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
  ORDER BY salary_year_avg DESC
  LIMIT 10
)

SELECT
  top_paying_jobs.*,
  skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;
```

### Top Skills in High-Paying Roles:

* **SQL** (8/10)
* **Python** (7/10)
* **Tableau** (6/10)

---

### 3. 🔥 In-Demand Skills for Data Analysts

```sql
SELECT
  skills,
  COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
  job_title_short = 'Data Analyst' AND
  job_work_from_home = True
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;
```

### Most Demanded Skills:

| Skill    | Demand Count |
| -------- | ------------ |
| SQL      | 7291         |
| Excel    | 4611         |
| Python   | 4330         |
| Tableau  | 3745         |
| Power BI | 2609         |

---

### 4. 💵 Skills Based on Salary

```sql
SELECT
  skills,
  ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
  job_title_short = 'Data Analyst' AND
  salary_year_avg IS NOT NULL AND
  job_work_from_home = True
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25;
```

### Top Paying Skills:

| Skill     | Avg Salary |
| --------- | ---------- |
| PySpark   | \$208,172  |
| Couchbase | \$160,515  |
| DataRobot | \$155,486  |
| GitLab    | \$154,500  |
| Jupyter   | \$152,777  |

---

### 5. 🧹 Most Optimal Skills to Learn

Combining demand and salary, this query pinpoints the most **strategically valuable** skills.

```sql
WITH skills_demand AS (
  SELECT
    skills_dim.skill_id,
    skills_dim.skills AS skill_name,
    COUNT(*) AS skill_count
  FROM job_postings_fact
  INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
  WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
  GROUP BY skills_dim.skill_id
), average_salary AS (
  SELECT
    skills_job_dim.skill_id,
    skills,
    ROUND(AVG(salary_year_avg), 2) AS salary
  FROM job_postings_fact
  INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
  WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
  GROUP BY skills_job_dim.skill_id, skills_dim.skills
)

SELECT
  skills_demand.skill_id,
  skills_demand.skill_name,
  skill_count,
  salary
FROM skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE skill_count > 10
ORDER BY salary DESC, skill_count DESC
LIMIT 25;
```

---

## 🧠 What I Learned

* Mastered advanced **JOINs** and `WITH` queries (CTEs)
* Improved data aggregation with `GROUP BY`, `COUNT()`, `AVG()`
* Turned business questions into meaningful insights using SQL

---

## 📌 Conclusions

* **SQL** is the most demanded and high-paying skill – essential for any analyst.
* **Python**, **Tableau**, and **Excel** are also dominant across queries.
* Top-paying jobs require niche technical skills like **PySpark**, **GitLab**, **Jupyter**, **Snowflake**, etc.
* Skills that balance **high demand** and **high salary** (like Python, Snowflake, Azure) are the **optimal** to learn.

---

## ✅ Final Thoughts

This project helped me grow my SQL skills significantly and provided strategic insight into which technical skills truly matter in the data analyst job market.

Aspiring analysts can use this research to **prioritize learning** and **optimize job searching** for better outcomes.

---
