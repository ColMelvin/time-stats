#!/usr/bin/perl

use strict;
use warnings;

use FindBin;

use Test::More tests => 1;
use Test::Deep;

require "$FindBin::Bin/../bin/time-stats";

my @times = time_stats::collect_times([time_stats::get_known_time_formats()], 'DATA', \*DATA);
cmp_deeply(
	\@times,
	[
		{
			real => 0.292,
			user => 0.233,
			sys => 0.006,
			file => 'DATA',
			start => 192,
			length => 42,
		},
		{
			real => 2.002,
			user => 0,
			sys => 0.002,
			file => 'DATA',
			start => 234,
			length => 42,
		},
		{
			real => 0.019,
			user => 0.008,
			sys => 0.012,
			file => 'DATA',
			start => 649,
			length => 42,
		},
	]
);

exit;

__DATA__
~/devel/time-stats
~/devel/time-stats/bin
~/devel/time-stats/etc
~/devel/time-stats/bin/time-stats
~/devel/time-stats/etc/bash_completion.d
~/devel/time-stats/etc/bash_completion.d/time-stats

real	0m0.292s
user	0m0.233s
sys	0m0.006s

real	0m2.002s
user	0m0.000s
sys	0m0.002s
user     31113  0.4  0.2 310840 38432 pts/1    S+   00:25   0:02 vim
user     31564  0.0  0.0 120036  3148 pts/1    S+   00:33   0:00 /bin/bash -c (bash -c 'time ps aux | grep vim') >/tmp/vi2irVg/4 2>&1
user     31565  0.0  0.0 120036  3244 pts/1    S+   00:33   0:00 bash -c time ps aux | grep vim
user     31567  0.0  0.0 119456   984 pts/1    S+   00:33   0:00 grep vim

real	0m0.019s
user	0m0.008s
sys	0m0.012s
