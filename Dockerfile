FROM consol/ubuntu-xfce-vnc
MAINTAINER Jianshen Liu "jliu120@ucsc.edu"
ENV REFRESHED_AT 2018-04-12

USER 0
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        libc6:i386 \
        libncurses5:i386 \
        libstdc++6:i386 \
        lib32z1 \
        libbz2-1.0:i386

## Clean Up
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PATH=$PATH:/root/android-studio/bin \
    ANDROID_SDK_HOME=/headless \
    ANDROID_EMULATOR_USE_SYSTEM_LIBS=1

RUN printf "\\n\\n# Startup Program\\nstudio.sh &> %s/androidstudio_startup.log &" "$STARTUPDIR" >> "$HOME"/wm_startup.sh
