sub get-inputs ($filename) {
   $filename.IO.lines.Array
}

sub snafu-to-b10 ($snafu) {
   state %value-for = "=" => -2, '-' => -1, '0' => 0, '1' => 1, '2' => 2;
   my $weight = 1;
   return $snafu.comb.reverse.map(
      {
         my $part = $weight * %value-for{$_};
         $weight *= 5;
         $part;
      }
   ).sum;
}

sub b10-to-snafu ($decimal is copy) {
   state %symbol-for = 0 => '0', 1 => '1', 2 => '2', 3 => '=', 4 => '-';
   (
      gather while $decimal > 0 {
         my $rest = $decimal % 5;
         take %symbol-for{$rest};
         $decimal = ($decimal - ($rest > 2 ?? $rest - 5 !! $rest)) div 5;
      }
   ).reverse.join('');
}

sub runPartOne ($inputs) { b10-to-snafu($inputs.map({snafu-to-b10($_)}).sum); }