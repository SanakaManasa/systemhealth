SystemHealth Monitoring Script
This is a simple system health monitoring script that checks the following system parameters on a Windows machine:

CPU Usage
Memory Usage
Disk Usage
Top 5 CPU-consuming Processes
The script logs these details in a .log file for later review.

Features:
CPU Usage: Monitors the percentage of CPU currently being used.
Memory Usage: Monitors the memory usage, including free and used memory.
Disk Usage: Monitors the disk usage (total space vs free space).
Top Processes: Lists the top 5 CPU-consuming processes running on your system.
Prerequisites:
This script is designed to run on Windows using the Command Prompt.
wmic and tasklist commands are used to retrieve system information.
How to Use:

Download the Script:
Download or copy the script and save it as sys_health.sh on your system.

Run the Script:
Open Command Prompt or Windows PowerShell as an administrator.
Navigate to the directory where sys_health.sh is saved.

Run the following command to execute the script:
bash sys_health.sh

View Logs:
The script generates a log file named sys_health.log in the same directory where the script is located. This file contains the CPU, memory, disk usage, and top processes.

Example Log Output:

2025-02-07: CPU Usage: 23%
2025-02-07: Memory Usage: 58%
2025-02-07: Disk Usage: 42%
2025-02-07: Top 5 CPU-consuming processes:
"Process1", "100", "1", "12345"
"Process2", "90", "2", "23456"
"Process3", "85", "3", "34567"
"Process4", "80", "4", "45678"
"Process5", "75", "5", "56789"

Troubleshooting:
If the script does not execute properly, ensure that:
You have bash installed. You can use Git Bash or Windows Subsystem for Linux (WSL) to run bash scripts on Windows.
The wmic and tasklist commands are available in your system's command line (they should be by default in most versions of Windows).

License:
This script is free to use and modify. There is no specific license attached, so feel free to adjust it as per your needs.

