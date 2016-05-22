#save workspace window 2 into file:
i3-save-tree --workspace 2 > ~/.i3/tut3.json
#load workspace window into 3
i3-msg "workspace 3; append_layout /home/craig/.i3/tut3.json" 