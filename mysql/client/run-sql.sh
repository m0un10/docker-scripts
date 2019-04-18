: "${PASSWORD:?Must set PASSWORD}"

[[ ! -z "${USERNAME}" ]] || USERNAME=root
[[ ! -z "${HOST}" ]] || HOST=localhost

runScript(){
  [[ ! -z "${IMAGE}" ]] || IMAGE=mysql:5.6
  docker run --rm -i ${IMAGE} /bin/sh -c \
    'mysql -u ${1} -p ${2} -h ${3}' < ${4}
}

if [[ $1 == "s3://*" ]]; then
  DATETIME=`date +%Y-%m-%d-%H-%M-%S`
  FILENAME=temp-${DATETIME}
  aws s3 cp ${1} ${FILENAME} ${S3_ARGS}
else
  FILENAME=$1
fi

runScript ${USERNAME} ${PASSWORD} ${HOST} ${FILENAME}

if [[ $1 == "s3://*" ]]; then
  rm ${FILENAME}
fi
