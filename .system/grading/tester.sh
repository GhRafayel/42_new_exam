#!/bin/bash
FILE='n_queens.c'
ASSIGN='n_queens'

# Test 1: n=2 (should have no solutions)
bash .system/auto_correc_program.sh $FILE $ASSIGN "2"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 2: n=3 (should have no solutions)
bash .system/auto_correc_program.sh $FILE $ASSIGN "3"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 3: n=4 (should have exactly 2 solutions)
bash .system/auto_correc_program.sh $FILE $ASSIGN "4"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 4: n=8 (should have 92 solutions)
bash .system/auto_correc_program.sh $FILE $ASSIGN "8"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 5: n=0 (should handle gracefully)
bash .system/auto_correc_program.sh $FILE $ASSIGN "0"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 6: Wrong number of arguments (no args)
bash .system/auto_correc_program.sh $FILE $ASSIGN
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 7: Wrong number of arguments (too many args)
bash .system/auto_correc_program.sh $FILE $ASSIGN "4" "5"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

touch .system/grading/passed