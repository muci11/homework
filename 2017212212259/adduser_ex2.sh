#!/bin/bash

read -p 'Enter username:' USER_NAME

read -p 'Enter person info:' COMMENT

PASSWORD=$(date +%s%N | sha256sum | head -c6)
SPECIAL_CHAR1=$(echo '!@#$%^&*()_+=-' | fold -w1 | shuf | head -c1)
SPECIAL_CHAR2=$(echo '!@#$%^&*()_+=-' | fold -w1 | shuf | head -c1)
PASS=$(echo "${PASSWORD}${SPECIAL_CHAR1}${SPECIAL_CHAR2}" | fold -w1 | shuf |tr -d '\n')
echo "Computer random password:"${PASS}
useradd -c "${COMMENT}" -m ${USER_NAME}

echo ${USER_NAME}:${PASS}|chpasswd
