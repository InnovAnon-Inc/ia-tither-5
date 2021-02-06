#! /bin/bash
set -euvxo pipefail
(( ! $# ))
perf record \
  -e branch-instructions \
  -b                     \
  -o /var/cpuminer/data  \
  -D 666000              \
  --max-size=500M        \
  --all-user             \
  --                     \
  $PREFIX/bin/xmrig &
cpid=$!
#for k in $(seq 11) ; do
  sleep 999
  kill -0 $cpid
#done
kill $cpid
wait $cpid || :
rm -v "$0"

