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

#sed -i '1i src-git small https://github.com/kenzok8/small' feeds.conf.default
./scripts/feeds update -a
git clone -b v5 https://github.com/sbwml/luci-app-mosdns.git package/mosdns
#git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
rm -rf feeds/packages/net/mosdns

sed -i 's/20220816/20220823/g' feeds/luci/applications/luci-app-socat/Makefile
wget -O feeds/luci/applications/luci-app-socat/root/etc/uci-defaults/luci-app-socat https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/socat_apk

#rm -rf feeds/packages/net/v2ray-geodata
#wget -O test1.sh https://raw.githubusercontent.com/takayukileung/JB/main/v2ray-geodata_update.sh
#wget -O feeds/packages/net/chinadns-ng/Makefile https://raw.githubusercontent.com/kenzok8/small/master/chinadns-ng/Makefile
#chmod 777 test1.sh
#./test1.sh
#rm -rf feeds/packages/lang/golang
#rm -rf feeds/luci/applications/luci-app-passwall
#rm -rf feeds/luci/applications/luci-app-openclash
#git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
#rm -f ./test1.sh
./scripts/feeds install -a

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo 'src-git routing https://github.com/coolsnowwolf/routing' >>feeds.conf.default
#echo 'src-git telephony https://git.openwrt.org/feed/telephony.git' >>feeds.conf.default
