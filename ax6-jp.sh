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
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate
# Modify X86 Kernel 5.10
# sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.15/g' target/linux/x86/Makefile
# Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings
# Modify frpc default setting
sed -i 's/yourdomain.com/fpz.5150586.xyz/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
sed -i 's/1234567/LaputaShita~!/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
sed -i 's/80/57001/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
sed -i 's/443/57002/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#固件版本号添加个人标识和日期
sed -i "s/DISTRIB_DESCRIPTION='.*OpenWrt '/DISTRIB_DESCRIPTION='Mitsuki($(TZ=UTC-8 date +%Y.%m.%d))@OpenWrt '/g" package/lean/default-settings/files/zzz-default-settings

# update golang to 1.19.5
#sed -i 's/GO_VERSION_PATCH:=4/GO_VERSION_PATCH:=5/g' feeds/packages/lang/golang/golang/Makefile
#sed -i 's/eda74db4ac494800a3e66ee784e495bfbb9b8e535df924a8b01b1a8028b7f368/8e486e8e85a281fc5ce3f0bedc5b9d2dbf6276d7db0b25d3ec034f313da0375f/g' feeds/packages/lang/golang/golang/Makefile
#rm -rf feeds/packages/lang/golang/golang/patches/010-cmd-compile-turn-off-jump-tables-when-spectre-retpolines-.patch
# vemss add 'alterId'
#wget -O feeds/helloworld/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/client-config.lua https://raw.githubusercontent.com/mitsukileung/mod/main/ssrp/client-config.lua
#wget -O feeds/helloworld/luci-app-ssr-plus/luasrc/view/shadowsocksr/ssrurl.htm https://raw.githubusercontent.com/mitsukileung/mod/main/ssrp/ssrurl.htm
#wget -O feeds/helloworld/luci-app-ssr-plus/root/usr/share/shadowsocksr/gen_config.lua https://raw.githubusercontent.com/mitsukileung/mod/main/ssrp/gen_config.lua
#wget -O feeds/helloworld/luci-app-ssr-plus/root/usr/share/shadowsocksr/subscribe.lua https://raw.githubusercontent.com/mitsukileung/mod/main/ssrp/subscribe.lua
#sed -i '/-- VmessId/i\-- AlterId\no = s:option(Value, "alter_id", translate("AlterId"))\no.datatype = "port"\no.default = 16\no.rmempty = true\no:depends({type = "v2ray", v2ray_protocol = "vmess"})\n' feeds/helloworld/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/client-config.lua
#sed -i '/.*ssm.port.*/a\\t\t\tdocument.getElementsByName('cbid.shadowsocksr.' + sid + '.alter_id')[0].value = ssm.aid;' feeds/helloworld/luci-app-ssr-plus/luasrc/view/shadowsocksr/ssrurl.htm
#sed -i '/id = server.vmess_id,/a\\t\t\t\t\t\talterId = (server.v2ray_protocol == "vmess" or not server.v2ray_protocol) and tonumber(server.alter_id) or nil,' feeds/helloworld/luci-app-ssr-plus/root/usr/share/shadowsocksr/gen_config.lua
#sed -i '/result.transport = info.net/a\\t\tresult.alter_id = info.aid' feeds/helloworld/luci-app-ssr-plus/root/usr/share/shadowsocksr/subscribe.lua
#修正连接数（by ベ七秒鱼ベ）
#sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

#zip -rP Jp3895 files.zip files
wget -O files.zip https://raw.githubusercontent.com/takayukileung/lede/master/config/files.zip
unzip -P Jp3895 files.zip
rm files.zip

# update frp to 0.49.0
sed -i 's/0.47.0/0.49.0/g' feeds/packages/net/frp/Makefile
sed -i 's/d98ebf8638701cf8662604b9fe2fb355f91209f87edcb77f2830c7fa40ccbe37/8ff92d4f763d596bee35efe17f0729d36e584b93c49a7671cebde4bb318b458f/g' feeds/packages/net/frp/Makefile

# revert chinadns-ng to 2023.04.20
sed -i 's/2023.06.01/2023.04.20/g' feeds/helloworld/chinadns-ng/Makefile
sed -i 's/7c33e8a60b7618b33fce0960b94b46567766a051b307cea6b123da4176a52eab/e1f5197ecd96ebab4440fe069e0a06935df7ea07ac1ad0bab3f88bffe0055294/g' feeds/helloworld/chinadns-ng/Makefile

# update to upx 4.0.2
#rm -rf package/lean/upx/*
#wget -O package/lean/upx/Makefile https://raw.githubusercontent.com/immortalwrt/packages/master/utils/upx/Makefile
#sed -i 's/4.0.1/4.0.2/g' package/lean/upx/Makefile
#sed -i 's/77003c8e2e29aa9804e2fbaeb30f055903420b3e01d95eafe01aed957fb7e190/1221e725b1a89e06739df27fae394d6bc88aedbe12f137c630ec772522cbc76f/g' package/lean/upx/Makefile

# Modify frp
#sed -i 's/host upx\///g' feeds/packages/net/frp/Makefile
#sed -i '/lzma/d' feeds/packages/net/frp/Makefile
#sed -i 's/+wget/+wget-ssl/g' feeds/luci/applications/luci-app-frpc/Makefile
#sed -i 's/+wget/+wget-ssl/g' feeds/luci/applications/luci-app-frps/Makefile

# 重新添加 luci-app-serverchan
rm -rf feeds/luci/applications/luci-app-serverchan
git clone -b openwrt-18.06 https://github.com/tty228/luci-app-wechatpush.git package/luci-app-serverchan

# 添加 luci-app-unblockneteasemusic
#git clone -b master https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic

# 添加 smartdns
git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# 添加 adguardhome
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

# 添加 filebrowser
git clone https://github.com/takayukileung/luci-app-filebrowser.git package/luci-app-filebrowser

# 添加 OpenClash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/openclash

# 添加 luci-theme-design.git 主题
rm -rf feeds/luci/themes/luci-theme-design
rm -rf feeds/luci/applications/luci-app-design-config
git clone https://github.com/gngpp/luci-theme-design.git package/luci-theme-design
git clone https://github.com/gngpp/luci-app-design-config.git package/luci-app-design-config

echo 'refresh feeds'
./scripts/feeds update -a
./scripts/feeds install -a
