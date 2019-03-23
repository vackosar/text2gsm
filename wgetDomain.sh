#!/bin/bash

domain="$1"
wget --recursive --convert-links "$domain";
rm -r wp-* || true;
ebook-convert "$domain/index.html" "$domain.epub";  
