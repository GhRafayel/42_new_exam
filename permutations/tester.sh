#!/bin/bash
FILE='permutations.c'
ASSIGN='permutations'

# Test 1: single character
bash .system/auto_correc_program.sh $FILE $ASSIGN "a"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 2: two characters
bash .system/auto_correc_program.sh $FILE $ASSIGN "ab"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 3: three characters
bash .system/auto_correc_program.sh $FILE $ASSIGN "abc"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 4: four characters
bash .system/auto_correc_program.sh $FILE $ASSIGN "abcd"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 5: different characters
bash .system/auto_correc_program.sh $FILE $ASSIGN "xyz"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 6: numbers as characters
bash .system/auto_correc_program.sh $FILE $ASSIGN "123"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

touch .system/grading/passed