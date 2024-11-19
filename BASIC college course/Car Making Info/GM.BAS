'Program:       Car Making Info
'Programmer:    David Willson
'Date:          April 20, 2008
'Abstract:      A 3-level, group-indicated, control break report for
'               Car Manufacturing

DECLARE SUB B000BeginProg ()
DECLARE SUB B010State ()
DECLARE SUB B020EndProg ()
DECLARE SUB C000ReadInput ()
DECLARE SUB C010BeginState ()
DECLARE SUB C020City ()
DECLARE SUB C030EndState ()
DECLARE SUB D000BeginCity ()
DECLARE SUB D010PartName ()
DECLARE SUB D020EndCity ()
DECLARE SUB E000BeginPartName ()
DECLARE SUB E010Manufacturer ()
DECLARE SUB E020EndPartName ()
DECLARE SUB F000Headings ()
CLS
DIM SHARED strEOFT AS STRING
DIM SHARED sngInfo AS SINGLE
DIM SHARED sngReportAccum AS SINGLE, sngRegAccum AS SINGLE
DIM SHARED sngPartNameAccum AS SINGLE, sngCityAccum AS SINGLE
DIM SHARED intPageCnt AS INTEGER, intLineCnt AS INTEGER
DIM SHARED strSaveCity AS STRING, strCity AS STRING, strPrintCity AS STRING
DIM SHARED strSavePartName AS STRING, strPartName AS STRING, strPrintPartName AS STRING
DIM SHARED strSaveReg AS STRING, strReg AS STRING, strPrintReg AS STRING
DIM SHARED strName AS STRING
DIM SHARED intMaxLines AS INTEGER
CALL B000BeginProg
DO WHILE strEOFT = "No"
    CALL B010State
LOOP
CALL B020EndProg
END

SUB B000BeginProg
sngReportAccum = 0
strEOFT = "No"
intMaxLines = 8
intPageCnt = 1
intLineCnt = intMaxLines
OPEN "DBH.TXT" FOR INPUT AS #1
CALL C000ReadInput
END SUB

SUB B010State
CALL C010BeginState
DO WHILE (strEOFT = "No" AND strSaveReg = strReg)
    CALL C020City
LOOP
CALL C030EndState
END SUB

SUB B020EndProg
IF sngReportAccum = 0 THEN
    PRINT "No input data"
ELSE
    PRINT , "TOTAL WEEKLY INFO ", ,
    PRINT , , , , USING "           ######"; sngReportAccum
END IF
CLOSE #1
END SUB

SUB C000ReadInput
IF EOF(1) THEN
    strEOFT = "Yes"
ELSE
    INPUT #1, strReg, strCity, strPartName, strName, sngInfo
END IF
END SUB

SUB C010BeginState
strSaveReg = strReg
strPrintReg = strReg
sngRegAccum = 0
END SUB

SUB C020City
CALL D000BeginCity
DO WHILE (strEOFT = "No" AND strSaveReg = strReg AND strSaveCity = strCity)
    CALL D010PartName
LOOP
CALL D020EndCity
END SUB

SUB C030EndState
PRINT , "TOTAL INFO FOR "; strSaveReg; " State: ",
PRINT , , , , USING "           ######"; sngRegAccum
PRINT
intLineCnt = intLineCnt + 2
sngReportAccum = sngReportAccum + sngRegAccum
END SUB

SUB D000BeginCity
strSaveCity = strCity
strPrintCity = strCity
sngCityAccum = 0
END SUB

SUB D010PartName
CALL E000BeginPartName
DO WHILE (strEOFT = "No" AND strSaveReg = strReg AND strSaveCity = strCity AND strSavePartName = strPartName)
    CALL E010Manufacturer
LOOP
CALL E020EndPartName
END SUB

SUB D020EndCity
PRINT , "TOTAL INFO FOR City "; strSaveCity; ": ", ,
PRINT , , , USING "           ######"; sngCityAccum
PRINT
intLineCnt = intLineCnt + 2
sngRegAccum = sngRegAccum + sngCityAccum
END SUB

SUB E000BeginPartName
strSavePartName = strPartName
strPrintPartName = strPartName
sngPartNameAccum = 0
END SUB

SUB E010Manufacturer
IF intLineCnt >= intMaxLines THEN
    CALL F000Headings
END IF
PRINT strPrintReg, strPrintCity, strPrintPartName, strName,
PRINT USING "###"; sngInfo
intLineCnt = intLineCnt + 1
strPrintCity = ""
strPrintPartName = ""
strPrintReg = ""
sngPartNameAccum = sngPartNameAccum + sngInfo
CALL C000ReadInput
END SUB

SUB E020EndPartName
PRINT
PRINT , "TOTAL INFO FOR PartName. "; strSavePartName; ": ", , , , , USING "           ######"; sngPartNameAccum
PRINT
intLineCnt = intLineCnt + 3
sngCityAccum = sngCityAccum + sngPartNameAccum
END SUB

SUB F000Headings
DIM strNewPage AS STRING
PRINT
PRINT "Press Enter to see page"; intPageCnt;
INPUT strNewPage
CLS
PRINT , "GM CORPORATION", "Page "; intPageCnt
PRINT , "WEEKLY REPORT"
PRINT
PRINT "State", "City", "  Part", "Manufacturers", "WEEKLY"
PRINT " NAME", "PLACE", " NAME  ", "   NAME    ", "NUMBER"
PRINT
intLineCnt = 0
intPageCnt = intPageCnt + 1
strPrintCity = strSaveCity
strPrintPartName = strSavePartName
strPrintReg = strSaveReg
END SUB