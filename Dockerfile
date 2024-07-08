# Указываем базовый образ для Go
FROM golang:1.22

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем go.mod и go.sum для установки зависимостей
COPY go.mod go.sum ./

# Загружаем зависимости
RUN go mod download

# Копируем все исходные файлы .go и другие необходимые файлы
COPY *.go ./
COPY tracker.db ./

# Собираем бинарный файл
# RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main main.go

# Указываем команду для запуска приложения
CMD ["/main"]
