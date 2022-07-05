#!/bin/bash
# Directory ./Slidy2/ is needed for pandoc to refer to eg. the js files needed to run the slideshow locally.
# To get ./Slidy2/, simply uncomment the lines containing the wget and unzip commands
if [[ $# -eq 0 ]] ; then
    printf 'Usage examples:\n./run.sh file.md\n./run.sh file.txt'
    exit 0
fi
filename=$1
name=${1%.*}
html=$name.html
#wget http://www.w3.org/Talks/Tools/Slidy2/slidy.zip
#unzip slidy.zip
pandoc -s -t slidy -V slidy-url=./Slidy2 --css style.css $filename > $html && \
# class="incremental" makes the elements to be shown one by one in the slideshow
sed -i 's'/\
'<ul\|'\
'<img\|'\
'<h2\|'\
'<ol'\
'/& class="incremental"/g' $html
echo && echo "----[ Created: $html ]----"
#xdg-open $html
