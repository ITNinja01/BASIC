1 rem bowling Series Scoring
2 rem this program will calculate the score of a bowling series
2 rem it will then calculate the total score and the average score
9 input "enter the week number of the league:";week
10 input "enter the score of game 1:";g1
20 input "enter the score of game 2:";g2
30 input "enter the score of game 3:";g3
35 rem data validation
36 if g1 < 0 or g1 > 300 then print "invalid score for game 1": gosub 10
37 if g2 < 0 or g2 > 300 then print "invalid score for game 2": gosub 20
38 if g3 < 0 or g3 > 300 then print "invalid score for game 3": gosub 30
40 t = g1 + g2 + g3
50 av = int(t / 3)
60 print "game";tab(10);"score"
70 print "----";tab(10);"-----"
80 print 1;tab(10);g1
90 print 2;tab(10);g2
100 print 3;tab(10);g3
110 print "total";tab(10);t
120 print "average";tab(10);av