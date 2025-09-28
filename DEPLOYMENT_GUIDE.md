# 🚀 **Руководство по развертыванию Ollama на Railway**

## 📋 **Пошаговая инструкция**

### **1. Создание GitHub репозитория**

1. **Перейдите на GitHub.com**
2. **Нажмите "New repository"**
3. **Название:** `adwatch-ollama-service`
4. **Описание:** `Ollama AI service for AdWatch Bot`
5. **Сделайте репозиторий публичным**
6. **НЕ создавайте README, .gitignore или лицензию**
7. **Нажмите "Create repository"**

### **2. Загрузка кода в GitHub**

```bash
# В папке ollama-service выполните:
git remote add origin https://github.com/YOUR_USERNAME/adwatch-ollama-service.git
git branch -M main
git push -u origin main
```

### **3. Развертывание на Railway**

1. **Перейдите на railway.app**
2. **Войдите в аккаунт**
3. **Нажмите "New Project"**
4. **Выберите "Deploy from GitHub repo"**
5. **Выберите репозиторий `adwatch-ollama-service`**
6. **Railway автоматически определит Dockerfile**

### **4. Настройка переменных окружения**

Railway автоматически установит:
- `OLLAMA_HOST=0.0.0.0`
- `OLLAMA_ORIGINS=*`
- `OLLAMA_KEEP_ALIVE=24h`

### **5. Ожидание развертывания**

- **Время развертывания:** 10-15 минут
- **Установка моделей:** 5-10 минут
- **Общий размер моделей:** ~8GB

### **6. Получение URL сервиса**

После развертывания получите URL вида:
`https://adwatch-ollama-service-production.up.railway.app`

### **7. Настройка основного бота**

Добавьте в переменные окружения основного бота:
```
OLLAMA_URL=https://your-ollama-service.up.railway.app
```

## 🔍 **Проверка работы**

### **Тест здоровья сервиса:**
```bash
curl https://your-service.up.railway.app/api/tags
```

### **Тест генерации:**
```bash
curl -X POST https://your-service.up.railway.app/api/generate \
  -H "Content-Type: application/json" \
  -d '{
    "model": "llama3:8b",
    "prompt": "Hello, how are you?",
    "stream": false
  }'
```

## 📊 **Мониторинг**

### **Логи Railway:**
```bash
railway logs --service adwatch-ollama-service
```

### **Метрики использования:**
- CPU: ~2-4 cores
- RAM: ~4-8GB
- Storage: ~10GB

## 💰 **Стоимость**

- **Free tier:** Достаточно для тестирования
- **Pro tier:** $5/месяц для продакшена
- **Enterprise:** $20/месяц для высоких нагрузок

---

**Готово к развертыванию! 🚀**
