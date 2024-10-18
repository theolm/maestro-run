#!/bin/bash

adb install ${{ inputs.apk-path }}

# Run Maestro tests. Still needs to capture the exit status without stopping the script.
$HOME/.maestro/bin/maestro ${{ inputs.command }}

