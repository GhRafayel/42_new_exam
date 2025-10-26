#!/bin/bash
FILE='ft_popen.c'
ASSIGN='ft_popen'

bash .system/auto_correc_main.sh $FILE $ASSIGN 
if [ -e .system/grading/traceback ]; then
    mv .system/grading/traceback .
    exit 1
fi

touch .system/grading/passed