#!perl -w
# Validate a turtle file with riot --validate; optionally prepending prefixes.ttl

my $file = shift or die "usage: riotval file.(ttl|trig)\n";
my $syntax = $file =~ m{\\.ttl$} ? "turtle" : "trig";
if (-e "prefixes.ttl") {
  my ($lines) = `wc -l prefixes.ttl` =~ m{(\d+)};
  my $out = `cat prefixes.ttl $file | riot --validate --syntax $syntax - 2>&1`;
  $out =~ s{(?<=:: \[line: )(\d+)}{$1 - $lines}ge;
  print $out
} else {
  print `riot --validate --syntax $syntax $file`
}
