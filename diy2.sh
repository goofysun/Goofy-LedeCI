
#!/bin/bash
# 本脚本工作目录必须是git仓库的主目录

# Add Some Package

#mkdir -p package/custom
cd package/lean
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus
git clone https://github.com/rufengsuixing/luci-app-adguardhome
git clone https://github.com/jerrykuku/luci-theme-argon
svn co https://github.com/openwrt/luci/trunk/applications/luci-app-acme
git clone https://github.com/pymumu/luci-app-smartdns -b lede
git clone https://github.com/lisaac/luci-app-diskman
mkdir parted && cp luci-app-diskman/Parted.Makefile parted/Makefile
git clone https://github.com/tty228/luci-app-serverchan
git clone https://github.com/brvphoenix/luci-app-wrtbwmon
git clone https://github.com/brvphoenix/wrtbwmon
git clone https://github.com/destan19/OpenAppFilter && mv -f OpenAppFilter/* ./
svn co https://github.com/jsda/packages2/trunk/ntlf9t/luci-app-advancedsetting
git clone https://github.com/lisaac/luci-app-dockerman
git clone https://github.com/goofysun/r8125
git clone https://github.com/ElonH/Rclone-OpenWrt && mv -f Rclone-OpenWrt/* ./
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall
svn co https://github.com/Lienol/openwrt-package/trunk/package/tcping
git clone https://github.com/pexcn/openwrt-chinadns-ng.git chinadns-ng

svn co https://github.com/vernesong/OpenClash/branches/master/luci-app-openclash
svn co https://github.com/Lienol/openwrt-package/trunk/package/ipt2socks
svn co https://github.com/solidus1983/luci-theme-opentomato/trunk/luci/themes/luci-theme-opentomato
git clone https://github.com/goofysun/openwrt-adguardhome
git clone https://github.com/goofysun/luci-app-eqos
git clone https://github.com/goofysun/luci-app-baidupcs-web

git clone https://github.com/jerrykuku/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr
git clone https://github.com/honwen/luci-app-aliddns

cd ../../

# Add some default settings
mv ../zzz-default-settings  package/lean/default-settings/files/zzz-default-settings
./scripts/feeds install -a
