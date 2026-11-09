Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246975;
	b=vWVr+fkUsMP9QtA88LDPPsHB38lOb1ACQVqxNEfG2iSJ/ohd/cTIvovz3DLubpjUsniB
	 +tnyfLZXByuTZUA1/ZedIBFd/Q8PCQHRq5o3FO/jkO1KH6NNwTHn9WN+ZZLDoUV1wKlfF
	 0OOlA5NNHpxkX3jdMloQrdC4TbPP485nqgV2K24Is1vmiYwSBoxjKNGYBP0gSEJUOs8qX
	 Wozhel/TT9z1qkud8WwPExZlPaPH0Jl1DWRCcOl7AGRXHNg2RT3HMnTb2V/PMzIs28wc/
	 OFagStyk7G21uSqYyM/6a1jFvurqcuvkNR5kaLnpctSjyLSRza/y4KngmmfSzHpAjlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246975;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=if0cEUuJl6s7o+37uuaoQnPEf1nh2eR1DDff4vzhVvw=;
	b=lTKpnYsFSFiLIvRRVpw/r8rh66XbwJj4P9iS93+x6nmHp0qyXJ7SHyonigz36FcfpclL
	 9nmrc91D3fkyMk77KgY6M5365UkIvRgzkNKLaHTySncsO2DXZi0ZQjf3i0V/KiVOunMmf
	 8AkbUpgWm9n65MofyZ4zFlLt1nhEdVvrYYGwTjX3/LczOcwY62nbThQ1qkj7rm9Oa3NJH
	 WmXqBk8/C7gABaFgaoAltNFdxenioaF8SubJ5tdgxVIErx19D6XxMPXKxiY/Z1ZkG7J0d
	 9TMA4h4f38rvmFTuNtxqjKJ951BQgxcxBw0EtKgpq/o2CPtjCEdVIyjT6X5mAZx9vvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=oYDVBy24;
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9F6606A326
	for <spacemit@lists.linux.dev>; Mon,  9 Nov 2026 17:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C9F6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=oYDVBy24
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id E539B20D174F;
	Mon,  9 Nov 2026 18:56:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id CA90220D1763;
	Mon,  9 Nov 2026 18:56:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr CA90220D1763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794246971;
	bh=if0cEUuJl6s7o+37uuaoQnPEf1nh2eR1DDff4vzhVvw=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=oYDVBy24embrLcOhPvc9Soom3Wb65A7jOH7HnOfsg25PrEG3kA9kjALksaYLGTVFN
	 tXhemg5Ep+rY8ADfNrM5Af6yYCG6kO0qgQ1t0CdApljhd2Zfsb4ghSQERIis1mTttn
	 dqkBnOIqcruJvOnGG4VsTKUSOd0o59qwY1phmkGT9YAwdDSGe99EGCf/LIS/sqeMpQ
	 9HJIRj2n/2l8txgZBH9PxyNgn17Aebx83JMa2cY9xmCqh5STI47qlb/NhQwwzzHBH0
	 L8j66/G2oFEG/YmQ6l/Xx5tupok6+anikzA/UGQzmLM7C5DZKjhNab8PQhJRNASYYn
	 O2HozvcdvJwwA==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id Gr6o4wC3rV3i; Mon,  9 Nov 2026 18:56:11 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 5236220D174F;
	Mon,  9 Nov 2026 18:56:11 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: defconfig: enable onboard USB hub support
Date: Mon,  9 Nov 2026 18:55:49 +0100
Message-ID: <20261109175555.323067-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
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

The Banana Pi BPI-F3 (SpacemiT K1) has a VL817 USB 3.0 hub behind its
DWC3 controller. The hub's power and reset come from the
"usb2109,2817" and "usb2109,817" nodes in the device tree, which need
the onboard_usb_dev driver. Without it, the hub regulator (USB30_HUB)
stays off and the board's four USB-A ports are dead.

Enable USB_ONBOARD_DEV as a module, as arm64 defconfig does.

Tested on a Banana Pi BPI-F3 with v7.4-rc1 (dwc3 enabled as a module):
the module autoloads, the hub comes up on both buses and a USB mouse
on a USB-A port works. Without it, only the root hubs are seen.

This patch was prepared with the help of an AI assistant (Claude),
which also ran the build and boot tests.

Signed-off-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305..8fb6d7f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -222,6 +222,7 @@ CONFIG_USB_CDNS3_HOST=3Dy
 CONFIG_USB_CDNS3_STARFIVE=3Dm
 CONFIG_USB_MUSB_HDRC=3Dm
 CONFIG_USB_MUSB_SUNXI=3Dm
+CONFIG_USB_ONBOARD_DEV=3Dm
 CONFIG_NOP_USB_XCEIV=3Dm
 CONFIG_USB_GADGET=3Dy
 CONFIG_USB_CONFIGFS=3Dm

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
--=20
2.53.0

