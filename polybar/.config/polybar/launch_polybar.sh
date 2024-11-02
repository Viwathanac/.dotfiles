# <<Removing all Polybars>>
killall -q polybar

# <<Launching Polybar>>
echo "---" | tee -a /tmp/polybar1.log 
polybar toph 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars Launched"

# This should be the script used when Monitor and Laptop 
# isn't Mirrored
# :%s/##//g to remove the comments

##if type "xrandr" ; then
	##for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		##MONITOR=$m polybar --reload toph &
	##done
##else
	##polybar --reload toph &
##fi
##
