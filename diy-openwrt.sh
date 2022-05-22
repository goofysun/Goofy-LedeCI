#!/bin/bash
# 本脚本工作目录必须是git仓库的主目录

# Add Some Package
rm -rf package/custom
mkdir -p package/custom
#rm -rf package/lean/baidupcs-web
cd package/custom
git clone --depth=1 https://github.com/siwind/openwrt-vlmcsd
git clone --depth=1 https://github.com/siwind/luci-app-vlmcsd
git clone --depth=1 https://github.com/jerrykuku/luci-app-jd-dailybonus
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/vernesong/OpenClash
svn co https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-openvpn-server luci-app-openvpn-server
git clone --depth=1 https://github.com/brvphoenix/wrtbwmon
git clone --depth=1 https://github.com/brvphoenix/luci-app-wrtbwmon
# mwan3helper
svn co https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-mwan3helper luci-app-mwan3helper
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ddns-scripts_aliyun ddns-scripts_aliyun

#helloworld
#git clone https://github.com/jerrykuku/lua-maxminddb
#git clone https://github.com/jerrykuku/luci-app-vssr

git clone https://github.com/kenzok8/small --depth 1
git clone https://github.com/kenzok8/openwrt-packages --depth 1
rm -rf  ./openwrt-packages/luci-app-aliddns 
git clone https://github.com/Lienol/openwrt-package --depth 1
git clone https://github.com/AlexZhuo/luci-app-bandwidthd.git --depth 1
#修复small库里面V2ray 路径错误问题
rm -rf ./small/v2ray
rm -rf ./openwrt-package/package/v2ray
rm -rf ./openwrt-packages/package/v2ray
rm -rf ./openwrt-packages/luci-app-aliddns
rm -rf ./openwrt-package/package/v2ray-plugin
rm -rf ./openwrt-packages/package/v2ray-plugin
rm -rf ./openwrt-packages/luci-app-openclash
rm -rf ./small/v2ray-plugin

cd ../../

### Fullcone-NAT 部分 ###
# Patch Kernel 以解决 FullCone 冲突
#pushd target/linux/generic/hack-5.10
#wget https://github.com/coolsnowwolf/lede/raw/master/target/linux/generic/hack-5.10/952-net-conntrack-events-support-multiple-registrant.patch
#popd
# Patch FireWall 以增添 FullCone 功能
# FW4
mkdir package/network/config/firewall4/patches
wget -P package/network/config/firewall4/patches/ https://github.com/wongsyrone/lede-1/raw/master/package/network/config/firewall4/patches/999-01-firewall4-add-fullcone-support.patch
sed -i 's/-1,3 +1,5/-2,3 +2,5/g' package/network/config/firewall4/patches/999-01-firewall4-add-fullcone-support.patch
mkdir package/libs/libnftnl/patches
wget -P package/libs/libnftnl/patches/ https://github.com/wongsyrone/lede-1/raw/master/package/libs/libnftnl/patches/999-01-libnftnl-add-fullcone-expression-support.patch
sed -i '/PKG_LICENSE_FILES/a PKG_FIXUP:=autoreconf' package/libs/libnftnl/Makefile
mkdir package/network/utils/nftables/patches
wget -P package/network/utils/nftables/patches/ https://github.com/wongsyrone/lede-1/raw/master/package/network/utils/nftables/patches/999-01-nftables-add-fullcone-expression-support.patch
# FW3
mkdir package/network/config/firewall/patches
wget -P package/network/config/firewall/patches/ https://github.com/immortalwrt/immortalwrt/raw/openwrt-21.02/package/network/config/firewall/patches/fullconenat.patch
wget -qO- https://github.com/msylgj/R2S-R4S-OpenWrt/raw/master/PATCHES/001-fix-firewall3-flock.patch | patch -p1
# Patch LuCI 以增添 FullCone 开关
patch -p1 <../PATCH/firewall/luci-app-firewall_add_fullcone.patch
# FullCone PKG
git clone --depth 1 https://github.com/fullcone-nat-nftables/nft-fullcone package/new/nft-fullcone
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/openwrt-fullconenat package/lean/openwrt-fullconenat
pushd package/lean/openwrt-fullconenat
patch -p2 <../../../../PATCH/firewall/fullcone6.patch
popd



sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/custom/luci-app-mwan3helper/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/custom/luci-app-openvpn-server/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/custom/ddns-scripts_aliyun/Makefile
# Modify default IP
#sed -i 's/192.168.100.1/10.0.0.1/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168/10.0/g' package/base-files/files/bin/config_generate

# Add some default settings
./scripts/feeds install -a
./scripts/feeds update -a
