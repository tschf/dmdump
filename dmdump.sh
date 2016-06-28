#!/bin/bash

# Arguments
EXPECTED_ARGS=5

DIR="$(dirname "$(readlink -f "$0")")"
cd ${DIR}

USER=$1
PASS=$2
SERVER=$3
PORT=$4
SID=$5

print_usage(){
    echo "dmdump schema password server port sid"
    exit 1
}

# Make sure the correct number of arguments were received
if [[ $# -ne ${EXPECTED_ARGS} ]]; then
    echo "Wrong number of args; Received $#; Expected ${EXPECTED_ARGS}" >&2
    print_usage
    exit ${INVALID_ARGS}
fi

echo "INPUT:"
echo USER:${USER}
echo PASS:${PASS}
echo SERVER:${SERVER}
echo PORT:${PORT}
echo SID:${SID}

echo "exit" | sql ${USER}/${PASS}@//${SERVER}:${PORT}/${SID} @scriptWrap

echo "Finished"
exit 0
