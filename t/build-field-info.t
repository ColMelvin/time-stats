#!/usr/bin/perl

use strict;
use warnings;

use FindBin;

use Test::More;
use Test::Deep;

require "$FindBin::Bin/../bin/time-stats";

my %field = time_stats::build_field_info();

plan tests => 1 + keys %field;

cmp_deeply(
	[keys %field],
	set(qw(
		real user sys cpu
		max_rss rss total data stack text page major minor swap switch wait
		in out recv send sig
		exit kill cmd
	)),
	'All fields are available',
);

foreach (keys %field) {
	cmp_deeply(
		$field{$_},
		superhashof(
			{
				desc => re('^[[:print:]]{5,45}$'),	# A short, but descriptive, string
				scale => any(
					time_stats::NOMINAL(),
					time_stats::ORDINAL(),
					time_stats::INTERVAL(),
					time_stats::RATIO(),
				),
			}
		),
		"Field $_ contains required keys",
	);
}
