#!/bin/sh

# This script adds in liquid's ICS RIL after a fresh compile of CM9
# Must be run from croot (android) as '. device/htc/mecha/liquid_telephony.sh'

cd out/target/product/mecha

rm cm*
rm system.img
apktool d system/framework/framework.jar framework.jar.out/
rm -r framework.jar.out/smali/android/telephony/
rm -r framework.jar.out/smali/com/android/internal/telephony/
tar -xvzf ../../../../vendor/htc/mecha-radio/liquid_telephony_smali.tar.gz -C framework.jar.out/
apktool b framework.jar.out/

rm system/framework/framework.jar
mv framework.jar.out/dist/framework.jar system/framework/

rm -r framework.jar.out/

croot
mka bacon
