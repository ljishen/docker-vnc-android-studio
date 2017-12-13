FROM consol/ubuntu-xfce-vnc
MAINTAINER Jianshen Liu "jliu120@ucsc.edu"
ENV REFRESHED_AT 2017-12-12

USER 0
RUN apt-get update && \
	apt-get install -y \
	lib32stdc++6

## Clean Up
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## switch back to default user
USER 1984

ENV PATH=$PATH:/headless/android-studio/bin \
    ANDROID_AVD_HOME=/root/.android/avd
