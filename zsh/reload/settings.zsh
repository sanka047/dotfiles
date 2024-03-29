################################################################################
# ZSH Settings
################################################################################

# set config home
export XDG_CONFIG_HOME="$HOME/.config"

# Completion
# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'
autoload -Uz compinit && compinit

# make nvim the default editor
export VISUAL=nvim
export EDITOR="$VISUAL"
