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

# 修改Uboot分区刷写
sed -i '/label = "\(bl2\|fip\)";/,/^[[:space:]]*};/ {/[[:space:]]*read-only;/d}' target/linux/mediatek/dts/mt7981b-jcg-q30-pro.dts

# 关闭 CI llvm
#sed -i 's/llvm=true/llvm=false/g' feeds/packages/lang/rust/Makefile

#wget -O target/linux/mediatek/filogic/base-files/lib/preinit/90_extract_caldata https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/90_extract_caldata
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

#sed -i 's/1.12.25/1.13.14/g' feeds/packages/net/sing-box/Makefile
#sed -i 's/881435f07b5ab8170ccf3cb69e87130759521dc0ed1ae4bfeacbe7772a93a158/d18294eb00128743b1dbf1d5f4f01902bdfd59a2d2858cda809abe5351a9cd40/g' feeds/packages/net/sing-box/Makefile

rm -rf feeds/packages/net/geoview
mkdir package/geoview
wget -O package/geoview/Makefile https://raw.githubusercontent.com/xiaorouji/openwrt-passwall-packages/refs/heads/main/geoview/Makefile

#sed -i '/\/etc\/init\.d\/tailscale/d;/\/etc\/config\/tailscale/d;' feeds/packages/net/tailscale/Makefile
#git clone https://github.com/asvow/luci-app-tailscale.git package/luci-app-tailscale
git clone https://github.com/Tokisaki-Galaxy/luci-app-tailscale-community.git package/luci-app-tailscale-community

git clone https://github.com/gdy666/luci-app-lucky.git package/lucky

#rm -rf feeds/luci/applications/luci-app-socat
#wget -O feeds/packages/net/socat/Makefile https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/socat_Makefile
#git clone https://github.com/WROIATE/luci-app-socat.git package/luci-app-socat

#修正连接数（by ベ七秒鱼ベ）
#sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

#wget -O package/boot/uboot-envtools/files/mediatek_filogic https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/6.12/mediatek_filogic
#wget -O ‎package/mtk/applications/mtk-smp/files/smp.sh https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/6.12/smp.sh
#wget -O target/linux/mediatek/dts/mt7981b-sl-3000-emmc.dts https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/6.12/mt7981b-sl-3000-emmc.dts
#wget -O target/linux/mediatek/dts/mt7981b-jcg-q30-pro.dts https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/6.12/mt7981b-jcg-q30-pro.dts
#wget -O target/linux/mediatek/filogic/base-files/etc/board.d/02_network‎ https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/6.12/02_network
#wget -O ‎target/linux/mediatek/filogic/base-files/etc/hotplug.d/firmware/11-mt76-caldata https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/6d8453465d972535e2b90973f4e4d29131ac1a01/mi_patch/6.12/11-mt76-caldata‎
#wget -O ‎target/linux/mediatek/filogic/base-files/etc/hotplug.d/ieee80211/11_fix_wifi_mac https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/6.12/11_fix_wifi_mac
#wget -O target/linux/mediatek/filogic/base-files/lib/upgrade/platform.sh‎ https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/6.12/platform.sh
#wget -O ‎target/linux/mediatek/image/filogic.mk https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/6.12/filogic.mk

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

sed -i 's/1.15.0-alpha.1/1.15.0-alpha.2/g' package/vikingyfy/sing-box/Makefile
sed -i 's/1.15.0_alpha1/1.15.0_alpha2/g' package/vikingyfy/sing-box/Makefile
sed -i 's/18ce715936db59dee730c0da3d8323331ba647fb17aa89108ddd1de90b6ca71b/76f322be1e86b689dfdb12be9d27314e7a329dca03b134222c7454900321f8be/g' package/vikingyfy/sing-box/Makefile
sed -i 's/1.14.0_alpha1/1.14.0/g' package/vikingyfy/luci-app-homeproxy/Makefile

# 重新添加 luci-app-openclash
rm -rf feeds/luci/applications/luci-app-openclash
git clone --filter=blob:none --branch=dev https://github.com/vernesong/OpenClash.git package/luci-app-openclash
#sed -i 's/PKG_RELEASE:=beta/PKG_RELEASE:=/g' package/luci-app-openclash/luci-app-openclash/Makefile

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

rm -rf feeds/luci/applications/luci-app-appfilter
rm -rf feeds/packages/net/open-app-filter
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

#git clone https://github.com/VIKINGYFY/packages.git package/other
#cp -r package/other/luci-app-wolultra package/luci-app-wolultra
#rm -rf package/other

# 添加 luci-theme-alpha-reborn 主题
#git clone https://github.com/derisamedia/luci-theme-alpha-reborn.git package/luci-theme-alpha-reborn

# 重新添加 luci-app-wechatpush
#rm -rf feeds/luci/applications/luci-app-wechatpush
#git clone https://github.com/tty228/luci-app-wechatpush.git package/luci-app-wechatpush

# 添加 aurora 主题&设置
git clone https://github.com/eamonxg/luci-theme-aurora.git package/luci-theme-aurora
git clone https://github.com/eamonxg/luci-app-aurora-config.git package/luci-app-aurora-config
sed -i "s/nav_type '.*'/nav_type 'dropdown'/g" $(find ./package/luci-app-aurora-config/root/usr/share/aurora/ -type f -name "*.template")

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
