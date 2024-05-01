#!/bin/bash

target="$1"
snapshots_path="$(backintime --quiet snapshots-path)"
radiolist_options=""

# Normalize the target path to ensure consistency in checks
normalized_target=$(readlink -f "$target")

# Construct radiolist options
snapshots=($(backintime --quiet snapshots-list | tail -5 | sort -r))
for ssid in "${snapshots[@]}"; do
    snapshot_dir="${snapshots_path}/$ssid/backup/${normalized_target}"

    if [ -d "$snapshot_dir" ]; then
        formatted_date="${ssid:0:4}-${ssid:4:2}-${ssid:6:2}_${ssid:9:2}:${ssid:11:2}:${ssid:13:2}"
        radiolist_options+=" \"$ssid\" \"$formatted_date\" \"off\""
    else
        echo "Directory not found in snapshot: $snapshot_dir" >> ~/.cache/backintime_debug.log
    fi
done

# Check if options were constructed
if [ -z "$radiolist_options" ]; then
    echo "No snapshots available that contain the directory: $normalized_target" >> ~/.cache/backintime_debug.log
    kdialog --error "No snapshots available that contain the directory: $normalized_target"
    exit 1
fi

# Display radiolist dialog
ssid=$(kdialog --radiolist "Select Snapshot" $radiolist_options)

# Exit if Cancel button is pressed (empty $ssid)
if [ -z "$ssid" ]; then
    echo "Snapshot selection canceled by user." >> ~/.cache/backintime_debug.log
    exit 0
fi

# Clean up ssid, remove any extraneous quotes if present
clean_ssid=$(echo $ssid | tr -d '"')

# Debug output
echo "Selected SSID: $clean_ssid" >> ~/.cache/backintime_debug.log

# Restore from selected snapshot
if test -n "$clean_ssid"; then
    restore_output=$(backintime restore "$normalized_target" "" "$clean_ssid" 2>&1)
    echo "Restore output: $restore_output" >> ~/.cache/backintime_debug.log

    if echo "$restore_output" | grep -q "No such file or directory"; then
        kdialog --error "Failed: No such file or directory in the selected snapshot."
    else
        kdialog --msgbox "Restore completed successfully."
    fi
else
    echo "No valid snapshot selected" >> ~/.cache/backintime_debug.log
    kdialog --error "No valid snapshot selected or operation was cancelled."
fi
