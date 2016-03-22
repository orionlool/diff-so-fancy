	assert_output --partial 'circle.yml changed file mode from 100644 to 100755'
@test "Hunk formatting: @@ -1,6 +1,6 @@" {
	# stderr forced into output
	output=$( load_fixture "first-three-line" | $diff_so_fancy )
	assert_output --partial '@ package.json:3 @'
}

@test "Three way merge" {
	# stderr forced into output
	output=$( load_fixture "complex-hunks" | $diff_so_fancy )
	# Lines should not have + or - in at the start
	refute_output --partial '-	my $foo = shift(); # Array passed in by reference'
	refute_output --partial '+	my $array = shift(); # Array passed in by reference'
	refute_output --partial ' sub parse_hunk_header {'
}
