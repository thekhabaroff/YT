#!/bin/bash

YELLOW_BOLD='\033[1;33m'
RESET='\033[0m'

response=$(curl -s "https://redirector.googlevideo.com/report_mapping?di=no")

# вытаскиваем только sox-beg5
cluster=$(echo "$response" | sed -n 's/.*=> \([^ (]*\).*/\1/p')

if [[ -z "$cluster" ]]; then
  echo "Ошибка: не удалось извлечь имя кластера"
  exit 1
fi

host="r1.${cluster}.googlevideo.com"

ping_output=$(ping -c 8 "$host" 2>&1)
avg_ping=$(echo "$ping_output" | grep 'rtt' | awk -F '/' '{print $5}')

echo -e "Ответ redirector: ${response}"
echo -e "Кластер (parsed): ${YELLOW_BOLD}${cluster}${RESET}"
echo -e "Пробуем хост: ${YELLOW_BOLD}${host}${RESET}"
echo -e "Средний пинг до ${host}: ${YELLOW_BOLD}${avg_ping:-не удалось измерить} мс${RESET}"
