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

#修复yk-l1(32M固件)软重启Bug
#sed -i 's/flash@0/flash0: flash@0/g' target/linux/ramips/dts/mt7620a_youku_yk-l1.dtsi
#sed -i '/&firmware/i\&flash0 {' target/linux/ramips/dts/mt7620a_youku_yk-l1.dts
#sed -i '/&firmware/i\	broken-flash-reset;' target/linux/ramips/dts/mt7620a_youku_yk-l1.dts
#sed -i '/&firmware/i\};' target/linux/ramips/dts/mt7620a_youku_yk-l1.dts
#sed -i '/&firmware/i\\r' target/linux/ramips/dts/mt7620a_youku_yk-l1.dts
#wget -O target/linux/ramips/dts/mt7620a_youku_yk-l1.dts https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/mt7620a_youku_yk-l1.dts
#wget -O target/linux/ramips/dts/mt7620a_youku_yk-l1.dtsi https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/mt7620a_youku_yk-l1.dtsi

# Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate
# Modify X86 Kernel 5.10
#sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g' target/linux/ramips/Makefile
# Clear the login password
#sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings
#固件版本号添加个人标识和日期
sed -i "s/DISTRIB_DESCRIPTION='.*OpenWrt '/DISTRIB_DESCRIPTION='Mitsuki($(TZ=UTC-8 date +%Y.%m.%d))@OpenWrt '/g" package/lean/default-settings/files/zzz-default-settings
#zip -rP Jp3895 files.zip files
wget -O files.zip https://raw.githubusercontent.com/takayukileung/lede/master/target/files.zip
unzip -P Jp3895 files.zip
rm files.zip

sed -i 's/golang\/host upx\/host/golang\/host/g' feeds/packages/net/frp/Makefile

# update frp to 0.51.3
#sed -i 's/0.47.0/0.51.3/g' feeds/packages/net/frp/Makefile
#sed -i 's/d98ebf8638701cf8662604b9fe2fb355f91209f87edcb77f2830c7fa40ccbe37/83032399773901348c660d41c967530e794ab58172ccd070db89d5e50d915fef/g' feeds/packages/net/frp/Makefile

# revert chinadns-ng to 2023.04.20
#sed -i 's/2023.06.01/2023.04.20/g' feeds/helloworld/chinadns-ng/Makefile
#sed -i 's/7c33e8a60b7618b33fce0960b94b46567766a051b307cea6b123da4176a52eab/e1f5197ecd96ebab4440fe069e0a06935df7ea07ac1ad0bab3f88bffe0055294/g' feeds/helloworld/chinadns-ng/Makefile

# 重新添加 luci-app-serverchan
rm -rf feeds/luci/applications/luci-app-serverchan
git clone -b openwrt-18.06 https://github.com/tty228/luci-app-wechatpush.git package/luci-app-serverchan

# 添加 luci-app-unblockneteasemusic
#git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic

# 添加 filebrowser
#git clone https://github.com/takayukileung/luci-app-filebrowser.git package/luci-app-filebrowser

# 添加 OpenClash
#svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/openclash

# 添加 luci-theme-neobird 主题
#git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird

# 添加 luci-theme-design.git 主题
#git clone https://github.com/gngpp/luci-theme-design.git package/luci-theme-design

echo 'refresh feeds'
./scripts/feeds update -a
./scripts/feeds install -a
