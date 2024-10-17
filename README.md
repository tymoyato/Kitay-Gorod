# Kitay Gorod

A repository for automating software installation with apt and brew package managers, along with setting up personalized dotfiles for streamlined development environments.
Supported on linux (ubuntu, debian)

## Installation

This will clone the repo to the current path

```bash
bash -i <(wget -qO- https://raw.githubusercontent.com/tymoyato/tmp/main/run.sh)
```

Password will be asked for (packages manager, default shell setup)

It will logout from session next create symlinks 

```bash
bash symlink.sh
```

Setup fish shell (run in fish shell)

```bash
fish setup.fish
```

## Git setup

Add git remote, edit `./.devtools/git.yml`

```yml
  git:
  user:
    name: NAME
    email: EMAIL
```
Run
```bash
bash .devtools/git.sh
```
