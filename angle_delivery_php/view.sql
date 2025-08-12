SELECT productview1.* , 1 as favorite FROM productview1 
INNER JOIN favorite ON favorite.favorite_productid = productview1.product_id AND favorite.favorite_userid=3
UNION ALL 
SELECT* , 0 as favorite FROM productview1 WHERE product_id != (SELECT productview1.product_id FROM productview1 
INNER JOIN favorite ON favorite.favorite_productid = productview1.product_id AND favorite.favorite_userid=3 )





SELECT productview1.* , 1 as favorite FROM productview1 INNER JOIN favorite ON favorite.favorite_productid = productview1.product_id AND favorite.favorite_userid=22 UNION ALL SELECT* , 0 as favorite FROM productview1 WHERE product_id != (SELECT productview1.product_id FROM productview1 INNER JOIN favorite ON favorite.favorite_productid = productview1.product_id AND favorite.favorite_userid=22 )




//array
SELECT productview1.* , 1 as favorite FROM productview1 
INNER JOIN favorite ON favorite.favorite_productid = productview1.product_id AND favorite.favorite_userid=7
UNION ALL 
SELECT* , 0 as favorite FROM productview1 WHERE product_id
NOT IN (SELECT productview1.product_id FROM productview1 
INNER JOIN favorite ON favorite.favorite_productid = productview1.product_id AND favorite.favorite_userid=7 )



CREATE OR REPLACE VIEW myfavorite AS
SELECT favorite.*,product.*,users.user_id FROM favorite
INNER JOIN users ON users.user_id = favorite.favorite_userid
INNER JOIN product ON product.product_id =favorite.favorite_productid
////
CREATE or REPLACE VIEW  productview1 as
SELECT productview.* , 1 as favorite, (product_price - (product_price * product_discount / 100 )) as productpricedisount FROM productview 
INNER JOIN favorite ON favorite.favorite_productid = productview.product_id AND favorite.favorite_userid=72 WHERE productview.categoriers_id = 12
UNION ALL SELECT* , 0 as favorite, (product_price - (product_price * product_discount / 100 )) as productpricedisount FROM productview
WHERE productview.categoriers_id = 12 AND product_id NOT IN (SELECT productview.product_id FROM productview INNER JOIN favorite ON favorite.favorite_productid = productview.product_id AND favorite.favorite_userid=7 )

//////////
CREATE or REPLACE VIEW  productview1 as
SELECT productview.* , 1 as favorite, (product_price - (product_price * product_discount / 100 )) as productpricedisount FROM productview 
INNER JOIN favorite ON favorite.favorite_productid = productview.product_id AND favorite.favorite_userid=72
UNION ALL 
SELECT* , 0 as favorite, (product_price - (product_price * product_discount / 100 )) as productpricedisount FROM productview
WHERE  product_id NOT IN (SELECT productview.product_id FROM productview INNER JOIN favorite ON favorite.favorite_productid = productview.product_id AND favorite.favorite_userid=72 )