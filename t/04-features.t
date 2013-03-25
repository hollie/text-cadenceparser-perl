#!/usr/bin/perl
#
# Copyright (C) 2012 by Lieven Hollevoet

# Verify features that were added

use strict;
use Test::More;
use Test::Output;

use_ok 'Text::Cadenceparser';

# Output for equally-contributing units shoudl be sorted alphabetically
my $parser = Text::Cadenceparser->new(key => 'area', 'area_rpt' => 't/stim/area_100.rpt', 'power_rpt' => 't/stim/power_100_nop.rpt', 'threshold' => 5);
ok $parser, 'object created';

stdout_like { $parser->report() }  qr/vu1_mul.+\n.+vu2_mul/, 'Check sorting';

# Test non-verbose power output parsing
$parser = Text::Cadenceparser->new(key => 'active', power_rpt => 't/stim/non_verbose_power');
ok $parser, 'object created';

stdout_like {$parser->report() } qr/Total active : 45.125/, 'Non-verbose input format verified correctly';

# Test verbose power output parsing
$parser = Text::Cadenceparser->new(key => 'active', power_rpt => 't/stim/verbose_power');
ok $parser, 'object created';

stdout_like {$parser->report() } qr/Total active : 45.125/, 'Non-verbose input format verified correctly';

done_testing();
