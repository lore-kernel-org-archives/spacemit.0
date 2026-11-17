Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905420;
	b=FxgotdGC5ick9niQsPElhBIASEXQTjkWEXfrSK133hrbdJG47JHQdsEHdqeEB7ZjGsoe
	 oUOd9IFUy05PRGr7sa3jC2q4xZ2mxRPwHt/7OoLDOT9stNv5+yteveIj3QLiMPjy6RPcb
	 M3aGBLwThwGL2yg13I+78ncSoN1b0zWa8II1PiECfRGLJA5NmTIMi9PuTkp4J1WPYeNPE
	 IAIUXOvuzSax6W6XfKSsoDHK5TM/RwyHt01ncqvSQWTXyrF7Y2D1Yax0KAChR2lOsUl2x
	 kM+enYNiWXucmsKZpWPPUXREhneEWupqf/c3lRulIQFYRHGf8VkTR5Ge7P0RV4lwnjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905420;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cFk1IC1N2ZxUgPOBN14J0ec3RFhEdGYuQcICO+AAQGg=;
	b=fCEnOsSz2g0bz53jSKQJbVDZk6xWWTYdLhkpWNKONIzTb/DzybStfKOCW82c8loxoLf1
	 DJfilIdWLwYIqPhWPGuNFlOY/Gp7jTzSGGxzN6T4pSdaTNUY8WVLXNFm8Eugqlcht3hw1
	 vd1xtbsYlJYAqMW7hNPOdmq1AFr3kalW3obTucy5rloA+XpaYBVPj7I1iCxxug9dbu2y4
	 ppT0h9ujhdc1xPkkNPMgW0pP0ZYgQA+vhkVKdg9Uuac7b+zlZnTrIi600reg08JtqBvEP
	 MSPT7Ea3L1Hjc5O1www6bTn8q692LASQZ8AVkiPKuxIcd1l8dl8EZpD7JbnZvImrSyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b="lX5Joh4/";
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB28606A31C
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 08:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBB28606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=lX5Joh4/
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 7193C20DC645;
	Tue, 17 Nov 2026 09:50:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 4866720D7CCE;
	Tue, 17 Nov 2026 09:50:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 4866720D7CCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794905411;
	bh=cFk1IC1N2ZxUgPOBN14J0ec3RFhEdGYuQcICO+AAQGg=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=lX5Joh4/2q/HFpT9S7gUsWxhLdRTkgkbSKIDtJM4vHUc6hC8xnM3LcmqYItxlmY42
	 Bt4pkPYgO6DenbyTxcWgAc8VKn6BDyjxF0OziEuWSY/hBx3y1vldJ3X4fIIki6Edof
	 LnMTAg46hFwU/jq7ptIj82f8Cc+L5O0Efi7urudl+VQVbsGfHZelKqrKXPLb03qINa
	 13fwAZW5aDrGrjPB4jLzJE6jdXhUFNjhIV3dkgSolKLQSxnXWy/wEw/S4ibuGfXCp/
	 pZAI6z4LZlwxEBlpQSfc9TbZEl5zfhjJRzLWubVCwKDA0UV2kFB9R0KBLh/MzfEvEa
	 kaJtkayVMZmUQ==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id 1n70Yc3tCfZi; Tue, 17 Nov 2026 09:50:11 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 35E1E20DC645;
	Tue, 17 Nov 2026 09:50:10 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Vlad Banea <montrealtango@gmail.com>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Yixun Lan <dlan@kernel.org>,
	troy.mitchell@linux.spacemit.com,
	wangruikang@iscas.ac.cn,
	guodong.xu@oss.qualcomm.com,
	jyc0019@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: give each PCIe port its own DMA window
Date: Tue, 17 Nov 2026 09:49:36 +0100
Message-ID: <20261117084938.82968-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113023158.2872492-1-montrealtango@gmail.com>
References: <20261113023158.2872492-1-montrealtango@gmail.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 09:31:58PM -0500, Vlad Banea wrote:
> The shared pcie-bus skips all three windows, bus 0x8000_0000-0xb7ff_fff=
f,
> which leaves CPU addresses 0x1_0000_0000-0x1_37ff_ffff unreachable from
> every port. Give each port its own bus that skips only its own window.

Tested on a Banana Pi BPI-F3 (16 GB) with an NVMe SSD on pcie1, on
v7.4-rc1 plus "PCI: spacemit: Ignore PERST# input in RC mode on K1".

For pages at known physical addresses (from /proc/self/pagemap), I did
one 4 KiB O_DIRECT write and read per page and counted swiotlb_bounced
events:

  CPU range                    without        with this patch
  0x1_0000_0000-0x1_0fff_ffff  1439/1439 bounced  0/864 bounced
  0x1_1000_0000-0x1_1fff_ffff  all bounced        all bounced (pcie1's ow=
n window)

Every page read back correctly in both cases, so DMA through bus
0x8000_0000 works. fio with crc32c verify (16 GiB direct, 8 GiB
buffered) also passed with both DTs.

Tested-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr>
