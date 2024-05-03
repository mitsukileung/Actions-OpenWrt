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

sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/{alist,adguardhome,xray*,v2ray*,v2ray*,sing*,smartdns}
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
rm -f feeds/packages/net/zerotier/patches/0001-fix-miniupnpc-natpmp-include-paths.patch
rm -f feeds/packages/net/zerotier/patches/0002-remove-PIE-options.patch
sed -i 's/8056c2e21c000001/9f77fc393e758059/g' feeds/packages/net/zerotier/files/etc/config/zerotier
sed -i 's/1.12.2/1.14.0/g' feeds/packages/net/zerotier/Makefile
sed -i 's/7c6512cfc208374ea9dc9931110e35f71800c34890e0f35991ea485aae66e31c/7191623a81b0d1b552b9431e8864dd3420783ee518394ac1376cee6aaf033291/g' feeds/packages/net/zerotier/Makefile
./scripts/feeds install -a 

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
