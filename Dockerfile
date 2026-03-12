FROM node:20.12.2

WORKDIR /app

# Устанавливаем инструменты сборки (уже есть)
RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*

# Копируем файлы зависимостей
COPY app/package*.json ./

# Устанавливаем зависимости с подробным выводом
RUN npm ci --verbose --no-audit --no-fund

# Копируем остальной код
COPY app/ ./

CMD ["make", "test"]