#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#       Hyprland 
#fi

eval "$(ssh-agent -s)" &> /dev/null
ssh-add ~/.ssh/my-ssh-key &> /dev/null
