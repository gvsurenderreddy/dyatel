use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Dyatel';
use Dyatel::Controller::A;

ok( request('/a')->is_success, 'Request should succeed' );
done_testing();
