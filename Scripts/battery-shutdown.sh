#!/bin/sh

##########################################################################
#   Description
#       Auto-shutdown on low battery.
#
#   History
#   Date        Who         Change
#   Dec 2010    J Bacon     Derived from script by DutchDaemon
#   Jul 2023    J Bacon     Add zenity messages
##########################################################################

# Important remaining run times
critical_time=5
warning_time=20
low_time=30
low_notified=no

# Time between warning user and initiating shutdown
shutdown_delay=30

# seconds to pause between script runs
battery_check_interval=60

log="/var/log/battery-shutdown"
printf "Started $(date)\n" > $log

while true; do
    ac_power=$( /sbin/sysctl -n hw.acpi.acline )
    
    if [ $ac_power = 0 ]; then
	battery_time=$( /sbin/sysctl -n hw.acpi.battery.time )
	if [ $battery_time -ge 0 ]; then
	    if [ $battery_time -le $critical_time ]; then
		printf "Battery critical $(date)\n" >> $log
	    
		# Recheck for external power before shutting down
		ac_power=$( /sbin/sysctl -n hw.acpi.acline )
		if [ $ac_power = 0 ]
		    then /sbin/shutdown -p now
		fi
	    elif [ $battery_time -le $warning_time ]; then
		printf "Battery warning $(date)\n" >> $log
		display_users=$(ps -aexwwj | grep "DISPLAY=$DISPLAY_ID" | awk '{ print $1 }' | sort -u)
		for user in $display_users; do
		    if su -l $user -c "zenity --display=:0 --warning --text='The battery is very low.\nThe computer will be shut down\nsoon to prevent battery damage.'" > /dev/null; then
			break
		    fi
		done
	    elif [ $battery_time -le $low_time ] && [ $low_notified = no ]; then
		printf "Battery low $(date)\n" >> $log
		display_users=$(ps -aexwwj | grep "DISPLAY=$DISPLAY_ID" | awk '{ print $1 }' | sort -u)
		for user in $display_users; do
		    if su -l $user -c "zenity --display=:0 --warning --text='The battery is getting low.\nConsider plugging in.'" > /dev/null; then
			low_notified=yes
			break
		    fi
		done
	    fi
	fi
    fi
    /bin/sleep $battery_check_interval
done
