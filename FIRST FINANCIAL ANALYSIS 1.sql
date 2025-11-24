SELECT * FROM financial_statement.financial_analysis;
SELECT * FROM financial_statement.financial_analysis LIMIT 5;
SELECT YEAR, Company,Revenue,
COALESCE(
ROUND(
(Revenue-LAG(Revenue) OVER (PARTITION BY COMPANY order by year))/NULLIF(LAG(Revenue) OVER (PARTITION BY Company order by year),0)*100,2),0)
AS Revenue_Growth_Percentage
from financial_analysis;
SELECT Company, year, 
ROUND(Net_Income/Revenue*100,2) AS Net_Profit_Margin
FROM financial_analysis;
SELECT Company, year, 
ROUND(Gross_Profit/Revenue*100,2) AS Gross_Margin
FROM financial_analysis;
SELECT Company, year, 
(CashFlow_Operating + CashFlow_Investing+ CashFlow_Financing) As TOTAL_CASH_FLOW
from financial_analysis;
Select Company, Year, Market_Cap_BUSD, Net_Income
FROM financial_analysis
Order by Company, Year; 
SELECT Company, Year, ROE
FROM financial_analysis 
Order by ROE;
SELECT Company, Year, Debt_Equity_Ratio
FROM financial_analysis
Order By Debt_Equity_Ratio DESC;
