use File::Basename;
my $change_hunk_indicators    = 1;
	if ($line =~ /^${ansi_sequence_regex}diff --(git|cc) (.*?)(\s|\e|$)/) {
		$last_file_seen = $5;
	} elsif ($line =~ /^$ansi_sequence_regex--- (\w\/)?(.+?)(\e|$)/) {
		$next    =~ /^$ansi_sequence_regex\+\+\+ (\w\/)?(.+?)(\e|$)/;
	########################################
	# Check for "@@ -3,41 +3,63 @@" syntax #
	########################################
	} elsif ($change_hunk_indicators && $line =~ /^${ansi_sequence_regex}(@@@* .+? @@@*)(.*)/) {

		my $hunk_header  = $4;
		my $remain       = $5;

		if ($1) {
			print $1; # Print out whatever color we're using
		}

		my ($orig_offset, $orig_count, $new_offset, $new_count) = parse_hunk_header($hunk_header);
		$last_file_seen = basename($last_file_seen);

		# Plus three line for context
		print "@ $last_file_seen:" . ($new_offset + 3) . " \@${remain}\n";

	} elsif ($remove_file_add_header && $line =~ /^${ansi_sequence_regex}.*new file mode/) {
# Courtesy of github.com/git/git/blob/ab5d01a/git-add--interactive.perl#L798-L805
sub parse_hunk_header {
    my ($line) = @_;
    my ($o_ofs, $o_cnt, $n_ofs, $n_cnt) =
        $line =~ /^@@ -(\d+)(?:,(\d+))? \+(\d+)(?:,(\d+))? @@/;
    $o_cnt = 1 unless defined $o_cnt;
    $n_cnt = 1 unless defined $n_cnt;
    return ($o_ofs, $o_cnt, $n_ofs, $n_cnt);
}

	my $array = shift(); # Array passed in by reference
	if (defined($array->[0]) && $array->[0] =~ /^\s*$/) {
		shift(@$array); # Throw away the first line

	return 1;