#!/bin/bash

keywords=""

for var in "$@"
do
	keywords+="$var%20"
done
echo Number of words to submitted: $#

if [ $# -eq 0 ]
	then
	echo "No Arguments were passed"
	exit 1
fi
echo "File Type? (jpg, gif, png) "
read filetype
echo "Color?"
read colortype
if [ ${#colortype} -eq 0 ]
	then
	colortype=""
fi 
echo "How many Pics you want? (Enter a number from 1 - 99) "
read piccount
ARGV=$keywords
	perl -Mojo -E'g("https://www.google.com/search?tbm=isch&q='$ARGV'filetype:'$filetype'&tbs=isz:ex,iszw:1920,iszh:1080,ic:specific,isc:'$colortype'", { "User-Agent" => "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.17 Chrome/24.0.1312.57" })->dom(".rg_l")->map(sub { m!href="http://www.google.com/imgres\?imgurl=(.*?)&amp;! and $1 } )->join("\n")->say' | head -"$piccount" | xargs -n 1 -P 8 wget -q
exit 1
