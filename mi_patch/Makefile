include $(TOPDIR)/rules.mk

PKG_NAME:=upx
PKG_VERSION:=4.0.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tar.xz
PKG_SOURCE_URL:=https://github.com/upx/upx/releases/download/v$(PKG_VERSION)
PKG_MD5SUM:=9fe71235a1511e6c46b652f8c6b926bc

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/upx
    SECTION:=utils
    CATEGORY:=Utilities
    TITLE:=UPX - the Ultimate Packer for eXecutables
    URL:=https://upx.github.io/
    DEPENDS:=+libstdcpp
endef

define Package/upx/description
    UPX is an advanced executable file compressor. UPX will typically reduce the file size of programs and libraries by around 50%-70%, thus reducing disk usage, network load times, download times etc.
endef

CONFIGURE_ARGS += --disable-ucl 
    --disable-nrv2e 
    --disable-nrv2d 
    --disable-lzma 
    --disable-fuzzer

CONFIGURE_VARS += 
    ac_cv_prog_CXX_11=no

MAKE_FLAGS += 
    CXXFLAGS='$(FPIC) -Os -fno-builtin -fno-rtti -fno-exceptions -std=c++03'

define Build/Prepare
    mkdir -p $(PKG_BUILD_DIR)
    $(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Configure
    $(call Build/Configure/Default,--prefix=/usr)
endef

define Build/Install
    $(INSTALL_DIR) $(1)/usr/bin
    $(INSTALL_BIN) $(PKG_BUILD_DIR)/src/upx $(1)/usr/bin
endef

$(eval $(call BuildPackage,upx))
