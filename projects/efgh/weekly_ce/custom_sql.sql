SELECT
  *
FROM tableA
WHERE a = 'test'
--INSERT COMMENT ABOUT JOIN
--the join is done in the data source window
LEFT JOIN ( SELECT * FROM tableB ) AS tableB
ON tableA.a = tableB.a
