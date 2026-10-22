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

# 添加编译日期标识
sed -i "s/(luciversion || '')/& + (' \/ Mitsuki-$(TZ=UTC-8 date +%y.%m.%d)')/g" $(find ./feeds/luci/modules/luci-mod-status/ -name "10_system.js")

#sed -i 's/bluez python3/libffi bluez python3/g' feeds/packages/lang/python/python3/Makefile

# 修复编译时python3的错误
mkdir -p patches/feeds/packages/lang/python/python3/
wget -O patches/feeds/packages/lang/python/python3/100-add-libffi-build-dep.patch https://raw.githubusercontent.com/chienkuo/ImmortalWrt-for-Gemtek-XR1710G/refs/heads/master/patches/feeds/packages/lang/python/python3/100-add-libffi-build-dep.patch
mkdir -p package/libs/libffi/
wget -O package/libs/libffi/Makefile https://raw.githubusercontent.com/chienkuo/ImmortalWrt-for-Gemtek-XR1710G/refs/heads/master/package/libs/libffi/Makefile

# 关闭 CI llvm
#sed -i 's/llvm=true/llvm=false/g' feeds/packages/lang/rust/Makefile

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

#sed -i 's/1.12.25/1.13.16/g' feeds/packages/net/sing-box/Makefile
#sed -i 's/881435f07b5ab8170ccf3cb69e87130759521dc0ed1ae4bfeacbe7772a93a158/5d8201669387d0caded7a22c71682b3c025afef7bac8704cceabed52ea8bde5d/g' feeds/packages/net/sing-box/Makefile

rm -rf feeds/packages/net/geoview
mkdir package/geoview
wget -O package/geoview/Makefile https://raw.githubusercontent.com/Openwrt-Passwall/openwrt-passwall-packages/refs/heads/main/geoview/Makefile

rm -rf feeds/luci/applications/luci-app-tailscale-community
git clone https://github.com/Tokisaki-Galaxy/luci-app-tailscale-community.git package/luci-app-tailscale-community

#sed -i 's/llvm=true/llvm=false/g' feeds/packages/lang/rust/Makefile

rm -rf feeds/luci/applications/luci-app-appfilter
rm -rf feeds/packages/net/open-app-filter
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

rm -rf package/lucky
git clone https://github.com/gdy666/luci-app-lucky.git package/lucky

# 添加 luci-theme-glass 主题
git clone https://github.com/rchen14b/luci-theme-glass.git package/luci-theme-glass

# 添加 aurora 主题&设置
git clone https://github.com/eamonxg/luci-theme-aurora.git package/luci-theme-aurora
git clone https://github.com/eamonxg/luci-app-aurora-config.git package/luci-app-aurora-config
sed -i "s/nav_type '.*'/nav_type 'dropdown'/g" $(find ./package/luci-app-aurora-config/root/usr/share/aurora/ -type f -name "*.template")

#wget -O package/utils/util-linux/patches/0001-nsenter-Fix-AT_HANDLE_FID-on-musl.patch https://raw.githubusercontent.com/openwrt/openwrt/refs/heads/main/package/utils/util-linux/patches/0001-nsenter-Fix-AT_HANDLE_FID-on-musl.patch

#rm -rf feeds/luci/applications/luci-app-socat
#wget -O feeds/packages/net/socat/Makefile https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/socat_Makefile
#git clone https://github.com/WROIATE/luci-app-socat.git package/luci-app-socat

#zip -rP Jsz3895 files.zip files
#curl -fLv -H "Authorization: token $GH_PAT" -H "Accept: application/vnd.github.v3.raw" -o files.zip "https://api.github.com/repos/takayukileung/Actions-OpenWrt/contents/patch/an7581_jp.zip?ref=main"
#unzip -P Jsz3895 files.zip
#rm files.zip

#修正连接数（by ベ七秒鱼ベ）
#sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

#wget -O package/boot/uboot-envtools/files/qualcommax_ipq807x https://raw.githubusercontent.com/VIKINGYFY/immortalwrt/19e3832bf0d39dd2ced289b27a95444b1ec0f911/package/boot/uboot-envtools/files/qualcommax_ipq807x
#wget -O target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ipq8071-ax6-stock.dts https://raw.githubusercontent.com/VIKINGYFY/immortalwrt/19e3832bf0d39dd2ced289b27a95444b1ec0f911/target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ipq8071-ax6-stock.dts
#wget -O target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ipq8071-ax3600-stock.dts https://raw.githubusercontent.com/VIKINGYFY/immortalwrt/19e3832bf0d39dd2ced289b27a95444b1ec0f911/target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ipq8071-ax3600-stock.dts
#wget -O target/linux/qualcommax/image/ipq807x.mk https://raw.githubusercontent.com/VIKINGYFY/immortalwrt/19e3832bf0d39dd2ced289b27a95444b1ec0f911/target/linux/qualcommax/image/ipq807x.mk
#wget -O target/linux/qualcommax/ipq807x/base-files/etc/board.d/01_leds https://raw.githubusercontent.com/VIKINGYFY/immortalwrt/19e3832bf0d39dd2ced289b27a95444b1ec0f911/target/linux/qualcommax/ipq807x/base-files/etc/board.d/01_leds
#wget -O target/linux/qualcommax/ipq807x/base-files/etc/board.d/02_network https://raw.githubusercontent.com/VIKINGYFY/immortalwrt/19e3832bf0d39dd2ced289b27a95444b1ec0f911/target/linux/qualcommax/ipq807x/base-files/etc/board.d/02_network
#wget -O target/linux/qualcommax/ipq807x/base-files/etc/hotplug.d/firmware/11-ath10k-caldata https://raw.githubusercontent.com/VIKINGYFY/immortalwrt/19e3832bf0d39dd2ced289b27a95444b1ec0f911/target/linux/qualcommax/ipq807x/base-files/etc/hotplug.d/firmware/11-ath10k-caldata
#wget -O target/linux/qualcommax/ipq807x/base-files/etc/hotplug.d/firmware/11-ath11k-caldata https://raw.githubusercontent.com/VIKINGYFY/immortalwrt/19e3832bf0d39dd2ced289b27a95444b1ec0f911/target/linux/qualcommax/ipq807x/base-files/etc/hotplug.d/firmware/11-ath11k-caldata
#wget -O target/linux/qualcommax/ipq807x/base-files/etc/init.d/bootcount https://raw.githubusercontent.com/VIKINGYFY/immortalwrt/19e3832bf0d39dd2ced289b27a95444b1ec0f911/target/linux/qualcommax/ipq807x/base-files/etc/init.d/bootcount
#wget -O target/linux/qualcommax/ipq807x/base-files/lib/upgrade/platform.sh https://raw.githubusercontent.com/VIKINGYFY/immortalwrt/19e3832bf0d39dd2ced289b27a95444b1ec0f911/target/linux/qualcommax/ipq807x/base-files/lib/upgrade/platform.sh

#添加 集客AC
#git clone https://github.com/lwb1978/openwrt-gecoosac package/openwrt-gecoosac

# update frp to 0.53.2
#sed -i 's/0.51.3/0.53.2/g' feeds/packages/net/frp/Makefile
#sed -i 's/83032399773901348c660d41c967530e794ab58172ccd070db89d5e50d915fef/ff2a4f04e7732bc77730304e48f97fdd062be2b142ae34c518ab9b9d7a3b32ec/g' feeds/packages/net/frp/Makefile

# revert chinadns-ng to 2023.04.20
#sed -i 's/2023.06.01/2023.04.20/g' feeds/packages/net/chinadns-ng/Makefile
#sed -i 's/7c33e8a60b7618b33fce0960b94b46567766a051b307cea6b123da4176a52eab/e1f5197ecd96ebab4440fe069e0a06935df7ea07ac1ad0bab3f88bffe0055294/g' feeds/packages/net/chinadns-ng/Makefile

# 重新添加 luci-app-homeproxy
rm -rf feeds/packages/net/sing-box
rm -rf feeds/luci/applications/luci-app-homeproxy
git clone https://github.com/VIKINGYFY/packages.git package/vikingyfy

sed -i 's/1.15.0-alpha.11/1.15.0-alpha.12/g' package/vikingyfy/sing-box/Makefile
sed -i 's/1.15.0_alpha11/1.15.0_alpha12/g' package/vikingyfy/sing-box/Makefile
sed -i 's/f5b0e1ac6ba8376580266421894b7f86292967a98fba8c69f1adb90c1a40e1ea/bf241b0e072b88c5fe19aaecfd19c7678254a07e8f67e9ff24586828821c46e2/g' package/vikingyfy/sing-box/Makefile
#sed -i 's/1.15.0_alpha10/1.15.0_alpha11/g' package/vikingyfy/luci-app-homeproxy/Makefile

# 重新添加 luci-app-openclash
rm -rf feeds/luci/applications/luci-app-openclash
git clone --filter=blob:none --branch=dev https://github.com/vernesong/OpenClash.git package/luci-app-openclash
sed -i 's/\$\$CORE_ARCH/$$$$CORE_ARCH/g' package/luci-app-openclash/luci-app-openclash/Makefile

# 重新添加 luci-app-passwall
rm -rf feeds/luci/applications/luci-app-passwall
git clone https://github.com/Openwrt-Passwall/openwrt-passwall package/passwall-luci
sed -i '1i 52pojie.cn\
right.com.cn\
wnflb99.com\
5150586.xyz\
2222dy.com\
555gy.cc\
555zxdy.cc\
666ys.net\
91zxdy.com\
' package/passwall-luci/luci-app-passwall/root/usr/share/passwall/rules/direct_host

#git clone https://github.com/fcshark-org/openwrt-fchomo.git package/openwrt-fchomo

# 添加 luci-theme-alpha-reborn 主题
#git clone https://github.com/derisamedia/luci-theme-alpha-reborn.git package/luci-theme-alpha-reborn

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
