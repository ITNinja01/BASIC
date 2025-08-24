1 rem temp. conversion program
5 rem print chr$(147)
10 print "convert from fahrenheit to celsius. (f/c)" : input a$
20 if a$ = "" then 20
30 if a$ = "f" then 100
40 if a$ = <> "c" then 50
50 input "enter degrees celsius:";c
60 f = (c*9)/5+32
70 print c;" degrees celsius = "; f;"degrees fahrenheit"
80 print
90 end
100 input "enter degrees in fahrenheit:";f
110 c = (f-32)*5/9
120 print f;"degrees fahrenheit ="; c;"degrees celsius"
130 print 
140 end