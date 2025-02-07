#!/bin/bash

LOGFILE="./sys_health.log"  # Save log file in the current directory

# Function to log and check CPU usage (using wmic)
check_cpu() {
    CPU_USAGE=$(cmd.exe /c "wmic cpu get loadpercentage" | awk 'NR==2 {print $1}')
    echo "$(date): CPU Usage: ${CPU_USAGE}%" >> $LOGFILE
}

# Function to log and check Memory usage (using wmic)
check_memory() {
    MEM_INFO=$(cmd.exe /c "wmic OS get FreePhysicalMemory,TotalVisibleMemorySize" | awk 'NR==2 {print}')
    TOTAL_MEM=$(echo $MEM_INFO | awk '{print $2}')
    FREE_MEM=$(echo $MEM_INFO | awk '{print $1}')
    if [[ -n "$TOTAL_MEM" && -n "$FREE_MEM" ]]; then
        USED_MEM=$((TOTAL_MEM - FREE_MEM))
        MEM_USAGE=$((100 * USED_MEM / TOTAL_MEM))
        echo "$(date): Memory Usage: ${MEM_USAGE}%" >> $LOGFILE
    else
        echo "$(date): Memory Usage: Error fetching data" >> $LOGFILE
    fi
}

# Function to log and check Disk usage (using wmic)
check_disk() {
    DISK_INFO=$(cmd.exe /c "wmic logicaldisk get size,freespace,caption" | awk 'NR==2 {print}')
    TOTAL_DISK=$(echo $DISK_INFO | awk '{print $2}')
    FREE_DISK=$(echo $DISK_INFO | awk '{print $1}')
    if [[ -n "$TOTAL_DISK" && -n "$FREE_DISK" ]]; then
        USED_DISK=$((100 * (TOTAL_DISK - FREE_DISK) / TOTAL_DISK))
        echo "$(date): Disk Usage: ${USED_DISK}%" >> $LOGFILE
    else
        echo "$(date): Disk Usage: Error fetching data" >> $LOGFILE
    fi
}

# Function to list top 5 processes consuming CPU (using tasklist)
top_processes() {
    echo "$(date): Top 5 CPU-consuming processes:" >> $LOGFILE
    cmd.exe /c "tasklist /fo csv" | head -6 >> $LOGFILE
}

# Run all functions
check_cpu
check_memory
check_disk
top_processes

echo "System Health Check Completed. Logs saved at $LOGFILE"
