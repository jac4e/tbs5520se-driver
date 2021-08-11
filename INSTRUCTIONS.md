# Instructions

1. Install required dependecies

   ```
   sudo apt install git patchutils libproc-processtable-perl
   ```

2. Install kernel headers
   - Kernel headers for 5.4.51-v7l+

    ```
    wget https://archive.raspberrypi.org/debian/pool/main/r/raspberrypi-firmware/raspberrypi-kernel-headers_1.20200819-1_armhf.deb
    sudo apt install -f ~/raspberrypi-kernel-headers_1.20200819-1_armhf.deb
    ```

   - Kernel headers for 5.10.52-v7l+ (Latest)

    ```
    sudo apt install raspberry-kernel-headers
    ```

3. Download the media_build repository

   ```
   git clone --depth=1 --single-branch https://github.com/tbsdtv/media_build.git
   ```

4. Run the build script to generate the Makefiles

   ```
   cd media_build/
   ./build
   ```

   NOTE: Cancel the build script when the following line is printed to the console

   ```
   make[2]: Entering directory '/usr/src/linux-headers-5.4.51-v7l+
   ```

5. Apply the Makefile patches

    ```
    cd ..
    patch -u media_build/v4l/Makefile -i Makefile.patch
    patch -u media_build/v4l/Makefile.media -i Makefile.media.patch
    ```

6. Run the build script, letting it complete this time

    ```
    cd media_build/
    ./build
    ```

7. If the build process finished successfully install the drivers.

    ```
    sudo make install
    ```

8. Finally, install the firmware and reboot

    ```
    wget http://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v1.0.tar.bz2
    sudo tar jxvf tbs-tuner-firmwares_v1.0.tar.bz2 -C /lib/firmware/
    sudo reboot
    ```