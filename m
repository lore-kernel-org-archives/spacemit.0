Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2B516DC28
	for <spacemit@lists.linux.dev>; Thu,  7 Aug 2025 01:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754530303; cv=none; b=oU4JAxb4yT7bV0X1krug83POyHUYdYQ/ApiiHuI62bew6jjF8jxww5uLLh/lhzKtRGHOMZEPGZw5nQN3HRNwvYiPoa/s4B5pAigpAvMg/uYKnZ9/fHOhDM7wdYHBCiwGwv1V0BYJM+79lmh0QHYPqad594UqfvXyLKv1o+M9X1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754530303; c=relaxed/simple;
	bh=Zsnd2yhm0e8Z7N/XbjGsxi9+PjwfVA0yvEOrhmxO1r8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=neA/mxxk0lxljId7x8iDbXBVCqpFWAypMH4kgoaAYN7xawK1unaC+4EiHwVkbctjraJ8OyQ3SLuy25czS9nit3eYmkobtyzJRnFXa0Lm/l1DciN40ywoCPhJFQKbpotUgKsaoojsa422/hNffkZXcPDwtEiAZxbLpSY/QlgFikE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=p33yJ8Sx; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="p33yJ8Sx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1754530214;
	bh=R55Ce30YMHeTG1lDNGUKrl/+gpE/GNdMkbzIFbY7bEI=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=p33yJ8SxSVmcTekxaD3wR33iCCCPtaIfEWQQNgQDQQNo0x8tBdg4R+5OgsUpdCqVN
	 eLpshpL57yB7nFXbLl4j5SQdqAsr6cvNQXShA7yeWnB0PLs935l8KC0EiwJ1A7EYgq
	 Sj59ORocuQ0YYWuhJ+rDcYlUwSiqpFAhrKKinBBc=
X-QQ-mid: esmtpgz16t1754530212t66e66a1a
X-QQ-Originating-IP: 87YQa/E+l5byIBWQdG0icPTbS7PxkSsJP/II3qCKtys=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 Aug 2025 09:30:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5881493761293327476
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/2] clk: spacemit: fix i2s clock
Date: Thu, 07 Aug 2025 09:30:09 +0800
Message-Id: <20250807-k1-clk-i2s-generation-v1-0-7dc25eb4e4d3@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKEBlGgC/x3MSwqAIBRG4a3IHXdBpeixlWgg9VeXwkIjAmnvS
 cMz+E6iiCCI1KlEAbdEOXwOUygaV+cXsEy5yWpb6UaXvBke943FRl7gEdyVBQOoddkCpnaU7Rk
 wy/N/++F9PyMipt1nAAAA
X-Change-ID: 20250804-k1-clk-i2s-generation-eee7049ee17a
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Inochi Amaoto <inochiama@outlook.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754530210; l=1573;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=Zsnd2yhm0e8Z7N/XbjGsxi9+PjwfVA0yvEOrhmxO1r8=;
 b=0y4pPVuvzy8we9mgGSoUWCZEz15xMZi/SA/847+BJGpcTkqgMsSMohCJM+mYV7GLAqMsRhOle
 LXLTBsvHm+6Cxooaj4TmFAcWbbyM7yOuDY9ZtiUXZegifGLQyE6s7is
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OUwDEvzsARlMJw189fwr6MSqHIxoqHxf3qwUSFqzFLVPcguHmUJbRHyh
	cykMloGH0zN0tDSlfPXODtag4egzRxALhoeR2AGHAvdzUDuYVL4HeEGAO92X7KF4SAHlc9V
	i12A/xMjYFJxLbKBrhklOsTOsoWgpp1mk+A0BFf4KCFg9PApW2BdXEODAmOkRtdkdzMWTBa
	jCfzbSuREIM6vV3EWQJTeKCEvEn4RxKYc+ByBt03AXLG9K94RcVzSJ9MSoYB9zujBfU1z1f
	4Y0+wEmAQ5qNZ8QP326saFwG39CK5JCJsBUPQ5EHuN3A5rSCDgPZsHFdqf7O3fWjrJ6AP05
	30yMaRQFxTDc7qFTa8u9Vr/+6brDMaLwzRH7j6t74MpK8tcSkykjCUg35hRKP8mFLaPBqR/
	y9+N8Luhx5vgjxxpURh+1UX45L7x/XWDySsLN1NJgqVTrBNF1mSqIGSlzN6juUHIQJ1PCyn
	Oxe/aJnxvM2rxcvL/pRkutdL9k6qTO6LoujlUwCFASBFeHPzw50BF5/VFslRIeu65QkwWns
	s7o71Tz/8uH3P0NfIDdffk4CthJS3yS/HhRkUX8nBcF5pzdSLKLfWpLrfGbxe1v/TAMELh8
	aYR3ZUAcePvLvFB/00/u9v06+5EiXwrVsUBa737MZl043dTfaA/4Ls3SEWwP8oE0bBL/NZ/
	Wdsr6lHCRH0FHtKEtFfeXlHkXjGNUGGUrYOpiGm9NiBE+KzQ3tq/fJqsHsV4FAxGebNLwAI
	eZFnJ0GBBbxXYneyfwVEVtk5JPinLMrmGsvY848y8M3M2ZIjTDrNIWkiPnxqN5MV3WoO6kx
	Qov5fe/Ve8DIDFi2VY89FToauS7xE6wcIu9bVSbIO9SzWzivw88Lsjzy7FBv6YPLWKGZ5mV
	aaPLNPJ30Wc40epnKoX19a78mJouGwAcq5tq25UmIRRhfTRUuF85rxw2TrmQa9Ejuvg8ufF
	vebO0wRTb9RHxcOIFgFvDtrcq7f5mBCI+39PIBT4KdoSFB5ZeMY7u9HRkV6eg1RUtN0TNVf
	qUaNzHIbHdx3a79195/PPH0YmT64me6DaaAh8CO7e/7wB5iAh/0v+DgRWWo/MTDdXYbNWcp
	tA27lJVbPFPVqR9R7kxX6/29GXNv7Me1rHLNk0T13RVGd01FsIiOzkxXUKlRyIvZQ==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

Previously, the driver defined two clocks for the I2S controller:
i2s_bclk and its parent i2s_sysclk.

Both i2s_bclk and i2s_sysclk were treated as fixed-rate clocks,
which clearly does not reflect the practical requirements for I2S operation.

Additionally, the original driver overlooked some upstream clock sources.

To fix the I2S clock, this series also introduces several new clock definition macros.

The I2S clock hierarchy can be found here [1].

Link:
https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb
[1]

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (2):
      dt-bindings: clock: spacemit: introduce i2s pre-clock
      clk: spacemit: introduce i2s pre-clock and fix i2s clock

 drivers/clk/spacemit/ccu-k1.c                  | 34 ++++++++++++++++---
 drivers/clk/spacemit/ccu_common.h              | 13 +++++++
 drivers/clk/spacemit/ccu_ddn.c                 | 47 ++++++++++++++++++++++----
 drivers/clk/spacemit/ccu_ddn.h                 | 25 ++++++++++++--
 drivers/clk/spacemit/ccu_mix.c                 | 47 +++++++++++++++++++-------
 drivers/clk/spacemit/ccu_mix.h                 | 26 ++++++++------
 include/dt-bindings/clock/spacemit,k1-syscon.h |  3 ++
 include/soc/spacemit/k1-syscon.h               |  7 ++--
 8 files changed, 164 insertions(+), 38 deletions(-)
---
base-commit: e991acf1bce7a428794514cbbe216973c9c0a3c8
change-id: 20250804-k1-clk-i2s-generation-eee7049ee17a

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

