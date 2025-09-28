#!/bin/bash

# Simple healthcheck script for Ollama
echo "🔍 Checking Ollama health..."

# Check if Ollama port is open
if nc -z 127.0.0.1 11434; then
  echo "✅ Ollama is healthy!"
  exit 0
else
  echo "❌ Ollama is not responding"
  exit 1
fi
