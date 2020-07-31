

+ ![Build Lean small](https://github.com/goofysun/Goofy-LedeCI/workflows/Build%20Lean%20small/badge.svg) 精简版自动编译情况
+ ![Build-Lean-lede](https://github.com/goofysun/Goofy-LedeCI/workflows/Build-Lean-lede/badge.svg)       全量版自动编译情况
+

## 此编译源码基于 lean大 版本 https://github.com/coolsnowwolf 

## 全量包 加入 Lienol 和  kenzok8俩位大神维护的软件源
---
全量包，几乎常用的软件全部选上了

https://github.com/Lienol/openwrt-package 

https://github.com/kenzok8/small 

https://github.com/kenzok8/openwrt-packages

---

## 精简包加以下软件，感谢软件作者
---
https://github.com/openwrt/luci/trunk/applications/luci-app-acme

https://github.com/lisaac/luci-app-diskman  磁盘管理

https://github.com/lisaac/luci-app-dockerman  docker 管理界面

https://github.com/ElonH/Rclone-OpenWrt   网盘同步

https://github.com/rufengsuixing/luci-app-adguardhome  广告过滤界面

https://github.com/KFERMercer/openwrt-adguardhome      广告过滤核心

https://github.com/honwen/luci-app-aliddns             阿里ddns，个人是阿里域名，自用版本未加入全量ddns

https://github.com/jerrykuku/lua-maxminddb             helloword依赖

https://github.com/jerrykuku/luci-app-vssr             hellowrd  ，彩旗飘飘

https://github.com/jerrykuku/luci-theme-argon          argon主题，lean 大内置的 docker 会没图标

https://github.com/pymumu/openwrt-smartdns             

https://github.com/pymumu/luci-app-smartdns lede分支   智能dns管理，不一定游泳，但对于一直自定义dns的我来说，还是有点用的

---
# 编译步骤

## 1、安装编译环境
---
- swapoff /swapfile
- rm -rf /swapfile /etc/apt/sources.list.d/* /usr/share/dotnet /usr/local/lib/android /opt/ghc
- apt-get -y purge azure-cli ghc* zulu* hhvm llvm* firefox google* dotnet* powershell openjdk* mysql* php*
- apt-get -qq update
- apt-get -qq install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs gcc-multilib g++-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler antlr3 gperf curl
- apt-get -qq autoremove --purge
- apt-get -qq clean
- df -h
 ---
 ## 2、clone 编译脚本,并执行编译（全量包 执行 make.sh ，自用精简版本 使用 make_small.sh）
 
- git clone https://github.com/goofysun/Goofy-LedeCI/
- cd Goofy-LedeCI/
- chmod +x make.sh
- ./make.sh
 
 ## 3、自己选择添加插件，建议等 步骤2执行完

+ cd lede
> 添加自己想添加的插件到 package/下任意目录，如果lean大自带的话不用直接跳过这步

+ make menuconfig
> 在界面操作选择自己想添加的插件，能选择的依赖都是全的，添加 网卡 无线支持，或者 luci app

+ make download -j8 || make download -j1 V=s
+ make -j$(nproc) || make -j1 V=s
 
# 最后编译结果在 Goofy-LedeCI/lede/bin/targets/x86/64
 
