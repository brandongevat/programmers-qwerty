#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

NETWORK=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --network)
      NETWORK_ENABLED=true
      shift
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

# Error out
set -e

xkb_dir="/usr/share/X11/xkb"
layout_file="${xkb_dir}/rules/evdev.xml"

if [[ "$NETWORK_ENABLED" == true ]]; then
	sudo wget "https://raw.githubusercontent.com/brandongevat/programmers-qwerty/refs/heads/main/linux/programmers-qwerty" -P "${xkb_dir}/symbols/"
else
	# Setup programmers-qwerty 
	sudo cp programmers-qwerty ${xkb_dir}/programmers-qwerty
fi

# Create a backup of the original file
sudo cp "${layout_file}" "${layout_file}.backup"
echo "Created backup at ${layout_file}.backup"

# Create temporary files
tempfile=$(mktemp)

# Find line number of </layoutList>
line_num=$(grep -n "</layoutList>" "${layout_file}" | cut -d: -f1)

# Extract the part before </layoutList>
head -n $((line_num-1)) "${layout_file}" > "${tempfile}"

# Append the new layout
cat >> "${tempfile}" << 'EOF'
  <layout>
    <configItem>
      <name>programmers-qwerty</name>
      <shortDescription>English (Programmers QWERTY) </shortDescription>
      <description>English (Programmers QWERTY)</description>
      <vendor>BrandonGevat</vendor>
    </configItem>
    <variantList/>
  </layout>
EOF

# Append the rest of the file
echo "$(tail -n +${line_num} "${layout_file}")" >> "${tempfile}"

# Replace the original file
sudo cp "${tempfile}" "${layout_file}"
rm -f "${tempfile}"

echo "Layout added successfully!"
echo "To refresh the keyboard settings, you might need to run: sudo rm -rf /var/lib/xkb/*"
