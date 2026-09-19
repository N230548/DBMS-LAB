use taxpayerdb;
#level 1 task 1
create view highest_income as
select * from income_record where amount=(select max(amount) from income_record);
select * from highest_income;

create view lowest_income as
select * from income_record where amount=(select min(amount) from income_record);
select * from lowest_income;

create view avove_average as
select * from income_record where amount>(select avg(amount) from income_record);
select * from avove_average;


create view equal_highest as
select * from income_record where amount=(select max(amount) from income_record);
select * from equal_highest ;

create view business_owner as
select * from taxpayerinfo where occupation="business owner";
select * from business_owner;

#level 2
create view taxpayerinfo_income_record as
select * from taxpayerinfo where taxpayer_id  in (select taxpayer_id from income_record);
select * from  taxpayerinfo_income_record;

create view taxpayerinfo_income_business as
select * from taxpayerinfo where taxpayer_id in (select taxpayer_id from income_record where category_id in(select category_id from income_category where category_name="business"));
select * from taxpayerinfo_income_business;

create  view  income_2025_2026 as
select ir.* from income_record ir join financial_year fy on ir.year_id=fy.year_id where fy.year_label="2025-2026";
select * from income_2025_2026;

create view greater_min_businessincome as
select * from income_record where amount>(select min(amount) from income_record  where category_id in (select category_id from income_category where category_name="business"));
select * from greater_min_businessincome;

create view less_max_salary as
select * from income_record where amount<(select max(amount) from income_record where category_id in(select category_id from income_category where category_name="salary"));
select * from less_max_salary;

create view greater_avgincome as
select * from taxpayerinfo where taxpayer_id in(select taxpayer_id from income_record where amount>(select avg(amount) from income_record));
select * from  greater_avgincome;

create view category_income as
select * from income_category where category_id in (select category_id from income_record);
select * from category_income;

create view taxpayerinfo_without_investment as
select * from taxpayerinfo where taxpayer_id not in(select taxpayer_id from income_record where category_id in(select category_id from income_category where category_name="investment"));
select * from taxpayerinfo_without_investment;

#level 3
CREATE VIEW taxpayerinfo_highest_income AS
SELECT t.*, ir.amount
FROM Taxpayerinfo t
JOIN Income_Record ir
ON t.taxpayer_id = ir.taxpayer_id
WHERE ir.amount = (
    SELECT MAX(amount)
    FROM Income_Record
);

SELECT * FROM taxpayerinfo_highest_income;

CREATE VIEW above_average_business_income AS
SELECT *
FROM Income_Record
WHERE amount > (
    SELECT AVG(amount)
    FROM Income_Record
    WHERE category_id IN (
        SELECT category_id
        FROM Income_Category
        WHERE category_name = 'Business'
    )
);

SELECT * FROM above_average_business_income;

CREATE VIEW taxpayers_above_average_total AS
SELECT taxpayer_id, SUM(amount) AS total_income
FROM Income_Record
GROUP BY taxpayer_id
HAVING SUM(amount) > (
    SELECT AVG(total_income)
    FROM (
        SELECT taxpayer_id, SUM(amount) AS total_income
        FROM Income_Record
        GROUP BY taxpayer_id
    ) AS totals
);

SELECT * FROM taxpayers_above_average_total;
CREATE VIEW greater_than_any_investment AS
SELECT *
FROM Income_Record
WHERE amount > ANY (
    SELECT amount
    FROM Income_Record
    WHERE category_id IN (
        SELECT category_id
        FROM Income_Category
        WHERE category_name = 'Investment'
    )
);

SELECT * FROM greater_than_any_investment;

CREATE VIEW greater_than_all_investment AS
SELECT *
FROM Income_Record
WHERE amount > ALL (
    SELECT amount
    FROM Income_Record
    WHERE category_id IN (
        SELECT category_id
        FROM Income_Category
        WHERE category_name = 'Investment'
    )
);

SELECT * FROM greater_than_all_investment;

#level 3
CREATE VIEW category_highest_income AS
SELECT *
FROM Income_Category
WHERE category_id IN (
    SELECT category_id
    FROM Income_Record
    where amount = (
        SELECT MAX(amount)
        FROM Income_Record
    )
);

SELECT * FROM category_highest_income;

CREATE VIEW year_highest_total_income AS
SELECT fy.year_id,
       fy.year_label,
       SUM(ir.amount) AS total_income
FROM Financial_Year fy
JOIN Income_Record ir
ON fy.year_id = ir.year_id
GROUP BY fy.year_id, fy.year_label
HAVING SUM(ir.amount) = (
    SELECT MAX(total_income)
    FROM (
        SELECT year_id,
               SUM(amount) AS total_income
        FROM Income_Record
        GROUP BY year_id
    ) AS yearly_totals
);
SELECT * FROM year_highest_total_income;

CREATE VIEW taxpayers_greater_than_average_total AS
SELECT taxpayer_id,
       SUM(amount) AS total_income
FROM Income_Record
GROUP BY taxpayer_id
HAVING SUM(amount) > (
    SELECT AVG(total_income)
    FROM (
        SELECT taxpayer_id,
               SUM(amount) AS total_income
        FROM Income_Record
        GROUP BY taxpayer_id
    ) AS taxpayer_totals
);

SELECT * FROM taxpayers_greater_than_average_total;