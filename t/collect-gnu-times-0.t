#!/usr/bin/perl

use strict;
use warnings;

use FindBin;

use Test::More tests => 1;
use Test::Deep;

require "$FindBin::Bin/../bin/time-stats";

my @times = time_stats::collect_times([time_stats::get_known_time_formats()], '*DATA', \*DATA);
cmp_deeply(
	\@times,
	[
		{
			real => 0.001,
			user => 0,
			sys => 0.001,
			file => '*DATA',
			start => 0,
			length => 42,
		},
		{
			user => 0,
			sys => 0,
			real => 1,
			cpu => 0,
			text => 0,
			data => 0,
			max_rss => 1996,
			in => 0,
			out => 0,
			major => 0,
			minor => 71,
			swap => 0,
			file => '*DATA',
			start => 42,
			length => 129,
		},
		{
			real => 2,
			user => 0,
			sys => 0,
			file => '*DATA',
			start => 171,
			length => 29,
		},
		{
			cmd => 'sleep 3',
			user => 0,
			sys => 0,
			cpu => 0,
			real => 3,
			text => 0,
			data => 0,
			stack => 0,
			total => 0,
			max_rss => 2016,
			rss => 0,
			major => 0,
			minor => 72,
			wait => 2,
			switch => 1,
			swap => 0,
			in => 0,
			out => 0,
			send => 0,
			recv => 0,
			sig => 0,
			page => 4096,
			exit => 0,
			file => '*DATA',
			start => 200,
			length => 718,
		},
	]
);

exit;

__DATA__

real	0m0.001s
user	0m0.000s
sys	0m0.001s
0.00user 0.00system 0:01.00elapsed 0%CPU (0avgtext+0avgdata 1996maxresident)k
0inputs+0outputs (0major+71minor)pagefaults 0swaps
real 2.00
user 0.00
sys 0.00
	Command being timed: "sleep 3"
	User time (seconds): 0.00
	System time (seconds): 0.00
	Percent of CPU this job got: 0%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 0:03.00
	Average shared text size (kbytes): 0
	Average unshared data size (kbytes): 0
	Average stack size (kbytes): 0
	Average total size (kbytes): 0
	Maximum resident set size (kbytes): 2016
	Average resident set size (kbytes): 0
	Major (requiring I/O) page faults: 0
	Minor (reclaiming a frame) page faults: 72
	Voluntary context switches: 2
	Involuntary context switches: 1
	Swaps: 0
	File system inputs: 0
	File system outputs: 0
	Socket messages sent: 0
	Socket messages received: 0
	Signals delivered: 0
	Page size (bytes): 4096
	Exit status: 0
