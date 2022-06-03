
#!/bin/bash
# 本脚本工作目录必须是git仓库的主目录
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


git clone https://github.com/kenzok8/small-package --depth 1
git clone https://github.com/Lienol/openwrt-package --depth 1
git clone https://github.com/AlexZhuo/luci-app-bandwidthd.git --depth 1
git clone https://github.com/destan19/OpenAppFilter --depth 1
git clone --depth=1 https://github.com/Huangjoe123/luci-app-eqos
#这个有新图标的主题，容易挂
cd ../../

# Add some default settings
cp -rf ../zzz-default-settings  package/lean/default-settings/files/zzz-default-settings
./scripts/feeds install -a
