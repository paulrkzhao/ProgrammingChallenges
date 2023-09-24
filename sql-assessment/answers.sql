/* 1. Write a query to get the sum of impressions by day. */

SELECT SUM(impressions) AS sum_of_impressions
FROM marketing_performance;

/* 2. Write a query to get the top three revenue-generating states in order of best to worst.
   How much revenue did the third best state generate?
 */

SELECT state, SUM(revenue) AS state_revenue
FROM website_revenue
GROUP BY state
ORDER BY state_revenue DESC
LIMIT 3;

/* Ohio generated $37,577 in revenue */

/* 3. Write a query that shows total cost, impressions, clicks, and revenue of each campaign.
   Make sure to include the campaign name in the output.
 */

SELECT
ci.name AS campaign_name,
mp.campaign_id,
SUM(mp.cost) AS total_cost,
SUM(mp.impressions) AS total_impressions,
SUM(mp.clicks) AS total_clicks,
SUM(wr.revenue) AS total_revenue
FROM
campaign_info AS ci
INNER JOIN
marketing_performance AS mp ON ci.id = mp.campaign_id
INNER JOIN
website_revenue AS wr ON ci.id = wr.campaign_id
GROUP BY
ci.name, mp.campaign_id, wr.campaign_id
ORDER BY
ci.name;

/* 4. Write a query to get the number of conversions of Campaign5 by state.
   Which state generated the most conversions for this campaign?
 */

SELECT
    mp.geo,
    SUM(mp.conversions) AS num_conversions
FROM
    marketing_performance AS mp
INNER JOIN
    campaign_info AS ci ON mp.campaign_id = ci.id
WHERE
    ci.name = 'Campaign5'
GROUP BY
    mp.geo
ORDER BY
    num_conversions DESC;

/* Georgia generated the most conversions for this campaign */

/* 5. In your opinion, which campaign was the most efficient, and why? */

/*
Campaign 4 seems to clearly be the most efficient as it generated the most revenue in proportion to
their campaign cost as it was also the lowest costing campaign out of the 5. Additionally, It had the 
second highest ratio of total_clicks and total_cost, only behind Campaign 1. Safe to say, however, that
in the long-run of a campaign, total_impressions is much more important than total_clicks and Campaign 4
is drastically more efficient in that attribute compared to the others. 
 */

