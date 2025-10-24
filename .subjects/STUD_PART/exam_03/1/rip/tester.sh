#!/bin/bash
FILE='rip.c'
ASSIGN='rip'

# Test 1: simple unbalanced case - one extra opening
bash .system/auto_correc_program.sh $FILE $ASSIGN "'(()'"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 2: already balanced - should output original
bash .system/auto_correc_program.sh $FILE $ASSIGN "'((()()())())'"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 3: multiple solutions case
bash .system/auto_correc_program.sh $FILE $ASSIGN "'()())()'"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 4: complex unbalanced case
bash .system/auto_correc_program.sh $FILE $ASSIGN "'(()(()('"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 5: extra closing parenthesis
bash .system/auto_correc_program.sh $FILE $ASSIGN "'())'"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 6: multiple extra opening
bash .system/auto_correc_program.sh $FILE $ASSIGN "'((('"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 7: multiple extra closing
bash .system/auto_correc_program.sh $FILE $ASSIGN "')))'"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 8: alternating unbalanced
bash .system/auto_correc_program.sh $FILE $ASSIGN "')(()'"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 9: complex multiple solutions
bash .system/auto_correc_program.sh $FILE $ASSIGN "'()(()))'"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

# Test 10: single character cases
bash .system/auto_correc_program.sh $FILE $ASSIGN "'('"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

bash .system/auto_correc_program.sh $FILE $ASSIGN "')'"
if [ -e .system/grading/traceback ];then
    mv .system/grading/traceback .
    exit 1
fi

touch .system/grading/passed