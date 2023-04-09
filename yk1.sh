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
wget -O target/linux/ramips/dts/mt7620a_youku_yk-l1.dts https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/mt7620a_youku_yk-l1.dts
wget -O target/linux/ramips/dts/mt7620a_youku_yk-l1.dtsi https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/mi_patch/mt7620a_youku_yk-l1.dtsi

# Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate
# Modify X86 Kernel 5.10
#sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g' target/linux/ramips/Makefile
# Clear the login password
#sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings
#zip -rP Jp3895 files.zip files
wget -O files.zip https://raw.githubusercontent.com/takayukileung/lede/master/target/files.zip
unzip -P Jp3895 files.zip
rm files.zip
# update to upx 4.0.2
rm -rf package/lean/upx/*
wget -O package/lean/upx/Makefile https://raw.githubusercontent.com/immortalwrt/packages/master/utils/upx/Makefile
sed -i 's/4.0.1/4.0.2/g' package/lean/upx/Makefile
sed -i 's/77003c8e2e29aa9804e2fbaeb30f055903420b3e01d95eafe01aed957fb7e190/1221e725b1a89e06739df27fae394d6bc88aedbe12f137c630ec772522cbc76f/g' package/lean/upx/Makefile

# update frp to 0.48.0
sed -i 's/0.47.0/0.48.0/g' feeds/packages/net/frp/Makefile
sed -i 's/d98ebf8638701cf8662604b9fe2fb355f91209f87edcb77f2830c7fa40ccbe37/efba8ec9fad3369ce62631369f52b78a7248df426b5b54311e96231adac5cc76/g' feeds/packages/net/frp/Makefile

#sed -i 's/0.42.0/0.47.0/g' feeds/packages/net/frp/Makefile
#sed -i 's/4bb815e9c9a4588fce20c6ef33168f0ceb1f420937c4dcf03ce085666328043a/d98ebf8638701cf8662604b9fe2fb355f91209f87edcb77f2830c7fa40ccbe37/g' feeds/packages/net/frp/Makefile
# update zerotier to 1.10.2
#sed -i 's/1.10.1/1.10.2/g' feeds/packages/net/zerotier/Makefile
#sed -i 's/1cc6b5da059486aff588fa6e6f43d20a7063569cc108bbe7254969f1cf72c968/9f98b1670785f42294b9858068d42c6b8c2fdee6402e871a36562b47559e74e7/g' feeds/packages/net/zerotier/Makefile
# 重新添加 luci-app-serverchan
rm -rf feeds/luci/applications/luci-app-serverchan
git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan

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
