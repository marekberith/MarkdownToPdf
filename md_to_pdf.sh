#!/bin/bash
file_name=$(basename -- "$1")
file_extension="${file_name##*.}"
no_extension="${file_name%.*}"
location="$(pwd)"
if [ "$file_extension" = "md" ]; then
set -- marked "$1"
output=$("$@") #executing marked command
pdf_name="$location/$no_extension"".pdf"
echo "Exporting into file $pdf_name"
meta='<!DOCTYPE html><html><head><title>Export</title><meta charset="UTF-8"></head><body>'
ending='</body></html>'
final="$meta$output$ending"
wkhtmltopdf - "$pdf_name" <<< "$final"
fi
