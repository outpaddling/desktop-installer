#!/bin/sh

##########################################################################
#   Description
#       Auto-shutdown on low battery.
#
#   History
#   Date        Who         Change
#   Dec 2010    J Bacon     Derived from script by DutchDaemon
##########################################################################

# Battery level critical %
critical_time=4

# Time between warning user and initiating shutdown
shutdown_delay=120

# seconds to pause between script runs
battery_check_interval=120

while true; do
    battery_time=$( /sbin/sysctl -n hw.acpi.battery.time )
    ac_power=$( /sbin/sysctl -n hw.acpi.acline )
    
    if [ $battery_time -ge 0 ] && [ $battery_time -le $critical_time ] && [ $ac_power = 0 ]
    then
	printf "Battery level is critical.\nInsert power plug within $shutdown_delay seconds to avoid shutdown.\n" | wall
	
	# Give user time to plug in
	/bin/sleep $shutdown_delay
	
	# Recheck for external power before shutting down
	ac_power=$( /sbin/sysctl -n hw.acpi.acline )
	if [ $ac_power = 0 ]
	    then /sbin/shutdown -p +1
	fi
    fi
    /bin/sleep $battery_check_interval
done

