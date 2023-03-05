#!/bin/bash
#
#Show the usefulness of shift

echo The entire arguments provided are $*
echo The \$1 argument is $1
echo Now using shift
shift
echo The entire arguments provided after the shift are: $*
echo The \$1 argument is $1

