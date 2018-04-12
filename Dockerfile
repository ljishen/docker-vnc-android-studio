FROM consol/ubuntu-xfce-vnc
MAINTAINER Jianshen Liu "jliu120@ucsc.edu"
ENV REFRESHED_AT 2018-04-12

USER 0
RUN apt-get update && \
	apt-get install -y \
	lib32stdc++6

## Clean Up
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## switch back to default user
USER 1000

ENV PATH=$PATH:/headless/android-studio/bin \
    ANDROID_AVD_HOME=/root/.android/avd \
    ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
