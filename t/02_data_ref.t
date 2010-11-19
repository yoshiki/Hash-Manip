use strict;
use Test::More 'no_plan';
use Hash::Manip;

{
    my $data_ref = { foo => 1, bar => { baz => 2 } };
    my $hm = Hash::Manip->new( $data_ref );
    ok( eq_hash( $hm->data_ref, $data_ref ) );
}
