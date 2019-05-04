#!/bin/bash

domain="$1"
wget --recursive --convert-links "$domain";
rm -r wp-* || true;
protocolLess="$(echo "$domain"|sed 's|http[s]*://||')";
ebook-convert "$protocolLess/index.html" "$domain.epub";  
