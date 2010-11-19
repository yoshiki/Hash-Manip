use strict;
use Test::More 'no_plan';
use Hash::Manip;

{
    my $hm = Hash::Manip->new( {} );
    is ref $hm, 'Hash::Manip';
}

{
    eval { my $hm = Hash::Manip->new };
    like $@, qr/^Argument must specify as hashref/;
}
