#!/bin/bash

keywords=""

for var in "$@"
do
	keywords+="$var%20"
done
ARGV=$keywords
echo Number of words to submitted: $#

if [ $# -eq 0 ]
	then
	echo "No Arguments were passed"
	exit 1
fi
choice=3
	echo ""
	echo "1. Run the Simple Search, Returns more results."
	echo "2. Run the Advanced Search, Specify Color, Filetype."
	echo -n "Please choose: [1, or 2] "
	echo
	while [ $choice -eq 3 ]; do
		read choice
	if [ $choice -eq 1 ] ; then
		echo
		echo "Running.."
		mkdir tmp
		cd tmp
		echo
		echo "How many Pics you want? (Enter a number from 1 - 99) "
		read piccount
		echo
		echo "Scraping "$piccount" images to /tmp ..."
		perl -Mojo -E'g("https://www.google.com/search?tbm=isch&q='$ARGV'", { "User-Agent" => "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.17 Chrome/24.0.1312.57" })->dom(".rg_l")->map(sub { m!href="http://www.google.com/imgres\?imgurl=(.*?)&amp;! and $1 } )->join("\n")->say' | head -"$piccount" | xargs -n 1 -P 8 wget -q
	else
		if [ $choice -eq 2 ] ; then
			echo
			echo "Running Advanced.."
			mkdir tmp
			cd tmp
			echo
			echo "File Type? (jpg, gif, png) or (leave blank for any type "
			read filetype
			echo
			echo "Color? (leave blank if any color) "
			read colortype
			echo
			echo "How many Pics you want? (Enter a number from 1 - 99) "
			read piccount
			echo
		
		if [ ${#colortype} -eq 0 ]
			then
			colortype=""
		fi 
		echo "Scraping "$piccount" images to /tmp ..."
		perl -Mojo -E'g("https://www.google.com/search?tbm=isch&q='$ARGV'filetype:'$filetype'&tbs=isz:ex,iszw:1920,iszh:1080,ic:specific,isc:'$colortype'", { "User-Agent" => "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.17 Chrome/24.0.1312.57" })->dom(".rg_l")->map(sub { m!href="http://www.google.com/imgres\?imgurl=(.*?)&amp;! and $1 } )->join("\n")->say' | head -"$piccount" | xargs -n 1 -P 8 wget -q
	
			
		fi
	fi

done

exit 1
