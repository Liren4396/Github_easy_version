#!/bin/dash
# test pushy-commit command
pushy-add a >test02.in

if [ "$(cat test02.in)" = "pushy-add: error: pushy repository directory .pushy not found" ]; then
    pushy-init
    touch a
    pushy-add a 
    pushy-commit -m commit-1 >test02.in

    if [ "$(cat test02.in)" != "Committed as commit 0" ]; then
        echo "Test02 failed"
        rm -rf .pushy test02.in a b
        exit 1
    fi

    pushy-commit -m commit-1 >test02.in
    if [ "$(cat test02.in)" != "nothing to commit" ]; then
        echo "Test02 failed"
        rm -rf .pushy test02.in a b
        exit 1
    fi

    touch b
    pushy-add b
    pushy-commit -m commit-1 >test02.in
    if [ "$(cat test02.in)" != "Committed as commit 1" ]; then
        echo "Test02 failed"
        rm -rf .pushy test02.in a b
        exit 1
    fi

    echo "Test02 passed"
else
    
    echo "Test02 failed"
fi
rm -rf .pushy test02.in a b