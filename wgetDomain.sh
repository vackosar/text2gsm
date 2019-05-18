#!/bin/bash

domain="$1"
wget --page-requisites --adjust-extension --random-wait -e robots=off -U mozilla --timestamping --level inf --recursive --convert-links "$domain";
rm -r wp-* || true;
protocolLess="$(echo "$domain"|sed 's|http[s]*://||')";
ebook-convert "$protocolLess/index.html" "$protocolLess.epub";  
