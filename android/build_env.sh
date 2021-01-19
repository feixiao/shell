#!/bin/bash

# https://developer.android.com/ndk/guides/other_build_systems

# 默认使用r10e版本，不跟ANDROID_NDK冲突使用NDKROOT
export NDKROOT="/opt/android/android-ndk-r10e"
export PATH=$PATH:$NDKROOT


export TOOLCHAIN=$NDKROOT/toolchains/llvm3.6/prebuilt/darwin-x86_64
#export TOOLCHAIN=$NDKROOT/toolchains/llvm/prebuilt/linux-x86_64


#export TARGET=aarch64-linux-android
export TARGET=armv7a-linux-androideabi
#export TARGET=i686-linux-android
#export TARGET=x86_64-linux-android

# Set this to your minSdkVersion.
export API=14

export AR=$TOOLCHAIN/bin/$TARGET-ar
export AS=$TOOLCHAIN/bin/$TARGET-as
export CC=$TOOLCHAIN/bin/$TARGET$API-clang
export CXX=$TOOLCHAIN/bin/$TARGET$API-clang++
export LD=$TOOLCHAIN/bin/$TARGET-ld
export RANLIB=$TOOLCHAIN/bin/$TARGET-ranlib
export STRIP=$TOOLCHAIN/bin/$TARGET-strip

#./configure --host $TARGET
#make
