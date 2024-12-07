#!/usr/bin/zsh

total=0
used=0

mem_usage() {
    total=$(cat /proc/meminfo | grep MemTotal | awk '{$1=$1;print}' | awk '{print $2}')
    available=$(cat /proc/meminfo | grep MemAvailable | awk '{$1=$1;print}' | awk '{print $2}')
    used=$((total - available))
}

check_mem() {
    # probably not portable
    usage_percent=$(printf %.0f\\n $((100000000 * used / total))e-6)
    if [ $usage_percent -ge 80 ]; then
        return 1
    fi
    return 0
}

print_cpu_usage() {
    # need sysstat package
    which mpstat > /dev/null
    if [ $? -eq 0 ]; then
        echo "Cpu usage:"
        mpstat 2 1 | tail -n 3
    else
        echo "Can't get CPU usage information. Install sysstat|mpstat package before usage"
    fi
}

print_disk_usage() {
    echo "Disk usage:"
    df -h | awk '{print $1, $5}' | grep -E "/dev/\w+"
}

mem_usage
check_mem
if [ $? -eq 1 ]; then
    echo "\033[0;31mHigh memory usage\033[0m"
    ps aux --sort -rss | head -n 11 | awk '{print $2, $11}'
else
    echo "\033[0;32mLess than 80% of memory used\033[0m"
fi
print_cpu_usage
print_disk_usage
