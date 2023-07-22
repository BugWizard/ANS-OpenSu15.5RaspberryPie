import time
from git import Repo, Actor

def automatic_commit(repo_path, commit_message, author_name, author_email):
    repo = Repo(repo_path)
    author = Actor(author_name, author_email)
    committer = Actor(author_name, author_email)

    repo.git.add(all=True)
    changes = repo.index.diff(None)

    if changes:
        repo.index.commit(commit_message, author=author, committer=committer)
        origin = repo.remote(name='origin')
        origin.push("HEAD:main")
        print("Changes committed and pushed successfully.")
    else:
        print("No changes to commit.")

def commit_every_30_minutes(repo_path, commit_message, author_name, author_email):
    while True:
        automatic_commit(repo_path, commit_message, author_name, author_email)
        time.sleep(1800)  # Sleep for 30 minutes (1800 seconds)

# Example usage
repo_path = "/home/user/Documents/Ansible_Leap_Project/ANS-OpenSu15.5RaspberryPie"
commit_message = "Automatic commit save"
author_name = "Viktor Ohlsson"
author_email = "viktoroh96@gmail.com"

commit_every_30_minutes(repo_path, commit_message, author_name, author_email)
