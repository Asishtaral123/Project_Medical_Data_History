use project_medical_data_history;


-- 1
select first_name,last_name,gender from patients
where gender='M';

-- 2
select first_name,last_name,concat(first_name,' ',last_name) as full_name 
from patients
where allergies is null;

-- 3
select first_name from patients
where first_name like "C%";

-- 4
select first_name, last_name,weight
from patients
where weight between 100 and 120;

-- 5
select allergies, 
case
	when allergies is null then 'NKA'
    else allergies
end as allergies
from patients;

-- 6
select first_name,last_name, concat(first_name,' ',last_name) as full_name
from patients;

-- 7
select first_name,last_name,province_name
from patients p
join province_names pr on p.province_id=pr.province_id;

-- 8
select count(birth_date) as count_b_date
from patients 
where birth_date like '%2010%';

-- 9
select first_name,last_name,height
from patients
order by height desc;

-- 10
select *
from patients
where patient_id in(1,45,534,879,1000);

-- 11
select count(distinct(patient_id)) as total_patient
from admissions;

-- 12
select * from admissions 
where admission_date = discharge_date;

-- 13
select count(patient_id)
from admissions
where patient_id = 579;

-- 14
select distinct(city)
from patients
where province_id='NS';

-- 15
select first_name,last_name,birth_date
from patients where height>160 and weight>70;

-- 16
select distinct(birth_date)
from patients
order by birth_date asc;

-- 17
select first_name 
from patients 
group by first_name
having count(first_name) = 1;

-- 18
select patient_id,first_name
from patients
where first_name like "s%s" and length(first_name)>=6;

-- 19
select p.patient_id,p.first_name,p.last_name
from patients p
join  admissions a on p.patient_id=a.patient_id
where diagnosis= 'Dementia';

-- 20
select first_name
from patients
group by first_name
order by length(first_name) asc,first_name asc;

-- 21
SELECT
  SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) as total_male_patients,
  SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) as total_female_patients
FROM
  patients;
  
  -- 22
  select patient_id,diagnosis,count(*) as admission_count
  from admissions
  group by patient_id,diagnosis
  having count(*)>1;
  
  -- 23
  select city,count(patient_id) as total_patient
  from patients
  group by city
  order by total_patient desc, city asc;
  
  -- 24
  select first_name,last_name,specialty
  from doctors;
  
  -- 25
  select count(allergies) as popularity,allergies
  from patients
  where allergies is not null
  group by allergies
  order by popularity desc;
  
  -- 26
  select first_name,last_name,birth_date
  from patients
  where year(birth_date) between 1970 and 1979
  order by birth_date asc;
  
  -- 27
  select first_name,last_name,concat(upper(last_name),',',lower(first_name))
  from patients
  order by first_name;
  
  -- 28
  SELECT p.province_id, SUM(height) as total_height
FROM province_names p
JOIN patients pt ON p.province_id = pt.province_id
GROUP BY p.province_id
HAVING total_height >= 7000;

-- 29
select max(weight)-min(weight) as weight_difference
from patients
where last_name='Maroni';

-- 30
SELECT DAY(admission_date) as day_of_month, COUNT(*) as admissions_count
FROM admissions
GROUP BY day_of_month
ORDER BY admissions_count DESC, day_of_month;

-- 31
SELECT
  FLOOR(weight / 10) * 10 as weight_group,
  COUNT(*) as total_patients
FROM
  patients
GROUP BY
  weight_group
ORDER BY
  weight_group DESC;
  
  -- 32
  SELECT
  patient_id,
  weight,
  height,
  CASE WHEN weight / (height / 100) >= 30 THEN 1 ELSE 0 END as isObese
FROM
  patients;
  
  -- 33
  SELECT
  p.patient_id,
  p.first_name,
  p.last_name,
  d.specialty
FROM
  patients p
JOIN
  admissions a ON p.patient_id = a.patient_id
JOIN
  doctors d ON a.attending_doctor_id = d.doctor_id
WHERE
  a.diagnosis = 'Epilepsy' AND d.first_name = 'Lisa';
  
  -- 34
  SELECT
  patient_id,
  CONCAT(
    patient_id,
    LENGTH(last_name),
    YEAR(birth_date)
  ) AS temp_password
FROM
  patients
WHERE
  patient_id IN (SELECT DISTINCT patient_id FROM admissions);






  
  


