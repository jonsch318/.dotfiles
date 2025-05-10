# source /etc/profile with bash
# if status is-login
#     exec bash -c "test -e /etc/profile && source /etc/profile;\
#     exec fish"
# end

starship init fish | source
# zoxide init --cmd cd fish | source

#FNM
set FNM_PATH "/home/jonas/.local/share/fnm"
if [ -d "$FNM_PATH" ]
	set PATH "$FNM_PATH $PATH"
	fnm env --shell fish | source
end

set -x GPG_TTY (tty)
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

function fish_greeting
	command -v pfetch >/dev/null && pfetch
end

set -gx SHELL /usr/bin/fish
set -gx VISUAL /usr/bin/nvim
set -gx EDITOR $VISUAL

## OTHER BINDS
function fish_user_key_bindings
	fish_vi_key_bindings insert
	bind -M insert ctrl-e accept-autosuggestion
end

bind -M insert $sudope_sequence sudope

# pnpm
set -gx PNPM_HOME "/home/jonas/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

# pnpm end

# Zellij
if status is-interactive
	set -gx ZELLIJ_AUTO_EXIT true
	eval (zellij setup --generate-auto-start fish | string collect)
end

# ANNOYING THINGS
set -gx PATH $PATH $HOME/.krew/bin



