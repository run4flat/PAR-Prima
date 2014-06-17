 # prima-pp.pl
 use strict;
 use warnings;
 use pp;
 
 # Make it always compile
 unshift(@ARGV, '-c');
 
 # Add the Prima-specific command-line invocation stuff
 use Prima::Config;
 
 # Include each necessary library
 my @libs = @{$Prima::Config::Config{ldlibs}};
 for my $lib (@libs) {
     unshift(@ARGV, "--link=$lib");
 }
 
 # Make sure the library paths are specified
 my @incs = @{$Prima::Config::Config{incpaths}};
 for my $inc (@incs) {
     unshift(@ARGV, '-I', $inc);
 }
 
 # Include the -g flag, which makes Windows program
 # avoid showing the command prompt.
 unshift @ARGV, '-g';
 
 # Run it!
 pp->go();
