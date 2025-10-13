# 🚴‍♂️ Bike Sales Dashboard – Power BI Project
This project focuses on analyzing bike sales performance, delivery efficiency, and staff productivity within a multi-store retail network. The main objective is to uncover the key performance drivers affecting sales, fulfillment, and employee output, and to recommend actionable strategies for improvement.
The analysis integrates Oracle SQL for structured data extraction and transformation, Python for exploratory data analysis and validation, and Power BI for dashboard creation using DAX-based KPIs.
By combining advanced data modeling, analytical processing, and interactive visualization, the project delivers a holistic business intelligence solution that empowers decision-makers to monitor operations, track performance, and enhance overall efficiency.

# Data Pipeline & Tools

The data pipeline was designed to ensure accuracy, scalability, and transparency across all analytical layers.

Data Source and Storage:
Raw transactional data was stored in Oracle SQL, covering entities such as Customers, Orders, Order_Items, Products, Stocks, Staffs, Stores, Brands, and Categories. The data model followed a star schema structure, with Orders and Order_Items serving as fact tables connected to related dimensions.

Data Cleaning and Transformation:
In SQL, duplicate and null values were removed, and CTEs (Common Table Expressions) were created for pre-aggregations like total sales by store and late orders by month.
In Power Query, column names were standardized, data types were adjusted, and conditional columns were created for order status and delivery performance. This ensured data integrity and smooth model loading into Power BI.

Exploratory Data Analysis (Python):
Python was used to perform consistency checks between SQL and Power BI results, calculate summary statistics, and validate key KPIs such as total sales, on-time delivery rates, and average fulfillment days.

Power BI Modeling:
Relationships between tables were established using unique keys. Additional calculated columns (e.g., Fulfillment Days, On-Time Flag, Delivery Status) and DAX measures were implemented to create advanced business metrics and performance ratios.

# Key DAX Measures & Ratios

The project included several essential DAX measures to quantify sales and operational performance. Among them were total sales, average sales per staff, on-time delivery rate, total late and pending orders, and average fulfillment time.
Each measure provided a clear and actionable insight into business operations — for example, the On-Time Rate (%) quantified delivery punctuality, while the Average Sales per Staff metric highlighted workforce efficiency.
These measures collectively enabled dynamic segmentation of performance across stores, categories, and individual staff members.

# Insights & Findings

The analysis revealed several critical patterns and operational insights:

Delivery Performance:
Delivery efficiency was a major concern, with only about 30% of orders delivered on time. A total of 1,351 orders were classified as late, and 508 orders remained pending. The average fulfillment time was approximately 2 days, with late deliveries strongly correlated with increased store workload and stock shortages.

Staff and Store Performance:
Staff productivity analysis identified Marcelene Boyer as the top-performing employee, achieving the highest delivery success rate. Among stores, Baldwin Bikes led with 5.22 million in total sales, followed by Santa Cruz Bikes with 1.61 million and Rowlett Bikes with 0.87 million.

Sales and Product Trends:
Sales were dominated by Mountain Bikes and Road Bikes, together contributing the largest share of total revenue. Stores with better stock management and balanced workloads achieved consistently higher on-time delivery rates and customer satisfaction levels.

Operational Challenges:
Stock shortages and delayed fulfillment cycles were key drivers of performance issues. Seasonal trends also indicated peak sales months that required more efficient logistics and inventory planning.

# Dashboard Features

The Power BI dashboard was designed to present insights clearly and interactively through five main pages:

1. Customer Trends: Highlights customer purchase frequency, loyalty, and order value distribution.
2. Sales Performance: Displays revenue trends, top-performing product categories, and overall profitability.
3. Stock Management: Tracks inventory levels, out-of-stock products, and restock efficiency.
4. Delivery and Order Fulfillment: Visualizes order timelines, late delivery ratios, and fulfillment patterns over time.
5. Staff and Store Efficiency: Compares staff-level KPIs, on-time delivery performance, and sales contribution by store.

Each page includes dynamic filters by Store, Staff, Category, and Date, enabling users to drill down into specific operational dimensions. KPI cards summarize the most critical metrics — for instance, “On-Time Rate 30%” or “Baldwin Bikes: 5.22M Total Sales” — providing a clear performance snapshot at a glance.

# Conclusion

The Bike Sales Analysis Project demonstrates a complete analytics lifecycle, from data extraction and preparation in Oracle SQL, through data validation and analysis in Python, to KPI visualization in Power BI.
The integrated dashboard empowers management to monitor business performance in real time, identify inefficiencies, and design targeted interventions to improve delivery punctuality, sales productivity, and stock optimization.
Ultimately, this solution transforms raw transactional data into a unified decision-support system, enabling evidence-based strategic planning and long-term operational improvement across the organization.
