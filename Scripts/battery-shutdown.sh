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
time=1000               # For previous_time if plugged in

previous_data=/root/.battery_data

if [ -e $previous_data ]; then
    previous_percent=$(awk '{ print $1 }' $previous_data)
    previous_time=$(awk '{ print $2 }' $previous_data)
else
    previous_percent=101
    previous_time=1000
fi

time=$( /sbin/sysctl -n hw.acpi.battery.time )
percent=$( /sbin/sysctl -n hw.acpi.battery.life )

printf "Previous percent = $previous_percent\n"
printf "Previous time    = $previous_time\n"
printf "Current percent  = $percent\n"
printf "Current time     = $time\n"

ac_power=$( /sbin/sysctl -n hw.acpi.acline )
printf "ac_power         = $ac_power\n"

display_users=$(ps -aexwwj | grep "DISPLAY=$DISPLAY_ID" | awk '{ print $1 }' | sort -u)

# Make sure root can access the local display
# NetBSD laptop, quagga
for user in $display_users; do
    su -l $user -c 'env DISPLAY=:0 xhost +local:root' > /dev/null || true
done

if [ $ac_power = 0 ]; then
    if [ $time -ge 0 ]; then
	if [ $time -le $critical_time ]; then
	    printf "Battery down to $critical_time minutes $(date)\n"
	
	    # Recheck for external power before shutting down
	    ac_power=$( /sbin/sysctl -n hw.acpi.acline )
	    if [ $ac_power = 0 ]; then
		/sbin/shutdown -p now
	    fi
	elif [ $time -le $warning_time ]; then
	    printf "Battery down to $warning_time minutes $(date)\n"
	    for user in $display_users; do
		if su -l $user -c "zenity --display=:0 --warning --text='Battery run time is very low.\nThe computer will be shut down\nsoon to prevent battery damage.' &" > /dev/null; then
		    break
		fi
	    done
	# Only show this warning once, when crossing the boundary
	elif [ $previous_time -gt $low_time ] && \
	     [ $time -le $low_time ]; then
	    printf "Battery down to $low_time minutes $(date)\n"
	    for user in $display_users; do
		if su -l $user -c "zenity --display=:0 --warning --text='Battery run time is getting low.\nConsider plugging in.' &" > /dev/null; then
		    break
		fi
	    done
	fi
    fi

    # Only show this warning once, when crossing the boundary
    if [ $previous_percent -gt $low_percent ] && \
       [ $percent -le $low_percent ]; then
	    printf "Battery down to $low_percent% $(date)\n"
	    for user in $display_users; do
		if su -l $user -c "zenity --display=:0 --warning --text='Battery has dropped to $low_percent% charge.\nKeeping the charge of a Lithium battery between\n$low_percent% and $high_percent% will extend its life.\nNow would be a good time to plug in.' &" > /dev/null; then
		    break
		fi
	    done
    fi
else
    # Only show this warning once, when crossing the boundary
    if [ $previous_percent -lt $high_percent ] && \
       [ $percent -ge $high_percent ]; then
	    printf "Battery up to $high_percent%% $(date)\n"
	    for user in $display_users; do
		if su -l $user -c "zenity --display=:0 --warning --text='Battery has reached $high_percent% charge.\nKeeping the charge of a Lithium battery between\n$low_percent% and $high_percent% will extend its life.\nUnplugging now may help your battery last longer.' &" > /dev/null; then
		    break
		fi
	    done
    fi
fi
printf "Saving previous values to $previous_data...\n"
printf "$percent $time\n" > $previous_data
