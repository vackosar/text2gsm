#!/bin/bash
set -xeu

domain="$1"
AGENT='Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36';
#wget --page-requisites --adjust-extension --random-wait -e robots=off -U mozilla --timestamping --level inf --recursive --convert-links "$domain";
wget --page-requisites --adjust-extension --random-wait -e robots=off -U "${AGENT}" --timestamping --level inf --recursive --convert-links "$domain";
rm -r wp-* || true;
protocolLess="$(echo "$domain"|sed 's|http[s]*://||')";
ebook-convert "$protocolLess/index.html" "$protocolLess.epub";  
