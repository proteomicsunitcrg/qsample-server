#!/bin/bash
set -x

echo "Starting Qsample"

export PROFILE=prod
export JAR=qsample.jar

cd /app
unzip ${JAR} BOOT-INF/classes/static/assets/env.sample.js

bash -c envsubst < BOOT-INF/classes/static/assets/env.sample.js > BOOT-INF/classes/static/assets/env.js

jar -uf ${JAR} BOOT-INF/classes/static/assets/env.js

exec java -jar -Dspring.config.location=file:/config/application.yml -Dspring.profiles.active=${PROFILE} /app/${JAR}
