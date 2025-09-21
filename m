Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECFB2AF1D
	for <spacemit@lists.linux.dev>; Sun, 21 Sep 2025 08:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758444824; cv=none; b=BptTtRwGsomoOvaxqGT/kbVX5Y0fTpFmQOyE2BQqQUDyl0AOfYdsFOmnoSGm1YOcy1g4VENqTm+AGcy4uNjHriFxUzj4fogIuTWGW1UTKWTzqqEQA/vonfCJ778EaufZTywEOleNNEV+PNYRiCAalnmb8WoyIP/ECXBb3omVFLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758444824; c=relaxed/simple;
	bh=DmFeZAuzjiDDiooLpLk2yv2O/58zSRwZXt1vw0u+/pg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o1z4qOaOUe21I6UPNS3+SVTcqeBNqV/hXQJPHY+5NINMCqagZ7E0MIDuDHboNk2+TTM4RSHh54HHURqPmr3A92tKSLQE7XZ/V7sk31+qXXGPdj4ChPATzxMn4c7ab2qNBBsSo4cdnzyV/fLy1A0oq/Rja8ssdMgMEvVaOHAz4Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=D1vDftd8; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="D1vDftd8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758444750;
	bh=XBIBLj73RGnSSKnxJ4ZehyTUKEtXkKIYYh2qsFiM7rU=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=D1vDftd81rLqBYt3/beq0zPgq9PvgMq54jVRPj3eboajIlvn1C+7y5s+8gvzkSkCX
	 NN8PqU6qoVdbQqQ9GmQgO7J6ctA0KwOiQiXbibAUYnFhKe3aRRi+CI2m6SlYVzxEQX
	 bILAtwDfyoCsXDiPDWBcztkbGhIEhRdON9OGs9QA=
X-QQ-mid: zesmtpip2t1758444741t6bb70130
X-QQ-Originating-IP: fa4G0Z96TcIuLQMDYJVyH1WNdBxvsi2TGK6A1010glI=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 21 Sep 2025 16:52:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14739136981806942369
EX-QQ-RecipientCnt: 17
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v4 0/2] ASoC: spacemit: add i2s support to K1 SoC
Date: Sun, 21 Sep 2025 16:52:15 +0800
Message-Id: <20250921-k1-i2s-v4-0-4f819f50e468@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL+8z2gC/3XNTQ7CIBCG4asY1mKYgdriynsYFy0OOlFbhdrUN
 L27qPFnoctvwvMyiEiBKYrFZBCBOo7c1GmY6US4XVlvSfImbYEKM1WAlnuQjFECZJWfZ1SWrhD
 p8SmQ5/4RWq2fO9D5knrt57jj2Dbh+visg/v11TWvbgdSSacBjK3QKgPLA9eXfhZPpaMjtzPXH
 MW91eGXx+LtMXllKa+M8kqh++v1x1uAt9fJZ7mHXOcavf3tx3G8ASf0So46AQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758444738; l=2372;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=DmFeZAuzjiDDiooLpLk2yv2O/58zSRwZXt1vw0u+/pg=;
 b=RaWOlpC5FWPJwn3c47TkAmC+iLUD31NCfLHyxz/qOMkN5rnFVMjNAZFAmO+/oPh65efNMEq9+
 +MzyQEXLjgWBk4MPN/I0whyQLjfzh/m/rKrrS2hOzHfxR3PrCA29Iqb
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: ObGqnu1uf9U4ZQR0cTmgRC0j6x7hCztaQc6EPaB1xD9YlJP5X34xMpOc
	1vmLgDrdpsjBYNULRpvvXAQhxl4YeOWQ6B0idY/RiUXwq6E9uVfsnizKuMdobDTA56nwTbJ
	/k/AwuhxC2+nl0qmNnnzRJpcxBzCkxaAxZgEwEIZTpyM10s0k03Z9k1WpSfVT6762S/8l/j
	KChkfEge9zr8VQzOGglz5RxfYQNPyVVq7KLhgSvRHlcWnFTbnXCs/Q6g+rpVVB2x1LGQ8Vb
	ZFvdXqaeGn6bXclO/hZ7uECUIkInE+ksCzTh5XDlgDJpSem3r94AEUCMFddx6kf5PJMQnk/
	7SM4HSU94EWMSwZwkKr4GY9kL6bLMJn08pVP47nJDTMDy5AX2Iv5kJvl2Ahr159ppvPgOxW
	TY6gxuP5OuvqcXWd9zQhZ8arxzuKyWp+KooSXfxDokkx+C2fmN70udjhMium5bpOGSJC9TU
	kz3rX6pP/0jG+hQl5Jr++/AOHM1a7Z3pvqtr6XbDGknS6D+nm1HMFCOlJiFAxpwpesZJ3aS
	Yo1erADBRTY9hXsAhmM/crRFZfFhaV+n8kym9IvnJEBvorngzMxBf/VC1HGQak7LjCquF9/
	L3LKx+0zTkxQQHUQk6/wXUWVdAechaZ2qIBJ+DaA1KvHdf/lJ68L62hiYF3FZ7ULW69JFXJ
	qWMCflsMWbzvTdySmGm98Tp2/HzwZtStoC3WqUq97TPMCHo35oVDlobAHH8lmfzREGNHkHK
	HuF4hyAKAcz1jGjI32n09FNn0XdDAQLAA4EifgiOAN2DJK1+5pr+msTIDomxVUQ+HmKhx2F
	tDaBtxJaCz6tH3QkWUAX8EP8/rv7tmxgjapS6h5ZXJrb7J/1s5y82/t+7u4tvNkDHgF5TBe
	9ns+lZbiAn98EslDQSN72ygKqzGC3yeHypxjNeNak8OJHrt7Vt9u/QrWVp90KAKm1XhEZbe
	6bd1PMjZm8kUqhoDFw+jseRAAt42QagnwFh56UQw+/P+VMca2MfHcLCVwm2VegineI292go
	hAsTOLcQQ5u9YCZg/snTLGYk/jrsQI4fq92SJjpROSdqXOvjMND2MvTdDSJ0ZZx4VdwPpsC
	uQh6nLQpl6He8S7VUjwUtNlWIipQMY0RZplaaNaJ7li8sgvbb7Xxcb2XXaRf5VsjY+UcwRw
	UO2PCs3MjoxC2KIR+XpIYkRzZw==
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
Changes in v4:
- Patch 1/2:
  - nothing
- Patch 2/2:
  - add some comments
  - adjust supported PCM rates and formats.
  - change macros from SSCR_DW_(8|16|18|32)BYTE to SSCR_DW_(8|16|18|32)BIT
  - use constraints API in hw_params
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
 sound/soc/spacemit/k1_i2s.c                        | 463 +++++++++++++++++++++
 6 files changed, 573 insertions(+)
---
base-commit: 4f010aced22532eea2ef0d9a2f5db7c64a196fec
change-id: 20250813-k1-i2s-115bf65eaac8

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

