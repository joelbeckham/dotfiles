function decode() {
  echo $1 | base64 --decode
  echo
}


function decodej() {
  echo $1 | base64 --decode | jq .
}

function dbash() {
	docker exec -it $1 /bin/bash
}

alias bastion="ssh joelbeckham@bastion.bombbomb.io"
alias bastion2="ssh joelbeckham@ec2-54-236-112-39.compute-1.amazonaws.com"
