#!/bin/bash

# Fetch the charms using fetch-charms.py in the parent directory
# - log-level is error
# - section is supplied in param1
# - adds master branch worktree to __worktrees/
# - branch fetched is stable/21.10
# - pushed to the ../charms directory
# - replace - destructive!
# - allow failures
# - any additional params are charms to ignore.

script_dir="$( cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)"
repo_dir="$script_dir/.."

section=$1
shift
ignores=""
while (( "$#" )); do
    ignores="$ignores -i $1"
    shift
done

# now fetch the charms.
$repo_dir/fetch-charms.py --log error \
    --section $section \
    --worktree master \
    --worktree-dir __worktrees \
    --branch stable/21.10 \
    --dir "$repo_dir/charms" \
    --replace \
    --ignore-failure \
    $ignores
