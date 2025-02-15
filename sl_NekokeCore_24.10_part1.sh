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
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
rm -rf feeds/packages/net/mosdns
rm -rf feeds/packages/net/v2ray-geodata
#wget -O test1.sh https://raw.githubusercontent.com/takayukileung/JB/main/v2ray-geodata_update.sh
#wget -O feeds/packages/net/chinadns-ng/Makefile https://raw.githubusercontent.com/kenzok8/small/master/chinadns-ng/Makefile
#chmod 777 test1.sh
#./test1.sh
wget -O target/linux/generic/backport-5.4/498-mtd-spinor-Add-support-BY25Q256FS.patch https://raw.githubusercontent.com/takayukileung/sl3000-2410/refs/heads/main/sl3000/498-mtd-spinor-Add-support-BY25Q256FS.patch
wget -O target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-sl-3000.dts https://raw.githubusercontent.com/takayukileung/sl3000-2410/refs/heads/main/sl3000/mt7981-sl-3000.dts
wget -O target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-sl-3000-emmc.dts https://raw.githubusercontent.com/takayukileung/sl3000-2410/refs/heads/main/sl3000/mt7981-sl-3000-emmc.dts
wget -O target/linux/mediatek/mt7981/base-files/etc/board.d/02_network https://raw.githubusercontent.com/takayukileung/sl3000-2410/refs/heads/main/sl3000/02_network
wget -O target/linux/mediatek/mt7981/base-files/lib/upgrade/platform.sh https://raw.githubusercontent.com/takayukileung/sl3000-2410/refs/heads/main/sl3000/platform.sh
#wget -O package/boot/uboot-envtools/files/mediatek_filogic https://raw.githubusercontent.com/takayukileung/sl3000-2410/refs/heads/main/sl3000/mediatek_filogic
wget -O package/mtk/applications/mtk-smp/files/smp.sh https://raw.githubusercontent.com/takayukileung/sl3000-2410/refs/heads/main/sl3000/smp.sh
wget -O target/linux/mediatek/image/mt7981.mk https://raw.githubusercontent.com/takayukileung/sl3000-2410/refs/heads/main/sl3000/mt7981.mk
wget -O defconfig/mt7981-ax3000.config https://raw.githubusercontent.com/takayukileung/sl3000-2410/refs/heads/main/sl3000/mt7981-ax3000.config
wget -O target/linux/mediatek/mt7981/base-files/lib/preinit/90_extract_caldata https://raw.githubusercontent.com/takayukileung/sl3000-2410/refs/heads/main/sl3000/90_extract_caldata

wget -O package/boot/uboot-envtools/files/mediatek_filogic https://raw.githubusercontent.com/takayukileung/sl3000-2410/refs/heads/main/sl3000/mediatek_filogic-mod

rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-openclash
#rm -rf feeds/packages/lang/golang
#git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
#rm -f ./test1.sh
./scripts/feeds install -a

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo 'src-git routing https://github.com/coolsnowwolf/routing' >>feeds.conf.default
#echo 'src-git telephony https://git.openwrt.org/feed/telephony.git' >>feeds.conf.default
