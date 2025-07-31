Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D322440C
	for <spacemit@lists.linux.dev>; Thu, 31 Jul 2025 14:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753971364; cv=none; b=Mb6qrkioqDBnHiQLQbomDTirZVr1AoVlCm1NUYgeumJFeQk7ZjnIQbBgIduCupIQH0UAXhcn9xdrsEMWcAzmL+GUrSKNnOjCKuGwXOko21ZMO9rWZ4ZeQmmKOM4kb47ew8VTeZBzTlJUt4farUnKsUsDlvsMOHAs/9206GbWbgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753971364; c=relaxed/simple;
	bh=MeZJ7iFErxrIWkTZf3XiMeKPBVZVufDsMgudwp5Pj30=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ahfd6jDPWZJHMA3tAXtNebNFUvBSJdcBiZnB492WcnaBtjT5klz6oERA0zftCcbMSOC/R/3LxG8o99pLSGHizT32YQUumN0ubY+Bda26Snr3MhEq6o9xKPH75XWUeAjrQuAgxEV0lCcVhJsEcwx0Jr0IOjrCGJxGzI7bVYzM+As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=KR+HqVWq; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="KR+HqVWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1753971263;
	bh=y5AT6lF5XTZBycAdijjBHgbPYBOSCrxMOhOkBi/y28E=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=KR+HqVWqgzgDwanAObK7zJoInckLYogNfq/Sol7N6VT5U4ELO5KciHdIivSdMiFnd
	 sfFuBlHL4+mTW3slV+ZF8tqGElBw6b6UH1dtpphuReXg+YoiCYT3np6+GkPZ/eJOME
	 PWya07t6yDScwSyHV1eMMtIsveUt+z36CWf+2SMo=
X-QQ-mid: zesmtpip2t1753971254tbad9d452
X-QQ-Originating-IP: kw5QdBICyGZpE/R01gvvA+wL8LDI2K5Km7e1hNHDSm4=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 31 Jul 2025 22:14:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11873278860039367758
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH RESEND v3 0/2] clk: spacemit: fix sspax_clk
Date: Thu, 31 Jul 2025 22:14:05 +0800
Message-Id: <20250731-k1-clk-i2s-v3-0-2f655ddb0c6f@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC16i2gC/23NPw+CMBAF8K9COlsCV0jByUFWBx2NA5SrXPgbi
 g2G8N1tcMHE8d3L/d7CDI6Ehh29hY1oyVDfuSAOHlNV3j2RU+kygwDiQIaS1yFXTc0JDMcIJOh
 Qp2FcMPcwjKhp3rA7u2a37HJmD3evyEz9+N42LGztlwPYcxZ4wEEnWGoUZV5Ep4a61+ybIVfY0
 uSrvt08K/ZG8mMIZ8SljGWqAwCQf411XT+BjA8f+QAAAA==
X-Change-ID: 20250717-k1-clk-i2s-e4272f1f915b
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Yao Zi <ziyao@disroot.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753971252; l=1801;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=MeZJ7iFErxrIWkTZf3XiMeKPBVZVufDsMgudwp5Pj30=;
 b=l5Pw2gYPmhUkf1L5UIOu0v+z7f9SM0aedihENvDPX6gEWxnmNZNHB+um3AiA0UeUkp491rvx8
 D1hJ639UelfARKtSab+txoWd56/wQa1RXBmSAMdfXDLfnHbhwxgcdUS
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OTdZkFSFpSWsxnN+AANs9q/pv1Ga27eOe7Kwiylu74jlLDilJMvLMxvy
	KlqjoE7iiHL7mDGPpJQjjlQJmXxoY0xKSNEnCK/KV/LdOHJnDDf9hDDSIfn885jxrjB6wRk
	rgsdl1JCnnJoO/O0odM39SYrTTOQvuoi3wW5Y6ADAO0QFGNlJjgxrCjkuTgtOcDaTkzMUyq
	VpDZWDSer71K9WzX8wOdeg65BEFEOGC9BAagh98Tv9WU+3koZLPj80B2CR5Urc4H94ChuB+
	M1yh2J4OEEOKoh75xw9zDrudUguWcxKNun0vRKGsuOHV8iFVyxPISISZNtGChAlBgfycjKC
	MsiJNKCNAvHMW/l+3n3iTnzgcPfgeZxFkyhs6QdstmD1scmqY2bf/uK9GvmPKcFIxXULBlk
	PSFKnIi3VFWOZy/RAoGLqc9HAjnIWo/jmIoS2LkQaPD05QgWHjZHAv1BiHWBZaWnKpRqNZG
	fsLrOgOYmG3E/5igAj29szuzWJ3XKdY262dKZGeunA0rH2H93vA+aE3s+8gxS+LUqLFH9Xb
	kzH/WIW84eUFj/FSkgco9nHU+hMke622Iyo3mWTekIlk/benYFDQXPpt6k4fZcgXB65Sz4j
	IxmSNCc4GYQBulAuCaJeLXzIWszIzu3T5eMKyFh9UjZIh3tZvnryGFWyCoQrvJp1aPnojG8
	haEVv3erhTp4cZ0qhj3ifIyM7lpBAOcAuEQUu1LPwUhSHamM//kYQfhyJq1NPZpIzI2Y1a3
	vspsQscnHpT7PFsP8JjV1nyLo9hNESV46mo9ENlRuaw3pjf5vqtO7uElpMFl2DzGW0Pn5fx
	g1NyAYzGDhwU6/x/vzCPTYuD4znOkSPhFxjLQ8K2M+n2yLGe8F1EoohFDhllO1NsZ0LuQ74
	cc6+VRPNnL6XBekP004Ph2F06z7XkFf3DLWM3GUgPwQvG5GAWNy7ESxi8nkpVxJUWmGprm1
	sB+ITSHSXn7dT+UdmLOPQwr+szc19SM3dzayHX5HcO3+6ReVGsUomzGC6gUE0f+fe+Gkl8B
	A33IbxPddvP/KXqVRTD28tSiwMXbXft0VXORAUY5hwcw2D3iGr4/1qloGSgS60YuE3YDDNR
	ezbJi2tjB8hbLlwE0axhUVsZyCMIvIvY7xdZUmggL4L8Q6y8a2LTUfJQlsUoP8rRSyzQW9X
	i9MM1B6eKp8WWI/lBB7WKqpAjQ==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

In the SpacemiT public document, when the FNCLKSEL field of
the APBC_SSPAX_CLK_RST register is 7 (3'b111),
which is a reserved value. And BIT3 of the same register is
a reserved bit.

But the documentation is incorrect. In reality, the value 7 (3'b111)
of FNCLKSEL is not reserved. Instead, it indicates that i2s_bclk is
selected as the parent clock. Similarly, bit 3 is not reserved either.
When FNCLKSEL is set to 7, bit 3 determines whether i2s_bclk is actually
enabled as the parent clock.

In all other cases (i.e., when FNCLKSEL is not 7), bit 3 has no effect.

Importantly, whenever FNCLKSEL is set to 7, bit 3 must also be set to 1,
otherwise the selection of i2s_bclk becomes invalid.

Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
I sent with a wrong email so resend.
---
Changes in v3:
  - Fixing ABI-breaking behavior
  - Modify commit msgs
  - Link to v2: https://lore.kernel.org/r/20250722-k1-clk-i2s-v2-0-2f8edfe3dab4@linux.spacemit.com

Changes in v2:
  - Use virtual gate instead of new function for sspa
  - Add Suggested-by tag: Yao Zi
  - Add Fixes tag
  - Link to v1: https://lore.kernel.org/all/20250718-k1-clk-i2s-v1-1-e92c10fd0f60@linux.spacemit.com/

---
Troy Mitchell (2):
      dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK for SSPA
      clk: spacemit: fix sspax_clk

 drivers/clk/spacemit/ccu-k1.c                  | 25 +++++++++++++++++++++----
 include/dt-bindings/clock/spacemit,k1-syscon.h |  2 ++
 2 files changed, 23 insertions(+), 4 deletions(-)
---
base-commit: 733923397fd95405a48f165c9b1fbc8c4b0a4681
change-id: 20250717-k1-clk-i2s-e4272f1f915b

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

