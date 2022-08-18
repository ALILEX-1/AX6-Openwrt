#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1-5.15-robimarko.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >> feeds.conf.default
#echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall;packages' >> feeds.conf.default
#echo 'src-git passwall_luci https://github.com/xiaorouji/openwrt-passwall;luci' >> feeds.conf.default
echo 'src-git kenzo https://github.com/kenzok8/small-package' >> feeds.conf.default
#echo 'src-git lienol https://github.com/Lienol/openwrt-package' >> feeds.conf.default
echo 'src-git Boos https://github.com/Boos4721/OpenWrt-Packages' >> feeds.conf.default
echo 'src-link custom /workdir/openwrt/custom-feed' >> feeds.conf.default



mkdir -p package/helloworld
for i in "dns2socks" "microsocks" "ipt2socks" "redsocks2"; do \
  svn checkout "https://github.com/immortalwrt/packages/trunk/net/$i" "package/helloworld/$i"; \
done

mkdir custom-feed

for i in "luci.mk"; do \
  svn export "https://github.com/coolsnowwolf/luci/trunk/$i" "custom-feed/$i"; \
done

mkdir custom-feed/applications

for i in "ipv6-helper"; do \
  svn checkout "https://github.com/coolsnowwolf/lede/trunk/package/lean/$i" "custom-feed/applications/$i"; \
done

for i in "luci-app-vlmcsd"; do \
  svn checkout "https://github.com/coolsnowwolf/luci/trunk/applications/$i" "custom-feed/applications/$i"; \
done

for i in "vlmcsd"; do \
  svn checkout "https://github.com/coolsnowwolf/packages/trunk/net/$i" "custom-feed/applications/$i"; \
done
