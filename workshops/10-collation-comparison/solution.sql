USE mysql_learning;

SELECT _utf8mb4'Cafe' COLLATE utf8mb4_0900_ai_ci = _utf8mb4'cafe' AS case_ignored,
       _utf8mb4'cafe' COLLATE utf8mb4_0900_ai_ci = _utf8mb4'café' AS accent_ignored,
       _utf8mb4'Cafe' COLLATE utf8mb4_0900_as_cs = _utf8mb4'café' AS strict_equal;
