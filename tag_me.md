tag_me.md
# Tags

This section documents how Git tags were used to mark and navigate specific versions of the repository.

## What Is a Tag

A Git tag is a fixed reference that points to a specific commit in the repository history.  
Tags are commonly used to mark release versions or important milestones. Unlike branches, tags do not move when new commits are created.

## Tagging Versions

The current version of the repository was tagged as `v1` to mark a stable release:

git tag v1

The version immediately preceding the current one was tagged as `v1-beta` using relative history navigation, without relying on commit hashes:

git tag v1-beta HEAD~1

## Pushing Tags to the Remote Repository

Tags are not pushed automatically. Each tag was explicitly pushed to the remote repository:

git push origin v1  
git push origin v1-beta

## Navigating Tagged Versions

Navigation between tagged versions was performed by checking out the tags directly.  
This places the repository in a detached HEAD state, allowing inspection of the code without modifying any branch:

git checkout v1-beta  
git checkout v1

After inspection, normal development was resumed by returning to the main branch:

git checkout main

## Listing Tags

To verify successful tagging, all tags present in the repository were listed using:

git tag

This command displays all existing tags without modifying the repository state.

## Command Summary

| Command | Purpose |
|--------|---------|
| `git tag v1` | Tag the current commit as version v1 |
| `git tag v1-beta HEAD~1` | Tag the previous commit as v1-beta using relative navigation |
| `git push origin v1` | Push the v1 tag to the remote repository |
| `git push origin v1-beta` | Push the v1-beta tag to the remote repository |
| `git checkout <tag>` | Navigate to a specific tagged version |
| `git tag` | List all tags in the repository |
