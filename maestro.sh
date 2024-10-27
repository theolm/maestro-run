#!/bin/bash

APK_PATH="$1"
RECORD="$2"
VIDEO_RES="$3"
BIT_RATE="$4"
TEST_PATH="$5"

adb install "$APK_PATH"

# Start screen recording with inputs for bit-rate and video resolution
if [ "$RECORD" = "true" ]; then \
  adb shell "screenrecord --bugreport --size $VIDEO_RES --bit-rate $BIT_RATE /data/local/tmp/maestro.mp4 & echo \$! > /data/local/tmp/screenrecord_pid.txt" & \
fi

# Run Maestro tests.
"$HOME/.maestro/bin/maestro" test --format junit --output "$HOME/.maestro/tests/report.xml" "$TEST_PATH" || true

# Stop screen recording and pull the video file
if [ "$RECORD" = "true" ]; then \
  adb shell "kill -2 \$(cat /data/local/tmp/screenrecord_pid.txt)" || true ; \
  sleep 1 ; \
  adb pull /data/local/tmp/maestro.mp4 /home/runner/.maestro/tests/ || true ; \
fi