WITH SummaryStatistics AS (
    SELECT
        'AAPL' AS "Ticker Code",
        CORR(close, volume) AS correlation_close_volume,
        3*(avg(close)-percentile_cont(0.5) WITHIN GROUP (ORDER BY close))/stddev(close) AS "Kurtosis"
    FROM
        aapl_weekly

    UNION ALL

    SELECT
        'JPM' AS "Ticker Code",
        CORR(close, volume) AS correlation_close_volume,
        3*(avg(close)-percentile_cont(0.5) WITHIN GROUP (ORDER BY close))/stddev(close) as "Kurtosis"

    FROM
        jpm_weekly

    UNION ALL

    SELECT
        'AMZN' AS "Ticker Code",
        CORR(close, volume) AS correlation_close_volume,
        3*(avg(close)-percentile_cont(0.5)WITHIN GROUP (ORDER BY close))/stddev(close) as "Kurtosis"
    FROM
        amzn_weekly

    UNION ALL

    SELECT
        'BLK' AS "Ticker Code",
        CORR(close, volume) AS correlation_close_volume,
        3*(avg(close)-percentile_cont(0.5)WITHIN GROUP (ORDER BY close))/stddev(close) as "Kurtosis"
    FROM
        blk_weekly
)

SELECT
    "Ticker Code",
    correlation_close_volume,
    "Kurtosis"
FROM
    SummaryStatistics;
------------------------------------------------------------------------------------------------------
WITH daily_returns AS (
    SELECT
        DATE_PART('year', date) AS year,
        LAG("Adj Close") OVER (ORDER BY date) AS prev_close, --This is why Adj Close is not a negligible column in the dataset
        "Adj Close",
        ("Adj Close" - LAG("Adj Close") OVER (ORDER BY date)) / LAG("Adj Close") OVER (ORDER BY date) AS "Daily Returns"
    FROM
        aapl_daily
),
volatily_per_Year AS (
    SELECT
        year,
        STDDEV("Daily Returns") * SQRT(252) AS volatily_per_Year
    FROM
        daily_returns
    WHERE
        "Daily Returns" IS NOT NULL
    GROUP BY
        year
)
SELECT
    year,
    volatily_per_Year
FROM
    volatily_per_Year
ORDER BY
    year;
