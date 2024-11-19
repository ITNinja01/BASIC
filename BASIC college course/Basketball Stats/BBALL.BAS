'Program:       Basketball Stats
'Programmer:    David Willson
'Date:          April 02, 2008
'Abstract:      This program inputs from a data file and output the data
'               into stats which are in rows and columns.

DECLARE SUB B000InputData ()
DECLARE SUB B010PlayerTotals ()
DECLARE SUB B020GameTotals ()
CLS
CONST intPLAYERS = 10
CONST intGAMES = 3
DIM SHARED sngScores(intPLAYERS, intGAMES) AS SINGLE
CALL B000InputData
CALL B010PlayerTotals
CALL B020GameTotals
END

SUB B000InputData
DIM intPlayerCount AS INTEGER
DIM intGameCount AS INTEGER
OPEN "bbscores.txt" FOR INPUT AS #1
intPlayerCount = 1
DO WHILE intPlayerCount <= intPLAYERS
    intGameCount = 1
    DO WHILE intGameCount <= intGAMES
        INPUT #1, sngScores(intPlayerCount, intGameCount)
        intGameCount = intGameCount + 1
    LOOP
    intPlayerCount = intPlayerCount + 1
LOOP
CLOSE #1
END SUB

SUB B010PlayerTotals
DIM intPlayerCount AS INTEGER
DIM intGameCount AS INTEGER
DIM sngPlayerTotal AS SINGLE
PRINT "Basketball Scores"
PRINT
PRINT , " Game", "  Game", "    Game          Game"
PRINT , " 1", "     2", "       3", "    Totals"
PRINT
intPlayerCount = 1
DO WHILE intPlayerCount <= intPLAYERS
    PRINT "Player"; intPlayerCount,
    sngPlayerTotal = 0
    intGameCount = 1
    DO WHILE intGameCount <= intGAMES
        PRINT USING "###             "; sngScores(intPlayerCount, intGameCount);
        sngPlayerTotal = sngPlayerTotal + sngScores(intPlayerCount, intGameCount)
        intGameCount = intGameCount + 1
    LOOP
    PRINT USING "##          "; sngPlayerTotal / 3

    intPlayerCount = intPlayerCount + 1
LOOP
END SUB

SUB B020GameTotals
DIM intGameCount AS INTEGER
DIM intPlayerCount AS INTEGER
DIM sngGameTotal AS SINGLE
PRINT
PRINT "Game Totals:",
intGameCount = 1
DO WHILE intGameCount <= intGAMES
    sngGameTotal = 0
    intPlayerCount = 1
    DO WHILE intPlayerCount <= intPLAYERS
        sngGameTotal = sngGameTotal + sngScores(intPlayerCount, intGameCount)
        intPlayerCount = intPlayerCount + 1
    LOOP
    PRINT sngGameTotal,
    intGameCount = intGameCount + 1
LOOP
END SUB