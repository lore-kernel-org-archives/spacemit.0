Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.77.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E840D22257B
	for <spacemit@lists.linux.dev>; Mon, 11 Aug 2025 14:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.77.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754921207; cv=none; b=IpX8+eUUT0rKJa8/S679XSFKKCUCf/mXmIlfWKtZSc+qoLkYxKopt0MWT15ahmV4U2VVRioBCEW8+HunlTLGzEGe5fL+g4nyjbGgZ9c8WM/x2okSaIodW8jm6yGF0icleZ5FCKvh3xE8qfluRxvQ6M7hHDXIYyHk04DqG/2gslo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754921207; c=relaxed/simple;
	bh=zplxlX8M8Ix32mf9GhxThytJEQARRj5h3yz1CZH/uYs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mCIoh/2CnGOOZrP2I+aplf61wpA9oQQLAuaNAswxqhQerh77QisUuDoM6sctvZBEjOK/yRW0DQ3lioBrKStlfrt0mbKIKWAnvxQJryv96JjyCb+/0hmK46kLSV1qBECmsY6jqolhaCoWbn69v2eUFT5YrekwdfFawEzhZRTS6II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=VPeTNaNv; arc=none smtp.client-ip=114.132.77.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="VPeTNaNv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1754921078;
	bh=6P1D/ZrZD05cWpNUR0xzM5levw6Qt08PvmnlyU17ke8=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=VPeTNaNvxnhMBJXlPHubon/N+5ARXqDpP210poe3XlaU3aSLibA/0awKkI2ZjUedd
	 TIoyPddgnE4g72NwHJ+W0Cx+vT6Ki4lxmzB0dZnJduwWy3C4DcS1BTzMEcuCZcl3bp
	 9mD5Lq2B2z3w9Qzzid3gxrQkidOkLWYlqPTFA0Zk=
X-QQ-mid: zesmtpip4t1754921076t7e138ce9
X-QQ-Originating-IP: eTLoZc3p7oyCNC0JObN64YGwyJoMr/R24ZnHCNREhb8=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 11 Aug 2025 22:04:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12834372004282179725
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/4] clk: spacemit: fix i2s clock
Date: Mon, 11 Aug 2025 22:04:26 +0800
Message-Id: <20250811-k1-clk-i2s-generation-v2-0-e4d3ec268b7a@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGr4mWgC/3WNQQ6CMBQFr0K69pO2llRdeQ/DopYn/IBAWiQYw
 t2tJC5dzktm3ioiAiOKS7aKgJkjD30CfciEb1xfg7hKLLTUhTxJQ60i37XEOlKNHsFNySAAVpo
 zoKwTyR0DHrzs3VuZuOE4DeG938zqu/6K9k9xViTJVl4XuBuY6njtuH8teRydx5On3A9PUW7b9
 gF8hnJZwwAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754921074; l=1959;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=zplxlX8M8Ix32mf9GhxThytJEQARRj5h3yz1CZH/uYs=;
 b=SX+mVoR/mVC5cwNpdmanNecKYAdkxQ5ek+Nhb1qNPL3qB5Z8mofIfNgzg42Bih6vN1QYSbeqi
 ObP9CxSzyyhCx8jozDp/fnHMXUI2VmGvCeN7UwFFYnzCH0c+cEeEKIA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N1pi+ljkw5v0yYyyfyAPwwwmRyIFYIsPQ05Hvnk3TlOywtQoKMGAg00B
	TZalaiprh2zdaDcUK8+GnQ7rr3umsI3M/nzJgFjmBpL6WvOIG6+dwbCJoi9+oZREmrTSHI6
	jti5N0NxFQX/5Jd3ZQTD3a1iOKOmi0VnryJKtGIj/QEdEUoJIUb8or7DAzi+/u1OTOJomQL
	UDH4hRklNxlHqToeQqESSr7S5d2Q9OtgO/cOAghyAUCq7DfuYZ6Rff/U9wGmggP0s0w3H3s
	HRjOEcZO4wmZnqldUtYSu3TrSRRO/Y22vBxomTt/HHcAfe4UdxDUHOsK37DduaCRfJQQdeC
	s7paucHyCOiNXR/2Hbi/8mAOhtdcUKR5x/Rnr7MJvIVuOTsiE816WLOcu8DnSILZ8Ps/G0x
	A/1fQprshBlm5DDfdxv0xpZsg9BJJWca7Zs8OdnQyEG7KgGJCM2N9OSPIBlMBeSMT2/7xM4
	+Csd3lIvEUejWCfYbh2fB+kdUeZ+dqv+vtYjRN4u+xYL36z80KphvJSaYx0QC6lbWLbx/7U
	hGbQ38YPpfurFqZHJy+fjdk2RDYNjt23xI/d4L5MWHJ8xlpMp7dZXAyObfH/doR1AqujOYw
	ZBXGxbdA1Lqs/hYnS4s42DFIDUMoP+kAF1VL3m9cYlO7ApoZ1Rp/nL/EMAljeEDmKvXjcbB
	rdSKVkNwsayv+KL/Ct2vDEOwLEYPPITKVVR9ceU1Qj7ws70DzsLy83Q5QUEE1txGpIGO2Tl
	n4CA+/D3OqFHNbA9G6vSzrrXPgcIWGPqRMu3BzpOodRsyH83l+eiiF1Ba8iM38m+wJw8alJ
	LtM5MMcm+MT06uDNyIPqHQ0MPaW3pOarE704V3v3t5JpKZFOnLgw+kcw0Hiq9VZryJKEHHK
	+3x9DN5lgBvcsW6JLCX3sdPAU2KgKlZPeClyWFdauZNTCmjYaww2wbC6tyMp8frCuuPH5PP
	b6w5mNhM4DXEicf+k3mU5YghHDgiKisqOF+az+qGq1v6/Gm6fddGyGp+qQ5GAD1decZ/SCE
	/hj8BFO+siahDsEOMG/qB9XPR6IEULwbw93nfyQ845n3hyBU6o2iPGVXaJ1sOpnYqmPwHSx
	C4RMerarACRnjB8P0rJsO0RygKKjauOEWFx4YK/a63QuOKSXW/2g/e6+11hG4wtnJKX8rYL
	pl4863apNJ252YqAKwXoHZ49YCyMQunoi8ur
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

Previously, the driver defined two clocks for the I2S controller:
i2s_bclk and its parent i2s_sysclk.

Both i2s_bclk and i2s_sysclk were treated as fixed-factor clocks,
which clearly does not reflect the practical requirements for I2S operation.

Additionally, the original driver overlooked some upstream clock sources.

To fix the I2S clock, this series also introduces several new clock definition macros.

The I2S clock hierarchy can be found here [1].

Link:
https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb
[1]

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changes in v2:
- change the macro for i2s_sysclk_src to CCU_MUX_GATE_DEFINE
- introduce factor for div clock
- modify commit messages
- remove CCU_DDN_GATE_DEFINE
- remove CCU_DIV_TABLE_GATE_DEFINE
- remove reformatting in k1-syscon.h
- split patch2/2 into separate patches
- Link to v1: https://lore.kernel.org/r/20250807-k1-clk-i2s-generation-v1-0-7dc25eb4e4d3@linux.spacemit.com

---
Troy Mitchell (4):
      dt-bindings: clock: spacemit: introduce i2s pre-clock to fix i2s clock
      clk: spacemit: introduce pre-div for ddn clock
      clk: spacemit: introduce factor for div clock
      clk: spacemit: fix i2s clock

 drivers/clk/spacemit/ccu-k1.c                  | 28 +++++++++++++++++++++-----
 drivers/clk/spacemit/ccu_ddn.c                 | 12 +++++------
 drivers/clk/spacemit/ccu_ddn.h                 |  6 ++++--
 drivers/clk/spacemit/ccu_mix.c                 |  7 ++++++-
 drivers/clk/spacemit/ccu_mix.h                 |  4 +++-
 include/dt-bindings/clock/spacemit,k1-syscon.h |  3 +++
 include/soc/spacemit/k1-syscon.h               |  1 +
 7 files changed, 46 insertions(+), 15 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250804-k1-clk-i2s-generation-eee7049ee17a

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

