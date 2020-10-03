
#!/bin/bash
# 本脚本工作目录必须是git仓库的主目录
cd package/lean/
#删除会被替换或者占用安装资源的包
rm -rf luci-theme-argon
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

#git clone https://github.com/lisaac/luci-app-diskman
git clone https://github.com/lisaac/luci-app-dockerman
git clone https://github.com/goofysun/luci-app-koolproxyR
#git clone https://github.com/ElonH/Rclone-OpenWrt && mv -f Rclone-OpenWrt/* ./
git clone https://github.com/honwen/luci-app-aliddns
#helloworld
git clone https://github.com/jerrykuku/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr
#smartdns
#git clone https://github.com/pymumu/openwrt-smartdns
#git clone https://github.com/pymumu/luci-app-smartdns -b lede

#git https://github.com/KFERMercer/openwrt-baidupcs-web
#git clone https://github.com/coolsnowwolf/packages
git clone https://github.com/kenzok8/small
git clone https://github.com/kenzok8/openwrt-packages
rm -rf  ./openwrt-packages/luci-app-aliddns
git clone https://github.com/Lienol/openwrt-package

#修复small库里面V2ray 路径错误问题
rm -rf ./small/v2ray
rm -rf ./openwrt-package/package/v2ray
rm -rf ./openwrt-packages/package/v2ray
rm -rf ./openwrt-packages/luci-app-aliddns
rm -rf ./openwrt-package/package/v2ray-plugin
rm -rf ./openwrt-packages/package/v2ray-plugin
rm -rf ./small/v2ray-plugin
#kenzok8 已包含 git clone https://github.com/fw876/helloworld
#kenzok8 已包含 git clone https://github.com/openwrt-develop/luci-theme-atmaterial
#kenzok8 已包含 git clone https://github.com/vernesong/OpenClash
#git clone https://github.com/tty228/luci-app-serverchan
#git clone https://github.com/rufengsuixing/luci-app-adguardhome
git clone https://github.com/jerrykuku/luci-theme-argon -b 18.06
#这个有新图标的主题，容易挂
cd ../../

# Add some default settings
cp -rf ../zzz-default-settings  package/lean/default-settings/files/zzz-default-settings
./scripts/feeds install -a
# rm -rf package/feeds/kenzo/luci-app-adguardhome
# rm -rf package/feeds/kenzo/adguardhome
# rm -rf package/feeds/kenzo/luci-app-aliddns
