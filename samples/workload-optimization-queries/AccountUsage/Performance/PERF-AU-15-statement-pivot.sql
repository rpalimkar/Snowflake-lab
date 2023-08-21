-------------------------------------------------
-- NAME:	 PERF-AU-15-statement-pivot.txt
-------------------------------------------------
-- DESCRIPTION:
--	Statement types by hour, last request is a pivot
--
-- OUTPUT:
--	statement type count by hour
--	statement type count by warehouse by hour
--	pivot statement type counts by warehouse by hour where filtering on statement type
--	look for outliers, high volumes of requests within certain periods
--
-- NEXT STEPS:
--	Narrow timeframe for analysis
--	Identify requests for analysis
--	SQL Optimization
--	Object Optimization
--	Warehouse sizing
--
-- REVISION HISTORY
-- DATE		INIT	DESCRIPTION
----------  ----    -----------
-- 18JAN22	WNA		CREATED/UPDATED FOR REPOSITORY
-------------------------------------------------
	

--------------------------------------
-- Baseline data that can be put in a chart
--------------------------------------
SELECT
    J.QUERY_TYPE,
--    J.WAREHOUSE_NAME,
    TO_DATE(J.START_TIME) AS XDT,
	HOUR(J.START_TIME) AS CREATED_HR,
	COUNT(*) AS XCNT
FROM
    TABLE($QUERY_HISTORY) J
WHERE
    J.START_TIME BETWEEN $TS_START AND $TS_END AND
--    J.USER_NAME = $USER_NAME AND
    J.QUERY_TYPE='SHOW'
GROUP BY 1,2,3;

--------------------------------------
SELECT
    J.QUERY_TYPE,
    J.WAREHOUSE_NAME,
    TO_DATE(J.START_TIME) AS XDT,
	HOUR(J.START_TIME) AS CREATED_HR,
	COUNT(*) AS XCNT
FROM
    TABLE($QUERY_HISTORY) J
WHERE
    J.START_TIME BETWEEN $TS_START AND $TS_END AND
--    J.USER_NAME = $USER_NAME AND
    J.QUERY_TYPE='SHOW'
GROUP BY 1,2,3,4;



--------------------------------------
-- Pivoted data
--------------------------------------
SELECT
    WAREHOUSE_NAME,
    XDT,
    SUM(CASE WHEN CREATED_HR = 0 THEN XCNT ELSE 0 END) AS HR_00,
    SUM(CASE WHEN CREATED_HR = 1 THEN XCNT ELSE 0 END) AS HR_01,
    SUM(CASE WHEN CREATED_HR = 2 THEN XCNT ELSE 0 END) AS HR_02,
    SUM(CASE WHEN CREATED_HR = 3 THEN XCNT ELSE 0 END) AS HR_03,
    SUM(CASE WHEN CREATED_HR = 4 THEN XCNT ELSE 0 END) AS HR_04,
    SUM(CASE WHEN CREATED_HR = 5 THEN XCNT ELSE 0 END) AS HR_05,
    SUM(CASE WHEN CREATED_HR = 6 THEN XCNT ELSE 0 END) AS HR_06,
    SUM(CASE WHEN CREATED_HR = 7 THEN XCNT ELSE 0 END) AS HR_07,
    SUM(CASE WHEN CREATED_HR = 8 THEN XCNT ELSE 0 END) AS HR_08,
    SUM(CASE WHEN CREATED_HR = 9 THEN XCNT ELSE 0 END) AS HR_09,
    SUM(CASE WHEN CREATED_HR = 10 THEN XCNT ELSE 0 END) AS HR_10,
    SUM(CASE WHEN CREATED_HR = 11 THEN XCNT ELSE 0 END) AS HR_11,
    SUM(CASE WHEN CREATED_HR = 12 THEN XCNT ELSE 0 END) AS HR_12,
    SUM(CASE WHEN CREATED_HR = 13 THEN XCNT ELSE 0 END) AS HR_13,
    SUM(CASE WHEN CREATED_HR = 14 THEN XCNT ELSE 0 END) AS HR_14,
    SUM(CASE WHEN CREATED_HR = 15 THEN XCNT ELSE 0 END) AS HR_15,
    SUM(CASE WHEN CREATED_HR = 16 THEN XCNT ELSE 0 END) AS HR_16,
    SUM(CASE WHEN CREATED_HR = 17 THEN XCNT ELSE 0 END) AS HR_17,
    SUM(CASE WHEN CREATED_HR = 18 THEN XCNT ELSE 0 END) AS HR_18,
    SUM(CASE WHEN CREATED_HR = 19 THEN XCNT ELSE 0 END) AS HR_19,
    SUM(CASE WHEN CREATED_HR = 20 THEN XCNT ELSE 0 END) AS HR_20,
    SUM(CASE WHEN CREATED_HR = 21 THEN XCNT ELSE 0 END) AS HR_21,
    SUM(CASE WHEN CREATED_HR = 22 THEN XCNT ELSE 0 END) AS HR_22,
    SUM(CASE WHEN CREATED_HR = 23 THEN XCNT ELSE 0 END) AS HR_23
FROM
(
SELECT
    J.QUERY_TYPE,
    J.WAREHOUSE_NAME,
    TO_DATE(J.START_TIME) AS XDT,
	HOUR(J.START_TIME) AS CREATED_HR,
	COUNT(*) AS XCNT
FROM
    TABLE($QUERY_HISTORY) J
WHERE
    J.START_TIME BETWEEN $TS_START AND $TS_END AND
--    J.USER_NAME = $USER_NAME AND
    J.QUERY_TYPE='SHOW'
GROUP BY 1,2,3,4
) X
GROUP BY 1,2
ORDER BY 1,2
;