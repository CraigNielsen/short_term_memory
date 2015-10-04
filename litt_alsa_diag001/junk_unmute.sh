echo
echo WARNING: DO NOT WEAR HEADPHONES WHILE RUNNING THIS PROGRAM
echo HEADPHONES COULD CAUSE DEAFNESS DUE TO VOLUME CHANGES
echo PRESS ENTER AFTER READING THIS MESSAGE AND REMOVING HEADPHONES
read junk
echo
amixer -c 0  sset  'Master',0  unmute
amixer -c 0  sset  'Headphone',0  unmute
amixer -c 0  sset  'Front',0  unmute
amixer -c 0  sset  'Front Mic',0  unmute
amixer -c 0  sset  'Surround',0  unmute
amixer -c 0  sset  'Center',0  unmute
amixer -c 0  sset  'LFE',0  unmute
amixer -c 0  sset  'Line',0  unmute
amixer -c 0  sset  'IEC958',0  unmute
amixer -c 0  sset  'Beep',0  unmute
amixer -c 0  sset  'Capture',1  unmute
amixer -c 0  sset  'Rear Mic',0  unmute
