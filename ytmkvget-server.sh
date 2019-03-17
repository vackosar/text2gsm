#!/bin/bash
set -eux -o pipefail

# Install
# sudo apt install ffmpeg
# sudo pip install --upgrade youtube_dl
# git clone ???spxfy

url="$1";

sshToSrv() {
  ssh -C -p "$homePort" "$homeServer"; # "$@";
}

name="$(youtube-dl --get-title "$url" |sed 's/[^a-zA-Z0-9]/-/g;'|cut -c 1-210)";
cat /dev/null |youtube-dl --output - "$url" |
  ffmpeg -i pipe:0 \
    -c:v libvpx-vp9 -crf 63 -r 1 \
    -c:a libgsm_ms -ar 8000 -ab 13000 -ac 1 -af "volume=1.5" \
    -y "$HOME/sync/$name.mkv";

    #-c:v libx264 -tune stillimage -crf 28 -r 1\
    #-c:a libspeex -ar 8000 -ab 4000 -ac 1 -af "volume=1.5" -af highpass=300 \
