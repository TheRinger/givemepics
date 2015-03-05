#!/bin/bash

keywords=""

for var in "$@"
do
    keywords+="$var%20"
done
ARGV=$keywords
echo
echo Number of words submitted: $#

if [ $# -eq 0 ]
    then
    echo
    echo " No Arguments were passed"
    echo " Pass search terms to script. -  ./gmp [search terms]"
    echo " Example:"
    echo " ./gmp.sh hot chicks drinking beer"
    echo
    exit 1
fi
clear
toilet -f smmono9 -F metal " Give.Me.Pics" | pv -qL 1900
echo -e '    \E[37;44m'"\033[1m A simple script that downloads Google Images.. \033[0m " | pv -qL 65
#echo "    A simple script that downloads Google Images.. " | pv -qL 50
echo
PS3='Please enter your choice:  '
options=("Simple Search" "Advanced Search" "Install Requirements" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Simple Search")
            echo
            clear
            toilet -f smmono9 -F metal " Simple.Options"
            echo " Creating tmp directory for images."
            echo
            printf " ${PWD}/tmp \n"
            echo
            if ! mkdir tmp; then echo " Directory already exists, okay will use ${PWD}/tmp " | pv -qL 55; fi           
            cd tmp
            echo
            echo -e " How many Pics you want? ( 1 - 99 ) \c"
            read piccount
            echo
            echo " Scraping "$piccount" images to ${PWD} "
            perl -Mojo -E'g("https://www.google.com/search?tbm=isch&q='$ARGV'", { "User-Agent" => "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.17 Chrome/24.0.1312.57" })->dom(".rg_l")->map(sub { m!href="http://www.google.com/imgres\?imgurl=(.*?)&amp;! and $1 } )->join("\n")->say' | head -"$piccount" | xargs -n 1 -P 8 wget -q
            echo 
            ;;
        "Advanced Search")
            echo
            clear
            toilet -f smmono9 -F metal " Advanced.Options"
            if ! mkdir tmp; then echo " Directory already exists, okay will use ${PWD}/tmp " | pv -qL 55; fi
            cd tmp
            echo
            echo -e ' File Type? ( JPG, PNG, GIF, BMP )  \E[37;44m'"\033[1m Enter \033[0m  for all. \c "
            read filetype
            echo
            echo " Available colortypes --"
            echo
            echo "    black blue brown gray green "
            echo "    orange pink purple red teal white yellow "
            echo 
            echo -e ' Choose a Color - \E[37;44m'"\033[1m Enter \033[0m  for all. \c"
            read colortype
            echo
            echo -e " How many Pics you want? ( 1 - 99 ) \c"
            read piccount
            echo
            echo " Scraping "$piccount" images to ${PWD} " | pv -qL 15
            echo
        
            if [ ${#colortype} -eq 0 ]
                then
                colortype=""
            fi 
                       
                  perl -Mojo -E'g("https://www.google.com/search?tbm=isch&q='$ARGV'filetype:'$filetype'&tbs=isz:ex,iszw:1920,iszh:1080,ic:specific,isc:'$colortype'", { "User-Agent" => "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.17 Chrome/24.0.1312.57" })->dom(".rg_l")->map(sub { m!href="http://www.google.com/imgres\?imgurl=(.*?)&amp;! and $1 } )->join("\n")->say' | head -"$piccount" | xargs -n 1 -P 8 wget -q
            ;;
        "Install Requirements")
            echo ""
            sudo apt-get update
            sudo apt-get install toilet pv curl wget perl make git -y
            sudo apt-get install libio-socket-ssl-perl -y
            sudo cpan install Mojolicious
            sudo curl -L https://cpanmin.us | perl - -M https://cpan.metacpan.org -n Mojolicious

            echo ""
            echo " Requirements Installed. "
            ;;
        "Quit")
                        echo
                        echo "Github Repo found at https://github.com/tytek2012/givemepics"
            break
            ;;
        *) echo invalid option
                        clear
                        toilet -f smmono9 -F metal " Give.Me.Pics" | pv -qL 1600
           echo "Options are" 
           echo "1) Simple Search"
           echo "2) Advanced Search" 
           echo "3) Install Requirements"      
           echo "4) Quit"
            ;;
    esac
done
