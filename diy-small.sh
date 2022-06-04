
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

#sirpdboy packeges
git clone https://github.com/sirpdboy/sirpdboy-package --depth 1

#openclash
git clone https://github.com/yuos-bit/luci-app-openclash.git --depth 1
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash luci-app-openclash
#这个有新图标的主题，容易挂
cd ../../

# Add some default settings
cp -rf ../zzz-default-settings  package/lean/default-settings/files/zzz-default-settings

