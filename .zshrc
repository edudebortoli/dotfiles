# 1. PATHS (Consolidated at the top for speed)
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:/home/eduardo/bin:/home/eduardo/fvm/bin:/home/eduardo/.cargo/bin:$PATH"

# 2. HOMEBREW (Static - no eval)
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}"

# 3. OH MY ZSH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"
plugins=(git z fzf) 
source $ZSH/oh-my-zsh.sh

# 4. FAST NODE MANAGER (fnm) instead of NVM
# This is the secret to instant startup
eval "$(fnm env --use-on-cd)"

# 5. ALIASES
alias vim="nvim"
alias lg="lazygit"

# 6. STATIC COMPLETIONS (Zero logic, just loading)
[[ -f $HOME/.fzf.zsh ]] && source $HOME/.fzf.zsh

# One-time generation for Angular (Run this manually once: ng completion script > ~/.ng_completion.zsh)
[[ -f "$HOME/.ng_completion.zsh" ]] && source "$HOME/.ng_completion.zsh"

# 7. ENV VARS
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QR_IM_MODULE=ibus
