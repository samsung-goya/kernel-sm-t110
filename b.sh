#!/bin/bash

# Attempt to merge project-a/master into the current branch
git merge --allow-unrelated-histories t110/master || true

# Find files with conflicts
conflicted_files=$(git diff --name-only --diff-filter=U)

# Reset conflicted files to their original state before the merge
for file in $conflicted_files; do
    git checkout --ours -- "$file"
    git add "$file"
done

# Finalize the merge
git commit

# Remove the remote for project-a
git remote remove t110
