#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    auto_correc_program_std.sh                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jcluzet <jcluzet@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/20 02:26:11 by jcluzet           #+#    #+#              #
#    Updated: 2023/12/14 15:24:12 by jcluzet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FILE="../../rendu/$2/$1"

tmp=""
timeout=1

if [ -e .system/grading/traceback ]; then
    rm .system/grading/traceback
fi

cd .system/grading

# Create temporary file for stdin input
cat > input_temp.txt

# Compile and run REFERENCE solution (the correct one)
gcc -Wall -Wextra -Werror "$1" -o source -lm 2>/dev/null
# gcc -o source "$1" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Error: Reference compilation failed" >&2
    rm -f input_temp.txt
    exit 1
fi

./source "${@:3}" < input_temp.txt | cat -e > sourcexam
rm -f source

# Compile and run STUDENT solution
gcc -Wall -Wextra -Werror "$FILE" -o final -lm 2>.dev
# gcc -o final "$FILE" 2>.dev
COMPILE_SUCCESS=$?

if [ $COMPILE_SUCCESS -eq 0 ] && [ -f final ]; then
    {
        ./final "${@:3}" < input_temp.txt | cat -e > finalexam &
        PID=$!
    } 2>/dev/null

    # Timeout loop (20 seconds max)
    timeout=1
    for i in {1..20}; do
        sleep 1
        if [ $i -eq 5 ] || [ $i -eq 10 ] || [ $i -eq 15 ] || [ $i -eq 19 ]; then
            echo "waiting..." >&2
        fi
        if ! ps -p $PID > /dev/null 2>&1; then
            timeout=0
            break
        fi
    done

    # Kill if still running after timeout
    if ps -p $PID > /dev/null 2>&1; then
        kill $PID 2>/dev/null
        wait $PID 2>/dev/null
        timeout=1
    fi
else
    # Compilation failed
    timeout=0
    touch finalexam  # Create empty file to trigger diff
fi

# Compare outputs
DIFF=$(diff sourcexam finalexam 2>/dev/null)
if [ "$DIFF" != "" ] || [ $timeout -eq 1 ]; then
    echo "----------------8<-------------[ START TEST " >> traceback
    printf "        💻 TEST\n./a.out " >> traceback
    for i in "${@:3}"; do
        printf "\"$i\" " >> traceback
    done
    printf "\n        🔎 YOUR OUTPUT:\n" >> traceback
    
    if [ -f finalexam ]; then
        cat finalexam >> traceback
    else
        printf "[NO OUTPUT]\n" >> traceback
    fi
    
    if [ $timeout -eq 1 ]; then
        printf "   ❌ TIMEOUT\n" >> traceback
    elif [ -f final ]; then
        printf "        🗝 EXPECTED OUTPUT:\n" >> traceback
        cat sourcexam >> traceback
    else
        printf "\n"
        if [ -f .dev ]; then
            cat .dev >> traceback
            rm -f .dev
        fi
        printf "\n        ❌ COMPILATION ERROR\n" >> traceback
    fi
    echo "----------------8<------------- END TEST ]" >> traceback
fi

# Cleanup
rm -f final finalexam sourcexam input_temp.txt .dev 2>/dev/null
cd ../..