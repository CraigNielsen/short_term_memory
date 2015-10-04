#!/bin/bash
# Steve Litt's ALSA Troubleshooting Tools, Version 0.01
# Copyright (C) 2013 by Steve Litt
# No Warranty, use at your own risk.
# Expat license, see COPYING file

# WARNING: DO NOT WEAR HEADPHONES WHILE RUNNING THIS PROGRAM
# HEADPHONES COULD CAUSE DEAFNESS DUE TO VOLUME CHANGES
# PRESS ENTER AFTER READING THIS MESSAGE

cardno=0
junklist=junklist.list
cardlist=mycards.list

function acquire_cardno(){
	cat $cardlist
	echo -n "Type the card number, just the number==>"
	read junk
	let junk=$junk+0
	return $junk
}

### HELP THE USER CHOOSE THE RIGHT CARD
aplay -l | grep "^card" | sed -e "s/, device .:.*//" | sort -u > $junklist
arecord -l | grep "^card"  | sed -e "s/, device .:.*//" | sort -u >> $junklist
sort -u $junklist > $cardlist

if test "`wc -l $cardlist | cut -d " " -f1`" = "1"; then
	cardno=`sed -e "s/^card //" | sed -e "s/:.*//"`
	echo "Only one card, card $cardno"
	echo $cardno
else
	echo "Multiple cards."
	acquire_cardno
	cardno=$?
	echo "Card number chosen is $cardno"
fi

rm $junklist

let cardno=$cardno+0
exit $cardno


