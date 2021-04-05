venv() { python"$1" -m virtualenv venv --always-copy; }

act() {
if [[ -a "env.sh" ]]; then
    source env.sh;
fi

source venv/bin/activate;
code .;
}

bye() {
deactivate;
cd ~/projects/;
ls -l;
}

grr() {
  git reset --hard "$1"/"$2";
  git pull "$1" "$2";
}

magic8() {
  python3 ~/projects/python/magic-8-ball/main.py;
}
