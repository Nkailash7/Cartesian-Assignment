CREATE TABLE purchase_history(product_ID int,sale_QTY int,Bill_Date date);
CREATE TABLE product_catalogue(product_ID int,cat_ID int);
INSERT INTO purchase_history VALUES	(100,1,'2020-02-22');
INSERT INTO purchase_history VALUES	(100,2,'2020-02-23');
INSERT INTO purchase_history VALUES	(100,1,'2020-02-27');
INSERT INTO purchase_history VALUES (100,1,'2020-02-27');
INSERT INTO purchase_history VALUES	(200,1,'2020-02-27');
INSERT INTO purchase_history VALUES	(200,1,'2019-11-11');
INSERT INTO purchase_history VALUES	(300,1,'2019-11-16');
INSERT INTO purchase_history VALUES	(300,1,'2019-11-19');
INSERT INTO purchase_history VALUES	(300,1,'2019-11-26');
INSERT INTO purchase_history VALUES	(300,1,'2019-11-26');
INSERT INTO purchase_history VALUES	(301,1,'2019-12-01');
INSERT INTO purchase_history VALUES	(401,1,'2019-12-04');
INSERT INTO purchase_history VALUES	(402,1,'2019-12-08');
INSERT INTO purchase_history VALUES	(403,1,'2019-12-08');
INSERT INTO purchase_history VALUES	(404,2,'2019-12-08');
INSERT INTO purchase_history VALUES	(405,1,'2019-12-08');
INSERT INTO purchase_history VALUES	(406,1,'2019-12-08');
INSERT INTO purchase_history VALUES	(407,1,'2019-12-16');
INSERT INTO purchase_history VALUES	(405,1,'2019-12-16');
INSERT INTO purchase_history VALUES	(301,1,'2020-01-19');
INSERT INTO purchase_history VALUES (401,1,'2020-01-19');
INSERT INTO purchase_history VALUES	(402,1,'2020-01-23');

INSERT INTO product_catalogue VALUES (100,1);
INSERT INTO product_catalogue VALUES (100,1);
INSERT INTO product_catalogue VALUES (100,1);
INSERT INTO product_catalogue VALUES (100,1);
INSERT INTO product_catalogue VALUES (200,1);
INSERT INTO product_catalogue VALUES (200,1);
INSERT INTO product_catalogue VALUES (300,2);
INSERT INTO product_catalogue VALUES (300,2);
INSERT INTO product_catalogue VALUES (300,2);
INSERT INTO product_catalogue VALUES (301,2);
INSERT INTO product_catalogue VALUES (401,3);
INSERT INTO product_catalogue VALUES (403,3);
INSERT INTO product_catalogue VALUES (404,3);


SELECT pc.Cat_Id,ph.Product_Id,DENSE_RANK() OVER (ORDER BY sale_QTY) AS Trending
FROM purchase_history ph
JOIN product_catalogue pc
ON ph.Product_Id=pc.Product_Id
 WHERE Bill_Date BETWEEN '2020-01-27' AND '2020-02-27' 
GROUP BY Cat_Id
ORDER BY sale_QTY DESC LIMIT 2