Received: from siberian.tulip.relay.mailchannels.net (siberian.tulip.relay.mailchannels.net [23.83.218.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FB32FD1CE
	for <spacemit@lists.linux.dev>; Mon, 10 Nov 2025 22:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.246
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762812415; cv=pass; b=LNSWGDmbWyynN2blJAqDzvBvNdR69dVjTL1ouhw3fZoKDBMuf8ZpksFQn9Rspkl/s7eyhcczmzu9l36Kh1bbCVmuEhriWT0WZCI3B26nKa96uIMInRC0sfjgnqoK7ltmdO6s8aYkc5fkfgXuzO0QVdOYre14poEtjENw7FyF+i8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762812415; c=relaxed/simple;
	bh=pPP5bsjDvtwhRWGVtl2pJUnAvUnCj9JPH7aLlQoOAFg=;
	h=From:To:Cc:Subject:Message-ID:MIME-Version:Date; b=px6SkIniVJVWlWec2aPn8DIec3nMBCsypRLGbD4BaRCJAFL7pkKVVjK2DRrOfy4j3LU8wMt5CBH7Rlk0wPu5VFCf4qKLwjLj4ny8q3PbamBlu2GpBsAC/1AJpJNTO6JqQn0SQdZouzulMtsB2fdcJSMAXcasovtPunCbmPzh0WA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=rnFm6VOa; arc=pass smtp.client-ip=23.83.218.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="rnFm6VOa"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1AC54161228;
	Mon, 10 Nov 2025 22:06:52 +0000 (UTC)
Received: from fr-int-smtpout26.hostinger.io (100-123-217-50.trex-nlb.outbound.svc.cluster.local [100.123.217.50])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 38CFD16113D;
	Mon, 10 Nov 2025 22:06:50 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1762812411; a=rsa-sha256;
	cv=none;
	b=nyD+Cg3dH5Bszer3V2vQOCVyNVtfQssf2W873A38k1p/yL+H6+kej/7kdi1oWhGlHEZwT0
	AbzS4O85Ic1btlwyrdHoKIHB9+cy0hHCk2z+jSBA44IKmGMooT8T+5XkzEcB5QDi9Fvsji
	Fu8lTJ/IFW5butqOglmZ+Zm2S0bDqbkj7U/eJo5pdM+Pg+h5gq+JAyC3u8HjQx+r4mkfmu
	xB0zff0C39l8msyGehZZOlabDs8g57DLLJqcOSISig7IukIU0lNVhpOAqOT9uhHOf30lnq
	JREF7NYFMPEKKoK1RA/d7PWjiiXqLWBok6WvYwiC2M1yfEv76C5VwWZ6hn+PWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1762812411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=eTcAQLcZiQP1xcx9P4ByeGRmE/Wsspkv4/4PLy5mXxo=;
	b=uqqBAJgln5Ljr7dzUZLGf9x0sMmYYVbVLNXkxrMWo2/BuQVU29T8nH+V7/ka87XFBArTnw
	OJ5k6z5PTNF7xQWrnHlCzltdgCWuQYypoLtcxoCnPb6dgqEC/V70P9pB0qJwrKMQl1K/to
	z/mqTGaHcO1eRoF3fe7JBGiJ4bfPi+jZG3CAD/dEIylhVUBPk5OliJsQo+77Ls9RMYRaVM
	nBpBe9M5/RqnoK6gJAlmDakYEjnazj7KfEUdMJTlRbrDbsEwNhLRc4YapMmouwzH06s3ap
	NquC/1spHOo8gZ7kCRay6ZQJxZ5e6xgHU7Fg+d1cx2NdsOW1d4qQJkzZ1ZQL+Q==
ARC-Authentication-Results: i=1;
	rspamd-77bb85d8d5-7tv27;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Dime-Plucky: 401f8d997e60fa40_1762812411917_1570149200
X-MC-Loop-Signature: 1762812411917:1048135672
X-MC-Ingress-Time: 1762812411917
Received: from fr-int-smtpout26.hostinger.io (fr-int-smtpout26.hostinger.io
 [148.222.54.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.123.217.50 (trex/7.1.3);
	Mon, 10 Nov 2025 22:06:51 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:31e9:b9de:fe42:7704])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d53fc0kQBz1yRM;
	Mon, 10 Nov 2025 22:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1762812408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eTcAQLcZiQP1xcx9P4ByeGRmE/Wsspkv4/4PLy5mXxo=;
	b=rnFm6VOa6xT7DMnVfLq1ZoAmk29fvINsR0a3vrxtr8G2xIj1eS70pelXB/o92CUjsSOoQo
	tVZjDXpBi+0yytyNDI7Z9q71JCZPJpu/wqmdYoefxHSUi/J2Nwing20WHYVmI9qWJkSys1
	71gjDATlG6B+u88jQ/Osr7RN1Gd0f1DHpzsNSr5+w9YWPMf6q7R55uijqUB2Iu/2751ElQ
	pPU3h+o0eVYAfPnIWtU0U/c5Cai/Iq606fOgwBq9voad5f6FxiQSl8A8JldCGMQftGFoCt
	g8udNqlHwlZTIQuWndJSv9uQ2I4tTBNoxJxoMK9rZ7UBd6lnMl8oNbXCTj80oA==
From: michael.opdenacker@rootcommit.com
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH v3 0/2] riscv: spacemit: initial support for OrangePi R2S
Message-ID: <20251110220641.1751392-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Mon, 10 Nov 2025 22:06:48 +0000 (UTC)
X-CM-Envelope: MS4xfNouNWzboh0Dy8Xzlg3+9m2BtVixDhf0uK7rLl4pRTUC0j3aKvTVvz4YjxSsH1ao0/koGbaDobctRD2LyD26aZsrQmJqpLBYd6B85YR2IP75tVXvGGi0 yvELYG6Trz/hD7xabWxkqhR+3JaSH0q5ifH3Tab0Qvsb9YQQCNa4Y+uRbP2FUP7SpsRYX2Itq/4TI1TrFOVPB/VBVwERMnFQ5+i69taf9tNxzuCELA4yawyT wNSE7lmXJ0dI/aj8L2My01yQyduCjzifpA3vG/uGJZDfrUXE6nABmHg5h8nV8TX6m4u2ZCWaPaZh7qzrUg2L/6ta+KSYZ3XzSYrKOaePLbbvNpPidLL8OjdP ffEqYbIY1MYbL8/9UcE/opiYk/YuT/jDgIlNV8HnK5E/iNXqJSsrpUxY1zbES5+p8w+PRTTCygl/a+tIgt6uEtKceP+csVWPH/FS+OJ+TvD53MLSxMYEktqU 4jxlaTsEzymbCfaXFdbF7K6B6GXGFPCUv9XWQJI1yn/gAuHly3gY39qt1QI=
X-CM-Analysis: v=2.4 cv=GbNFnhXL c=1 sm=1 tr=0 ts=691261f8 a=6hOvbz5PeP13GDnUra1LTQ==:617 a=xqWC_Br6kY4A:10 a=5dAzR5NRAAAA:8 a=lv0vYI88AAAA:8 a=NEAV23lmAAAA:8 a=d70CFdQeAAAA:8 a=EcQK9hZlT_DBVffbIH0A:9 a=9STjDIb-X-UA:10 a=ZKAZAlVgJm32z6MX8p4a:22 a=9qqun4PRrEabIEPCFt1_:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

This adds initial support for the OrangePi R2S board [1], which
is marketed as using the Ky X1 SoC but is in fact identical to
the SpacemiT K1 SoC [2].

What makes this board attractive is its 4 Ethernet ports
(2 x Gigagit RGMII with an external Motorcomm YT8531C PHY,
and 2 x 2.5 Gigabit Ethernet with RTL8125BG on an internal
PCI Express bus), its small form factor and its attractive
pricing like other OrangePi boards.

What is supported:
- Serial console on serial UART
- 8 GB eMMC
- 2x Gigabit RGMII Ethernet ports

This patch series is based on Spacemit's Linux tree,
"linux-for-next" branch [3]

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-R2S.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Link: https://github.com/spacemit-com/linux/commits/k1/dt-for-next [3]

Changes in V3
- DT bindings: insert new compatible string in alphanumeric order
  (feedback from Krzysztof Kozlowski)
- OrangePi R2S: remove useless description text in commit message
  (feedback from Yixun Lan)

Changes in V2
- Squash 3 commits for initial DTS, Ethernet & PDMA, and eMMC

==========
eMMC tests
==========

Read tests
----------

hdparm -t --direct /dev/mmcblk0

/dev/mmcblk0:
Timing O_DIRECT disk reads: 846 MB in 3.01 seconds = 281.52 MB/sec

Write tests
-----------

dd if=/dev/zero of=/dev/mmcblk0p2 bs=4M oflag=direct status=progress
7600078848 bytes (7.6 GB, 7.1 GiB) copied, 127 s, 59.8 MB/s
dd: error writing '/dev/mmcblk0p2': No space left on device
1825+0 records in
1824+0 records out
7650410496 bytes (7.7 GB, 7.1 GiB) copied, 127.866 s, 59.8 MB/s

==============
Ethernet tests
==============

Tests on eth0
-------------

root@orangepi-rv2-mainline:~# iperf3 -c 172.24.0.1
Connecting to host 172.24.0.1, port 5201
[ 5] local 172.24.0.2 port 51354 connected to 172.24.0.1 port 5201
[ ID] Interval Transfer Bitrate Retr Cwnd
[ 5] 0.00-1.00 sec 113 MBytes 947 Mbits/sec 0 395 KBytes
[ 5] 1.00-2.00 sec 113 MBytes 945 Mbits/sec 0 395 KBytes
[ 5] 2.00-3.00 sec 112 MBytes 936 Mbits/sec 0 395 KBytes
[ 5] 3.00-4.00 sec 112 MBytes 942 Mbits/sec 0 395 KBytes
[ 5] 4.00-5.00 sec 112 MBytes 941 Mbits/sec 0 395 KBytes
[ 5] 5.00-6.00 sec 112 MBytes 940 Mbits/sec 0 409 KBytes
[ 5] 6.00-7.00 sec 113 MBytes 948 Mbits/sec 0 409 KBytes
[ 5] 7.00-8.00 sec 112 MBytes 940 Mbits/sec 0 409 KBytes
[ 5] 8.00-9.00 sec 112 MBytes 941 Mbits/sec 0 414 KBytes
[ 5] 9.00-10.03 sec 113 MBytes 919 Mbits/sec 0 414 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval Transfer Bitrate Retr
[ 5] 0.00-10.03 sec 1.10 GBytes 940 Mbits/sec 0 sender
[ 5] 0.00-10.04 sec 1.10 GBytes 939 Mbits/sec receiver

iperf Done.
root@orangepi-rv2-mainline:~# iperf3 -s
-----------------------------------------------------------
Server listening on 5201 (test #1)
-----------------------------------------------------------
Accepted connection from 172.24.0.1, port 38326
[ 5] local 172.24.0.2 port 5201 connected to 172.24.0.1 port 38332
[ ID] Interval Transfer Bitrate
[ 5] 0.00-1.00 sec 112 MBytes 935 Mbits/sec
[ 5] 1.00-2.00 sec 112 MBytes 942 Mbits/sec
[ 5] 2.00-3.00 sec 112 MBytes 941 Mbits/sec
[ 5] 3.00-4.00 sec 112 MBytes 941 Mbits/sec
[ 5] 4.00-5.00 sec 112 MBytes 942 Mbits/sec
[ 5] 5.00-6.00 sec 112 MBytes 942 Mbits/sec
[ 5] 6.00-7.00 sec 112 MBytes 942 Mbits/sec
[ 5] 7.00-8.00 sec 112 MBytes 942 Mbits/sec
[ 5] 8.00-9.00 sec 112 MBytes 941 Mbits/sec
[ 5] 9.00-10.00 sec 112 MBytes 943 Mbits/sec
[ 5] 10.00-10.01 sec 384 KBytes 725 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval Transfer Bitrate
[ 5] 0.00-10.01 sec 1.10 GBytes 941 Mbits/sec receiver

Tests on eth1
------------------

root@orangepi-rv2-mainline:~# iperf3 -c 172.24.0.1
Connecting to host 172.24.0.1, port 5201
[ 5] local 172.24.0.2 port 60564 connected to 172.24.0.1 port 5201
[ ID] Interval Transfer Bitrate Retr Cwnd
[ 5] 0.00-1.00 sec 113 MBytes 947 Mbits/sec 0 423 KBytes
[ 5] 1.00-2.00 sec 113 MBytes 945 Mbits/sec 0 423 KBytes
[ 5] 2.00-3.00 sec 112 MBytes 943 Mbits/sec 0 423 KBytes
[ 5] 3.00-4.00 sec 112 MBytes 938 Mbits/sec 0 423 KBytes
[ 5] 4.00-5.00 sec 112 MBytes 944 Mbits/sec 0 423 KBytes
[ 5] 5.00-6.00 sec 112 MBytes 936 Mbits/sec 0 423 KBytes
[ 5] 6.00-7.00 sec 112 MBytes 943 Mbits/sec 0 423 KBytes
[ 5] 7.00-8.00 sec 112 MBytes 940 Mbits/sec 0 423 KBytes
[ 5] 8.00-9.00 sec 113 MBytes 951 Mbits/sec 0 639 KBytes
[ 5] 9.00-10.01 sec 112 MBytes 934 Mbits/sec 0 639 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval Transfer Bitrate Retr
[ 5] 0.00-10.01 sec 1.10 GBytes 943 Mbits/sec 0 sender
[ 5] 0.00-10.02 sec 1.10 GBytes 940 Mbits/sec receiver

iperf Done.
root@orangepi-rv2-mainline:~# iperf3 -s 172.24.0.1
-----------------------------------------------------------
Server listening on 5201 (test #1)
-----------------------------------------------------------
Accepted connection from 172.24.0.1, port 49628
[ 5] local 172.24.0.2 port 5201 connected to 172.24.0.1 port 49640
[ ID] Interval Transfer Bitrate
[ 5] 0.00-1.00 sec 112 MBytes 934 Mbits/sec
[ 5] 1.00-2.00 sec 112 MBytes 942 Mbits/sec
[ 5] 2.00-3.00 sec 112 MBytes 942 Mbits/sec
[ 5] 3.00-4.00 sec 112 MBytes 942 Mbits/sec
[ 5] 4.00-5.00 sec 112 MBytes 941 Mbits/sec
[ 5] 5.00-6.00 sec 112 MBytes 942 Mbits/sec
[ 5] 6.00-7.00 sec 112 MBytes 942 Mbits/sec
[ 5] 7.00-8.00 sec 112 MBytes 942 Mbits/sec
[ 5] 8.00-9.00 sec 112 MBytes 942 Mbits/sec
[ 5] 9.00-10.00 sec 112 MBytes 941 Mbits/sec
[ 5] 10.00-10.01 sec 640 KBytes 1.14 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval Transfer Bitrate
[ 5] 0.00-10.01 sec 1.10 GBytes 941 Mbits/sec receiver

Michael Opdenacker (2):
  dt-bindings: riscv: spacemit: Add OrangePi R2S board
  riscv: dts: spacemit: Add OrangePi R2S board device tree

 .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 90 +++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts

