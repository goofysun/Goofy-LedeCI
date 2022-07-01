
#!/bin/bash
# 本脚本工作目录必须是git仓库的主目录
./scripts/feeds install -a
cd package/lean/
#删除会被替换或者占用安装资源的包

rm -rf qBittorrent
rm -rf luci-app-qbittorrent
rm -rf qt5
rm -rf rblibtorrent
cd ../../


rm -rf package/custom
mkdir -p package/custom
cd package/custom

#ttnode
git clone https://github.com/jerrykuku/luci-app-ttnode --depth 1

#VSSR
git clone https://github.com/jerrykuku/lua-maxminddb.git --depth 1
git clone https://github.com/fw876/helloworld --depth 1
git clone https://github.com/xiaorouji/openwrt-passwall --depth 1
git clone https://github.com/jerrykuku/luci-app-vssr.git  --depth 1

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

#adguardhome packeges
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome luci-app-adguardhome
svn co https://github.com/kenzok8/openwrt-packages/trunk/adguardhome adguardhome
#openclash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash luci-app-openclash

svn co https://github.com/kenzok8/openwrt-packages/trunk//luci-app-advanced luci-app-advanced
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-argonne luci-theme-argonne

svn co https://github.com/kenzok8/small-package/trunk/luci-app-control-webrestriction luci-app-control-webrestriction
svn co https://github.com/kenzok8/small-package/trunk/luci-app-control-weburl luci-app-control-weburl
svn co https://github.com/kenzok8/small-package/trunk/luci-app-timecontrol luci-app-timecontrol
svn co https://github.com/kenzok8/small-package/trunk/luci-app-smartdns luci-app-smartdns
svn co https://github.com/kenzok8/small-package/trunk/smartdns smartdns

#这个有新图标的主题，容易挂
cd ../../

# Add some default settings
cp -rf ../zzz-default-settings  package/lean/default-settings/files/zzz-default-settings
rm package/feeds/packages/adguardhome -rf
