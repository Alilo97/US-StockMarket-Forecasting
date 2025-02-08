WITH CompanySummary AS (
    -- Company Name: Apple
    SELECT
        'AAPL' AS "TickerCode",
        COUNT(*) AS "NumDataPoints",
        AVG(CAST(close AS NUMERIC)) AS "AvgClosingPrice",
        STDDEV(CAST(close AS NUMERIC)) AS "StdClosingPrice",
        MAX(CAST(close AS NUMERIC)) AS "MaxClosingPrice",
        MIN(CAST(close AS NUMERIC)) AS "MinClosingPrice",
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY CAST(close AS NUMERIC)) AS "25th Percentile",
        PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY CAST(close AS NUMERIC)) AS "Median",
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY CAST(close AS NUMERIC)) AS "75th Percentile"
    FROM aapl_weekly

    UNION ALL

    -- Company Name: Amazon
    SELECT
        'AMZN' AS "TickerCode",
        COUNT(*) AS "NumDataPoints",
        AVG(CAST(close AS NUMERIC)) AS "AvgClosingPrice",
        STDDEV(CAST(close AS NUMERIC)) AS "StdClosingPrice",
        MAX(CAST(close AS NUMERIC)) AS "MaxClosingPrice",
        MIN(CAST(close AS NUMERIC)) AS "MinClosingPrice",
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY CAST(close AS NUMERIC)) AS "25th Percentile",
        PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY CAST(close AS NUMERIC)) AS "Median",
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY CAST(close AS NUMERIC)) AS "75th Percentile"
    FROM amzn_weekly

    UNION ALL

    -- Company Name: BlackRock
    SELECT
        'BLK' AS "TickerCode",
        COUNT(*) AS "NumDataPoints",
        AVG(CAST(close AS NUMERIC)) AS "AvgClosingPrice",
        STDDEV(CAST(close AS NUMERIC)) AS "StdClosingPrice",
        MAX(CAST(close AS NUMERIC)) AS "MaxClosingPrice",
        MIN(CAST(close AS NUMERIC)) AS "MinClosingPrice",
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY CAST(close AS NUMERIC)) AS "25th Percentile",
        PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY CAST(close AS NUMERIC)) AS "Median",
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY CAST(close AS NUMERIC)) AS "75th Percentile"
    FROM blk_weekly

    UNION ALL

    -- Company Name: JP Morgan Chase & Co
    SELECT
        'JPM' AS "TickerCode",
        COUNT(*) AS "NumDataPoints",
        AVG(CAST(close AS NUMERIC)) AS "AvgClosingPrice",
        STDDEV(CAST(close AS NUMERIC)) AS "StdClosingPrice",
        MAX(CAST(close AS NUMERIC)) AS "MaxClosingPrice",
        MIN(CAST(close AS NUMERIC)) AS "MinClosingPrice",
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY CAST(close AS NUMERIC)) AS "25th Percentile",
        PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY CAST(close AS NUMERIC)) AS "Median",
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY CAST(close AS NUMERIC)) AS "75th Percentile"
    FROM jpm_weekly
)
SELECT * FROM CompanySummary;