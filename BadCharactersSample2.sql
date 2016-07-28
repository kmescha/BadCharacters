WITH 
	C1 AS (
		SELECT 1 C UNION ALL SELECT 1 C),
	C2 AS (
		SELECT 1 C FROM C1 A JOIN C1 B ON A.C = B.C), -- C2 now has 4 rows
	C3 AS (
		SELECT 1 C FROM C2 A JOIN C2 B ON A.C = B.C), -- C3 now has 16 rows
	C4 AS (
		SELECT 1 C FROM C3 A JOIN C3 B ON A.C = B.C), -- C4 now has 256 rows
	AsciiCharacters AS (
		SELECT [RowNum] = ROW_NUMBER() OVER(ORDER BY C) FROM C4),
	BadCharacters AS (
		SELECT
			[CharValue] = RowNum,
			[Char] = CHAR(RowNum)
		FROM AsciiCharacters
		WHERE
			RowNum < 32 -- Space
			AND RowNum <> 10 -- Line Feed
			AND RowNum <> 13 -- Carriage Return
			AND RowNum <> 9  -- Horizontal Tab
			)
