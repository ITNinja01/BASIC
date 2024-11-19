'Program:       Disc Sale
'Programmer:    David Willson
'Date:          March 17, 2008
'Abstract:      This is a program that takes a data file and use it in the
'               program. C is for CD-RW and D is for DVD-RW.

DECLARE SUB B000BeginReport ()
DECLARE SUB B010ProcessGuests ()
DECLARE SUB B020EndReport ()
DECLARE SUB C000ReadRecord ()
DECLARE SUB C010PrintHeadings (strTitle AS STRING)
CLS
DIM SHARED strName AS STRING
DIM SHARED strDiscType AS STRING
DIM SHARED intDiscTotal AS INTEGER
DIM SHARED intEOF AS INTEGER
DIM SHARED intCountCD AS INTEGER
DIM SHARED intCountDVD AS INTEGER
DIM SHARED sngTotalPayments AS SINGLE
DIM SHARED intLineCount AS INTEGER
DIM SHARED intPageCount AS INTEGER
CONST intMAXLINES = 14
CONST sngCDRATE = 7.5
CONST sngDVDRATE = 12.75

CALL B000BeginReport
DO
    CALL B010ProcessGuests
LOOP UNTIL intEOF = 1
CALL B020EndReport
END

SUB B000BeginReport
intLineCount = intMAXLINES
intPageCount = 1
intEOF = 0
intCountCD = 0
intCountDVD = 0

sngTotalPayments = 0
OPEN "disk.txt" FOR INPUT AS #1
CALL C000ReadRecord
END SUB

SUB B010ProcessGuests
DIM sngDiscRate AS SINGLE
DIM sngAmountDue AS SINGLE
IF intLineCount >= intMAXLINES THEN
    CALL C010PrintHeadings("Guest Registration Report")
END IF
SELECT CASE strDiscType
    CASE "C", "c"
        sngDiscRate = sngCDRATE
        intCountCD = intCountCD + 1
    CASE "D", "d"
        sngDiscRate = sngDVDRATE
        intCountDVD = intCountDVD + 1
    CASE ELSE
        sngDiscRate = 0
END SELECT
sngAmountDue = sngDiscRate * intDiscTotal
sngTotalPayments = sngTotalPayments + sngAmountDue
IF sngAmountDue = 0 THEN
    PRINT strName, strDiscType, intDiscTotal, "invalid Disc type"
ELSE
    PRINT strName, strDiscType, intDiscTotal,
    PRINT USING "$$#,###.##"; sngAmountDue
END IF
intLineCount = intLineCount + 1
CALL C000ReadRecord
END SUB

SUB B020EndReport
IF sngTotalPayments = 0 THEN
    PRINT "no rooms rented today"
ELSE
    PRINT
    PRINT "The total number of CD-RW sold is"; intCountCD
    PRINT "The total number of DVD-RW boxes sold is"; intCountDVD
    PRINT "The total payments amount is";
    PRINT USING "$$#,###.##"; sngTotalPayments
END IF
CLOSE #1
END SUB

SUB C000ReadRecord
IF EOF(1) THEN
    intEOF = 1
ELSE
    INPUT #1, strName, strDiscType, intDiscTotal
END IF
END SUB

SUB C010PrintHeadings (strTitle AS STRING)
DIM strNewPage AS STRING
PRINT
PRINT "Press Enter to see page"; intPageCount;
INPUT strNewPage
CLS
PRINT strTitle, "Page"; intPageCount
PRINT
PRINT "Customer Name", "Disc Type", "Boxes", "    Payment"
PRINT
intLineCount = 0
intPageCount = intPageCount + 1
END SUB