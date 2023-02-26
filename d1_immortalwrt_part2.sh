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
sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.15/g' target/linux/ramips/Makefile

# update frp to 0.47.0
#sed -i 's/0.46.1/0.47.0/g' feeds/packages/net/frp/Makefile
#sed -i 's/af3e8d9d4144cf520cee2609cd45fb575afe711c03cc7441dc89d0402628a869/d98ebf8638701cf8662604b9fe2fb355f91209f87edcb77f2830c7fa40ccbe37/g' feeds/packages/net/frp/Makefile

# 添加luci-theme-design
git clone -b js https://github.com/gngpp/luci-theme-design.git package/luci-theme-design

