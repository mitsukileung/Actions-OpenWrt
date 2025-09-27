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
sed -i 's/'0/'1/g' feeds/packages/net/adguardhome/files/adguardhome.config

sed -i 's/8056c2e21c000001/9f77fc393e758059/g' feeds/packages/net/zerotier/files/etc/config/zerotier

rm -rf feeds/packages/net/geoview
mkdir package/geoview
wget -O package/geoview/Makefile https://raw.githubusercontent.com/xiaorouji/openwrt-passwall-packages/refs/heads/main/geoview/Makefile

sed -i 's/202506050146/202508140022/g' feeds/packages/net/v2ray-geodata/Makefile
sed -i 's/58bf8f086473cad7df77f032815eb8d96bbd4a1aaef84c4f7da18cf1a3bb947a/54761d8691a5756fdb08d2cd4d0a9c889dbaab786e1cf758592e09fb00377f53/g' feeds/packages/net/v2ray-geodata/Makefile

sed -i 's/20250627153051/20250814002625/g' feeds/packages/net/v2ray-geodata/Makefile
sed -i 's/01dae2a9c31b5c74ba7e54d8d51e0060688ed22da493eaf09f6eeeec89db395e/01dae2a9c31b5c74ba7e54d8d51e0060688ed22da493eaf09f6eeeec89db395e/g' feeds/packages/net/v2ray-geodata/Makefile

sed -i 's/202506300044/202508110046/g' feeds/packages/net/v2ray-geodata/Makefile
sed -i 's/9dc1d277be21851fbb7e4e7376f8b9cfe2d47b6ade9cf4459de35596e20782b6/20ee5b1bf5a10aea00aeb5b7e435ccf13cd578ef9ce55236fc7c0fdfd3f5b1f6/g' feeds/packages/net/v2ray-geodata/Makefile

#rm -rf feeds/packages/net/mosdns
#rm -rf feeds/packages/net/v2ray-geodata
#git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
#git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic

git clone https://github.com/gdy666/luci-app-lucky.git package/lucky

sed -i 's/1.76.6/1.78.1/g' feeds/packages/net/tailscale/Makefile
sed -i 's/1603c78a6a5e9f83b278d305e1196fbfdeeb841be10ac2ddb7ea433c2701234b/dbc25cc241bb233f183475f003d5508af7b45add1ca548b35a6a6fea91fb91af/g' feeds/packages/net/tailscale/Makefile
sed -i '/\/etc\/init\.d\/tailscale/d;/\/etc\/config\/tailscale/d;' feeds/packages/net/tailscale/Makefile
git clone https://github.com/asvow/luci-app-tailscale.git package/luci-app-tailscale

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

# 重新添加 luci-theme-argon
#rm -rf feeds/luci/themes/luci-theme-argon
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#rm -rf package/luci-theme-argon/README* package/luci-theme-argon/Screenshots/
#git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# 重新添加 luci-app-homeproxy dev版
rm -rf feeds/luci/applications/luci-app-homeproxy
git clone -b dev https://github.com/immortalwrt/homeproxy.git package/luci-app-homeproxy

# 重新添加 luci-app-openclash
rm -rf feeds/luci/applications/luci-app-openclash
git clone --filter=blob:none --branch=dev https://github.com/vernesong/OpenClash.git package/luci-app-openclash
#sed -i 's/PKG_RELEASE:=beta/PKG_RELEASE:=/g' package/luci-app-openclash/luci-app-openclash/Makefile

# 重新添加 luci-app-passwall
rm -rf feeds/luci/applications/luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
#sed -i 's/PKG_VERSION:=4.78-4/PKG_VERSION:=4.78.4/g' package/luci-app-passwall/luci-app-passwall/Makefile

# 重新添加 luci-app-socat 同时兼容firewall3/4 
#rm -rf feeds/luci/applications/luci-app-socat
#git clone https://github.com/chenmozhijin/luci-app-socat.git package/luci-app-socat
#git clone https://github.com/WROIATE/luci-app-socat.git package/luci-app-socat

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
