use strict;
use warnings;

use Prima::Config;
print "Prima linked libraries, for inclusion:\n";
my @libs = @{$Prima::Config::Config{ldlibs}};
for my $lib (@libs) {
	print "$lib\n";
}
