#!/bin/bash
clear
echo "==================================================================="
echo "             AUTOMATED RED TEAM EMULATION               "
echo "==================================================================="
echo " [Stage 1] Running local environment and Network recovery..."
echo "==================================================================="
echo -n "[+] Analysing virtualization landscape..."
if  grep -iq 'virtualbox\|vmware\|kvm\|qemu' /proc/cpuinfo /var/log/dmesg 2>/dev/null; then
     echo "Secure Virtual Machine detected"
else 
     echo "Linux environment/Sandbox detected"
fi
echo ""
echo -n "[+] Discovering local network target...."
LOCAL_IP=$(ip route get 1 | awk  '{print $7}')
echo "$LOCAL_IP"
echo "==================================================================="
echo " [Stage 2] Running automated Gateway analysis..."
echo -n "[+] Pinging Network Gateway router...."
if ping -c 1 -w 1  8.8.8.8 >/dev/null 2>&1; then
    echo "Gateway recovery successful (ONLINE)"
else
    echo "Gateway unreachable  (OFFLINE/ISOLATED)"
fi


echo ""
echo "=========================================================================="
echo "[Stage 3] Launching live target  discovery engine...."
echo "==========================================================================="p
for ip in {1..254}; do
   ping -c 1 -W 1 10.120.163.$ip >/dev/null 2>&1 
   if [ $? -eq 0 ]; then
       echo "[!] Target found: 10.120.163.$ip"
   fi
done
echo "[+] Subnet scan complete."
