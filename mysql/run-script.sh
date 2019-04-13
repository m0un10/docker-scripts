: "${1:?$0 <CONTAINER> <SCRIPT>}"
: "${2:?$0 <CONTAINER> <SCRIPT>}"

runScript(){
  docker exec -i ${1} /bin/sh -c \
    'mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD}'< ${2}
}

runScript ${1} ${2}
