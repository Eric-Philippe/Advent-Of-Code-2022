use strict;
use List::Util qw(min any product);
our ($a, $b);

# Part 2
sub cmpPackets ($$) {
    my ($lhs, $rhs) = @_;
    return -1 if compare($lhs, $rhs);   # Is less
    return 1  if compare($rhs, $lhs);   # Is greater
    return 0;
}

sub runPartTwo() {
    my @dividers = ([[2]], [[6]]);
    push @allpackets, @dividers;
    my @sorted = sort { cmpPackets($a, $b) // 0 } @allpackets;
    my @dividerPosns = grep { my $cur = $sorted[$_-1]; 
    any { $_ eq $cur } @dividers } 1..@sorted;

    print "Part 2: ", product(@dividerPosns), "\n";
}