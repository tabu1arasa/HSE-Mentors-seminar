#!/usr/bin/bash

# bash(version > 4.0) only implementation

declare -A kv

# subtask (1)
for f in *; do
    # echo "$f"
    filetype=$(file -b $f)
    # echo "$filetype"
    kv+=( [$f]=$filetype )
done

# subtask (2)
if [ -z $"${kv[$1]}" ]; then
    echo "File $1 doesnt exist in current directory"
else
    echo "File $1 exists in current directory"
fi

# subtask (3)
for key in "${!kv[@]}"; do
    info=$(stat -c "name: %n permissions: %a" ${key})
    echo "$info"
done
