FROM node:20.12.2

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

COPY app/package*.json ./

RUN npm ci --verbose --no-audit --no-fund

COPY app/ ./

CMD ["make", "test"]