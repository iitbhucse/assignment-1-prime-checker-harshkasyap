#!/bin/bash

gcc -o student_prog submissions/student_code.c
if [ $? -ne 0 ]; then
    echo "Compilation Error"
    exit 1
fi

pass=0
total=5

for i in {1..5}; do
    ./student_prog < testcases/input$i.txt > myout.txt
    diff -w myout.txt testcases/output$i.txt > /dev/null
    if [ $? -eq 0 ]; then
        echo "Test case $i: PASS"
        pass=$((pass+1))
    else
        echo "Test case $i: FAIL"
    fi
done

echo "Total Passed: $pass / $total"
