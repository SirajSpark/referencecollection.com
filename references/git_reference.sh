# --------------------------------------------------------------------------------
# Git Reference and Guide
#
# ReferenceCollection.com
# Licensed under the MIT License
# --------------------------------------------------------------------------------

# TABLE OF CONTENTS
# -----------------
# 1.  Introduction to Git
# 2.  Core Concepts and Architecture
# 3.  Installation and Basic Setup
# 4.  Basic Commands and Workflow
# 5.  Branching and Merging
# 6.  Remote Operations
# 7.  Advanced Git Operations
# 8.  Git Workflows
# 9.  Hooks and Automation
# 10. Troubleshooting and Maintenance

# --------------------------------------------------------------------------------
# 1. Introduction to Git
# --------------------------------------------------------------------------------

# Git is a free and open source distributed version control system (DVCS). Created 
# by Linus Torvalds in 2005, it has become the standard in software development.

# Key Features:
# - Distributed System: Every developer has a full copy of the repository
# - Branching: Lightweight and powerful branching capabilities
# - Data Integrity: SHA-1 hash ensures content integrity
# - Staging Area: Intermediate area between working directory and repository
# - Speed: Most operations are local, making it very fast
# - Free and Open Source: Available under GNU General Public License version 2.0

# --------------------------------------------------------------------------------
# 2. Core Concepts and Architecture
# --------------------------------------------------------------------------------

# Repository Structure:
# - Working Directory: Your active workspace with current files
# - Staging Area (Index): Temporary area where changes are prepared before committing
# - Local Repository (.git): Complete version history stored on your machine
# - Remote Repository: Shared version of the repository hosted on a server

# Key Concepts:
# - Commit: Immutable snapshot of changes at a specific point in time
# - Branch: Independent line of development
# - Tag: Named reference to specific commit (usually versions)
# - Merge: Combining different branches of development
# - Remote: Connection to external repository
# - Fork: Server-side repository copy
# - Clone: Copy of an existing Git repository
# - HEAD: Pointer to the latest commit in current branch
# - HEAD~1: First parent commit

# File States:
# - Untracked: New files Git doesn't track
# - Modified: Changed but not staged
# - Staged: Marked for next commit
# - Committed: Safely stored in Git database
# - Ignored: Files not tracked by Git

# --------------------------------------------------------------------------------
# 3. Installation and Basic Setup
# --------------------------------------------------------------------------------

# Installation Methods:
sudo apt install git    # Debian/Ubuntu
sudo yum install git    # Red Hat/CentOS
brew install git        # macOS

# Windows:
# Download from https://git-scm.com/download/win

# Verify installation:
git --version

# Initial Configuration:
git config --global user.name "username"
git config --global user.email "email@example.com"

# Set default branch name:
git config --global init.defaultBranch main

# Set default editor:
git config --global core.editor "nano"

# Configure line ending behavior:
git config --global core.autocrlf input    # On Unix/Mac
git config --global core.autocrlf true     # On Windows

# Configuration levels:
# --system: Affects all users on system
# --global: Affects all repositories for current user
# --local:  Affects only current repository (default)

# View all configurations:
git config --list

# --------------------------------------------------------------------------------
# 4. Basic Commands and Workflow
# --------------------------------------------------------------------------------

# Repository Creation:
git init                     # Initialize new repository
git clone <url>              # Clone existing repository
git clone <url> <directory>  # Clone existing repository into specific folder

# Staging Changes:
git status                   # Check repository status
git add <file>               # Stage specific file
git add .                    # Stage all changes
git add -p                   # Interactive staging

# Committing:
git commit -m "message"      # Commit with message
git commit -am "message"     # Automatically stages changes and commit
git commit --amend           # Modify last commit

# History and Differences:
git log                      # View commit history
git log --oneline            # Compact view
git log --graph              # Visual representation
git show <commit>            # View specific commit
git diff                     # Show unstaged changes
git diff --staged            # Show staged changes

# --------------------------------------------------------------------------------
# 5. Branching and Merging
# --------------------------------------------------------------------------------

# Branch Operations:
git branch                     # List branches
git branch <name>              # Create branch
git checkout <name>            # Switch branches
git checkout -b <name>         # Create and switch
git switch <branch>            # Switch branches (preferred)
git switch -c <branch>         # Create and switch (preferred)
git branch -d <name>           # Delete branch
git branch -m <name>           # Rename branch

# Merging:
git merge <branch>             # Merge branch into current
git merge --ff-only <branch>   # Fast-forward only
git merge --no-ff --no-commit  # Manual merge commit
git merge --abort              # Abort troubled merge
git mergetool                  # Start merge tool

# Conflict Resolution:
# 1. Open conflicted files
# 2. Look for conflict markers (<<<<<<, =======, >>>>>>>)
# 3. Edit files to resolve conflicts
# 4. Stage resolved files
# 5. Complete the merge with commit

# --------------------------------------------------------------------------------
# 6. Remote Operations
# --------------------------------------------------------------------------------

# Remote Management:
git remote -v                     # List remotes
git remote add <name> <url>       # Add remote repository(url)
git remote remove <name>          # Remove remote
git remote rename <old> <new>     # Rename remote

# Syncing:
git fetch <remote>                # Download changes without merging
git pull <remote> <branch>        # Pull changes from remote
git push <remote> <branch>        # Push changes to remote repository
git push -u origin <branch>       # Push to remote repository

# Remote Branches:
git branch -r                     # List remote branches
git checkout -t origin/<branch>   # Track remote branch

# --------------------------------------------------------------------------------
# 7. Advanced Git Operations
# --------------------------------------------------------------------------------

# Stashing:
# Temporarily saves changes that are not yet ready to be committed
git stash                 # Save changes temporarily
git stash list            # List stashes
git stash pop             # Apply and remove last stash
git stash apply           # Apply and keep last stash
git stash apply stash@{1} # Apply specific stash
git stash drop            # Delete last stash
git stash clear           # Remove all stashes

# Rebasing:
# Rewrites commit history by moving changes to a new base branch
git rebase <branch>      # Rebase current branch
git rebase -i HEAD~3     # Interactive rebase
git rebase --abort       # Abort rebase

# Tags:
# Used to mark specific points in Git history, often for releases
git tag                                # List tags
git tag -a v1.0.0 -m "Version 1.0.0"   # Create annotated tag
git tag -d v1.0.0                      # Delete tag
git push origin --tags                 # Push tags to remote
git checkout v1.0.0                    # Checkout tag

# Submodules:
# Include other repositories within a Git repository
git submodule add <url> <path>  # Add submodule
git submodule init              # Initialize submodule
git submodule update            # Update submodule
git submodule status            # Show submodule status

# Aliases:
# Create shortcuts for frequently used commands
git config --global alias.br branch    # Usage: git br
git config --global alias.st status
git config --global alias.ci commit 

# Undoing Changes:
# Revert changes made to the repository
git reset --soft HEAD~1         # Undo commit, keep changes
git reset --mixed HEAD~1        # Undo commit and staging
git reset --hard HEAD~1         # Undo commit, discard changes
git revert <commit-hash>        # Revert specific commit
git restore --staged filename   # Unstage file without losing changes:
git restore filename            # Discard local changes to file:

# Advanced Operations:
git cherry-pick <commit> # Apply specific commit
git bisect start         # Binary search for bugs
git clean -n             # Show what will be cleaned
git clean -f             # Remove untracked files
git clean -fd            # Remove files and directories

# --------------------------------------------------------------------------------
# 8. Git Workflows
# --------------------------------------------------------------------------------

# Feature Branch Workflow:
# 1. Create feature branch
git checkout -b feature/name

# 2. Stage changes and commit
git add .
git commit -m "Add feature"

# 3. Push to remote
git push origin feature/name

# 4. Create pull request (via web interface)

# --------------------------------------------------------------------------------
# 9. Hooks and Automation
# --------------------------------------------------------------------------------
# Git hooks are scripts that run automatically before or after certain Git commands.

# Hook Locations:
# .git/hooks/pre-push: Run before push
# .git/hooks/pre-commit: Run before commit
# .git/hooks/commit-msg: After commit message is entered
# .git/hooks/post-merge: Run after merge
# .git/hooks/post-checkout: Run after git checkout

# Example pre-commit hook:
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/sh
git diff --cached --name-only | while read file; do
    # Add your checks here
    echo "Checking $file"
done
EOF
chmod +x .git/hooks/pre-commit

# Common Hook Uses:
# - Unit test execution
# - Commit message validation
# - Preventing sensitive data commits

# --------------------------------------------------------------------------------
# 10. Troubleshooting and Maintenance
# --------------------------------------------------------------------------------

# Repository Health:
git fsck                  # Check repository integrity
git gc                    # Clean up repository
git prune                 # Remove unreachable objects

# Recovery Tools:
git reflog                 # View reference history
git checkout HEAD@{1}      # Go to previous state
git reset --hard ORIG_HEAD # Undo last major change

# Debugging:
git blame <file>           # Show who changed what
git bisect start           # Binary search for bugs
git verify-pack -v .git/objects/pack/pack-*.idx  # Verify objects