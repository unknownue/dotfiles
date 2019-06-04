
# set -g fish_prompt_pwd_dir_length 0

set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths


# function fish_prompt -d "Write out the prompt"
# 	printf '%s %s ~%s%s> ' (basename $PWD) (whoami) (set_color $fish_color_cwd) (set_color normal)
# end

function fish_prompt -d "Write out the prompt"
	printf '%s ~%s%s> ' (basename $PWD) (set_color $fish_color_cwd) (set_color normal)
end


source ~/.bash_profile
set -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths
