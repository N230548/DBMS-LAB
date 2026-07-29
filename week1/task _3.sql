use taxpayerdb;
/*taxpayer names in uppercase*/
select upper(full_name) from taxpayerinfo;
select lower(occupation) from taxpayerinfo;
select full_name,length(full_name)as name_length from taxpayerinfo;
select pan_number,left(pan_number,4) asfirst_four from taxpayerinfo;
select concat(full_name,'-',occupation)as details from taxpayerinfo;
select replace(category_name,'income','inc.')as category from income_category;
select trim(full_name)from taxpayerinfo;
select substring_index(full_name,'',1)as first_name from taxpayerinfo;
select concat('taxpayer:',full_name,'\noccupation:',occupation)as details from taxpayerinfo;
select  * from  taxpayerinfo where pan_number like'AP%';
/*part c*/
select amount,round(amount) from income_record;
select amount,abs(amount-500000)as difference from income_record;
select amount,power(amount,2)as square from income_record;
select amount,mod(amount,1000)as remainder from income_record;
select round(amount,2)from income_record;
select amount ,ceil(amount), floor(amount) from income_record;
select floor(rand()*100)+1 as random_number;
select amount,sqrt(amount) from income_record;
select amount ,amount*1.10 as increased_income from income_record;
/*part d*/
select curdate();
select now();
select year(start_date) from financial_year;
select month(start_date) from financial_year;
select day(start_date) from financial_year;
select date_add(start_date,interval 1 year) from financial_year;
select date_add(start_date,interval 30 day) from financial_year;
select date_add(start_date,interval 7 day) from financial_year;
select datediff(curdate(),start_date) from financial_year;
select * from financial_year where year(start_date)=year(curdate());
/*part e*/
select CAST(amount AS SIGNED) from income_record;
/*2.taxpayerid to character*/
select cast(taxpayer_id AS CHAR)from taxpayerinfo;
select cast(start_date AS DATETIME) from financial_year;
/*anual income into decimal*/
select  cast(amount as decimal(10,2)) from income_record;
select cast(amount as char) from income_record;
-- convert before tax calculation 
select cast(amount as decimal(10,2))*0.10 as tax from income_record;