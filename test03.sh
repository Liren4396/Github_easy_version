#!/bin/dash
# test pushy-log command
pushy-log >test03.in

if [ "$(cat test03.in)" != "pushy-log: error: pushy repository directory .pushy not found" ]; then
    echo "Test01 failed"
    rm -rf test03.in

    exit 1
fi

pushy-init
touch a b
pushy-add a b
pushy-commit -m first-commit 
pushy-log >test03.in
if [ "$(cat test03.in)" = "0 first-commit" ]; then
    echo "Test03 passed"
else
    echo "Test03 failed"

fi

rm -rf a b test03.in .pushy
