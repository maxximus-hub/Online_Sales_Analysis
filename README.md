# Online Sales Analysis

## Table of Contents

- [Project Overwiew](#project-overview)
- [Data Sources](#data-sources)
- [Tools](#tools)
- [Data Cleaning](#data-cleaning)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Data Analysis](#data-analysis)
- [Results](#results)
- [Recommendations](#recommendations)

### Project Overview

This project provides insights into the online sales transactions and retail performance of a business. It aids in understanding the company performance, customer purchase patterns, which will then lead to making data-driven recommendations for the business.

### Data Sources

The primary dataset used for this analysis is the 'online_sales_dataset.csv' file. It contains information about each sales transaction made by the business.

### Tools

- PostgreSQL - Data Cleaning, Data Analysis
  -  [Download here](https://postgresql.org)
- PowerBI - Creating a report 
  - [Download here](https://microsoft.com)


### Data Cleaning

In the process of data cleaning and preparation, I performed the following tasks:
1. Data loading and data staging (to avoid tampering with original data)
2. Data cleaning
3. Handling duplicates
4. Standardization of data
5. Handling null and missing values


### Exploratory Data Analysis

Exploratory data analysis was carried out on the online sales data to answer questions like:
1. What is the net sales?
2. What is the top selling product?
3. Which countries are buying from the business the most?
4. Which sales channel is generating the most sales?
5. Do discounts impact sales?
6. What is the value and percentage of products that were returned?

### Data Analysis
The data contains different payment methods, this query was written to find the percentage of orders processed through each payment method

```sql
SELECT
  payment_method,
  COUNT(*) AS order_count,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percent_of_orders
FROM online_sales1
WHERE return_status != 'Returned'
GROUP BY payment_method
ORDER BY percent_of_orders DESC;
```

### Results

1. Customers favour using bank transfers to make payments for orders.
2. Discounts have a huge impact on sales, as over 98.9% of total sales made had discounts attached. Only about 1.02% of sales were processed without discounts.
3. More sales were made online than in-store.

### Recommendations

After conducting analysis, the following actions are recommended:
- Having over 98% sales with discounts and only 1.02% without discounts might show that customers don't perceive the product as valuable enough to pay in full without discounts. Review pricing strategy and ensure full price is not too high for the value of products. This will help the business avoid training customers to wait for discounts.
- Strengthen brand value
- Check if competitors are offering better value and pricing, and adjust accordingly.
- Add premium features for customers who pay in full.
- Improve online user experience and make smart product recommendations for online buyers
- Offer in-store only promotions to drive traffic at the physical store.
