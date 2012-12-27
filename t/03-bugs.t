#!/usr/bin/perl
#
# Copyright (C) 2012 by Lieven Hollevoet

# Verify bugs that were reported by users

use strict;
use Test::More;
use Test::Output;

use_ok 'Text::Cadenceparser';

# Test very small thresholds don't throw errors
my $parser = Text::Cadenceparser->new(key => 'area', 'area_rpt' => 't/stim/area_100.rpt', 'power_rpt' => 't/stim/power_100_nop.rpt', 'threshold' => 0.0001);
ok $parser, 'object created';

stderr_unlike { $parser->report() }  qr/uninitialized/, 'Check small threshold';

done_testing();
