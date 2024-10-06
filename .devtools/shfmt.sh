#!/bin/bash

find . -name "*.sh" -exec shfmt -w {} +
