FROM ollama/ollama:latest

# Устанавливаем Node.js и netcat для проверки портов
RUN apt-get update && apt-get install -y netcat-openbsd nodejs npm && rm -rf /var/lib/apt/lists/*

# Устанавливаем необходимые модели при запуске
COPY setup-models.sh /setup-models.sh
COPY healthcheck.sh /healthcheck.sh
COPY simple-server.js /simple-server.js
RUN chmod +x /setup-models.sh /healthcheck.sh

# Открываем порты для API
EXPOSE 11434
EXPOSE 8080

# Настройки для Railway
ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_ORIGINS=*

# Запускаем Ollama и устанавливаем модели
CMD ["/setup-models.sh"]
