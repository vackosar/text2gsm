# text2gsm
Converts text to highly compressed audio file. Suitable for converting ebooks to audiobooks.
- Used compression "GSM" is suitable for voice and produces twice smaller files than "lamemp3". 
- Used text to speech alogirthm "festival" is widely available.

## Installation On Ubuntu

    chmod u+x text2gsm;  # Executablify
    # Optional: Add to PATH variable by copying to e.g. ~/bin
    sudo apt-get install -y ffmpeg festival;  # Install required binaries.

## Usage

    cat text.txt |text2gsm text.txt.gsm.wav

