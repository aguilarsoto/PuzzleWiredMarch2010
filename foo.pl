use strict;
use warnings;

sub main 
{
my $key = "freakish";
my @split_key = split("", $key);

my $secret = "IVTPKALOJDEDRILAJIVEWQFKXXIEULSKTWHEZXSZBZPLIEGUPR";
my %cipher_table = map{$_ => get_array($_)} @split_key;
my @secret = split("", $secret);
my @solution;
my $count = 0;
foreach my $secret_element (@secret)
{
	my $position = $count%@split_key;
	push @solution, $cipher_table{$split_key[$position]}{lc($secret_element)}; 	
	$count++;
} 
print $_ foreach @solution;
print "\n";
}


sub get_array
{
 my $letter = shift;
 my @array = ($letter..'z', 'a'..$letter);
 my %hash= map{shift(@array) => $_} ('a'..'z');
 return \%hash;
}

main();
1;
