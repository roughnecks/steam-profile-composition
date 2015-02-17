#!/usr/bin/env perl -w

# Authors: roughnecks - Miblo
# Date:   11/2014

# Supported OS: Windows and Linux

# Windows Requirements:
# Strawberry Perl: http://strawberryperl.com/ (32bit is fine)
# ImageMagick: http://www.imagemagick.org/script/binary-releases.php#windows
# https://dl.dropboxusercontent.com/u/79022845/imagemagick.jpg

# Linux Requirements:
# Perl (Should be already installed on every distribution)
# ImageMagick +repage option from http://www.imagemagick.org/Usage/crop/#crop_repage

# Running the script:
# Copy your Background to the same dir where this script is
# Open a terminal and cd (change directory) to that directory

# Windows: c:\> perl spc.pl background.jpg
# Linux:   $ perl spc.pl background.jpg

# DATA
# Panels:
# Upper: Artworks Showcase
# Lower: Screenshots Showcase

# Upper Main:   509x339+507+269
# Upper Top:    102x72+1021+270
# Upper Middle: 102x72+1021+353
# Upper Bottom: 101x79+1021+436

# Lower Main:   507x383+507+710
# Lower Top:    102x60+1021+710
# Lower Middle: 101x77+1021+782
# Lower Bottom: 102x62+1021+870

# CODE STARTS HERE #
####################

use warnings;
use strict;

# We need an image as argument to the script
my $BG = $ARGV[0];

if (!$BG) {
    print "Usage: perl $0 your_image_here.jpg\n";
    exit;
}

# Strip the extension from BG and store the result in $filename
(my $filename = $BG) =~ s/(\.[^.]+$)//;
# Capture the extension and store it in $ext
my $ext = $1;

# These are filenames for pieces we are going to cut
# _a# are Artworks
# _s# are Screenshots
my $a0 = $filename . '_a0' . $ext;
my $a1 = $filename . '_a1' . $ext;
my $a2 = $filename . '_a2' . $ext;
my $a3 = $filename . '_a3' . $ext;
my $s0 = $filename . '_s0' . $ext;
my $s1 = $filename . '_s1' . $ext;
my $s2 = $filename . '_s2' . $ext;
my $s3 = $filename . '_s3' . $ext;

# Cut the pieces using ImageMagick
# While we cut pieces we also build an array with screenshots' filenames
my @produced;
foreach my $spec ([ 'a0', '509x339+507+269' ], [ 'a1', '102x72+1021+270' ], 
		  [ 'a2', '102x72+1021+353' ], [ 'a3', '101x79+1021+436' ], 
		  [ 's0', '507x383+507+710' ], [ 's1', '102x60+1021+710' ], 
		  [ 's2', '101x77+1021+782' ], [ 's3', '102x62+1021+870' ]) {
    if ($spec->[0] =~ m/s\d/) {
	my $basename = $filename . '_' . $spec->[0] . $ext;
	push @produced, $basename; # our array (to be used later)
    }
    my @args = (convert => $BG, '-crop', $spec->[1], '+repage', $filename . '_' . $spec->[0] . $ext);
    system(@args);
}
