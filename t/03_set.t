use strict;
use Test::More 'no_plan';
use Hash::Manip;

{
    my $data_ref = { foo => { bar => 1 } };
    my $hm = Hash::Manip->new( $data_ref );
    $hm->set( 'foo.bar', 2 );
    ok( eq_hash( $hm->data_ref, { foo => { bar => 2 } } ) );
}

{
    my $data_ref = { foo => { bar => 1 } };
    my $hm = Hash::Manip->new( $data_ref );
    $hm->set( 'foo.baz', 2 );
    ok( eq_hash( $hm->data_ref, { foo => { bar => 1, baz => 2 } } ) );
}

{
    my $data_ref = { foo => { bar => 1 } };
    my $hm = Hash::Manip->new( $data_ref );
    $hm->set( 'baz', 2 );
    ok( eq_hash( $hm->data_ref, { foo => { bar => 1 }, baz => 2 } ) );
}

{
    my $data_ref = { foo => { bar => 1 } };
    my $hm = Hash::Manip->new( $data_ref );
    $hm->set( 'foo', 2 );
    ok( eq_hash( $hm->data_ref, { foo => 2 } ) );
}

{
    my $data_ref = { foo => 1 };
    my $hm = Hash::Manip->new( $data_ref );
    $hm->set( 'foo.bar.baz', 1 );
    ok( eq_hash( $hm->data_ref, { foo => { bar => { baz => 1 } } } ) );
    $hm->set( 'foo.qux.quux', 2 );
    ok( eq_hash( $hm->data_ref, { foo => { bar => { baz => 1 }, qux => { quux => 2 } } } ) );
}
