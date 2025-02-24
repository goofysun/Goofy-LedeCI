#!/bin/bash
# 本脚本工作目录必须是git仓库的主目录
cd package/lean/
#删除会被替换或者占用安装资源的包
#rm -rf luci-theme-argon
rm -rf luci-app-adguardhome
#rm -rf luci-app-diskman
rm -rf qBittorrent
rm -rf luci-app-qbittorrent
rm -rf qt5
rm -rf rblibtorrent
rm -rf luci-theme-argon
cd ../../

rm -rf package/custom
mkdir -p package/custom
#rm -rf package/lean/baidupcs-web
cd package/custom

#VSSR
git clone https://github.com/jerrykuku/lua-maxminddb.git --depth 1
git clone https://github.com/fw876/helloworld --depth 1
git clone https://github.com/xiaorouji/openwrt-passwall --depth 1
git clone https://github.com/ipenwrt/luci-app-vssr  --depth 1

git clone https://github.com/jerrykuku/luci-theme-argon.git luci-theme-argon

git clone https://github.com/kenzok8/small
git clone https://github.com/kenzok8/openwrt-packages
rm -rf ./small/v2ray-plugin
rm -rf ./openwrt-packages/luci-theme-argon
#这个有新图标的主题，容易挂
cd ../../

# Add some default settings
cp -rf ../zzz-default-settings-slide  package/lean/default-settings/files/zzz-default-settings
./scripts/feeds install -a
# rm -rf package/feeds/kenzo/luci-app-adguardhome
# rm -rf package/feeds/kenzo/adguardhome
# rm -rf package/feeds/kenzo/luci-app-aliddns
