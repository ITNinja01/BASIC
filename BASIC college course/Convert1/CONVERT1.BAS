'Program:       convert1
'Programmer:    David Willson
'Date:          January 31, 2008
'Abstract:      This program converts the number of gallons entered
'               to its equivalent in quaets and liters which are
'               displayed as output.
CLS
'define the fields
DIM intGallons AS INTEGER
DIM intQuarts AS INTEGER
DIM sngLiters AS SINGLE
'get input from user
INPUT "What is the number of gallons to be converted"; intGallons
'do the conversions
intQuarts = intGallons * 4
sngLiters = intGallons * 3.785
'display output to the user
PRINT "The number of quarts in "; intGallons; "gallon(s) is "; intQuarts
PRINT "The number of liters in "; intGallons; "gallon(s) is "; sngLiters
END