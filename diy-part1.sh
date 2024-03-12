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
#sed -i 's/#src-git helloworld/src-git helloworld/g' feeds.conf.default
#sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

sed -i '1i src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-mosdns && rm -rf feeds/packages/net/{alist,adguardhome,smartdns}
rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd-alt,miniupnpd-iptables,wireless-regdb}
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
rm -rf feeds/smpackage/luci-app-passwall
git clone -b luci-smartdns-dev --single-branch https://github.com/xiaorouji/openwrt-passwall package/openwrt-passwall

# 修改ath11k-firmware
#wget -O package/firmware/ath11k-firmware/Makefile https://raw.githubusercontent.com/robimarko/openwrt/ipq807x-5.15/package/firmware/ath11k-firmware/Makefile
# 添加xiaomi系列
#sed -i '/nbg7815/d' package/firmware/ipq-wifi/Makefile

#rm -rf package/firmware/ipq-wifi/board-zyxel_nbg7815.ipq8074

#sed -i '/nbg7815/d' target/linux/ipq807x/base-files/etc/board.d/02_network

#sed -i '/nbg7815/d' target/linux/ipq807x/base-files/etc/hotplug.d/firmware/11-ath11k-caldata
#sed -i 's/xiaomi,ax9000|\\/xiaomi,ax9000)/g' target/linux/ipq807x/base-files/etc/hotplug.d/firmware/11-ath11k-caldata

#sed -i '/nbg7815/d' target/linux/ipq807x/base-files/lib/upgrade/platform.sh

#rm -rf target/linux/ipq807x/files-5.10/arch/arm64/boot/dts/qcom/ipq8074-nbg7815.dts

#rm -rf target/linux/ipq807x/files-5.15/arch/arm64/boot/dts/qcom/ipq8074-nbg7815.dts

#sed -i 's/-3,6 +3,13/-3,6 +3,12/g' target/linux/ipq807x/patches-5.10/900-arm64-dts-add-OpenWrt-DTS-files.patch
#sed -i '/nbg7815/d' target/linux/ipq807x/patches-5.10/900-arm64-dts-add-OpenWrt-DTS-files.patch

#sed -i 's/-4,6 +4,13/-4,6 +4,12/g' target/linux/ipq807x/patches-5.15/0900-arm64-dts-add-OpenWrt-DTS-files.patch
#sed -i '/nbg7815/d' target/linux/ipq807x/patches-5.15/0900-arm64-dts-add-OpenWrt-DTS-files.patch

#wget -O target/linux/ipq807x/image/generic.mk https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/generic.mk
# Ax3600 补丁
#wget -O package/kernel/ath10k-ct/patches/100-api_update.patch https://raw.githubusercontent.com/immortalwrt/immortalwrt/master/package/kernel/ath10k-ct/patches/100-api_update.patch
#wget -O package/kernel/ath10k-ct/patches/130-ath10k-read-qcom-coexist-support-as-a-u32.patch https://raw.githubusercontent.com/immortalwrt/immortalwrt/master/package/kernel/ath10k-ct/patches/130-ath10k-read-qcom-coexist-support-as-a-u32.patch
#wget -O package/kernel/ath10k-ct/patches/202-ath10k-use-tpt-trigger-by-default.patch https://raw.githubusercontent.com/immortalwrt/immortalwrt/master/package/kernel/ath10k-ct/patches/202-ath10k-use-tpt-trigger-by-default.patch
# Add a feed source
#echo 'src-git-full helloworld https://github.com/fw876/helloworld.git' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
