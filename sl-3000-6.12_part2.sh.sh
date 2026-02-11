#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.88.1/g' package/base-files/files/bin/config_generate
# Modify X86 Kernel 5.10
#sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.15/g' target/linux/ipq807x/Makefile
# Clear the login password
#sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings
# Modify frpc default setting
#sed -i 's/yourdomain.com/fpz.5150586.xyz/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#sed -i 's/1234567/LaputaShita~!/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#sed -i 's/80/57001/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#sed -i 's/443/57002/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#sed -i 's/'0/'1/g' feeds/packages/net/adguardhome/files/adguardhome.config

sed -i 's/8056c2e21c000001/9f77fc393e758059/g' feeds/packages/net/zerotier/files/etc/config/zerotier

#sed -i 's/ca-certificates/ca-bundle/g' feeds/packages/net/ddns-scripts_dnspod/Makefile

rm -rf feeds/packages/net/geoview
mkdir package/geoview
wget -O package/geoview/Makefile https://raw.githubusercontent.com/xiaorouji/openwrt-passwall-packages/refs/heads/main/geoview/Makefile

sed -i 's/202510050144/202512201334/g' feeds/packages/net/v2ray-geodata/Makefile
sed -i 's/c23ac8343e9796f8cc8b670c3aeb6df6d03d4e8914437a409961477f6b226098/6878dbacfb1fcb1ee022f63ed6934bcefc95a3c4ba10c88f1131fb88dbf7c337/g' feeds/packages/net/v2ray-geodata/Makefile

sed -i 's/20250916122507/20251227135815/g' feeds/packages/net/v2ray-geodata/Makefile
sed -i 's/1a7dad0ceaaf1f6d12fef585576789699bd1c6ea014c887c04b94cb9609350e9/9033d9ff5e4f38cade0987a23059a6330ebfcce54a8cce24c19c0f80a4a33a9b/g' feeds/packages/net/v2ray-geodata/Makefile

sed -i 's/202510130040/202512220045/g' feeds/packages/net/v2ray-geodata/Makefile
sed -i 's/ddbdbfcc33e8eb6f235f7542cd71d291a9002387b8b858286e913d35e2d9aa02/b10fd8c8f0e74da1e415c020747dabc1881b0b82cdac4a30776b68dbe2c573f1/g' feeds/packages/net/v2ray-geodata/Makefile

#sed -i '/\/etc\/init\.d\/tailscale/d;/\/etc\/config\/tailscale/d;' feeds/packages/net/tailscale/Makefile
#git clone https://github.com/asvow/luci-app-tailscale.git package/luci-app-tailscale
git clone https://github.com/Tokisaki-Galaxy/luci-app-tailscale-community.git package/luci-app-tailscale-community

#rm -rf feeds/packages/net/mosdns
#rm -rf feeds/packages/net/v2ray-geodata
#git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
#git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic

git clone https://github.com/gdy666/luci-app-lucky.git package/lucky

#rm -rf feeds/luci/applications/luci-app-socat
#wget -O feeds/packages/net/socat/Makefile https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/socat_Makefile
#git clone https://github.com/WROIATE/luci-app-socat.git package/luci-app-socat

#修正连接数（by ベ七秒鱼ベ）
#sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

wget -O package/boot/uboot-envtools/files/mediatek_filogic https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/6.12/mediatek_filogic
wget -O ‎package/mtk/applications/mtk-smp/files/smp.sh https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/6.12/smp.sh
wget -O target/linux/mediatek/dts/mt7981b-sl-3000-emmc.dts https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/6.12/mt7981b-sl-3000-emmc.dts
wget -O target/linux/mediatek/dts/mt7981b-jcg-q30-pro.dts https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/6.12/mt7981b-jcg-q30-pro.dts
wget -O target/linux/mediatek/filogic/base-files/etc/board.d/02_network‎ https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/6.12/02_network
wget -O ‎target/linux/mediatek/filogic/base-files/etc/hotplug.d/firmware/11-mt76-caldata https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/6.12/11-mt76-caldata‎
wget -O ‎target/linux/mediatek/filogic/base-files/etc/hotplug.d/ieee80211/11_fix_wifi_mac https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/6.12/11_fix_wifi_mac
wget -O target/linux/mediatek/filogic/base-files/lib/upgrade/platform.sh‎ https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/6.12/platform.sh
wget -O ‎target/linux/mediatek/image/filogic.mk https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/6.12/filogic.mk

#添加 集客AC
#git clone https://github.com/lwb1978/openwrt-gecoosac package/openwrt-gecoosac

# update frp to 0.53.2
#sed -i 's/0.51.3/0.53.2/g' feeds/packages/net/frp/Makefile
#sed -i 's/83032399773901348c660d41c967530e794ab58172ccd070db89d5e50d915fef/ff2a4f04e7732bc77730304e48f97fdd062be2b142ae34c518ab9b9d7a3b32ec/g' feeds/packages/net/frp/Makefile

# revert chinadns-ng to 2023.04.20
#sed -i 's/2023.06.01/2023.04.20/g' feeds/packages/net/chinadns-ng/Makefile
#sed -i 's/7c33e8a60b7618b33fce0960b94b46567766a051b307cea6b123da4176a52eab/e1f5197ecd96ebab4440fe069e0a06935df7ea07ac1ad0bab3f88bffe0055294/g' feeds/packages/net/chinadns-ng/Makefile

# 重新添加 luci-app-homeproxy dev版
rm -rf feeds/luci/applications/luci-app-homeproxy
git clone -b dev https://github.com/immortalwrt/homeproxy.git package/luci-app-homeproxy

# 重新添加 luci-app-openclash
rm -rf feeds/luci/applications/luci-app-openclash
git clone --filter=blob:none --branch=dev https://github.com/vernesong/OpenClash.git package/luci-app-openclash
#sed -i 's/PKG_RELEASE:=beta/PKG_RELEASE:=/g' package/luci-app-openclash/luci-app-openclash/Makefile

# 重新添加 luci-app-passwall
rm -rf feeds/luci/applications/luci-app-passwall
git clone https://github.com/Openwrt-Passwall/openwrt-passwall package/passwall-luci

git clone https://github.com/fcshark-org/openwrt-fchomo.git package/openwrt-fchomo

# 添加 luci-theme-alpha-reborn 主题
git clone https://github.com/derisamedia/luci-theme-alpha-reborn.git package/luci-theme-alpha-reborn

# 重新添加 luci-app-wechatpush
#rm -rf feeds/luci/applications/luci-app-wechatpush
#git clone https://github.com/tty228/luci-app-wechatpush.git package/luci-app-wechatpush

# 添加 OpenWrt-nikki
git clone https://github.com/nikkinikki-org/OpenWrt-nikki.git package/OpenWrt-nikki

# 添加 luci-app-taskplan
git clone https://github.com/sirpdboy/luci-app-taskplan.git package/luci-app-taskplan

# 添加 smartdns
#git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# 添加 adguardhome
#git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

#git clone https://github.com/derisamedia/luci-theme-alpha.git package/luci-theme-alpha

echo 'refresh feeds'
./scripts/feeds update -a
./scripts/feeds install -a
