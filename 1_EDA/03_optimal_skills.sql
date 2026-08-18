/*
Question: What are the most optimal skills for data engineers—balancing both demand and salary?
- Create a ranking column that combines demand count and median salary to identify the most valuable skills.
- Focus only on remote Data Engineer positions with specified annual salaries.
- Why?
    - This approach highlights skills that balance market demand and financial reward. It weights core skills appropriately instead of letting rare, outlier skills distort the results.
    - The natural log transformation ensures that both high-salary and widely in-demand skills surface as the most practical and valuable to learn for data engineering careers.
*/

SELECT sd.skills, 
ROUND(MEDIAN(jpf.salary_year_avg), 2) as median_salary,
count(jpf.salary_year_avg) demand_count,
ROUND(MEDIAN(jpf.salary_year_avg) * ln(count(jpf.salary_year_avg))/1_000_000, 2) as optimal_score,
FROM job_postings_fact jpf
JOIN skills_job_dim sjd
    ON sjd.job_id = jpf.job_id
JOIN skills_dim sd
    ON sd.skill_id = sjd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
AND jpf.job_work_from_home = true
AND jpf.salary_year_avg IS NOT NULL
GROUP BY sd.skills
HAVING demand_count > 100
ORDER BY optimal_score DESC
LIMIT 25;

/*

  skills   │ median_salary │ demand_count │ optimal_score │
│  varchar   │    double     │    int64     │    double     │
├────────────┼───────────────┼──────────────┼───────────────┤
│ terraform  │      184000.0 │          193 │          0.97 │
│ python     │      135000.0 │         1133 │          0.95 │
│ aws        │     137320.31 │          783 │          0.91 │
│ sql        │      130000.0 │         1128 │          0.91 │
│ airflow    │      150000.0 │          386 │          0.89 │
│ spark      │      140000.0 │          503 │          0.87 │
│ snowflake  │      135500.0 │          438 │          0.82 │
│ kafka      │      145000.0 │          292 │          0.82 │
│ azure      │      128000.0 │          475 │          0.79 │
│ java       │      135000.0 │          303 │          0.77 │
│ scala      │     137290.48 │          247 │          0.76 │
│ git        │      140000.0 │          208 │          0.75 │
│ kubernetes │      150500.0 │          147 │          0.75 │
│ databricks │      132750.0 │          266 │          0.74 │
│ redshift   │      130000.0 │          274 │          0.73 │
│ gcp        │      136000.0 │          196 │          0.72 │
│ hadoop     │      135000.0 │          198 │          0.71 │
│ nosql      │      134415.0 │          193 │          0.71 │
│ pyspark    │      140000.0 │          152 │           0.7 │
│ docker     │      135000.0 │          144 │          0.67 │
│ mongodb    │      135750.0 │          136 │          0.67 │
│ go         │      140000.0 │          113 │          0.66 │
│ r          │      134775.0 │          133 │          0.66 │
│ bigquery   │      135000.0 │          123 │          0.65 │
│ github     │      135000.0 │          127 │          0.65 │
└────────────┴───────────────┴──────────────┴───────────────┘
  25 rows                                         4 columns

*/