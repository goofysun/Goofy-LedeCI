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
# Modify default IP

#sed -i 's/192.168.100.1/10.0.0.1/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168/10.0/g' package/base-files/files/bin/config_generate

# Add some default settings
./scripts/feeds install -a
./scripts/feeds update -a
