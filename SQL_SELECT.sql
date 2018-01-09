/* Database: [BUDT758_DB_Student_051] */
use [BUDT758_DB_Student_051]
go

/* SELECT STATEMENTS FOR EACH BUSINESS TRANSACTION*/

/* 1. What are the universities for Master’s in Information Systems 
in descending order of average GRE score? */
/*
Report Name:Universities according to GRE-MSIS
*/

SELECT cd.univId, u.univName, cd.pgmId, cd.avgGREscore
FROM [dbo].[CollegePool.CourseDetails] cd JOIN [dbo].[CollegePool.University] u
ON cd.univId = u.univId
WHERE pgmId = 'MSIS'
ORDER BY cd.avgGREscore DESC

/* 2. What are the top 10 for MBA according to Journal ‘Poets & Quants’ for the Year 2016? */
/*
Report Name: Top 10 MBA according to Journal and Year
*/
SELECT TOP 10 pr.ranking, u.univName, l.ctyName, l.ctyState, pr.pgmId, j.journalName, pr.yearNumber
FROM [dbo].[CollegePool.PublishedRankings] pr JOIN [dbo].[CollegePool.University] u
ON pr.univId = u.univId 
JOIN [dbo].[CollegePool.Location] l
ON u.ctyId = l.ctyId
JOIN [dbo].[CollegePool.Journal] j
ON pr.journalId = j.journalId
WHERE pr.pgmId = 'MBA' 
AND j.journalName = 'Poets & Quants' 
AND pr.yearNumber = 2016
ORDER BY pr.ranking ASC

/* 3. What are the top MBA Universities according to U.S. News and the Cities they are situated in for 5 popular States- 
California, New York, Pennsylvania, Georgia & Texas? */
/*
Sample Journal: US News; Sample Program: MBA; Sample State: CA
Dashboard Name: Top MBA universities in 5 popular states as given by US News
*/
SELECT u.univName, l.ctyName, pr.ranking
FROM [dbo].[CollegePool.PublishedRankings] pr 
JOIN [dbo].[CollegePool.University] u
ON pr.univId = u.univId 
JOIN [dbo].[CollegePool.Location] l
ON u.ctyID = l.ctyId
WHERE pgmId = 'MBA' AND ctyState = 'CA' AND pr.journalId = 'J05'
ORDER BY pr.ranking ASC

/* 4. What are the top universities based on Rank from different Journals for Year 2017? */
/*
Sample Journal: US News; Sample Program: MBA
Dashboard Name: Top 10 universities of each program given by 2 journals
*/
SELECT  u.univName, pr.ranking
FROM [dbo].[CollegePool.PublishedRankings] pr JOIN [dbo].[CollegePool.University] u
ON pr.univId = u.univId
JOIN [dbo].[CollegePool.Journal] j
ON pr.journalId = j.journalId
WHERE pgmId = 'MBA' AND journalName = 'US News'
AND pr.yearNumber = 2017
ORDER BY pr.ranking ASC

/* 5. What are the Universities with their tuition fees according to 
their average GRE range */
/*
Sample GRE Range: (320 - 330]
Dashboard Name: MSIS Universities according to GRE Marks
*/

SELECT u.univName, cd.avgGREscore, cd.tuitionFee
FROM [dbo].[CollegePool.CourseDetails] cd JOIN [dbo].[CollegePool.University] u
ON cd.univID = u.univID
WHERE cd.avgGREscore > 320 AND cd.avgGREscore <= 330
ORDER BY cd.avgGREscore ASC

/* 6. What are the MBA Universities according to their tuition range  */
/*
Sample Tuition Fee Range: 100k to 150k
Dashboard Name: Universities according to their tuition fees (for MBA)
*/

SELECT u.univName, cd.tuitionFee
FROM [dbo].[CollegePool.CourseDetails] cd JOIN [dbo].[CollegePool.University] u
ON cd.univID = u.univID
WHERE cd.pgmID = 'MBA' AND
cd.tuitionFee > 100000 AND cd.tuitionFee <= 150000
ORDER BY cd.tuitionFee ASC

/* 7. What are the different universities for a particular program according to GPA Range */
/*
Sample Program: MSI; Sample GPA Range: less than 3.5
Dashboard Name: Universities according to GPA
*/

SELECT u.univName, cd.pgmId, cd.avgGPA
FROM [dbo].[CollegePool.CourseDetails] cd JOIN [dbo].[CollegePool.University] u
ON cd.univID = u.univID
WHERE cd.pgmId = 'MSIS' AND
cd.AvgGPA < 3.5 
ORDER BY cd.avgGPA ASC

