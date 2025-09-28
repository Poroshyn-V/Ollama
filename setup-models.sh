#!/bin/bash

# Запускаем Ollama в фоне
echo "🚀 Starting Ollama server..."
ollama serve &

# Ждем запуска сервера
echo "⏳ Waiting for Ollama to start..."
sleep 15

# Проверяем, что сервер запустился
echo "🔍 Checking Ollama server status..."
for i in {1..10}; do
  if curl -f http://localhost:11434/api/tags > /dev/null 2>&1; then
    echo "✅ Ollama server is running!"
    break
  else
    echo "⏳ Waiting for server... ($i/10)"
    sleep 5
  fi
done

# Устанавливаем модели
echo "📦 Installing AI models..."

echo "🎤 Installing Whisper for transcription..."
ollama pull whisper

echo "🧠 Installing Llama 3 for text analysis..."
ollama pull llama3:8b

echo "💡 Installing Mistral for content generation..."
ollama pull mistral:7b

echo "🔧 Installing Code Llama for code analysis..."
ollama pull codellama:7b

echo "✅ All models installed successfully!"
echo "🚀 Ollama service is ready!"

# Держим контейнер запущенным
wait
