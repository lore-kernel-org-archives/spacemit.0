Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522503164DF
	for <spacemit@lists.linux.dev>; Sun, 17 May 2026 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779015319; cv=none; b=MSLOCeBNHlUt4R+HoP9xHa/ucndZcrZFoVs3pXIKCqbg0yWuAPpzlSDq4305bbDAevBhPxyCgwuesolHyjZcTw4B27g958yHUfwlzcP4k0mMV/hoFe24U2voVKX/XDQiOvFXawjqFk3pvQ5gvkeNyN9xSGWob9awrxQsFnrlc+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779015319; c=relaxed/simple;
	bh=mym2AZr8qHmYBPdF1FDnJxIrdkbbp8uIX7LVOJu77SU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xobz9YYSLO6dF6aoz2Nk2EVv3NVl9+4VEurFds9CqU1u+emTE5J7SWMtq9rX+NpmF45IwqLFzYwmf3JsWIpqAfjFIBiK3zS8t9m1TLXUZmKljAUq7/1Jpi90pTrYyOX52+UTVeOPiUSsIZGEePjH10u84e/Eo6Ud1PcjXwiqxGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [119.122.215.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3eb5cf39b;
	Sun, 17 May 2026 18:50:01 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: legoll@online.fr
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable QSPI for OrangePi RV2
Date: Sun, 17 May 2026 18:40:40 +0800
Message-Id: <20260517104040.1941126-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e92fc4a6-7a63-4d24-9c13-8fec3d8184d3@online.fr>
References: <e92fc4a6-7a63-4d24-9c13-8fec3d8184d3@online.fr>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e358ea40403a2kunm5a1540d111564e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSx5PVk4YGRoZQh5KTExDSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJSkpZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pOTE5VSktLVUpCS0tZBg++

Hi,

> but cannot see anything relevant to SPI in dmesg, whereas I see [Q]SPI 
> in u-boot output, but there it is listed as:
> [   0.887] SF: Detected XM25QH128A with page size 256 Bytes, erase size 
> 64 KiB, total 16 MiB
> Which is not the same you tested (XM25QU128C).

Please do not trust the flash name printed by vendor UBoot.
XM25QU128C is 0x204118, while XM25QH128A is 0x207018.

~ # cat /sys/kernel/debug/spi-nor/spi0.0/params 
name            spi-nor-generic
id              20 41 18 20 41 18
size            16.0 MiB

You can also check the silkscreen of the SPI NOR flash. By
the way, the IO voltages of these two flashes are different.

> How can I know this patch is working properly ?

[    1.116594] 6 fixed-partitions partitions found on MTD device d420c000.spi
[    1.116609] Creating 6 MTD partitions on "d420c000.spi":
[    1.116615] 0x000000000000-0x000000010000 : "bootinfo"
[    1.119280] 0x000000010000-0x000000020000 : "private"
[    1.120718] 0x000000020000-0x000000060000 : "fsbl"
[    1.122064] 0x000000060000-0x000000070000 : "env"
[    1.126373] 0x000000070000-0x0000000a0000 : "opensbi"
[    1.127679] 0x0000000a0000-0x000000800000 : "uboot"

These partitions can be tested using the mtd command.
Or simply view the contents of these partitions:
~ # hexdump -C /dev/mtd0

Thanks,
Chukun
