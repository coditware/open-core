DIR=$(dirname ${BASH_SOURCE[0]})
VARIABLES_FILE=${DIR}/.variables

if [ ! -f ${VARIABLES_FILE} ]; then
  echo "FILE NOT FOUND: ${VARIABLES_FILE}"
  exit 1
fi

source ${VARIABLES_FILE}

if [ -n ${SERVICE_NAME} ]; then
  echo "VARIABLE NOT SPECIFIED: SERVICE_NAME"
  exit 1
fi

docker stack rm ${SERVICE_NAME}

