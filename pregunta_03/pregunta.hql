/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
de la tercera columna.

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/

-- create table
DROP TABLE IF EXISTS tbl3;
CREATE TABLE tbl3 (
    c1 STRING,
    c2 DATE,
    c3 INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

-- load data file
LOAD DATA LOCAL INPATH '/home/vagrant/apache-hive/_03/data.tsv' INTO TABLE tbl3;

-- query and store in local output directory
INSERT OVERWRITE LOCAL DIRECTORY '/home/vagrant/output' 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
select distinct c3 from tbl3 order by c3 limit 5;
