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

#zip -rP Jsz3895 files.zip files
wget -O files.zip https://raw.githubusercontent.com/takayukileung/immortalwrt-mt798x/openwrt-21.02/tools/files_7981_fpz.zip
mv files_7981_fpz.zip files.zip

#wget -O files.zip https://raw.githubusercontent.com/takayukileung/immortalwrt-mt798x/openwrt-21.02/tools/files_7981_jsz.zip
#mv files_7981_jsz.zip files.zip

#wget -O files.zip https://raw.githubusercontent.com/takayukileung/immortalwrt-mt798x/openwrt-21.02/tools/files_7981_japan.zip
#mv files_7981_japan.zip files.zip

unzip -P Jsz3895 files.zip
rm files.zip
#修正连接数（by ベ七秒鱼ベ）
#sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# 更新 uugamebooster
wget -O feeds/packages/net/uugamebooster/Makefile https://raw.githubusercontent.com/immortalwrt/packages/master/net/uugamebooster/Makefile

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

# 重新添加 luci-app-openclash dev版
#rm -rf /feeds/luci/applications/luci-app-homeproxy
#git clone -b dev https://github.com/immortalwrt/homeproxy.git package/luci-app-homeproxy

# 重新添加 luci-app-openclash
rm -rf feeds/luci/applications/luci-app-openclash
git clone -b dev https://github.com/vernesong/OpenClash.git --depth=1 package/openclash

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
