# Employee Attrition Analysis in R
By Serena Vyusha Chintala

This project explores key factors contributing to employee attrition using R and a dataset sourced from Kaggle. The goal is to help HR and management teams understand patterns in employee turnover and develop data-driven retention strategies.

---

## Dataset

- **Source:** [Kaggle – Employee Attrition Dataset](https://www.kaggle.com/datasets/patelprashant/employee-attrition)
- **Records:** 1,470 employees
- **Features:** 19 columns including age, job role, department, income, overtime, tenure, and attrition status

---

## Business Problem

High attrition can result in major losses to productivity, hiring costs, and morale. This analysis answers:

- What demographic or job-related factors are most linked to attrition?
- Are there specific departments or job roles more affected?
- How do overtime, salary hikes, and tenure influence turnover?

---

## Tools & Packages Used

- **Language:** R
- **Libraries:** `tidyverse`, `ggplot2`, `readr`, `ggcorrplot`

---

## Visualizations & Key Findings

### Age vs. Attrition
- Highest attrition observed between **ages 25 to 40**
- Younger employees are more likely to leave

![Boxplot](https://github.com/serenavyuhachintala/employee-attrition-analysis-r/blob/main/age%20grouo_attrition%20rate.png?raw=true)

---

### Department-Level Churn
- **Sales** department see the highest attrition
- Job roles within departments influence turnover rates

![Bar Chart](https://github.com/serenavyuhachintala/employee-attrition-analysis-r/blob/main/department_attrition.png?raw=true)
---

### Overtime Impact
- Employees working overtime are **significantly more likely** to quit

![Bar Chart](https://github.com/serenavyuhachintala/employee-attrition-analysis-r/blob/main/overtime_attrition.png?raw=true)

---

### Tenure and Attrition
- Longer tenure reduces churn risk
- New employees are more likely to leave early on

![Line Chart](https://github.com/serenavyuhachintala/employee-attrition-analysis-r/blob/main/tenure_attrition.png?raw=true)
---

### Correlation Matrix
- Strong positive relationships:
  - `JobLevel` ↔ `MonthlyIncome` (0.95)
  - `TotalWorkingYears` ↔ `YearsAtCompany`
- Salary hike and performance rating also correlate well

![Heatmap](https://github.com/serenavyuhachintala/employee-attrition-analysis-r/blob/main/correlation%20matrix.png?raw=true)

---

## Recommendations

- Improve onboarding and engagement for employees aged **25–40**
- Reevaluate overtime policies to reduce burnout
- Encourage career progression to reduce early exits
- Offer meaningful salary hikes tied to performance
- Strengthen manager-employee relationships (shown to reduce attrition)

---

## Project Files

- `attrition_analysis.R` – Full R script for data cleaning, visualization, and analysis
- `/presentation/employee-attrition-presentation.pdf` – Final slide deck from academic work 
- `/images/` – Key visuals for README and external sharing

---

## Next Steps

- Integrate predictive modeling using Logistic Regression or Random Forest
- Build a Shiny app to allow dynamic exploration
- Extend to a broader HR dashboard with KPIs

---

## About Me

I'm Serena Vyusha Chintala, a Business Analytics master's graduate with experience in tech support, AI/ML, and data analytics and data storytelling. I specialise in creating actionable insights through data.

📊 Tableau Public: [View Projects](https://public.tableau.com/app/profile/serena.vyuha.chintala)  
💼 LinkedIn: [Connect](https://www.linkedin.com/in/serenavyuhachintala/)

---
