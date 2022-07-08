
FROM maven:3.6.0-jdk-8-slim as build

WORKDIR /app


COPY src /app/src


COPY settings.xml pom.xml /app/

RUN mvn -s /app/settings.xml -f /app/pom.xml clean package

FROM alpine:3.13
ENV   MYSQL_HOST 10.0.224.11
ENV   MYSQL_USER_NAME music
ENV   MYSQL_PASSWORD WangHan2039
ENV   DATABASE_NAME waterfull
RUN apk add ca-certificates
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tencent.com/g' /etc/apk/repositories \
    && apk add --update --no-cache openjdk8-jre-base \
    && rm -f /var/cache/apk/*
WORKDIR /app
COPY --from=build /app/target/waterfull-music-0.0.1.jar .
EXPOSE 80
CMD ["java", "-jar", "/app/waterfull-music-0.0.1.jar"]