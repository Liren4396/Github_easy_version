#!/bin/dash
# test pushy-add command
pushy-add a >test01.in

if [ "$(cat test01.in)" = "pushy-add: error: pushy repository directory .pushy not found" ]; then
    pushy-init
    pushy-add a >test01.in
    if [ "$(cat test01.in)" = "pushy-add: error: can not open 'a'" ]; then
        echo "Test01 pass"
    else
        echo "Test01 failed"
    fi
else
    
    echo "Test01 failed"
fi
rm -rf .pushy test01.in


