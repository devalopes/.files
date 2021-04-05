venv() { python"$1" -m virtualenv venv --always-copy }

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

bye() {
    deactivate > /dev/null 2>&1
    cd ~/projects/
    ls -l
}

grr() {
    if git rev-parse --git-dir > /dev/null 2>&1
    then
        git reset --hard "$1"/"$2"
        git pull "$1" "$2"
    else
        echo "$PWD is not a git repository"
    fi
}

magic8() {
    python3 ~/projects/python/magic-8-ball/main.py
}
