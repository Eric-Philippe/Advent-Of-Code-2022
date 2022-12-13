use strict;

use PartOne;

sub TestCompare {
    my ($lhs, $rhs, $expected) = @_;
    my $result = PartOne::compare($lhs, $rhs);
    if (defined $result) {
        $result = $result ? 'true' : 'false';
    } else {
        $result = 'undef';
    }
    if ($result ne $expected) {
        print "Test failed: compare($lhs, $rhs) returned $result, expected $expected";
    }
}