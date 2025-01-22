alias mv="mv -iv"
alias rm="rm -v"

if command -sq rsync
	alias cp="rsync -iv"
end

if command -sq yazi
	alias lf="yazi"
end

if command -sq exa
	alias l="exa -lahg --icons --octal-permissions"
	alias ll="exa -lhg --icons --octal-permissions"
end
