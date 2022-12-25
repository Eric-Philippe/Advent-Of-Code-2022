#!/usr/bin/env raku
use v6;

sub MAIN ($filename = "input.txt") {
   return solve($filename) if $filename.IO.e;
}

sub solve ($filename) {
   my $reset     = "\e[0m";

   my $inputs = get-inputs($filename);
   my ($start, $elapsed);

   $start = now;
   my $part1 = runPartOne($inputs);
   put "part1 $part1$reset";

   return 0;
}