#!/bin/bash

# Define o diretório de backup
BACKUP_DIR="$HOME/Backup"

# Cria o diretório de backup se ele não existir
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p "$BACKUP_DIR"
fi

# Define o nome do arquivo de backup com o formato desejado
DATE=$(date +"%Y%m%d%H%M")
BACKUP_FILE="backup_home_${DATE}.tgz"
BACKUP_PATH="$BACKUP_DIR/$BACKUP_FILE"

# Verifica se existe algum arquivo de backup criado na última semana
RECENT_BACKUP=$(find "$BACKUP_DIR" -ctime -7 -name backup_home_\*.tgz)

# Se existir um backup recente, pergunta ao usuário se deseja continuar
if [ -n "$RECENT_BACKUP" ]; then
    read -p "Existe um arquivo de backup criado na última semana. Deseja continuar? (s/n): " CONTINUE
    if [ "$CONTINUE" != "s" ]; then
        echo "Operação abortada pelo usuário."
        exit 1
    fi
fi

# Cria o arquivo de backup
tar -czf "$BACKUP_PATH" -C "$HOME" .

# Informa o nome do arquivo gerado
echo "Backup gerado com sucesso: $BACKUP_PATH"
echo "o backup sera apagado depois de 7 dias"
echo "teste de nova branch"
