# Android Studio in Docker via VNC

![screenshot](https://user-images.githubusercontent.com/468515/33925524-0b38012c-df8f-11e7-950a-8b3cfaf495fc.png)


### Prerequisites

- Make sure you have `KVM` installed properly in the host ([KVM installation for Ubuntu](https://help.ubuntu.com/community/KVM/Installation))
- The current user `$USER` have enough permission to access `/dev/kvm`

### Usage

1. Create folder for android-studio and all the correlated folders

   ```bash
   mkdir $HOME/android
   ```

2. Download Android Studio and unzip the archive

   ```bash
   unzip android-studio-ide-XXX-linux.zip -d $HOME/android
   ```

3. Start VNC server

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

4. Connect via VNC viewer

   `[HOST_IP]:5901`, default password: `vncpassword`

5. Launch Android Studio via command line

   ```bash
   studio.sh
   ```
