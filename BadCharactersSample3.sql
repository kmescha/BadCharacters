SELECT
	[SourceRecordId] = S.Id,
	[RawValue] = S.NoteText,
	[OffendingCharacter] = 'CHAR('+CAST(BadCharacters.[CharValue] AS NVARCHAR(10))+')',
	[OffendingCharacterPosition] = CHARINDEX(CHAR(BadCharacters.[CharValue]), S.NoteText),
	[ReplaceStatementNeeded] = REPLACE(
		S.NoteText,
		CHAR(BadCharacters.[CharValue]),
		''
		)
FROM #NoteSource S
	CROSS APPLY BadCharacters
WHERE
	CHARINDEX(CHAR(BadCharacters.CharValue), S.NoteText) > 0
