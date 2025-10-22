#!/bin/bash
FILE='tsp.c'
ASSIGN='tsp'

# Test 1: square pattern
echo -e "1, 1\n0, 1\n1, 0\n0, 0" | bash .system/auto_correc_program_std.sh $FILE $ASSIGN
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

# Test 2: line of cities
echo -e "0, 0\n1, 0\n2, 0\n3, 0" | bash .system/auto_correc_program_std.sh $FILE $ASSIGN
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

# Test 3: triangle pattern
echo -e "0, 0\n1, 0\n0.5, 0.866" | bash .system/auto_correc_program_std.sh $FILE $ASSIGN
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

# Test 4: single city (should be 0.00)
echo "5, 5" | bash .system/auto_correc_program_std.sh $FILE $ASSIGN
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

# Test 5: two cities
echo -e "0, 0\n3, 4" | bash .system/auto_correc_program_std.sh $FILE $ASSIGN
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

# Test 6: example from problem description
echo -e "0, 0\n1, 0\n2, 0\n0, 1\n1, 1\n2, 1\n1, 2\n2, 2" | bash .system/auto_correc_program_std.sh $FILE $ASSIGN
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

# Test 7: rectangle pattern
echo -e "0, 0\n2, 0\n0, 1\n2, 1" | bash .system/auto_correc_program_std.sh $FILE $ASSIGN
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

# Test 8: pentagon pattern
echo -e "0, 1\n0.951, 0.309\n0.588, -0.809\n-0.588, -0.809\n-0.951, 0.309" | bash .system/auto_correc_program_std.sh $FILE $ASSIGN
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

echo "All tsp tests passed successfully!"