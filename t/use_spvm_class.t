use Test::More;

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
BEGIN { $ENV{SPVM_BUILD_DIR} = "$FindBin::Bin/.spvm_build"; }

use SPVM 'TestCase::Resource::SHA::V6_02';

ok(SPVM::TestCase::Resource::SHA::V6_02->test);

done_testing;
