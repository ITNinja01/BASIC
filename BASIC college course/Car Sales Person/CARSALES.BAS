'Program:       Car Sales Person
'Programmer:    David Willson
'Date:          February 27, 2008
'Abstract:      This program has the user eneter how many cars they sold.
'               After that it asks for the price of each car sold. Then
'               it takes the information from the user and display average,
'               highest and lowest sales.
CLS
'define the fields
DIM intCount AS INTEGER
DIM intCars AS INTEGER
DIM strName AS STRING
DIM sngSales AS SINGLE
DIM sngAverage AS SINGLE
DIM sngHigh AS SINGLE
DIM sngLow AS SINGLE
DIM sngTotal AS SINGLE
'set variables
intCount = 0
sngHigh = 0
sngLow = 999999
'get header record from user
INPUT "What is your name"; strName
INPUT "How many cars did you sale today"; intCars
'check for no data
IF intCars = 0 THEN
    sngLow = 0
    sngAverage = 0
ELSE
    'process the car sales
    DO WHILE intCount < intCars
    intCount = intCount + 1
    PRINT "How much was car"; intCount
    INPUT sngSales
    sngTotal = sngTotal + sngSales
    IF sngSales > sngHigh THEN
       sngHigh = sngSales
    END IF
    IF sngSales < sngLow THEN
       sngLow = sngSales
    END IF
    LOOP
    sngAverage = sngTotal / intCars
END IF
'display the output
PRINT "The Highest Sale is "; sngHigh
PRINT "The Lowest Sale is "; sngLow
PRINT "The Average Sale is "; sngAverage
END