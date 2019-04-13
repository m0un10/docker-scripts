: "${PASSWORD:?Must set PASSWORD}"

[[ ! -z "${USERNAME}" ]] || USERNAME=root
[[ ! -z "${HOST}" ]] || HOST=localhost

runScript(){
  [[ ! -z "${IMAGE}" ]] || IMAGE=mysql:5.6
  docker run --rm -i ${IMAGE} /bin/sh -c \
    'mysql -u ${1} -p ${2} -h ${3}'
}

runScript ${USERNAME} ${PASSWORD} ${HOST}
