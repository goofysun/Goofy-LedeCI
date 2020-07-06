sudo rm -rf /etc/apt/sources.list.d/* /usr/share/dotnet /usr/local/lib/android /opt/ghc
docker container stop $(docker container ls -a -q) && docker system prune --all --force --volumns
sudo -E apt-get -y purge azure-cli ghc* zulu* hhvm llvm* firefox google* dotnet* powershell openjdk* mysql* php* docker*
sudo -E apt-get -qq update
sudo -E apt-get -qq install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib g++-multilib p7zip p7zip-full msmtp libssl-dev texinfo libreadline-dev libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint ccache curl wget vim nano python python3 python-pip python3-pip python-ply python3-ply haveged lrzsz device-tree-compiler scons antlr3 gperf ecj fastjar mkisofs
sudo -E apt-get -qq autoremove --purge
sudo -E apt-get -qq clean
sudo ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
sudo df -h

curl -fsSL https://github.com/goofysun/Goofy-LedeCI/blob/master/.bashrc >> ~/.bashrc
sudo timedatectl set-timezone "Asia/Shanghai"   
if [ -d "lede" ];then
  cd lede
#清理 上次编译的残留插件，方便更新
  rm -rf package/lean
  rm -rf package/custom
  git reset --hard
  git checkout master
  git pull
else
  git clone  https://github.com/coolsnowwolf/lede
cd lede
fi
./scripts/feeds update -a
cp -rf ../diy.sh diy.sh
chmod +x diy.sh
./diy.sh
cp -rf ../x86_64.config .config
make defconfig
make download -j8 || make download -j1 V=s
make -j$(nproc) || make -j1 V=s
