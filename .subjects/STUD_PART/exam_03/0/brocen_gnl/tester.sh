#!/bin/bash
FILE='get_next_line.c'
ASSIGN='brocen_gnl'


# Test 1 - test1.txt
bash .system/auto_correc_main.sh $FILE $ASSIGN "test1.txt"
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

# Test 2 - test2.txt
bash .system/auto_correc_main.sh $FILE $ASSIGN "test2.txt"
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

# Test 3 - test3.txt
bash .system/auto_correc_main.sh $FILE $ASSIGN "test3.txt"
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

# Test 4 - test4.txt
bash .system/auto_correc_main.sh $FILE $ASSIGN "test4.txt"
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

# Test 5 - test5.txt
bash .system/auto_correc_main.sh $FILE $ASSIGN "test5.txt"
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

# Test 5 - empty.txt
bash .system/auto_correc_main.sh $FILE $ASSIGN "empty.txt"
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

touch .system/grading/passed