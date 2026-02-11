# Moving hello.sh and Adding a Makefile

This section documents the reorganization of the project structure by moving the `hello.sh` script into a dedicated `lib/` directory and introducing a `Makefile` in the root of the repository to run the program.

## Moving hello.sh into lib/

The `hello.sh` script was moved into a new directory named `lib/` using Git to preserve file history.

First, the directory was created (if it did not already exist):

mkdir lib

The script was then moved using Git:

git mv work/hello/hello.sh lib/hello.sh

Using `git mv` ensures that the file movement is tracked as a rename rather than as a deletion and new file creation.

The move was committed:

git commit -m "refactor: move hello.sh to lib directory"

After this operation, the project structure became:

.
├── lib/
│   └── hello.sh
└── other project files

---

## Creating the Makefile

A `Makefile` was created in the root directory of the repository to simplify running the script.

The file was created:

touch Makefile

The following content was added to the file:

TARGET="lib/hello.sh"

run:
	bash ${TARGET}

Note: The command under `run:` must begin with a TAB character, as required by Makefile syntax.

This configuration allows the script to be executed using:

make run

The Makefile was staged and committed:

git add Makefile  
git commit -m "build: add Makefile for hello script"

---

## Final Project Structure

After completing the task, the repository structure is:

.
├── lib/
│   └── hello.sh
├── Makefile
└── documentation files

---

## Command Summary

| Command | Purpose |
|----------|----------|
| `mkdir lib` | Create the lib directory |
| `git mv work/hello/hello.sh lib/hello.sh` | Move hello.sh into lib while preserving history |
| `touch Makefile` | Create an empty Makefile in the root directory |
| `git add Makefile` | Stage the Makefile |
| `make run` | Execute the script using the Makefile target |

