: "${DATABASE:?Must set DATABASE}"
: "${PASSWORD:?Must set PASSWORD}"

[[ ! -z "${USERNAME}" ]] || USERNAME=root
[[ ! -z "${HOST}" ]] || HOST=localhost

backupDatabase(){
  [[ ! -z "${IMAGE}" ]] || IMAGE=mysql:5.6
  DATETIME=`date +%Y-%m-%d-%H-%M-%S`
  FILENAME=${1}-${DATETIME}.sql
docker run --rm -ti ${IMAGE} /bin/sh -c \
"mysqldump -u ${USERNAME} -p${PASSWORD} -h ${HOST} --databases ${1}" > ${FILENAME}
  [[ -z "${S3_BUCKET}" ]] || aws s3 cp ${FILENAME} ${S3_BUCKET}/ ${S3_ARGS}
}
