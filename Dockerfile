# Указываем базовый образ для Go
FROM golang:1.22

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

COPY go.mod go.sum ./

# Копируем файл базы данных
COPY tracker.db ./

# Загружаем зависимости и собираем бинарный файл
RUN go mod download

# Копируем файлы go в рабочую директорию
COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main main.go

CMD ["/main"]