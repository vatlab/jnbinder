alias jnbinder="docker run --rm  -v $PWD:$PWD -v $PWD/docs:$PWD/docs -v /tmp:/tmp -t -w=$PWD -u $UID:1000 gaow/jnbinder jnbinder"
