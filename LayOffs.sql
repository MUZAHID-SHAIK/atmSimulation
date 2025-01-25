select * from layoffs;
##craete a duplicate table with same data
create table LayoffsDup like layoffs;
select * from LayoffsDup;
## Inserting data of previous table to new Table
insert LayoffsDup select * from layoffs;

select * ,row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,date,stage,country,funds_raised_millions)AS row_num
from LayoffsDup;
## checking whther the comapany has duplicates more than one
with duplicate_cte As
(select * ,row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,date,stage,country,funds_raised_millions)AS row_num
from LayoffsDup
)
select * from duplicate_cte where row_num>1;
select * from LayoffsDup where company='Yahoo';
## we have to search like line 13 for every company whos row_ num is more than 1
## Yahoo has 2 duplicates
select * from LayoffsDup where company='Casper';
## Casper has 3 duplicates
select * from LayoffsDup where company='Hibob';
##Hibob has 2 duplicates


## craete another table 
create table LayoffsDup2(
company text,
location text,
industry text,
total_laid_off text,
precentage_laid_off text,
date text,
stage text,
country text,
funds_raised_millions int  
)
select * from LayoffsDup2;
alter table LayoffsDup2 add row_num int;
select * from LayoffsDup2;

insert into LayoffsDup2 select * ,row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,date,stage,country,funds_raised_millions)AS row_num
from LayoffsDup;
select * from LayoffsDup2;
select * from LayoffsDup2 where row_num>1;

delete  from LayoffsDup2 where row_num=2;
select * from LayoffsDup2;
## checking whether data is deleted or not
select * from LayoffsDup2 where row_num>1; 


select distinct(company) from layoffsdup2;
## trimming unwanted space or data
select distinct(trim(company)) from Layoffsdup2;
## showing differnce from before changed to vfter change

select company,trim(company) from layoffsdup2;

## updatinng the values of before trimmed to after trimmed at company column
update layoffsdup2 set company=trim(company);

select * from layoffsdup2;

select distinct(location) from layoffsdup2;

## checking whether there are duplicates
select  * from layoffsdup2 where location='Luxembourg';
select  * from layoffsdup2 where location='Lehi';
select  * from layoffsdup2 where location='Oslo';
select  * from layoffsdup2 where location='Hyderabad';

## veiwing data in order
select distinct industry from layoffsdup2 order by 1; 


select * from layoffsdup2 where industry='Crypto Currency';

select distinct(trim(industry)) from Layoffsdup2;
update layoffsdup2 set industry=trim(industry);

select * from layoffsdup2;

## checking for null values
select * from layoffsdup2 where total_laid_off is null and precentage_laid_off is null;

select * from layoffsdup2 where company='Ada';

select * from layoffsdup2 where total_laid_off is null; 

select * from layoffsdup2 ;

## deleting null values in both total_laid_of and precentage_laid_off
delete from layoffsdup2 where total_laid_off is null and precentage_laid_off is null;

## checking whether data is deleted or not
select * from layoffsdup2 where total_laid_off is null and precentage_laid_off is null;
select * from layoffsdup2 ;
