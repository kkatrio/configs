set -x vim nvim
set -x grep 'grep --color=auto'

eval sh /home/kon/.config/base16-shell/scripts/base16-atelier-seaside.sh

if test -f /home/kon/.autojump/share/autojump/autojump.fish; . /home/kon/.autojump/share/autojump/autojump.fish; end
