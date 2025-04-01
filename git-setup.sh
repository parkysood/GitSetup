#!/bin/bash

# Author: Parikshit Sood
# BASH script to automate the creation of local Git repository and link to remote repository on GitHub

# Take directory input
read -p "Enter the directory that you want to use as a git repo (enter '.' if it is the current directory): " REPO_NAME

# Create directory and enter it if not current directory
if [ "$REPO_NAME" != "." ]; then
	mkdir $REPO_NAME
	cd $REPO_NAME
fi

# Create git repo
git init
echo "Created Git repo ✅"

# Create README files
echo "# $(basename "$PWD")" > README.md
echo "Created README file ✅"

# Create empty gitignore files
touch .gitignore
echo "Created empty gitignore file ✅"

# Get remote GitHub URL
read -p "Enter your GitHub repo URL (or leave blank to skip): " REPO_URL

# Push to remote upstream
if [ -n "$REPO_URL" ]; then
	git branch -M main
	echo "Setup main branch ✅"
	git remote add origin "$REPO_URL"
	git pull origin main
	git push -u origin main
	echo "Pushed repository to GitHub ✅"
else
	echo "No URL provided. Skipping remote setup ✅"
fi

echo "Git repo initialized! Setup complete. ✅"
