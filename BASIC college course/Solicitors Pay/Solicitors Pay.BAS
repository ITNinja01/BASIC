'Program:       Solicitors Pay
'Programmer:    David Willson
'Date:          February 19, 2008
'Abstract:      This program displays telephone solicitors pay by what               
'		their commission rate
CLS
'define the fields
DIM strName AS STRING
DIM sngJobCode AS SINGLE
DIM sngSales AS SINGLE
DIM sngHours AS SINGLE
DIM sngHourly AS SINGLE
DIM sngNetPay AS SINGLE
DIM sngGross AS SINGLE
DIM sngCommRate AS SINGLE
DIM sngWithHolding AS SINGLE
DIM sngCommAmount AS SINGLE
'get input from user
INPUT "What is your name"; strName
INPUT "What is your job code"; sngJobCode
INPUT "How much did you sale"; sngSales
INPUT "How many hours did you work"; sngHours
'determine comission rate
SELECT CASE sngJobCode
   CASE 1
      sngCommRate = 0
   CASE 2
      sngCommRate = .05
   CASE 3
      sngCommRate = .1
   CASE 4
      sngCommRate = .125
   CASE ELSE
      PRINT " That is not a valid job code!"
      sngCommRate = 0
END SELECT
'do the math
sngHourly = sngHours * 6.5
sngCommAmount = sngSales * sngCommRate
sngGross = sngHourly + sngCommAmount
sngWithHolding = sngGross * .25
sngNetPay = sngGross - sngWithHolding
'display output of pay
PRINT "Your Hourly pay is"
PRINT USING "$$,###.##"; sngHourly
PRINT "Your Commission Rate is"; sngCommRate
PRINT "Your Commission Amount is";
PRINT USING "$$,###.##"; sngCommAmount
PRINT "Your Gross pay is";
PRINT USING "$$,###.##"; sngGross
PRINT "Your With-Holding is";
PRINT USING "$$,###.##"; sngWithHolding
PRINT "Your Net pay is";
PRINT USING "$$,###.##"; sngNetPay
END