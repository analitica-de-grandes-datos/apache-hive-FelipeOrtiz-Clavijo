/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Compute la cantidad de registros por cada letra de la columna 1.
Escriba el resultado ordenado por letra. 

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/

-- create table
DROP TABLE IF EXISTS tbl1;
CREATE TABLE tbl1 (
    c1 STRING,
    c2 DATE,
    c3 INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

-- load data file
LOAD DATA LOCAL INPATH '/home/vagrant/apache-hive/_01/data.tsv' INTO TABLE tbl1;

-- query and store in local output directory
INSERT OVERWRITE LOCAL DIRECTORY '/home/vagrant/output' 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
select c1, count(*) 
from tbl1 
group by c1 
order by c1;
