#!/usr/bin/zsh

input_f=input.txt
output_f=output.txt
error_f=error.log

if [ -f $input_f ]; then
    echo "$input_f content:"
    cat $input_f
    echo $(wc -l < $input_f) > $output_f
else
    echo "File doesnt exist"
    ls -l $input_f 2> $error_f
fi
