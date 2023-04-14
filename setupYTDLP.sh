#!/bin/bash

mkdir -p ~/.config/yt-dlp

echo "-x" > ~/.config/yt-dlp/config
echo "--audio-format mp3" >> ~/.config/yt-dlp/config
echo "--audio-quality 0" >> ~/.config/yt-dlp/config
echo "--no-mtime" >> ~/.config/yt-dlp/config
echo "# Use this proxy" >> ~/.config/yt-dlp/config
echo "#--proxy 127.0.0.1:3128" >> ~/.config/yt-dlp/config
echo "-o ~/yt-dlp/%(title)s.%(ext)s" >> ~/.config/yt-dlp/config

echo "https://www.youtube.com/watch?v=Si5CSpUCDGY" > ~/.config/yt-dlp/yt-dlp-downloadlist
