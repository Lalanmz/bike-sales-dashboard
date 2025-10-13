# 🚴‍♂️ Bike Sales Dashboard – Power BI Project
This project focuses on analyzing bike sales performance, delivery efficiency, and staff/store productivity using a fully integrated data analytics pipeline. The analysis aims to uncover actionable insights into customer demand, fulfillment delays, inventory management, and employee performance. The project leverages Oracle SQL for data extraction and transformation, Python for exploratory data analysis and validation, and Power BI for interactive visual dashboards powered by DAX and Power Query transformations.

Through a comprehensive data model, the solution provides a clear view of sales trends, delivery timelines, stock availability, and staff efficiency, supporting management decisions across multiple operational areas.

Data Pipeline & Tools
Data Source & Modeling

Database: Oracle SQL

Datasets: Customers, Orders, Order Items, Products, Stocks, Staffs, Stores, Brands, and Categories.

Data was cleaned, transformed, and normalized using SQL joins and CTEs before loading into Power BI.

Data Preparation

Oracle SQL used for:

Cleaning duplicates, correcting nulls, and ensuring referential integrity.

Creating views for key performance areas (e.g., Sales by Store, Delivery Delays, and Staff KPIs).

Power Query in Power BI used for:

Data type alignment and column derivations (e.g., Order Status, Fulfillment Days, Delay Classification).

Merging multiple related tables into a star schema data model.

Exploratory Analysis (Python)

Python was used for initial exploratory analysis:

Verified data consistency across SQL and Power BI layers.

Generated descriptive statistics on sales, delivery times, and product categories.

Validated DAX-based KPIs by comparing with Python-calculated aggregates.

Key Power BI Dashboards
1. Customer Trends

Analyzes customer order patterns and total purchase volume.

Segments top buyers and loyal customers based on order frequency and total spend.

2. Sales Performance

Tracks overall revenue and profit by product, brand, and category.

KPIs include Total Sales, Profit Margin %, Average Order Value, and Monthly Sales Trends.

Visuals highlight best-selling and underperforming product categories.

3. Stock Management

Displays current inventory levels and product availability by store.

KPIs include Total Stock Units, Out-of-Stock Alerts, and Category-Level Stock Ratios.

Enables proactive restocking decisions and optimization of supply chain flow.

4. Delivery and Order Fulfillment

Focuses on order delivery performance metrics:

Average Fulfillment Days

On-Time Rate (%)

Late and Pending Orders

Time-series visualization of late orders by month.

Segmented analysis of delivery performance by product category and month.

5. Staff and Store Efficiency

Evaluates employee and store-level sales productivity.

KPIs:

On-Time Rate (%)

Average Sales per Staff

Top Performer (Staff)

Top Performing Store

Visuals:

Comparison of total sales and order count per store.

Trendline for on-time rate improvements over months.

Staff performance table with detailed metrics.

Key DAX Measures & Ratios

Total Sales = SUM ( 'Order_Items'[sales] )

Average Sales per Staff = [Total Sales] / DISTINCTCOUNT ( Staff[staff_id] )

On-Time Rate % = DIVIDE ( [On-Time Orders], [Total Orders] )

Late Orders = COUNTROWS ( FILTER ( Orders, Orders[Status] = "Late" ) )

Pending Orders = COUNTROWS ( FILTER ( Orders, Orders[Status] = "Pending" ) )

Fulfillment Days = DATEDIFF ( Orders[Order Date], Orders[Delivery Date], DAY )

Insights & Findings

Delivery Delays: Late orders accounted for 1,351 cases, indicating logistics and fulfillment delays that need optimization.

On-Time Performance: Overall on-time delivery rate stood at 30%, with opportunities for improvement in planning and inventory coordination.

Staff Efficiency: Marcelene Boyer identified as the top-performing staff with the highest on-time rate and total orders fulfilled.

Store Performance: Baldwin Bikes led with 5.22M total sales, followed by Santa Cruz Bikes (1.61M) and Rowlett Bikes (0.87M).

Category Analysis: Mountain Bikes and Road Bikes showed the highest order volumes and revenue contributions.

Inventory Control: Some product categories showed consistent stock shortages linked with late deliveries.

Dashboard Features

Fully interactive Power BI interface with page navigation and dynamic slicers.

KPI cards with tooltips for quick insights (e.g., “30% of orders delivered on time”).

Comparative visuals for store performance and staff efficiency.

Integrated data storytelling through DAX-driven metrics.

Conclusion

This project demonstrates a complete end-to-end business intelligence solution — from database management in Oracle SQL, data validation and exploration in Python, to Power BI dashboarding enhanced with DAX analytics.




