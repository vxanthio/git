# Git Commits to Commit

This document describes the process followed for the **Git commits to commit**
section of the exercise.
It explains each step taken, the reasoning behind each commit, the challenges
encountered, and the lessons learned.

---

## Create the hello directory

Inside the `work` directory, a subdirectory named `hello` was created to contain
the exercise files.

~~~bash
mkdir hello
cd hello
pwd
~~~

The `pwd` command was used to confirm that the current working directory was
correctly set to the `hello` directory.

---

## Create the initial script

Inside the `hello` directory, a file named `hello.sh` was created with the
following initial content:

~~~bash
echo "Hello, World"
~~~

This represents the first snapshot of the program.

---

## Initialize the Git repository

The Git repository was initialized before any commits were made:

~~~bash
git init
~~~

The repository status was checked:

~~~bash
git status
~~~

The output showed that `hello.sh` was an untracked file.
Following Git’s suggestion, the file was staged and committed.

~~~bash
git add work/hello/hello.sh
git commit -m "feat(hello): initial hello world script"
~~~

This commit contains only the initial version of the script.

---

## Update the script to accept an argument

The content of `hello.sh` was updated to:

~~~bash
#!/bin/bash
echo "Hello, $1"
~~~

After checking the status and confirming that only this file was modified,
the change was staged and committed.

~~~bash
git add work/hello/hello.sh
git commit -m "feat(hello): support name argument"
~~~

At this point, the working tree was clean.

---

## Add comments and split changes into two commits

The final intended version of the script was:

~~~bash
#!/bin/bash

# Default is "World"
name=${1:-"World"}
echo "Hello, $name"
~~~

However, the exercise required **two separate commits**:
- One commit containing only the comment
- One commit containing only the logic changes

---

### Commit 1: Comment only

~~~bash
#!/bin/bash

# Default is "World"
echo "Hello, $1"
~~~

~~~bash
git add work/hello/hello.sh
git commit -m "docs(hello): add default name comment"
~~~

---

### Commit 2: Logic changes

~~~bash
#!/bin/bash

# Default is "World"
name=${1:-"World"}
echo "Hello, $name"
~~~

~~~bash
git add work/hello/hello.sh
git commit -m "feat(hello): default name to World when no argument"
~~~

---

## Final commit history

~~~bash
git log --oneline
~~~

The history confirms that each logical change was committed separately and in
the correct order.

---

## Challenges and lessons learned

- Understanding the difference between **staging** and **committing**
- Keeping one logical change per commit
- Verifying state with `git status` before acting

---

## Command Summary

| Command | Purpose |
|--------|---------|
| `mkdir hello` | Create the directory for the hello exercise |
| `cd hello` | Enter the hello directory |
| `pwd` | Verify the current working directory |
| `git init` | Initialize a Git repository |
| `git status` | Check the repository state |
| `git add <file>` | Stage a file |
| `git commit -m "<msg>"` | Create a commit |
| `git log --oneline` | View commit history |
