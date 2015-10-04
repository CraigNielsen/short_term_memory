#!/bin/bash
# Steve Litt's ALSA Troubleshooting Tools, Version 0.01
# Copyright (C) 2013 by Steve Litt
# No Warranty, use at your own risk.
# Expat license, see COPYING file

echo WARNING: DO NOT WEAR HEADPHONES WHILE RUNNING THIS PROGRAM
echo HEADPHONES COULD CAUSE DEAFNESS DUE TO VOLUME CHANGES

./choose_card.sh
data_file=junk_data.txt
cardno=$?

echo FINDING MUTES ALL MUTES FOR CARD $cardno

amixer -c $cardno scontents | ./printmutes.awk  > $data_file
less $data_file
echo
echo To see this again without running the program, look at $data_file

