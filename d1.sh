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
sed -i 's/192.168.1.1/192.168.28.1/g' package/base-files/files/bin/config_generate
# Modify Kernel 5.15
sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g' target/linux/x86/Makefile
# Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings
#zip -rP Jp3895 files.zip files
#wget -O files.zip https://raw.githubusercontent.com/takayukileung/lede/master/scripts/config/files.zip
#unzip -P Jp3895 files.zip
#rm files.zip

# update to upx 4.0.2
cd package/lean/upx
rm -rf *
wget -O Makefile https://raw.githubusercontent.com/mitsukileung/Actions-OpenWrt/main/patch/Makefile

# Modify frp
#sed -i 's/host upx\///g' feeds/packages/net/frp/Makefile
#sed -i '/lzma/d' feeds/packages/net/frp/Makefile
#sed -i 's/+wget/+wget-ssl/g' feeds/luci/applications/luci-app-frpc/Makefile
#sed -i 's/+wget/+wget-ssl/g' feeds/luci/applications/luci-app-frps/Makefile

# update frp to 0.47.0
#sed -i 's/0.47.0/0.45.0/g' feeds/packages/net/frp/Makefile
#sed -i 's/d98ebf8638701cf8662604b9fe2fb355f91209f87edcb77f2830c7fa40ccbe37/829cf9f14861ab1b074de6995282f30292f53513824372cfec4084a2e8de7123/g' feeds/packages/net/frp/Makefile

# 重新添加 luci-app-serverchan
rm -rf feeds/luci/applications/luci-app-serverchan
git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan

# 添加 luci-app-unblockneteasemusic
#git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic

# 添加 filebrowser
git clone https://github.com/takayukileung/luci-app-filebrowser.git package/luci-app-filebrowser

# 添加 OpenClash
#svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/openclash

# 添加 luci-theme-neobird 主题
git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird

# 添加 luci-theme-design.git 主题
#git clone https://github.com/gngpp/luci-theme-design.git package/luci-theme-design

echo 'refresh feeds'
./scripts/feeds update -a
./scripts/feeds install -a
