Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4564E23A564
	for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 03:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760671078; cv=none; b=CzLLZcUa49t03XN4rxIfclB8RMVMD+H5/KVSbuHP+MNoauS9QYjtPvkQazdOBqqY1f4CCnJxvHnq7juJ8G57GiHoXuNHbEPf0U2fZqjOysvYupdQFV/K7nZzhJG7OTLEktFddmw9NWllPngac08huB9h/Sjw6G/PL44sCWig/Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760671078; c=relaxed/simple;
	bh=H6MXMa94xtKyGaXuh1vx3wBJduWNEFwnAtdX4wGFjLk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jkwgKZiD9W1MEYUghAuXcLCc/bHb+D17m7l73M/nMbU+ds846lvUdD+cltVtq6FVyivS2B0aoRhditl+R8dUI3iyOx8XL4ezq7FFvH0kFFQTfG7biaS8z+jJt53Ur2zI/CZceYMbfzRs0jkCR+RVl/VB+20ky4WsgOK7kBXHm9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=gCuOe2na; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="gCuOe2na"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760670993;
	bh=9v+Fk5DTo7hNssP/g4f19A+iJjJ8TGD0OsboXHdESE4=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=gCuOe2na6REci+20vys+FnqGLS3KOT7gP17YE6vXN3ioNvTPmUVbXZLBicslMesH2
	 oIUXRXJtInmIMOrxDXcR0vu4kMUyv5G2nMn0xwe/kijkfFZRGaojRewoBTvrb6p1Fn
	 aW/uzjIXzQ2KJ3C/q6nJtGdld9PjcdXDML2hoVeI=
X-QQ-mid: zesmtpgz8t1760670983t788ce284
X-QQ-Originating-IP: qojL7vMlfQaFlybfSpLBeg6YG6SOl86XqCU3XD1N0BY=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Oct 2025 11:16:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15174984363743025248
EX-QQ-RecipientCnt: 17
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v5 0/2] ASoC: spacemit: add i2s support to K1 SoC
Date: Fri, 17 Oct 2025 11:16:16 +0800
Message-Id: <20251017-k1-i2s-v5-0-401ae3775fcd@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAC18WgC/3XNTQ7CIBCG4asY1mKYodjiynsYFy0OOlFbhdrUN
 L27qPFnoctvwvMyiEiBKYrFZBCBOo7c1GmY6US4XVlvSfImbYEKjSpAyz1IxigBTOXnhsrSFSI
 9PgXy3D9Cq/VzBzpfUq/9HHcc2yZcH591cL++utmr24FU0mmAzFZoVQbLA9eXfhZPpaMjtzPXH
 MW91eGXx+LtMXllKa8y5ZVC99frj7cAb6+TN7mHXOcavf3tx3G8AdtzFYQ6AQAA
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Jinmei Wei <weijinmei@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760670980; l=2628;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=H6MXMa94xtKyGaXuh1vx3wBJduWNEFwnAtdX4wGFjLk=;
 b=2qdTVowky+Z8Ihqbuc6bZSGsDb5dg0rzRSLjEhkDL4iVIM9eGvIGoFF8dupuXB2xLZZeMh6rE
 QPnp5+IJ4z0BtRSKUfZlGu4HhQNgQbnlmKLqGf3YgkOwuWqJnSaHu6/
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NtKu8ZqGWm0vPsqxeOCwG4+2Y7eBejomVf4Jk/++8GbAPmxbbhqw9smS
	fMmG/ViGrXIL/2hAIIyFJVdZjpwqA0xIuz5PuGeBmzHbGk1edwLZygAB4EQVlcHfXyY4GZL
	1O4s5xBkeHmHxwGgZKHqa96JsxNv2vTgOlNaKWXJ4xTX0CEMo6mTLJtxUqrmUWZ3QubDuaB
	PiA1Wq81k2/JEXE6840q1QmFTeiwFRNhaIRzNe79oS3NPH5x6MH/bBNGpSIl/t9e/rs6GGs
	DPVqCEEQcJbVJov2wxbh7c/U6KvssROemjOnYiqpogsrfr+1rsS3uD6q9nf/AJp06eLLAnz
	H9mGG6lzyhsiElaO4D+FS4koPNQG1g45pft6Q7yg7tSk2is/rTZcM2oKHeaAi09qiGVr9Fi
	62/Rj7rwwnrQjslTazk5InOA+q6Geqbs7Adt2ARkpV01x9WQhmZJfpDZ/LG/Bec73RcfmnW
	O/bTb0dPQoDFCOV1iET1jpWFIrgxFLQh52vysLvLslXuhFxG1WhiIsxxLSdnPr5YOWVZ6GO
	3zOyb2gGzDXNeK7juSVUgRe/R6lJKa9zk3NwPk1v8iSGvEktpVJoXnCShAbQx8ZUoiQQF4I
	9L1OqqPXhfYCK9e2b352sMAw4vESmNwK7qAfXjKh+3/Ye3q+fvfJwZlw3O194JEBI6MHNPR
	SjUjdP0DJ0PuxmtQNLmWpGdih7ZltIOCcDXun5nCcUFKMPBditpybuOVW74JqCS/Ek0u9Ue
	L1BW99OPM2vuIqpT4kXDe2zeFCM/A6/h+tFjg/OThrrtDOteu+pTziXfJ86MUXKHSewzYAw
	VIT85eywBU+XwQx/yr7uEvb5afNfP+HGrFjER8dQ6Dya/VWDpjiJ1os9DtM0JdOlhUZ+pSv
	9pK2BR8vG7qR3QpstGD58Zeg9stAm/Qg5WuWW8CWVOuebB9Al2rkGGeYIS/IUgMU0te7CpG
	zEEFs4NADVW4NT3Fn5aIPpUVa6OdvtF4Zl/r9KuIR5o23k8/k8BAC9kghBHKRcdMP/kMZNJ
	hyoXGJSViKQqAsVPqpWdAFR+uD6lcRmF8xQnei87QuYj5fK9LxurkgvqCeiBU7E8PiBvYxN
	1LTQbRR/+zJnIPMgiQMGXY+IeJstADS/LdwVj5IQs5IcxJsOL0zIbt90k2lgSdDGpWnp/jA
	AtxtHWDDAzF3i6/YJhmdVbK4EWHtgkxnpRLjRb8wRuRx2Eg=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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
Changes in v5:
- Patch 1/2:
  - nothing
- Patch 2/2:
  - dont't read sspsp value in spacemit_i2s_init()
  - set SSPSP_FSRT bit for DSP_A mode (was missing in previous version)
- Link to v4: https://lore.kernel.org/all/20250921-k1-i2s-v4-0-4f819f50e468@linux.spacemit.com/

Changes in v4:
- Patch 1/2:
  - nothing
- Patch 2/2:
  - Only 8k, 16k and 48k rates are supported
  - Only 16-bit and 32-bit are supported
  - Use the runtime constraint API instead of modifying dai->driver
- Link to v3: https://lore.kernel.org/r/20250911-k1-i2s-v3-0-57f173732f9c@linux.spacemit.com

Changes in v3:
- Patch 1/2:
  - simplify dma-names definition
- Patch 2/2 
  - remove empty spacemit_i2s_remove()
  - move FSRT setup for DSP_A into switch-case in spacemit_i2s_set_fmt()
- Link to v2: https://lore.kernel.org/r/20250828-k1-i2s-v2-0-09e7b40f002c@linux.spacemit.com

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

 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml |  87 ++++
 sound/soc/Kconfig                                  |   1 +
 sound/soc/Makefile                                 |   1 +
 sound/soc/spacemit/Kconfig                         |  16 +
 sound/soc/spacemit/Makefile                        |   5 +
 sound/soc/spacemit/k1_i2s.c                        | 458 +++++++++++++++++++++
 6 files changed, 568 insertions(+)
---
base-commit: 4f010aced22532eea2ef0d9a2f5db7c64a196fec
change-id: 20250813-k1-i2s-115bf65eaac8

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

