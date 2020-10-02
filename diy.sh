#!/bin/bash
# 本脚本工作目录必须是git仓库的主目录

# Add Some Package
#sed -i 's/5.4/4.19/g' ./target/linux/x86/Makefile
rm -rf package/custom
mkdir -p package/custom
#rm -rf package/lean/baidupcs-web
cd package/custom
#git https://github.com/KFERMercer/openwrt-baidupcs-web
#git clone https://github.com/coolsnowwolf/packages
git clone https://github.com/kenzok8/small
#修复small库里面V2ray 路径错误问题
rm -rf ./small/v2ray
git clone https://github.com/kenzok8/openwrt-packages
git clone https://github.com/Lienol/openwrt-package
#kenzok8 已包含 git clone https://github.com/fw876/helloworld
#kenzok8 已包含 git clone https://github.com/openwrt-develop/luci-theme-atmaterial
#kenzok8 已包含 git clone https://github.com/vernesong/OpenClash
git clone https://github.com/tty228/luci-app-serverchan
git clone https://github.com/rufengsuixing/luci-app-adguardhome
git clone https://github.com/jerrykuku/luci-theme-argon -b 18.06
git clone https://github.com/lisaac/luci-app-dockerman
git clone https://github.com/jerrykuku/lua-maxminddb.git
git clone https://github.com/jerrykuku/luci-app-vssr.git
git clone https://github.com/honwen/luci-app-aliddns
git clone https://github.com/goofysun/luci-app-koolproxyR
#svn co https://github.com/jsda/packages2/trunk/ntlf9t/luci-app-advancedsetting
#git clone https://github.com/pymumu/openwrt-smartdns smartdns
#git clone https://github.com/pymumu/luci-app-smartdns -b lede

cd ../../
# Modify default IP

#sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168/10.0/g' package/base-files/files/bin/config_generate

# Add some default settings

#\cp -rf ../lede/zzz-default-settings package/lean/default-settings/files/zzz-default-settings
cp -rf ../zzz-default-settings  package/lean/default-settings/files/zzz-default-settings
./scripts/feeds install -a
