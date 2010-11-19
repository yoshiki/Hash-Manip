use strict;
use Test::More 'no_plan';
use Hash::Manip;

{
    my $data_ref = { foo => 1, bar => { baz => 2 } };
    my $hm = Hash::Manip->new( $data_ref );
    is $hm->get( 'foo' ), 1;
    is $hm->get( 'bar.baz' ), 2;
}

{
    my $data_ref = { foo => { bar => 1 } };
    my $hm = Hash::Manip->new( $data_ref );
    is $hm->get( 'foo.bar' ), 1;
    is $hm->get( 'foo.bar.baz' ), undef;
}
