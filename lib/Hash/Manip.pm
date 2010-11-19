package Hash::Manip;
use strict;
use warnings;
use Carp qw( croak );
our $VERSION = '0.01';

sub new {
    my ( $class, $data_ref ) = @_;
    ref $data_ref eq 'HASH'
        or croak 'Argument must specify as hashref.';
    return bless { _data_ref => $data_ref }, $class;
}

sub data_ref {
    my $self = shift;
    return $self->{ _data_ref };
}

sub set {
    my ( $self, $key, $value ) = @_;
    _set_value( $self->data_ref, $key, $value );
}

sub get {
    my ( $self, $key ) = @_;
    return _get_value( $self->data_ref, $key );
}

sub _set_value {
    my ( $a_ref, $key, $value ) = @_;
    my $p = $a_ref;
    my @keys = split /\./, $key;
    my @stacks;
    for my $path ( @keys ) {
        push @stacks, $path;
        if ( ref $p->{ $path } && $path ne $keys[ -1 ] ) {
            $p = $p->{ $path };
        }
        else {
            if ( $path eq $keys[ -1 ] ) {
                $p->{ $stacks[ -1 ] } = $value;
                last;
            }
            else {
                $p->{ $path } = {};
                $p = $p->{ $path };
            }
        }
    }
}

sub _get_value {
    my ( $a_ref, $key, $value ) = @_;
    my $p = $a_ref;
    my @keys = split /\./, $key;
    while ( my $path = shift @keys ) {
        $p = $p->{ $path };
        last unless ref $p;
    }
    return scalar @keys ? undef : $p;
}

1;
__END__

=head1 NAME

Hash::Manip -

=head1 SYNOPSIS

  use Hash::Manip;

=head1 DESCRIPTION

Hash::Manip is

=head1 AUTHOR

Yoshiki Kurihara E<lt>kurihara at cpan.orgE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
