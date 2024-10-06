#!/bin/bash

find . -name "*.sh" -exec shellcheck -e SC1090 -x {} +
