# Setting Up Git

This document describes the steps taken to install and configure Git
before starting the project.
Correct Git setup is required to ensure that commits are properly
attributed and that version control works as expected.

---

## Verify Git installation

Before configuring Git, its presence on the system was verified.

~~~bash
git --version
~~~

The output confirmed that Git was installed successfully:

~~~text
git version 2.43.0
~~~

---

## Configure Git username

Git requires a username to associate commits with an author.
The global username was configured using the following command:

~~~bash
git config --global user.name "vxanthio"
~~~

This setting applies to all repositories on the system.

---

## Configure Git email address

An email address is also required so that each commit can be uniquely
identified.

~~~bash
git config --global user.email "basiliki.martios1@gmail.com"
~~~

The email address should match the one used on the Git hosting platform
(GitHub / Gitea), so commits are correctly linked to the user account.

---

## Verify Git configuration

After setting the username and email, the global Git configuration
was verified to ensure the values were saved correctly.

~~~bash
git config --global --list
~~~

The output included entries similar to:

~~~text
user.name=vxanthio
user.email=basiliki.martios1@gmail.com
~~~

This confirmed that Git was properly configured and ready to be used
for the project.

---

## Challenges and lessons learned

- Git must be installed and configured **before** creating commits.
- Missing username or email information can cause commits to be rejected
  during audits or when pushing to remote repositories.
- Verifying configuration early prevents issues later in the workflow.

---

## Command Summary

| Command | Purpose |
|--------|---------|
| `git --version` | Verify that Git is installed |
| `git config --global user.name` | Set the global Git username |
| `git config --global user.email` | Set the global Git email |
| `git config --global --list` | Verify global Git configuration |
