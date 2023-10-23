-------------------------------------------------
-- NAME:	 COST-IS-06-gs-wh.txt
-------------------------------------------------
-- DESCRIPTION:
--	Reporting of daily gs credits
--
-- OUTPUT:
--	GS credits by account/warehouse/day
--
-- NEXT STEPS:
--	Use for reporting purposes
--	Look for outliers of runaway cost
--
-- REVISION HISTORY
-- DATE		INIT	DESCRIPTION
----------  ----    -----------
-- 18JAN22	WNA		created/updated for repository
-------------------------------------------------
	
select 
	  warehouse_name
	  ,to_date(trunc(start_time, 'DAY')) as usage_day
	  ,'CLOUD SERVICES' as usage_category						--CLOUD SERVICES
	  ,sum(credits_used_cloud_services) as units_consumed
	FROM
	TABLE(SNOWFLAKE.INFORMATION_SCHEMA.WAREHOUSE_METERING_HISTORY(
		date_range_start=>dateadd('day',-2,current_date()),
		date_range_end=>current_date()))
    GROUP BY 1,2,3
    order by 1,2,3;