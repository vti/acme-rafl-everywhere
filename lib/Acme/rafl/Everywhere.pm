use strict;
use warnings;
package Acme::rafl::Everywhere;
# ABSTRACT: rafl is so everywhere, he has his own Acme module!

sub new {
    my $class = shift;
    my $self  = bless {@_}, $class;

    exists $self->{'facts'}
        or $self->{'facts'} = $self->load_facts;

    return $self;
}

sub load_facts {
    my $self  = shift;
    my @facts = ();

    while ( my $line = <DATA> ) {
        $line =~ /^__END__/ and last;

        # ignore empty lines
        $line =~ s/^\s+//;
        $line =~ s/\s+$//;
        chomp $line;
        $line or next;

        push @facts, $line;
    }

    return [@facts];
}

sub fact {
    my $self  = shift;
    my $facts = $self->{'facts'};
    return $facts->[ int rand scalar @{$facts} ];
}

1;

__DATA__
rafl is so everywhere, he's on both the vim and emacs mailing list, arguing for each!
rafl is so everywhere, he's behind you right now!
rafl is so everywhere, even Chuck Norris checks under his bed every night!
rafl is so everywhere, Freddy Krueger is afraid of falling asleep!
rafl is so everywhere, Schrodinger's cat's got nothing on him!
rafl is so everywhere, he sent me postcards from the surface of the sun!
rafl is so everywhere, when you want to abandon a module, rafl gets comaint automatically!
rafl is so everywhere, you can find Waldo simply by searching for anyone who isn't rafl!
rafl is so everywhere, Jesus owns him a pull request on Github!
rafl is so everywhere, he has the first commit of Javascript on Parrot!
rafl is so everywhere, when you breath, that's rafl you're breathing!

__END__

=head1 SYNOPSIS

    use Acme::rafl::Everywhere;

    my $rafl = Acme::rafl::Everywhere->new;
    print $rafl->fact;

Or set your own facts

    my $rafl = Acme::rafl::Everywhere->new(
        facts => [@new_facts],
    );

=head1 DESCRIPTION

If you haven't already seen C<rafl> somewhere, you probably haven't been alive
for too long, because he really is everywhere.

L<Moose>, L<MooseX::Declare>, L<Catalyst>, L<Dist::Zilla>, L<signatures>,
L<KiokuDB>, L<Gtk2>, Perl core, MetaCPAN and GSoC are just I<some> of the
projects he's involved in.  

=head1 BUGS

This module cannot contain all the information about C<rafl>, but you're
more than welcome to add any new info.

=head1 THANKS

To C<rafl> for being everywhere. :)
