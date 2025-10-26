#!/bin/bash

FILE1='searchable_array_bag.cpp'
FILE2='searchable_tree_bag.cpp'
FILE3='set.cpp'
FILE4='array_bag.cpp'
FILE5='tree_bag.cpp'
FILE6='main.cpp'
ASSIGN='polyset'

# ✅ Test 1
bash .system/auto_correc_polyset.sh $FILE1 $FILE2 $FILE3  $FILE4 $FILE5 $FILE6  $ASSIGN "9"
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

# ✅ Test 2
bash .system/auto_correc_polyset.sh $FILE1 $FILE2 $FILE3  $FILE4 $FILE5 $FILE6  "9" "7"
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

# ✅ Test 3
bash .system/auto_correc_polyset.sh $FILE1 $FILE2 $FILE3  $FILE4 $FILE5 $FILE6  "9" "7" "4"
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

touch .system/grading/passed
