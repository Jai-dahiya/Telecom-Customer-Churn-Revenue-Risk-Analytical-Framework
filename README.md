# 📊 Telecom Customer Churn & Revenue Risk Analysis

## 📌 Project Overview
Customer churn is a critical metric for telecommunications companies. This project analyzes a dataset of 7,000+ telecom customers to identify key drivers of churn, estimate the associated revenue at risk, and provide actionable, data-driven retention strategies. 

By integrating SQL for data extraction, Python for feature engineering, and Power BI for visualization, this analysis bridges the gap between raw database metrics and strategic business decisions.

## 🛠️ Tech Stack & Tools
* **Database:** SQL (Joins, Subqueries, Case Statements)
* **Data Processing & Engineering:** Python (Pandas)
* **Statistical Analysis & Modeling:** Advanced Excel (Pivot Tables, What-If Analysis, Chi-Square, Correlation)
* **Data Visualization:** Power BI

## ⚙️ Methodology

### 1. Data Extraction & Preparation (SQL & Python)
* Extracted and merged customer profiles, billing information, and usage metrics from a relational database using complex SQL queries.
* Cleaned the extracted data and engineered new churn-risk features using Python (Pandas) to prepare the dataset for statistical modeling.

### 2. Statistical Analysis (Excel)
* Conducted exploratory data analysis (EDA) and applied statistical tests (Chi-Square, correlation analysis) to isolate significant churn drivers.
* **Key Drivers Identified:** Contract type, customer tenure, and support ticket volume.
* Built dynamic revenue-at-risk estimation models using Advanced Excel pivot tables and what-if scenarios.

### 3. Visualization & Strategy (Power BI)
* Designed an interactive Power BI dashboard to visualize churn KPIs and revenue risk segmented by customer demographics and behavior.
* Translated data findings into targeted retention-strategy recommendations projected to significantly reduce monthly revenue loss.

## 📈 Dashboard Preview
*(Add a screenshot of your Power BI dashboard here. Example format below)*
`![Power BI Dashboard](link-to-your-image.png)`

## 💡 Key Business Recommendations
1.  **Contract Incentives:** *(e.g., Encourage month-to-month users to switch to 1-year contracts through targeted discounts).*
2.  **Support Optimization:** *(e.g., Flag customers with 3+ support tickets in a month for proactive account management check-ins).*
3.  **Tenure Milestones:** *(e.g., Implement a loyalty reward at the 6-month mark, a historical drop-off point).*

## 🚀 How to Run the Project
1.  Review the SQL scripts in the `/sql` directory to see the data extraction logic.
2.  Open the Jupyter Notebook in `/notebooks` to view the Python data cleaning and feature engineering steps.
3.  The final visualizations can be viewed in the `/dashboards` folder. *(Note: Raw customer data is not included in this repository to protect privacy).*
