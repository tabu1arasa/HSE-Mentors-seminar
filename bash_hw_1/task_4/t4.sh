#!/usr/bin/zsh

hello_func() {
    echo "Hello, $1!"
}

my_sum() {
    s=$(($1+$2))
    echo "Sum ($1 + $2) = $s"
}

hello_func $1
my_sum 3 5
