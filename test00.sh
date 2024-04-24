#!/bin/dash
# test pushy-init command
touch a
pushy-init
pushy-init >test00.in

if [ "$(cat test00.in)" = "pushy-init: error: .pushy already exists" ]; then
    echo "Test00 passed"
else
    echo "Test00 failed"
fi

rm -rf .pushy a test00.in

