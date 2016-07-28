IF OBJECT_ID('tempdb..#NoteSource') IS NOT NULL
DROP TABLE #NoteSource

CREATE TABLE #NoteSource (
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegardingObjectId] [int] NOT NULL,
	[NoteText] [nvarchar](500) NULL)

INSERT INTO #NoteSource (RegardingObjectId, NoteText)
SELECT 1, 'aaaaaaaaaa' UNION ALL
SELECT 1, 'a'+CHAR(2)+'aaaaaaaaa' UNION ALL
SELECT 1, 'aa'+CHAR(8)+'aaaaaaaa' UNION ALL
SELECT 2, 'aaa'+CHAR(9)+'aaaaaaa' UNION ALL
SELECT 2, 'aaaa'+CHAR(10)+'aaaaaa' UNION ALL
SELECT 3, 'aaaaa'+CHAR(13)+'aaaaa' UNION ALL
SELECT 3, 'aaaaaa'+CHAR(20)+'aaaa' UNION ALL
SELECT 4, 'aaaaaaa'+CHAR(28)+'aaa' UNION ALL
SELECT 4, 'aaaaaaaa'+CHAR(19)+'aa' UNION ALL
SELECT 5, 'aaaaaaaaa'+CHAR(32)+'a'

SELECT * FROM #NoteSource
