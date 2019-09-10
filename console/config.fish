
# set -g fish_prompt_pwd_dir_length 0

set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths


# Set Propmt ------------------------------------------------------------------------------------
# https://gist.github.com/davidmh/721241c7c34f841eed07

# Use Fishline from https://github.com/0rax/fishline
# function fish_prompt
#     fishline -s $status
# end

# # Simple prompt message
# function fish_prompt -d "Write out the prompt"
# 	printf '%s %s ~%s%s> ' (basename $PWD) (whoami) (set_color $fish_color_cwd) (set_color normal)
# end

# # Prompt message with git status
# set fish_git_dirty_color cyan
# set fish_git_not_dirty_color green
# 
# function parse_git_branch
#   set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
#   set -l git_status (git status -s)
# 
#   if test -n "$git_status"
#     echo (set_color $fish_git_dirty_color)$branch(set_color normal)
#   else
#     echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
#   end
# end
# 
# function fish_prompt -d "Write out the prompt"
#   set -l git_dir (git rev-parse --git-dir 2> /dev/null)
#   if test -n "$git_dir"
#   	printf '%s %s%s %s~> ' (basename $PWD) (set_color normal) (parse_git_branch) (set_color grey)
#   else
#     printf '%s %s~> ' (basename $PWD) (set_color normal)
#   end
# end
# ---------------------------------------------------------------------------------------------


source ~/.bash_profile
set -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths

# Config for starship https://github.com/starship/starship
# eval (starship init fish)


# chips
if [ -e ~/.config/chips/build.fish ] ; . ~/.config/chips/build.fish ; end

