#!/bin/dash
# test pushy-status command
touch a
pushy-init
pushy-add a
pushy-commit -m first-commit
pushy-status >test05.in
if [ "$(grep -E "^a - " "test05.in")" = "a - same as repo" ]; then
    echo "Test05 passed"
else
    echo "Test05 failed"
fi
rm -rf .pushy test05.in