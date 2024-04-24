#!/bin/dash
# test pushy-branch command
pushy-branch a >test08.in

if [ "$(cat test08.in)" != "pushy-branch: error: pushy repository directory .pushy not found" ]; then
    echo "Test08 failed"
    rm test08.in
    exit 1
fi

pushy-init
pushy-branch a >test08.in
if [ "$(cat test08.in)" != "pushy-branch: error: this command can not be run until after the first commit" ]; then
    echo "Test08 failed"
    rm test08.in
    exit 1
fi

touch a
pushy-add a
pushy-commit -m commit-1

pushy-branch a
pushy-branch a >test08.in
if [ "$(cat test08.in)" != "pushy-branch: error: branch 'a' already exists" ]; then
    echo "Test08 failed"
    rm -rf .pushy test08.in a
    exit 1
fi
echo "Test08 passed"
rm -rf .pushy test08.in a

