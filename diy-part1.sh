#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
#sed -i 's/#src-git helloworld/src-git helloworld/g' feeds.conf.default
#sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
sed -i '/luci/d' feeds.conf.default
sed -i '2i src-git luci https://github.com/coolsnowwolf/luci' feeds.conf.default
#sed -i '1i src-git small https://github.com/kenzok8/small' feeds.conf.default
./scripts/feeds update -a
rm -rf feeds/luci/applications/luci-app-serverchan
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/utils/v2dat
rm -rf feeds/packages/net/{chinadns-ng,dns2socks,dns2tcp,microsocks,mosdns,pdnsd-alt,sing-box,tcping,v2ray-geodata,xray-core}
#wget -O feeds/small/sing-box/Makefile https://raw.githubusercontent.com/takayukileung/JB/main/Makefile-sing-box

#wget -O feeds/small/sing-box/Makefile https://raw.githubusercontent.com/immortalwrt/packages/master/net/sing-box/Makefile
#sed -i 's/..\/..\/lang\/golang\/golang-package.mk/$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang-package.mk/g' feeds/small/sing-box/Makefile
#wget -O feeds/small/sing-box/files/sing-box.init https://raw.githubusercontent.com/immortalwrt/packages/master/net/sing-box/files/sing-box.init
#wget -O feeds/small/sing-box/files/sing-box.conf https://raw.githubusercontent.com/immortalwrt/packages/master/net/sing-box/files/sing-box.conf
#rm -f feeds/small/sing-box/files/config.json.example
#rm -rf feeds/packages/lang/golang
#git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
./scripts/feeds install -a 
