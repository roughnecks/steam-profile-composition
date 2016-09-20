Steam Profile Composition
=========================

Perl script to cut a Steam background and create a Steam profile composition.
Tested with 1920x Backgrounds

![Profile Example](https://raw.githubusercontent.com/roughnecks/steam-profile/master/bureau.png)

Supported OS: Windows and Linux
-------------------------------

Windows Requirements:
---------------------

Strawberry Perl: http://strawberryperl.com/ (32bit is fine)

ImageMagick: http://www.imagemagick.org/script/binary-releases.php#windows

Linux Requirements:
-------------------

Perl (Should be already installed on every distribution)

ImageMagick +repage option from http://www.imagemagick.org/Usage/crop/#crop_repage


Running the script:
-------------------

Copy your Background to the same dir where this script is. Open a terminal and cd (change directory) to that directory.

    perl spc.pl background.jpg

The script will cut your BG and create 8 new images: 4 of them will have an "a#number" suffix and those are Artworks. The other 4 will have a "s#number" suffix and those are Screenshots.

Now you have to upload both Artworks and Screenshots and while it's easy for Artworks, you'll have to "convince" Steam that those are legit shots.. how? In Windows 7, Steam's Screenshots are placed under:

    C:\Program Files (x86)\Steam\userdata\your_account_id\760\remote\game_id\screenshots 

while under my Debian box they are placed in:

    /home/roughnecks/.steam/steam/userdata/account_id/760/remote/game_id/screenshots.

Each game has an id which you can find in its Store page url. For example: "Company of Heroes 2 - Ardennes Assault" Store page is: http://store.steampowered.com/app/317850/ . Its game_id is 317850 and its screenshots folder will be respectively located in 

    C:\Program Files (x86)\Steam\userdata\your_account_id\760\remote\317850\screenshots
    /home/roughnecks/.steam/steam/userdata/account_id/760/remote/317850/screenshots (Linux).

Copy the four shots to the destination folder and copy them again in the "thumbnails" subfolder (don't rename any of those). Restart Steam and open the Screenshots Library from the "View" menu: upload them.

We're almost set up but one thing remains to be done: you must write at least one comment in the Main Artwork (or rate it up), so that all other images will be aligned.

That is all, thanks for reading.


Showcases:
----------

Upper: Artworks Showcase

Lower: Screenshots Showcase

