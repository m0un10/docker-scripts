: "${1:?$0 <CONTAINER>}"

runPrompt(){
  docker exec -ti ${1} /bin/sh -c \
    'mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD}'
}

runPrompt ${1}
