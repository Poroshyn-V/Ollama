# 🤖 Ollama AI Service for AdWatch Bot

## 🚀 **Описание**

Этот сервис предоставляет AI возможности для AdWatch Bot, используя Ollama с несколькими мощными моделями:

- **🎤 Whisper** - Транскрипция видео/аудио
- **🧠 Llama 3** - Анализ текста и предсказания
- **💡 Mistral** - Генерация контента
- **🔧 Code Llama** - Анализ кода

## 🛠️ **Технические детали**

### **Порт:** 11434
### **API Endpoints:**
- `GET /api/tags` - Список установленных моделей
- `POST /api/generate` - Генерация текста
- `POST /api/chat` - Чат с моделями

### **Переменные окружения:**
- `OLLAMA_HOST=0.0.0.0`
- `OLLAMA_ORIGINS=*`
- `OLLAMA_KEEP_ALIVE=24h`

## 🚀 **Развертывание на Railway**

1. **Подключите GitHub репозиторий к Railway**
2. **Railway автоматически определит Dockerfile**
3. **Сервис установит все модели при первом запуске**
4. **Время развертывания: ~10-15 минут**

## 📊 **Мониторинг**

### **Проверка здоровья:**
```bash
curl https://your-service.up.railway.app/api/tags
```

### **Логи Railway:**
```bash
railway logs
```

## 🔧 **Использование**

### **Пример запроса:**
```bash
curl -X POST https://your-service.up.railway.app/api/generate \
  -H "Content-Type: application/json" \
  -d '{
    "model": "llama3:8b",
    "prompt": "Analyze this creative: Your text here",
    "stream": false
  }'
```

## 💰 **Стоимость Railway**

- **Free tier:** Достаточно для тестирования
- **Pro tier:** $5/месяц для продакшена
- **Enterprise:** $20/месяц для высоких нагрузок

---

**Готово к развертыванию! 🚀**
