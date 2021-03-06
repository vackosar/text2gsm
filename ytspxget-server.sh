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
    -ac 1 -af "volume=1.1" \
    -acodec libopus -b:a 6K -ac 1 -f opus \
    -y "$HOME/sync/$name.opus";

# -af lowpass=3000,highpass=300 -acodec libspeex -ar 8000 -ab 4000 -vbr 1 -compression_level 10 -dtx 1 -f spx \
# -acodec libgsm_ms -ar 8000 -ab 13000 -f wav \
