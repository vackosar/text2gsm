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

name="$(youtube-dl --get-title "$url" |sed 's/[^a-zA-Z0-9]/-/g;'|cut -c 1-30)";
cat /dev/null |youtube-dl --output - "$url" |
  ffmpeg -i pipe:0 -ac 1 -af 'volume=1.5' -af lowpass=3000,highpass=300 -acodec libgsm_ms -ar 8000 -ab 13000  -f wav \
  -y "$HOME/sync/$name.wav";
