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
sed -i 's/yourdomain.com/frp.104300.xyz/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
sed -i 's/1234567/www.126126.xyz/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
# Add xiaomi devices
sed -i 's/#TARGET_DEVICES += redmi_ax6/TARGET_DEVICES += redmi_ax6/g' target/linux/ipq807x/image/generic.mk
sed -i 's/#TARGET_DEVICES += xiaomi_ax3600/TARGET_DEVICES += xiaomi_ax3600/g' target/linux/ipq807x/image/generic.mk
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
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# 重新添加 luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
rm -rf package/luci-theme-argon/README* package/luci-theme-argon/Screenshots/
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# 重新添加 luci-app-ipsec-server
#rm -rf package/lean/luci-app-ipsec-server
#git clone https://github.com/takayukileung/luci-app-ipsec-server.git package/luci-app-ipsec-server

# 重新添加 luci-app-aliyundrive-webdav
rm -rf feeds/luci/applications/luci-app-aliyundrive-webdav
rm -rf feeds/packages/net/aliyundrive-webdav
git clone https://github.com/messense/aliyundrive-webdav.git package/luci-app-aliyundrive-webdav

# 添加 luci-app-unblockneteasemusic
git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic

# 添加 smartdns
git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# 添加 adguardhome
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

# 添加 filebrowser
git clone https://github.com/takayukileung/luci-app-filebrowser.git package/luci-app-filebrowser

# 添加 OpenClash
git clone -b master https://github.com/vernesong/OpenClash.git package/openclash

# 添加 luci-theme-neobird 主题
git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird
