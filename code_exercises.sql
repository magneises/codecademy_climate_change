

-- EXERCISE 1
-- Explore the data
/*
SELECT *
FROM state_climate
LIMIT 5;
*/

-- EXERCISE 2
-- Let’s start by looking at how the average temperature changes over time in each state.
/*
SELECT state, year, 
  AVG(tempf) OVER (PARTITION BY state ORDER BY year) AS 'running_avg_change'
FROM state_climate;
*/ 

-- EXERCISE 3
-- Now let’s explore the lowest temperatures for each state.
/*
SELECT state, year, tempf,
  FIRST_VALUE(tempf) OVER(PARTITION BY state ORDER BY tempf) AS 'lowest_temp'
FROM state_climate;

-- MAYBE ANOTHER OPTION???? 
SELECT state, year, tempf,
  FIRST_VALUE(tempf) OVER(PARTITION BY state ORDER BY tempf) AS 'lowest_temp'
FROM state_climate
ORDER BY year DESC;

*/

-- EXERCISE 4
-- Like before, write a query that returns state, year, tempf or tempc, except now we will also return the highest temperature (highest_temp) for each state.

-- Are the highest recorded temps for each state more recent or more historic?

/*
- SELECT
  state,
  year,
  ROUND(tempf,2) AS tempf1,
  ROUND(tempc,2) AS tempc1,
  ROUND(LAG(tempc,1,0) OVER (
    PARTITION BY state
    ORDER BY year
  ),2) AS 'change_in_temp'
FROM state_climate
ORDER BY change_in_temp DESC;
*/


-- SQL GITHUB HELP FOR EXERCISES
-- BEGIN
-- LEAVE BLANK 

/*
-- Let’s see what our table contains
SELECT *
FROM state_climate
WHERE state = 'Alabama'
LIMIT 5;


-- EXERCISE 2
-- How the average temperature changes over time in each state.
SELECT
  state,
  year,
  ROUND(tempf,2) AS tempf1,
  ROUND(tempc,2) AS tempc1,
  ROUND(AVG(tempc) OVER (
    PARTITION BY state
    ORDER BY year
  ),2) AS 'running_avg_temp'
FROM state_climate
WHERE state = 'Alabama'
LIMIT 5;



-- EXERCISE 3
-- Lowest temp in each state
SELECT
  state,
  year,
  ROUND(tempf,2) AS tempf1,
  ROUND(tempc,2) AS tempc1,
  ROUND(FIRST_VALUE(tempc) OVER(
    PARTITION BY state
    ORDER BY tempc
  ),2) AS lowest_temp
FROM state_climate;


-- EXERCISE 4
-- Highest temp in each state
SELECT
  state,
  year,
  ROUND(tempf,2) AS tempf1,
  ROUND(tempc,2) AS tempc1,
  ROUND(LAST_VALUE(tempc) OVER(
    PARTITION BY state
    ORDER BY tempc
    RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ),2) AS highest_temp
FROM state_climate;


-- EXERCISE 5
-- Temp change each year in each state, and the largest change, no null
SELECT
  state,
  year,
  ROUND(tempf,2) AS tempf1,
  ROUND(tempc,2) AS tempc1,
  ROUND(LAG(tempc,1,0) OVER (
    PARTITION BY state
    ORDER BY year
  ),2) AS change_in_temp
FROM state_climate
ORDER BY change_in_temp DESC;



-- EXERCISE 6
-- Rank of the coldest temp, not attention on which state, which year
SELECT
  RANK() OVER (
    ORDER BY tempc
  ) AS rank,
  state,
  year,
  ROUND(tempf,2) AS tempf1,
  ROUND(tempc,2) AS tempc1
FROM state_climate;



-- EXERCISE 7
-- Rank of the warmest temp by state
SELECT
  RANK() OVER (
    PARTITION BY state
    ORDER BY tempc DESC
  ) AS rank,
  state,
  year,
  ROUND(tempf,2) AS tempf1,
  ROUND(tempc,2) AS tempc1
FROM state_climate;



-- EXERCISE 8
-- Quartile the tempc by each state, 1st quartile is the coldest years
SELECT
  NTILE(4) OVER (
    PARTITION BY state
    ORDER BY tempc
  ) AS quartile,
  state,
  year,
  ROUND(tempf,2) AS tempf1,
  ROUND(tempc,2) AS tempc1
FROM state_climate;



-- EXERCISE 9
-- Quintile the tempc by each year, 1st quintile is the coldest years overall
SELECT
  NTILE(5) OVER (
    ORDER BY tempc
  ) AS quintile,
  year,
  state,
  ROUND(tempf,2) AS tempf1,
  ROUND(tempc,2) AS tempc1
FROM state_climate;
*/







