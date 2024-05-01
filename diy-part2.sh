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
# Modify X86 Kernel
#sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.4/g' target/linux/x86/Makefile
# Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings
# Modify frpc default setting
#sed -i 's/yourdomain.com/frp.104300.xyz/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#sed -i 's/1234567/www.126126.xyz/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#固件版本号添加个人标识和日期
sed -i "s/DISTRIB_DESCRIPTION='.*OpenWrt '/DISTRIB_DESCRIPTION='Mitsuki($(TZ=UTC-8 date +%Y.%m.%d))@OpenWrt '/g" package/lean/default-settings/files/zzz-default-settings

sed -i 's/1.7.4.4/1.8.0.0/g' feeds/packages/net/socat/Makefile
sed -i 's/fbd42bd2f0e54a3af6d01bdf15385384ab82dbc0e4f1a5e153b3e0be1b6380ac/e1de683dd22ee0e3a6c6bbff269abe18ab0c9d7eb650204f125155b9005faca7/g' feeds/packages/net/socat/Makefile

# update frp to 0.51.3
#sed -i 's/0.47.0/0.51.3/g' feeds/packages/net/frp/Makefile
#sed -i 's/d98ebf8638701cf8662604b9fe2fb355f91209f87edcb77f2830c7fa40ccbe37/83032399773901348c660d41c967530e794ab58172ccd070db89d5e50d915fef/g' feeds/packages/net/frp/Makefile

sed -i 's/8056c2e21c000001/9f77fc393e758059/g' feeds/packages/net/zerotier/files/etc/config/zerotier
sed -i 's/1.12.2/1.14.0/g' feeds/packages/net/zerotier/Makefile
sed -i 's/7c6512cfc208374ea9dc9931110e35f71800c34890e0f35991ea485aae66e31c/d6ea4dc3b4d88c1acc14f4fe349f9b23860c512e037cb5116d306418d2cbd500/g' feeds/packages/net/zerotier/Makefile

# revert chinadns-ng to 2023.04.20
#sed -i 's/2023.06.01/2023.04.20/g' feeds/helloworld/chinadns-ng/Makefile
#sed -i 's/7c33e8a60b7618b33fce0960b94b46567766a051b307cea6b123da4176a52eab/e1f5197ecd96ebab4440fe069e0a06935df7ea07ac1ad0bab3f88bffe0055294/g' feeds/helloworld/chinadns-ng/Makefile

#zip -rP Fpz824613 files.zip files
#wget -O files.zip https://raw.githubusercontent.com/takayukileung/lede/master/package/base-files/files.zip
#unzip -P Fpz824613 files.zip
#rm files.zip

# 重新添加 luci-app-passwall smartdns版本
#rm -rf feeds/small/luci-app-passwall
#git clone -b luci-smartdns-dev https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-passwall

sed -i 's/3.15.0/4.14.4/g' feeds/packages/net/uugamebooster/Makefile
sed -i 's/0b6a8d04f0b72d9270da295e3eb0d924/9d524db2593abd58a2977ff844e8db65/g' feeds/packages/net/uugamebooster/Makefile
sed -i 's/22ac7bac2e3c517b0120f182b6d406ad/3ce3e920432e59825bc84113fbbf2a8e/g' feeds/packages/net/uugamebooster/Makefile
sed -i 's/de7b87ef7c713d9dd97423d0131eeafd/d65b3295d5770e4a15ff9e8a4b83bc2a/g' feeds/packages/net/uugamebooster/Makefile
sed -i 's/983e1873e74c06690e32bb7bae12883e/b9ca050a6ed3658b460150b02f7772e6/g' feeds/packages/net/uugamebooster/Makefile

wget -O feeds/smpackage/luci-app-ssr-plus/root/etc/config/shadowsocksr https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/shadowsocksr

rm -rf feeds/packages/net/tailscale/patches
sed -i 's/1.44.3/1.62.1/g' feeds/packages/net/tailscale/Makefile
sed -i 's/9d0cdccf103d3613ea4671e7092a18e9b7a471f30b4d92defb001510262e48d5/22737fae37e971fecdf49d6b741b99988868aa3f1e683e67e14b872a2c49ca1c/g' feeds/packages/net/tailscale/Makefile

git clone -b dev https://github.com/justice2001/luci-app-multi-frpc.git package/luci-app-multi-frpc

# 重新添加 luci-app-serverchan
#rm -rf feeds/luci/applications/luci-app-serverchan
#git clone -b openwrt-18.06 https://github.com/tty228/luci-app-wechatpush.git package/luci-app-serverchan

# 重新添加 luci-app-netdata
#rm -rf feeds/luci/applications/luci-app-netdata
#git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata
#在rm前面加一行内容为“chmod +x /etc/init.d/netdata”
#sed -i '/rm/i chmod +x /etc/init.d/netdata' package/luci-app-netdata/root/etc/uci-defaults/40_luci-app-netdata
#sed -i 's/0/1/g' package/luci-app-netdata/root/etc/config/netdata && sed -i 's/19991/19990/g' package/luci-app-netdata/root/etc/config/netdata

# 重新添加 luci-app-aliyundrive-webdav
#rm -rf feeds/luci/applications/luci-app-aliyundrive-webdav
#rm -rf feeds/packages/multimedia/aliyundrive-webdav
#git clone https://github.com/messense/aliyundrive-webdav.git package/luci-app-aliyundrive-webdav

# 添加 luci-app-unblockneteasemusic
#git clone -b master https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic

# 重新添加 luci-app-pushbot
#rm -rf feeds/luci/applications/luci-app-pushbot
#git clone https://github.com/zzsj0928/luci-app-pushbot.git package/luci-app-pushbot

# 添加 smartdns
#git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# 添加 adguardhome
#git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

# 添加 filebrowser
#git clone https://github.com/takayukileung/luci-app-filebrowser.git package/luci-app-filebrowser

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
