#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use Test::More;

require "$FindBin::Bin/../bin/time-stats";

my @matches = (
	# Test escape sequences.
	{ format => '\n', test => "\n" },
	{ format => '\t', test => "\t" },
	{ format => '\\', test => "\\" },
	{ format => '\%', test => "\\%" },
	{ format => '\a', test => "\\a" },
	{ format => '\b', test => "\\b" },
	{ format => '\f', test => "\\f" },
	{ format => '\v', test => "\\v" },

	# Test regex escaping.
	{ format => '^a', test => "^a" },
	{ format => 'z$', test => "z\$" },

	# Test invalid format specifiers.
	{ format => '%0', test => "?0" },
	{ format => '%1', test => "?1" },
	{ format => '%2', test => "?2" },
	{ format => '%3', test => "?3" },
	{ format => '%4', test => "?4" },
	{ format => '%5', test => "?5" },
	{ format => '%6', test => "?6" },
	{ format => '%7', test => "?7" },
	{ format => '%8', test => "?8" },
	{ format => '%9', test => "?9" },
	{ format => '%A', test => "?A" },
	{ format => '%B', test => "?B" },
	{ format => '%G', test => "?G" },
	{ format => '%H', test => "?H" },
	{ format => '%J', test => "?J" },
	{ format => '%L', test => "?L" },
	{ format => '%N', test => "?N" },
	{ format => '%Q', test => "?Q" },
	{ format => '%T', test => "?T" },
	{ format => '%V', test => "?V" },
	{ format => '%Y', test => "?Y" },
	{ format => '%_', test => "?_" },
	{ format => '%a', test => "?a" },
	{ format => '%b', test => "?b" },
	{ format => '%d', test => "?d" },
	{ format => '%f', test => "?f" },
	{ format => '%g', test => "?g" },
	{ format => '%h', test => "?h" },
	{ format => '%i', test => "?i" },
	{ format => '%j', test => "?j" },
	{ format => '%l', test => "?l" },
	{ format => '%m', test => "?m" },
	{ format => '%n', test => "?n" },
	{ format => '%o', test => "?o" },
	{ format => '%q', test => "?q" },
	{ format => '%u', test => "?u" },
	{ format => '%v', test => "?v" },
	{ format => '%y', test => "?y" },
	{ format => '%z', test => "?z" },

	# Test valid format specifiers.
	{ format => '%%', test => "%" },
	{ format => '%C', test => "any string" },
	{ format => '%D', test => "42" },
	{ format => '%E', test => "1:40.248" },
	{ format => '%E', test => "1:01:40.248" },
	{ format => '%F', test => "42" },
	{ format => '%I', test => "42" },
	{ format => '%K', test => "42" },
	{ format => '%M', test => "42" },
	{ format => '%O', test => "42" },
	{ format => '%P', test => "99%" },
	{ format => '%R', test => "42" },
	{ format => '%S', test => "3.14" },
	{ format => '%U', test => "3.14" },
	{ format => '%W', test => "42" },
	{ format => '%X', test => "42" },
	{ format => '%Z', test => "42" },
	{ format => '%c', test => "42" },
	{ format => '%e', test => "3.14" },
	{ format => '%k', test => "42" },
	{ format => '%p', test => "42" },
	{ format => '%r', test => "42" },
	{ format => '%s', test => "42" },
	{ format => '%t', test => "42" },
	{ format => '%w', test => "42" },
	{ format => '%x', test => "42" },
);

plan tests => scalar @matches;

foreach (@matches) {
	my $regex = time_stats::get_gnu_time_regex($_->{format});
	like $_->{test}, qr/^$regex$/, $_->{format};
}
