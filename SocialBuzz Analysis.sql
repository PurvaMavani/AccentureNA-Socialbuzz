Create database Socialbuzz;

use Socialbuzz;

/*create table Contentinfo (
content_id varchar(50) primary key not null,
Reaction_Type varchar(15) not null,
Date_time  datetime not null,
Content_Type varchar(10) not null,
Category varchar(10) not null,
Sentiment varchar(10) not null,
Score int(2) not null);*/

CREATE TABLE contentinfo (
    content_id VARCHAR(50),
    user_id VARCHAR(50),
    category_type VARCHAR(50),
    content_type VARCHAR(20),
    reaction_type VARCHAR(255),
    post_date date,
    post_time time,
    sentiment_score int
);

SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'secure_file_priv';


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cleaned data set.csv git.csv table name_updated.csv'
INTO TABLE contentinfo
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT count(*) FROM contentinfo;
SELECT * FROM contentinfo
limit 15;

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------- A. Content Analysis --------------------------------------------------------------------------

-- Q1: Which Content category has the most posts?
SELECT category_type, COUNT(*) AS total_posts
FROM contentinfo
GROUP BY category_type
ORDER BY total_posts DESC
LIMIT 1;


-- Q2: How many posts were created each month?
SELECT DATE_FORMAT(post_date, '%Y-%m') AS month, COUNT(*) AS total_posts
FROM contentinfo
GROUP BY month
ORDER BY month;

-- Q3: What are the top 3 most common categories?
select category_type, count(*) as Total_posts
FROM contentinfo
group by category_type
order by Total_posts desc
limit 3;



-- ------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------- B. Reaction Analysis --------------------------------------------------------------------------

-- Q4: Which post received the highest number of reactions?
select content_id, count(reaction_type) as Total_reactions
FROM contentinfo
group by content_id
order by Total_reactions desc
limit 1;

-- Q5: What are the top 3 most common reaction types?
select reaction_type, count(*) as Total_reactions
FROM contentinfo
group by reaction_type
order by Total_reactions desc
limit 3


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------- c. Time-Based Analysis --------------------------------------------------------------------------

-- Q6: On which day of the week are the most posts created?
SELECT DAYNAME(post_date) AS weekday, COUNT(*) AS total_posts
FROM contentinfo
GROUP BY weekday
ORDER BY total_posts DESC;


-- Q7: What is the busiest posting hour of the day?

SELECT HOUR(post_time) AS hour, COUNT(*) AS total_posts
FROM contentinfo
GROUP BY hour
ORDER BY total_posts DESC
LIMIT 1;


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------- D. User Interaction Metrics/Sentiment & Scoring Metrics ------------------------------------------------------------------------

-- Q8: What is the average number of reactions per post?- 
select content_id, avg(count(reaction_type)) as avg_no_of_reactions
from contentinfo
GROUP BY content_id
ORDER BY avg_no_of_reactions desc;

-- Q9:What is the average sentiment score per content category?
SELECT Category_type, AVG(sentiment_score) AS avg_sentiment_score
FROM contentinfo
GROUP BY Category_type
ORDER BY avg_sentiment_score DESC;


-- Q10: What percentage of posts have at least one reaction?
SELECT 
    (COUNT(DISTINCT CASE WHEN Reaction_type IS NOT NULL THEN Content_id END) * 100.0 / COUNT(DISTINCT Content_id)) AS percentage_with_reactions
FROM contentinfo;


-- Q11:What is the most common sentiment for each content type?
SELECT Content_type, Sentiment, COUNT(*) AS sentiment_count
FROM contentinfo
GROUP BY Content_type, Sentiment
ORDER BY sentiment_count DESC;







