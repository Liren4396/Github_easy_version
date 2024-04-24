#!/bin/dash
# test pushy-commit -a command
pushy-init
touch a
pushy-add a
echo 1 >a
pushy-commit -a -m commit-1
pushy-show :a >test07.in

if [ "$(cat test07.in)" = "1" ]; then
    echo "Test07 passed"
else
    echo "Test07 failed"
fi

rm -rf .pushy a test07.in