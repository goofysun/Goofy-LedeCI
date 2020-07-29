
#!/bin/bash
# 本脚本工作目录必须是git仓库的主目录
cd package/lean/
#删除会被替换或者占用安装资源的包
#rm -rf luci-theme-argon
rm -rf luci-app-diskman
rm -rf luci-app-wrtbwmon
rm -rf qBittorrent
rm -rf luci-app-qbittorrent
rm -rf qt5
rm -rf rblibtorrent
git clone https://github.com/lisaac/luci-app-diskman
git clone https://github.com/brvphoenix/luci-app-wrtbwmon
git clone https://github.com/brvphoenix/wrtbwmon
git clone https://github.com/lisaac/luci-app-dockerman
git clone https://github.com/ElonH/Rclone-OpenWrt && mv -f Rclone-OpenWrt/* ./
#adguard home
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome
svn co https://github.com/kenzok8/openwrt-packages/trunk/adguardhome
git clone https://github.com/honwen/luci-app-aliddns
#helloworld
git clone https://github.com/jerrykuku/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr
#git clone https://github.com/jerrykuku/luci-theme-argon -b lede
#smartdns
git clone https://github.com/pymumu/openwrt-smartdns
git clone https://github.com/pymumu/luci-app-smartdns -b lede
#ssr
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus
#filemanager
svn co https://github.com/Lienol/openwrt-package/trunk/lienol/luci-app-fileassistant
#passwall
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall
svn co https://github.com/Lienol/openwrt-package/trunk/package/tcping
git clone https://github.com/pexcn/openwrt-chinadns-ng.git chinadns-ng
svn co https://github.com/Lienol/openwrt-package/trunk/package/brook
#svn co https://github.com/jsda/packages2/trunk/ntlf9t/luci-app-advancedsetting
svn co https://github.com/vernesong/OpenClash/tags/v0.38.8-beta/luci-app-openclash
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-advancedsetting

cd ../../

# Add some default settings
cp -rf ../zzz-default-settings  package/lean/default-settings/files/zzz-default-settings
./scripts/feeds install -a
# rm -rf package/feeds/kenzo/luci-app-adguardhome
# rm -rf package/feeds/kenzo/adguardhome
# rm -rf package/feeds/kenzo/luci-app-aliddns
