--Sudden Change Detection

WITH SuddenChangeDetectionApple AS (
    SELECT
        date,
        close,
        LAG(close) OVER (ORDER BY date) AS previous_value,
        close - LAG(close) OVER (ORDER BY date) AS change
    FROM
        aapl_daily
    ORDER BY
        date
),
SuddenChangeDetectionJPM AS (
    SELECT
        date,
        close,
        LAG(close) OVER (ORDER BY date) AS previous_value,
        close - LAG(close) OVER (ORDER BY date) AS change
    FROM
        jpm_daily
    ORDER BY
        date
),
SuddenChangeDetectionAMZN AS (
    SELECT
        date,
        close,
        LAG(close) OVER (ORDER BY date) AS previous_value,
        close - LAG(close) OVER (ORDER BY date) AS change
    FROM
        amzn_daily
    ORDER BY
        date
),
SuddenChangeDetectionBLK AS (
    SELECT
        date,
        close,
        LAG(close) OVER (ORDER BY date) AS previous_value,
        close - LAG(close) OVER (ORDER BY date) AS change
    FROM
        blk_daily
    ORDER BY
        date
)
SELECT 'AAPL' as "Ticker Code",
    MAX(change) AS max_change,
    MAX(CASE WHEN change = (SELECT MAX(change) FROM SuddenChangeDetectionApple) THEN date END) AS max_change_date,
    MIN(change) AS min_change,
    MAX(CASE WHEN change = (SELECT MIN(change) FROM SuddenChangeDetectionApple) THEN date END) AS min_change_date
FROM
    SuddenChangeDetectionApple

UNION ALL

SELECT 'JPM' as "Ticker Code",
    MAX(change) AS max_change,
    MAX(CASE WHEN change = (SELECT MAX(change) FROM SuddenChangeDetectionJPM) THEN date END) AS max_change_date,
    MIN(change) AS min_change,
    MAX(CASE WHEN change = (SELECT MIN(change) FROM SuddenChangeDetectionJPM) THEN date END) AS min_change_date
FROM
    SuddenChangeDetectionJPM

UNION ALL

SELECT 'AMZN' as "Ticker Code",
    MAX(change) AS max_change,
    MAX(CASE WHEN change = (SELECT MAX(change) FROM SuddenChangeDetectionAMZN) THEN date END) AS max_change_date,
    MIN(change) AS min_change,
    MAX(CASE WHEN change = (SELECT MIN(change) FROM SuddenChangeDetectionAMZN) THEN date END) AS min_change_date
FROM
    SuddenChangeDetectionAMZN

UNION ALL

SELECT 'BLK' as "Ticker Code",
    MAX(change) AS max_change,
    MAX(CASE WHEN change = (SELECT MAX(change) FROM SuddenChangeDetectionBLK) THEN date END) AS max_change_date,
    MIN(change) AS min_change,
    MAX(CASE WHEN change = (SELECT MIN(change) FROM SuddenChangeDetectionBLK) THEN date END) AS min_change_date
FROM
    SuddenChangeDetectionBLK;
