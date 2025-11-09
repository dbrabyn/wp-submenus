#!/bin/bash
# Compile .po files to .mo files
# Requires gettext to be installed: apt-get install gettext

cd "$(dirname "$0")"

for po_file in *.po; do
    if [ -f "$po_file" ]; then
        mo_file="${po_file%.po}.mo"
        echo "Compiling $po_file to $mo_file..."
        msgfmt -o "$mo_file" "$po_file"

        if [ $? -eq 0 ]; then
            echo "✓ Successfully compiled $mo_file"
        else
            echo "✗ Failed to compile $po_file"
        fi
    fi
done

echo "Done!"
