# Back In Time Helper

![logo](assets/images/back-in-time-helper-logo.png)

# dolphin-backintime-servicemenu

This is a bash script that is called from a Dolphin Service Menu to restore the selected folder. Also does proper error handling. This script was modified with the help of ChatGPT4. 

# Use at your own Risk
Make sure you either understand what the bash script does, or let someone else read through it. I don't want your system to go downhill just because you copied some bash script off of github!

# Installation:

You can decide how you want your Contextmenu to look like. There are three .desktop entries available. The BackInTime-Helper.desktop will give you one entry in your Contextmenu with a submenu where you can find the restore and the open actions.
Or you can add either or both of the individual actions to your context menu so they show up without any submenu. Whatever you want, simply drop the relevant .desktop entry into ~/.local/share/kio/servicemenus/ and then make it executable.

Next, copy the restore_snapshot.sh file and/or the open_snapshot.sh into a folder you want, make it executable aswell and change your .desktop entries from before so the "Exec=/path/to/your/restore_OR_open_snapshot.sh" points to the correct path you chose.

You can now enable it in your Dolphin Context Menu settings and start restoring your folders. You will find a backintime_debug.log file in your ~/.cache where you can see exactly what happens.

[bitdoc]: https://backintime.readthedocs.io/en/latest/
