-- Selecting top 10 highest-paying Data Analyst jobs located in Poland.
-- Filtering only postings with specified (non-null) annual salaries.
-- Joining with company_dim to retrieve the company name for each posting.
-- Results ordered from highest to lowest salary.

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Poland' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT
    10;

/*
ANALYSIS:

-Allegro dominates the ranking of the best-paid Data Analyst jobs in Poland, appearing in 7 out of 10 top results.
-The highest annual salary found is PLN 111,175.
-All offers are for full-time positions and are from 2023, indicating the data is current.
-Other companies in the ranking include Capco and Westinghouse Electric Company, from the consulting and industrial sectors, respectively.
-The list also includes junior to mid-level roles, showing that even at these levels, well-paid positions are available.

RESULTS:
[
  {
    "job_id": 369283,
    "job_title": "Data Analyst (Delivery Experience Technology & Product)",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-07-07 09:28:39",
    "company_name": "Allegro"
  },
  {
    "job_id": 367763,
    "job_title": "Data Analyst",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-09-05 04:19:21",
    "company_name": "Allegro"
  },
  {
    "job_id": 876513,
    "job_title": "Data Analyst - Financial Services",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-01-28 12:19:26",
    "company_name": "Allegro"
  },
  {
    "job_id": 1240464,
    "job_title": "Data Analyst",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "102500.0",
    "job_posted_date": "2023-01-31 12:15:58",
    "company_name": "Capco"
  },
  {
    "job_id": 1281562,
    "job_title": "Data Analyst (CX Tech)",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "102500.0",
    "job_posted_date": "2023-03-25 11:43:15",
    "company_name": "Allegro"
  },
  {
    "job_id": 470832,
    "job_title": "SAP Finance Data Analyst",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "77017.5",
    "job_posted_date": "2023-12-16 21:11:19",
    "company_name": "Westinghouse Electric Company"
  },
  {
    "job_id": 189127,
    "job_title": "Junior Data Analyst (Campaign Team)",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22 03:10:55",
    "company_name": "Allegro"
  },
  {
    "job_id": 705215,
    "job_title": "Data Analyst (Pricing)",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "57500.0",
    "job_posted_date": "2023-06-27 20:47:14",
    "company_name": "Allegro"
  },
  {
    "job_id": 282943,
    "job_title": "Junior Data Analyst - e-Xperience 2023",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "53014.0",
    "job_posted_date": "2023-04-18 10:46:01",
    "company_name": "Allegro"
  },
  {
    "job_id": 67765,
    "job_title": "Junior/Mid/Senior Data Analyst (Pricing)",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "53014.0",
    "job_posted_date": "2023-02-27 21:09:30",
    "company_name": "Allegro"
  }
]
*/