#!/bin/bash
FILE='filter.c'
ASSIGN='filter'

# Test 1 - Basic test with stdin
echo "abcdefaaaabcdeabcabcdabc" | bash .system/auto_correc_program_std.sh $FILE $ASSIGN "abc"
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

# Test 2 - Different pattern with stdin
echo "ababcabababc" | bash .system/auto_correc_program_std.sh $FILE $ASSIGN "ababc"
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

# Test 3 - Empty input with stdin
echo "" | bash .system/auto_correc_program_std.sh $FILE $ASSIGN "abc"
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

# Test 4 - Single occurrence with stdin
echo "helloabcworld" | bash .system/auto_correc_program_std.sh $FILE $ASSIGN "abc"
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

# Test 5 - No occurrences with stdin
echo "helloworld" | bash .system/auto_correc_program_std.sh $FILE $ASSIGN "xyz"
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

# Test 6 - Multiple lines with stdin
echo -e "abc\n123abc456\nxyz" | bash .system/auto_correc_program_std.sh $FILE $ASSIGN "abc"
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

touch .system/grading/passed