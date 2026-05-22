Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E7D3002B6
	for <spacemit@lists.linux.dev>; Fri, 22 May 2026 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455629; cv=none; b=kabHY1SrqRKcda9f4w6MZQmsp6OLu+fRi/CP2RjgzlYZ2Fud5L5r6zcxovFnft8xEKW96O2zWUxQL7r1erJHxgVaVuxgSzSxpU9XleIG4Cf/atVVNa1RQkdrVdJfhWvFOO3lXhQHGdz+fUzq+jgkMq/CFUrqP2infckq/0EfAmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455629; c=relaxed/simple;
	bh=PtpF+cuIJUZq/GMFnyapf2U8HG58qtqnHkvpxeqSh3c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KEQcVMa3QJ66Cf37nBi118O4fgiPkWQYvaR37bChzg2M3WnidgdMWfxL4U/SWDfM7eanjKfSQZur2tW7QrM1a0T7XAu8o1xowp+xbl/9fgOWko/vXReXDtlxQChxraiH9JzzyRAGLc44O2n9UJ5HGBV50qR53SuRL0AaBitAd7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ro3CP7j3; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ro3CP7j3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779455546;
	bh=Yh/ET9BIE0+DfHxutKWeEWc5++1D8UEwlk+vOWotn00=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=ro3CP7j3gYX6dAaADsBSK9GT79EJLGy5J8ZpAdzoquJV0vd10yzhXFSSf8bkMf9gB
	 pffT/Zx3OtfRde92kCs6tvcVHW3auOTYa5xpqYdLa+UhziQcJ7nYn9lQBAGIws/omK
	 q1IM9xOUdzTdNvagLbxoBrTI8lvDEWaqjDXI1DpY=
X-QQ-mid: zesmtpgz3t1779455537t7d74ee71
X-QQ-Originating-IP: IxTqUQlS3b6S7BGCxY9uBCCoeQZJ4+tCFShJs25qSqQ=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 22 May 2026 21:12:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8814191299974206583
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v3 0/2] ASoC: spacemit: add K3 SoC support
Date: Fri, 22 May 2026 21:12:13 +0800
Message-Id: <20260522-k3-i2s-v3-0-08e3eb811d93@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw6CMBBFf4V0bUk7vKwr/8O4oGWQUXmEQoMh/
 LsUg25c3uScMzMziz2hZadgZj06stQ264gOATNV3tyQU7FuBgJSEUPGHxEnsDyBHEEeRRanKVv
 hrseSpi10uX62HfUdzeBtT1Rkh7Z/bZec9NweVXvUSS44lKhUoaVEo89PasYptF1usKYhNG3Nf
 N3Bz0/E9ykHq69MoUuV6CyJor/+sixv2a6YYfcAAAA=
X-Change-ID: 20260427-k3-i2s-52ae21807466
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779455534; l=2050;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=PtpF+cuIJUZq/GMFnyapf2U8HG58qtqnHkvpxeqSh3c=;
 b=lTteNfa6oOcdvZ49tS0OQzaY1PQEqdcFR/zGqzJDm+azeZdn0b1eUdD+QeiGs6e28rC2Juh0q
 LWCxiRIuQTOCrqijofRYzVLD6Y3xZgPyV6KDe7OTgPAkotf+1/o5gDd
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NXNjDmVQe9XhOvLTqG33Fgga9sfP7+EI4E115ho4dbUqhhHB4U+T76Hb
	YcEOf+fviXDYbgolEnGWdcnFzyMO5aqbxuCv+tYo6h0ZpJWhQZQ2P0owRy581bXOPb/riD5
	+604n22oRM3eMUP/kQ2SHOZXxUAniAwYQa9YC2aY5rpSyL8NWbExKD48ohZE+RQRiI2uUX7
	2zJ14b7Co26670hfHcoIRxCl2Rrn64IVTFUqYYoqQTZQ7/pIY5VggXA1GL0OBcOF/lgMS9D
	OKMcoc9wjauyAOXaLDq++B5k7uXpfF89pImvo6sUCqlsPHdkBry7BSsvCRsUFFMNygFDUJm
	6AX7hiyJpOcZdYgOUteiRjHRUuLfGbvE5zmLAST8Jks++/YGEPsfQ3/NBqKuNMk9wCQ/FXA
	xIHwsitex46HlcTe6Tazr/HgiPDnBdthJ08E2nTbIVmbRvxeBnmHpx6d61wGfx8EqTnJeR7
	YkLNi6e4mqpYpIR0wsugLeyPxbxjRXeU9XeVkB6czjRqYo33e2XPhHnMnK+IdQQZWLMJASA
	75C+UBUt0ahZJFxeg3xSGFBVQilgWO8xv+NeETG9O1Y7VQMWuhLM4XTbCV1WZnlodSYnp5T
	mQ5BXS5/WONXav+XwJYkKYqi1hLW1oVOnyLgSgzlCBS2O0z560ZMm9GTGMCYUqwejGpi7Yh
	gP1jQy/JCdHbMOk/EAFt52iUqZa9v0DzKovcuejWBcHxY173/eMtJAGYtSshUWobvTcjqrc
	klQV7dcy3cJAOpGhMsxZvn2743iaZTwRCZY4HqOpioenJlVr83anEQWotY39bvfWd03TGix
	JajSQH4TiLulueNHw1aGbf0tBEO9lPCbs+YanLUTNrk2uNyFnPSvTCR38zXN8k0YtelVZSW
	gk11sXEok03BgTS5LKUTDYQg6sNdBexLUjg+/FFl3781I9SLvq1ZZ6CSfT25B+yio/VPrxq
	1TtksOcQfhfZgCnePRKcGt9YkN6t4WCF8L3a5/ZhLzeUDrNH6cLUITnGgP3vMuZ05tnLgEO
	Vau5kT/otvEclDz3vXfyBtCDqKEXTP5+sYiW0pPA1oNO+Fm5izjV6x61uTuiNY4X9VsZnZT
	cxeSpJPpTGQiodoqqStS/O7kVenOUC+3Wi/dwNe+VLYvB6oDenkAhEmAkZOnPe8Rdv+5CDU
	GzmjU6ebAg13JFepDOBwZ4BSLSs8OkhgXFGA4rA2zKB+QYU=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

This series adds K3 SoC support for the SpacemiT I2S controller driver.

Patch 1 adds the dt-bindings for the spacemit,k3-i2s compatible. The K3
SoC uses the same I2S IP as K1 but requires additional clocks
(sysclk_div, c_sysclk, c_bclk) that are shared across multiple I2S
controllers.

Patch 2 adds driver support for K3 SoC with additional clocks.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changes in v3:
- remove patch 3/3, send it as a standalone patch later
- Link to v2: https://patch.msgid.link/20260507-k3-i2s-v2-0-9cdbf95b7533@linux.spacemit.com

Changes in v2:
- Drop bug fix patches (1-3/7) — patches 2-3 already merged, patch 1
  split into a standalone series
- Drop fixed-sample-rate patches (5-6/7) — will address shared BCLK
  constraint at the ASoC core level in a separate series
- update commit msg (1/7)
- Add rob's tag
- Link to v1: https://patch.msgid.link/20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

---
Troy Mitchell (2):
      ASoC: dt-bindings: add SpacemiT K3 SoC compatible
      ASoC: spacemit: add K3 SoC support with additional clocks

 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml | 31 +++++++++++++++++--
 sound/soc/spacemit/k1_i2s.c                        | 36 +++++++++++++++++++++-
 2 files changed, 64 insertions(+), 3 deletions(-)
---
base-commit: f58f2e0137c2132a08a1ab42720a9540cf0093a8
change-id: 20260427-k3-i2s-52ae21807466

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

