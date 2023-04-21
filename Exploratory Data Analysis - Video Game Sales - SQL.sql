-- SQL Skills: Views, Stored Procedures, Aggregate Functions, Subqueries, etc. 

create database dataproject; 

use dataproject; 



--Q1: Create a view with the name, publisher, year of video games released in 2007. 

Create View VideoGame as 
Select name, publisher, year from vgsales1
where year = '2007'


GO

-- Q2: Create a view with the Name, platform, year of the video games published by Microsoft Game Studios in 2009. 
Create View PublishedVideoGames as
Select name, platform, year from vgsales1
where publisher = 'Microsoft Game Studios' and year = '2009'

Select * from PublishedVideoGames

GO

--Q3: Create a Stored procedure that lists the name, genre, publisher of games released by Nintendo called the Legend of Zelda anywhere in its name. 

Create Procedure VideoGames2 @name nvarchar(100), @genre nvarchar(50), @publisher nvarchar(50)

as Select name, genre, Publisher from vgsales1 where name like '%' + @name + '%' and genre = @genre and publisher = @publisher


EXEC VideoGames2 @name = '%The Legend of Zelda%', @genre = 'Action', @publisher = 'Nintendo'

GO

--Q4: Create a Stored Procedure that list all of the details of the video games released by Microsoft in the Shooter Genre. 

Create Procedure MicrosoftVideoGames @publisher nvarchar(50), @genre nvarchar(50)

as Select * from vgsales1 where publisher = @publisher and genre = @genre

EXEC  MicrosoftVideoGames @genre = 'Shooter', @publisher = 'Microsoft Game Studios'



-- Q2: What was the best selling video game worldwide? Round global sales numbers to 2 decimal places. 
Select name, ROUND(global_sales,2) as World_Wide_Sales from vgsales1 where global_sales= (Select MAX(global_sales) from vgsales1); 




-- Q3: List all the details for the video games that were published by Nintendo and released between 2007 and 2010

Select * from vgsales1 where Publisher = 'Nintendo' and Year between 2007 and 2010;





-- Q4: List the name, publisher, North American (NA-Sales), and the year video games were published by Take-Two Interactive in 2007.  List  North America Sales Numbers by desc order. 

Select name, publisher, year, NA_Sales from vgsales1 where publisher = 'Take-Two Interactive' and YEAR = '2007' order by NA_Sales desc; 




-- Q5: List the name, global_sales and platform for the video games that have global_sales higher then 30 (million) in the sports genre.

Select name, global_sales, platform, genre from vgsales1 where Genre = 'Sports' and global_sales > 30; 



-- Q6: Count the number of video games published by Microsoft in 2008 in different genres. 
 
Select count(Name) as Number_of_Video_Games, year, genre from vgsales1 where Publisher = 'Microsoft Game Studios' and year = '2008'  group by year, genre;


-- Q7: What was the best-selling video game worldwide on the SNES
Select name, MAX(global_sales) as Top_Selling_Video_Game, platform from vgsales1 where global_sales = (Select MAX(global_sales) from vgsales1 where platform = 'SNES') group by name, platform; 



-- Q8: What was the best selling video game published by Microsoft Game Studios in Europe in 2010?
Select name, MAX(EU_sales), publisher, year from vgsales1 where EU_Sales = (Select MAX(EU_Sales) from vgsales1 where publisher = 'Microsoft Game Studios' and Year = '2010' ) group by name, publisher, year

-- Q9: count the number of titles published by Microsoft Game Studios in the Shooter Genre in 2010

Select genre, count(name) 
from vgsales1
where publisher = 'Microsoft Game Studios' and genre = 'Shooter' and year = '2010'
group by genre; 

-- Q10: count the number of titles released on the Nintendo 3ds in the sports genre in 2013
select genre, count(name), year
from vgsales1
where platform = '3ds' and genre = 'Sports' and year = '2013'
group by genre, year

-- Q11: List the name and NA-Sales for the video games that have NA_sales higher then 20 (million) from each genre

Select name, NA_Sales, genre from vgsales1 group by genre, NA_Sales, name having NA_Sales > 20

-- Q12: List the name, global sales and genre for the video games that have global_sales between 20 and 40 (million) from each genre 

Select name, global_Sales, genre from vgsales1 group by name, global_Sales, genre having global_sales between 20 and 40;

-- Q13: List the name, platform, publisher and year of the video games that were published by Sony Computer Entertainment or Microsoft Game Studios in 2007.

select name, platform, publisher, Year from vgsales1 where year = '2007' and (publisher = 'Microsoft Game Studios' or publisher = 'Sony Computer Entertainment' )

-- Q14: List all of the details for the video games published by Take Two Interactive and Sony Computer Entertainment in 2006. 

Select * from vgsales1 where Year = '2006' and (publisher = 'Take-Two Interactive' or publisher = 'Sony Computer Entertainment')

-- Q15: count the number of different genres in this dataset

Select count(distinct(genre)) as Number_of_Different_Genres from vgsales1

-- Q16: count the number of different platforms in this dataset

Select count(distinct(platform)) as Number_of_different_platforms from vgsales1

-- Q17: What is the average global sales for video games in the Racing Genre published by Sony Computer Entertainment in 2001

Select genre, AVG(Global_Sales) from vgsales1 where publisher = 'Sony Computer Entertainment' and genre = 'Racing' and year = '2001' group by genre; 

-- Q18: What is the average NA_Sales for video games in the Action  Genre published by Microsoft Game Studios in 2004

Select genre, AVG(NA_Sales) from vgsales1 where publisher = 'Microsoft Game Studios' and genre = 'Action' and year = '2004' group by genre; 

-- Q19: What are the total global sales by genre in this dataset? List Sales in Ascending Order

Select genre, SUM(global_sales) as Total_Sales from vgsales1 group by genre order by Total_Sales asc 

-- Q20: Display the top 10 publishers with NA_Sales in this dataset  List NA_Sales in Descending Order. Rank Total Sales in desc order. 

Select top 10 SUM(NA_Sales) as North_American_Sales, DENSE_RANK() OVER (
		ORDER BY SUM(NA_Sales) DESC) as Rank_of_NA_Sales, Publisher  from vgsales1 group by Publisher order by SUM(NA_Sales) desc 

--Q21: Display top 5 video game EU sales by genre. List EU_Sales in descending order. Rank EU Sales in descending order. 

Select top 5 SUM(EU_Sales) as European_Sales, DENSE_RANK() OVER(ORDER BY SUM(EU_Sales) desc) as Rank_of_EU_Sales, Genre from vgsales1 group by genre order by SUM(EU_Sales) desc;; 

-- Q22: List all of the details for the video games in this dataset that start with the letter "W" and released on the PS4. 

Select * from vgsales1 where name like 'W%' and Platform = 'PS4';

-- Q23: List all of the details for the video games that end with the letter 'B' in this entire dataset. 

Select * from vgsales1 where name like '%B' 

-- Q24: List the name, platform of the video games that contains the word "MLB" anywhere in it name. 

Select name, platform from vgsales1 where name like '%MLB%'

-- Q25: List the name, platform, publisher, year that has the letter 'O' in its second position. 

Select name, platform, publisher, year from vgsales1 where name like '_o%'

--Q26: What was the best selling video game in North America on the PS4?

Select name, NA_Sales from vgsales1 where NA_Sales = (Select MAX(NA_Sales) from vgsales1 where platform = 'PS4'); 



