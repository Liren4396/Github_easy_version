#!/bin/dash
# test pushy-rm command
pushy-init
pushy-add a
pushy-commit -m commit-1
pushy-rm a

if [ ! -f 'a' ]; then
    echo "Test06 passed"
else
    echo "Test06 failed"
fi

rm -rf .pushy a