#!/bin/bash
sed -i '/nbg7815/d' package/firmware/ipq-wifi/Makefile

rm -rf package/firmware/ipq-wifi/board-zyxel_nbg7815.ipq8074

sed -i '/nbg7815/d' target/linux/ipq807x/base-files/etc/board.d/02_network

sed -i '/nbg7815/d' target/linux/ipq807x/base-files/etc/hotplug.d/firmware/11-ath11k-caldata
sed -i 's/xiaomi,ax9000|\\/xiaomi,ax9000)/g' target/linux/ipq807x/base-files/etc/hotplug.d/firmware/11-ath11k-caldata

sed -i '/nbg7815/d' target/linux/ipq807x/base-files/lib/upgrade/platform.sh

rm -rf target/linux/ipq807x/files-5.10/arch/arm64/boot/dts/qcom/ipq8074-nbg7815.dts

rm -rf target/linux/ipq807x/files-5.15/arch/arm64/boot/dts/qcom/ipq8074-nbg7815.dts

sed -i 's/-3,6 +3,13/-3,6 +3,12/g' target/linux/ipq807x/patches-5.10/900-arm64-dts-add-OpenWrt-DTS-files.patch
sed -i '/nbg7815/d' target/linux/ipq807x/patches-5.10/900-arm64-dts-add-OpenWrt-DTS-files.patch

sed -i 's/-4,6 +4,13/-4,6 +4,12/g' target/linux/ipq807x/patches-5.15/0900-arm64-dts-add-OpenWrt-DTS-files.patch
sed -i '/nbg7815/d' target/linux/ipq807x/patches-5.15/0900-arm64-dts-add-OpenWrt-DTS-files.patch

wget -O target/linux/ipq807x/image/generic.mk https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/generic.mk
