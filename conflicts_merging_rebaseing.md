# Conflicts, Merging and Rebasing

This section demonstrates branching, merging, conflict resolution, rebasing, and fast-forward behavior in Git.

The goal was to simulate real-world branch divergence, resolve conflicts, rebase changes, and understand the difference between merging and rebasing.

---

## 1. Merge Main into Greet Branch

First, the `greet` branch was updated with the latest changes from `main`.

The following commands were executed:

git switch greet  
git merge main  

This merge introduced no structural issues initially.

---

## 2. Modify hello.sh on Main

The `main` branch was modified to introduce interactive behavior.

git switch main  

The `lib/hello.sh` file was updated to:

#!/bin/bash

echo "What's your name"
read my_name

echo "Hello, $my_name"

The changes were staged and committed:

git add lib/hello.sh  
git commit -m "feat(main): add interactive name prompt to hello.sh"

---

## 3. Merging Main into Greet (Conflict)

After modifying `main`, another merge was attempted from `main` into `greet`:

git switch greet  
git merge main  

This produced a merge conflict in `lib/hello.sh` because both branches modified the file differently.

Conflict markers appeared:

<<<<<<< HEAD  
=======  
>>>>>>>  

According to the exercise instructions, the changes from the `main` branch were accepted.

The file was cleaned by removing conflict markers and keeping the interactive version.

The resolution was completed using:

git add lib/hello.sh  
git commit  

This created a merge commit.

---

## 4. Rebasing Greet Branch

The exercise then required returning to the state before the initial merge between `main` and `greet`.

The branch was reset to the last commit before merging:

git switch greet  
git reset --hard <commit_before_merge>

Then the branch was rebased on top of the latest `main`:

git rebase main  

A conflict occurred again during the rebase process.  
The conflict was resolved by keeping the `main` branch version of `hello.sh`.

The rebase was continued using:

git add lib/hello.sh  
git rebase --continue  

The rebase completed successfully:

Successfully rebased and updated refs/heads/greet.

After rebasing, the branch history became linear.

---

## 5. Merging Greet into Main

Finally, the rebased `greet` branch was merged back into `main`:

git switch main  
git merge greet  

Because the branch had been rebased, the merge resulted in a fast-forward:

Fast-forward

No merge commit was created, and the branch pointer simply moved forward.

---

## Understanding Fast-Forwarding

A fast-forward merge occurs when the target branch has no new commits and Git can simply move the branch pointer forward without creating a merge commit.

This results in a clean, linear history.

---

## Difference Between Merge and Rebase

Merge:
- Preserves branch structure
- Creates a merge commit
- Maintains full branch history

Rebase:
- Rewrites commit history
- Replays commits on top of another branch
- Produces a linear history
- Does not create a merge commit (if no conflicts remain)

---

## Final State

After completing all steps:
- The `main` branch contains the interactive `hello.sh`
- The `greeter.sh` file remains from the `greet` branch
- The final merge was a fast-forward
- The commit history is linear after rebase

---

## Command Summary

| Command | Purpose |
|----------|----------|
| `git switch greet` | Switch to the greet branch |
| `git merge main` | Merge main into greet |
| `git switch main` | Switch to the main branch |
| `git add lib/hello.sh` | Stage modified hello.sh |
| `git commit -m "<message>"` | Commit changes |
| `git reset --hard <commit>` | Reset branch to state before merge |
| `git rebase main` | Rebase greet onto main |
| `git rebase --continue` | Continue rebase after resolving conflict |
| `git merge greet` | Merge greet into main |
