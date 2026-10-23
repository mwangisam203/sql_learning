USE mysql_learning;

CREATE TABLE lesson_schema_demo (id INT PRIMARY KEY) ENGINE=InnoDB;
ALTER TABLE lesson_schema_demo ADD COLUMN notes VARCHAR(200) NULL;
ALTER TABLE lesson_schema_demo MODIFY COLUMN notes VARCHAR(400) NULL;
ALTER TABLE lesson_schema_demo RENAME COLUMN notes TO memo;
SHOW CREATE TABLE lesson_schema_demo;
ALTER TABLE lesson_schema_demo DROP COLUMN memo;
DROP TABLE lesson_schema_demo;
