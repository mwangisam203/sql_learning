USE mysql_learning;

CREATE TABLE lesson_migration_practice (id INT PRIMARY KEY) ENGINE=InnoDB;
ALTER TABLE lesson_migration_practice
ADD COLUMN status VARCHAR(20) NOT NULL DEFAULT 'new';
SHOW CREATE TABLE lesson_migration_practice;
DROP TABLE lesson_migration_practice;
