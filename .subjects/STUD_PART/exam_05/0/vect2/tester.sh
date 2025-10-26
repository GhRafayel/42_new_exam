#!/bin/bash
FILE='vect2.cpp'
ASSIGN='vect2'

# Test 1 - test1.txt
bash .system/auto_correc_cpp.sh $FILE $ASSIGN
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

touch .system/grading/passed