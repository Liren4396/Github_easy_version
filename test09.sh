#!/bin/dash
# test pushy-checkout command

pushy-checkout a >test09.in

if [ "$(cat test09.in)" != "pushy-checkout: error: pushy repository directory .pushy not found" ]; then
    echo "Test09 failed"
    rm test09.in
    exit 1
fi
pushy-merge a -m commit-1 >test09.in
if [ "$(cat test09.in)" != "pushy-merge: error: pushy repository directory .pushy not found" ]; then
    echo "Test09 failed"
    rm test09.in
    exit 1
fi

pushy-init
touch a
pushy-add a
pushy-commit -m commit-1
pushy-branch a
pushy-checkout a >test09.in
if [ "$(cat test09.in)" != "Switched to branch 'a'" ]; then
    echo "Test09 failed"
else
    echo "Test09 passed"
fi
rm -rf .pushy test09.in a