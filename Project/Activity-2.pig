inputFile = LOAD 'hdfs:///user/priyanka/inputscripts' USING PigStorage('\t') AS (name: chararray, line: chararray);
groupByName = GROUP inputFile BY name;
CountByword = FOREACH groupByName GENERATE $0 AS name, COUNT($1) AS no_of_lines;
namesOrdered = ORDER CountByword BY no_of_lines DESC;
STORE name
sOrdered INTO 'hdfs:///user/priyanka/ProjectActivity2';
