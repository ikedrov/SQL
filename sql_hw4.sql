--Таблица employees
--
--Создать таблицу employees
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null
--Наполнить таблицу employee 70 строками.

create table employees(
	id serial primary key,
	employee_name varchar (50) not null
);

insert into employees(employee_name)
values ('Vann'),
	   ('Conner'),
       ('Finley'),
       ('Arthur'),
       ('Harlyn'),
	   ('Xander'),
	   ('Adonis'),
	   ('Ismail'),
	   ('Orlando'),
	   ('Zayne'),
	   ('Yuri'),
	   ('Ezra'),
	   ('Clayton'),
	   ('Ilan'),
	   ('Yaqub'),
	   ('Wolfgang'),
	   ('Franklin'),
	   ('Salvatore'),
	   ('Quinntin'),
	   ('Jack'),
	   ('Vail'),
	   ('Quinten'),
	   ('Leonidas'),
	   ('Maximus'),
	   ('Grey'),
	   ('Dexter'),
	   ('Matias'),
	   ('Yasser'),
	   ('Hadlee'),
	   ('Kieran'),
	   ('Royal'),
	   ('Zac'),
	   ('Seamus'),
	   ('Floyd'),
	   ('Kingston'),
	   ('Leo'),
	   ('Jaxson'),
	   ('Greyson'),
	   ('Emmanuel'),
	   ('Zachary'),
	   ('Ximenes'),
	   ('Guillermo'),
	   ('Kenneth'),
	   ('Nicolai'),
	   ('Xandros'),
	   ('Sonny'),
	   ('Uzziel'),
	   ('Richard'),
	   ('Lorenzo'),
	   ('Dawson'),
	   ('Zev'),
	   ('Cooper'),
	   ('Xenos'),
	   ('Isiah'),
	   ('Esteban'),
	   ('Xaviell'),
	   ('Justin'),
	   ('Cyrus'),
	   ('Jason'),
	   ('Gibson'),
	   ('Warren'),
	   ('Kobe'),
	   ('Emerson'),
	   ('Tristian'),
	   ('Luka'),
	   ('Tanner'),
	   ('Ulric'),
	   ('Uriah'),
	   ('Kaleb'),
	   ('Urias');

--Таблица salary
--
--Создать таблицу salary
--- id. Serial  primary key,
--- monthly_salary. Int, not null
--Наполнить таблицу salary 15 строками:
--- 1000
--- 1100
--- 1200
--- 1300
--- 1400
--- 1500
--- 1600
--- 1700
--- 1800
--- 1900
--- 2000
--- 2100
--- 2200
--- 2300
--- 2400
--- 2500

create table salary(
	id serial primary key,
	monthly_salary int not null
);

insert into salary(monthly_salary)
values (1000),
	   (1100),
	   (1200),
	   (1300),
	   (1400),
	   (1500),
	   (1600),
	   (1700),
	   (1800),
	   (1900),
	   (2000),
	   (2100),
	   (2200),
	   (2300),
	   (2400),
	   (2500);

--Таблица employee_salary
--
--Создать таблицу employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null
--Наполнить таблицу employee_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id

create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null 
);

insert into employee_salary(employee_id, salary_id)
values (2, 1),
	   (1, 4),
	   (5, 9),
	   (40, 13),
	   (23, 4),
	   (11, 2),
	   (52, 10),
	   (15, 13),
	   (3, 7),
	   (26, 4),
	   (71, 5),
	   (72, 6),
	   (73, 10),
	   (74, 8),
	   (75, 9),
	   (76, 12),
	   (77, 14),
	   (78, 15),
	   (79, 13),
	   (80, 4),
	   (16, 2),
	   (17, 8),
	   (18, 9),
	   (21, 3),
	   (22, 10),
	   (25, 9),
	   (27, 1),
	   (29, 5),
	   (30, 6),
	   (31, 2),
	   (32, 12),
	   (33, 15),
	   (36, 11),
	   (37, 8),
	   (39, 1),
	   (38, 4),
	   (41, 3),
	   (43, 9),
	   (44, 2),
	   (56, 1);

--Таблица roles
--
--Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique
--Поменять тип столба role_name с int на varchar(30)
--Наполнить таблицу roles 20 строками:
	  
create table roles(
	id serial primary key,
	role_name int not null unique
)

alter table roles
alter column role_name type varchar(30);

insert into roles(role_name)
values ('Junior Python developer'),
	   ('Middle Python developer'),
	   ('Senior Python developer'),
	   ('Junior Java developer'),
	   ('Middle Java developer'),
	   ('Senior Java developer'),
	   ('Junior JavaScript developer'),
	   ('Middle JavaScript developer'),
	   ('Senior JavaScript developer'),
	   ('Junior Manual QA engineer'),
	   ('Middle Manual QA engineer'),
	   ('Senior Manual QA engineer'),
	   ('Project Manager'),
	   ('Designer'),
	   ('HR'),
	   ('CEO'),
	   ('Sales manager'),
	   ('Junior Automation QA engineer'),
	   ('Middle Automation QA engineer'),
	   ('Senior Automation QA engineer');

--Таблица roles_employee
--
--Создать таблицу roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
--Наполнить таблицу roles_employee 40 строками:

create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	foreign key (employee_id)
		references employees(id),
	role_id int not null,
	foreign key (role_id)
		references roles(id)
);

insert into roles_employee(employee_id, role_id)
values (1, 1),
	   (2, 2),
	   (3, 3),
	   (4, 4),
	   (5, 5),
	   (6, 6),
	   (7, 7),
	   (8, 8),
	   (9, 9),
	   (10, 10),
	   (11, 11),
	   (12, 12),
	   (13, 13),
	   (14, 14),
	   (15, 15),
	   (16, 16),
	   (17, 17),
	   (18, 18),
	   (19, 19),
	   (20, 20),
	   (21, 1),
	   (22, 2),
	   (23, 3),
	   (24, 4),
	   (25, 5),
	   (26, 6),
	   (27, 7),
	   (28, 8),
	   (29, 9),
	   (30, 10),
	   (31, 11),
	   (32, 12),
	   (33, 13),
	   (34, 14),
	   (35, 15),
	   (36, 16),
	   (37, 17),
	   (38, 18),
	   (39, 19),
	   (40, 20);


	  
	  
	  
--Homework 3	  
	  
--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employee_name, monthly_salary from employee_salary
inner join employees on employee_salary.employee_id = employees.id
inner join salary on employee_salary.salary_id = salary.id;

--2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name, monthly_salary from employee_salary
inner join employees on employee_salary.employee_id = employees.id
inner join salary on employee_salary.salary_id = salary.id
where salary.monthly_salary < 2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_name, monthly_salary from employee_salary 
right join employees on employee_salary.employee_id = employees.id
right join salary on employee_salary.salary_id = salary.id
where employee_name is null;

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_name, monthly_salary from employee_salary 
right join employees on employee_salary.employee_id = employees.id
right join salary on employee_salary.salary_id = salary.id
where employee_name is null and monthly_salary < 2000;

--5. Найти всех работников кому не начислена ЗП.

select employee_name, monthly_salary from employee_salary 
left join employees on employee_salary.employee_id = employees.id
left join salary on employee_salary.salary_id = salary.id
where monthly_salary is null;

--6. Вывести всех работников с названиями их должности.

select employee_name, role_name from roles_employee 
inner join employees on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id;

--7. Вывести имена и должность только Java разработчиков.

select employee_name, role_name from roles_employee 
inner join employees on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
where role_name like '%Java %';

--8. Вывести имена и должность только Python разработчиков.

select employee_name, role_name from roles_employee 
inner join employees on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
where role_name like '%Python%';

--9. Вывести имена и должность всех QA инженеров.

select employee_name, role_name from roles_employee 
inner join employees on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
where role_name like '%QA%';

--10. Вывести имена и должность ручных QA инженеров.

select employee_name, role_name from roles_employee 
inner join employees on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
where role_name like '%Manual QA%';

--11. Вывести имена и должность автоматизаторов QA

select employee_name, role_name from roles_employee 
inner join employees on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
where role_name like '%Automation QA%';

--12. Вывести имена и зарплаты Junior специалистов

select employee_name, monthly_salary, role_name from salary
inner join employee_salary on employee_salary.salary_id = salary.id
inner join employees on employees.id = employee_salary.employee_id
inner join roles_employee on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where role_name like '%Junior%';

--13. Вывести имена и зарплаты Middle специалистов

select employee_name, monthly_salary, role_name from salary
inner join employee_salary on employee_salary.salary_id = salary.id
inner join employees on employees.id = employee_salary.employee_id
inner join roles_employee on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where role_name like '%Middle%';

--14. Вывести имена и зарплаты Senior специалистов

select employee_name, monthly_salary, role_name from salary
inner join employee_salary on employee_salary.salary_id = salary.id
inner join employees on employees.id = employee_salary.employee_id
inner join roles_employee on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where role_name like '%Senior%';

--15. Вывести зарплаты Java разработчиков

select employee_name, monthly_salary, role_name from salary
inner join employee_salary on employee_salary.salary_id = salary.id
inner join employees on employees.id = employee_salary.employee_id
inner join roles_employee on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where role_name like '%Java %';

--16. Вывести зарплаты Python разработчиков

select employee_name, monthly_salary, role_name from salary
inner join employee_salary on employee_salary.salary_id = salary.id
inner join employees on employees.id = employee_salary.employee_id
inner join roles_employee on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where role_name like '%Python%';

--17. Вывести имена и зарплаты Junior Python разработчиков

select employee_name, monthly_salary, role_name from salary
inner join employee_salary on employee_salary.salary_id = salary.id
inner join employees on employees.id = employee_salary.employee_id
inner join roles_employee on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where role_name like 'Junior Python%';

--18. Вывести имена и зарплаты Middle JS разработчиков

select employee_name, monthly_salary, role_name from salary
inner join employee_salary on employee_salary.salary_id = salary.id
inner join employees on employees.id = employee_salary.employee_id
inner join roles_employee on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where role_name like 'Middle JavaScript%';

--19. Вывести имена и зарплаты Senior Java разработчиков

select employee_name, monthly_salary, role_name from salary
inner join employee_salary on employee_salary.salary_id = salary.id
inner join employees on employees.id = employee_salary.employee_id
inner join roles_employee on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where role_name like 'Senior Java %';

--20. Вывести зарплаты Junior QA инженеров

select employee_name, monthly_salary, role_name from salary
inner join employee_salary on employee_salary.salary_id = salary.id
inner join employees on employees.id = employee_salary.employee_id
inner join roles_employee on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where role_name like 'Junior%QA%';

--21. Вывести среднюю зарплату всех Junior специалистов

select avg(monthly_salary) as avg_salary from salary
inner join employee_salary on employee_salary.salary_id = salary.id
inner join employees on employees.id = employee_salary.employee_id
inner join roles_employee on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where role_name like 'Junior%';

--22. Вывести сумму зарплат JS разработчиков

select sum(monthly_salary) as sum_salary from salary
inner join employee_salary on employee_salary.salary_id = salary.id
inner join employees on employees.id = employee_salary.employee_id
inner join roles_employee on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where role_name like '%JavaScript%';

--23. Вывести минимальную ЗП QA инженеров

select min(monthly_salary) as min_salary from salary
inner join employee_salary on employee_salary.salary_id = salary.id
inner join employees on employees.id = employee_salary.employee_id
inner join roles_employee on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where role_name like '%QA%';

--24. Вывести максимальную ЗП QA инженеров

select max(monthly_salary) as max_salary from salary
inner join employee_salary on employee_salary.salary_id = salary.id
inner join employees on employees.id = employee_salary.employee_id
inner join roles_employee on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where role_name like '%QA%';

--25. Вывести количество QA инженеров

select count(role_name) as qa_count from roles_employee
inner join employees on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where role_name like '%QA%';

--26. Вывести количество Middle специалистов.

select count(role_name) as middle_count from roles_employee
inner join employees on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where role_name like 'Middle%';

--27. Вывести количество разработчиков

select count(role_name) as dev_count from roles_employee
inner join employees on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where role_name like '%developer';

--28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(monthly_salary) as dev_salary from salary
inner join employee_salary on employee_salary.salary_id = salary.id
inner join employees on employees.id = employee_salary.employee_id
inner join roles_employee on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where role_name like '%developer';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employee_name, role_name, monthly_salary from salary
inner join employee_salary on employee_salary.salary_id = salary.id
inner join employees on employees.id = employee_salary.employee_id
inner join roles_employee on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
order by monthly_salary;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select employee_name, role_name, monthly_salary from salary
inner join employee_salary on employee_salary.salary_id = salary.id
inner join employees on employees.id = employee_salary.employee_id
inner join roles_employee on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where monthly_salary between 1700 and 2300
order by monthly_salary;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employee_name, role_name, monthly_salary from salary
inner join employee_salary on employee_salary.salary_id = salary.id
inner join employees on employees.id = employee_salary.employee_id
inner join roles_employee on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where monthly_salary < 2300
order by monthly_salary;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employee_name, role_name, monthly_salary from salary
inner join employee_salary on employee_salary.salary_id = salary.id
inner join employees on employees.id = employee_salary.employee_id
inner join roles_employee on roles_employee.employee_id = employees.id
inner join roles on roles.id = roles_employee.role_id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary;





