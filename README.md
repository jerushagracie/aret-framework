# aret-framework

A Bash utility for basic network reconnaissance: it checks the local environment, shows the local IP, tests connectivity and ping-sweeps a /24 subnet for live hosts.

## What it does
| Stage | Action |
|---|---|
| 1 | Checks whether the system looks like a virtual machine (searches /proc/cpuinfo and dmesg) and prints the local IP address |
| 2 | Tests internet connectivity by pinging 8.8.8.8 |
| 3 | Ping-sweeps 10.120.163.1 to 10.120.163.254 and lists hosts that reply |

## Requirements
Linux (tested on Ubuntu under WSL2), bash, ping, awk, grep and the `ip` command.

## Usage
    chmod +x aret_framework.sh
    ./aret_framework.sh

## Limitations
- The scanned subnet is hard-coded in the script.
- Hosts that block ICMP ping are not detected.
- Results are printed to the terminal only (no log file yet).
- The scan is sequential and can take several minutes.

## Legal and ethical use
Use this tool only on networks and systems you own or have written permission to test.

Author: Jerusha Gracie J
