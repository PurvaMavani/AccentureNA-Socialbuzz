# 📊 Social Buzz Content & Engagement Analysis

🚀 **End-to-End Data Analytics Project using Excel, SQL, and Tableau**

## 🔍 Project Overview
This project analyzes content performance, user engagement, and sentiment trends using a structured **data analytics pipeline**. The insights help in understanding the most engaging content, optimal posting times, and audience reactions.

## 📂 Dataset
The dataset consists of structured data containing:
- **Content Posts** – IDs, Categories, Types, and Post Dates
- **Reactions** – Type of Engagement (Likes, Shares, etc.)
- **Sentiment & Scores** – Audience perception metrics

## 🛠️ Tools & Technologies
- **📑 Data Cleaning & Preprocessing** – Microsoft Excel
- **🗄️ SQL Queries & Analysis** – MySQL / PostgreSQL
- **📊 Data Visualization** – Tableau Dashboards
- **📑 Reporting & Insights** – PowerPoint

## 🔥 Key Insights & Findings
✅ **Top Performing Categories** – Identified most engaging content types  
✅ **Peak Engagement Hours** – Determined best times for posting  
✅ **Sentiment Analysis** – Analyzed audience perception by content  
✅ **Reaction Trends** – Discovered most used engagement types  

## 📌 SQL Queries Used
```sql
-- Find the most popular content category by number of posts
SELECT Category_type, COUNT(*) AS total_posts
FROM contentinfo
GROUP BY Category_type
ORDER BY total_posts DESC;
```

```sql
-- Identify peak posting hours
SELECT HOUR(post_date) AS posting_hour, COUNT(*) AS total_posts
FROM contentinfo
GROUP BY posting_hour
ORDER BY total_posts DESC;
```

## 📊 Tableau Dashboard
![Tableau Visualization]()

## 📎 How to Use This Repository
1. Clone the repository:
   ```bash
   git clone https://github.com/purvamavani/AccentureNA-Socialbuzz.git
   ```
2. Import the SQL scripts to analyze data
3. Open Tableau to explore the dashboards
4. Review insights in the PowerPoint report

## 🎯 Future Improvements
- **🔍 Predictive Analysis** – Forecasting engagement trends
- **📈 Machine Learning Integration** – Sentiment classification models
- **🛠️ Automation** – Automate data pipeline using Python

## 🤝 Contributions
Feel free to **fork**, **star**, and contribute to this project. PRs are welcome! 🌟

## 📞 Contact
For any questions or collaborations, reach out on [LinkedIn](https://www.linkedin.com/in/purva-mavani-927128174/).
