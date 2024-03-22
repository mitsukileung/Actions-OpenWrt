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

sed -i 's/8056c2e21c000001/439bdec6f23e97d9/g' feeds/packages/net/zerotier/files/etc/config/zerotier

rm -rf feeds/packages/net/mosdns
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns

#rm -rf feeds/packages/net/v2ray-geodata
#git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

git clone https://github.com/mitsukileung/luci-app-openvpn-server.git feeds/luci/applications/luci-app-openvpn-server

#sed -i 's/949feec1da2bc9d43b6c766c1dfb6f71f737a221e5ce4220616a3900dfb40c82/949feec1da2bc9d43b6c766c1dfb6f71.8.0a221e5ce4220616a3900dfb40c82/g' feeds/packages/net/sing-box/Makefile

#sed -i 's/1.7.7/1.8.0/g' feeds/packages/net/sing-box/Makefile
#sed -i 's/ce182cb2181e898b56ca9b6ce0d5adeaece8e761ac62ce8cde69b3c7219b8430/80ae2a860fc77d961c578999e5fcfe964f969c81d9ccac156b2fef1340eca12f/g' feeds/packages/net/sing-box/Makefile

#sed -i 's/1.8.6/1.8.7/g' feeds/packages/net/xray-core/Makefile
#sed -i 's/d828296c9f29f9e59a61ab73d44f072ab2a30fe979679e39aea43b33ddb7d6bf/e8f46177d792b89700f164ca28fbf1a3c7d95a3ecf98871cb0dd5e474b46a859/g' feeds/packages/net/xray-core/Makefile

#sed -i 's/1.8.4/1.8.7/g' feeds/packages/net/xray-plugin/Makefile
#sed -i 's/7154310f1108bb8538327f35696cbce1ca22feb1e7d26922a8a359ccab68d952/6ee5ed3a6bbecc41dba99a107849de00e2e72d99fdea4f9af8ea95783cb38528/g' feeds/packages/net/xray-plugin/Makefile

#sed -i 's/1.2.10/1.2.9/g' feeds/packages/sound/alsa-utils/Makefile
#sed -i 's/104b62ec7f02a7ce16ca779f4815616df1cc21933503783a9107b5944f83063a/e7623d4525595f92e11ce25ee9a97f2040a14c6e4dcd027aa96e06cbce7817bd/g' feeds/packages/sound/alsa-utils/Makefile

#sed -i 's/1.2.10/1.2.9/g' feeds/packages/libs/alsa-ucm-conf/Makefile
#sed -i 's/9c21e3f01ff00baa758df17e867cd36e24ebb41a6bec49737e99105e16f2ae97/374f6833bfd77d0a4675e4aa2bfb79defe850e5a46a5d4542a45962f4b9e272a/g' feeds/packages/libs/alsa-ucm-conf/Makefile

#sed -i 's/1.2.10/1.2.9/g' feeds/packages/libs/alsa-lib/Makefile
#sed -i 's/c86a45a846331b1b0aa6e6be100be2a7aef92efd405cf6bac7eef8174baa920e/dc9c643fdc4ccfd0572cc685858dd41e08afb583f30460b317e4188275f615b2/g' feeds/packages/libs/alsa-lib/Makefile
#rm -rf feeds/packages/libs/alsa-lib/patches/010-global-h-move-STRING-macro-outside-PIC-ifdef-block.patch

#zip -rP Jsz3895 files.zip files
#wget -O files.zip https://raw.githubusercontent.com/takayukileung/lede/master/tools/files.zip
#unzip -P Jsz3895 files.zip
#rm files.zip
#修正连接数（by ベ七秒鱼ベ）
#sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# 添加xiaomi
#wget -O target/linux/ipq807x/image/generic.mk https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/generic.mk

# update frp to 0.50.0
#sed -i 's/0.49.0/0.50.0/g' feeds/packages/net/frp/Makefile
#sed -i 's/8ff92d4f763d596bee35efe17f0729d36e584b93c49a7671cebde4bb318b458f/e33b5c88246acee63e098114acd0f10dddbbfe7095ada854b814f86869221f8e/g' feeds/packages/net/frp/Makefile

# revert chinadns-ng to 2023.04.20
#sed -i 's/2023.06.01/2023.04.20/g' feeds/packages/net/chinadns-ng/Makefile
#sed -i 's/7c33e8a60b7618b33fce0960b94b46567766a051b307cea6b123da4176a52eab/e1f5197ecd96ebab4440fe069e0a06935df7ea07ac1ad0bab3f88bffe0055294/g' feeds/packages/net/chinadns-ng/Makefile

# 重新添加 luci-theme-argon
#rm -rf feeds/luci/themes/luci-theme-argon
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#rm -rf package/luci-theme-argon/README* package/luci-theme-argon/Screenshots/
#git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# 重新添加 luci-app-homeproxy dev版
rm -rf /feeds/luci/applications/luci-app-homeproxy
git clone -b dev https://github.com/immortalwrt/homeproxy.git package/luci-app-homeproxy

# 重新添加 luci-app-openclash
rm -rf feeds/luci/applications/luci-app-openclash
git clone -b dev https://github.com/vernesong/OpenClash.git --depth=1 package/luci-app-openclash

# 重新添加 luci-app-passwall
rm -rf feeds/luci/applications/luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall

# 重新添加 luci-app-socat 同时兼容firewall3/4 
rm -rf feeds/luci/applications/luci-app-socat
git clone https://github.com/chenmozhijin/luci-app-socat.git package/luci-app-socat

# 重新添加 luci-app-wechatpush
#rm -rf feeds/luci/applications/luci-app-wechatpush
#git clone https://github.com/tty228/luci-app-wechatpush.git package/luci-app-wechatpush

# 添加 OpenAppFilter
#git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

# 添加 smartdns
#git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# 添加 adguardhome
#git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

#git clone https://github.com/derisamedia/luci-theme-alpha.git package/luci-theme-alpha

echo 'refresh feeds'
./scripts/feeds update -a
./scripts/feeds install -a
