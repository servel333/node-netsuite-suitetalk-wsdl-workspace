#!/bin/bash

# Make sure arguments were supplied
if [ $# -eq 0 ]
then
  echo "Executes a command in each submodule"
  echo "Usage: $0 <cmd> [<args>]"
  exit 1
fi

dirs=$(ls -1 -d . ./node-*)

for d in ${dirs}; do
  (
    echo
    echo "in ${d}"
    cd "${d}" || exit
    eval "$@"
  )
done

echo
echo "Done."
