# text2gsm
Generate audiobooks from text taking minimal disk space!
- Use with "html2text", "epub2text", "pdftotext" or "calibre" to generate audiobooks!
- Uses compression "GSM" suitable for voice and produces twice smaller files than "lamemp3"!
- Uses widely available text-to-speech alogirthm "festival"!

## Installation On Ubuntu

    chmod u+x text2gsm;  # Executablify
    # Optional: Add to PATH variable by copying to e.g. ~/bin
    sudo apt-get install -y ffmpeg festival;  # Install required binaries.

## Usage

    cat text.txt |text2gsm text.txt.gsm.wav

## Example

https://raw.githubusercontent.com/vackosar/text2gsm/master/us-constitution.txt.gsm.wav
