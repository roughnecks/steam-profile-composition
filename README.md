steam-profile
=============

Perl script to cut a Steam background and create a Steam profile composition.

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

Windows: c:\> perl steamimg.pl background.jpg

Linux: $ perl steamimg.pl background.jpg


DATA
----

Panels:
-------

Upper: Artworks Showcase

Lower: Screenshots Showcase


Upper Main: 509x340+507+270

Upper Top: 102x72+1021+270

Upper Middle: 102x72+1021+353

Upper Bottom: 101x79+1021+436

Lower Main: 507x383+507+710

Lower Top: 102x60+1021+710

Lower Middle: 101x77+1021+782

Lower Bottom: 102x62+1021+870
