use strict;
use warnings;

my ($attempts, $fail, $goAgain, $wins, $losses, $guess, $tries, @build, @guessed, @pLs);
$goAgain = 0, $wins = 0, $losses = 0;

@pLs = qw(ruby perl python java javascript fortran algol rust plank pascal squirrel verilog cobra basic boomerang cython elixer smalltalk prolog swift);

do
{
	my $selected = rand(scalar(@pLs));
	my (@word) = split(//,$pLs[$selected]);
	@build = ("_") x scalar(@word); 
	$_ = join('', @word);
	$fail = 0;
	$attempts = ">-->-0"; 
	$tries = 0;

	print "Hello class, welcome to Hangman. Let's Begin!\n";
	print "The selected PL word has ", scalar(@word), " letters\n"; 
	print "Your body is currently at: ", $attempts, "\n";

	while (1)
	{
		last if ($fail == length($attempts));
		last if (join('', @build) eq join('', @word));
		$guess = <STDIN>;
		chomp $guess;
		$guess = lc(substr($guess,0,1));
		$tries += 1;
		if(m/$guess/)
		{
			print "You're Correct!\n";
			for (my $index = 0; $index < scalar(@word); $index++)
			{
				$build[$index] = $word[$index] if ($word[$index] eq $guess);
			}
			foreach my $letter (@build)
			{
				print "$letter ";
			}
			print "\n\n";
		}
		else
		{
			print "WRONG\n";
			$fail++;
			print substr($attempts, $fail, length($attempts)), "\n\n";
		}
	}
	print "Stats: $tries attempts with $fail misses\n";
	if ($fail < length($attempts)) 
	{
		print "You barely survived Raheja's!\n\n";
		$wins += 1;
	}
	else 
	{
		print "The programming language was: ", @word;
		print "\nYou failed and curled up miserably\n\n";
		$losses += 1;
	}
	print "You are currently at ", $wins, " wins and ", $losses, " losses.\n";
	print "Would you like to go again? y[1]/n[0]\n";
	$goAgain = <STDIN>;
	chomp $goAgain;
	print "\n"
}
while($goAgain);