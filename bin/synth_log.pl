#! /usr/bin/perl -w

use strict;
use warnings;
use 5.012;
use autodie;
use Text::Cadenceparser;

# ABSTRACT: Create a short human-readable output of the synthesis logfiles
# PODNAME: synth_log.pl

if ( defined $ARGV[0] ) {

    # Create the object
    my $parser = Text::Cadenceparser->new( folder => $ARGV[0] );

    # Demo of reporting count
    #my $count = $parser->count('info');
    #print "Found $count info messages\n";

    # Demo of printing the overview
    say '----------------------------------------------------';
    say "Parsed logfiles in folder $ARGV[0], the result:";
    $parser->overview();

    # Demo of listing specific messages to STDOUT
    $parser->list('warning');
    $parser->list('error');
} else {
    die
"Please pass the folder with the files that need to be parsed as command line option";
}
