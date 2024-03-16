#!/bin/bash
# 本脚本工作目录必须是git仓库的主目录

# Add Some Package
rm -rf package/custom
mkdir -p package/custom
cd package/custom
svn co https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-openvpn-server luci-app-openvpn-server
git clone https://github.com/kenzok8/openwrt-packages --depth=1
git clone --depth=1 https://github.com/Huangjoe123/luci-app-eqos
git clone https://github.com/AlexZhuo/luci-app-bandwidthd.git --depth 1
git clone https://github.com/vernesong/OpenClash -b dev --depth 1
cd ../../



# Add some default settings
./scripts/feeds update -a
./scripts/feeds install -a

sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/custom/luci-app-openvpn-server/Makefile

# Modify default IP
sed -i 's/192.168.100.1/10.0.0.1/g' package/base-files/files/bin/config_generate
sed -i 's/192.168/10.0/g' package/base-files/files/bin/config_generate

rm package/custom/openwrt-packages/luci-app-openvpn-server -rf
rm package/custom/openwrt-packages/luci-app-openclash -rf
rm package/feeds/other/luci-app-wrtbwmon -rf
rm package/feeds/packages/adguardhome -rf
rm package/feeds/other/luci-app-adguardhome -rf
