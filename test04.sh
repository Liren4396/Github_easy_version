#!/bin/dash
# test pushy-show command
pushy-show 0:a >test04.in

if [ "$(cat test04.in)" != "pushy-show: error: pushy repository directory .pushy not found" ]; then
    echo "Test04 failed"
    rm test04.in
    exit 1
fi

pushy-init
echo 1 >a
pushy-add a
pushy-commit -m commit-1
echo 2 >a
pushy-show 0:a >test04.in

if [ "$(cat test04.in)" != "1" ]; then
    echo "Test04 failed"
    rm -rf a .pushy test04.in
    exit 1
fi

pushy-add a
pushy-commit -m commit-2
pushy-show 1:a >test04.in
if [ "$(cat test04.in)" = "2" ]; then
    echo "Test04 passed"
else
    echo "Test04 failed"
fi


rm -rf a .pushy test04.in