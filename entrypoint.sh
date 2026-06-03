#!/bin/bash
set -x

echo "Starting Qsample"

export PROFILE=prod
export JAR=qsample.jar

cd /app

# Generate and persist JWT secret on first start; reuse on subsequent starts
# so issued tokens survive container restarts. /secrets is expected to be a
# persistent volume mount; falls back to in-container path if missing.
SECRET_DIR=/secrets
SECRET_FILE="${SECRET_DIR}/jwt.secret"
mkdir -p "${SECRET_DIR}"
if [ ! -s "${SECRET_FILE}" ]; then
    head -c 64 /dev/urandom | base64 | tr -d '\n=' > "${SECRET_FILE}"
    chmod 600 "${SECRET_FILE}"
fi
export JWT_SECRET="$(cat "${SECRET_FILE}")"

# Bundled SPA assets only exist in the prod image; skip env.js rewrite in dev.
if command -v envsubst > /dev/null 2>&1; then
    unzip -o ${JAR} BOOT-INF/classes/static/assets/env.sample.js
    envsubst < BOOT-INF/classes/static/assets/env.sample.js > BOOT-INF/classes/static/assets/env.js
    jar -uf ${JAR} BOOT-INF/classes/static/assets/env.js
fi

exec java -jar -Dspring.config.location=file:/config/application.yml -Dspring.profiles.active=${PROFILE} /app/${JAR}
