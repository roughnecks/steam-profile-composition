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

#A0:  506x284+510+271
#A1:  100x56+1024+271
#A2:  100x56+1024+340
#A3:  100x56+1024+409

#S0:  506x284+510+654
#S1:  100x56+1024+654
#S2:  100x56+1024+723
#S3:  100x56+1024+792

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
foreach my $spec ([ 'a0', '506x284+510+271' ], [ 'a1', '100x56+1024+271' ], 
		  [ 'a2', '100x56+1024+340' ], [ 'a3', '100x56+1024+409' ], 
		  [ 's0', '506x284+510+654' ], [ 's1', '100x56+1024+654' ], 
		  [ 's2', '100x56+1024+723' ], [ 's3', '100x56+1024+792' ]) {
    if ($spec->[0] =~ m/s\d/) {
	my $basename = $filename . '_' . $spec->[0] . $ext;
	push @produced, $basename; # our array (to be used later)
    }
    my @args = (convert => $BG, '-crop', $spec->[1], '+repage', $filename . '_' . $spec->[0] . $ext);
    system(@args);
}
