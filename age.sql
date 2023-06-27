/*
BMI Interpretation according to the CDC:

Below 18.5	Underweight

18.5 – 24.9	Healthy Weight

25.0 – 29.9	Overweight

30.0 and Above	Obesity
*/

/*Average BMI for each age range*/
SELECT age_range, AVG(bmi) AS avg_bmi
FROM age_stats
GROUP BY age_range
ORDER BY avg_bmi;


/*Percentage of each bmi classification*/
SELECT
	CASE
		WHEN bmi < 18.5 THEN 'Underweight'
		WHEN bmi >= 18.5 AND bmi <= 24.9 THEN 'Healthy Weight'
		WHEN bmi > 24.9 AND bmi <= 29.9 THEN 'Overweight'
		ELSE 'Obese'
	END AS bmi_classification,
	COUNT(*) AS COUNT,
	COUNT(*) * 100.0 /  (SELECT COUNT(*) FROM age_stats) AS percentage
FROM age_stats
GROUP BY bmi_classification;


/*Average BMI for each location*/
SELECT LOCATION, AVG(bmi) AS avg_bmi
FROM age_stats
GROUP BY LOCATION
ORDER BY avg_bmi;


/*Top 10 highest AVG BMI with location*/
SELECT location, avg(bmi) AS avg_bmi
FROM age_stats
WHERE bmi IS NOT NULL
GROUP BY location
ORDER BY avg_bmi DESC
LIMIT 10;

/*Top 10 lowest AVG BMI with location*/
SELECT location, avg(bmi) AS avg_bmi
FROM age_stats
WHERE bmi IS NOT NULL
GROUP BY location
ORDER BY avg_bmi 
LIMIT 10;


/*Count of obesity cases by age*/
SELECT age_range, COUNT(*) AS obese_num
FROM age_stats
WHERE bmi > 29.9
GROUP BY age_range
ORDER BY obese_num DESC;

/*National BMI data*/
SELECT *
FROM age_stats
WHERE LOCATION = 'National'