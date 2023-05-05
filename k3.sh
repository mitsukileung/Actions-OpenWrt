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

# Modify default IP
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate
# Modify X86 Kernel 5.10
# sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.15/g' target/linux/x86/Makefile
# Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings
#固件版本号添加个人标识和日期
sed -i "s/DISTRIB_DESCRIPTION='.*OpenWrt '/DISTRIB_DESCRIPTION='Mitsuki($(TZ=UTC-8 date +%Y.%m.%d))@OpenWrt '/g" package/lean/default-settings/files/zzz-default-settings

echo '添加lwz322的K3屏幕插件'
rm -rf package/lean/luci-app-k3screenctrl
git clone https://github.com/yangxu52/luci-app-k3screenctrl.git package/lean/luci-app-k3screenctrl
echo '=========Add k3screen plug OK!========='

echo '替换lwz322的K3屏幕驱动插件'
rm -rf package/lean/k3screenctrl
git clone https://github.com/yangxu52/k3screenctrl_build.git package/lean/k3screenctrl/
echo '=========Replace k3screen drive plug OK!========='

sed -i 's/73a2498dc95934c225d358707e7f7d060b5ce81aa45260ada09cbd15207d27d1/5279eb1cb7555cf9292423cc9f672dc43e6e214b3411a6df26a6a1cfa59d88b7/g' feeds/helloworld/ipt2socks/Makefile
# update frp to 0.48.0
sed -i 's/0.47.0/0.48.0/g' feeds/packages/net/frp/Makefile
sed -i 's/d98ebf8638701cf8662604b9fe2fb355f91209f87edcb77f2830c7fa40ccbe37/efba8ec9fad3369ce62631369f52b78a7248df426b5b54311e96231adac5cc76/g' feeds/packages/net/frp/Makefile

#sed -i 's/1.10.2/1.10.3/g' feeds/packages/net/zerotier/Makefile
#sed -i 's/9f98b1670785f42294b9858068d42c6b8c2fdee6402e871a36562b47559e74e7/f2ce8a63a459a5fab129fb398e379b8c0875bdfeccb7bf15f9683ad22e43e629/g' feeds/packages/net/zerotier/Makefile
#wget -O feeds/packages/net/zerotier/patches/0001-fix-makefile.patch https://raw.githubusercontent.com/immortalwrt/packages/master/net/zerotier/patches/0001-fix-makefile.patch

# only build k3
sed -i 's|^TARGET_|# TARGET_|g; s|# TARGET_DEVICES += phicomm_k3|TARGET_DEVICES += phicomm_k3|' target/linux/bcm53xx/image/Makefile

#1.'asus_dhd24' 2.'ac88u_20' 3.'69027'
#firmware='asus_dhd24'
#echo '替换K3的无线驱动为asus-dhd24'
#wget -nv https://github.com/yangxu52/Phicomm-k3-Wireless-Firmware/raw/master/brcmfmac4366c-pcie.bin.${firmware} -O package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
wget -nv https://github.com/xiangfeidexiaohuo/Phicomm-K3_Wireless-Firmware/raw/master/brcmfmac4366c-pcie.bin_asus-dhd24 -O package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
#echo '=========Replace k3 wireless firmware OK!========='

# Modify frpc default setting
# sed -i 's/yourdomain.com/fpz.5150586.xyz/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
# sed -i 's/1234567/LaputaShita~!/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
# sed -i 's/80/57001/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
# sed -i 's/443/57002/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
# update golang to 1.19.5
#sed -i 's/GO_VERSION_PATCH:=4/GO_VERSION_PATCH:=5/g' feeds/packages/lang/golang/golang/Makefile
#sed -i 's/eda74db4ac494800a3e66ee784e495bfbb9b8e535df924a8b01b1a8028b7f368/8e486e8e85a281fc5ce3f0bedc5b9d2dbf6276d7db0b25d3ec034f313da0375f/g' feeds/packages/lang/golang/golang/Makefile
#rm -rf feeds/packages/lang/golang/golang/patches/010-cmd-compile-turn-off-jump-tables-when-spectre-retpolines-.patch
# update frp to 0.47.0
# sed -i 's/0.46.1/0.47.0/g' feeds/packages/net/frp/Makefile
# sed -i 's/af3e8d9d4144cf520cee2609cd45fb575afe711c03cc7441dc89d0402628a869/d98ebf8638701cf8662604b9fe2fb355f91209f87edcb77f2830c7fa40ccbe37/g' feeds/packages/net/frp/Makefile
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
# sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

#zip -rP Jp3895 files.zip files
wget -O files.zip https://raw.githubusercontent.com/takayukileung/lede/master/toolchain/files.zip
unzip -P Jp3895 files.zip
rm files.zip

# 重新添加 luci-app-serverchan
rm -rf feeds/luci/applications/luci-app-serverchan
git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan

# 重新添加 luci-app-netdata
rm -rf feeds/luci/applications/luci-app-netdata
git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata
#在rm前面加一行内容为“chmod +x /etc/init.d/netdata”
#sed -i '/rm/i chmod +x /etc/init.d/netdata' package/luci-app-netdata/root/etc/uci-defaults/40_luci-app-netdata
#sed -i 's/0/1/g' package/luci-app-netdata/root/etc/config/netdata && sed -i 's/19991/19990/g' package/luci-app-netdata/root/etc/config/netdata

# 添加 luci-app-unblockneteasemusic
#git clone -b master https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic

# 添加 smartdns
# git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
# git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# 添加 adguardhome
# git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

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
