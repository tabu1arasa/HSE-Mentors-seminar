#!/usr/bin/zsh

dir_to_sort=~/input_dir

log() {
    echo "[$(date +'%F:%R_%S')] $1" | tee -a ~/log
}

image_dir=~/Images
doc_dir=~/Documents_2

create_dir() {
    mkdir $1
    if [ $? -eq 0 ]; then
        log "mkdir $1"
    else
        log "can't create $1"
        exit 0
    fi
}

check_dirs() {
    if [ ! -d $image_dir ]; then
        create_dir $image_dir
    fi
    if [ ! -d $doc_dir ]; then
        create_dir $doc_dir
    fi
}

check_dirs

for f_name in $dir_to_sort/*; do
    if [[ $f_name == *.jpg ]] || [[ $f_name == *.png ]] || [[ $f_name == *.gif ]]; then
        target_dir=$image_dir
    elif [[ $f_name == *.txt ]] || [[ $f_name == *.pdf ]] || [[ $f_name == *.docx ]]; then 
        target_dir=$doc_dir
    fi
    if [ ! -z $target_dir ]; then 
        mv $f_name $target_dir
        if [ $? -eq 0 ]; then
            log "mv $f_name -> $target_dir"
        else
            log "error: can't mv $f_name -> $target_dir"
        fi
    fi
done
