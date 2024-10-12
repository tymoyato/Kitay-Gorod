#!/bin/bash

setup_git() {
    if [ ! -d ".git" ]; then
        git init
        git remote add origin https://github.com/tymoyato/Kitay-Gorod.git
    fi
    git remote -v
    git fetch origin main
    git reset --hard origin/main
}

setup_git