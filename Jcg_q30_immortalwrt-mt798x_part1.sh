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
#wget -O target/linux/ipq807x/image/generic.mk https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/generic.mk

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo 'src-git routing https://github.com/coolsnowwolf/routing' >>feeds.conf.default
#echo 'src-git telephony https://git.openwrt.org/feed/telephony.git' >>feeds.conf.default

git clone https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-passwall
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/openwrt-passwall-packages
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone -b dev https://github.com/vernesong/OpenClash.git --depth=1 package/openclash
./scripts/feeds update -a
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-openclash
rm -rf feeds/packages/devel/gn
git clone https://github.com/takayukileung/rust.git feeds/packages/lang/rust
rm -rf feeds/packages/net/{brook,chinadns-ng,dns2*,hysteria,ipt2socks,microsocks,naiveproxy,pdnsd-alt,shadowsocks-rust,shadowsocksr-libev,simple-obfs,tcping,trojan*,tuic-client,v2ray-*,xray*,mosdns}
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
./scripts/feeds install -a


