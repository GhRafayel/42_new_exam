#!/bin/bash
FILE='bsq.c'
ASSIGN='bsq'

echo "9 . o B 
...........................
....o......................
............o..............
...........................
....o......................
...............o...........
...........................
......o..............o.....
..o.......o................" > map.txt

cat map.txt | bash .system/auto_correc_program_std.sh $FILE $ASSIGN 
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

bash .system/auto_correc_program_std.sh $FILE $ASSIGN "map.txt"
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

echo "5 + X $
++++++++++++++++++++
+++X++++++++++++++++
++++++++X+++++++++++
++++++++++++++++++++
++++X+++++++++++++++" > map.txt

cat map.txt | bash .system/auto_correc_program_std.sh $FILE $ASSIGN 
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

bash .system/auto_correc_program_std.sh $FILE $ASSIGN  "map.txt"
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

echo "6 * # @
**************************
****#*********************
************#*************
**************************
****#*********************
***************#**********" > map.txt

cat map.txt | bash .system/auto_correc_program_std.sh $FILE $ASSIGN 
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi


echo "4 . o x
..........
....o.....
........
....o........." > map.txt

cat map.txt | bash .system/auto_correc_program_std.sh $FILE $ASSIGN 
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi


echo "5 . . x
....................
..... ...............
.......... ..........
....................
..... ..............." > map.txt

cat map.txt | bash .system/auto_correc_program_std.sh $FILE $ASSIGN 
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi


echo "3 * # @
***#**$**********
****#***********
***#************" > map.txt

cat map.txt | bash .system/auto_correc_program_std.sh $FILE $ASSIGN 
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi


echo ". o x
...........................
....o......................
..........................." > map.txt

cat map.txt | bash .system/auto_correc_program_std.sh $FILE $ASSIGN 
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi


echo "3 + X $
+++++++++++++++++++++++X+++++++++++++++++++++++X+++++++++" > map.txt

cat map.txt | bash .system/auto_correc_program_std.sh $FILE $ASSIGN 
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

echo "0 . o x" > map.txt

cat map.txt | bash .system/auto_correc_program_std.sh $FILE $ASSIGN 
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi
rm -f map.txt

#####################################################################


echo "9 . o B 
...........................
....o......................
............o..............
...........................
....o......................
...............o...........
...........................
......o..............o.....
..o.......o................" > map1.txt

echo "5 + X $
++++++++++++++++++++
+++X++++++++++++++++
++++++++X+++++++++++
++++++++++++++++++++
++++X+++++++++++++++" > map2.txt

echo "6 * # @
**************************
****#*********************
************#*************
**************************
****#*********************
***************#**********" > map3.txt

bash .system/auto_correc_program_std.sh $FILE $ASSIGN map1.txt  map2.txt  map3.txt
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi
rm -f map1.txt


bash .system/auto_correc_program_std.sh $FILE $ASSIGN map1.txt  map2.txt  map3.txt
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi
rm -f map2.txt
rm -f map3.txt

touch .system/grading/passed