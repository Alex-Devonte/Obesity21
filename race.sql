/*
BMI Interpretation according to the CDC:

Below 18.5	Underweight

18.5 – 24.9	Healthy Weight

25.0 – 29.9	Overweight

30.0 and Above	Obesity
*/

/*Average BMI for each race*/
SELECT race, AVG(bmi) AS avg_bmi
FROM race_stats
GROUP BY race
ORDER BY avg_bmi;

/*Top 15 highest BMI with location and race*/
SELECT LOCATION, race, bmi
FROM race_stats
WHERE bmi IS NOT NULL
ORDER BY bmi DESC
LIMIT 15;

/*Count of obesity cases by race*/
SELECT race, COUNT(*) AS obese_num
FROM race_stats
WHERE bmi > 29.9
GROUP BY race
ORDER BY obese_num DESC;

/*Top 5 locations with the most obesity cases*/
SELECT LOCATION, COUNT(*)
FROM race_stats
WHERE bmi > 29.9
GROUP BY LOCATION
LIMIT 5;


/*National BMI data*/
SELECT *
FROM race_stats
WHERE LOCATION = 'National'
