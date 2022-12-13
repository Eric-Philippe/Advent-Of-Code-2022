use strict;
use List::Util qw(min any product);
our ($a, $b);

sub compare ($$);
sub compare ($$) {
    my ($lhs, $rhs) = @_;
    die "Invalid input..." unless defined $lhs && defined $rhs;
    if (ref $lhs eq 'ARRAY' && ref $rhs eq 'ARRAY') {
        my $min = min(scalar @$lhs, scalar @$rhs);
        for (my $i = 0; $i < $min; ++$i) {
            my $result = compare($lhs->[$i], $rhs->[$i]);
            return $result if defined $result;
        }
        if (scalar @$lhs < scalar @$rhs) {
            return 1;
        } elsif (scalar @$lhs > scalar @$rhs) {
            return 0;
        } else {
            return undef;
        }
    } elsif (ref $lhs eq 'ARRAY') {
        return compare($lhs, [$rhs]);
    } elsif (ref $rhs eq 'ARRAY') {
        return compare([$lhs], $rhs);
    } else {
        return 1 if $lhs < $rhs;
        return 0 if $lhs > $rhs;
        return undef;
    }
}

sub runPartOne() {
    $/ = '';

    my @packetPairs = <>;
    chomp @packetPairs;

    my $sum = 0;
    my @allpackets;

    my $index = 1;
    foreach my $pair (@packetPairs) {
        my ($lhs, $rhs) = split /\n/, $pair;
        $lhs = eval $lhs;
        $rhs = eval $rhs;
        push @allpackets, $lhs, $rhs;
        my $result = compare($lhs, $rhs);
        if ($result) {
            $sum += $index;
        }
        ++$index;
    }

    # Part 1
    print "Part 1: $sum\n";
}