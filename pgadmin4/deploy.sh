DIR=$(dirname ${BASH_SOURCE[0]})
VARIABLES_FILE=${DIR}/.variables

if [ ! -f ${VARIABLES_FILE} ]; then
  echo "FILE NOT FOUND: ${VARIABLES_FILE}"
  exit 1
fi

source ${VARIABLES_FILE}

if [ ! -n ${COMPOSE_FILE} ]; then
  echo "VARIABLE NOT SPECIFIED: COMPOSE_FILE"
  exit 1
else
  if [ ! -f $DIR/${COMPOSE_FILE} ]; then
    echo "FILE NOT FOUND: ${COMPOSE_FILE}"
    exit 1
  fi
fi

if [ ! -n ${SERVICE_NAME} ]; then
  echo "VARIABLE NOT SPECIFIED: SERVICE_NAME"
  exit 1
fi

docker stack deploy --compose-file ${COMPOSE_FILE} ${SERVICE_NAME}

