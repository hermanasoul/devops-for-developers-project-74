# DevOps for Developers Project 74

[![Hexlet Check](https://github.com/hermanasoul/devops-for-developers-project-74/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/hermanasoul/devops-for-developers-project-74/actions/workflows/hexlet-check.yml)
[![Push Status](https://github.com/hermanasoul/devops-for-developers-project-74/actions/workflows/push.yml/badge.svg)](https://github.com/hermanasoul/devops-for-developers-project-74/actions/workflows/push.yml)

## Описание

Учебный проект по DevOps, в котором упаковывается приложение [js-fastify-blog](https://github.com/hexlet-components/js-fastify-blog) в Docker-образ, настраивается CI/CD через GitHub Actions, добавляется обратный прокси-сервер Caddy и база данных PostgreSQL.

**Образ на Docker Hub:** [`hermanasoul/devops-for-developers-project-74`](https://hub.docker.com/r/hermanasoul/devops-for-developers-project-74)

## Требования к системе

- Docker (версия 20.10 или выше) и Docker Compose (V2 встроенный или отдельный)
- Make (для удобного запуска команд)
- Git

## Установка и запуск

1. Клонируйте репозиторий:
```bash
git clone git@github.com:hermanasoul/devops-for-developers-project-74.git
cd devops-for-developers-project-74
```

2. Создайте файл .env из примера (если необходимо):
```bash
cp .env.example .env
```
(Если файла .env.example нет, создайте его вручную с переменными для базы данных)

3. Установите зависимости (только для разработки на хосте, необязательно):
```bash
make setup
```

4. Запустите приложение в режиме разработки:
```bash
make dev
```
Приложение будет доступно по адресу: https://localhost (Caddy автоматически перенаправит на HTTPS).

5. Для запуска тестов:
```bash
make test
```

6. Сборка продакшен-образа и публикация на Docker Hub:
```bash
make build-prod
make push
```

## Команды Makefile
- make setup – установка зависимостей внутри контейнера.
- make test – запуск тестов в продакшен-окружении (используется docker-compose.yml).
- make dev – запуск окружения для разработки (с перезагрузкой кода и Caddy).
- make build – сборка образа для разработки.
- make build-prod – сборка продакшен-образа.
- make push – публикация образа на Docker Hub.
- make ci – команда, используемая в CI (запуск тестов).

## Структура проекта
- .github/workflows/ – конфигурации GitHub Actions.
- app/ – исходный код приложения js-fastify-blog.
- services/caddy/ – конфигурация Caddy.
- Dockerfile – для разработки.
- Dockerfile.production – для продакшен-сборки.
- docker-compose.yml – основной compose-файл (для тестов).
- docker-compose.override.yml – для локальной разработки (добавляет Caddy, PostgreSQL, монтирование кода).
- .dockerignore – исключает ненужные файлы из контекста сборки.
- .gitignore – исключает временные файлы и секреты.

## Переменные окружения
Приложение конфигурируется через переменные окружения. В режиме разработки они задаются в docker-compose.override.yml. Для продакшена должны быть установлены в среде выполнения.

- DATABASE_HOST – хост базы данных (в compose это db).
- DATABASE_NAME – имя базы данных (по умолчанию postgres).
- DATABASE_USERNAME – пользователь (по умолчанию postgres).
- DATABASE_PASSWORD – пароль (по умолчанию password).
- DATABASE_PORT – порт (по умолчанию 5432).

## CI/CD
При каждом пуше в репозиторий запускается workflow push.yml, который:
1. Выполняет тесты в контейнере.
2. При успехе собирает образ с тегом latest и публикует его на Docker Hub.

## Лицензия
Проект создан в учебных целях.