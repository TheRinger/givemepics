#Give.Me.Pics
Here is what Option 3 - Install Requirements does

            sudo apt-get update
            sudo apt-get install toilet pv curl wget perl make git -y
            sudo apt-get install libio-socket-ssl-perl -y
            sudo cpan install Mojolicious
            sudo curl -L https://cpanmin.us | perl - -M https://cpan.metacpan.org -n Mojolicious


---------------------
REQUIREMENTS

-- Mojolicious - http://mojolicio.us/

    $ cpan Mojolicious
or

    $ curl -L https://cpanmin.us | perl - -M https://cpan.metacpan.org -n Mojolicious

-----------------------
#How.it.works

make it executable

    chmod +x gmp.sh

change the name and put into your local path

    cp gmp.sh ~/bin/gmp


Searches and downloads pics straight from google.
Pass Search terms to script as arguments..
Run with search arguments like so 

gmp hot chicks drinking beer

#Current Features

Allows searching for pictures with of colors you specify.

    black blue brown gray green 
    orange pink purple red teal white yellow

Option for File type

    JPG, PNG, GIF, BMP
    
Option for Specific Height and Width.

You pick how many pictures it downloads, currently 1 - 99


#Credits
Many Thanks to Yunga
http://www.reddit.com/r/commandline/comments/2vog7b/bash_script_that_downloads_google_images_based_on/

 Based on the idea of Tyrell Rutledge, perl stuff by Yunga Palatino.
    See: http://reddit.com/r/commandline/2vog7b/

  All right reversed. Feel free to copy/modify/redistribute/print/eat/sell.
  PS: Use at your own risks. Computer may catch fire.
