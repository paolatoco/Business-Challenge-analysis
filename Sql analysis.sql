USE invest;




#
#Authors: 
#Team 7 


-- Analysing the current situation of the client's portfolio, what are the current major and minor asset classes, 
-- the tickers in the portfolio and the securtity type: 

-- --------------------------------------------------------------------------------------------------------------------
-- Percent per client per major asset class will be used to analyse the current division of the portfolio
-- --------------------------------------------------------------------------------------------------------------------
-- percent per major asset class for 226
SELECT cd.full_name, CASE WHEN major_asset_class = 'fixed_income' THEN 'fixed income' -- Case Statement used in many queries to correct the asset classes, from Luisa 
						WHEN major_asset_class ='alternatives' THEN 'alternatives'
						WHEN major_asset_class ='commodities' THEN 'commodities'
						WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						WHEN major_asset_class ='equity' THEN 'equity' 
						WHEN major_asset_class ='equty' THEN 'equity'
						WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
FORMAT(SUM(hc.value),2) AS value, 
SUM(hc.quantity) AS quantity, 
FORMAT(SUM(hc.value*hc.quantity),2) AS total_value, 
FORMAT(SUM(hc.value * hc.quantity)/
									(SELECT SUM(hc.value * hc.quantity) FROM account_dim AS ad -- total value per client Paola 
									INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
									INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
									INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
									WHERE cd.customer_id = 226)*100,2) AS percent_of_portfolio
FROM account_dim AS ad
INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
WHERE cd.customer_id = 226
GROUP BY major_asset_class_adjusted;

-- percent per major asset class for 29 
SELECT cd.full_name, CASE WHEN major_asset_class = 'fixed_income' THEN 'fixed income' 
						WHEN major_asset_class ='alternatives' THEN 'alternatives'
						WHEN major_asset_class ='commodities' THEN 'commodities'
						WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						WHEN major_asset_class ='equity' THEN 'equity' 
						WHEN major_asset_class ='equty' THEN 'equity'
						WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
FORMAT(SUM(hc.value),2) AS value, 
SUM(hc.quantity) AS quantity, 
FORMAT(SUM(hc.value*hc.quantity),2) AS total_value, 
FORMAT(SUM(hc.value * hc.quantity)/
									(SELECT SUM(hc.value * hc.quantity) FROM account_dim AS ad
									INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
									INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
									INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
									WHERE cd.customer_id = 29)*100,2) AS percent_of_portfolio
FROM account_dim AS ad
INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
WHERE cd.customer_id = 29
GROUP BY major_asset_class_adjusted;

-- percent per major asset class for 32 
SELECT cd.full_name, CASE WHEN major_asset_class = 'fixed_income' THEN 'fixed income' 
						WHEN major_asset_class ='alternatives' THEN 'alternatives'
						WHEN major_asset_class ='commodities' THEN 'commodities'
						WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						WHEN major_asset_class ='equity' THEN 'equity' 
						WHEN major_asset_class ='equty' THEN 'equity'
						WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
FORMAT(SUM(hc.value),2) AS value, 
SUM(hc.quantity) AS quantity, 
FORMAT(SUM(hc.value*hc.quantity),2) AS total_value, 
FORMAT(SUM(hc.value * hc.quantity)/
									(SELECT SUM(hc.value * hc.quantity) FROM account_dim AS ad
									INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
									INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
									INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
									WHERE cd.customer_id = 32)*100,2) AS percent_of_portfolio
FROM account_dim AS ad
INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
WHERE cd.customer_id = 32
GROUP BY major_asset_class_adjusted;

-- --------------------------------------------------------------------------------------------------------------------
-- Percent per client per minor asset class will be used to analyse the current division of the portfolio
-- --------------------------------------------------------------------------------------------------------------------
-- percent per minor asset class for 32
SELECT cd.full_name, CASE WHEN major_asset_class = 'fixed_income' THEN 'fixed income' 
						WHEN major_asset_class ='alternatives' THEN 'alternatives'
						WHEN major_asset_class ='commodities' THEN 'commodities'
						WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						WHEN major_asset_class ='equity' THEN 'equity' 
						WHEN major_asset_class ='equty' THEN 'equity'
						WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
minor_asset_class, 
FORMAT(SUM(hc.value),2) AS value, 
SUM(hc.quantity) AS quantity, 
FORMAT(SUM(hc.value*hc.quantity),2) AS total_value, 
FORMAT(SUM(hc.value * hc.quantity)/
									(SELECT SUM(hc.value * hc.quantity) FROM account_dim AS ad
									INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
									INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
									INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
									WHERE cd.customer_id = 32)*100,2) AS percent_of_portfolio
FROM account_dim AS ad
INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
WHERE cd.customer_id = 32
GROUP BY major_asset_class_adjusted, minor_asset_class
ORDER BY major_asset_class_adjusted;

-- percent per minor asset class for 226
SELECT cd.full_name, CASE WHEN major_asset_class = 'fixed_income' THEN 'fixed income' 
						WHEN major_asset_class ='alternatives' THEN 'alternatives'
						WHEN major_asset_class ='commodities' THEN 'commodities'
						WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						WHEN major_asset_class ='equity' THEN 'equity' 
						WHEN major_asset_class ='equty' THEN 'equity'
						WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
minor_asset_class, 
FORMAT(SUM(hc.value),2) AS value, 
SUM(hc.quantity) AS quantity, 
FORMAT(SUM(hc.value*hc.quantity),2) AS total_value, 
FORMAT(SUM(hc.value * hc.quantity)/
									(SELECT SUM(hc.value * hc.quantity) FROM account_dim AS ad
									INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
									INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
									INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
									WHERE cd.customer_id = 226)*100,2) AS percent_of_portfolio
FROM account_dim AS ad
INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
WHERE cd.customer_id = 226
GROUP BY major_asset_class_adjusted, minor_asset_class
ORDER BY major_asset_class_adjusted;

-- percent per minor asset class for 29
SELECT cd.full_name, CASE WHEN major_asset_class = 'fixed_income' THEN 'fixed income' 
						WHEN major_asset_class ='alternatives' THEN 'alternatives'
						WHEN major_asset_class ='commodities' THEN 'commodities'
						WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						WHEN major_asset_class ='equity' THEN 'equity' 
						WHEN major_asset_class ='equty' THEN 'equity'
						WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
minor_asset_class, 
FORMAT(SUM(hc.value),2) AS value, 
SUM(hc.quantity) AS quantity, 
FORMAT(SUM(hc.value*hc.quantity),2) AS total_value, 
FORMAT(SUM(hc.value * hc.quantity)/
									(SELECT SUM(hc.value * hc.quantity) FROM account_dim AS ad
									INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
									INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
									INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
									WHERE cd.customer_id = 29)*100,2) AS percent_of_portfolio
FROM account_dim AS ad
INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
WHERE cd.customer_id = 29
GROUP BY major_asset_class_adjusted, minor_asset_class
ORDER BY major_asset_class_adjusted;

-- --------------------------------------------------------------------------------------------------------------------
-- Percent per client per sec type and minor asset class will be used to analyse the current division of the portfolio
-- --------------------------------------------------------------------------------------------------------------------
-- sec type in portfolio 32 
SELECT cd.full_name, CASE WHEN major_asset_class = 'fixed_income' THEN 'fixed income' 
						WHEN major_asset_class ='alternatives' THEN 'alternatives'
						WHEN major_asset_class ='commodities' THEN 'commodities'
						WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						WHEN major_asset_class ='equity' THEN 'equity' 
						WHEN major_asset_class ='equty' THEN 'equity'
						WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
minor_asset_class, 
sec_type, 
FORMAT(SUM(hc.value),2) AS value, 
SUM(hc.quantity) AS quantity, 
FORMAT(SUM(hc.value*hc.quantity),2) AS total_value, 
FORMAT(SUM(hc.value * hc.quantity)/
									(SELECT SUM(hc.value * hc.quantity) FROM account_dim AS ad
									INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
									INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
									INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
									WHERE cd.customer_id = 32)*100,2) AS percent_of_portfolio
FROM account_dim AS ad
INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
WHERE cd.customer_id = 32
GROUP BY major_asset_class_adjusted, minor_asset_class, sec_type
ORDER BY major_asset_class_adjusted;

-- sec type in portfolio 29 
SELECT cd.full_name, CASE WHEN major_asset_class = 'fixed_income' THEN 'fixed income' 
						WHEN major_asset_class ='alternatives' THEN 'alternatives'
						WHEN major_asset_class ='commodities' THEN 'commodities'
						WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						WHEN major_asset_class ='equity' THEN 'equity' 
						WHEN major_asset_class ='equty' THEN 'equity'
						WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
minor_asset_class, 
sec_type, 
FORMAT(SUM(hc.value),2) AS value, 
SUM(hc.quantity) AS quantity, 
FORMAT(SUM(hc.value*hc.quantity),2) AS total_value, 
FORMAT(SUM(hc.value * hc.quantity)/
									(SELECT SUM(hc.value * hc.quantity) FROM account_dim AS ad
									INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
									INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
									INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
									WHERE cd.customer_id = 29)*100,2) AS percent_of_portfolio
FROM account_dim AS ad
INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
WHERE cd.customer_id = 29
GROUP BY major_asset_class_adjusted, minor_asset_class, sec_type
ORDER BY major_asset_class_adjusted;

-- sec type in portfolio 29 
SELECT cd.full_name, CASE WHEN major_asset_class = 'fixed_income' THEN 'fixed income' 
						WHEN major_asset_class ='alternatives' THEN 'alternatives'
						WHEN major_asset_class ='commodities' THEN 'commodities'
						WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						WHEN major_asset_class ='equity' THEN 'equity' 
						WHEN major_asset_class ='equty' THEN 'equity'
						WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
minor_asset_class, 
sec_type, 
FORMAT(SUM(hc.value),2) AS value, 
SUM(hc.quantity) AS quantity, 
FORMAT(SUM(hc.value*hc.quantity),2) AS total_value, 
FORMAT(SUM(hc.value * hc.quantity)/
									(SELECT SUM(hc.value * hc.quantity) FROM account_dim AS ad
									INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
									INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
									INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
									WHERE cd.customer_id = 29)*100,2) AS percent_of_portfolio
FROM account_dim AS ad
INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
WHERE cd.customer_id = 29
GROUP BY major_asset_class_adjusted, minor_asset_class, sec_type
ORDER BY major_asset_class_adjusted;

-- --------------------------------------------------------------------------------------------------------------------
-- Percent per client per security will be used to analyse the current division of the portfolio
-- --------------------------------------------------------------------------------------------------------------------
-- companies % in portfolio 32
SELECT cd.full_name, sm.ticker, sm.security_name, 
					CASE WHEN major_asset_class = 'fixed_income' THEN 'fixed income' 
						WHEN major_asset_class ='alternatives' THEN 'alternatives'
						WHEN major_asset_class ='commodities' THEN 'commodities'
						WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						WHEN major_asset_class ='equity' THEN 'equity' 
						WHEN major_asset_class ='equty' THEN 'equity'
						WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
minor_asset_class, 
FORMAT(SUM(hc.value),2) AS value, 
SUM(hc.quantity) AS quantity, 
FORMAT(SUM(hc.value*hc.quantity),2) AS total_value, 
FORMAT(SUM(hc.value * hc.quantity)/
									(SELECT SUM(hc.value * hc.quantity) FROM account_dim AS ad
									INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
									INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
									INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
									WHERE cd.customer_id = 32)*100,2) AS percent_of_portfolio
FROM account_dim AS ad
INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
WHERE cd.customer_id = 32
GROUP BY sm.ticker
ORDER BY major_asset_class_adjusted;

-- companies % in portfolio 29
SELECT cd.full_name, sm.ticker, sm.security_name, 
					CASE WHEN major_asset_class = 'fixed_income' THEN 'fixed income' 
						WHEN major_asset_class ='alternatives' THEN 'alternatives'
						WHEN major_asset_class ='commodities' THEN 'commodities'
						WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						WHEN major_asset_class ='equity' THEN 'equity' 
						WHEN major_asset_class ='equty' THEN 'equity'
						WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
minor_asset_class, 
FORMAT(SUM(hc.value),2) AS value, 
SUM(hc.quantity) AS quantity, 
FORMAT(SUM(hc.value*hc.quantity),2) AS total_value, 
FORMAT(SUM(hc.value * hc.quantity)/
									(SELECT SUM(hc.value * hc.quantity) FROM account_dim AS ad
									INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
									INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
									INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
									WHERE cd.customer_id = 29)*100,2) AS percent_of_portfolio
FROM account_dim AS ad
INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
WHERE cd.customer_id = 29
GROUP BY sm.ticker
ORDER BY major_asset_class_adjusted;

-- companies % in portfolio 226
SELECT cd.full_name, sm.ticker, sm.security_name, 
					CASE WHEN major_asset_class = 'fixed_income' THEN 'fixed income' 
						WHEN major_asset_class ='alternatives' THEN 'alternatives'
						WHEN major_asset_class ='commodities' THEN 'commodities'
						WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						WHEN major_asset_class ='equity' THEN 'equity' 
						WHEN major_asset_class ='equty' THEN 'equity'
						WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
minor_asset_class, 
FORMAT(SUM(hc.value),2) AS value, 
SUM(hc.quantity) AS quantity, 
FORMAT(SUM(hc.value*hc.quantity),2) AS total_value, 
FORMAT(SUM(hc.value * hc.quantity)/
									(SELECT SUM(hc.value * hc.quantity) FROM account_dim AS ad
									INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
									INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
									INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
									WHERE cd.customer_id = 226)*100,2) AS percent_of_portfolio
FROM account_dim AS ad
INNER JOIN customer_details AS cd ON cd.customer_id = ad.client_id
INNER JOIN holdings_current AS hc ON hc.account_id = ad.account_id
INNER JOIN security_masterlist AS sm ON hc.ticker = sm.ticker
WHERE cd.customer_id = 226
GROUP BY sm.ticker
ORDER BY major_asset_class_adjusted;


-- TOTAL CURRENT PORTFOLIO VALUE OF CLIENT 226
SELECT  SUM(value*quantity)  AS position_value
FROM 		holdings_current AS hc
INNER JOIN 	account_dim      AS ad
ON 			ad.account_id = hc.account_id
WHERE 		ad.client_id  = 226
AND 		hc.price_type = 'Adjusted'
-- THE VALUE OF THE CURRENT PORTFOLIO IS USED IN THE SLIEDS FOR CLIENT 226
;


-- TOTAL CURRENT PORTFOLIO VALUE OF CLIENT 29
SELECT  SUM(value*quantity)  AS position_value
FROM 		holdings_current AS hc
INNER JOIN 	account_dim      AS ad
ON 			ad.account_id = hc.account_id
WHERE 		ad.client_id  = 29
AND 		hc.price_type = 'Adjusted'
-- THE VALUE OF THE CURRENT PORTFOLIO IS USED IN THE SLIEDS FOR CLIENT 29
;



-- TOTAL CURRENT PORTFOLIO VALUE OF CLIENT 32
SELECT  SUM(value*quantity)  AS position_value
FROM 		holdings_current AS hc
INNER JOIN 	account_dim      AS ad
ON 			ad.account_id = hc.account_id
WHERE 		ad.client_id  = 32
AND 		hc.price_type = 'Adjusted'
-- THE VALUE OF THE CURRENT PORTFOLIO IS USED IN THE SLIEDS FOR CLIENT 32
;





-- PORTFOLIO RETURNS FOR CLIENT 226 PORTFOLIO 12, 18 AND 24 MONTHES.

	-- CTE FILTERING FOR CLIENT 226 WHEN EXTRACTING THE WEIGHT OF PORTFOLIO TICKERS
WITH weight AS (
				SELECT 
                ticker, 
                ((hc.value * hc.quantity)/ ( -- SUBQUERY WICH EXTRACTS CURRENT VALUE OF PORTFOLIO
											SELECT   SUM(value*quantity) AS position_value
											FROM 		holdings_current AS hc
											INNER JOIN 	account_dim      AS ad
											ON 			ad.account_id = hc.account_id
											WHERE 		ad.client_id  = 226
											AND 		hc.price_type = 'Adjusted'
										   ))-- END OF SUBQUERY WICH EXTRACTS CURRENT VALUE OF PORTFOLIO
											 AS 		ticker_weight
				FROM 		holdings_current AS hc
				INNER JOIN 	account_dim      AS ad
				ON 			ad.account_id = hc.account_id
				WHERE       ad.client_id  = 226
				AND         hc.price_type = 'Adjusted'
			   )

	-- TAKING THE SUM OF THE RETURN PER TCKER AND MULTIPLING BY THE TICKER WEIGHT.
	-- RETURNS ARE PROCENTAGE INCRESES IF POSETIVE AND PROCENTAGE DECREESES IF NEGATIVE.
SELECT  
				SUM(((it.value - it.lagg_price_12m)/it.lagg_price_12m) * ticker_weight) AS portfolio_return_12m,
				SUM(((it.value - it.lagg_price_18m)/it.lagg_price_18m) * ticker_weight) AS portfolio_return_18m,
				SUM(((it.value - it.lagg_price_24m)/it.lagg_price_24m) * ticker_weight) AS portfolio_return_24m
FROM 		   ( -- SUBQUERRY CREATING LAG PRICE
				SELECT pd.ticker, 
                pd.date, 
                pd.value,
				LAG(pd.value, 250)OVER(
										PARTITION BY ticker
										ORDER BY pd.date
									  ) AS lagg_price_12m,
				LAG(pd.value, 375)OVER(
										PARTITION BY ticker
										ORDER BY pd.date
									  ) AS lagg_price_18m,
				LAG(pd.value, 500)OVER(
										PARTITION BY ticker
										ORDER BY pd.date
									  )   AS lagg_price_24m
				FROM	pricing_daily_new AS pd
				WHERE 	pd.price_type = 'Adjusted'
                ) -- END OF SUBQUERRY CREATING LAGMPRICE
				AS 		it
INNER JOIN 				holdings_current AS hc
ON 						hc.ticker     	 = it.ticker
INNER JOIN 				account_dim      AS ad
ON 						ad.account_id 	 = hc.account_id
INNER JOIN 				weight 		     AS w
ON 						w.ticker 	     = hc.ticker
WHERE 					it.date  	     = '2022-09-09'
AND 					ad.client_id     = 226

-- IN THE PRESENTATION portfolio__return_12m IS USED FOR CLIENT 226 AS IT SHOWES THE 
-- RETURN THE PORTFOLIO WOULD HAV HADE LOOKING ONE YEAR BACK
;



-- PORTFOLIO RETURNS FOR CLIENT 29 PORTFOLIO 12, 18 AND 24 MONTHES.


	-- CTE FILTERING FOR CLIENT 29 WHEN EXTRACTING THE WEIGHT OF PORTFOLIO TICKERS
WITH weight AS (
				SELECT 
                ticker, 
                ((hc.value * hc.quantity)/ ( -- SUBQUERY WICH EXTRACTS CURRENT VALUE OF PORTFOLIO
											SELECT   SUM(value*quantity)  AS position_value
											FROM 		 holdings_current AS hc
											INNER JOIN 	 account_dim      AS ad
											ON 		     ad.account_id = hc.account_id
											WHERE 		 ad.client_id  = 29
											AND 	     hc.price_type = 'Adjusted'
										   ))-- END OF SUBQUERY WICH EXTRACTS CURRENT VALUE OF PORTFOLIO
                                                            AS 		    ticker_weight
				FROM 		holdings_current AS hc
				INNER JOIN 	account_dim      AS ad
				ON 			ad.account_id = hc.account_id
				WHERE       ad.client_id  = 29
				AND         hc.price_type = 'Adjusted'
			   )

	-- TAKING THE SUM OF THE RETURN PER TCKER AND MULTIPLING BY THE TICKER WEIGHT. 
	-- RETURNS ARE PROCENTAGE INCRESES IF POSETIVE AND PROCENTAGE DECREESES IF NEGATIVE.
SELECT  
				SUM(((it.value - it.lagg_price_12m)/it.lagg_price_12m) * ticker_weight) AS weighted_return_12m,
				SUM(((it.value - it.lagg_price_18m)/it.lagg_price_18m) * ticker_weight) AS weighted_return_18m,
				SUM(((it.value - it.lagg_price_24m)/it.lagg_price_24m) * ticker_weight) AS weighted_return_24m
FROM 		   ( -- SUBQUERRY CREATING LAGMPRICE
				SELECT 
                pd.ticker, 
                pd.date,
                pd.value,
				LAG(pd.value, 250)OVER(
										PARTITION BY ticker
										ORDER BY pd.date
									  ) AS lagg_price_12m,
				LAG(pd.value, 375)OVER(
										PARTITION BY ticker
										ORDER BY pd.date
									  ) AS lagg_price_18m,
				LAG(pd.value, 500)OVER(
										PARTITION BY ticker
										ORDER BY pd.date
									  )   AS lagg_price_24m
				FROM	pricing_daily_new AS pd
				WHERE 	pd.price_type = 'Adjusted'
                ) -- END OF SUBQUERRY CREATING LAGMPRICE
				AS 		it
INNER JOIN 				holdings_current AS hc
ON 						hc.ticker     	 = it.ticker
INNER JOIN 				account_dim      AS ad
ON 						ad.account_id 	 = hc.account_id
INNER JOIN 				weight 		     AS w
ON 						w.ticker 	     = hc.ticker
WHERE 					it.date  	     = '2022-09-09'
AND 					ad.client_id     = 29
-- IN THE PRESENTATION portfolio__return_12m IS USED FOR CLIENT 29 AS IT SHOWES THE 
-- RETURN THE PORTFOLIO WOULD HAV HADE LOOKING ONE YEAR BACK
;


-- PORTFOLIO RETURNS FOR CLIENT 32 PORTFOLIO 12, 18 AND 24 MONTHES.

	-- CTE FILTERING FOR CLIENT 32 WHEN EXTRACTING THE WEIGHT OF PORTFOLIO TICKERS
WITH weight AS (
				SELECT ticker, 
                ((hc.value * hc.quantity)/( -- SUBQUERY WICH EXTRACTS CURRENT VALUE OF PORTFOLIO
										   SELECT   SUM(value*quantity)  AS position_value
										   FROM 		holdings_current AS hc
										   INNER JOIN 	account_dim      AS ad
										   ON 			ad.account_id = hc.account_id
										   WHERE 		ad.client_id  = 32
										   AND 		    hc.price_type = 'Adjusted'
										  ))-- END OF SUBQUERY WICH EXTRACTS CURRENT VALUE OF PORTFOLIO
										     AS 		ticker_weight
				FROM 		holdings_current AS hc
				INNER JOIN 	account_dim      AS ad
				ON 			ad.account_id = hc.account_id
				WHERE       ad.client_id  = 32
				AND         hc.price_type = 'Adjusted'
			   )

	-- TAKING THE SUM OF THE RETURN PER TCKER AND MULTIPLING BY THE TICKER WEIGHT.
	-- RETURNS ARE PROCENTAGE INCRESES IF POSETIVE AND PROCENTAGE DECREESES IF NEGATIVE.

SELECT  
				SUM(((it.value - it.lagg_price_12m)/it.lagg_price_12m) * ticker_weight) AS weighted_return_12m,
				SUM(((it.value - it.lagg_price_18m)/it.lagg_price_18m) * ticker_weight) AS weighted_return_18m,
				SUM(((it.value - it.lagg_price_24m)/it.lagg_price_24m) * ticker_weight) AS weighted_return_24m
FROM 		   ( -- SUBQUERRY CREATING LAGMPRICE
				SELECT 
                pd.ticker, 
                pd.date, 
                pd.value,
				LAG(pd.value, 250)OVER(
										PARTITION BY ticker
										ORDER BY pd.date
									  ) AS lagg_price_12m,
				LAG(pd.value, 375)OVER(
										PARTITION BY ticker
										ORDER BY pd.date
									  ) AS lagg_price_18m,
				LAG(pd.value, 500)OVER(
										PARTITION BY ticker
										ORDER BY pd.date
									  )   AS lagg_price_24m
				FROM	pricing_daily_new AS pd
				WHERE 	pd.price_type = 'Adjusted'
                ) -- END OF SUBQUERRY CREATING LAGMPRICE
				AS 		it
INNER JOIN 				holdings_current AS hc
ON 						hc.ticker     	 = it.ticker
INNER JOIN 				account_dim      AS ad
ON 						ad.account_id 	 = hc.account_id
INNER JOIN 				weight 		     AS w
ON 						w.ticker 	     = hc.ticker
WHERE 					it.date  	     = '2022-09-09'
AND 					ad.client_id     = 32
	-- IN THE PRESENTATION portfolio__return_12m IS USED FOR CLIENT 32 AS IT SHOWES THE 
	-- RETURN THE PORTFOLIO WOULD HAV HADE LOOKING ONE YEAR BACK
;




-- GETING THE % INCREASE IN TICKERS FOR SPESIFIC CUSTOMER
SELECT 
SUM(((pd.value - pd.lagg_price_12m)/pd.lagg_price_12m) * sp500_weight) AS returns_12m_sp500,
SUM(((pd.value - pd.lagg_price_18m)/pd.lagg_price_18m) * sp500_weight) AS returns_18msp500,
SUM(((pd.value - pd.lagg_price_24m)/pd.lagg_price_24m) * sp500_weight) AS returns_24msp500
FROM (SELECT ticker, date, value, price_type,
LAG(value, 250)OVER(
				    PARTITION BY ticker
				    ORDER BY     date
				    ) AS         lagg_price_12m,
LAG(value, 375)OVER(
					 PARTITION BY ticker
					 ORDER BY date
				   ) AS lagg_price_18m,
LAG(value, 500)OVER(
					 PARTITION BY ticker
					 ORDER BY date
				   ) AS lagg_price_24m
FROM pricing_daily_new 
WHERE price_type = 'Adjusted' 
)AS pd	
INNER JOIN security_masterlist AS sm
ON sm.ticker = pd.ticker		
WHERE pd.date  = '2022-09-09'
AND price_type = 'Adjusted'
AND sm.sp500_weight != 0
-- 
;


#
#
#
##
#
##
#

# Here we will find the risk, expected returns and the risk adjusted returns for our clients' tickers 
-- Used for the presentation 
#
##
#
##
#
#
#
#







-- STD and VAR per client for client 226 - yearly
SELECT a.ticker, a.security_name, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name, -- Case statement used 
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'
AND ad.client_id = 226
AND pdn.`date`>= 2021-09-09) AS a
GROUP BY ticker
;





-- STD and VAR per client for client 32 - yearly
SELECT a.ticker, a.security_name, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'
AND ad.client_id = 32
AND pdn.`date`>= 2021-09-09) AS a
GROUP BY ticker
;



-- STD and VAR per client for client 29 - yearly
SELECT a.ticker, a.security_name, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'
AND ad.client_id = 29
AND pdn.`date`>= 2021-09-09) AS a
GROUP BY ticker
;









#
#
#
#
#
#
#

# risk, expected returns and risk adjusted returns for clients' major and minor asset class 

#
#
#
#
#
#
#


-- major asset classes 226 - identification of the risk, expected returns abd risk adjusted returns for this client 
SELECT a.major_asset_class_adjusted, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name, -- case fixing mispelling errors 
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'
AND ad.client_id = 226
AND pdn.`date`>= 2021-09-09) AS a
GROUP BY a.major_asset_class_adjusted
;

-- major asset classes 32 - identification of the risk, expected returns abd risk adjusted returns for this client 
SELECT a.major_asset_class_adjusted, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,-- case fixing mispelling errors 
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'
AND ad.client_id = 32
AND pdn.`date`>= 2021-09-09) AS a
GROUP BY a.major_asset_class_adjusted
;



-- major asset classes 29 - identification of the risk, expected returns abd risk adjusted returns for this client 
SELECT a.major_asset_class_adjusted, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,-- case fixing mispelling errors 
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'
AND ad.client_id = 29
AND pdn.`date`>= 2021-09-09) AS a
GROUP BY a.major_asset_class_adjusted
;

--  minor asset class 226 - identification of the risk, expected returns abd risk adjusted returns for this client 
SELECT a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,-- case fixing mispelling errors 
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'
AND ad.client_id = 226
AND pdn.`date`>= 2021-09-09) AS a
GROUP BY a.major_asset_class_adjusted, a.minor_asset_class
; 
-- minor asset class 32 - identification of the risk, expected returns abd risk adjusted returns for this client 
SELECT a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,-- case fixing mispelling errors 
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'
AND ad.client_id = 32
AND pdn.`date`>= 2021-09-09) AS a
GROUP BY a.major_asset_class_adjusted, a.minor_asset_class
; 

-- minor asset class 29 - identification of the risk, expected returns abd risk adjusted returns for this client 
SELECT a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,-- case fixing mispelling errors 
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'
AND ad.client_id = 29
AND pdn.`date`>= 2021-09-09) AS a
GROUP BY a.major_asset_class_adjusted, a.minor_asset_class
; 




#######################################
-- no client's filter  -- sell or buy 
######################################

-- 3 queries showing the risk, expected return and risk adjusted returns with no mention of client id 
-- the following queries are order by: risk ASC, expected return DESC, and adjusted returns DESC 

-- risk 
SELECT a.ticker, a.security_name, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'

AND pdn.`date`>= 2021-09-09) AS a
GROUP BY ticker
ORDER BY risk ASC 
;

-- expected return 
SELECT a.ticker, a.security_name, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'

AND pdn.`date`>= 2021-09-09) AS a
GROUP BY ticker
ORDER BY expected_returns DESC
;


-- risk adjusted return 

SELECT a.ticker, a.security_name, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'

AND pdn.`date`>= 2021-09-09) AS a
GROUP BY ticker
ORDER BY risk_adjusted_retunrs DESC
;








############################################################################################

#PORTFOLIO

############################################################################################

-- porfolio risk, expected returns and portfolio_risk_adjusted_returns - client 266

WITH w AS (
				SELECT ticker, ((hc.value * hc.quantity)/ ( -- SUBQUERY WICH EXTRACTS CURRENT VALUE OF PORTFOLIO
															SELECT   SUM(value*quantity) AS position_value
															FROM 		holdings_current AS hc
															INNER JOIN 	account_dim AS ad
															ON 			ad.account_id = hc.account_id
															WHERE 		ad.client_id  = 226
															AND 		    hc.price_type = 'Adjusted'
															))-- END OF SUBQUERY WICH EXTRACTS CURRENT VALUE OF PORTFOLIO
                                                            AS 		    ticker_weight
				FROM 		holdings_current AS hc
				INNER JOIN 	account_dim AS ad
				ON 			ad.account_id = hc.account_id
				WHERE       ad.client_id  = 226
				AND         hc.price_type = 'Adjusted') 


,


r AS (SELECT a.ticker, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
					(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
				FROM
		(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,-- case fixing mispelling errors 
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
				FROM pricing_daily_new AS pdn
				INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
				INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
				INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
				WHERE pdn.price_type = 'Adjusted'
				AND ad.client_id = 226
				AND pdn.`date`>= 2021-09-09) AS a
				GROUP BY a.ticker,a.major_asset_class_adjusted, a.minor_asset_class) 

SELECT SUM(r.risk * w.ticker_weight) AS portfolio_risk, SUM(r.expected_returns * w.ticker_weight)AS portfolio_expected_returns, SUM(r.risk_adjusted_returns * w.ticker_weight) AS portfolio_risk_adjusted_returns
FROM r 
INNER JOIN w ON r.ticker = w.ticker
;


-- porfolio risk, expected returns and portfolio_risk_adjusted_returns - client 32

WITH w AS ( -- Portfolio ticker weight  
				SELECT ticker, ((hc.value * hc.quantity)/ ( -- SUBQUERY WICH EXTRACTS CURRENT VALUE OF PORTFOLIO
															SELECT   SUM(value*quantity) AS position_value
															FROM 		holdings_current AS hc
															INNER JOIN 	account_dim AS ad
															ON 			ad.account_id = hc.account_id
															WHERE 		ad.client_id  = 32
															AND 		    hc.price_type = 'Adjusted'
															))-- END OF SUBQUERY WICH EXTRACTS CURRENT VALUE OF PORTFOLIO
                                                            AS 		    ticker_weight
				FROM 		holdings_current AS hc
				INNER JOIN 	account_dim AS ad
				ON 			ad.account_id = hc.account_id
				WHERE       ad.client_id  = 32
				AND         hc.price_type = 'Adjusted') 


,


r AS (SELECT a.ticker, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
					(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
				FROM
		(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,-- case fixing mispelling errors 
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
				FROM pricing_daily_new AS pdn
				INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
				INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
				INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
				WHERE pdn.price_type = 'Adjusted'
				AND ad.client_id = 32
				AND pdn.`date`>= 2021-09-09) AS a
				GROUP BY a.ticker,a.major_asset_class_adjusted, a.minor_asset_class) 

SELECT SUM(r.risk * w.ticker_weight) AS portfolio_risk, SUM(r.expected_returns * w.ticker_weight)AS portfolio_expected_returns, SUM(r.risk_adjusted_returns * w.ticker_weight) AS portfolio_risk_adjusted_returns
FROM r 
INNER JOIN w ON r.ticker = w.ticker
;




-- porfolio risk, expected returns and portfolio_risk_adjusted_returns - client 29


WITH w AS (
				SELECT ticker, ((hc.value * hc.quantity)/ ( -- SUBQUERY WICH EXTRACTS CURRENT VALUE OF PORTFOLIO
															SELECT   SUM(value*quantity) AS position_value
															FROM 		holdings_current AS hc
															INNER JOIN 	account_dim AS ad
															ON 			ad.account_id = hc.account_id
															WHERE 		ad.client_id  = 29
															AND 		    hc.price_type = 'Adjusted'
															))-- END OF SUBQUERY WICH EXTRACTS CURRENT VALUE OF PORTFOLIO
                                                            AS 		    ticker_weight
				FROM 		holdings_current AS hc
				INNER JOIN 	account_dim AS ad
				ON 			ad.account_id = hc.account_id
				WHERE       ad.client_id  = 29
				AND         hc.price_type = 'Adjusted') 


,


r AS (SELECT a.ticker, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
					(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
				FROM
		(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,-- case fixing mispelling errors 
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
				FROM pricing_daily_new AS pdn
				INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
				INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
				INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
				WHERE pdn.price_type = 'Adjusted'
				AND ad.client_id = 29
				AND pdn.`date`>= 2021-09-09) AS a
				GROUP BY a.ticker,a.major_asset_class_adjusted, a.minor_asset_class) 

SELECT SUM(r.risk * w.ticker_weight) AS portfolio_risk, SUM(r.expected_returns * w.ticker_weight)AS portfolio_expected_returns, SUM(r.risk_adjusted_returns * w.ticker_weight) AS portfolio_risk_adjusted_returns
FROM r 
INNER JOIN w ON r.ticker = w.ticker
;

-- FIXED INCOME BY RISK YEARLY LOW TO HIGH TOP 10 SECURITIES 

SELECT a.ticker, a.security_name, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'

AND pdn.`date`>= 2021-09-09) AS a
WHERE major_asset_class_adjusted = 'fixed income'
GROUP BY ticker
ORDER BY risk ASC 
LIMIT 10
;


-- FIXED INCOME BY EXPECTED RETURNS YEARLY TOP 10 SECURITIES 

SELECT a.ticker, a.security_name, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'

AND pdn.`date`>= 2021-09-09) AS a
WHERE major_asset_class_adjusted = 'fixed income'
GROUP BY ticker
ORDER BY expected_returns DESC 
LIMIT 10
;


-- FIXED INCOME BY RISK ADJUSTED RETURNS (BY YEAR) TOP 10 SECURITIES 

SELECT a.ticker, a.security_name, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'

AND pdn.`date`>= 2021-09-09) AS a
WHERE major_asset_class_adjusted = 'fixed income'
GROUP BY ticker
ORDER BY risk_adjusted_returns DESC 
LIMIT 10
;


-- ALTERNATIVES BY RISK YEARLY LOW TO HIGH TOP 10 

SELECT a.ticker, a.security_name, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'

AND pdn.`date`>= 2021-09-09) AS a
WHERE major_asset_class_adjusted = 'alternatives'
GROUP BY ticker
ORDER BY risk ASC 
LIMIT 10
;


-- ALTERNATIVES BY EXPECTED RETURNS YEARLY TOP 10 SECURITIES  

SELECT a.ticker, a.security_name, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'

AND pdn.`date`>= 2021-09-09) AS a
WHERE major_asset_class_adjusted = 'alternatives'
GROUP BY ticker
ORDER BY expected_returns DESC 
LIMIT 10
;


-- ALTERNATIVES BY RISK ADJUSTED RETURNS (BY YEAR) TOP 10 SECURITIES 

SELECT a.ticker, a.security_name, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'

AND pdn.`date`>= 2021-09-09) AS a
WHERE major_asset_class_adjusted = 'alternatives'
GROUP BY ticker
ORDER BY risk_adjusted_returns DESC 
LIMIT 10
;


USE invest;

-- EQUITY BY RISK YEARLY LOW TO HIGH TOP 10 

SELECT a.ticker, a.security_name, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'

AND pdn.`date`>= 2021-09-09) AS a
WHERE major_asset_class_adjusted = 'equity'
GROUP BY ticker
ORDER BY risk ASC 
LIMIT 10
;


-- EQUITY BY EXPECTED RETURNS YEARLY TOP 10 

SELECT a.ticker, a.security_name, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'

AND pdn.`date`>= 2021-09-09) AS a
WHERE major_asset_class_adjusted = 'equity'
GROUP BY ticker
ORDER BY expected_returns DESC 
LIMIT 10
;


-- EQUITY BY RISK ADJUSTED RETURNS (BY YEAR) TOP 10  

SELECT a.ticker, a.security_name, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'

AND pdn.`date`>= 2021-09-09) AS a
WHERE major_asset_class_adjusted = 'equity'
GROUP BY ticker
ORDER BY risk_adjusted_returns DESC 
LIMIT 10
;


USE invest;

--  COMMODITIES LOW TO HIGH RISK YEARLY TOP 10 ON SECURITIES 

SELECT a.ticker, a.security_name, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'

AND pdn.`date`>= 2021-09-09) AS a
WHERE major_asset_class_adjusted = 'commodities'
GROUP BY ticker
ORDER BY risk ASC 
LIMIT 10
;


--  COMMODITIES BY EXPECTED RETURNS YEARLY TOP 10 ON SECURITIES

SELECT a.ticker, a.security_name, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'

AND pdn.`date`>= 2021-09-09) AS a
WHERE major_asset_class_adjusted = 'commodities'
GROUP BY ticker
ORDER BY expected_returns DESC 
LIMIT 10
;

 
-- COMMODITIES BY RISK ADJUSTED RETURNS (BY YEAR) TOP 10

SELECT a.ticker, a.security_name, a.major_asset_class_adjusted, a.minor_asset_class, STD((a.`value`-a.lag_price)/a.lag_price) AS risk, AVG((a.`value`-a.lag_price)/a.lag_price) AS expected_returns, 
(AVG((a.`value`-a.lag_price)/a.lag_price)) / (STD((a.`value`-a.lag_price)/a.lag_price)) AS risk_adjusted_returns
FROM
(SELECT pdn.`date`, 
		pdn.ticker, 
		sm.security_name,
							CASE WHEN major_asset_class = 'fixed_income'THEN 'fixed income' 
							WHEN major_asset_class ='alternatives' THEN 'alternatives'
							WHEN major_asset_class ='commodities' THEN 'commodities'
							WHEN major_asset_class ='fixed income' THEN 'fixed income' 
						    WHEN major_asset_class ='equity' THEN 'equity' 
							WHEN major_asset_class ='equty' THEN 'equity'
						    WHEN major_asset_class ='fixed income corporate' THEN 'fixed income'END AS major_asset_class_adjusted,
		sm.minor_asset_class, pdn.`value`, 
		LAG(pdn.`value`,250) 
		OVER(PARTITION BY pdn.ticker ORDER BY pdn.`date`) AS lag_price
																 
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
INNER JOIN holdings_current AS hc ON sm.ticker = hc.ticker
INNER JOIN account_dim AS ad ON hc.account_id = ad.account_id
WHERE pdn.price_type = 'Adjusted'

AND pdn.`date`>= 2021-09-09) AS a
WHERE major_asset_class_adjusted = 'commodities'
GROUP BY ticker
ORDER BY risk_adjusted_returns DESC 
LIMIT 10
;

#########

-- Adjusted portfolio 226 

######## 





# Used during the presentation for the adjusted portfolio for client 226  
# DROP VIEW IF EXISTS new_port_226;


CREATE VIEW new_port_226 AS 
SELECT pdn.date, pdn.value, pdn.ticker, pdn.price_type, sm.security_name, 
						CASE WHEN 	major_asset_class = 'fixed_income' THEN 'fixed income'
						WHEN 		major_asset_class ='alternatives' THEN 'alternatives'
						WHEN 		major_asset_class ='commodities' THEN 'commodities'
						WHEN 		major_asset_class ='fixed income' THEN 'fixed income' 
						WHEN 		major_asset_class ='equity' THEN 'equity' 
						WHEN 		major_asset_class ='equty' THEN 'equity'
						WHEN 		major_asset_class ='fixed income corporate' THEN 'fixed income'
                        END AS major_asset_class_adjusted,
		sm.minor_asset_class, 
						CASE WHEN	pdn.ticker ='AAAU' 	THEN	229
						WHEN		pdn.ticker ='ABT'	THEN	805
						WHEN		pdn.ticker ='BIL'	THEN	540
						WHEN		pdn.ticker ='BMY'	THEN	639
						WHEN		pdn.ticker ='DBC'	THEN	550
						WHEN		pdn.ticker ='DJP'	THEN	471
						WHEN		pdn.ticker ='FLSP' 	THEN	481
						WHEN		pdn.ticker ='GLD'	THEN	400
						WHEN		pdn.ticker ='SHV'	THEN	567
						WHEN		pdn.ticker ='MARB'	THEN	932
						WHEN		pdn.ticker ='MJ'	THEN	987
						WHEN		pdn.ticker ='MSVX'	THEN	138
						WHEN		pdn.ticker ='LBAY'	THEN	2952
						WHEN		pdn.ticker ='PFIX'	THEN	901
						WHEN		pdn.ticker ='PPLT'	THEN	529
						WHEN		pdn.ticker ='RINF'	THEN	590
						WHEN		pdn.ticker ='SHY'	THEN	731
						WHEN		pdn.ticker ='SVIX'	THEN	331
						WHEN		pdn.ticker ='UCO'	THEN	984
						WHEN		pdn.ticker ='UVIX'	THEN	689
						WHEN		pdn.ticker ='VAMO'	THEN	493
						WHEN		pdn.ticker ='YOLO'	THEN	281
						END AS quantity
FROM pricing_daily_new AS pdn
INNER JOIN security_masterlist AS sm ON pdn.ticker = sm.ticker
WHERE pdn.price_type = 'Adjusted'
AND pdn.ticker IN ('AAAU','ABT','BIL','BMY','DBC','DJP','FLSP','GLD','SHV','MARB','MJ','MSVX','LBAY','PFIX','PPLT','RINF',
					'SHY','SVIX','UCO','UVIX','VAMO', 'YOLO')
AND pdn.date = '2022-09-09';

-- find new weights per minor asset class for client 226
SELECT major_asset_class_adjusted, minor_asset_class, SUM(quantity*value)/(SELECT SUM(quantity*value) FROM new_port_226) AS percent_of_portfolio
FROM new_port_226
GROUP BY major_asset_class_adjusted, minor_asset_class
ORDER BY major_asset_class_adjusted; 





