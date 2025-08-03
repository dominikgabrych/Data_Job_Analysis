-- Calculates the average salary for each skill associated with Data Analyst roles
-- Returns the highest-paying skills by computing AVG(salary_year_avg) for each skill

SELECT
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
    skills
ORDER BY 
    salary DESC

/*
ANALYSIS:
This query reveals which skills are associated with the highest average salaries for Data Analyst roles.
It helps identify the most financially rewarding skills to prioritize when pursuing a career in data analytics.
For example, if Python or Spark consistently appears at the top, candidates should consider strengthening those skills to maximize earning potential.

RESULT:
[
  {
    "skills": "svn",
    "salary": "400000.00"
  },
  {
    "skills": "solidity",
    "salary": "179000.00"
  },
  {
    "skills": "couchbase",
    "salary": "160515.00"
  },
  {
    "skills": "datarobot",
    "salary": "155485.50"
  },
  {
    "skills": "golang",
    "salary": "155000.00"
  },
  {
    "skills": "mxnet",
    "salary": "149000.00"
  },
  {
    "skills": "dplyr",
    "salary": "147633.33"
  },
  {
    "skills": "vmware",
    "salary": "147500.00"
  },
  {
    "skills": "terraform",
    "salary": "146733.83"
  },
  {
    "skills": "twilio",
    "salary": "138500.00"
  },
  {
    "skills": "gitlab",
    "salary": "134126.00"
  },
  {
    "skills": "kafka",
    "salary": "129999.16"
  },
  {
    "skills": "puppet",
    "salary": "129820.00"
  },
  {
    "skills": "keras",
    "salary": "127013.33"
  },
  {
    "skills": "pytorch",
    "salary": "125226.20"
  },
  {
    "skills": "perl",
    "salary": "124685.75"
  },
  {
    "skills": "ansible",
    "salary": "124370.00"
  },
  {
    "skills": "hugging face",
    "salary": "123950.00"
  },
  {
    "skills": "tensorflow",
    "salary": "120646.83"
  },
  {
    "skills": "cassandra",
    "salary": "118406.68"
  },
  {
    "skills": "notion",
    "salary": "118091.67"
  },
  {
    "skills": "atlassian",
    "salary": "117965.60"
  },
  {
    "skills": "bitbucket",
    "salary": "116711.75"
  },
  {
    "skills": "airflow",
    "salary": "116387.26"
  },
  {
    "skills": "scala",
    "salary": "115479.53"
  },
  {
    "skills": "linux",
    "salary": "114883.20"
  },
  {
    "skills": "confluence",
    "salary": "114153.12"
  },
  {
    "skills": "pyspark",
    "salary": "114057.87"
  },
  {
    "skills": "mongodb",
    "salary": "113607.71"
  },
  {
    "skills": "aurora",
    "salary": "113393.90"
  },
  {
    "skills": "cordova",
    "salary": "113269.50"
  },
  {
    "skills": "gcp",
    "salary": "113065.48"
  },
  {
    "skills": "spark",
    "salary": "113001.94"
  },
  {
    "skills": "splunk",
    "salary": "112927.60"
  },
  {
    "skills": "databricks",
    "salary": "112880.74"
  },
  {
    "skills": "unify",
    "salary": "112317.44"
  },
  {
    "skills": "git",
    "salary": "112249.64"
  },
  {
    "skills": "dynamodb",
    "salary": "111840.00"
  },
  {
    "skills": "snowflake",
    "salary": "111577.72"
  },
  {
    "skills": "shell",
    "salary": "111496.45"
  },
  {
    "skills": "electron",
    "salary": "111175.00"
  },
  {
    "skills": "unix",
    "salary": "111123.32"
  },
  {
    "skills": "hadoop",
    "salary": "110888.27"
  },
  {
    "skills": "pandas",
    "salary": "110767.07"
  },
  {
    "skills": "node.js",
    "salary": "110230.38"
  },
  {
    "skills": "phoenix",
    "salary": "109259.09"
  },
  {
    "skills": "php",
    "salary": "109051.51"
  },
  {
    "skills": "neo4j",
    "salary": "108646.42"
  },
  {
    "skills": "nosql",
    "salary": "108331.04"
  },
  {
    "skills": "express",
    "salary": "108221.35"
  },
  {
    "skills": "watson",
    "salary": "108103.00"
  },
  {
    "skills": "redshift",
    "salary": "107968.80"
  },
  {
    "skills": "jira",
    "salary": "107931.30"
  },
  {
    "skills": "rust",
    "salary": "107925.00"
  },
  {
    "skills": "elasticsearch",
    "salary": "107815.75"
  },
  {
    "skills": "no-sql",
    "salary": "107405.33"
  },
  {
    "skills": "numpy",
    "salary": "107397.56"
  },
  {
    "skills": "db2",
    "salary": "107130.29"
  },
  {
    "skills": "swift",
    "salary": "107100.00"
  },
  {
    "skills": "redis",
    "salary": "107043.75"
  },
  {
    "skills": "postgresql",
    "salary": "106852.94"
  },
  {
    "skills": "plotly",
    "salary": "106602.86"
  },
  {
    "skills": "aws",
    "salary": "106439.84"
  },
  {
    "skills": "c++",
    "salary": "105695.51"
  },
  {
    "skills": "alteryx",
    "salary": "105579.57"
  },
  {
    "skills": "azure",
    "salary": "105399.62"
  },
  {
    "skills": "gdpr",
    "salary": "105328.92"
  },
  {
    "skills": "bigquery",
    "salary": "105237.60"
  },
  {
    "skills": "bash",
    "salary": "105074.72"
  },
  {
    "skills": "powershell",
    "salary": "105040.78"
  },
  {
    "skills": "mongo",
    "salary": "104274.25"
  },
  {
    "skills": "scikit-learn",
    "salary": "103932.15"
  },
  {
    "skills": "looker",
    "salary": "103855.35"
  },
  {
    "skills": "jupyter",
    "salary": "103522.46"
  },
  {
    "skills": "ibm cloud",
    "salary": "103312.50"
  },
  {
    "skills": "kubernetes",
    "salary": "103088.79"
  },
  {
    "skills": "angular",
    "salary": "102103.25"
  },
  {
    "skills": "flask",
    "salary": "101862.69"
  },
  {
    "skills": "asp.net",
    "salary": "101666.67"
  },
  {
    "skills": "sqlite",
    "salary": "101625.00"
  },
  {
    "skills": "python",
    "salary": "101511.85"
  },
  {
    "skills": "github",
    "salary": "101498.36"
  },
  {
    "skills": "jenkins",
    "salary": "101418.62"
  },
  {
    "skills": "mysql",
    "salary": "101381.40"
  },
  {
    "skills": "visio",
    "salary": "101035.82"
  },
  {
    "skills": "oracle",
    "salary": "100964.19"
  },
  {
    "skills": "qlik",
    "salary": "100932.78"
  },
  {
    "skills": "java",
    "salary": "100213.87"
  },
  {
    "skills": "chainer",
    "salary": "100000.00"
  },
  {
    "skills": "theano",
    "salary": "100000.00"
  },
  {
    "skills": "matlab",
    "salary": "99908.55"
  },
  {
    "skills": "unity",
    "salary": "99616.70"
  },
  {
    "skills": "dax",
    "salary": "99548.74"
  },
  {
    "skills": "ggplot2",
    "salary": "99415.75"
  },
  {
    "skills": "matplotlib",
    "salary": "99307.10"
  },
  {
    "skills": "docker",
    "salary": "99261.57"
  },
  {
    "skills": "yarn",
    "salary": "99150.00"
  },
  {
    "skills": "seaborn",
    "salary": "98747.83"
  },
  {
    "skills": "c",
    "salary": "98714.56"
  },
  {
    "skills": "r",
    "salary": "98707.80"
  },
  {
    "skills": "django",
    "salary": "98543.69"
  },
  {
    "skills": "flow",
    "salary": "98019.82"
  },
  {
    "skills": "tableau",
    "salary": "97978.08"
  },
  {
    "skills": "node",
    "salary": "97900.00"
  },
  {
    "skills": "spring",
    "salary": "97453.61"
  },
  {
    "skills": "go",
    "salary": "97266.97"
  },
  {
    "skills": "c#",
    "salary": "97247.74"
  },
  {
    "skills": "ssis",
    "salary": "97234.75"
  },
  {
    "skills": "sql",
    "salary": "96435.33"
  },
  {
    "skills": "sql server",
    "salary": "96191.42"
  },
  {
    "skills": "mariadb",
    "salary": "96000.00"
  },
  {
    "skills": "jquery",
    "salary": "95772.00"
  },
  {
    "skills": "t-sql",
    "salary": "95722.65"
  },
  {
    "skills": "microstrategy",
    "salary": "94485.56"
  },
  {
    "skills": "vba",
    "salary": "93844.97"
  },
  {
    "skills": "sas",
    "salary": "93707.36"
  },
  {
    "skills": "webex",
    "salary": "92500.00"
  },
  {
    "skills": "sap",
    "salary": "92446.21"
  },
  {
    "skills": "power bi",
    "salary": "92323.60"
  },
  {
    "skills": "pascal",
    "salary": "92000.00"
  },
  {
    "skills": "javascript",
    "salary": "91805.12"
  },
  {
    "skills": "ssrs",
    "salary": "91536.86"
  },
  {
    "skills": "cognos",
    "salary": "90407.22"
  },
  {
    "skills": "airtable",
    "salary": "90006.25"
  },
  {
    "skills": "clickup",
    "salary": "90000.00"
  },
  {
    "skills": "zoom",
    "salary": "89791.42"
  },
  {
    "skills": "typescript",
    "salary": "89323.10"
  },
  {
    "skills": "unreal",
    "salary": "89112.50"
  },
  {
    "skills": "sharepoint",
    "salary": "89027.16"
  },
  {
    "skills": "react",
    "salary": "88567.19"
  },
  {
    "skills": "drupal",
    "salary": "88328.20"
  },
  {
    "skills": "powerpoint",
    "salary": "88315.61"
  },
  {
    "skills": "firebase",
    "salary": "87500.00"
  },
  {
    "skills": "crystal",
    "salary": "87327.33"
  },
  {
    "skills": "visual basic",
    "salary": "86972.33"
  },
  {
    "skills": "arch",
    "salary": "86835.00"
  },
  {
    "skills": "windows",
    "salary": "86512.83"
  },
  {
    "skills": "excel",
    "salary": "86418.90"
  },
  {
    "skills": "symphony",
    "salary": "86266.67"
  },
  {
    "skills": "microsoft teams",
    "salary": "85570.03"
  },
  {
    "skills": "assembly",
    "salary": "85389.70"
  },
  {
    "skills": "asana",
    "salary": "85338.70"
  },
  {
    "skills": "css",
    "salary": "85317.07"
  },
  {
    "skills": "spss",
    "salary": "85292.80"
  },
  {
    "skills": "ms access",
    "salary": "84872.71"
  },
  {
    "skills": "cobol",
    "salary": "84744.75"
  },
  {
    "skills": "html",
    "salary": "84382.71"
  },
  {
    "skills": "sheets",
    "salary": "84129.61"
  },
  {
    "skills": "terminal",
    "salary": "83567.30"
  },
  {
    "skills": "slack",
    "salary": "83441.95"
  },
  {
    "skills": "word",
    "salary": "82940.76"
  },
  {
    "skills": "chef",
    "salary": "82825.00"
  },
  {
    "skills": "selenium",
    "salary": "82500.00"
  },
  {
    "skills": "fortran",
    "salary": "82500.00"
  },
  {
    "skills": "ruby",
    "salary": "80960.17"
  },
  {
    "skills": "outlook",
    "salary": "80680.33"
  },
  {
    "skills": "monday.com",
    "salary": "79000.00"
  },
  {
    "skills": "spreadsheet",
    "salary": "78465.89"
  },
  {
    "skills": "planner",
    "salary": "77039.12"
  },
  {
    "skills": "workfront",
    "salary": "76820.04"
  },
  {
    "skills": "wrike",
    "salary": "75000.00"
  },
  {
    "skills": "julia",
    "salary": "73680.00"
  },
  {
    "skills": "npm",
    "salary": "73418.75"
  },
  {
    "skills": "dart",
    "salary": "72673.83"
  },
  {
    "skills": "erlang",
    "salary": "72500.00"
  },
  {
    "skills": "smartsheet",
    "salary": "71221.46"
  },
  {
    "skills": "tidyverse",
    "salary": "70599.93"
  },
  {
    "skills": "vb.net",
    "salary": "69600.00"
  },
  {
    "skills": "wire",
    "salary": "68375.00"
  },
  {
    "skills": "opencv",
    "salary": "67818.00"
  },
  {
    "skills": "sass",
    "salary": "67698.50"
  },
  {
    "skills": "colocation",
    "salary": "67500.00"
  },
  {
    "skills": "trello",
    "salary": "65193.46"
  },
  {
    "skills": "vue",
    "salary": "65000.00"
  },
  {
    "skills": "macos",
    "salary": "57933.18"
  },
  {
    "skills": "graphql",
    "salary": "57009.33"
  },
  {
    "skills": "ruby on rails",
    "salary": "51059.00"
  }
]
*/
