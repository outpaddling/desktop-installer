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
warning_time=15

low_time=30

low_percent=40
high_percent=80

# Start high to detect first drop
battery_time=1000               # For previous_battery_time if plugged in
previous_battery_time=1000
previous_battery_percent=101

# seconds to pause between script runs
battery_check_interval=60

log="/var/log/battery-shutdown"
printf "Started $(date)\n" > $log

while true; do
    ac_power=$( /sbin/sysctl -n hw.acpi.acline )
    
    if [ $ac_power = 0 ]; then
	battery_time=$( /sbin/sysctl -n hw.acpi.battery.time )
	battery_percent=$( /sbin/sysctl -n hw.acpi.battery.life )
	if [ $battery_time -ge 0 ]; then
	    if [ $battery_time -le $critical_time ]; then
		printf "Battery down to $critical_time minutes $(date)\n" >> $log
	    
		# Recheck for external power before shutting down
		ac_power=$( /sbin/sysctl -n hw.acpi.acline )
		if [ $ac_power = 0 ]
		    then /sbin/shutdown -p now
		fi
	    elif [ $battery_time -le $warning_time ]; then
		printf "Battery down to $warning_time minutes $(date)\n" >> $log
		display_users=$(ps -aexwwj | grep "DISPLAY=$DISPLAY_ID" | awk '{ print $1 }' | sort -u)
		for user in $display_users; do
		    if su -l $user -c "zenity --display=:0 --warning --text='Battery run time is very low.\nThe computer will be shut down\nsoon to prevent battery damage.'" > /dev/null; then
			break
		    fi
		done
	    elif [ $previous_battery_time -ge $low_time ] && \
		 [ $battery_time -le $low_time ]; then
		printf "Battery down to $low_time minutes $(date)\n" >> $log
		display_users=$(ps -aexwwj | grep "DISPLAY=$DISPLAY_ID" | awk '{ print $1 }' | sort -u)
		for user in $display_users; do
		    if su -l $user -c "zenity --display=:0 --warning --text='Battery run time is getting low.\nConsider plugging in.'" > /dev/null; then
			break
		    fi
		done
	    fi
	fi

	if [ $previous_battery_percent -gt $low_percent ] && \
	   [ $battery_percent -le $low_percent ]; then
		printf "Battery down to $low_percent% $(date)\n" >> $log
		display_users=$(ps -aexwwj | grep "DISPLAY=$DISPLAY_ID" | awk '{ print $1 }' | sort -u)
		for user in $display_users; do
		    if su -l $user -c "zenity --display=:0 --warning --text='Battery has dropped to $low_percent% charge.\nKeeping the charge of a Lithium battery between\n$low_percent% and $high_percent% will extend its life.\nNow would be a good time to plug in.'" > /dev/null; then
			break
		    fi
		done
	fi
    else
	battery_percent=$( /sbin/sysctl -n hw.acpi.battery.life )
	if [ $previous_battery_percent -lt $high_percent ] && \
	   [ $battery_percent -ge $high_percent ]; then
		printf "Battery up to $high_percent% $(date)\n" >> $log
		display_users=$(ps -aexwwj | grep "DISPLAY=$DISPLAY_ID" | awk '{ print $1 }' | sort -u)
		for user in $display_users; do
		    if su -l $user -c "zenity --display=:0 --warning --text='Battery has reached $high_percent% charge.\nKeeping the charge of a Lithium battery between\n$low_percent% and $high_percent% will extend its life.\nUnplugging now may help your battery last longer.'" > /dev/null; then
			break
		    fi
		done
	fi
    fi
    previous_battery_percent=$battery_percent
    previous_battery_time=$battery_time
    /bin/sleep $battery_check_interval
done
