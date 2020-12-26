#!/bin/bash 
: '
@name   dorks-github_clusterbomb
@author dipa996
@link   https://github.com/dipa96/dorks2telegram
'


domain="$1"
RESULTDIR="$HOME/1.scripts/dorks2telegram/telegram_db/$domain" #change this path with your path
DORKS="$RESULTDIR/dorks"

checkDir() {
	mkdir -p "$RESULTDIR" "$DORKS"
}

dorksCheck(){
if [ ! -f "$DORKS"/$domain ]; then
    touch "$DORKS"/$domain 
    cp "$DORKS"/$domain "$DORKS"/dorks.old
else 
    cp "$DORKS"/$domain "$DORKS"/dorks.old
fi
#change this path with your path
python3 "$HOME"/tools/GitDorker/GitDorker.py -tf /path/to/token.txt -q $domain -d /path/to/alldorks.txt -o "$DORKS"/$domain
sort -u "$DORKS"/$domain | grep ",[1-9]" > "$DORKS"/new_sorted.txt
sort -u "$DORKS"/dorks.old | grep ",[1-9]" > "$DORKS"/old_sorted.txt
old_length_dorks=$(cat "$DORKS"/old_sorted.txt | grep ",[1-9]" | wc -l)
new_length_dorks=$(cat "$DORKS"/new_sorted.txt | grep ",[1-9]" | wc -l)
if [ $old_length_dorks -lt $new_length_dorks ]; then
    comm -13 "$DORKS"/old_sorted.txt "$DORKS"/new_sorted.txt > "$DORKS"/file_dorks.txt
    length=$(wc -l "$DORKS"/file_dorks.txt | awk '{print $1}')
    max=25 #Change length how you like
    if [ $length -gt $max ]; then
        cat "$DORKS"/file_dorks.txt | cut -d ',' -f2,3 > "$DORKS"/redacted.txt
        telegram -f "$DORKS"/redacted.txt "$domain"
        else
        cat "$DORKS"/file_dorks.txt | telegram -
    fi
fi
}

checkDir
dorksCheck
