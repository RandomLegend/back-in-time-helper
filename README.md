# Back In Time Helper

![logo](assets/images/back-in-time-helper-logo.png)

# dolphin-backintime-servicemenu

This is a bash script that is called from a Dolphin Service Menu to restore the selected folder. Also does proper error handling. This script was modified with the help of ChatGPT4. 

# Use at your own Risk
Make sure you either understand what the bash script does, or let someone else read through it. I don't want your system to go downhill just because you copied some bash script off of github!

# Installation:

Copy the BackInTime.desktop file and paste it into ~/.local/share/kio/servicemenus/
then make it executable.

Next, copy the restore_snapshot.sh file into a folder you want, make it executable aswell and change your BackInTime.desktop from before so the "Exec=/path/to/your/restore_snapshot.sh" points to the correct path you chose.

You can now enable it in your Dolphin Context Menu settings and start restoring your folders. You will find a backintime_debug.log file in your ~/.cache where you can see exactly what happens.

[bitdoc]: https://backintime.readthedocs.io/en/latest/
