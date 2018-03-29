#!/usr/bin/env bash
### install app

declare -r SYSTEM_TYPE="$(uname -s)"
declare -r APP_PATH=`dirname $(dirname $PWD)`

check_required_port() {
    printf "start check postgresql and elasticsearch port is opening ?\n"
    $1 | grep -i -E 'postgresql' > /dev/null
    if [[ "$?" -ne 0 ]]; then
        printf "postgresql not opened\n"
        exit 1
    fi
    $2 | grep 9200 > /dev/null
    if [[ "$?" -ne 0 ]]; then
        printf "elasticsearch not opened\n"
        exit 1
    fi
    $3 | grep 3000 > /dev/null
    if [[ "$?" -eq 0 ]]; then
        printf "your 3000 port is opening\n"
        printf "close it now... \n"
        kill -9 $($3 | grep 3000 | cut -c 9-13)
    fi
    printf "check required port over\n"
}

if [[ "${SYSTEM_TYPE}" =~ "Darwin" ]]; then
    check_required_port "lsof -i TCP:postgresql" "lsof -i TCP:9200 -P" "lsof -i TCP:3000 -s TCP:LISTEN -P"
else
    check_required_port "netstat -tnulp" "netstat -tnulp" "netstat -tnulp"
fi

cd "${APP_PATH}"
rake db:create
rake db:migrate
rake db:seed
rails s
