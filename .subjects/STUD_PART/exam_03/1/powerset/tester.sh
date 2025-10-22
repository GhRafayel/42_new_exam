#!/bin/bash
FILE='powerset.c'
ASSIGN='powerset'

# Test 1: basic test with single solution
bash .system/auto_correc_program.sh $FILE $ASSIGN "5 1 2 3 4 5"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 2: multiple solutions
bash .system/auto_correc_program.sh $FILE $ASSIGN "12 5 2 1 8 4 3 7 11"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 3: zero sum with negative numbers
bash .system/auto_correc_program.sh $FILE $ASSIGN "0 1 -1"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 4: no solutions
bash .system/auto_correc_program.sh $FILE $ASSIGN "7 3 8 2"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 5: complex test with many numbers
bash .system/auto_correc_program.sh $FILE $ASSIGN "3 1 0 2 4 5 3"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 6: negative target sum
bash .system/auto_correc_program.sh $FILE $ASSIGN "-1 1 2 3 4 5 -10"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 7: zero sum with mixed numbers
bash .system/auto_correc_program.sh $FILE $ASSIGN "0 -1 1 2 3 -2"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 8: medium complexity
bash .system/auto_correc_program.sh $FILE $ASSIGN "13 65 23 3 4 6 7 1 2"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 9: sequence 0-9
bash .system/auto_correc_program.sh $FILE $ASSIGN "10 0 1 2 3 4 5 6 7 8 9"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 10: large set (stress test)
bash .system/auto_correc_program.sh $FILE $ASSIGN "100 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

echo "All powerset tests passed successfully!"