#!/bin/bash

# for samba 4.13.3 

# 默认使用r10e版本，不跟ANDROID_NDK冲突使用NDKROOT
export NDKROOT="/opt/android/android-ndk-r10e"
export PATH=$PATH:$NDKROOT

# for  Parse::Yapp::Driver module not found
# sudo apt install libparse-yapp-perl

#export HOST_TAG=windows-x86_64 # adjust to your building host
#export HOST_TAG=darwin-x86_64
export HOST_TAG=linux-x86_64
export TOOLCHAIN=$NDKROOT/toolchains/llvm-3.6/prebuilt/$HOST_TAG


# Set this to your minSdkVersion.
export API=14

#export TARGET=aarch64-linux-android
export TARGET=armv7a-linux-androideabi
#export TARGET=i686-linux-android
#export TARGET=x86_64-linux-android

export AR=$TOOLCHAIN/bin/llvm-ar
export AS=$TOOLCHAIN/bin/llvm-as
export CC=$TOOLCHAIN/bin/clang
export CXX=$TOOLCHAIN/bin/clang++
export LD=$TOOLCHAIN/bin/llvm-ld
export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
export STRIP=$TOOLCHAIN/bin/ndk-strip



function build_armeabi-v7a
{
  CC=$CC waf configure \
  --prefix=~/deps/android/armeabi-v7a \
  --without-ad-dc \
  --cross-compile --cross-answers=arm.txt

  make clean
  make -j 4
  make install
}

build_armeabi-v7a
echo build_armeabi-v7a finished