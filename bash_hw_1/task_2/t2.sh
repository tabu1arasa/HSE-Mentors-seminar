#!/usr/bin/zsh

# Данные изменения будут работать только в текущей терминальной сессии.
# Чтобы изменить глобальную $PATH, нужно добавить запись обновленной переменной в .bashrc, .zshrc или /etc/profile
# Потом нужно перезапустить терминал, либо ввести команду source

echo "PATH content: $PATH"

if [ $# != 1 ]; then
    echo "Arguments count is not equal to 1"
    exit 1
fi

if [ -d $1 ]; then
    PATH="$PATH:$1"
    echo "New PATH content: $PATH"
    # echo "export PATH=$PATH" >> /etc/profile
    # source /etc/profile
    # echo "New PATH content: $PATH"
    exit 0
else
    echo "Directory $1 doesn't exist"
    exit 1
fi
