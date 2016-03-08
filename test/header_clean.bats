load 'test_helper/bats-support/load'

@test "Reworked hunks" {
	output=$( load_fixture "file-moves" | $diff_so_fancy )
	assert_output --partial '@ square.yml:4 @'
	assert_output --partial '@ package.json:3 @'
}

@test "Reworked hunks (noprefix)" {
	output=$( load_fixture "noprefix" | $diff_so_fancy )
	assert_output --partial '@ setup-a-new-machine.sh:33 @'
	assert_output --partial '@ setup-a-new-machine.sh:219 @'
}

@test "Reworked hunks (deleted files)" {
	output=$( load_fixture "dotfiles" | $diff_so_fancy )
	assert_output --partial '@ diff-so-fancy:3 @'
}

@test "mnemonicprefix handling" {
	output=$( load_fixture "mnemonicprefix" | $diff_so_fancy )
	assert_output --partial 'modified: test/header_clean.bats'
}