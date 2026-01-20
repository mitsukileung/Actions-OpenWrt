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

sed -i 's/8056c2e21c000001/9f77fc393e758059/g' feeds/packages/net/zerotier/files/etc/config/zerotier

rm -rf feeds/packages/net/geoview
mkdir package/geoview
wget -O package/geoview/Makefile https://raw.githubusercontent.com/xiaorouji/openwrt-passwall-packages/refs/heads/main/geoview/Makefile

sed -i 's/202504050136/202504050136/g' feeds/packages/net/v2ray-geodata/Makefile
sed -i 's/735786c00694313090c5d525516463836167422b132ce293873443613b496e92/735786c00694313090c5d525516463836167422b132ce293873443613b496e92/g' feeds/packages/net/v2ray-geodata/Makefile

sed -i 's/20250407044718/20250422055726/g' feeds/packages/net/v2ray-geodata/Makefile
sed -i 's/a35d248bdf7892fbf747d94e656e45339c1d90c6b656b5c1311d62c1f2cbaadf/7a4530370eff2db6265613d9066c2b5eee841e3e7f02288750b03128af6daf7b/g' feeds/packages/net/v2ray-geodata/Makefile

sed -i 's/202504070038/202504210040/g' feeds/packages/net/v2ray-geodata/Makefile
sed -i 's/ea5ed940fee6d7c872a143d160486e5d576124fc5167dfc6a8d55708281276ec/2d10e5a69771bc7daf612ce31e9dfc2dfd7ea6caa9caecfd88918da0ebd9cba7/g' feeds/packages/net/v2ray-geodata/Makefile

#rm -rf feeds/packages/net/mosdns
#rm -rf feeds/packages/net/v2ray-geodata
#git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
#git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

git clone https://github.com/gdy666/luci-app-lucky.git package/lucky

git clone https://github.com/Tokisaki-Galaxy/luci-app-tailscale-community.git package/luci-app-tailscale-community

#修正连接数（by ベ七秒鱼ベ）
#sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# 重新添加 luci-theme-argon
#rm -rf feeds/luci/themes/luci-theme-argon
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#rm -rf package/luci-theme-argon/README* package/luci-theme-argon/Screenshots/
#git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

git clone https://github.com/derisamedia/luci-theme-alpha-reborn.git package/luci-theme-alpha-reborn
sed -i 's/-beta/_beta/g' package/luci-theme-alpha-reborn/Makefile

# 重新添加 luci-app-homeproxy dev版
rm -rf feeds/luci/applications/luci-app-homeproxy
git clone -b dev https://github.com/immortalwrt/homeproxy.git package/luci-app-homeproxy

# 重新添加 luci-app-openclash
rm -rf feeds/luci/applications/luci-app-openclash
git clone --filter=blob:none --branch=dev https://github.com/vernesong/OpenClash.git package/luci-app-openclash

# 重新添加 luci-app-passwall
rm -rf feeds/luci/applications/luci-app-passwall
git clone https://github.com/Openwrt-Passwall/openwrt-passwall package/passwall-luci

# 重新添加 luci-app-socat 同时兼容firewall3/4 
#rm -rf feeds/luci/applications/luci-app-socat
#git clone https://github.com/chenmozhijin/luci-app-socat.git package/luci-app-socat

# 重新添加 luci-app-wechatpush
#rm -rf feeds/luci/applications/luci-app-wechatpush
#git clone https://github.com/tty228/luci-app-wechatpush.git package/luci-app-wechatpush

# 添加 OpenWrt-nikki
git clone https://github.com/nikkinikki-org/OpenWrt-nikki.git package/OpenWrt-nikki

# 添加 smartdns
#git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# 添加 adguardhome
#git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

#git clone https://github.com/derisamedia/luci-theme-alpha.git package/luci-theme-alpha

echo 'refresh feeds'
./scripts/feeds update -a
./scripts/feeds install -a
