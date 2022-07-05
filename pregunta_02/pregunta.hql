/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Construya una consulta que ordene la tabla por letra y valor (3ra columna).

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/

-- create table
DROP TABLE IF EXISTS tbl2;
CREATE TABLE tbl2 (
    c1 STRING,
    c2 DATE,
    c3 INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

-- load data file
LOAD DATA LOCAL INPATH '/home/vagrant/apache-hive/_02/data.tsv' INTO TABLE tbl2;

-- query and store in local output directory
INSERT OVERWRITE LOCAL DIRECTORY '/home/vagrant/output' 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
select * 
from tbl2 
order by c1, c3;
