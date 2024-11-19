'Program:       Names
'Programmer:    David Willson
'Date:          April 15, 2007
'Abstract:      This program inputs names from a
'               data file.  It then sorts them into
'               ascending order.  It prints them
'               before and after the sort  using
'               a paginated report and outputs the
'               sorted list to a new data file.
DECLARE SUB B000InputArray ()
DECLARE SUB B010PrintArray (strTitle AS STRING)
DECLARE SUB B020SortArray ()
DECLARE SUB B030Searchtable ()
DECLARE SUB B040WriteArray ()
DECLARE SUB C000PrintHeadings (strTitle AS STRING)
CLS
CONST intSIZE = 30
CONST intMAXLINES = 15
DIM SHARED StrNames(intSIZE) AS STRING
DIM SHARED intLineCount
DIM SHARED intPageCount
CALL B000InputArray
CALL B010PrintArray("Unsorted Names")
CALL B020SortArray
CALL B010PrintArray("Sorted Names")
CALL B030Searchtable
CALL B040WriteArray
END

SUB B000InputArray
DIM intSubscript AS INTEGER
intSubscript = 1
OPEN "names.txt" FOR INPUT AS #1
DO WHILE intSubscript <= intSIZE
   INPUT #1, StrNames(intSubscript)
    intSubscript = intSubscript + 1
LOOP
CLOSE #1
END SUB

SUB B010PrintArray (strTitle AS STRING)
DIM intSubscript AS INTEGER
intSubscript = 1
intLineCount = intMAXLINES
intPageCount = 1
DO WHILE intSubscript <= intSIZE
    IF intLineCount >= intMAXLINES THEN
        CALL C000PrintHeadings(strTitle)
    END IF
    PRINT StrNames(intSubscript)
    intLineCount = intLineCount + 1
    intSubscript = intSubscript + 1
LOOP
END SUB

SUB B020SortArray
DIM intPass AS INTEGER
DIM intSubscript AS INTEGER
DIM strTemp AS STRING
intPass = 1
DO WHILE intPass < intSIZE
    intSubscript = intPass + 1
    DO WHILE intSubscript <= intSIZE
        IF StrNames(intPass) > StrNames(intSubscript) THEN
            strTemp = StrNames(intSubscript)
            StrNames(intSubscript) = StrNames(intPass)
            StrNames(intPass) = strTemp
        END IF
        intSubscript = intSubscript + 1
    LOOP
    intPass = intPass + 1
LOOP
END SUB

SUB B030Searchtable
DIM StrNameID AS STRING
DIM IntLow AS INTEGER
DIM IntHigh AS INTEGER
DIM strFound AS STRING
DIM intMid AS INTEGER
INPUT "What is the name"; StrNameID
IntLow = 1
IntHigh = intSIZE
strFound = "NO"
DO WHILE IntLow <= IntHigh AND strFound = "NO"
    intMid = INT((IntLow + IntHigh) / 2)
    IF StrNameID = StrNames(intMid) THEN
        PRINT "NAME FOUND"
        PRINT StrNameID
        strFound = "YES"
    ELSE

        IF StrNameID < StrNames(intMid) THEN
            IntHigh = intMid - 1
        ELSE
            IntLow = intMid + 1
        END IF
    END IF
LOOP
IF strFound = "NO" THEN
    PRINT "NAME NOT FOUND"
END IF
END SUB

SUB B040WriteArray
DIM intSubscript AS INTEGER
OPEN "Name.txt" FOR OUTPUT AS #2
intSubscript = 1
DO WHILE intSubscript <= intSIZE
    WRITE #2, StrNames(intSubscript)
    intSubscript = intSubscript + 1
LOOP
CLOSE #2
END SUB

SUB C000PrintHeadings (strTitle AS STRING)
DIM strNewPage AS STRING
PRINT
PRINT "Press Enter to see page"; intPageCount;
INPUT strNewPage
CLS
PRINT strTitle, "Page"; intPageCount
PRINT
PRINT "Names"
PRINT
intLineCount = 0
intPageCount = intPageCount + 1
END SUB