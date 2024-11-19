'Program:       Automated Teller Machine (ATM)
'Programmer:    David Willson
'Date:          February 06, 2008
'Abstract:      This program acts like a ATM and can do math for desposits and          
'               withdrawals with nested IF logic.
CLS
'define the fields
DIM strName AS STRING
DIM strAccountID AS STRING
DIM strTransCode AS STRING
DIM sngPreBalance AS SINGLE
DIM sngTransAmount AS SINGLE
DIM sngNewBalance AS SINGLE
'get input form the user
INPUT "What is your name"; strName
INPUT "What is your account ID"; strAccountID
INPUT "What was your previous balance"; sngPreBalance
INPUT "What would you like to do W for withdrawal or D for desposit"; strTransCode
INPUT "How much do you want to deposit or withdrawal"; sngTransAmount
'determine balance
IF UCASE$(strTransCode) = "W" THEN
    sngNewBalance = sngPreBalance - sngTransAmount
   ELSE
    IF UCASE$(strTransCode) = "D" THEN
       sngNewBalance = sngPreBalance + sngTransAmount
   ELSE
       sngNewBalance = sngPreBalance
END IF
END IF
'display the output to the user
PRINT "Your New Account Balance is";
PRINT USING "$$,###.##"; sngNewBalance
END