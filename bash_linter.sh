#!/bin/bash
#
# Runs the bash linter (shellcheck) on each .sh file in this folder
#
# Contributors: Fong Chun Chan

find . -type f -name "*.sh" -print0 | xargs -t -0 shellcheck
