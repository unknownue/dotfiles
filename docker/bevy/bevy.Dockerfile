
FROM nvidia/cuda:12.1.0-cudnn8-devel-ubuntu22.04

ARG DOCKER_USER=unknownue
ARG DOCKER_EMAIL=unknownue@outlook.com
ARG RUST_TOOLCHAIN=nightly
ARG VULKAN_VERSION=1.3.216.0

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=American/New_York
ENV NVIDIA_DRIVER_CAPABILITIES compute,graphics,utility,display
ENV PATH="/home/$DOCKER_USER/.local/bin:${PATH}"
ENV PATH="/user/local/cargo/bin/:${PATH}"

COPY ubuntu2204-mirror.txt /etc/apt/sources.list

RUN apt update && \
    apt install -y -qq --no-install-recommends software-properties-common openbox xauth \
    ca-certificates git wget sudo curl pkg-config neovim python3

# Bevy dependencies
# https://github.com/bevyengine/bevy/issues/11768#issuecomment-1946584150
RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yq libasound2-dev libudev-dev libxkbcommon-x11-0
RUN apt-get update -y -qq
RUN add-apt-repository ppa:kisak/turtle -y
RUN apt-get update
RUN apt install -y xvfb libegl1-mesa libgl1-mesa-dri libxcb-xfixes0-dev mesa-vulkan-drivers

# Docker user -------------------------------------------------------------------
# See also http://gbraad.nl/blog/non-root/user/inside-a-docker-container.html
RUN adduser --disabled-password --gecos '' $DOCKER_USER && \
    adduser $DOCKER_USER sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    echo "[core]editor=nvim" >> ~/.gitconfig && \
    git config --global user.email $DOCKER_EMAIL && \
    git config --global user.name $DOCKER_USER
USER $DOCKER_USER

# Audio
# See also https://github.com/TheBiggerGuy/docker-pulseaudio-example/tree/master
# RUN sudo gpasswd -a $DOCKER_USER audio
# COPY pulse-client.conf /etc/pulse/client.conf

# Python deps
RUN sudo curl https://bootstrap.pypa.io/get-pip.py -sLo get-pip.py && \
    python3 get-pip.py && \
    sudo rm get-pip.py && \
    sudo ln -sf /usr/bin/python3 /usr/bin/python
RUN python3 -m pip install --user --no-cache-dir pqi && \
	sudo mkdir -p /home/unknownue/.config/pip && \
	sudo chmod a+rw /home/unknownue/.config/pip && \
    pqi use aliyun && \
    python3 -m pip install --user --no-cache-dir ag2 autogenstudio vllm

# Install Vulkan SDK
WORKDIR /opt
COPY nvidia_icd.json /etc/vulkan/icd.d/nvidia_icd.json
RUN sudo wget https://sdk.lunarg.com/sdk/download/$VULKAN_VERSION/linux/vulkansdk-linux-x86_64-$VULKAN_VERSION.tar.gz -O VulkanSDK.tar.gz && \
    sudo tar xzf VulkanSDK.tar.gz && sudo mv $VULKAN_VERSION VulkanSDK && \
    sudo rm VulkanSDK.tar.gz && \
    echo 'source /opt/VulkanSDK/setup-env.sh' >> $HOME/.bashrc

WORKDIR /workspace

# Install rust toolchain (https://rust-lang.github.io/rustup/installation/other.html)
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain $RUST_TOOLCHAIN
# RUN rustup_url="https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-musl/rustup-init" && \
#     sudo wget "$rustup_url" && \
#     sudo chmod +x rustup-init && \
#     sudo ./rustup-init -y --no-modify-path --default-toolchain $RUST_TOOLCHAIN && \
#     sudo rm rustup-init

# RUN sudo chmod -R a+w /usr/local/rustup /usr/local/cargo && \
#     rustup --version && \
#     cargo --version && \
#     rustc --version

ADD startup.sh /opt/startup.sh
RUN sudo chmod +x /opt/startup.sh
CMD ["sh", "-c", "/opt/startup.sh"]
CMD ["tail", "-f", "/dev/null"]
