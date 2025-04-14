#!/bin/bash

# Check if the input file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path_to_syoutube_urls.txt>"
    exit 1
fi

# Read the URL file
input_file="$1"

# Loop through each line in the file
while IFS= read -r url; do
    # Download audio only in the highest quality
    yt-dlp -f "bestaudio/best" -x --audio-format "m4a" --audio-quality "320k" --embed-thumbnail --add-metadata -o "%(title)s.%(ext)s" "$url"
done < "$input_file"

