# stagio 1: Build
FROM golang:alpine AS build

WORKDIR /app

COPY main.go .

RUN go build -ldflags '-w -s' -o app main.go

# stagio 2: Final
FROM scratch

WORKDIR /app

COPY --from=build /app/app .

CMD ["./app"]
