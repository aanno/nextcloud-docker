#!/bin/bash -x
# https://unix.stackexchange.com/questions/53737/how-to-list-all-files-ordered-by-size
find data -type f  -exec du -h {} + | sort -r -h | less
