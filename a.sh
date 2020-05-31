sudo apt-get update && sudo apt-get install libgnutls28-dev nettle-dev libgmp-dev libssh2-1-dev libc-ares-dev libxml2-dev zlib1g-dev libsqlite3-dev pkg-config libcppunit-dev autoconf automake autotools-dev autopoint libtool git gcc g++ libxml2-dev make quilt
rm -rf aria2
git clone https://github.com/aria2/aria2.git
cd aria2
find . -name ".git" | xargs rm -rf
quilt new 2048Threads
quilt add ./src/OptionHandlerFactory.cc
sed -i s"/1\, 16\,/1\, 2048\,/" ./src/OptionHandlerFactory.cc
autoreconf -i
./configure
make -j16
sudo rm /usr/bin/aria2c
cp ./src/aria2c /usr/bin
mkdir bin
cp ./src/aria2c bin
