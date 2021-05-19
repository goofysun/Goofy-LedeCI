#!/bin/bash
# 本脚本工作目录必须是git仓库的主目录

# Add Some Package
rm -rf package/custom
mkdir -p package/custom
#rm -rf package/lean/baidupcs-web
cd package/custom
git clone --depth=1 https://github.com/goofysun/openwrt-packages -b goofyliu
cd ../../
# Modify default IP

#sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168/10.0/g' package/base-files/files/bin/config_generate

# Add some default settings
./scripts/feeds install -a
