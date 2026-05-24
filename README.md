# DramaBox_OTT_Analytics
OTT platform analytics pipeline -  Data Creation, Cleaning, MySQL Analysis,  Dashboards and Business Insights using  Python and SQL


## 📌 Project Overview
This is an end-to-end data analytics project built to simulate a real OTT platform analytics pipeline — from synthetic data creation to business insights and recommendations.

## 🎯 Business Problem
A micro drama OTT platform wants to understand:
- Which content and genre performs best?
- Where are users dropping off in the funnel?
- Which thumbnail drives more clicks? (A/B Test)
- Why are users churning and how to retain them?

## 📊 Dataset Details
| Table | Records | Description |
|-------|---------|-------------|
| Users | 6000 | Platform users across Indian cities |
| Content | 50 | Micro drama shows |
| Watch History | 6000 | User viewing activity |
| Clicks | 8000 | Thumbnail click data |
| Subscriptions | 6000 | Subscription and churn data |

## 🔄 Project Phases

### Phase 1 — Data Creation
- Created 5 realistic tables using Python Faker
- Simulated 6000+ user records across Indian cities
- Generated watch history, clicks and subscription data

### Phase 2 — Data Cleaning
- Handled missing values using fillna and median
- Removed duplicate records
- Fixed data types and standardized city names
- Capped outliers in watch time column
- Added derived columns like engagement level

### Phase 3 — SQL Analysis
- Loaded clean data into MySQL database
- Wrote 12 business queries covering:
  - User analysis by city and subscription
  - Content and genre performance
  - Daily active users trend
  - User funnel analysis
  - A/B test results
  - Churn rate analysis
  - Window functions and CTEs

### Phase 5 — Dashboards
- Built 5 dashboards using Matplotlib
- Platform overview, content performance
- User funnel, A/B test and churn analysis

### Phase 6 — Business Insights
- Derived actionable recommendations
- Content strategy suggestions
- Churn reduction strategies
- A/B test conclusions


## 📈 Dashboards

### Dashboard 1 — Platform Overview
<img width="2381" height="1476" alt="dashboard1_platform" src="https://github.com/user-attachments/assets/65588ff2-b1e7-4faa-a37d-cd426b6a39c3" />

### Dashboard 2 — Content Performance
![Content Performance](dashboards/dashboard2_content.png)

### Dashboard 3 — User Funnel
![User Funnel](dashboards/dashboard3_funnel.png)

### Dashboard 4 — A/B Test Results
![A/B Test](dashboards/dashboard4_abtest.png)

### Dashboard 5 — Churn Analysis
![Churn Analysis](dashboards/dashboard5_churn.png)
