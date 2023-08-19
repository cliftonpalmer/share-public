#!/bin/sh

# make sure public root and link dirs are declared
[[ -z "$PUBLIC_ROOT_DIR" ]] && echo Expected PUBLIC_ROOT_DIR && exit 1
[[ -z "$PUBLIC_LINK_DIR" ]] && echo Expected PUBLIC_LINK_DIR && exit 1

[[ -z "$1" ]] && echo Expected pattern && exit 1

# if pattern matches files from storage,
# create nonce directory
# create symlinks to matching files
nonce=$(head /dev/urandom | sha1sum -b | awk '{print $1}')
symlink_dir=$PUBLIC_LINK_DIR/$nonce

find $PUBLIC_ROOT_DIR -type f -name "*$1*" | while read fname
do
    [[ -d $symlink_dir ]] || mkdir -p $symlink_dir
    ln -s $fname $symlink_dir/$(echo $fname | sed 's|^.*/||')
done

# print nonce directory
echo $nonce
