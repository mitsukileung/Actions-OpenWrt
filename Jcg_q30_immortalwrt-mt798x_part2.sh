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
sed -i 's/192.168.1.1/192.168.88.3/g' package/base-files/files/bin/config_generate
# Modify X86 Kernel 5.10
#sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.15/g' target/linux/ipq807x/Makefile
# Clear the login password
#sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings
# Modify frpc default setting
#sed -i 's/yourdomain.com/fpz.5150586.xyz/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#sed -i 's/1234567/LaputaShita~!/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#sed -i 's/80/57001/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#sed -i 's/443/57002/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp

wget -O feeds/packages/net/zerotier/patches/0001-fix-miniupnpc-natpmp-include-paths.patch https://raw.githubusercontent.com/immortalwrt/packages/master/net/zerotier/patches/0001-fix-miniupnpc-natpmp-include-paths.patch
wget -O feeds/packages/net/zerotier/patches/0002-remove-PIE-options.patch https://raw.githubusercontent.com/immortalwrt/packages/master/net/zerotier/patches/0002-remove-PIE-options.patch
wget -O feeds/packages/net/zerotier/patches/0003-fix-compilation-for-arm_cortex-a7-neon.patch https://raw.githubusercontent.com/immortalwrt/packages/master/net/zerotier/patches/0003-fix-compilation-for-arm_cortex-a7-neon.patch
wget -O feeds/packages/net/zerotier/patches/0004-add-missing-libatomic.patch https://raw.githubusercontent.com/immortalwrt/packages/master/net/zerotier/patches/0004-add-missing-libatomic.patch
wget -O feeds/packages/net/zerotier/patches/0005-remove-noexecstack.patch https://raw.githubusercontent.com/immortalwrt/packages/master/net/zerotier/patches/0005-remove-noexecstack.patch

sed -i 's/8056c2e21c000001/9f77fc393e758059/g' feeds/packages/net/zerotier/files/etc/config/zerotier
sed -i 's/1.12.2/1.14.1/g' feeds/packages/net/zerotier/Makefile
sed -i 's/7c6512cfc208374ea9dc9931110e35f71800c34890e0f35991ea485aae66e31c/4f9f40b27c5a78389ed3f3216c850921f6298749e5819e9f2edabb2672ce9ca0/g' feeds/packages/net/zerotier/Makefile

wget -O feeds/packages/net/uugamebooster/Makefile https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/immortalwrt_uu_makefile
#sed -i 's/7.6.12/7.4.4/g' feeds/packages/net/uugamebooster/Makefile
#sed -i 's/94142285c777c43c817c686d6a2bdae3d2321d168ca095b57dc0dc298e1d2edd/a4aaccfd437b16a645e541d3f8370620ac0258e0000d01c1b59d1dcfd670caae/g' feeds/packages/net/uugamebooster/Makefile
#sed -i 's/03af56ff4e9b541378a5aa3a1cb3a691b651a3d44c3635e041a9b770e08f80b8/1ae13f669f4afb021e80d1a9341c1d3de7ce982168e6b4d1726ce494913da64f/g' feeds/packages/net/uugamebooster/Makefile
#sed -i 's/180370c0840f33a151c1e19d2ea01a2c6d7edc5e765b76f3432153fd7e6cdaef/f5df1b3adc8566fba4eb7d1ba1b7bc8cb6c285cf31a29591719672508edccef1/g' feeds/packages/net/uugamebooster/Makefile
#sed -i 's/cf7301d76a901da3f8410d7c908d62fde7ad0c04c39c147943b9794394867d49/3c4aeb495d4a972d35c608ec7dde4481964c604360fc5c7217987e8b7689b108/g' feeds/packages/net/uugamebooster/Makefile

rm -f feeds/packages/net/socat/patches/100-usleep.patch
sed -i 's/1.7.3.4/1.8.0.0/g' feeds/packages/net/socat/Makefile
sed -i 's/972374ca86f65498e23e3259c2ee1b8f9dbeb04d12c2a78c0c9b5d1cb97dfdfc/e1de683dd22ee0e3a6c6bbff269abe18ab0c9d7eb650204f125155b9005faca7/g' feeds/packages/net/socat/Makefile

# 网口显示美化
wget -O package/emortal/autocore/files/generic/21_ethinfo.js https://raw.githubusercontent.com/wsk170/immortalwrt-mt798x-hanwckf/refs/heads/openwrt-21.02/package/emortal/autocore/files/generic/21_ethinfo.js
wget -O package/emortal/autocore/Makefile https://raw.githubusercontent.com/wsk170/immortalwrt-mt798x-hanwckf/refs/heads/openwrt-21.02/package/emortal/autocore/Makefile

#git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns

#rm -rf feeds/packages/net/tailscale/patches
#sed -i 's/1.32.3/1.38.3/g' feeds/packages/net/tailscale/Makefile
#sed -i 's/4cf88a1d754240ce71b29d3a65ca480091ad9c614ac99c541cef6fdaf0585dd4/63ef41e642f4b2c322c794742f03e9e06b593992e9a1299c94f495a496cffb3a/g' feeds/packages/net/tailscale/Makefile

#zip -rP Jsz3895 files.zip files
wget -O files.zip https://raw.githubusercontent.com/takayukileung/immortalwrt-mt798x/openwrt-21.02/tools/files_7981_fpz.zip


#wget -O files.zip https://raw.githubusercontent.com/takayukileung/immortalwrt-mt798x/openwrt-21.02/tools/files_7981_jsz.zip


#wget -O files.zip https://raw.githubusercontent.com/takayukileung/immortalwrt-mt798x/openwrt-21.02/tools/files_7981_japan.zip


unzip -P Jsz3895 files.zip
rm files.zip

#修正连接数（by ベ七秒鱼ベ）
#sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# 更新 uugamebooster
#wget -O feeds/packages/net/uugamebooster/Makefile https://raw.githubusercontent.com/immortalwrt/packages/master/net/uugamebooster/Makefile

#rm -rf feeds/packages/lang/golang
#git clone https://github.com/sbwml/packages_lang_golang -b 21.x feeds/packages/lang/golang

# update frp
#sed -i 's/0.51.2/0.51.3/g' feeds/packages/net/frp/Makefile
#sed -i 's/23b8f91fc1f86feb2ef4e7af4cf509be46360e0d16c3f71036f7206394417ddb/83032399773901348c660d41c967530e794ab58172ccd070db89d5e50d915fef/g' feeds/packages/net/frp/Makefile

# revert chinadns-ng to 2023.04.20
#sed -i 's/2023.06.01/2023.04.20/g' feeds/packages/net/chinadns-ng/Makefile
#sed -i 's/7c33e8a60b7618b33fce0960b94b46567766a051b307cea6b123da4176a52eab/e1f5197ecd96ebab4440fe069e0a06935df7ea07ac1ad0bab3f88bffe0055294/g' feeds/packages/net/chinadns-ng/Makefile

# 重新添加 luci-theme-argon
#rm -rf feeds/luci/themes/luci-theme-argon
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#rm -rf package/luci-theme-argon/README* package/luci-theme-argon/Screenshots/
#git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# 重新添加 luci-app-openclash dev版
#rm -rf feeds/luci/applications/luci-app-homeproxy
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
