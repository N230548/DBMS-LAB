use taxpayerdb;
select * from taxpayerinfo;
select * from income_record;
select * from income_category;
select * from financial_year;
-- partb
select full_name ,income_source from taxpayerinfo t inner join income_record ir on t.taxpayer_id=ir.taxpayer_id;
select full_name ,category_name from taxpayerinfo t inner join income_record ir on t.taxpayer_id=ir.taxpayer_id inner join 
income_category ic on ir.category_id=ic.category_id;
select * from income_record ir join  financial_year fy on ir.year_id=fy.year_id;
select full_name,annual_income, amount from taxpayerinfo t inner join income_record ir on t.taxpayer_id=ir.taxpayer_id;
select full_name,income_source ,category_name,year_label from taxpayerinfo t join income_record ir on t.taxpayer_id=ir.taxpayer_id
join income_category ic on ir.category_id =ic.category_id join financial_year fy on ir.year_id=fy.year_id;
-- level 2
select full_name ,income_source from taxpayerinfo t inner join income_record ir on t.taxpayer_id=ir.taxpayer_id
 inner join income_category  where category_name='salary';
 select full_name,occupation,income_source from taxpayerinfo t inner join income_record ir on t.taxpayer_id=ir.taxpayer_id
 inner join income_category where category_name='business';
 select  full_name ,start_date,end_date from taxpayerinfo t  join income_record ir on t.taxpayer_id=ir.taxpayer_id join
 financial_year fy on ir.year_id=fy.year_id;
 select full_name,description from taxpayerinfo t join income_record ir  on t.taxpayer_id=ir.taxpayer_id join
 income_category ic  on ir.category_id=ic.category_id;
 select full_name,pan_number,occupation,income_source,category_name ,amount,year_label,start_date,end_date from taxpayerinfo t join 
 income_record ir on t.taxpayer_id=ir.taxpayer_id join income_category ic on ir.category_id=ic.category_id join 
 financial_year fy on ir.year_id=fy.year_id;
 -- level3
 select full_name,income_source from taxpayerinfo t left outer join income_record ir on t.taxpayer_id=ir.taxpayer_id;
 select income_source ,category_name from income_record ir right outer join income_category ic on ir.category_id=ic.category_id;
 select full_name ,income_source from taxpayerinfo t left outer join income_record ir on t.taxpayer_id=ir.taxpayer_id union
  select full_name ,income_source from taxpayerinfo t right outer join income_record ir on t.taxpayer_id=ir.taxpayer_id;
  select * from taxpayerinfo cross join financial_year ;
  select t1.full_name ,t2.full_name from taxpayerinfo t1 join taxpayerinfo t2 on t1.occupation=t2.occupation and t1.taxpayer_id<t2.taxpayer_id;
 -- optional
  select full_name,pan_number,income_source,category_name ,year_label from taxpayerinfo t join 
 income_record ir on t.taxpayer_id=ir.taxpayer_id join income_category ic on ir.category_id=ic.category_id join 
 financial_year fy on ir.year_id=fy.year_id;
 select full_name ,category_name ,description from taxpayerinfo t join income_record ir on t.taxpayer_id=ir.taxpayer_id
 join income_category ic on ir.category_id=ic.category_id;
 select income_source ,year_label from income_record ir join financial_year fy on ir.year_id=fy.year_id;
 



