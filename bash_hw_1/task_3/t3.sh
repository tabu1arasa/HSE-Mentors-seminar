#!/usr/bin/zsh

echo "Enter number"
read num

if [ $num -gt 0 ]; then
    echo "Positive number"
    idx=1
    while [ $idx -le $num ]; do
        echo "idx = $idx"
        ((idx++))
    done
else
    echo "Negative or zero number"
fi
