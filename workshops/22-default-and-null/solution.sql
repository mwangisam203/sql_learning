USE mysql_learning;

CREATE TEMPORARY TABLE workshop22_tasks (
    task_id INT PRIMARY KEY, state VARCHAR(20) NULL DEFAULT 'new'
) ENGINE=InnoDB;
INSERT INTO workshop22_tasks (task_id) VALUES (1);
INSERT INTO workshop22_tasks (task_id,state) VALUES (2,NULL);
INSERT INTO workshop22_tasks (task_id,state) VALUES (3,DEFAULT);
SELECT task_id, COALESCE(state,'(missing)') AS state_label FROM workshop22_tasks ORDER BY task_id;
DROP TEMPORARY TABLE workshop22_tasks;
