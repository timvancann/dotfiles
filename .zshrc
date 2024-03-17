# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias vim=nvim
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias blender="/Applications/Blender.app/Contents/MacOS/blender"
alias ls="eza -l"
alias cat="bat"


export PATH=$PATH:$HOME/.bin

complete -o nospace -C /opt/homebrew/bin/terraform terraform
export JAVA_HOME="/opt/homebrew/opt/openjdk@11"
export SCALA_HOME="/usr/local/opt/scala/idea"
export PATH="$JAVA_HOME/bin:$PATH"

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/Users/timvancann/.local/bin:$PATH"
export PATH="/Applications/aws-okta.app/Contents/MacOS/:$PATH"

export POETRY_PATH="$HOME/.local/bin/poetry"


if [ -f '/Users/timvancann/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/timvancann/Downloads/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/timvancann/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/timvancann/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath+=~/.zfunc

source /Users/timvancann/.config/az.completion
source <(kubectl completion zsh)
source <(helm completion zsh)

 
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
eval "$(pyenv init -)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
