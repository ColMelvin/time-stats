# time-stats

Aggregate the output of **time**(1) using statistics.

## Overview

Read the output of several timed commands and calculate the desired statistical
values, like median, mean, & standard deviation, for an overview of all the
runs.

The `time-stats` command supports the built-in Bash command and the pre-defined
GNU time formats out of the box.  Custom formats accepted by GNU time may be
specified on the command line as well, so they too can be recognized.

Note: This command makes heavy use of Unicode characters in its output.

## Documentation

Run `perldoc docs/time-stats.pod` for details; `bin/time-stats --help` for a
summary.

## Examples

Perform a rudimentary benchmark on a command:

```sh
for i in $(seq 1 1000)
do
	time $COMMAND
done 2>&1 | time-stats
```

Get the worst value from all runs:

```sh
# Assuming log files are created with:
# /usr/bin/time -v $COMMAND >$NAME.log 2>&1

time-stats *.log --fields=real,max_rss --stats=max
```

## See Also

* [st](https://github.com/nferraz/st): simple statistics (for any set of
  plain numbers) from the command line

## License and Copyright

Copyright (C) 2017-2018  Chris Lindee

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
