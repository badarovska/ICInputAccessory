#!/usr/bin/env ruby

# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
declared_trivial = github.pr_title.include? "#trivial"

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"

# Warn when there is a big PR
warn("Big PR") if git.lines_of_code > 500

# Add a CHANGELOG entry for app changes
if git.lines_of_code > 50 && !git.modified_files.include?("CHANGELOG.md") && !declared_trivial
  fail("Please update [CHANGELOG.md](https://github.com/polydice/ICInputAccessory/blob/develop/CHANGELOG.md).")
end

# Ensure a clean commits history
if git.commits.any? { |c| c.message =~ /^Merge branch/ }
  fail('Please rebase to get rid of the merge commits in this PR')
end
