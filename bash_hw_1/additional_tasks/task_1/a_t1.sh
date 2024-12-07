#!/usr/bin/zsh

backup_src_dir="$1"
backup_output_dir="./backup_dir"


log() {
    echo "[$(date +'%F:%R_%S')] $1" | tee -a backup.log
}

log "src_dir: $backup_src_dir"
log "output_dir: $backup_output_dir"

if [ ! -d $backup_output_dir ]; then
    mkdir $backup_output_dir
    if [ $? -eq 0 ]; then
        log "mkdir $backup_output_dir"
    else
        log "can't create $backup_output_dir"
        exit 0
    fi
fi

if [ -d $backup_src_dir ]; then
    date_fmt=+"%F"
    for f_name in $backup_src_dir/*; do
        src_p=$f_name
        target_p=$backup_output_dir/$(date $date_fmt)_$(basename $f_name)
        cp $src_p $target_p
        if [ $? -eq 0 ]; then
            log "cp $src_p -> $target_p"
        else
            log "error: can't cp $src_p -> $target_p"
        fi
    done
else
    log "Directory $backup_src_dir doesn't exist"
    echo "usage: ./a_t1.sh <dir_to_backup>"
fi
