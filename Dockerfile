# Usar la imagen base de Alpine Linux
FROM alpine:latest

# Definir la versión de PocketBase
ARG PB_VERSION=0.26.4

# Instalar dependencias necesarias
RUN apk add --no-cache \
    unzip \
    ca-certificates

# Descargar y descomprimir PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

# Copiar los directorios locales de pb_migrations y pb_data, incluyendo storage
COPY ./pb_data /pb/pb_data
COPY ./pb_migrations /pb/pb_migrations

# Exponer el puerto para PocketBase
EXPOSE 8080

# Iniciar PocketBase
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080", "--dir=/pb/pb_data/storage/pbc_2353520092"]
