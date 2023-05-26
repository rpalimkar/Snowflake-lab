-------------------------------------------------
-- NAME:	 PERF-IS-13-query-session.txt
-------------------------------------------------
-- DESCRIPTION:
--	Requests all metric and related session information for a specified query id.  Used 
--	to analyze a specific request
--
-- OUTPUT:
--	Analyze for throughput issues like spilling, partition elimination, memory, duration, etc.
--
-- NEXT STEPS:
--  (0) Once session determined, add filter for session to pull all requests for session specified
--	(1) Review SQL optimizations
--	(2) Review Cluster Key options
--	(3) Analyze warehouse sizing
--
-- REVISION HISTORY
-- DATE		INIT	DESCRIPTION
----------  ----    -----------
-- 18JAN22	WNA		created/updated for repository
-------------------------------------------------
	
SELECT
	-- HEADER
	J.QUERY_ID,
    J.QUERY_TYPE,
	J.QUERY_TEXT,
	J.DATABASE_NAME,
	J.SCHEMA_NAME,
	J.SESSION_ID,
	J.USER_NAME,
	J.ROLE_NAME,
	J.WAREHOUSE_NAME,
	J.WAREHOUSE_SIZE,
	J.WAREHOUSE_TYPE,
	J.CLUSTER_NUMBER,
	J.QUERY_TAG,
	CASE WHEN J.ERROR_CODE IS NULL 
		THEN 'SUCCESS' ELSE 'FAILURE' 
		END 			AS EXECUTION_STATUS,
	J.ERROR_CODE,
	J.ERROR_MESSAGE,
	J.START_TIME,
	J.END_TIME,
	J.TOTAL_ELAPSED_TIME,
	-- DETAIL
	J.BYTES_SCANNED,
--	J.PERCENTAGE_SCANNED_FROM_CACHE,
--	J.BYTES_WRITTEN,
--	J.BYTES_WRITTEN_TO_RESULT,
--	J.BYTES_READ_FROM_RESULT,
	J.ROWS_PRODUCED,
--	J.ROWS_INSERTED,
--	J.ROWS_UPDATED,
--	J.ROWS_DELETED,
--	J.ROWS_UNLOADED,
--	J.BYTES_DELETED,
--	J.PARTITIONS_SCANNED,
--	J.PARTITIONS_TOTAL,
--	J.BYTES_SPILLED_TO_LOCAL_STORAGE,
--	J.BYTES_SPILLED_TO_REMOTE_STORAGE,
--	J.BYTES_SENT_OVER_THE_NETWORK,
	J.COMPILATION_TIME,
	J.EXECUTION_TIME,
	J.QUEUED_PROVISIONING_TIME,
	J.QUEUED_REPAIR_TIME,
	J.QUEUED_OVERLOAD_TIME,
	J.TRANSACTION_BLOCKED_TIME,
	J.OUTBOUND_DATA_TRANSFER_CLOUD,
	J.OUTBOUND_DATA_TRANSFER_REGION,
	J.OUTBOUND_DATA_TRANSFER_BYTES,
	J.INBOUND_DATA_TRANSFER_CLOUD,
	J.INBOUND_DATA_TRANSFER_REGION,
	J.INBOUND_DATA_TRANSFER_BYTES,
--	J.LIST_EXTERNAL_FILES_TIME,
	J.CREDITS_USED_CLOUD_SERVICES,
	J.RELEASE_VERSION,
	J.EXTERNAL_FUNCTION_TOTAL_INVOCATIONS,
	J.EXTERNAL_FUNCTION_TOTAL_SENT_ROWS,
	J.EXTERNAL_FUNCTION_TOTAL_RECEIVED_ROWS,
	J.EXTERNAL_FUNCTION_TOTAL_SENT_BYTES,
	J.EXTERNAL_FUNCTION_TOTAL_RECEIVED_BYTES,
--	J.QUERY_LOAD_PERCENT,
	J.IS_CLIENT_GENERATED_STATEMENT
FROM
	TABLE(SNOWFLAKE.INFORMATION_SCHEMA.QUERY_HISTORY(
		END_TIME_RANGE_START=>dateadd('day',-6,CURRENT_TIMESTAMP()),
		END_TIME_RANGE_END=>CURRENT_TIMESTAMP())) J
--WHERE
--    J.USER_NAME = $USER_NAME AND
--    J.QUERY_ID = $QUERY_ID AND
--	J.SESSION_ID = $SESSION_ID
ORDER BY
    J.SESSION_ID,J.START_TIME
LIMIT 100
;



