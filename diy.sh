#!/bin/bash
# 本脚本工作目录必须是git仓库的主目录 
./scripts/feeds install -a

rm -rf package/custom
mkdir -p package/custom
cd package/custom

#VSSR
git clone https://github.com/jerrykuku/lua-maxminddb.git --depth 1
git clone https://github.com/fw876/helloworld --depth 1
git clone https://github.com/xiaorouji/openwrt-passwall --depth 1
git clone https://github.com/ipenwrt/luci-app-vssr  --depth 1

#bandwidth
git clone https://github.com/AlexZhuo/luci-app-bandwidthd.git --depth 1

#app filter
git clone https://github.com/destan19/OpenAppFilter --depth 1

#speed limit
git clone --depth=1 https://github.com/Huangjoe123/luci-app-eqos
git clone --depth=1 https://github.com/loryncien/luci-app-speedlimit

#poweroff
git clone https://github.com/esirplayground/luci-app-poweroff --depth 1

#netspeedtest
git clone https://github.com/sirpdboy/netspeedtest package/netspeedtest --depth 1


git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git luci-theme-argon

git clone https://github.com/kenzok8/small --depth 1
git clone https://github.com/kenzok8/openwrt-packages --depth 1
git clone https://github.com/max0y/luci-app-cd8021x.git --depth 1

rm -rf ./openwrt-packages/luci-theme-argon

#这个有新图标的主题，容易挂
cd ../../

# Add some default settings
cp -rf ../zzz-default-settings  package/lean/default-settings/files/zzz-default-settings
rm package/feeds/packages/adguardhome -rf
