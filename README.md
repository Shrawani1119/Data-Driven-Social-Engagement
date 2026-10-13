# Data-Driven Social Engagement Initiative

An end-to-end data analytics project focused on analysing social media engagement, content performance, and audience sentiment using Python, SQL, Machine Learning, and Power BI.

## Project Overview

This project analyses social media post performance and audience comments to identify engagement patterns, compare content categories and media types, explore audience sentiment, and evaluate predictive modelling techniques. An interactive Power BI dashboard presents key metrics and analytical findings.

## Objectives

- Analyse social media engagement metrics, including likes, comments, shares, saves, reach, and impressions.
- Perform data validation, cleaning, and feature engineering.
- Compare engagement across content categories, media types, and publishing patterns.
- Analyse audience comment sentiment using VADER.
- Evaluate a Random Forest classification model for content performance prediction.
- Perform SQL-based aggregations, rankings, and trend analysis.
- Develop an interactive Power BI dashboard for data visualisation.
- Derive data-driven recommendations and document analytical limitations.

## Tools and Technologies

- **Programming:** Python
- **Data Analysis:** Pandas, NumPy
- **Data Visualisation:** Matplotlib, Seaborn, Power BI
- **Database:** MySQL
- **Machine Learning:** Scikit-learn, Random Forest
- **Sentiment Analysis:** VADER
- **Development Environment:** Jupyter Notebook

## Dataset

The primary dataset contains 29,999 social media post records and 23 columns, covering account attributes, content categories, media types, publishing information, engagement metrics, and performance labels.

A separate comment dataset was analysed to understand audience sentiment and explicit relatability patterns.

## Methodology

1. **Data Validation:** Examined missing values, duplicate records, unique identifiers, and date ranges.
2. **Feature Engineering:** Created like rate, share rate, save rate, comment rate, and a weighted virality score.
3. **Exploratory Data Analysis:** Compared engagement patterns across categories, media types, and publishing contexts.
4. **SQL Analysis:** Used aggregate functions, grouping, subqueries, window functions, ranking, and date-based queries.
5. **Sentiment Analysis:** Applied VADER to classify comments as positive, neutral, or negative.
6. **Predictive Modelling:** Evaluated a Random Forest classifier using pre-publication features.
7. **Dashboard Development:** Created a Power BI dashboard with KPI cards, comparison charts, monthly trends, and interactive slicers.

## Key Findings

- Music recorded the highest observed average engagement rate among the analysed categories, at **4.28%**.
- Fashion recorded the highest total shares and saves in the category comparison.
- Reels and images showed very similar average engagement rates.
- Comment sentiment across 9,960 cleaned comments was **46.2% neutral, 34.1% positive, and 19.7% negative**.
- The Random Forest classifier achieved **23.88% accuracy**, indicating limited predictive performance in this experiment.

These findings are descriptive and do not establish that a particular content category or media type causes higher engagement.

## Power BI Dashboard

The interactive dashboard includes:

- Total Posts
- Average Engagement Rate
- Total Shares
- Total Saves
- Total Followers Gained
- Average Engagement by Content Category
- Average Engagement by Media Type
- Monthly Engagement Trends
- Interactive filters for content category, media type, and date range

## Limitations

- The analysis is observational and cannot establish causation.
- The predictive model demonstrated limited performance.
- The relatability detector used conservative text patterns and requires further validation.
- Sentiment analysis may misinterpret sarcasm, slang, context, and multilingual comments.
- The results may not generalise to other platforms or audiences.

## Future Scope

- Improve predictive performance through feature engineering and baseline comparisons.
- Validate sentiment and relatability classifications using manually labelled comments.
- Conduct controlled A/B testing of content strategies.
- Extend dashboard functionality with additional metrics and drill-through analysis.
- Explore suitable time-series forecasting techniques.

## Author

**Shrawani Lende**

Computer Engineering Student

Interests: Data Analytics, Python, SQL, Machine Learning, and Power BI.
