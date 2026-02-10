# Git History

This section documents how the commit history of the working directory was inspected and customized.

## Viewing Commit History

To inspect the repository history, two main commands were used:

- `git log --oneline` for a concise overview of commits.
- `git log` for detailed commit information, including author, date, and full messages.

Both commands display the same history, but with different levels of detail.

## Controlled History Entries

The commit history was filtered to show specific entries:

- To display the last two commits:
  git log -2

- To display commits made within the last five minutes:
  git log --since="5 minutes ago"

These options help limit the output based on count or time range.

## Personalized Log Format

A customized log format was used to display commit information in a readable, structured form, including:
- short commit hash
- commit date
- commit message
- branch and HEAD information
- author name

Command used:

git log --pretty=format:"* %h %ad | %s (%d) [%an]" --date=short

Example output:

* e4e3645 2023-06-10 | Added a comment (HEAD -> main) [John Doe]

## Command Summary

| Command | Purpose |
|--------|---------|
| `git log` | Show the full commit history with detailed information |
| `git log --oneline` | Show a condensed one-line view of commit history |
| `git log -2` | Display the two most recent commits |
| `git log --since="5 minutes ago"` | Display commits made within the last five minutes |
| `git log --pretty=format:"* %h %ad \| %s (%d) [%an]" --date=short` | Display commit history in a customized, readable format |
