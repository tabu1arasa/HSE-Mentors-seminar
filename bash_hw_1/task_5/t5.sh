#!/usr/bin/zsh

# включаем управление задачами
set -m

run_tasks() {
    start_sleep=2
    end_sleep=8
    cur_sleep=$start_sleep
    while [ $cur_sleep -le $end_sleep ]; do
        echo $cur_sleep
        ((cur_sleep *= 2))
        sleep $cur_sleep &
    done
}

# посмотрим список всех фоновых задач
# + отмечена текущая активная задача
# - отмечена предыдущая активная задача (в данный момент в фоне)
run_tasks
jobs -l

# сменим активную задачу на 3
fg %3
jobs -l

# уберём активную задачу(3) в фоновые
bg %3
jobs -l
