

sudo swapoff /swapfile
sudo rm -rf /swapfile /etc/apt/sources.list.d/* /usr/share/dotnet /usr/local/lib/android /opt/ghc
docker rmi `docker images -q`
sudo -E apt-get -y purge azure-cli ghc* zulu* hhvm llvm* firefox google* dotnet* powershell openjdk* mysql* php*
sudo -E apt-get -qq update
sudo -E apt-get -qq install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs gcc-multilib g++-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler antlr3 gperf
sudo -E apt-get -qq autoremove --purge
sudo -E apt-get -qq clean
sudo df -h
curl -fsSL https://github.com/goofysun/Goofy-LedeCI/blob/master/.bashrc >> ~/.bashrc
sudo timedatectl set-timezone "Asia/Shanghai"   
git clone --depth 1 https://github.com/coolsnowwolf/lede
cd lede
./scripts/feeds update -a
mv ../diy2.sh diy.sh
chmod +x diy.sh
./diy.sh
mv ../x86_64_small.config .config
make defconfig
make download -j8 || make download -j1 V=s
make -j$(nproc) || make -j1 V=s
