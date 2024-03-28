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
sed -i 's/192.168.1.1/192.168.98.1/g' package/base-files/files/bin/config_generate
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

#rm -rf feeds/packages/net/tailscale/patches
sed -i 's/1.32.3/1.62.1/g' feeds/packages/net/tailscale/Makefile
sed -i 's/4cf88a1d754240ce71b29d3a65ca480091ad9c614ac99c541cef6fdaf0585dd4/22737fae37e971fecdf49d6b741b99988868aa3f1e683e67e14b872a2c49ca1c/g' feeds/packages/net/tailscale/Makefile

#zip -rP Jsz3895 files.zip files
#wget -O files.zip https://raw.githubusercontent.com/takayukileung/immortalwrt-mt798x/openwrt-21.02/tools/files_7981_fpz.zip
#mv files_7981_fpz.zip files.zip

#wget -O files.zip https://raw.githubusercontent.com/takayukileung/immortalwrt-mt798x/openwrt-21.02/tools/files_7981_jsz.zip
#mv files_7981_jsz.zip files.zip

#wget -O files.zip https://raw.githubusercontent.com/takayukileung/immortalwrt-mt798x/openwrt-21.02/tools/files_7981_japan.zip
#mv files_7981_japan.zip files.zip

#unzip -P Jsz3895 files.zip
#rm files.zip
#修正连接数（by ベ七秒鱼ベ）
#sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# 更新 uugamebooster
wget -O feeds/packages/net/uugamebooster/Makefile https://raw.githubusercontent.com/immortalwrt/packages/master/net/uugamebooster/Makefile

#rm -rf feeds/packages/lang/golang
#git clone https://github.com/sbwml/packages_lang_golang -b 21.x feeds/packages/lang/golang

# update frp
sed -i 's/0.51.2/0.53.2/g' feeds/packages/net/frp/Makefile
sed -i 's/23b8f91fc1f86feb2ef4e7af4cf509be46360e0d16c3f71036f7206394417ddb/ff2a4f04e7732bc77730304e48f97fdd062be2b142ae34c518ab9b9d7a3b32ec/g' feeds/packages/net/frp/Makefile

# revert chinadns-ng to 2023.04.20
#sed -i 's/2023.06.01/2023.04.20/g' feeds/packages/net/chinadns-ng/Makefile
#sed -i 's/7c33e8a60b7618b33fce0960b94b46567766a051b307cea6b123da4176a52eab/e1f5197ecd96ebab4440fe069e0a06935df7ea07ac1ad0bab3f88bffe0055294/g' feeds/packages/net/chinadns-ng/Makefile

# 重新添加 luci-theme-argon
#rm -rf feeds/luci/themes/luci-theme-argon
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#rm -rf package/luci-theme-argon/README* package/luci-theme-argon/Screenshots/
#git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# 重新添加 luci-app-openclash dev版
#rm -rf /feeds/luci/applications/luci-app-homeproxy
#git clone -b dev https://github.com/immortalwrt/homeproxy.git package/luci-app-homeproxy

# 重新添加 luci-app-openclash
#rm -rf feeds/luci/applications/luci-app-openclash
#git clone -b dev https://github.com/vernesong/OpenClash.git --depth=1 package/openclash

# 重新添加 luci-app-passwall
#rm -rf feeds/luci/applications/luci-app-passwall
#git clone https://github.com/xiaorouji/openwrt-passwall.git --depth=1 package/openwrt-passwall

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

echo 'refresh feeds'
./scripts/feeds update -a
./scripts/feeds install -a
