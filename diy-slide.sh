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
cd ../../

rm -rf package/custom
mkdir -p package/custom
#rm -rf package/lean/baidupcs-web
cd package/custom



git clone https://github.com/kenzok8/small
git clone https://github.com/kenzok8/openwrt-packages
git clone https://github.com/Lienol/openwrt-package

git clone https://github.com/destan19/OpenAppFilter --depth 1

#这个有新图标的主题，容易挂
cd ../../

# Add some default settings
cp -rf ../zzz-default-settings-slide  package/lean/default-settings/files/zzz-default-settings
./scripts/feeds install -a
# rm -rf package/feeds/kenzo/luci-app-adguardhome
# rm -rf package/feeds/kenzo/adguardhome
# rm -rf package/feeds/kenzo/luci-app-aliddns
