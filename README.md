# 🛒 Retail Analytics: BlinkIT Grocery Data Analysis

## 📝 Project Overview
This project focuses on analyzing retail sales data for "BlinkIT" using advanced SQL queries. The primary goal is to extract actionable insights regarding sales performance, customer preferences, and outlet performance across various metrics.

The project workflow covers data cleaning to ensure accuracy, calculation of Key Performance Indicators (KPIs), and the application of advanced data manipulation techniques to support business decision-making.

---

## 🛠️ Tools & Technologies
* **Language:** SQL (T-SQL).
* **Database Management System (DBMS):** Microsoft SQL Server.
* **Technical Concepts Applied:**
  * Data Cleaning & Standardization.
  * Aggregations (`GROUP BY`).
  * Cross-tabulation/Pivoting (`PIVOT`).
  * Window Functions (`OVER()`).

---

## 🔍 Project Workflow

### 1. Data Cleaning
The `Item_Fat_Content` column was standardized to ensure data consistency. Variations like 'LF' and 'Low fat' were mapped to 'Low Fat', and 'reg' was updated to 'Regular'.

### 2. Key Performance Indicators (KPIs)
Standardized metrics were calculated to provide a high-level overview of business health:
* **Total Sales:** Aggregated revenue in millions.
* **Average Sales:** Mean transaction value.
* **Number of Items:** Total item count.
* **Average Rating:** Mean customer satisfaction score.

### 3. Detailed Analytics
Comprehensive queries were performed to answer specific business questions:
* **Sales Performance:** Breakdown of revenue by Item Type and Fat Content.
* **Pivot Analysis:** Using the `PIVOT` operator to compare 'Low Fat' vs 'Regular' sales across different outlet locations.
* **Trend Analysis:** Sales evaluation based on the Outlet Establishment Year.
* **Percentage Distribution:** Using window functions to determine the sales contribution percentage of each Outlet Size.
* **Operational Metrics:** A comprehensive view covering Total Sales, Average Sales, Average Rating, and Item Visibility categorized by Outlet Type.

---

## 🚀 How to Use
1. Create a new database in your SQL Server instance.
2. Import the `BlinkIT Grocery Data` dataset into a table named `[dbo].[BlinkIT Grocery Data]`.
3. Open `BlinkIT Grocery Data.sql` and execute the queries sequentially. Note: Ensure the cleaning script runs first to maintain data integrity.

---

## 💡 Business Insights
This analysis enables stakeholders to:
* Identify top-performing product categories.
* Evaluate the impact of outlet size and location on overall revenue.
* Understand customer consumption patterns regarding product fat content.
