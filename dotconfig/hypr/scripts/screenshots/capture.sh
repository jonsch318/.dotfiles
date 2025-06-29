#!/bin/bash

# Screenshot script using hyprshot and zenity
# Takes a frozen screenshot to temp file, then allows user to save it with a custom name/location

# Create temporary file for screenshot
TEMP_FILE=$(mktemp --suffix=.png)

# Function to cleanup temp file on exit
cleanup() {
	rm -f "$TEMP_FILE" 2>/dev/null
}

trap cleanup EXIT

# Take screenshot modes - you can modify this to change the screenshot type
# Options: output, window, region, active
SCREENSHOT_MODE="region" # Change this to your preferred default mode

echo "Taking screenshot..."

# Take frozen screenshot to temporary file
if hyprshot -m "$SCREENSHOT_MODE" -z -f "$(basename $TEMP_FILE)" -o "$(dirname "$TEMP_FILE")" --silent; then
	echo "Screenshot captured successfully"

	# Show save dialog with zenity
	SAVE_PATH=$(zenity --file-selection --save --title='Save screenshot as' --filename='screenshot.png' 2>/dev/null)

	# Check if user didn't cancel the dialog
	if [ -n "$SAVE_PATH" ]; then
		# Copy screenshot to selected location
		if cp "$TEMP_FILE" "$SAVE_PATH"; then
			echo "Screenshot saved to: $SAVE_PATH"
			# Optional: Show success notification
			notify-send "Screenshot Saved" "Screenshot saved to $SAVE_PATH" 2>/dev/null || true
		else
			echo "Error: Failed to save screenshot to $SAVE_PATH"
			zenity --error --text="Failed to save screenshot to $SAVE_PATH" 2>/dev/null || true
		fi
	else
		echo "Save cancelled by user"
		zenity --info --text="Screenshot save cancelled" 2>/dev/null || true
	fi
else
	echo "Error: Failed to take screenshot"
	zenity --error --text="Failed to take screenshot" 2>/dev/null || true
fi
