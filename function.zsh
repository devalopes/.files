# Make a virtual environment in any python version
venv() { 
    python"$1" -m virtualenv venv --always-copy
}

# Basic sourcing of .env, activate venv, and launching vscode
run() {
    if [[ -f ".env" ]]
    then
        source .env
    fi

    if [[ -e "./venv/bin/activate" ]]
    then
        source venv/bin/activate
    fi
    code .
}

# del is safer than rm since it's just moving to trash can
del() {
    mv -v "$1" ~/.Trash/$1
}

# deactivate a virtualenv, cd back to projects directory
bye() {
    deactivate > /dev/null 2>&1
    cd ~/projects/
    ls -l
}

# hard reset of git repo
grr() {
    if git rev-parse --git-dir > /dev/null 2>&1
    then
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
        git add --all
        git commit -m "$1"
        git push -v
    else
        echo "$PWD is not a git repository"
    fi
}

# just a fun personal project to run a magic 8 ball 
magic8() {
    python3 ~/projects/python/magic-8-ball/main.py
}
