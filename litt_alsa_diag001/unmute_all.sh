#!/bin/bash
# Steve Litt's ALSA Troubleshooting Tools, Version 0.01
# Copyright (C) 2013 by Steve Litt
# No Warranty, use at your own risk.
# Expat license, see COPYING file

echo
echo WARNING: DO NOT WEAR HEADPHONES WHILE RUNNING THIS PROGRAM
echo HEADPHONES COULD CAUSE DEAFNESS DUE TO VOLUME CHANGES
echo

script_fname=junk_unmute.sh
./choose_card.sh
cardno=$?

echo UNMUTING ALL FOR CARD $cardno

amixer -c $cardno scontents | ./make_unmutescript.awk  > $script_fname
chmod u+x $script_fname
./$script_fname

echo
echo WARNING: EVERYTHING ON CARD $cardno IS NOW UNMUTED, EVEN MIKES
echo See $script_fname

