ARG PG_VERSION=16
FROM postgres:${PG_VERSION}-bookworm

ENV DEBIAN_FRONTEND=noninteractive

ARG PATRONI_DIR=/etc/patroni
ARG PG_DATA_DIR=/var/lib/postgresql/data

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-psycopg2 \
        python3-dev \
        libpq-dev \
        curl \
        vim \
    && pip3 install --no-cache-dir patroni[consul]==4.0.6 --break-system-packages \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p ${PG_DATA_DIR} ${PATRONI_DIR} \
    && chown -R postgres:postgres ${PATRONI_DIR} ${PG_DATA_DIR} \
    && chmod -R 700 ${PG_DATA_DIR} \
    && chmod -R 755 ${PATRONI_DIR}

COPY ./entrypoint.sh /
COPY --chown=postgres:postgres ./patroni.yml ${PATRONI_DIR}/patroni.yml
USER postgres
WORKDIR ${PATRONI_DIR}
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
