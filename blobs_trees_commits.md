# Exploring the .git/ Directory and Git Objects

This section documents the exploration of Git’s internal structure, including the `.git/` directory, object storage, and the relationships between commits, trees, and blobs.

The `.git/` directory contains all metadata and object data required for Git to function. It was accessed using:

cd .git  
ls

The following key components were examined: `objects/`, `config`, `refs/`, and `HEAD`.

---

## objects/

The `objects/` directory is the core storage area of Git. It acts as the internal database of the repository.

Git stores all versioned data as objects:

- **Blob** – Stores raw file content (no filename, no metadata).
- **Tree** – Represents a directory structure and maps file names to blob or tree objects.
- **Commit** – Represents a project snapshot and references a tree object.
- **Tag** – References a specific object (usually a commit).

Each object is identified by a unique SHA-1 hash and stored in compressed format inside `.git/objects/`.

---

## config

The `.git/config` file contains repository-specific configuration.

It stores:
- Remote repository URLs
- Branch tracking settings
- Repository behavior configuration

This configuration applies only to the current repository and differs from the global Git configuration stored in the user's home directory.

---

## refs/

The `refs/` directory contains references (pointers) to commit hashes.

It includes:
- `refs/heads/` → Local branches
- `refs/tags/` → Tags
- `refs/remotes/` → Remote-tracking branches

Each reference file stores the commit hash to which a branch or tag points.

---

## HEAD

The `HEAD` file indicates the current position of the repository.

When on a branch, `HEAD` contains:

ref: refs/heads/main

This means the repository is currently on the `main` branch.

If the repository is in a detached HEAD state, this file contains a direct commit hash instead of a branch reference.

---

# Latest Object Hash

The latest object in the repository corresponds to the most recent commit.

The latest commit hash was obtained using:

git log -1 --format=%H

The type of the object was inspected using:

git cat-file -t <commit_hash>

The content of the object was displayed using:

git cat-file -p <commit_hash>

For a commit object, the output includes:
- A reference to a tree object
- Parent commit reference
- Author information
- Committer information
- Commit message

---

# Dumping the Directory Tree

The commit object references a root tree object.

The tree hash was extracted from the commit output and inspected using:

git cat-file -p <tree_hash>

This command displays the directory structure stored in that commit.

Each entry shows:
- File mode
- Object type (blob or tree)
- Object hash
- File or directory name

---

## Dumping the lib/ Directory

The tree hash corresponding to the `lib/` directory was identified and inspected using:

git cat-file -p <lib_tree_hash>

This displayed the contents of the `lib/` directory and revealed the blob hash of `hello.sh`.

---

## Dumping the hello.sh File

The blob hash corresponding to `hello.sh` was inspected using:

git cat-file -p <blob_hash>

This displayed the raw file content stored inside the blob object.

---

# Relationship Between Commit, Tree, and Blob

Git internally links objects in the following structure:

Commit  
→ references a Tree  
→ Tree references Blobs (files) and other Trees (subdirectories)

This structure allows Git to efficiently store snapshots of the project while reusing unchanged objects between commits.

---

# Summary

The `.git/` directory functions as Git’s internal engine:

- `objects/` stores all versioned data as blobs, trees, commits, and tags.
- `config` defines repository-specific configuration.
- `refs/` tracks branches and tags through commit hashes.
- `HEAD` identifies the current branch or commit.
- Commits reference tree objects, which reference blob objects containing file contents.

---

# Command Summary

| Command | Purpose |
|----------|----------|
| `cd .git` | Navigate into the internal Git directory |
| `ls` | List contents of the `.git/` directory |
| `cat HEAD` | Display current branch or commit reference |
| `git log -1 --format=%H` | Retrieve latest commit hash |
| `git cat-file -t <hash>` | Display the type of a Git object |
| `git cat-file -p <hash>` | Print the content of a Git object |
| `git cat-file -p <tree_hash>` | Dump a directory tree object |
| `git cat-file -p <blob_hash>` | Display file content stored in a blob |
