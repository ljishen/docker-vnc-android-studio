# Android Studio in Docker via VNC

This image helps you to bootstrap your Android development environment in the remote host.

![screenshot](https://user-images.githubusercontent.com/468515/33925524-0b38012c-df8f-11e7-950a-8b3cfaf495fc.png)


### Prerequisites

- Make sure you have `KVM` installed properly in the host (e.g. [KVM installation for Ubuntu](https://help.ubuntu.com/community/KVM/Installation))
- The current user `$USER` has enough permission to access `/dev/kvm`


### Usage

1. Download and Install `Android Studio` in the remote host

   ```bash
   unzip android-studio-ide-XXX-linux.zip -d $HOME/android
   ```

1. Start VNC server

   ```bash
   docker run -d \
       --privileged \
       --user 0 \
       -v $HOME/android/android-studio:/headless/android-studio \
       -v $HOME/android/.AndroidStudio3.0:/root/.AndroidStudio3.0 \
       -v $HOME/android/Android:/root/Android \
       -v $HOME/android/.gradle:/root/.gradle \
       -v $HOME/android/.android:/root/.android \
       -p 5901:5901 \
       -p 6901:6901 \
       ljishen/vnc-android-studio
   ```

1. Connect to the remote host via VNC viewer

   `[HOST_IP]:5901`, default password: `vncpassword`

   You can also connect via browsing

   `http://[HOST_IP]:6901/vnc.html`, default password: `vncpassword`

1. Launch Android Studio via command line

   ```bash
   studio.sh
   ```


### Credit

- More configurations and options can be found from [docker-headless-vnc-container](https://github.com/ConSol/docker-headless-vnc-container)
