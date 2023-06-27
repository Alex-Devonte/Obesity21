/*
BMI Interpretation according to the CDC:

Below 18.5	Underweight

18.5 – 24.9	Healthy Weight

25.0 – 29.9	Overweight

30.0 and Above	Obesity
*/

/*Average BMI for each gender*/
SELECT gender, AVG(BMI) AS avg_bmi
FROM gender_stats
GROUP BY gender;

/*Top 10 highest BMI with location and gender*/
SELECT LOCATION, gender, bmi
FROM gender_stats
WHERE bmi IS NOT NULL
ORDER BY bmi DESC
LIMIT 10;

/*Top 10 highest BMI with location for MALES*/
SELECT gender, LOCATION, bmi
FROM gender_stats
WHERE gender = 'Male' AND bmi IS NOT NULL
ORDER BY bmi DESC
LIMIT 10;

/*Top 10 highest BMI with location for FEMALES*/
SELECT gender, LOCATION, bmi
FROM gender_stats
WHERE gender = 'Female' AND bmi IS NOT NULL
ORDER BY bmi DESC
LIMIT 10;

/*Count of obesity cases by age*/
SELECT gender, COUNT(*) AS obese_num
FROM gender_stats
WHERE bmi > 29.9
GROUP BY gender
ORDER BY obese_num DESC;


/*National BMI data*/
SELECT *
FROM gender_stats
WHERE LOCATION = 'National'
