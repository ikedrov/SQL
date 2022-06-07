1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd

SELECT model, speed, hd from PC
WHERE price < 500

2. Найдите производителей принтеров. Вывести: maker

SELECT maker FROM Product
WHERE type = 'printer'
GROUP BY maker

3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.

SELECT model, ram, screen FROM Laptop
WHERE price > 1000

4. Найдите все записи таблицы Printer для цветных принтеров.

SELECT * FROM Printer
WHERE color = 'y'

5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.

SELECT model, speed, hd FROM PC
WHERE (cd = '12x' OR cd = '24x') AND price < 600

6. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.

SELECT DISTINCT Product.maker, Laptop.speed FROM Product
INNER JOIN Laptop ON Product.model = Laptop.model
and Laptop.hd >= 10

7. Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

SELECT Laptop.model, Laptop.price FROM Laptop 
INNER JOIN Product ON Laptop.model = Product.model
WHERE Product.maker = 'B'
UNION
SELECT PC.model, PC.price FROM PC 
INNER JOIN Product ON PC.model = Product.model
WHERE Product.maker = 'B'
UNION
SELECT Printer.model, Printer.price FROM Printer 
INNER JOIN Product ON Printer.model = Product.model
WHERE Product.maker = 'B'

8. Найдите производителя, выпускающего ПК, но не ПК-блокноты.

SELECT maker FROM Product
WHERE type = 'PC' AND maker NOT IN (SELECT maker FROM Product WHERE type = 'laptop')
GROUP BY maker

9. Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

SELECT maker FROM PC INNER JOIN Product ON PC.model = Product.model
WHERE speed >= 450
GROUP BY maker

10. Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price

SELECT model, price FROM Printer
WHERE price = (SELECT MAX(price) FROM Printer)

11. Найдите среднюю скорость ПК.

SELECT AVG(speed) FROM PC

12. Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.

SELECT AVG(speed) FROM Laptop
WHERE price > 1000

13. Найдите среднюю скорость ПК, выпущенных производителем A.

SELECT AVG(speed) FROM PC JOIN Product ON PC.model = Product.model
WHERE maker = 'A'
GROUP BY maker

14. Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.

SELECT Classes.class, name, country FROM Classes JOIN Ships ON Classes.class = Ships.class
WHERE numGuns >= 10

15. Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD

SELECT hd FROM PC
GROUP BY hd
HAVING COUNT(model) >= 2

16. Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.

SELECT DISTINCT B.model, A.model, A.speed, A.ram
FROM PC AS A, PC B
WHERE A.speed = B.speed AND A.ram = B.ram AND A.model < B.model

17. Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК. 
Вывести: type, model, speed

SELECT DISTINCT product.type, laptop.model, laptop.speed
FROM laptop, product
WHERE speed <(SELECT MIN(speed) FROM pc)
AND product.type='Laptop'

18. Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price

SELECT DISTINCT Product.maker, price FROM Printer JOIN Product ON Product.model = Printer.model
WHERE price = (SELECT MIN(price) from Printer WHERE color = 'y') AND color = 'y'

19. Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов. 
Вывести: maker, средний размер экрана.

SELECT maker, AVG(screen) FROM Laptop JOIN Product ON Laptop.model = Product.model
GROUP BY maker

20. Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.

SELECT maker, COUNT(model) FROM Product
WHERE type = 'PC'
GROUP By maker
HAVING COUNT(model) >= 3

21. Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC. 
Вывести: maker, максимальная цена.

SELECT maker, MAX(price) FROM PC JOIN Product ON PC.model = Product.model
GROUP BY maker

22. Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.

SELECT speed, AVG(price) FROM PC
WHERE speed >600
GROUP BY speed

23. Найдите производителей, которые производили бы как ПК
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
Вывести: Maker

SELECT DISTINCT maker FROM PC JOIN Product ON PC.model = Product.model
WHERE PC.speed >= 750 AND maker IN (SELECT maker FROM Laptop JOIN Product ON Laptop.model = Product.model WHERE Laptop.speed >= 750)

24. Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.

SELECT model FROM( 
SELECT distinct model, price FROM laptop WHERE laptop.price = (SELECT MAX(price) FROM laptop)  
UNION 
SELECT distinct model, price FROM pc WHERE pc.price = (SELECT MAX(price) FROM pc)  
UNION 
SELECT distinct model, price FROM printer WHERE printer.price = (SELECT MAX(price) FROM printer)  
) as t 
WHERE t.price=(SELECT MAX(price) FROM ( 
SELECT distinct price FROM laptop WHERE laptop.price = (SELECT MAX(price) FROM laptop)  
UNION 
SELECT distinct price FROM pc WHERE pc.price = (SELECT MAX(price) FROM pc)  
UNION 
SELECT distinct price FROM printer WHERE printer.price = (SELECT MAX(price) FROM printer)  
) as t1 )

25. Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker

SELECT distinct product.maker FROM product WHERE product.type='Printer'  
INTERSECT 
SELECT distinct product.maker FROM product INNER JOIN pc ON pc.model=product.model  
WHERE product.type='PC' AND pc.ram=(SELECT MIN(ram) FROM pc)  
AND pc.speed = (SELECT MAX(speed) FROM (SELECT distinct speed FROM pc 
WHERE pc.ram=(SELECT MIN(ram) FROM pc)) as t)

26. Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.

SELECT t1.c/t1.d FROM( SELECT SUM(t.a) as c, SUM(t.b) as d FROM(  
SELECT SUM(pc.price) as a, COUNT(pc.code) as b FROM pc 
INNER JOIN product ON pc.model=product.model WHERE product.maker='A'  
UNION 
SELECT SUM(laptop.price) as a, COUNT(laptop.code) as b FROM laptop 
INNER JOIN product ON laptop.model=product.model WHERE product.maker='A') as t) as t1

27. Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.

SELECT maker, AVG(hd) FROM Product JOIN PC ON Product.model = PC.model
WHERE maker IN (SELECT maker FROM Product WHERE type = 'Printer')
GROUP BY maker

28. Используя таблицу Product, определить количество производителей, выпускающих по одной модели.

SELECT COUNT(*) FROM (SELECT maker FROM Product GROUP BY maker HAVING COUNT(model) = 1) AS Q

29. В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день [т.е. первичный ключ (пункт, дата)], написать запрос с выходными данными (пункт, дата, приход, расход). Использовать таблицы Income_o и Outcome_o.

select t.point, t.date, SUM(t.inc), sum(t.out) from( select point, date, inc, null as out from Income_o  
Union 
select point, date, null as inc, Outcome_o.out from Outcome_o) as t group by t.point, t.date

30. В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз (первичным ключом в таблицах является столбец code), требуется получить таблицу, в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). Отсутствующие значения считать неопределенными (NULL).

select point, date, SUM(sum_out), SUM(sum_inc) 
from( select point, date, SUM(inc) as sum_inc, null as sum_out from Income Group by point, date  
Union 
select point, date, null as sum_inc, SUM(out) as sum_out from Outcome Group by point, date ) as t  
group by point, date order by point  

