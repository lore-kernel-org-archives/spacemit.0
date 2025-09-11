Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.67.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AB723372C
	for <spacemit@lists.linux.dev>; Thu, 11 Sep 2025 03:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.67.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757561736; cv=none; b=q1e1LwHqCf5sZgkONFF+aVRNm7oHU+NIgutV1JB6Pg9uiSJEuc8CdH4etaAHgEOyVNfz0HvkO3xv+OW4h4ySGPrtLy8Imj4wrHcPWxsuRYAsAl9vpRp913Pi3a2G16nSZ7TzleurydZujOCzorXe+zefc2u5jGa9otY09K677iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757561736; c=relaxed/simple;
	bh=SNF4Ar7l5ETepgrEt9Tdj64fl7ZYHb5tuOdDXioZJkA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W4USGW8Xz1WhVLPD7GCbUQMmdUKjumTGU94PfAemizvHTVlEC4+zwTfNyaK9fV+9MDUwKOvLJIFLwgdwdCwhtnQCmI6ac0tj72D44JFy2D+gFaxWYWZhtyJZYMoXFz8eKshJtJfVr/6aNQdRC2RJQYlo+eDmjuLwMXN5WqZseVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=SlEny5mz; arc=none smtp.client-ip=114.132.67.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="SlEny5mz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1757561661;
	bh=2utoiyW6erBlq4zsT91AaE+a5OP/Nh3b79cTCxZ9ax4=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=SlEny5mzFHRTno/5Wdev0aRh4Z3jwnyVsPDCJ+m2Z6pKXAhEqT5oExrHrLwJvsoTD
	 Y6ydA9hP4tnEYcvg7NlKjcvwB1OIQBAE57w4xHN5h3QAk+eJ6o/kNJzHPOlylCJPAt
	 RbhRcogT0NtMkCOj65sg7SbF2YqxsT/w8eYwHDH8=
X-QQ-mid: zesmtpsz7t1757561647t366c31f6
X-QQ-Originating-IP: d8qjj0eJlWiNFsCVgMt96ZLpG7+Y4mEGway5wqCSaxA=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 11 Sep 2025 11:34:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10692195372425010115
EX-QQ-RecipientCnt: 17
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH RESEND v4 0/3] clk: spacemit: fix i2s clock
Date: Thu, 11 Sep 2025 11:34:02 +0800
Message-Id: <20250911-k1-clk-i2s-generation-v4-0-cba204a50d48@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACpDwmgC/3XOMW/CMBAF4L+CPGNkO4ecMDHA2qGMVQfHfoVTI
 EF2iKhQ/ntNxMDQjO9O77t7iITISGKzeIiIgRN3bQ60XAh/cu0RkkPOwiizVqUi2Wjpz41kk+Q
 RLaLrc0MCsIoqQFsncvca8cP3yf0Sn/vD/mMnvvP8xKnv4u90btDT9iXbGXnQUkkbvFmjJlAot
 mdub/dVujqPC/cr310meijeOF3OcUXmSl1UtTEu/1zNcvTOVXMcPTmlLSEERaj/5cZx/AMVQi1
 DaQEAAA==
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
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757561644; l=2351;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=SNF4Ar7l5ETepgrEt9Tdj64fl7ZYHb5tuOdDXioZJkA=;
 b=x7NrYgZy0INESJO4u4DkM9OXnGiX7emJ8ezFJxaZXuGZGIjmJfDhEjoF8OzvKmgD0mkgrL2K2
 w+aFZZoGAOfAlF1PoaGjZxqpmTJ15SzK99io/PWyBDSh8wTuqM0E0zO
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MjQ00mYXMHtudF5AzAP8MEl6DSiZ1c+ALfCiUo6gsGHfk/GI9hvNMx4+
	TiUUzokW8XiK6wsQ+hwifLMzDC9BjzIbw0DEIqh74NTZnEpfT8e+Amtl2OgCTEIN71ZiT4+
	IfgeiBdeVDi35wO6wAIgM7jdFtiNuvxjhlV7uN0xVqL7GIF84GE3/wK0Bd6jnd4WY9Vw3Jl
	1aVqTAXgjRw4BGcsh/o9GtY71sPy49itirHeMXGs8Fih7hQS6ddpqBe1aSLNzglOUsXOb2p
	KOLrUOkDGQ2G6juboOiJV3pu3gsX+9tqBr5hSyI7CEtPSzksttDfpjLnQuEgI1AJhpbQOS9
	+0F0eVWNUDsN62mxsn9L3BMy89DlV0QNBMVYbA0/hMMuwOC9T6935FZM0n043n38FsUicOl
	qhJIFDozaFQ3eG8Z8ylxLEiCm5NJxV/8bphvYJYZAFxE2Zx4uMatDAwcKPCDfakc9PZoRYm
	KcOfve7IdqSr6yqjiMpPKgXlq78oR1q4RIIjhwiu72LNa6x1oOzSQsLn4p01GfAS+kUJtr/
	QaXaYggqdHzlnJmcmPHNFIylHYy1lq8AexCDApDvWeXmSq9v0Ll0d2AkB9rH3RUM/u+I64a
	fisN+KbaI01vLk8Um5e5v0DT+osegoUiFExxYG71y5tG3zyy2zT3cwbzQYXAZsWM3ZJ+mmM
	OO42HPWcZ+XOpVXTaBwwxsZNLq1qzK9ndLWrBab1lXZ3PBR1Gm5e2n6yqfi0tt40JEmjYeH
	YaORHkpDISlnKvu8i8mGnzsyLLiH3ViqEnS27vpaDH6dRkJDnW6GihZ3s7s1iiYCxealrwN
	iBsETl/4xsGF/+nLXDUYjQU1pmZVWLguN/aHzeocXSnzO58LQqSVJiadO8P/3fcdskjXvfX
	mY3btWIQpn2KgeSMIRumeUAQKnfo4rh3UWbi9q+2Ja6Lp79fmP7YxRsK6n28Wtb1/p1Sxji
	db9FN6M8tuO8wYMZC+pPtf5ydDxLmSiqJ/KM7/LFuUOPwaALwUMqO8Vh+gfUglRySu0WSfl
	8/54qbCHdy1MCUnWXvG/r/hCHWaYhelEDa7bVuvLVkn1mZRlY4Ymg74cAXCPxmkQL+cHA4K
	TBfOvr19Obasr/7lyI1QBs=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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
Since v4 of this series has not received any comments for a while,
I'm resending the patchset.
---

Changes in v4:
- drop the erroneous change in ccu_mix.h(patch3/3)
- modify comment
- modify commit msg
- Link to v3: https://lore.kernel.org/r/20250818-k1-clk-i2s-generation-v3-0-8139b22ae709@linux.spacemit.com

Changes in v3:
- remove factor for CCU_DIV_GATE_DEFINE
- introduce I2S_BCLK_FACTOR as I2S_BCLK parent clock
- adjust consumers in patch2/3
- Link to v2: https://lore.kernel.org/all/20250811-k1-clk-i2s-generation-v2-0-e4d3ec268b7a@linux.spacemit.com/

Changes in v2:
- remove CCU_DDN_GATE_DEFINE
- remove CCU_DIV_TABLE_GATE_DEFINE
- move gate of i2s_sysclk from DDN to MUX
- introduce factor for CCU_DIV_GATE_DEFINE
- modify commit message
- split patch2/2 into separate patches
- remove reformatting in k1-syscon.h
- Link to v1: https://lore.kernel.org/r/20250807-k1-clk-i2s-generation-v1-0-7dc25eb4e4d3@linux.spacemit.com

---
Troy Mitchell (3):
      dt-bindings: clock: spacemit: introduce i2s pre-clock to fix i2s clock
      clk: spacemit: introduce pre-div for ddn clock
      clk: spacemit: fix i2s clock

 drivers/clk/spacemit/ccu-k1.c                  | 32 ++++++++++++++++++++++----
 drivers/clk/spacemit/ccu_ddn.c                 | 12 +++++-----
 drivers/clk/spacemit/ccu_ddn.h                 |  6 +++--
 include/dt-bindings/clock/spacemit,k1-syscon.h |  4 ++++
 include/soc/spacemit/k1-syscon.h               |  1 +
 5 files changed, 43 insertions(+), 12 deletions(-)
---
base-commit: e3324912fe5a05a3ea439df476625e7c8efc2b9a
change-id: 20250804-k1-clk-i2s-generation-eee7049ee17a

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

