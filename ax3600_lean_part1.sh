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

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 修改ath11k-firmware
#wget -O package/firmware/ath11k-firmware/Makefile https://raw.githubusercontent.com/robimarko/openwrt/ipq807x-5.15/package/firmware/ath11k-firmware/Makefile
# 添加xiaomi系列
wget -O target/linux/ipq807x/image/generic.mk https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/generic.mk
# Ax3600 补丁
wget -O package/kernel/ath10k-ct/patches/100-api_update.patch https://raw.githubusercontent.com/immortalwrt/immortalwrt/master/package/kernel/ath10k-ct/patches/100-api_update.patch
wget -O package/kernel/ath10k-ct/patches/130-ath10k-read-qcom-coexist-support-as-a-u32.patch https://raw.githubusercontent.com/immortalwrt/immortalwrt/master/package/kernel/ath10k-ct/patches/130-ath10k-read-qcom-coexist-support-as-a-u32.patch
wget -O package/kernel/ath10k-ct/patches/202-ath10k-use-tpt-trigger-by-default.patch https://raw.githubusercontent.com/immortalwrt/immortalwrt/master/package/kernel/ath10k-ct/patches/202-ath10k-use-tpt-trigger-by-default.patch
# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
