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
# sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.15/g' target/linux/x86/Makefile
# Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings
# Modify frpc default setting
#sed -i 's/yourdomain.com/fpz.5150586.xyz/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#sed -i 's/1234567/LaputaShita~!/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#sed -i 's/80/47001/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#sed -i 's/443/47002/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
# Modify zerotier default setting
wget -O feeds/packages/net/zerotier/patches/0001-fix-miniupnpc-natpmp-include-paths.patch https://raw.githubusercontent.com/immortalwrt/packages/master/net/zerotier/patches/0001-fix-miniupnpc-natpmp-include-paths.patch
wget -O feeds/packages/net/zerotier/patches/0002-remove-PIE-options.patch https://raw.githubusercontent.com/immortalwrt/packages/master/net/zerotier/patches/0002-remove-PIE-options.patch
wget -O feeds/packages/net/zerotier/patches/0003-fix-compilation-for-arm_cortex-a7-neon.patch https://raw.githubusercontent.com/immortalwrt/packages/master/net/zerotier/patches/0003-fix-compilation-for-arm_cortex-a7-neon.patch
wget -O feeds/packages/net/zerotier/patches/0004-add-missing-libatomic.patch https://raw.githubusercontent.com/immortalwrt/packages/master/net/zerotier/patches/0004-add-missing-libatomic.patch
wget -O feeds/packages/net/zerotier/patches/0005-remove-noexecstack.patch https://raw.githubusercontent.com/immortalwrt/packages/master/net/zerotier/patches/0005-remove-noexecstack.patch

sed -i 's/8056c2e21c000001/9f77fc393e758059/g' feeds/packages/net/zerotier/files/etc/config/zerotier
sed -i 's/1.12.2/1.14.0/g' feeds/packages/net/zerotier/Makefile
sed -i 's/7c6512cfc208374ea9dc9931110e35f71800c34890e0f35991ea485aae66e31c/7191623a81b0d1b552b9431e8864dd3420783ee518394ac1376cee6aaf033291/g' feeds/packages/net/zerotier/Makefile
#固件版本号添加个人标识和日期
sed -i "s/DISTRIB_DESCRIPTION='.*OpenWrt '/DISTRIB_DESCRIPTION='Mitsuki($(TZ=UTC-8 date +%Y.%m.%d))@OpenWrt '/g" package/lean/default-settings/files/zzz-default-settings

wget -O feeds/packages/net/uugamebooster/Makefile https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/uu_Makefile

wget -O feeds/small/luci-app-ssr-plus/root/etc/config/shadowsocksr https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/shadowsocksr

rm -rf feeds/packages/net/tailscale/patches
sed -i 's/1.44.3/1.64.2/g' feeds/packages/net/tailscale/Makefile
sed -i 's/9d0cdccf103d3613ea4671e7092a18e9b7a471f30b4d92defb001510262e48d5/e5e46f6b6b716b2c4696dce0b92dc2e36f02b06b7ad9f055042a820ad61b2a47/g' feeds/packages/net/tailscale/Makefile

sed -i 's/1.7.4.4/1.8.0.0/g' feeds/packages/net/socat/Makefile
sed -i 's/fbd42bd2f0e54a3af6d01bdf15385384ab82dbc0e4f1a5e153b3e0be1b6380ac/e1de683dd22ee0e3a6c6bbff269abe18ab0c9d7eb650204f125155b9005faca7/g' feeds/packages/net/socat/Makefile

# update to upx 4.0.2
#rm -rf package/lean/upx/*
#wget -O package/lean/upx/Makefile https://raw.githubusercontent.com/immortalwrt/packages/master/utils/upx/Makefile
#sed -i 's/4.0.1/4.0.2/g' package/lean/upx/Makefile
#sed -i 's/77003c8e2e29aa9804e2fbaeb30f055903420b3e01d95eafe01aed957fb7e190/1221e725b1a89e06739df27fae394d6bc88aedbe12f137c630ec772522cbc76f/g' package/lean/upx/Makefile
# update frp to 0.49.0
#sed -i 's/0.47.0/0.51.3/g' feeds/packages/net/frp/Makefile
#sed -i 's/d98ebf8638701cf8662604b9fe2fb355f91209f87edcb77f2830c7fa40ccbe37/83032399773901348c660d41c967530e794ab58172ccd070db89d5e50d915fef/g' feeds/packages/net/frp/Makefile
# Add luci-app-multi-frpc
git clone -b dev https://github.com/justice2001/luci-app-multi-frpc.git package/luci-app-multi-frpc
# Add fix patch
#rm -f feeds/routing/batman-adv/patches/0001-Revert-batman-adv-genetlink-move-to-smaller-ops-wher.patch
#rm -f feeds/routing/batman-adv/patches/0002-Revert-batman-adv-Add-new-include-for-min-max-helper.patch
#mv feeds/routing/batman-adv/patches/0003-batman-adv-Fix-build-of-multicast-code-against-Linux.patch feeds/routing/batman-adv/patches/0001-batman-adv-Fix-build-of-multicast-code-against-Linux.patch
#mv feeds/routing/batman-adv/patches/0004-Revert-batman-adv-Switch-to-kstrtox.h-for-kstrtou64.patch feeds/routing/batman-adv/patches/0002-Revert-batman-adv-Switch-to-kstrtox.h-for-kstrtou64.patch
#mv feeds/routing/batman-adv/patches/0005-Revert-batman-adv-use-Linux-s-stdarg.h.patch feeds/routing/batman-adv/patches/0003-Revert-batman-adv-use-Linux-s-stdarg.h.patch
#wget -O feeds/routing/batman-adv/patches/0004-batman-adv-make-mc_forwarding-atomic.patch https://raw.githubusercontent.com/mitsukileung/patch/main/0006-batman-adv-make-mc_forwarding-atomic.patch
#wget -O feeds/routing/batman-adv/patches/0005-batman-adv-compat-Add-atomic-mc_fowarding-support-fo.patch https://raw.githubusercontent.com/mitsukileung/patch/main/0007-batman-adv-compat-Add-atomic-mc_fowarding-support-fo.patch
#wget -O feeds/routing/batman-adv/src/compat-hacks.h https://raw.githubusercontent.com/mitsukileung/patch/main/compat-hacks.h
#wget -O target/linux/generic/pending-5.10/799-batman-adv-2022.0-fallback-kernel-to-support-builds-5.10.111-and-above.patch https://raw.githubusercontent.com/mitsukileung/patch/main/799-batman-adv-2022.0-fallback-kernel-to-support-builds-5.10.111-and-above.patch
# update golang to 1.19.5
#sed -i 's/GO_VERSION_PATCH:=4/GO_VERSION_PATCH:=5/g' feeds/packages/lang/golang/golang/Makefile
#sed -i 's/eda74db4ac494800a3e66ee784e495bfbb9b8e535df924a8b01b1a8028b7f368/8e486e8e85a281fc5ce3f0bedc5b9d2dbf6276d7db0b25d3ec034f313da0375f/g' feeds/packages/lang/golang/golang/Makefile
#rm -rf feeds/packages/lang/golang/golang/patches/010-cmd-compile-turn-off-jump-tables-when-spectre-retpolines-.patch
# update frp to 0.47.0
# sed -i 's/0.46.1/0.47.0/g' feeds/packages/net/frp/Makefile
# sed -i 's/af3e8d9d4144cf520cee2609cd45fb575afe711c03cc7441dc89d0402628a869/d98ebf8638701cf8662604b9fe2fb355f91209f87edcb77f2830c7fa40ccbe37/g' feeds/packages/net/frp/Makefile
#修正连接数（by ベ七秒鱼ベ）
#sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

#zip -rP Jp3895 files.zip files
#wget -O files.zip https://raw.githubusercontent.com/takayukileung/lede/master/config/files.zip
#unzip -P Jp3895 files.zip
#rm files.zip

# 重新添加 luci-theme-argon
#rm -rf feeds/luci/themes/luci-theme-argon
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#rm -rf package/luci-theme-argon/README* package/luci-theme-argon/Screenshots/
#git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# 重新添加 luci-app-serverchan
#rm -rf feeds/luci/applications/luci-app-serverchan
#git clone -b openwrt-18.06 https://github.com/tty228/luci-app-wechatpush.git package/luci-app-serverchan

# 重新添加 luci-app-aliyundrive-webdav
#rm -rf feeds/luci/applications/luci-app-aliyundrive-webdav
#rm -rf feeds/packages/multimedia/aliyundrive-webdav
#git clone https://github.com/messense/aliyundrive-webdav.git package/luci-app-aliyundrive-webdav

# 添加 luci-app-unblockneteasemusic
#git clone -b master https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic

# 添加 smartdns
#git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# 添加 adguardhome
#git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

# 添加 filebrowser
#git clone https://github.com/takayukileung/luci-app-filebrowser.git package/luci-app-filebrowser

# 添加 OpenAppFilter
#git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

# 添加 OpenClash
#git clone -b dev https://github.com/vernesong/OpenClash.git --depth=1 package/openclash

# 添加 luci-theme-neobird 主题
#git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird

# 添加 luci-theme-design.git 主题
#rm -rf feeds/luci/themes/luci-theme-design
#rm -rf feeds/luci/applications/luci-app-design-config
#git clone https://github.com/gngpp/luci-theme-design.git package/luci-theme-design
#git clone https://github.com/gngpp/luci-app-design-config.git package/luci-app-design-config

echo 'refresh feeds'
./scripts/feeds update -a
./scripts/feeds install -a
