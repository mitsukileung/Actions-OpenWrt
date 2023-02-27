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
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate
# Modify X86 Kernel 5.10
# sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.15/g' target/linux/x86/Makefile
# Clear the login password
#sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings
#zip -rP Jp3895 files.zip files
#wget -O files.zip https://raw.githubusercontent.com/takayukileung/lede/master/target/files.zip
#unzip -P Jp3895 files.zip
#rm files.zip
# update frp to 0.47.0
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
