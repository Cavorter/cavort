---
title: 'Installscript Tip for the day:'

type: "post"
date: 2002-12-09T19:21:35+00:00
url: /2002/12/09/installscript-tip-for-the-daywhile-installshiel/
short-url:
- http://bit.ly/fYUEpj
categories:
- InstallTech
---
While InstallShield's Installscript does not have any String functions that can handle case sensitive comparison, the List functions do!

```InstallScript
//////////////////////////////////////////////////////////////////////////
//	function NRS_StrCompare
//	Case-sensitive compare of 2 strings.
//	Returns 0 if the strings match, -1 if they don't.
//////////////////////////////////////////////////////////////////////////
function NUMBER NRS_StrCompare ( szStr1 , szStr2 )
	NUMBER	nReturn , nResult;
	LIST	listList;
begin
	nReturn = -1;
	listList = ListCreate ( STRINGLIST );
	ListAddString ( listList , szStr1 , AFTER );
	nResult = ListFindString ( listList , szStr2);
	ListDestroy ( listList );
	if ( nResult == 0 ) then
		nReturn = 0;
	endif;		
	return nReturn;
end;
```