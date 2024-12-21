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
bash -i .Kitay-Gorod/symlink.sh
```

Setup fish shell (run in fish shell)

```bash
fish .Kitay-Gorod/setup.fish
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
bash .Kitay-Gorod/.devtools/git.sh
```
## Screenshots

### mountain theme

#### With compton and rofi
![](https://github.com/tymoyato/Kitay-Gorod/blob/main/dotfiles/awesome/themes/mountain/screenshots/mountain-desktop.png)
---

![](https://github.com/tymoyato/Kitay-Gorod/blob/main/dotfiles/awesome/themes/mountain/screenshots/mountain-nvim.png)
---

## Awesome WM v4.3

## Build Information

- **Compiled against Lua**: 5.3.6
- **Running with Lua**: 5.3
- **D-Bus support**: ✔
- **execinfo support**: ✔
- **xcb-randr version**: 1.6
- **LGI version**: 0.9.2
