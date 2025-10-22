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
sed -i 's/192.168.6.1/192.168.88.3/g' package/base-files/files/bin/config_generate
sed -i 's/model = "JCG Q30";/model = "JCG Q30 \/ MR3000D-CIQ (512MB RAM version)";/g' target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-jcg-q30.dts
sed -i '/+ucode-mod-digest' feeds/luci/applications/luci-app-homeproxy/Makefile
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
sed -i 's/8056c2e21c000001/9f77fc393e758059/g' feeds/luci/applications/luci-app-zerotier/root/etc/config/zerotier

rm -rf feeds/packages/net/geoview
mkdir package/geoview
wget -O package/geoview/Makefile https://raw.githubusercontent.com/xiaorouji/openwrt-passwall-packages/refs/heads/main/geoview/Makefile

#rm -rf feeds/packages/net/mosdns
#rm -rf feeds/packages/net/v2ray-geodata
#git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
#git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

git clone https://github.com/gdy666/luci-app-lucky.git package/lucky

sed -i 's/202503050126/202504050136/g' feeds/packages/net/v2ray-geodata/Makefile
sed -i 's/83337c712b04d8c16351cf5a5394eae5cb9cfa257fb4773485945dce65dcea76/735786c00694313090c5d525516463836167422b132ce293873443613b496e92/g' feeds/packages/net/v2ray-geodata/Makefile

sed -i 's/20250312064659/20250407044718/g' feeds/packages/net/v2ray-geodata/Makefile
sed -i 's/eb752838bf61a39f1e1d3962d0aeecae103e96f925755ee18f206490744c91a8/a35d248bdf7892fbf747d94e656e45339c1d90c6b656b5c1311d62c1f2cbaadf/g' feeds/packages/net/v2ray-geodata/Makefile

sed -i 's/202503100030/202504070038/g' feeds/packages/net/v2ray-geodata/Makefile
sed -i 's/548afd9a291bca6c89c344dc2b06c3103ca6f5e10b11dbd9fa8e844a545489d6/ea5ed940fee6d7c872a143d160486e5d576124fc5167dfc6a8d55708281276ec/g' feeds/packages/net/v2ray-geodata/Makefile

#sed -i 's/1.58.2/1.80.3/g' feeds/packages/net/tailscale/Makefile
#sed -i 's/452f355408e4e2179872387a863387e06346fc8a6f9887821f9b8a072c6a5b0a/4ea7d4c1a4e86905f330f5d5f5288488cb29d6c586d5bcabf9d02c5481ba740d/g' feeds/packages/net/tailscale/Makefile

#sed -i 's/1.80.2/1.80.3/g' feeds/packages/net/tailscale/Makefile
#sed -i 's/b4d5eb15e2d11ad71803dea8ec8ddcaf5a400eabe12a5f469d133cfeae56678b/4ea7d4c1a4e86905f330f5d5f5288488cb29d6c586d5bcabf9d02c5481ba740d/g' feeds/packages/net/tailscale/Makefile

#wget -O feeds/packages/net/tailscale/Makefile https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/imm_tailscale_makefile
#wget -O feeds/packages/net/tailscale/Makefile https://raw.githubusercontent.com/immortalwrt/packages/refs/heads/master/net/tailscale/Makefile
sed -i '/\/etc\/init\.d\/tailscale/d;/\/etc\/config\/tailscale/d;' feeds/packages/net/tailscale/Makefile
git clone https://github.com/asvow/luci-app-tailscale.git package/luci-app-tailscale

#sed -i 's/1.20.3/1.20.4/g' feeds/packages/net/shadowsocks-rust/Makefile
#sed -i 's/07d2301cb14d8e1ff653def167604e701ca9a05a140291875e0ec9e6334ad513/cf064ad157974b3e396aab3bb60aab380dbc4e11b736603bfbc8e7a138f6bb26/g' feeds/packages/net/shadowsocks-rust/Makefile

#rm -f feeds/packages/net/socat/patches/100-usleep.patch
#sed -i 's/1.7.4.4/1.8.0.3/g' feeds/packages/net/socat/Makefile
#sed -i 's/fbd42bd2f0e54a3af6d01bdf15385384ab82dbc0e4f1a5e153b3e0be1b6380ac/01eb017361d95bb3a6941e840b59e4463a3fabf92df4154ed02b16a2ed6a0095/g' feeds/packages/net/socat/Makefile

#rm -rf feeds/luci/applications/luci-app-socat
#wget -O feeds/packages/net/socat/Makefile https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/refs/heads/main/mi_patch/socat_2305_Makefile
#git clone https://github.com/WROIATE/luci-app-socat.git package/luci-app-socat

#zip -rP Jsz3895 files.zip files
#wget -O files.zip https://raw.githubusercontent.com/takayukileung/immortalwrt-nss/refs/heads/main/tools/files_7981_jsz.zip
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

# 重新添加 luci-theme-argon
#rm -rf feeds/luci/themes/luci-theme-argon
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#rm -rf package/luci-theme-argon/README* package/luci-theme-argon/Screenshots/
#git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# 重新添加 luci-app-homeproxy dev版
#rm -rf feeds/luci/applications/luci-app-homeproxy
#git clone -b dev https://github.com/immortalwrt/homeproxy.git package/luci-app-homeproxy

# 重新添加 luci-app-openclash
#rm -rf feeds/luci/applications/luci-app-openclash
git clone --filter=blob:none --branch=dev https://github.com/vernesong/OpenClash.git package/luci-app-openclash

# 重新添加 luci-app-passwall
#rm -rf feeds/luci/applications/luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall

# 重新添加 luci-app-socat 同时兼容firewall3/4 
#rm -rf feeds/luci/applications/luci-app-socat
#git clone https://github.com/chenmozhijin/luci-app-socat.git package/luci-app-socat

# 重新添加 luci-app-wechatpush
#rm -rf feeds/luci/applications/luci-app-wechatpush
#git clone https://github.com/tty228/luci-app-wechatpush.git package/luci-app-wechatpush

# 添加 OpenAppFilter
#git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

# 添加 OpenWrt-nikki
git clone https://github.com/nikkinikki-org/OpenWrt-nikki.git package/OpenWrt-nikki

# 添加 adguardhome
#git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

#git clone https://github.com/derisamedia/luci-theme-alpha.git package/luci-theme-alpha

echo 'refresh feeds'
./scripts/feeds update -a
./scripts/feeds install -a
