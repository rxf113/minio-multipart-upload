FROM openjdk:8-jre

ENV SERVICE_VERSION="0.0.1-SNAPSHOT" \
    SERVICE_NAME='minio-multipart-upload' \
    TZ="Asia/Shanghai" \
    JAVA_OPTS="-Xms128m -Xmx128m -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005"

# 设置时区
RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# 创建工作目录
RUN mkdir /app
WORKDIR /app

# 复制 Jar 文件到容器
COPY ./target/${SERVICE_NAME}-${SERVICE_VERSION}.jar .

# 启动 Jar
CMD java ${JAVA_OPTS} -jar ${SERVICE_NAME}-${SERVICE_VERSION}.jar
