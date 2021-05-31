# Make a virtual environment in any python version
venv() {
    python"$1" -m virtualenv venv --always-copy
}

activate() {
    if [[ -f ".env" ]]
    then
        source .env
    fi

    if [[ -e "./venv/bin/activate" ]]
    then
        source venv/bin/activate
    fi
}

# Basic sourcing of .env, activate venv, and launching vscode
run() {
    activate
    vi .
}

# del is safer than rm since it's just moving to trash can
del() {
    mv -vf "$1" ~/.Trash/$1
}

# deactivate a virtualenv, cd back to projects directory
bye() {
    deactivate > /dev/null 2>&1
    cd ~/projects/
    ls -l
}

empty_trash_30_days() {
    directory="/Users/alex/.Trash/"
    n_days="+30"
    results=$(find "$directory" -mindepth 1 -depth -mtime $n_days -print | wc -l)
    if [[ $results -eq 0 ]]; then
        echo "No files $n_days days old to delete from trash"
    else
        echo "Cleaning up trash folder..."
        find "$directory" -mindepth 1 -mtime $n_days -delete -print
    fi
}

empty_trash() {
    directory="/Users/alex/.Trash/"
    results=$(find "$directory" -mindepth 1 -depth -print | wc -l)
    if [[ $results -eq 0 ]]; then
        echo "No files to delete from trash"
    else
        echo "Cleaning up trash folder..."
        find "$directory" -mindepth 1 -delete -print
    fi
}

# hard reset of git repo
grr() {
    if git rev-parse --git-dir > /dev/null 2>&1
    then
        git stash
        git reset --hard "$1"/"$2"
        git pull "$1" "$2"
    else
        echo "$PWD is not a git repository"
    fi
}

# run a quick add,commit,push
gx() {
    if git rev-parse --git-dir > /dev/null 2>&1
    then
        git add -v --all
        git commit -v -m "$1"
        git push
    else
        echo "$PWD is not a git repository"
    fi
}

gnew() {
    if git rev-parse --git-dir > /dev/null 2>&1
    then
        git stash
        git checkout -b "$3"
        git reset --hard "$1"/"$2"
        git pull "$1" "$2"
        git push -u origin "$3"
    else
        echo "$PWD is not a git repository"
    fi
}

ginit() {
    it init -b main
    git add -v --all
    git commit -m "initial commit"
    git remote add origin github:devalopes/"$1"
    git remote -v
    git push -u origin main
}

# just a fun personal project to run a magic 8 ball
magic8() {
    python3 ~/projects/python/magic-8-ball/main.py
}
