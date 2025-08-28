Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A89825BEE8
	for <spacemit@lists.linux.dev>; Thu, 28 Aug 2025 03:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756352327; cv=none; b=iwgX4wFkENoJ21HuWR5WIEtrbChD7WX/61bY7QNtIA4aUFIDPpycVNKmeiR5KiN+Xa0pTEA1oCJBropHyUz9q48Ts5x0fDXaXZy/WJ0z7ZYAsFKci/8TDOo5rvLZNIiH3xw+N/Ke/X0Rq7y8EDG9Lm+XmsE0ICahpxBWoiApDNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756352327; c=relaxed/simple;
	bh=H9JM7KaiTEuem8gTBIUL+9/e3Y5d6TsZUkFCScNdBJs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GfH92TO1rjD437QSrOAarSXFmMpeziDRvgFTiyofcD81mTUHHWHYT04vC7dOx5MtjJTA7h5J6+087Cnj96uA71sId+OLIvwsPF5Db0FmmISYXmgFfYxhJ69oqpdA/xTm4E0gIybblEppbestzx4fF8GofZi1UCjYeqv2qqY+qX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=UKUETZ71; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="UKUETZ71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756352273;
	bh=nvA92LYL6TES2+JhKWx8pUHrSNlBcF0zDiqaCtaIi9c=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=UKUETZ71FsJb1JjDpcaBol9SIrxZmCkXs8IYbXclNizbFdGIrZ4K3/3rh4GU8Fv3c
	 cx6inGmOpeDWzwF+teaITgJgZGsuPiud27H0NRjIQDKIzXiaHOfdO59d1tbOlp4322
	 B/6WzsP4ZQmQKbyEQeM1igurQ/ivt2CHw2MfKy/E=
X-QQ-mid: zesmtpgz1t1756352263t24de1d74
X-QQ-Originating-IP: 8A8Eru9mCTqhfoGSiLMYDui+My6y+LChdG/s2XDmz9Q=
Received: from = ( [14.123.253.129])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 28 Aug 2025 11:37:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16113311847530731234
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/2] ASoC: spacemit: add i2s support to K1 SoC
Date: Thu, 28 Aug 2025 11:37:31 +0800
Message-Id: <20250828-k1-i2s-v2-0-09e7b40f002c@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPvOr2gC/22R4W7bMAyEXyXQ76kgJUqyg6LYexRBQEtUKiRxO
 it1MxR59ylOB6xYfx4h3n3UfagqU5Gq1qsPNclcajmNTZgfKxVfeNyJLqlpZcA46NDqPepiqkZ
 0Q/ZOmGOn2uPXSXK5LEbPm7ue5Ndb8zvfh2rgKjqejsdyXq/EWkM9miyOwbEVJtunTMF74yTET
 nI0Q8/qX46GtVAA3SjiYb+Q7GSUic+NW4tIAOpFMPB6ptvyl9Rso/MWcwAhS2Kxi0QAKIYwJAo
 BMviY4LvUAKjfT9O+jLttOvL2NtjORodkYnbgmVNYz+6/zC47FgvJ9yk4sg0RUgDobOJMSbos6
 JLrlsWj1MqfoY/3W82XW2enQRsMgx9CFAb/81DGt8tDfeUoLe6hpT6p2/+/lHo+Tb+XXmdcCvi
 skP5WOGMzixaR+sH0QPiNmdpcr9c/FBpXWiUCAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756352261; l=2820;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=H9JM7KaiTEuem8gTBIUL+9/e3Y5d6TsZUkFCScNdBJs=;
 b=Jqg1lUiztA2/8/dxSHFeC/Rlj1+NK9GzjZCOWksp8tMzjsKISha1T+HE9F5SJZWlGlcqs41L+
 HGZvhi3bEQ5CamOiYzl5xVPNtG1s+0zXhMI87xXwqvYQz+34DxBDw81
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MpCQQy/6khKPyh7EkP4CRoohuVBGBQbvtSSdJoSPBoFApvEQYaiRBcoD
	D7oCSAgrm8MZxnrniilSvgv3gbc8IAaGGuhxtrSLuZtQFBOvtVkoO5vbDAVEaIphPJFhMft
	d7k2QGgRuYjun9Yf+l1KqgDz5lr6cVPaKt7F3muEodEY99SfCXrgSyrZKlYNt9E+i5fBjzn
	m0DSXCUFY24wCwKaI80ABd7vtZwTaYav3fx+IDvMnSocugJErlTLJoksrOaveoPyzx7xBvY
	PhuCq/CmdOgKQe5gFO/xnL0rs0BMal+w3EOWyg3a5rExhrKk6SVJC3MLBOmw8faESXffZ+S
	5P13Fe4DblF0HX4tvNVXj8TIid1uubcGmgoq0g3cEecneexdn8k/koiOV6BqPFj9Vr4iqP+
	0lv4FpkJW9x3Obp0Z8+oD/S4YDpJ9/ZPU18aoAmccdrv+Se9O4TYRsj1aG9nxnkrjMAgnlM
	1yp1f0GpZR0ucL97SBvlVhWw4SkOFDh5TkdwsND2WsHC6WCLWuJLVBTeyKxgZedEeFXqXHM
	M0kCQq/ELy30P4C6+DDzPqTpAyVjTY78qjZpDQpCwKgECmECZqJEAH7wpfXh3RitshlT9Sy
	Nwx0QZD0daJhmSNZKNa1SuEkQhqIXEdy6wqIodvwRI7q1MpwWqKj6ykhKxuQuSEbE61Dcwv
	2rpq+f8bJjhVw/zEpELLS/XUZXpoW1ArBdw+D/e/K5++3NMVcqaViYPonRFBxFhtIbfj7Lt
	o2R25Wjo8zvY4gbdJEvEH6eS03RlC6xWpV+j7JoNv+fFAciyDWsKi5wFW5CN1FDrVRY58Q1
	+Fct4e0c/jZgIGUA4bl8bKYziMGhZlKIeR6ji6K7lkQv69qpiW/LRSUzwaEHV/iKFBAXgrA
	lHSTpF4dZZC1kBCyuTRsmJp0suKI9IIy1iBW8LbktV8P9y4l7CZDrwS8vgZowBdPbNTXNeg
	tECIs3qils1xcCDhbuIEQX16mH8Od5v0pDm3wfJGmVLxFSrpjxA7m3TbicZNMyu27vAu2yv
	qdZsa1ECqBAun/Z9DYLNt/CfQd5HPY4FpiAIu0jnq/toft9Hx86MGRtTIPjpLIrtUssaXi8
	3qDI99BVRTR1lgV921vcw9BKbKtsco3tmuNlTnNBxwBAQHQ0XStRbwueAhd+9rpwlppAdk0
	Ntou
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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
Changes in v2:
- Patch 1/2:
  - modify commit message
  - remove unused third cell from pdma dmas property
  - update SPDX license in spacemit,k1-i2s.yaml to (GPL-2.0-only OR BSD-2-Clause)
- Patch 2/2:
  - modify commit message
  - reset_assert in dai_ops::remove
  - select CMA and DMA_CMA in Kconfig
  - use devm_reset_control_get_exclusive
- Link to v1: https://lore.kernel.org/r/20250814-k1-i2s-v1-0-c31149b29041@linux.spacemit.com

---
Troy Mitchell (2):
      ASoC: dt-bindings: Add bindings for SpacemiT K1
      ASoC: spacemit: add i2s support for K1 SoC

 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml |  88 ++++
 sound/soc/Kconfig                                  |   1 +
 sound/soc/Makefile                                 |   1 +
 sound/soc/spacemit/Kconfig                         |  16 +
 sound/soc/spacemit/Makefile                        |   5 +
 sound/soc/spacemit/k1_i2s.c                        | 452 +++++++++++++++++++++
 6 files changed, 563 insertions(+)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250813-k1-i2s-115bf65eaac8
prerequisite-change-id: 20250804-k1-clk-i2s-generation-eee7049ee17a:v4
prerequisite-patch-id: b46d4007c5b20f11845db739fc78ffccc54f4dab
prerequisite-patch-id: 1e193c412de1206c024a674e2dd7da88092976b9
prerequisite-patch-id: af07a4bca4109b13a74c0b20a12f96af863090ef
prerequisite-change-id: 20250701-working_dma_0701_v2-7d2cf506aad7:v5
prerequisite-patch-id: 3fe97698036c32c20d03b1b835a5735e8ee8126c
prerequisite-patch-id: bf64cb2fbb9699d2ace64ae517532f13c6f8d277
prerequisite-patch-id: 49263c65c84a0b045f9b5ae6831dc011c4dea52f
prerequisite-patch-id: 2b43599bf7568e6432faa2f6aca5b2db792cd1c1
prerequisite-patch-id: 1b840918a99543f4497b6475ee52977bdb59f1c3
prerequisite-patch-id: 2f77be523fd5423bd011e3081a3635d130410096
prerequisite-patch-id: 78bcc660796fc4f73b884d17a1b63e62f99dfdd0
prerequisite-patch-id: 62d0b3678cf825bca51424ad85cf35ebdd6dc171
prerequisite-message-id: <20250824-k1-clk-i2s-v5-0-217b6b7cea06@linux.spacemit.com>
prerequisite-patch-id: 6f2626811da4833395f52f712d9f2a5fb553cb48
prerequisite-patch-id: d2594982f7a8f39c2aa4f21490a19e93ab67254d

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

