#!/usr/bin/awk -We
# Steve Litt's ALSA Troubleshooting Tools, Version 0.01
# Copyright (C) 2013 by Steve Litt
# No Warranty, use at your own risk.
# Expat license, see COPYING file

# WARNING: DO NOT WEAR HEADPHONES WHILE RUNNING THIS PROGRAM
# HEADPHONES COULD CAUSE DEAFNESS DUE TO VOLUME CHANGES
# PRESS ENTER AFTER READING THIS MESSAGE


BEGIN{
	mutes=0
	ctlstring="init"
	cardno=0
	print "echo"
	print "echo WARNING: DO NOT WEAR HEADPHONES WHILE RUNNING THIS PROGRAM"
	print "echo HEADPHONES COULD CAUSE DEAFNESS DUE TO VOLUME CHANGES"
	print "echo PRESS ENTER AFTER READING THIS MESSAGE AND REMOVING HEADPHONES"
	print "read junk"
	print "echo"
}

/^\S/ {
	ctlstring=$0
	sub(/[^']*/, "", ctlstring)
	mutes=0
}

/^\s.*\[off\]/{
	mutes++;
	if(mutes == 1){
		print "amixer -c", cardno, " sset ", ctlstring, " unmute"
	}
}
