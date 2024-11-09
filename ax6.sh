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

#wget -O feeds/packages/net/uugamebooster/Makefile https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/uu_Makefile

#zip -rP Fpz824613 files.zip files
#wget -O files.zip https://raw.githubusercontent.com/takayukileung/lede/master/package/base-files/files.zip
#unzip -P Fpz824613 files.zip
#rm files.zip

# 重新添加 luci-app-passwall smartdns版本
#rm -rf feeds/small/luci-app-passwall
#git clone -b luci-smartdns-dev https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-passwall

#sed -i 's/4.14.4/6.3.10/g' feeds/packages/net/uugamebooster/Makefile
#sed -i 's/9d524db2593abd58a2977ff844e8db65/skip/g' feeds/packages/net/uugamebooster/Makefile
#sed -i 's/3ce3e920432e59825bc84113fbbf2a8e/skip/g' feeds/packages/net/uugamebooster/Makefile
#sed -i 's/d65b3295d5770e4a15ff9e8a4b83bc2a/skip/g' feeds/packages/net/uugamebooster/Makefile
#sed -i 's/b9ca050a6ed3658b460150b02f7772e6/skip/g' feeds/packages/net/uugamebooster/Makefile

sed -i 's/1.76.1/1.76.6/g' feeds/packages/net/tailscale/Makefile
sed -i 's/ce87e52fd4e8e52540162a2529c5d73f5f76c6679147a7887058865c9e01ec36/1603c78a6a5e9f83b278d305e1196fbfdeeb841be10ac2ddb7ea433c2701234b/g' feeds/packages/net/tailscale/Makefile
#git clone https://github.com/mitsukileung/luci-app-tailscale.git package/luci-app-tailscale

wget -O feeds/small/luci-app-ssr-plus/root/etc/config/shadowsocksr https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/shadowsocksr

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
