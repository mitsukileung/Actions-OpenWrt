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
#wget -O target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ipq8072-ax9000.dts https://raw.githubusercontent.com/immortalwrt/immortalwrt/master/target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ipq8072-ax9000.dts

# Add a feed source
#echo 'src-git-full helloworld https://github.com/fw876/helloworld.git;master' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/{alist,adguardhome,xray*,v2ray*,v2ray*,sing*,smartdns}

wget -O feeds/small/sing-box/Makefile https://raw.githubusercontent.com/immortalwrt/packages/master/net/sing-box/Makefile
sed -i 's/..\/..\/lang\/golang\/golang-package.mk/$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang-package.mk/g' feeds/small/sing-box/Makefile
wget -O feeds/small/sing-box/files/sing-box.init https://raw.githubusercontent.com/immortalwrt/packages/master/net/sing-box/files/sing-box.init
wget -O feeds/small/sing-box/files/sing-box.conf https://raw.githubusercontent.com/immortalwrt/packages/master/net/sing-box/files/sing-box.conf
rm -f feeds/small/sing-box/files/config.json.example
#rm -rf feeds/packages/lang/golang
#git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
./scripts/feeds install -a 
