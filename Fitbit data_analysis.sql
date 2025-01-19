
--Q- Id,month wise total steps,calories born ,total_hours

select 
id,
year(date) year,
datename(month,date)as month,
sum(totalsteps) as total_steps,
sum(calories) as total_calories,
round(avg(totalhours),2) as avg_hours
into curated_aggregated_data
from final_data_load_v1
group by id,
datename(month,date),
year(date)


--Create  a Store procedure to find Id,month wise total steps,calories born ,total_hours

Create procedure sp_curated_agg_data
as 
begin 
truncate table curated_aggregated_data
insert into curated_aggregated_data 
select 
id,
year(date) year,
datename(month,date)as month,
sum(totalsteps) as total_steps,
sum(calories) as total_calories,
round(avg(totalhours),2) as avg_hours
from final_data_load_v1
group by id,
datename(month,date),
year(date)
end;


exec sp_curated_agg_data
