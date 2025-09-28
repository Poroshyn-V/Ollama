#!/bin/bash

# Запускаем Ollama в фоне
echo "🚀 Starting Ollama server..."
ollama serve &

# Ждем запуска сервера
echo "⏳ Waiting for Ollama to start..."
sleep 60

# Проверяем, что сервер запустился
echo "🔍 Checking Ollama server status..."
for i in {1..30}; do
  if curl -f http://127.0.0.1:11434/api/tags > /dev/null 2>&1; then
    echo "✅ Ollama server is running!"
    break
  else
    echo "⏳ Waiting for server... ($i/30)"
    sleep 10
  fi
done

# Проверяем еще раз, что сервер действительно работает
if ! curl -f http://127.0.0.1:11434/api/tags > /dev/null 2>&1; then
  echo "❌ Ollama server failed to start!"
  exit 1
fi

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
