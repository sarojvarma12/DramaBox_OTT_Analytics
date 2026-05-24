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
<img width="2377" height="887" alt="dashboard2_content" src="https://github.com/user-attachments/assets/5e949199-d539-4df3-aa50-af9016936618" />

### Dashboard 3 — User Funnel
<img width="1485" height="1036" alt="dashboard3_funnel" src="https://github.com/user-attachments/assets/f00b2986-0aaa-4e51-8260-c0bffdba0b84" />

### Dashboard 4 — A/B Test Results
<img width="1784" height="786" alt="dashboard4_abtest" src="https://github.com/user-attachments/assets/f453ae57-943a-47cf-b58b-526c639d4165" />

### Dashboard 5 — Churn Analysis
<img width="1784" height="741" alt="dashboard5_churn" src="https://github.com/user-attachments/assets/520b1ed8-e15e-48d6-bdc4-4fb22d1ec638" />

