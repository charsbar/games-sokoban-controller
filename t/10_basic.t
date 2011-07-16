use strict;
use warnings;
use Test::More;
use Games::Sokoban::Controller;

my $c = Games::Sokoban::Controller->new;
$c->set_data(<<'LEVEL');
#######
#@ .  #
#  $  #
#     #
#######
LEVEL

note $c->_dump;

# absolute position
is $c->get([1, 1]) => '@';
is $c->get([2, 1]) => ' ';
is $c->get([3, 1]) => '.';
is $c->get([3, 2]) => '$';

# relative position
is $c->_rel([0, 0]) => '@';
is $c->_rel([1, 0]) => ' ';
is $c->_rel([2, 0]) => '.';
is $c->_rel([-1, 0]) => '#';
is $c->_rel([0, -1]) => '#';
is $c->_rel([0, 1]) => ' ';

# solved?
ok !$c->solved;

# let's move on
ok $c->go_down;
ok !$c->solved;
note $c->_dump;

ok $c->go_down;
ok !$c->solved;
note $c->_dump;

# walk to wall
ok !$c->go_down;
ok !$c->solved;
note $c->_dump;

ok $c->go_right;
ok !$c->solved;
note $c->_dump;

ok $c->go_right;
ok !$c->solved;
note $c->_dump;

# push a box
ok $c->go_up;
ok $c->solved;
note $c->_dump;

# push a box to wall
ok !$c->go_up;
ok $c->solved;
note $c->_dump;

ok $c->go_left;
ok $c->solved;
note $c->_dump;

ok $c->go_up;
ok $c->solved;
note $c->_dump;

ok $c->go_right;
ok !$c->solved;
note $c->_dump;

ok $c->go_down;
ok !$c->solved;
note $c->_dump;

ok $c->go_right;
ok !$c->solved;
note $c->_dump;

ok $c->go_right;
ok !$c->solved;
note $c->_dump;

ok $c->go_up;
ok !$c->solved;
note $c->_dump;

ok $c->go_left;
ok $c->solved;
note $c->_dump;

done_testing;
