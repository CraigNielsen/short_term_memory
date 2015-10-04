#!/usr/bin/awk -We
# Steve Litt's ALSA Troubleshooting Tools, Version 0.01
# Copyright (C) 2013 by Steve Litt
# No Warranty, use at your own risk.
# Expat license, see COPYING file

# WARNING: DO NOT WEAR HEADPHONES WHILE RUNNING THIS PROGRAM
# HEADPHONES COULD CAUSE DEAFNESS DUE TO VOLUME CHANGES
# PRESS ENTER AFTER READING THIS MESSAGE

/^\S/ {
	heading = $0
	mutes=0
}

/\[off\]/ {
	mutes++
	if(mutes == 1){
		print heading
		}
	print $0
}

