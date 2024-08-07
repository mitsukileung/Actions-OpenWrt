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
#Modify Wifi default setting
wget -O package/network/config/wifi-scripts/files/lib/wifi/mac80211.uc https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/mac80211.uc
#sed -i 's/OpenWrt/ipenWrt/g' package/network/config/wifi-scripts/files/lib/wifi/mac80211.uc
# Modify frpc default setting
#sed -i 's/yourdomain.com/fpz.5150586.xyz/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#sed -i 's/1234567/LaputaShita~!/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#sed -i 's/80/57001/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#sed -i 's/443/57002/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp

sed -i 's/8056c2e21c000001/9f77fc393e758059/g' feeds/packages/net/zerotier/files/etc/config/zerotier

git clone https://github.com/takayukileung/other.git
cp -r other/ddns-scripts_dnspod feeds/packages/net/ddns-scripts_dnspod
cp -r other/ddns-scripts_aliyun feeds/packages/net/ddns-scripts_aliyun
cp -r other/luci-app-zerotier package/new/luci-app-zerotier
wget -O feeds/packages/net/zerotier/Makefile https://raw.githubusercontent.com/immortalwrt/packages/master/net/zerotier/Makefile
rm -rf other

rm -rf feeds/luci/modules/luci-base
rm -rf feeds/luci/modules/luci-mod-status
rm -rf feeds/packages/utils/coremark
rm -rf feeds/packages/net/v2ray-geodata
rm -rf package/new/v2ray-geodata
git clone https://github.com/immortalwrt/luci.git backup_luci
cp -rf backup_luci/modules/luci-base feeds/luci/modules/luci-base
cp -rf backup_luci/modules/luci-mod-status feeds/luci/modules/luci-mod-status
rm -rf backup_luci

cp -rf luci feed mod/wireless.js feeds/luci/modules/luci-mod-network/htdocs/luci-static/resources/view/network/wireless.js
cp -rf luci feed mod/10_system.js feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js
cp -rf luci feed mod/luci-mod-status.json feeds/luci/modules/luci-mod-status/root/usr/share/rpcd/acl.d/luci-mod-status.json
cp -rf luci feed mod/system.js feeds/luci/modules/luci-mod-system/htdocs/luci-static/resources/view/system/system.js

#rm -rf feeds/packages/net/mosdns
#rm -rf feeds/packages/net/v2ray-geodata
#git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
#git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

#sed -i 's/1.68.2/1.70.0/g' feeds/packages/net/tailscale/Makefile
#sed -i 's/9d34bd153c485dd0d88d3d76f187b5032046c0807a411ca97f38c8039a9ac659/8429728708f9694534489daa0a30af58be67f25742597940e7613793275c738f/g' feeds/packages/net/tailscale/Makefile

#rm -f feeds/packages/net/socat/patches/100-usleep.patch
#sed -i 's/1.7.4.4/1.8.0.0/g' feeds/packages/net/socat/Makefile
#sed -i 's/fbd42bd2f0e54a3af6d01bdf15385384ab82dbc0e4f1a5e153b3e0be1b6380ac/e1de683dd22ee0e3a6c6bbff269abe18ab0c9d7eb650204f125155b9005faca7/g' feeds/packages/net/socat/Makefile

#zip -rP Jsz3895 files.zip files
#wget -O files.zip https://raw.githubusercontent.com/takayukileung/lede/master/tools/files.zip
#unzip -P Jsz3895 files.zip
#rm files.zip
#修正连接数（by ベ七秒鱼ベ）
#sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# 添加xiaomi
#wget -O target/linux/ipq807x/image/generic.mk https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/generic.mk

# update frp to 0.53.2
#sed -i 's/0.51.3/0.53.2/g' feeds/packages/net/frp/Makefile
#sed -i 's/83032399773901348c660d41c967530e794ab58172ccd070db89d5e50d915fef/ff2a4f04e7732bc77730304e48f97fdd062be2b142ae34c518ab9b9d7a3b32ec/g' feeds/packages/net/frp/Makefile

# revert chinadns-ng to 2023.04.20
#sed -i 's/2023.06.01/2023.04.20/g' feeds/packages/net/chinadns-ng/Makefile
#sed -i 's/7c33e8a60b7618b33fce0960b94b46567766a051b307cea6b123da4176a52eab/e1f5197ecd96ebab4440fe069e0a06935df7ea07ac1ad0bab3f88bffe0055294/g' feeds/packages/net/chinadns-ng/Makefile

# 重新添加 luci-theme-argon
#rm -rf feeds/luci/themes/luci-theme-argon
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#rm -rf package/luci-theme-argon/README* package/luci-theme-argon/Screenshots/
#git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# 重新添加 luci-app-homeproxy dev版
rm -rf feeds/luci/applications/luci-app-homeproxy
git clone -b dev https://github.com/immortalwrt/homeproxy.git package/luci-app-homeproxy

# 重新添加 luci-app-openclash
#rm -rf feeds/luci/applications/luci-app-openclash
git clone --filter=blob:none --branch=dev https://github.com/vernesong/OpenClash.git package/luci-app-openclash

# 重新添加 luci-app-passwall
#rm -rf feeds/luci/applications/luci-app-passwall
#git clone https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall

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
rm -rf ./tmp
./scripts/feeds update -a
./scripts/feeds install -a
