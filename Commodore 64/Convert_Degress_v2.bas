1 rem temp. conversion program
5 rem print chr$(147)
6 rem update in line 20 waits for user to input data before moving on
10 print "convert from fahrenheit to celsius. (f/c)"
20 get a$: if a$ = "" then 20
30 if a$ <> "f" then 100
40 if a$ <> "c" then 50
50 input "enter degresses celsius:";c
60 f = (c*9)/5+32
70 print c;" degresses celsius = "; f;"degresses fahrenheit"
80 print
90 end
100 input "enter degress in fahrenheit:";f
110 c = (f-32)*5/9
120 print f;"degresses fahrenheit ="; c;"degresses celsius"
130 print 
140 end
