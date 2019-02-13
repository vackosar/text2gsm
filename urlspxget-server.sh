#!/bin/bash
set -eux -o pipefail

url="$1";
name="$(echo "$url"|sed 's|.*/\([^?]*\)?.*|\1|')";
cat /dev/null |
  wget "$url" -O - |
  ffmpeg -i pipe:0 -acodec libgsm_ms -ar 8000 -ab 13000 -ac 1 -af "volume=1.5" -f wav -y "$HOME/sync/$name.wav";

# ffmpeg -i pipe:0 -acodec libspeex -ar 8000 -ab 4000 -vbr 1 -compression_level 10 -dtx 1 -ac 1 -af "volume=1.5" -y -f spx -"

