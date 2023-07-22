import os
import time
from git import Repo, Actor

def automatic_commit(repo_path, commit_message, author_name, author_email, skip_files=['git_auto_push.py']):
    repo = Repo(repo_path)
    author = Actor(author_name, author_email)
    committer = Actor(author_name, author_email)

    # Get a list of all file paths in the repo
    all_files = [os.path.join(root, file) for root, _, files in os.walk(repo_path) for file in files]

    # Filter out the files in the skip_files list
    files_to_add = [file for file in all_files if os.path.basename(file) not in skip_files]

    # Add the remaining files to the repo
    for file in files_to_add:
        repo.git.add(file)

    changes = repo.index.diff(None)

    if changes:
        repo.index.commit(commit_message, author=author, committer=committer)
        origin = repo.remote(name='origin')  # Corrected remote name
        origin.push()
        print("Changes committed and pushed successfully.")
    else:
        print("No changes to commit.")

def commit_every_30_minutes(repo_path, commit_message, author_name, author_email):
    while True:
        automatic_commit(repo_path, commit_message, author_name, author_email)
        time.sleep(1900)  # Sleep for 30 minutes (1800 seconds)

# Example usage
repo_path = "/home/user/Documents/Ansible_Leap_Project/ANS-OpenSu15.5RaspberryPie"
commit_message = "Automatic commit save"
author_name = "Viktor Ohlsson"
author_email = "viktoroh96@gmail.com"

commit_every_30_minutes(repo_path, commit_message, author_name, author_email)
