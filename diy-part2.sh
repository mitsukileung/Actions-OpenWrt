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
sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.4/g' target/linux/x86/Makefile
# Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings
# Modify frpc default setting
sed -i 's/yourdomain.com/frp.104300.xyz/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
sed -i 's/1234567/www.126126.xyz/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#固件版本号添加个人标识和日期
sed -i "s/DISTRIB_DESCRIPTION='.*OpenWrt '/DISTRIB_DESCRIPTION='Mitsuki($(TZ=UTC-8 date +%Y.%m.%d))@OpenWrt '/g" package/lean/default-settings/files/zzz-default-settings
# Add xiaomi devices
#sed -i 's/#TARGET_DEVICES += redmi_ax6/TARGET_DEVICES += redmi_ax6/g' target/linux/ipq807x/image/generic.mk
#sed -i 's/#TARGET_DEVICES += xiaomi_ax3600/TARGET_DEVICES += xiaomi_ax3600/g' target/linux/ipq807x/image/generic.mk
# update golang to 1.19.5
#sed -i 's/GO_VERSION_PATCH:=4/GO_VERSION_PATCH:=5/g' feeds/packages/lang/golang/golang/Makefile
#sed -i 's/eda74db4ac494800a3e66ee784e495bfbb9b8e535df924a8b01b1a8028b7f368/8e486e8e85a281fc5ce3f0bedc5b9d2dbf6276d7db0b25d3ec034f313da0375f/g' feeds/packages/lang/golang/golang/Makefile
#rm -rf feeds/packages/lang/golang/golang/patches/010-cmd-compile-turn-off-jump-tables-when-spectre-retpolines-.patch
# update frp to 0.48.0
sed -i 's/0.47.0/0.48.0/g' feeds/packages/net/frp/Makefile
sed -i 's/d98ebf8638701cf8662604b9fe2fb355f91209f87edcb77f2830c7fa40ccbe37/efba8ec9fad3369ce62631369f52b78a7248df426b5b54311e96231adac5cc76/g' feeds/packages/net/frp/Makefile
sed -i 's/73a2498dc95934c225d358707e7f7d060b5ce81aa45260ada09cbd15207d27d1/5279eb1cb7555cf9292423cc9f672dc43e6e214b3411a6df26a6a1cfa59d88b7/g' feeds/helloworld/ipt2socks/Makefile
# update to upx 4.0.2
#rm -rf package/lean/upx/*
#wget -O package/lean/upx/Makefile https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/patch/Makefile
#zip -rP Fpz824613 files.zip files
#wget -O files.zip https://raw.githubusercontent.com/takayukileung/lede/master/package/base-files/files.zip
#unzip -P Fpz824613 files.zip
#rm files.zip
# 重新添加 luci-theme-argon
#rm -rf feeds/luci/themes/luci-theme-argon
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#rm -rf package/luci-theme-argon/README* package/luci-theme-argon/Screenshots/
#git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# 重新添加 luci-app-serverchan
rm -rf feeds/luci/applications/luci-app-serverchan
git clone -b openwrt-18.06 https://github.com/tty228/luci-app-wechatpush.git

# 重新添加 luci-app-netdata
rm -rf feeds/luci/applications/luci-app-netdata
git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata
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
rm -rf feeds/luci/applications/luci-app-pushbot
git clone https://github.com/zzsj0928/luci-app-pushbot.git package/luci-app-pushbot

# 添加 smartdns
#git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# 添加 adguardhome
#git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

# 添加 filebrowser
git clone https://github.com/takayukileung/luci-app-filebrowser.git package/luci-app-filebrowser

# 添加 OpenClash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/openclash

# 添加 luci-theme-neobird 主题
#git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird

# 添加 luci-theme-design.git 主题
rm -rf feeds/luci/themes/luci-theme-design
rm -rf feeds/luci/applications/luci-app-design-config
git clone https://github.com/gngpp/luci-theme-design.git package/luci-theme-design
git clone https://github.com/gngpp/luci-app-design-config.git package/luci-app-design-config

echo 'refresh feeds'
./scripts/feeds update -a
./scripts/feeds install -a
