# Changed Your Mind – Undoing and Rewriting Changes

This section documents various Git workflows used to undo changes at different stages, remove commits from history, clean unreachable commits, and amend author information. Each operation demonstrates a specific Git mechanism for safely managing mistakes.

## Reverting Changes (Before Staging)

An unwanted comment was added to the latest version of the file and then reverted before staging.

After modifying the file with an unwanted comment, the change was discarded directly from the working tree without staging or committing:

git restore hello.sh

This restores the file to its last committed state and removes all unstaged changes.

---

## Staging and Cleaning (After Staging)

An unwanted comment was added again and staged.

The change was added to the staging area:

git add hello.sh

The staging area was then cleaned to discard the staged change without committing:

git restore --staged hello.sh

This removes the file from the staging area while keeping the modification in the working directory.

---

## Committing and Reverting (After Commit)

The unwanted change was added once more, staged, and committed:

git add hello.sh  
git commit -m "docs(hello): add unwanted comment"

Since the change was already committed, it was reverted using a new commit:

git revert HEAD

This creates a new commit that undoes the previous one while preserving commit history.

---

## Tagging and Removing Commits

The latest commit was tagged to mark it before removal:

git tag oops

All commits made after version `v1` were then removed, and the branch history was reset so that HEAD pointed to `v1`:

git reset --hard v1

This rewinds the branch to the `v1` tag and removes subsequent commits from the branch history.

---

## Displaying Logs with Deleted Commits

Although commits were removed from the branch, they were still accessible via tags.

All commits, including deleted ones, were displayed using:

git log --all --decorate

This made it possible to view the commit tagged `oops` even though it was no longer part of the main branch history.

---

## Cleaning Unreferenced Commits

To permanently remove deleted commits, all remaining references were cleared.

The tag referencing the deleted commit was removed:

git tag -d oops

The reflog was expired and garbage collection was run:

git reflog expire --expire=now --all  
git gc --prune=now

After this cleanup, unreferenced commits were permanently deleted and no longer appeared in logs.

---

## Author Information and Amending Commits

An author comment was added to the file and committed:

git add hello.sh  
git commit -m "docs(hello): add author information"

After realizing the author email was missing, the file was updated again and staged:

git add hello.sh

The last commit was amended to include the email without creating a new commit:

git commit --amend

This rewrote the most recent commit to include the corrected author information.

---

## Command Summary

| Command | Purpose |
|--------|---------|
| `git restore hello.sh` | Discard unstaged changes from the working tree |
| `git add hello.sh` | Stage file changes |
| `git restore --staged hello.sh` | Remove changes from the staging area |
| `git commit -m "<msg>"` | Commit staged changes |
| `git revert HEAD` | Revert the most recent commit with a new commit |
| `git tag oops` | Tag the latest commit |
| `git reset --hard v1` | Remove commits after v1 and reset HEAD |
| `git log --all --decorate` | Display all commits, including deleted ones |
| `git tag -d oops` | Remove a tag reference |
| `git reflog expire --expire=now --all` | Clear reflog references |
| `git gc --prune=now` | Permanently delete unreferenced commits |
| `git commit --amend` | Modify the most recent commit without creating a new one |
