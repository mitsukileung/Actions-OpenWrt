#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
TAB=$'\t'
cat >> target/linux/qualcommax/image/ipq807x.mk << EOF

define Device/redmi_ax6
${TAB}\$(call Device/xiaomi_ax3600)
${TAB}DEVICE_VENDOR := Redmi
${TAB}DEVICE_MODEL := AX6
${TAB}DEVICE_PACKAGES := ipq-wifi-redmi_ax6 uboot-envtools
endef
TARGET_DEVICES += redmi_ax6

define Device/xiaomi_ax3600
${TAB}\$(call Device/FitImage)
${TAB}\$(call Device/UbiFit)
${TAB}DEVICE_VENDOR := Xiaomi
${TAB}DEVICE_MODEL := AX3600
${TAB}BLOCKSIZE := 128k
${TAB}PAGESIZE := 2048
${TAB}DEVICE_DTS_CONFIG := config@ac04
${TAB}SOC := ipq8071
${TAB}DEVICE_PACKAGES := ath10k-firmware-qca9887-ct ipq-wifi-xiaomi_ax3600 \\
${TAB}kmod-ath10k-ct uboot-envtools
endef
TARGET_DEVICES += xiaomi_ax3600
EOF

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 修改ath11k-firmware
#wget -O package/firmware/ath11k-firmware/Makefile https://raw.githubusercontent.com/robimarko/openwrt/ipq807x-5.15/package/firmware/ath11k-firmware/Makefile
# 添加xiaomi系列
#wget -O target/linux/ipq807x/image/generic.mk https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/generic.mk
# Add a feed source
echo 'src-git-full helloworld https://github.com/fw876/helloworld.git;main' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
