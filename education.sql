/*
BMI Interpretation according to the CDC:

Below 18.5	Underweight

18.5 – 24.9	Healthy Weight

25.0 – 29.9	Overweight

30.0 and Above	Obesity
*/

/*Average BMI per education level*/
SELECT education, AVG(BMI) AS avg_bmi
FROM education_stats
GROUP BY education
ORDER BY avg_bmi;


/*Top 10 highest BMI with location and education level*/
SELECT LOCATION, education, bmi
FROM education_stats
WHERE bmi IS NOT NULL
ORDER BY bmi DESC
LIMIT 10;

/*Count of obesity cases by age*/
SELECT education, COUNT(*) AS obese_num
FROM education_stats
WHERE bmi > 29.9
GROUP BY education
ORDER BY obese_num DESC;


/*National education based BMI data*/
SELECT *
FROM education_stats
WHERE LOCATION = 'National'