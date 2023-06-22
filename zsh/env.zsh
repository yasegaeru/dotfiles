# XDG Base Directory Specification
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.share

# bin files
PATH="${PATH:+${PATH}:}$DOTPATH/bin"

# docker
#export DOCKER_BUILDKIT=1

# gradle
if (( $+commands[gradle] )); then
  export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
fi

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Python tcl-tk
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"

# Rye
source "$HOME/.rye/env"

# Ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/shims:$PATH"
eval "$(rbenv init -)"

# fzf
if (( $+commands[fzf] )); then
  export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
  export FZF_COMPLETION_OPTS='+c -x'

  # Use ag instead of the default find command for listing candidates.
  # - The first argument to the function is the base path to start traversal
  # - Note that ag only lists files not directories
  # - See the source code (completion.{bash,zsh}) for the details.
  _fzf_compgen_path() {
    ag -g "" "$1"
  }
fi

# flutter
export PATH="$HOME/fvm/default/bin:$PATH"

# go
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=100000
