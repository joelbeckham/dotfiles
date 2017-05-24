function d() {
  echo $1 | base64 --decode
  echo
}


function dj() {
  echo $1 | base64 --decode | jq .
}
