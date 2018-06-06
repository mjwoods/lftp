#!/bin/bash -l

set -eux

gcc=/g/ns/rd/rdshare/spack/rhel7/opt/linux-rhel7-x86_64/gcc-4.8.5/gcc-6.3.0-2e3eatdtzdqkhqwf4wbm46qjcb55wvxk
readline=/g/ns/rd/rdshare/spack/rhel7/opt/linux-rhel7-x86_64/gcc-6.3.0/readline-7.0-6byl52aro5gi2xxfsdl7ogn5y7fekn6n
ncurses=/g/ns/rd/rdshare/spack/rhel7/opt/linux-rhel7-x86_64/gcc-6.3.0/ncurses-6.0-sczbwsf32mpk3nyde7z4fbg2ohdd44es
expat=/g/ns/rd/rdshare/spack/rhel7/opt/linux-rhel7-x86_64/gcc-6.3.0/expat-2.2.2-n4d4itpeli6g3r7nfsuba6oej2omhdch

export PATH=$gcc/bin:$PATH

./configure --prefix=$HOME/opt/lftp-4.8.3+ --with-openssl=yes --without-libresolv --without-gnutls \
  --with-readline=$readline \
  LDFLAGS="-L$ncurses/lib -L$readline/lib -Wl,-rpath $gcc/lib -Wl,-rpath $ncurses/lib -Wl,-rpath $readline/lib" \
  CPPFLAGS="-I$ncurses/include -I$readline/include" \
  CFLAGS="-g -O2 -fstack-protector-strong" \
  CXXFLAGS="-g -O2 -fstack-protector-strong"

make
make install

