-- See all the data imported:

select * 
from [dbo].[BlinkIT Grocery Data]
 
--Data cleaning
--Cleaning the Item_Fat_Content field ensures data consistency and accuracy in analysis


update [dbo].[BlinkIT Grocery Data]
set [Item Fat Content]=
Case 
When [Item Fat Content] in ('LF','Low fat') Then 'Low Fat'
when [Item Fat Content] = 'reg' Then 'Regular'
Else [Item Fat Content]
End



--After executing this query check the data has been cleaned or not using below query


select Distinct ([Item Fat Content]) 
from [dbo].[BlinkIT Grocery Data]




-- KPI’s

--1.TOTAL SALES:

select Cast(Sum([Sales])/1000000 As decimal(10,2))  As Total_Sales_Millions
from [dbo].[BlinkIT Grocery Data]

--2.AVERAGE SALES

select CAst(Avg([Sales]) As decimal(10,1)) As Average_Sales
from [dbo].[BlinkIT Grocery Data]



--3.NO OF ITEMS

select Count(*) As NO_OF_ITEMS
from [dbo].[BlinkIT Grocery Data]


--4.AVG RATING

select Cast(Avg([Rating]) As decimal(10,1)) As  AVG_RATING
from [dbo].[BlinkIT Grocery Data]


--5. Total Sales by Fat Content:


select [Item Fat Content], Cast(Sum([Sales]) As decimal(10,2))  As Total_Sales_Millions
from [dbo].[BlinkIT Grocery Data]
group by [Item Fat Content]




--6.Total Sales by Item Type

select [Item Type], Cast(Sum([Sales]) As decimal(10,2))  As Total_Sales_Millions
from [dbo].[BlinkIT Grocery Data]
group by [Item Type]
 


 --7.Fat Content by Outlet for Total Sales


 SELECT [Outlet Location Type], 
       ISNULL([Low Fat], 0) AS Low_Fat, 
       ISNULL([Regular], 0) AS Regular
FROM 
(
    SELECT[Outlet Location Type] , [Item Fat Content], 
           CAST(SUM([Sales]) AS DECIMAL(10,2)) AS Total_Sales
    FROM [dbo].[BlinkIT Grocery Data]
    GROUP BY [Outlet Location Type] , [Item Fat Content]
) AS SourceTable
PIVOT 
(
    SUM(Total_Sales) 
    FOR [Item Fat Content] IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY [Outlet Location Type];




--8.Total Sales by Outlet Establishment


select[Outlet Establishment Year] , Cast(Sum([Sales]) As decimal(10,2))  As Total_Sales_Millions
from [dbo].[BlinkIT Grocery Data]
group by [Outlet Establishment Year]
order by [Outlet Establishment Year]



--9.Percentage of Sales by Outlet Size


SELECT 
    [Outlet Size], 
    CAST(SUM([Sales]) AS DECIMAL(10,2)) AS Total_Sales,
    CAST((SUM([Sales]) * 100.0 / SUM(SUM([Sales])) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM [dbo].[BlinkIT Grocery Data]
GROUP BY [Outlet Size]
ORDER BY Total_Sales DESC;




--10.Sales by Outlet Location


SELECT [Outlet Location Type], CAST(SUM([Sales]) AS DECIMAL(10,2)) AS Total_Sales
FROM [dbo].[BlinkIT Grocery Data]
GROUP BY [Outlet Location Type]
ORDER BY Total_Sales DESC




--11. All Metrics by Outlet Type:


SELECT [Outlet Type] ,
CAST(SUM([Sales])/1000 AS DECIMAL(10,2)) AS Total_Sales_Thousands,
		CAST(AVG([Sales]) AS DECIMAL(10,0)) AS Avg_Sales,
		COUNT(*) AS No_Of_Items,
		CAST(AVG([Rating]) AS DECIMAL(10,2)) AS Avg_Rating,
		CAST(AVG([Item Visibility]) AS DECIMAL(10,2)) AS Item_Visibility
FROM [dbo].[BlinkIT Grocery Data]
GROUP BY [Outlet Type]
ORDER BY Total_Sales_Thousands DESC




