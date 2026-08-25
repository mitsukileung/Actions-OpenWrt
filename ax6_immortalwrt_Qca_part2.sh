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
#sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.15/g' target/linux/ipq807x/Makefile
# Clear the login password
#sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings
# Modify frpc default setting
#sed -i 's/yourdomain.com/fpz.5150586.xyz/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#sed -i 's/1234567/LaputaShita~!/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#sed -i 's/80/57001/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp
#sed -i 's/443/57002/g' feeds/luci/applications/luci-app-frpc/root/etc/config/frp

sed -i 's/8056c2e21c000001/9f77fc393e758059/g' feeds/packages/net/zerotier/files/etc/config/zerotier

rm -rf feeds/packages/net/geoview
mkdir package/geoview
wget -O package/geoview/Makefile https://raw.githubusercontent.com/xiaorouji/openwrt-passwall-packages/refs/heads/main/geoview/Makefile

git clone https://github.com/gdy666/luci-app-lucky.git package/lucky

git clone https://github.com/Tokisaki-Galaxy/luci-app-tailscale-community.git package/luci-app-tailscale-community

#修正连接数（by ベ七秒鱼ベ）
#sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# 重新添加 luci-theme-argon
#rm -rf feeds/luci/themes/luci-theme-argon
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#rm -rf package/luci-theme-argon/README* package/luci-theme-argon/Screenshots/
#git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

#git clone https://github.com/derisamedia/luci-theme-alpha-reborn.git package/luci-theme-alpha-reborn

# 添加 aurora 主题&设置
git clone https://github.com/eamonxg/luci-theme-aurora.git package/luci-theme-aurora
git clone https://github.com/eamonxg/luci-app-aurora-config.git package/luci-app-aurora-config
sed -i "s/nav_type '.*'/nav_type 'dropdown'/g" $(find ./package/luci-app-aurora-config/root/usr/share/aurora/ -type f -name "*.template")

# 重新添加 luci-app-homeproxy
rm -rf feeds/packages/net/sing-box
rm -rf feeds/luci/applications/luci-app-homeproxy
git clone https://github.com/VIKINGYFY/packages.git package/vikingyfy

set -eo pipefail
REPO="reF1nd/sing-box"
MAKEFILE_PATH="package/vikingyfy/sing-box/Makefile"

if [ ! -f "${MAKEFILE_PATH}" ];then
    echo "WARN: ${MAKEFILE_PATH} not found, skip sing‑box update"
else
    set +e
    # curl：重试3次，总超时30秒，允许非200返回
    RAW_TAGS=$(curl --retry 3 --max-time 30 -fsSL "https://api.github.com/repos/${REPO}/tags?per_page=30")
    CURL_RET=$?
    set -e

    if [ ${CURL_RET} -ne 0 ];then
        echo "⚠️ GitHub API network failed(timeout/429/connect error), skip sing‑box update."
    else
        REF_TAGS=$(echo "${RAW_TAGS}" | grep -oP '"name": "\K(.*)(?=")' | grep -i -- '-ref1nd')
        if [ -z "${REF_TAGS}" ];then
            echo "⚠️ No tag with '-reF1nd' suffix found, skip sing‑box update."
        else
            LATEST_FULL_TAG=$(echo "${REF_TAGS}" | head -n1)
            LATEST_UPSTREAM_VER="${LATEST_FULL_TAG#v}"

            # 版本转换规则
            LATEST_PKG_VER=$(echo "${LATEST_UPSTREAM_VER}" \
                | sed -e 's/-reF1nd$//I' -e 's/-/_/1' -e 's/\.\([0-9]*\)$/\1/')

            echo "Latest full tag: ${LATEST_FULL_TAG}"
            echo "PKG_UPSTREAM_VERSION=${LATEST_UPSTREAM_VER}"
            echo "PKG_VERSION=${LATEST_PKG_VER}"

            echo "🔔 Try download tarball ..."
            SRC_URL="https://github.com/${REPO}/archive/refs/tags/${LATEST_FULL_TAG}.tar.gz"
            TMP_TAR=$(mktemp)
            TMP_HTTP=$(mktemp)

            set +e
            curl --retry 3 --max-time 35 -fsSL -w "%{http_code}" -o "${TMP_TAR}" "${SRC_URL}" > "${TMP_HTTP}"
            HTTP_CODE=$(cat "${TMP_HTTP}")
            set -e

            if [[ "${HTTP_CODE}" != "200" ]];then
                echo "⚠️ Source tarball download failed, HTTP ${HTTP_CODE}, skip update."
                rm -f "${TMP_TAR}" "${TMP_HTTP}"
            else
                NEW_HASH=$(sha256sum "${TMP_TAR}" | awk '{print $1}')
                rm -f "${TMP_TAR}" "${TMP_HTTP}"
                echo "New PKG_HASH=${NEW_HASH}"

                sed -i \
                    -e "s/^PKG_UPSTREAM_VERSION:=.*/PKG_UPSTREAM_VERSION:=${LATEST_UPSTREAM_VER}/" \
                    -e "s/^PKG_VERSION:=.*/PKG_VERSION:=${LATEST_PKG_VER}/" \
                    -e "s|^PKG_SOURCE_URL:=.*|PKG_SOURCE_URL:=https://codeload.github.com/reF1nd/sing-box/tar.gz/v\$(PKG_UPSTREAM_VERSION)?|" \
                    -e "s/^PKG_HASH:=.*/PKG_HASH:=${NEW_HASH}/" \
                    "${MAKEFILE_PATH}"

                echo "✅ Makefile force patched completed."
            fi
        fi
    fi
fi


# 重新添加 luci-app-openclash
rm -rf feeds/luci/applications/luci-app-openclash
git clone --filter=blob:none --branch=dev https://github.com/vernesong/OpenClash.git package/luci-app-openclash

# 重新添加 luci-app-passwall
rm -rf feeds/luci/applications/luci-app-passwall
git clone https://github.com/Openwrt-Passwall/openwrt-passwall package/passwall-luci

# 重新添加 luci-app-socat 同时兼容firewall3/4 
#rm -rf feeds/luci/applications/luci-app-socat
#git clone https://github.com/chenmozhijin/luci-app-socat.git package/luci-app-socat

# 重新添加 luci-app-wechatpush
#rm -rf feeds/luci/applications/luci-app-wechatpush
#git clone https://github.com/tty228/luci-app-wechatpush.git package/luci-app-wechatpush

# 添加 OpenWrt-nikki
git clone https://github.com/nikkinikki-org/OpenWrt-nikki.git package/OpenWrt-nikki

# 添加 luci-app-taskplan
git clone https://github.com/sirpdboy/luci-app-taskplan.git package/luci-app-taskplan

# 添加 smartdns
#git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# 添加 adguardhome
#git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

#git clone https://github.com/derisamedia/luci-theme-alpha.git package/luci-theme-alpha

echo 'refresh feeds'
./scripts/feeds update -a
./scripts/feeds install -a
