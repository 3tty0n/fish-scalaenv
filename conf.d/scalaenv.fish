if not command -s scalaenv > /dev/null
    echo "scalaenv: command not found. See https://github.com/scalaenv/scalaenv"
    exit 1
end

set -l scalaenv_root ''
if test -z "$SCALAENV_ROOT"
    set scalaenv_root "$HOME/.scalaenv"
    set -x SCALAENV_ROOT "$HOME/.scalaenv"
else
    set scalaenv_root "$SCALAENV_ROOT"
end

set -x PATH $scalaenv_root/shims $PATH
set -x SCALAENV_SHELL fish
if test ! -d "$scalaenv_root/shims"; or test ! -d "$scalaenv_root/versions"
    command mkdir -p $scalaenv_root/{shims,versions}
end
