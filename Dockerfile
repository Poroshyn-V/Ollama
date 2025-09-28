FROM ollama/ollama:latest

# Устанавливаем необходимые модели при запуске
COPY setup-models.sh /setup-models.sh
COPY healthcheck.sh /healthcheck.sh
RUN chmod +x /setup-models.sh /healthcheck.sh

# Открываем порт для API
EXPOSE 11434

# Настройки для Railway
ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_ORIGINS=*

# Запускаем Ollama и устанавливаем модели
CMD ["/setup-models.sh"]
