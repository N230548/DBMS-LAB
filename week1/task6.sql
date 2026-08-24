use taxpayerdb;
select * from taxpayerinfo;
select * from income_category;
select * from financial_year;
select * from income_record;
-- part A
select income_id ,amount,taxpayer_id from income_record where amount=(select max(amount) from income_record);
select income_id ,taxpayer_id ,amount from income_record where amount=(select min(amount) from  income_record);
select income_id,taxpayer_id,amount from income_record where amount>(select avg(amount) from income_record);
select * from income_record where amount=(select max(amount) from income_record);
select * from taxpayerinfo where taxpayer_id IN (select taxpayer_id from taxpayerinfo where occupation='business owner');
-- PART b
select * from taxpayerinfo where taxpayer_id in (select taxpayer_id from income_record);
select * from taxpayerinfo where taxpayer_id in ( select taxpayer_id from income_record where category_id in(select category_id from income_category where category_name='business'));
select * from income_record where year_id in( select year_id from financial_year where year_label='2025-2026');
select * from income_record where amount>(select min(amount) from income_record where category_id in (select category_id from income_category where category_name='business'));
select * from income_record where amount<(select max(amount) from income_record where category_id in ( select category_id from income_category where category_name='salary'));
select * from taxpayerinfo where taxpayer_id in ( select taxpayer_id from income_record where amount >(select avg(amount) from income_record));
select * from income_category where category_id in (select category_id from income_record);
select * from taxpayerinfo where taxpayer_id not in ( select taxpayer_id from income_record where category_id in(select category_id from income_category where category_name='investment'));
-- level c
select * from taxpayerinfo where taxpayer_id  in ( select taxpayer_id from income_record where amount =(select max(amount) from income_record ));
select * from income_record where amount >(select avg(amount) from  income_record where category_id in ( select category_id from income_category where category_name='business'));
select * from  taxpayerinfo where taxpayer_id in (select  taxpayer_id from income_record where amount>(select avg(amount) from income_record));
select * from income_record  where amount>any(select amount from income_record where category_id in(select category_id from income_category where category_name='investment'));
select * from income_record where amount> all( select amount from income_record where category_id in( select category_id from income_category where category_name='investment'));
select * from income_category where category_id in( select category_id from income_record where amount=(select max(amount) from income_record));
select  year_id ,sum(amount) as total_income from income_record  group by year_id having sum(amount)=(select max(total_income) from ( select sum(amount) as total_income from income_record 
 group by year_id ) as T );
 select taxpayer_id ,sum(amount) as total_income from income_record group by taxpayer_id having sum(amount)> (select AVG(total_income)  from (select sum(amount) as total_income from income_record
 group by taxpayer_id ) as T);
 -- level 4
 SELECT * FROM taxpayerinfo WHERE taxpayer_id IN (SELECT taxpayer_id FROM Income_Record WHERE amount = (SELECT MAX(amount)FROM Income_Record));
 SELECT * FROM Taxpayerinfo WHERE taxpayer_id IN (SELECT taxpayer_id FROM Income_Record WHERE amount > (SELECT AVG(amount)FROM Income_Record));
SELECT * FROM Income_Category WHERE category_id IN (SELECT category_id FROM Income_Record WHERE amount = (SELECT MAX(amount)FROM Income_Record));
SELECT *FROM Taxpayerinfo  WHERE taxpayer_id IN (SELECT taxpayer_id FROM Income_Record WHERE category_id IN (SELECT category_id FROM Income_Category WHERE category_name = 'Business'))
AND taxpayer_id NOT IN (SELECT taxpayer_id FROM Income_Record WHERE category_id IN (SELECT category_id FROM Income_Category WHERE category_name = 'Investment'));
SELECT *FROM Taxpayerinfo WHERE taxpayer_id IN (SELECT taxpayer_id FROM Income_Record WHERE category_id IN (SELECT category_id FROM Income_Category WHERE category_name = 'Business'))
AND taxpayer_id NOT IN (SELECT taxpayer_id FROM Income_Record WHERE category_id IN (SELECT category_id FROM Income_Category WHERE category_name = 'Investment'));
select * from income_record where amount> all( select amount from income_record where category_id in( select category_id from income_category where category_name='investment'));
select * from income_record  where amount>any(select amount from income_record where category_id in(select category_id from income_category where category_name='investment'));
SELECT *FROM Taxpayerinfo WHERE taxpayer_id IN (SELECT taxpayer_id FROM Income_Record GROUP BY taxpayer_id HAVING SUM(amount) = (SELECT MAX(total_income)FROM (SELECT SUM(amount) AS total_income FROM Income_Record GROUP BY taxpayer_id) AS T));


SELECT * FROM Income_Record WHERE amount > (SELECT AVG(amount)FROM Income_Record);