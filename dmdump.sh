#!/bin/bash

# Arguments
EXPECTED_ARGS=1

LIB_DIR="$(dirname "$(readlink -f "$0")")"

CONN_STR=$1

print_usage(){
    echo "dmdump connect_string"
    echo "connect_string format can be:"
    echo "  hr/hr@//server:port/service_name"
    echo "  hr/hr@//server:port:sid"
    echo "  hr/hr@TNSNAME"
    exit 1
}

# Make sure the correct number of arguments were received
if [[ $# -ne ${EXPECTED_ARGS} ]]; then
    echo "Wrong number of args; Received $#; Expected ${EXPECTED_ARGS}" >&2
    print_usage
    exit ${INVALID_ARGS}
fi
# Warn if TNS_ADMIN is not set.
if [[ -z ${TNS_ADMIN} ]]; then
    echo "WARNING: For TNS connections, the TNS_ADMIN environment variable must be set to the directory containing TNSNAMES.ora" >&2
fi

echo "INPUT:"
echo CONN_STR:${CONN_STR}

echo "exit" | sql -L ${CONN_STR} @${LIB_DIR}/scriptWrap ${LIB_DIR}

echo "Finished"
exit 0
