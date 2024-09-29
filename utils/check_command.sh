#!/bin/bash

check_command() {
    if [ $? -ne 0 ]; then
        printf "${RED}Command failed: $1${NC}\n"
        exit 1
    fi
}