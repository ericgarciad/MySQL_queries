-- 1
SELECT NOMBRE FROM PRODUCTO; 
-- 2
SELECT NOMBRE, PRECIO FROM PRODUCTO;
-- 3
SELECT CODIGO, NOMBRE, PRECIO, CODIGO_FABRICANTE FROM PRODUCTO;
-- 4
SELECT NOMBRE, PRECIO AS PRECIO_€, ROUND(PRECIO*1.0831, 2) AS PRECIO_$ FROM PRODUCTO;
-- 5
SELECT NOMBRE AS 'NOM DE PRODUCTO', PRECIO AS 'EUROS', ROUND(PRECIO*1.0831, 2) AS 'DOLARS'  FROM PRODUCTO;
-- 6
SELECT UPPER(NOMBRE), PRECIO FROM PRODUCTO;
-- 7 
SELECT LOWER(NOMBRE), PRECIO FROM PRODUCTO;
-- 8
SELECT NOMBRE, UPPER(LEFT(NOMBRE, 2)) AS NOMBRE_MAYUS FROM FABRICANTE;
-- 9
SELECT NOMBRE, ROUND(PRECIO,0) AS PRECIO FROM PRODUCTO;
-- 10
SELECT NOMBRE, TRUNCATE(PRECIO, 0) FROM PRODUCTO;
-- 11
SELECT A.CODIGO FROM FABRICANTE A INNER JOIN PRODUCTO B WHERE A.CODIGO = B.CODIGO_FABRICANTE;
-- 12
SELECT A.CODIGO FROM FABRICANTE A INNER JOIN PRODUCTO B WHERE A.CODIGO = B.CODIGO_FABRICANTE GROUP BY A.CODIGO;
-- 13
SELECT NOMBRE FROM FABRICANTE ORDER BY NOMBRE ASC;
-- 14
SELECT NOMBRE FROM FABRICANTE ORDER BY NOMBRE DESC;
-- 15
SELECT NOMBRE FROM PRODUCTO ORDER BY NOMBRE ASC, PRECIO DESC;
-- 16
SELECT CODIGO, NOMBRE FROM FABRICANTE LIMIT 5;
-- 17
SELECT CODIGO, NOMBRE FROM FABRICANTE LIMIT 3, 2; 
-- 18
SELECT NOMBRE, PRECIO FROM PRODUCTO ORDER BY PRECIO ASC LIMIT 3;
-- 19
SELECT NOMBRE, PRECIO FROM PRODUCTO ORDER BY PRECIO DESC LIMIT 3;
-- 20
SELECT NOMBRE FROM PRODUCTO WHERE CODIGO_FABRICANTE=2;
-- 21
SELECT A.NOMBRE AS 'NOMBRE PRODUCTO', A.PRECIO, B.NOMBRE AS 'NOMBRE FABRICANTE' FROM PRODUCTO A INNER JOIN FABRICANTE B ON A.CODIGO_FABRICANTE = B.CODIGO;
-- 22
SELECT A.NOMBRE AS 'NOMBRE PRODUCTO', A.PRECIO, B.NOMBRE AS 'NOMBRE FABRICANTE' FROM PRODUCTO A INNER JOIN FABRICANTE B ON A.CODIGO_FABRICANTE = B.CODIGO ORDER BY B.NOMBRE ASC;
-- 23
SELECT A.CODIGO AS 'CODIGO PRODUCTO', A.NOMBRE AS 'NOMBRE PRODUCTO', B.CODIGO AS 'CODIGO FABRICANTE', B.NOMBRE AS 'NOMBRE FABRICANTE' FROM PRODUCTO A INNER JOIN FABRICANTE B ON A.CODIGO_FABRICANTE = B.CODIGO;
-- 24
SELECT A.NOMBRE AS 'NOMBRE PRODUCTO', A.PRECIO, B.NOMBRE AS 'NOMBRE FABRICANTE' FROM PRODUCTO A INNER JOIN FABRICANTE B ON A.CODIGO_FABRICANTE = B.CODIGO ORDER BY A.PRECIO ASC LIMIT 1;
-- 25
SELECT A.NOMBRE AS 'NOMBRE PRODUCTO', A.PRECIO, B.NOMBRE AS 'NOMBRE FABRICANTE' FROM PRODUCTO A INNER JOIN FABRICANTE B ON A.CODIGO_FABRICANTE = B.CODIGO ORDER BY A.PRECIO DESC LIMIT 1;
-- 26
SELECT A.NOMBRE AS 'NOMBRE PRODUCTO' FROM PRODUCTO A INNER JOIN FABRICANTE B ON A.CODIGO_FABRICANTE = B.CODIGO WHERE B.NOMBRE='Lenovo';
-- 27
SELECT A.NOMBRE AS 'NOMBRE PRODUCTO' FROM PRODUCTO A INNER JOIN FABRICANTE B ON A.CODIGO_FABRICANTE = B.CODIGO WHERE B.NOMBRE='Crucial' AND A.PRECIO > 200;
-- 28
SELECT A.NOMBRE AS 'NOMBRE PRODUCTO' FROM PRODUCTO A INNER JOIN FABRICANTE B ON A.CODIGO_FABRICANTE = B.CODIGO WHERE B.NOMBRE='Asus' OR B.NOMBRE='Hewlett-Packard' OR B.NOMBRE='Seagate';
-- 29
SELECT A.NOMBRE AS 'NOMBRE PRODUCTO' FROM PRODUCTO A INNER JOIN FABRICANTE B ON A.CODIGO_FABRICANTE = B.CODIGO WHERE B.NOMBRE IN('Asus', 'Hewlett-Packard', 'Seagate');
-- 30
SELECT NOMBRE, PRECIO FROM PRODUCTO WHERE NOMBRE LIKE('%e');
-- 31
SELECT A.NOMBRE, A.PRECIO FROM PRODUCTO A INNER JOIN FABRICANTE B ON A.CODIGO_FABRICANTE = B.CODIGO WHERE B.NOMBRE LIKE('%w%');
-- 32
SELECT A.NOMBRE AS 'NOMBRE PRODUCTO', A.PRECIO, B.NOMBRE AS 'NOMBRE FABRICANTE' FROM PRODUCTO A INNER JOIN FABRICANTE B ON A.CODIGO_FABRICANTE = B.CODIGO WHERE A.PRECIO >= 180 ORDER BY  A.PRECIO DESC, A.NOMBRE ASC;
-- 33
SELECT B.CODIGO, B.NOMBRE FROM FABRICANTE B RIGHT JOIN PRODUCTO A ON A.CODIGO_FABRICANTE = B.CODIGO GROUP BY B.CODIGO;
-- 34
SELECT B.NOMBRE AS 'NOMBRE FABRICANTE', A.NOMBRE AS 'NOMBRE PRODUCTO' FROM FABRICANTE B LEFT JOIN PRODUCTO A ON A.CODIGO_FABRICANTE = B.CODIGO;
-- 35
SELECT B.NOMBRE AS 'NOMBRE FABRICANTE' FROM FABRICANTE B LEFT JOIN PRODUCTO A ON A.CODIGO_FABRICANTE = B.CODIGO WHERE A.NOMBRE IS NULL;
-- 36
SELECT A.NOMBRE AS 'NOMBRE PRODUCTO' FROM FABRICANTE B RIGHT JOIN PRODUCTO A ON A.CODIGO_FABRICANTE = B.CODIGO WHERE B.NOMBRE='Lenovo';
-- 37
SELECT A.CODIGO, A.NOMBRE, A.PRECIO, A.CODIGO_FABRICANTE FROM FABRICANTE B RIGHT JOIN PRODUCTO A ON A.CODIGO_FABRICANTE = B.CODIGO WHERE A.PRECIO = (SELECT A.PRECIO FROM FABRICANTE B LEFT JOIN PRODUCTO A ON A.CODIGO_FABRICANTE = B.CODIGO WHERE B.NOMBRE='Lenovo' ORDER BY A.PRECIO DESC LIMIT 1);
-- 38
SELECT A.NOMBRE AS 'NOMBRE PRODUCTO' FROM FABRICANTE B LEFT JOIN PRODUCTO A ON A.CODIGO_FABRICANTE = B.CODIGO WHERE B.NOMBRE='Lenovo' ORDER BY A.PRECIO DESC LIMIT 1;
-- 39
SELECT A.NOMBRE AS 'NOMBRE PRODUCTO' FROM FABRICANTE B LEFT JOIN PRODUCTO A ON A.CODIGO_FABRICANTE = B.CODIGO WHERE B.NOMBRE='Hewlett-Packard' ORDER BY A.PRECIO ASC LIMIT 1;
-- 40
SELECT A.CODIGO, A.NOMBRE, A.PRECIO, A.CODIGO_FABRICANTE FROM FABRICANTE B INNER JOIN PRODUCTO A ON A.CODIGO_FABRICANTE = B.CODIGO WHERE A.PRECIO >= (SELECT A.PRECIO FROM FABRICANTE B INNER JOIN PRODUCTO A ON A.CODIGO_FABRICANTE = B.CODIGO WHERE B.NOMBRE='Lenovo' ORDER BY A.PRECIO DESC LIMIT 1);
-- 41
SELECT A.CODIGO, A.NOMBRE, A.PRECIO, A.CODIGO_FABRICANTE FROM FABRICANTE B INNER JOIN PRODUCTO A ON A.CODIGO_FABRICANTE = B.CODIGO WHERE B.NOMBRE='Asus' AND A.PRECIO > (SELECT AVG(A.PRECIO) FROM FABRICANTE B INNER JOIN PRODUCTO A ON A.CODIGO_FABRICANTE = B.CODIGO WHERE B.NOMBRE='Asus');