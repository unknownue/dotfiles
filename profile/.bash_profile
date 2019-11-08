
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export VULKAN_ROOT_LOCATION="/Users/usami/Development/Vulkan/SDK"
export VULKAN_SDK="$VULKAN_ROOT_LOCATION/macOS"
export VK_ICD_FILENAMES="$VULKAN_SDK/etc/vulkan/icd.d/MoltenVK_icd.json"
export VK_LAYER_PATH="$VULKAN_SDK/etc/vulkan/explicit_layer.d"

export RUST_SRC_PATH="~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"

export DYLD_LIBRARY_PATH="$VULKAN_SDK/lib"

export PATH="$VULKAN_SDK/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

alias ls='exa'
alias view='viu'
alias python="/usr/local/bin/python3"
alias python2="/usr/bin/python2.7"
alias cat="bat"
