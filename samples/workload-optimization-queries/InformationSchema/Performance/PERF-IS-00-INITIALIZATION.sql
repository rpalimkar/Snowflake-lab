-------------------------------------------------
-- NAME:	 PERF-IS-00-INIT-VANTAGE.txt
-------------------------------------------------
-- DESCRIPTION:
--
--
-- OUTPUT:
--
--
-- NEXT STEPS:
--
--
-- OPTIONS:
--
--
-- REVISION HISTORY
-- DATE		INIT	DESCRIPTION
----------  ----    -----------
-- 18JAN22	WNA		created/updated for repository
-------------------------------------------------
	
--------------------------------------------
-- INITIALIZATION SCRIPT
--------------------------------------------

------------------------
-- SET CONTEXT
------------------------
use warehouse SFsupport_WH;
use role TECHNICAL_ACCOUNT_MANAGER;
use database SNOWFLAKE;
use schema ACCOUNT_USAGE;

------------------------
-- SET ENVIRONMENT VARIABLES
------------------------
SET DATABASE = 'SNOWFLAKE';
SET SCHEMA = 'INFORMATION_SCHEMA';
SET DEPLOYMENT = '';
SET ACCOUNT_ID = 0;
SET ACCOUNT_NAME = '';
SET USER_NAME = '';
SET WAREHOUSE_NAME = '';
SET USER_NAME = '';
SET TS_START = '2021-11-11 05:00:00'::TIMESTAMP_LTZ;
SET TS_END = '2021-11-11 06:00:00'::TIMESTAMP_LTZ;
SET QUERY_ID = '01a0067f-0000-3855-0000-240159c57e6f';
SET SESSION_ID = '';

------------------------
-- SET OBJECT VARIABLES
------------------------
SET QUERY_HISTORY = 'SNOWFLAKE.INFORMATION_SCHEMA.QUERY_HISTORY';
SET METERING_HISTORY = 'SNOWFLAKE.INFORMATION_SCHEMA.METERING_HISTORY';
SET WAREHOUSE_LOAD_HISTORY = 'SNOWFLAKE.INFORMATION_SCHEMA.WAREHOUSE_LOAD_HISTORY';
SET WAREHOUSE_METERING_HISTORY = 'SNOWFLAKE.INFORMATION_SCHEMA.WAREHOUSE_METERING_HISTORY';
SET WAREHOUSE_EVENT_HISTORY = 'SNOWFLAKE.INFORMATION_SCHEMA.WAREHOUSE_EVENT_HISTORY';
SET STORAGE_USAGE = 'SNOWFLAKE.INFORMATION_SCHEMA.STORAGE_USAGE';
SET STAGE_STORAGE_USAGE_HISTORY = 'SNOWFLAKE.INFORMATION_SCHEMA.STAGE_STORAGE_USAGE_HISTORY';
SET DATABASE_STORAGE_USAGE_HISTORY = 'SNOWFLAKE.INFORMATION_SCHEMA.DATABASE_STORAGE_USAGE_HISTORY';
SET DATABASES = 'SNOWFLAKE.INFORMATION_SCHEMA.DATABASES';
SET TABLES = 'SNOWFLAKE.INFORMATION_SCHEMA.TABLES';
SET COLUMNS = 'SNOWFLAKE.INFORMATION_SCHEMA.COLUMNS';
SET PIPES = 'SNOWFLAKE.INFORMATION_SCHEMA.PIPES';
SET PIPE_USAGE_HISTORY = 'SNOWFLAKE.INFORMATION_SCHEMA.PIPE_USAGE_HISTORY';
SET DATABASES = 'SNOWFLAKE.INFORMATION_SCHEMA.DATABASES';
SET LOGIN_HISTORY = 'SNOWFLAKE.INFORMATION_SCHEMA.LOGIN_HISTORY';	
SET COPY_HISTORY = 'SNOWFLAKE.INFORMATION_SCHEMA.COPY_HISTORY';	
SET LOAD_HISTORY = 'SNOWFLAKE.INFORMATION_SCHEMA.LOAD_HISTORY';	
SET SCHEMATA = 'SNOWFLAKE.INFORMATION_SCHEMA.SCHEMATA';
SET STAGES = 'SNOWFLAKE.INFORMATION_SCHEMA.STAGES';
SET VIEWS = 'SNOWFLAKE.INFORMATION_SCHEMA.VIEWS';
SET TABLE_STORAGE_METRICS = 'SNOWFLAKE.INFORMATION_SCHEMA.TABLE_STORAGE_METRICS';
SET FUNCTIONS = 'SNOWFLAKE.INFORMATION_SCHEMA.FUNCTIONS';
SET FILE_FORMATS = 'SNOWFLAKE.INFORMATION_SCHEMA.FILE_FORMATS';
SET MASKING_POLICIES = 'SNOWFLAKE.INFORMATION_SCHEMA.MASKING_POLICIES';
SET POLICY_REFERENCES = 'SNOWFLAKE.INFORMATION_SCHEMA.POLICY_REFERENCES';
SET TASK_HISTORY = 'SNOWFLAKE.INFORMATION_SCHEMA.TASK_HISTORY';
SET ROLES = 'SNOWFLAKE.INFORMATION_SCHEMA.ROLES';
SET USERS = 'SNOWFLAKE.INFORMATION_SCHEMA.USERS';
SET GRANTS_TO_ROLES = 'SNOWFLAKE.INFORMATION_SCHEMA.GRANTS_TO_ROLES';
SET GRANTS_TO_USERS = 'SNOWFLAKE.INFORMATION_SCHEMA.GRANTS_TO_USERS';
SET AUTOMATIC_CLUSTERING_HISTORY = 'SNOWFLAKE.INFORMATION_SCHEMA.AUTOMATIC_CLUSTERING_HISTORY';
SET MATERIALIZED_VIEW_REFRESH_HISTORY = 'SNOWFLAKE.INFORMATION_SCHEMA.MATERIALIZED_VIEW_REFRESH_HISTORY';
SET SEARCH_OPTIMIZATION_HISTORY = 'SNOWFLAKE.INFORMATION_SCHEMA.SEARCH_OPTIMIZATION_HISTORY';
SET REPLICATION_USAGE_HISTORY = 'SNOWFLAKE.INFORMATION_SCHEMA.REPLICATION_USAGE_HISTORY';
SET REPLICATION_DATABASES = 'SNOWFLAKE.INFORMATION_SCHEMA.REPLICATION_DATABASES';
