# Restoring Snapshots

This section documents how the working tree was restored to different snapshots in the repository history in order to inspect the contents of the `hello.sh` file at various points in time.  
All operations were performed without modifying commit history or using specific commit hashes.

## Restore First Snapshot

The first snapshot represents the initial state of the repository.  
The working tree was reverted to this initial snapshot using relative history navigation.

Command used:

git checkout HEAD~7

This command temporarily updates the working directory to reflect the earliest commit in the repository history.  
After restoring the snapshot, the contents of the `hello.sh` file were printed:

cat hello.sh

## Restore Second Most Recent Snapshot

The second most recent snapshot corresponds to the version immediately preceding the latest commit.  
The working tree was first returned to the main branch and then reverted one snapshot back.

Commands used:

git checkout main  
git checkout HEAD~1

This restores the working directory to the previous version of the project.  
The contents of the `hello.sh` file were then displayed:

cat hello.sh

## Return to Latest Version

To ensure the working directory reflects the most recent version of the project, the repository was returned to the `main` branch.

Command used:

git checkout main

The latest version of the `hello.sh` file was verified by printing its contents:

cat hello.sh

All snapshot navigation was performed without creating new commits or altering repository history.

## Command Summary

| Command | Purpose |
|--------|---------|
| `git checkout HEAD~7` | Restore the working tree to the initial snapshot |
| `git checkout HEAD~1` | Restore the working tree to the second most recent snapshot |
| `git checkout main` | Return the working directory to the latest version |
| `cat hello.sh` | Display the contents of the `hello.sh` file |
q