Received: from aye.elm.relay.mailchannels.net (aye.elm.relay.mailchannels.net [23.83.212.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9E830649A
	for <spacemit@lists.linux.dev>; Mon, 10 Nov 2025 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770518; cv=pass; b=BSQS0QK3y2nYSv0VP3KN3SQLQgP5p195IZ4K6Rjd5KrBTVHIv1M+mARF5ApbAQxF/2+MCuClJ6nUUpkPh9RZI3nH6YekXjYScD6L3uF4aZ+Hf9lmC8K3lSDFdC/yGmWmdCbnV60ygYYiLTxxOWhVlHKjrZZvutYClPrEmT1H4zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770518; c=relaxed/simple;
	bh=NeIlVEh2cVY9rpkULq8qOvy+yUsvTnNI9n3b+73bOjQ=;
	h=From:To:Cc:Subject:Message-ID:MIME-Version:Date; b=q+FR4oNOPoxe26+wJsuFsLRZwW33IDALBRHvZrlzis6ePk029TPnQ2GWxx5wfD/J0rXXGIEC7Q3hkPwbBoJiPZ6i3bUeLnBaPNGNrLhvKMOmoWgEwE0txHVuAtPdCvIUvMCXCNG+qBQMg1svbV6FiuGLseKD2D6JNUgkGeOrPhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=jVJvUDfD; arc=pass smtp.client-ip=23.83.212.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="jVJvUDfD"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 113AA4C2678;
	Mon, 10 Nov 2025 10:11:24 +0000 (UTC)
Received: from fr-int-smtpout19.hostinger.io (trex-green-0.trex.outbound.svc.cluster.local [100.124.152.27])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3007D4C2C18;
	Mon, 10 Nov 2025 10:11:21 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1762769483; a=rsa-sha256;
	cv=none;
	b=PIPD5RZOeCiC4U7ADCkGp6+HEtl8Lycd26L4/v/YnDL2H3wVQFMhpESt370hofH3oviWPA
	XpqkNiEI/EIHGGVcmZ6ISb2mPRMjM5zmdsnYwOXPdjn3e0Hsxoqphxl4HQ3JQqnQ2nHjb3
	X7EQVdNTOYMwkNIOmOgsM4Qs7ajTDC9aEd768LNNAsdGCwxeKwCQarmVvijasMgl+dT2Jv
	HWYpQINX5QhgkewvkTqH0t9jCbR5YwzFtkvkmFKVNTCrB05mcHbIBujGQ7B5sJZ+aR7Ayw
	aeSc3JmdDmUHZnLVTO2sqpWZssL/5/JGy2W1if6T1dDR4y0Is+75+KXITyRZ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1762769483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=y9x3ivH7XRyk/FUXAXaQTfj9+U3F/MBjSqu5Ucn53yc=;
	b=mMpIRqPyh7Dw1aSN+4Xszf1W0Cero5ymEO4NecI4rtcLrBdYwh33sKHfmWv7Lf7RRDMFYV
	ttWYHFoGQ0+s94IlAsSP8b6Y3XpXVPR+eE4hImVaqRvQryuto/naATFegE0RgpyE8I6Llm
	4tGpK/ufOUtTyZ3hBhj1pOZs7cJojTih43hWSlJxcO7QjfF0skqWxbPfhRVknTEc+XiXH5
	5vAwm0LR7aZay0ymS2eiWjnrL1RiFcKxfxwEM09bkCIpUntHanXTw7BjUgmrhNg3inWKxd
	vImf0NeroSuFnAPRgPnEVSh0vJ4hAwu63D3n1xe6ruDAuyxgPibq3Z4c16M+kw==
ARC-Authentication-Results: i=1;
	rspamd-77bb85d8d5-nl9dj;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Glossy-Inform: 0bbd98067dd68b55_1762769483865_2445791502
X-MC-Loop-Signature: 1762769483865:1492278871
X-MC-Ingress-Time: 1762769483864
Received: from fr-int-smtpout19.hostinger.io (fr-int-smtpout19.hostinger.io
 [148.222.54.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.124.152.27 (trex/7.1.3);
	Mon, 10 Nov 2025 10:11:23 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:7d90:b645:1639:d009])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d4ln34LvRz1xq6;
	Mon, 10 Nov 2025 10:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1762769480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y9x3ivH7XRyk/FUXAXaQTfj9+U3F/MBjSqu5Ucn53yc=;
	b=jVJvUDfDIeqlvUCernUj8dSSKZb/f0v5Xd2+gv9oodV1K+FV5EfrWkk5R8Pja7rjj0ZQ2F
	4IBOmsajqgucx6sXsI6oZiAZbjIY8S2gh47x1RIhWU9A4QwAZvIrrrH9D7TsmuN8Ivx0YR
	LdydOOArmzv/UpTToO4DjKmB9ROBGENT+XD1R0MIcPpNvWwsWL7SnEcQXAajlDj6KRm45J
	MQExy/TVzLtRIO8dvmEoK4gNp27VBIgFd9LZ2YUzjPqRRm+LFBSR2iakPxp5WbgooBVkB7
	oOjncCQFaqyHygLd7unDOqT9O4KA55QI2+Z7sTduNmECHf2tW1JAJRUzO07Mzw==
From: michael.opdenacker@rootcommit.com
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH v2 0/2] riscv: spacemit: initial support for OrangePi R2S
Message-ID: <20251110101110.948198-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Mon, 10 Nov 2025 10:11:19 +0000 (UTC)
X-CM-Envelope: MS4xfNfNuZlm3IaJ5+M+kUBv96M4y9ze4NOds2bgcrcU+ApKMalsUbwTHA+1IOX2opBdAxT78LkY7JE3KpXTLR3dyJC07a9eu1WKBrwVGSPzgT0I99l25Dz0 fFidDuzbTHI5mLl+lLn4zcAs4TgapQE4Gsx31YuKQvV/9allxtYtGCf6X+jso9uan9p6j5qMATyfW5iRV5YaTdF7J9nKJl557SRkymAoxnCZ9KGDkfNOmzCm LbjmezMTtJvLXz+F4MneF1hzZarNcKtBcRq8UVAVV8dl4WaAy5DF54lVrcsdSgpF2/8qJ8T0/xzpfFgHdrAloPbpuBZ2EewOHbB/tI98F18yrmya6x/YvvPL 5qOiV/fDNHHipN3A6n4RwO8njmmcTEy0Sd/Po1Txy7w5aBKIkAf8T03wlxyav8esezookm16tyT8cf1mGvOzvOX8XjLCw+pQ68m2myBwZ1tpLZDPljo2bxLQ kiVfuxJVYy4k/m8nHR5GSIFRLZcPXmXwscvmtkGWQZiEqmh7frp/3WliZng=
X-CM-Analysis: v=2.4 cv=NuiDcNdJ c=1 sm=1 tr=0 ts=6911ba48 a=G6G7neK3IwemRqrlzYSHdw==:617 a=xqWC_Br6kY4A:10 a=5dAzR5NRAAAA:8 a=lv0vYI88AAAA:8 a=NEAV23lmAAAA:8 a=d70CFdQeAAAA:8 a=c5yYfSoVHdyevq9fuNQA:9 a=9STjDIb-X-UA:10 a=ZKAZAlVgJm32z6MX8p4a:22 a=9qqun4PRrEabIEPCFt1_:22 a=NcxpMcIZDGm-g932nG_k:22
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

