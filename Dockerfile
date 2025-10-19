FROM alpine:latest

EXPOSE 8080
WORKDIR /app

# تحميل Xray بدلاً من V2Ray
RUN wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip Xray-linux-64.zip \
    && rm Xray-linux-64.zip \
    && rm -f config.json

# نسخ ملف الإعداد
COPY config.json /app

# تشغيل Xray
ENTRYPOINT ["./xray", "run", "-c", "config.json"]
