# 📡 YouTube CDN Ping Checker

Bash-скрипт для диагностики задержки до ближайшего YouTube CDN-кластера. Полезен при проблемах с воспроизведением видео, высоким буферингом или нестабильным соединением с YouTube.

---

## 🔍 Что делает скрипт

1. Обращается к `redirector.googlevideo.com` — официальному сервису маппинга YouTube CDN
2. Определяет имя ближайшего CDN-кластера (например, `sox-beg5`)
3. Формирует хост вида `r1.<cluster>.googlevideo.com`
4. Отправляет 8 ICMP-пакетов на этот хост
5. Выводит средний пинг в миллисекундах

---

## 📦 Установка

### С правами sudo (рекомендуется)

```bash
sudo curl -sL "https://raw.githubusercontent.com/thekhabaroff/YT/main/yt.sh" -o /usr/local/bin/yt && sudo chmod +x /usr/local/bin/yt
```

### Без sudo (в домашнюю директорию)

```bash
curl -sL "https://raw.githubusercontent.com/thekhabaroff/YT/main/yt.sh" -o ~/.local/bin/yt && chmod +x ~/.local/bin/yt
```

> Убедись, что `~/.local/bin` добавлен в `$PATH`:
> ```bash
> echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc && source ~/.bashrc
> ```

---

## 🚀 Использование

```bash
yt
```

### Пример вывода

```
Ответ redirector: r1---sn-sox-beg5.googlevideo.com => sox-beg5 (1)
Кластер (parsed): sox-beg5
Пробуем хост:     r1.sox-beg5.googlevideo.com
Средний пинг до r1.sox-beg5.googlevideo.com: 12.453 мс
```

---

## 🔧 Требования

| Зависимость | Описание |
|-------------|----------|
| `bash`      | Версия 4.0+ |
| `curl`      | Для запроса к redirector API |
| `ping`      | Стандартная утилита (входит в `iputils-ping` / `inetutils`) |
| `sed`, `awk` | Стандартные утилиты парсинга |

На большинстве Linux-дистрибутивов всё уже установлено.

---

## 🔄 Обновление

Просто выполни команду установки повторно — файл будет перезаписан последней версией из репозитория.

---

## 🖥️ Совместимость

- ✅ Ubuntu / Debian
- ✅ Arch Linux / Manjaro
- ✅ Fedora / RHEL
- ✅ macOS (с `brew install coreutils`)
- ⚠️ WSL (Windows Subsystem for Linux) — `ping` может требовать прав

---

## 📄 Лицензия

MIT — используй свободно.
