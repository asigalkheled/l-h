# Install Git Bash

- https://git-scm.com/install/windows
- git clone to the l-h Repo

## Practie 01
- Open the Git bash cli and create folder with your name
- Create an app, better based on python and flask web server
- Do the below steps
```
echo "my new file" > myapp.py
ls
git status
git add myapp.py
cat myapp.py
git status
git commit -m "myapp.py"
git status

```

- **Git mv** move or rename files
- **Git log** display the commit history
- **Git diff** see the differences between commits
  
```
git mv myapp.py myapp-new.py
git status
git commit -m "rename"
git log
git log --graph --decorate
git log --oneline
git diff 61f2e9a 55b1459

```
## Practie 02
# Git Branches
- **Git branch** to see list of your branches
- **Git branch \<name of new br>** creates a new branch
- **Git checkout \<name of new br>** - command switches ​to the specified branch​
- **Git branch -m \<old br> \<new br>** to rename branch
- **Git branch -d \<name of new br>** to delete branch
- **Git branch -r** view remote branches
- **Git branch -a** view local and remote branches
- **Git branch --all** view all branches

## Let's start with visualizing mode before Git bash exercises 
- Open the URL via the browser http://git-school.github.io/visualizing-git
  
```
git branch feature1​
git commit​
git commit​
git log​
git checkout feature1​
git commit​
git commit​
git checkout <SHA1>​
git tag release1​
git commit​
git commit​
git checkout release1​
git checkout -b feature2​
git commit​
git commit​
git checkout HEAD~3​
git branch​
git branch -d feature1​
git branch​
```
### Open the cli of Git Bash and do the below commands
```
git branch --all
git branch -r
git branch
git branch feature02
git branch
git checkout feature02                 #git checkout -b feature02        #you can create and switch by flag -b    
git branch
git branch -m feature02 feature03
git branch
git checkout main
git branch
git branch -d feature03            # you can use -D flag for force delete
git branch
git branch --all
git checkout remotes/origin/bugfix-01              # switch to remote br 
```

- **Exercise** create new branch and synchronize it with the origin branch
```
git branch
git branch name-of-new-br
git branch
git checkout name-of-new-br
git branch
ls
vi new-file.txt
git add new-file.txt                 # git add -A           # for all files
git commit -m "new br with new file"
git push
git push --set-upstream origin name-of-new-br
```
### Bonus


## Git hook 

- Hooks live in the .git/hooks/ directory of every Git repository.
When you initialize a repo, Git puts sample scripts there (e.g., commit-msg).

```
cd .git/hooks/
cp commit-msg.sample commit-msg
```

- **vi commit-msg** and add below contant
  
```
#!/bin/sh
echo "Checking commit message for JIRA ID..."

# Ensure a commit message file was passed
if [ -z "$1" ]; then
  echo "❌ No commit message file provided."
  exit 1
fi

# Read the commit message from the file Git passes as $1
commit_msg=$(cat "$1")

# Require a JIRA ID like "JIRA-123"
if ! echo "$commit_msg" | grep -qE '\bJIRA-[0-9]+\b'; then
  echo "❌ Commit message must include a JIRA ID like 'JIRA-123'"
  exit 1
fi

echo "✅ Commit message contains a valid JIRA ID."
```

- vi index.html
- git add index.html
- git commit -m "fix typo bug-123"              

- You should get an error message

![Alt text](pic-gh-error-hook.png) 

- vi index.html
- git add index.html
- git commit -m "JIRA-123 fix typo bug-123"    		

- You should get a success message Commit message contains a valid JIRA ID

![Alt text](pic-gh-success-hook.png) 

- Hook disabled

```
mv .git/hooks/commit-msg .git/hooks/commit-msg.disabled
```
