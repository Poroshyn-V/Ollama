#!/bin/bash

# Запускаем Ollama в фоне
ollama serve &

# Ждем запуска сервера
sleep 10

# Устанавливаем модели
echo "Installing Whisper for transcription..."
ollama pull whisper

echo "Installing Llama 3 for text analysis..."
ollama pull llama3:8b

echo "Installing Mistral for content generation..."
ollama pull mistral:7b

echo "Installing Code Llama for code analysis..."
ollama pull codellama:7b

echo "All models installed successfully!"

# Держим контейнер запущенным
wait
