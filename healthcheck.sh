#!/bin/bash

# Simple healthcheck script for Ollama
echo "🔍 Checking Ollama health..."

# Check if Ollama is responding
if curl -f http://localhost:11434/api/tags > /dev/null 2>&1; then
  echo "✅ Ollama is healthy!"
  exit 0
else
  echo "❌ Ollama is not responding"
  exit 1
fi
