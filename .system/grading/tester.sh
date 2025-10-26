#!/bin/bash
FILE='life.c'
ASSIGN='life'

echo 'sdxddssaaww' | bash .system/auto_correc_program_std.sh $FILE $ASSIGN 5 5 0
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi


echo 'sdxssdswdxddddsxaadwxwdxwaa' | bash .system/auto_correc_program_std.sh $FILE $ASSIGN 10 6 0
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

echo 'dxss' | bash .system/auto_correc_program_std.sh $FILE $ASSIGN 3 3 0
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

echo 'dxss' |  bash .system/auto_correc_program_std.sh $FILE $ASSIGN 3 3 1
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

echo 'dxss' | bash .system/auto_correc_program_std.sh $FILE $ASSIGN 3 3 2
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi


touch .system/grading/passed