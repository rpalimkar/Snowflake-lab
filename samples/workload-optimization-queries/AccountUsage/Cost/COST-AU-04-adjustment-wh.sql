-------------------------------------------------
-- NAME:	 COST-AU-04-adjustment-wh.txt
-------------------------------------------------
-- DESCRIPTION:
--	Reporting of daily compute adjustment credits
--	Snowflake does not charge for gs credits until they exceed 10%
--
-- OUTPUT:
--	adjustment credits by account/warehouse/day
--
-- NEXT STEPS:
--	Use for reporting purposes
--
-- REVISION HISTORY
-- DATE		INIT	DESCRIPTION
----------  ----    -----------
-- 18JAN22	WNA		CREATED/UPDATED FOR REPOSITORY
-------------------------------------------------
	
---------------------------------------
-- NAME:	COST-AU-04-adjustment-wh.txt
---------------------------------------
-- Pre-Requisite:
--  Adjust and run initialization script COST-AU-00-INIT.txt
---------------------------------------
-- Description:
--	Determines GS credit adjustments for the account by warehouse
---------------------------------------

select
      warehouse_name
      ,to_date(trunc(start_time, 'DAY')) as usage_day
      ,sum(credits_used_compute * -.1) as units_consumed
	FROM
      TABLE($WAREHOUSE_METERING_HISTORY)
    GROUP BY 1,2
    order by 1,2;