#source /etc/zsh/zshrc
source ~/.zsh-custom/aliases.zsh
source ~/.zsh-custom/functions.zsh

# opam configuration
test -r /home/vincent/.opam/opam-init/init.zsh && . /home/vincent/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
