#!/usr/bin/env bash
### install app

declare -r SYSTEM_TYPE="$(uname -s)"
declare -r APP_PATH=`dirname $(dirname $PWD)`

check_required_port() {
    echo "start check postgresql and elasticsearch port is opening ?"
    $1 | grep -i -E 'postgresql' > /dev/null
    if [[ "$?" -ne 0 ]]; then
        echo "postgresql not opened"
        exit 1
    fi
    $2 | grep 9200 > /dev/null
    if [[ "$?" -ne 0 ]]; then
        echo "elasticsearch not opened"
        exit 1
    fi
    $3 | grep 3000 > /dev/null
    if [[ "$?" -eq 0 ]]; then
        echo "your 3000 port is opening"
        printf "close it now... \n"
        kill -9 $($3 | grep 3000 | cut -c 9-13)
    fi
    echo "check required port over"
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
