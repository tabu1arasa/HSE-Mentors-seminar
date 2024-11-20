#!/usr/bin/zsh

# Чтобы alias стал постоянным, нужно добавить его в файл .bashrc или .zshrc (для bash и zsh соответственно),
# выполнить команду source и вызвать shell оболочку и обновленным alias'ом

echo "alias ll='ls -la'" >> ~/.zshrc
source ~/.zshrc
zsh
