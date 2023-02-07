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
# update golang to 1.19.5
sed -i 's/GO_VERSION_PATCH:=4/GO_VERSION_PATCH:=5/g' feeds/packages/lang/golang/golang/Makefile
sed -i 's/eda74db4ac494800a3e66ee784e495bfbb9b8e535df924a8b01b1a8028b7f368/8e486e8e85a281fc5ce3f0bedc5b9d2dbf6276d7db0b25d3ec034f313da0375f/g' feeds/packages/lang/golang/golang/Makefile
rm -rf feeds/packages/lang/golang/golang/patches/010-cmd-compile-turn-off-jump-tables-when-spectre-retpolines-.patch
# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
