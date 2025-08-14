Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84E72F90EC
	for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161750; cv=none; b=q5I3XKo5UnrritOxyvGJ+4go+sGhvCfmDco2t0BzHA3PcLE+TK8+lJW3RKXgI3fTG+PPaD9k2+s5uaK0VYm9aqgtBVHk1rd7jMz4UOkvN3IgXtu79Nnn4S6jjt/iurChxhRcClDbdeEPk6K3pjGCZ66kJh3D+GQJIMnXuPw1Up0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161750; c=relaxed/simple;
	bh=QgGpAdvzuormNjUn6tUmYY9jPTavcmAGKkKi1zctL28=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MhrvcYp0wIMZbAL3AXF9liYW6IK6Nk/FCsZjANkcohSyQAfbVCbpEycMkiYx96brtz6mrXQD67RdsqVVQ3+wOvA60sFy8DgoGlKel2PD2JpWf0SP4Q/DIN0TwD5r9fA/EzZs7DXT87/8c2TGaU55JkF4dlzoBXc0MNKO+53d3pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=r3OuX2sb; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="r3OuX2sb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755161674;
	bh=Ke3beEqe6Pa4xwQguH8Wm9RAEs+vkFTy1jmJSngED4Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=r3OuX2sbVOYBzNPaXFasVWK4UPVoGFiRF63rwOy7So8uZg+t/TNqlY3gAcTUx/Gm4
	 0pVlszCYBeh3EGm9H4pja5v7HXcVxcKYXmzsu6f1QSt0LvjW7QZo8IknP+FIvMIauT
	 UirradNUwn79SBhjhoQ0jhMTDgRUP8HO4/B+n0Qg=
X-QQ-mid: zesmtpgz5t1755161666tdaa37b79
X-QQ-Originating-IP: xyGPJ5a57LfI2fCmO+XffstQbpLH+Fv6qZj+s9/q1UU=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 14 Aug 2025 16:54:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2060538249097170707
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/2] ASoC: spacemit: add i2s support to K1 SoC
Date: Thu, 14 Aug 2025 16:54:18 +0800
Message-Id: <20250814-k1-i2s-v1-0-c31149b29041@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADuknWgC/62QQW6EMAxFr4KybqQkJDhwlWqETOzQiAJToLTSa
 O7eMGxGapddfsv+78k3sfKSeBVNcRML72lN85SDfilEeMOpZ5koZ2GUccrrUg5aJrNKrV0XK8e
 IwYu8fF04pu9H0evlzAt/fOa+7RyKDleWYR7HtDWFjw65VFTVBM6WzKwIlPIlYbTEPrJ25LwTz
 x5NcVooe1iE9+Fh0vPEC27ZW+YaULZm1oDNbo7jf6OChmcqWwMm6ljnPzS7+4WqOgZ0CJVHjKF
 TQBqgI5P5FXbesmWFgfhPlNLya16GNPUtjdgeg3Y3EsiE6FSFSNDspbjc7z8Wj7lBwAEAAA==
X-Change-ID: 20250813-k1-i2s-115bf65eaac8
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Jinmei Wei <weijinmei@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755161663; l=2411;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=QgGpAdvzuormNjUn6tUmYY9jPTavcmAGKkKi1zctL28=;
 b=HO70OsWIvdbMolshXdBIfReQ6sDMnZTin41uCKGbrCSaqlVvv0JcII+K2L+wrBi1z1xSvtNRi
 98J5274iTZ6BZZSjNc4bN9jrB7B93X/TaMZ2ToMXk66cfczgcA+w9Fe
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N649AdNySAiw8vM0MDinra7NsiVE7+ctZV4tTkIfJTrp5RlIInsTKcj0
	RrLkJivpulfsILTA7ajvr1twO4AzqrXPRij8pv5CPJAUXjxDOqVH0PLGYdcRPs0gmJ503n0
	Y0UPxzhJyAZXiu+xHXPuJX1euCqtnIKa+Rn94Ewv/1irhmdfycltIZOofE9PKa1yasFrG4l
	+41aEExtse7wmZ1jCXZY+JHCbBEyZMAnEmXmr0Q9Vgod91s3kNxMQzJ76MDTCAluMcbuWu0
	a0TjGAO88W7uxM/cz8G2T15Z8KQpz3FvFA746hE+9ioQtpolmqw6YPNtaFmKChSJSekiS6K
	HwmnM9Jtq8ANCcVGyNr/rQT7FQJf8+oyjyRafPc8N3zS326L7iH5llg5QL2QZxG+rDOmbPk
	Tbm8jhVg+xovmDw3GOAFU8JMAMZCvPVub2sV8BMdnQUv59bJ0+gC3IEbnBIiVhoA2zaIdGN
	vKnS/n+Q16fT2oVZnRMoCdYQqtg9uggon8czJ8J2oF5gD6KCQMRvX5tXIqMoR8+1esvdTGk
	CzPFfcGYN/wQv8JdzTeKlzivmDHc2Xdwrwk55WqTW5RtvKzYTSquAJMiA/0zdigeLpuaWRs
	KG3JnIDDivVuF2tSlcD8Q0V2z8HPN+qz4hsqrESdImLjAzAfktMT3TjNcLqAbnnX6++Gi5G
	3m+QGYwfef2FesDYzjs3jxqhyOU168mjUhOd+an+ts409NHMAX22UL6ox3EmEvKq/3kh7AH
	droNO1HfDZTsTPE8yuf4FIUlDbYQRqdmxtMSz5UPKv3s3UqN7yKZs5AoYHZ87mk7lDQ63gU
	KhRyRPehd4c/IV/D2KZ/bLbL7fcxWEk8SAa6olWgXjxtS/F3ZN1MQ4qXWIS6aBpw/vzDh8d
	VFZ0hsxXSmWi7YlcGxu2ImMyqghJ2FTpmff/HeLAZGvthCyj8mC9QjnsMhj4Ql5NLm8QLaY
	JW0kZP7zhpRnWcGwkTOx00Lc8QOAAfk/lNv+Hfnv45oAyyaJNXKmrxD3lFOtxeNa3uI7IgL
	+h2kjG0uLs5mMiwenplzyR7oi5RoCeABObrkzK3t3JdIgrBdDHKGI+XTV2ApkKVAf9QSVwr
	IKrsZmS6GW7qs4jt5WccXyrbwJ+9ibZ2WGV38Uj4KCGcfNamSQBebqUgURuk5Q561u1vzCt
	0UbAqJwLOPL1cdVKF5ye5GMmSZR+rbuLDTm5C5yl1LNYJ08eZbGy0LO4gg==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

On the K1 SoC, there is a full-duplex I2S controller.

The I2S is programmable, with the sample width configurable
to 8, 16, 18, or 32 bits.

A dedicated FIFO is provided for transmit (TXFIFO) and another
for receive (RXFIFO). In non-packed mode, both FIFOs are 32
entries deep and 32 bits wide, giving a total of 32 samples each.

The register definitions can be found here[1]

Link:
https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#18.2-spi%2Fi2s [1]

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (2):
      dt-bindings: i2s: spacemit: add support for K1 SoC
      ASoC: spacemit: i2s: add support for K1 SoC

 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml |  88 ++++
 sound/soc/Kconfig                                  |   1 +
 sound/soc/Makefile                                 |   1 +
 sound/soc/spacemit/Kconfig                         |  14 +
 sound/soc/spacemit/Makefile                        |   5 +
 sound/soc/spacemit/k1_i2s.c                        | 444 +++++++++++++++++++++
 6 files changed, 553 insertions(+)
---
base-commit: 6be7a5a768aafcb07d177bd2ae36ab84e4e0acde
change-id: 20250813-k1-i2s-115bf65eaac8
prerequisite-change-id: 20250804-k1-clk-i2s-generation-eee7049ee17a:v2
prerequisite-patch-id: 21c0ef38a82ad5f8e471bd904559e5bf68099445
prerequisite-patch-id: 6fa5b6872559a75651342831399676ec96cc3974
prerequisite-patch-id: 03cbe1816e519bc16c641055972558fb5eec6a37
prerequisite-patch-id: 1ef339ef1a80a508b5761dab1ddf448a985864e9
prerequisite-change-id: 20250717-k1-clk-i2s-e4272f1f915b:v5
prerequisite-patch-id: 6f2626811da4833395f52f712d9f2a5fb553cb48
prerequisite-patch-id: d2594982f7a8f39c2aa4f21490a19e93ab67254d
prerequisite-change-id: 20250701-working_dma_0701_v2-7d2cf506aad7:v3
prerequisite-patch-id: 3fe97698036c32c20d03b1b835a5735e8ee8126c
prerequisite-patch-id: bf64cb2fbb9699d2ace64ae517532f13c6f8d277
prerequisite-patch-id: 49263c65c84a0b045f9b5ae6831dc011c4dea52f
prerequisite-patch-id: a62678262e4fd2361b8c0c535ce34853febf492a
prerequisite-patch-id: 1b840918a99543f4497b6475ee52977bdb59f1c3
prerequisite-patch-id: 75e5a355a32ceb2b0047ead035c07c5b201bebbc
prerequisite-patch-id: bc8f599bef77297a7bd69736bb5307a0964aeff5
prerequisite-patch-id: 62d0b3678cf825bca51424ad85cf35ebdd6dc171

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

