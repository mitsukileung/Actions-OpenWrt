#!/bin/bash
set -eo pipefail

echo "====================================="
echo "Force update sing‑box(reF1nd fork) Makefile"
echo "====================================="

REPO="reF1nd/sing-box"
MAKEFILE_PATH="feeds/packages/net/sing-box/Makefile"

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
