FROM ollama/ollama:latest

# Устанавливаем необходимые модели при запуске
COPY setup-models.sh /setup-models.sh
RUN chmod +x /setup-models.sh

# Открываем порт для API
EXPOSE 11434

# Запускаем Ollama и устанавливаем модели
CMD ["/setup-models.sh"]
