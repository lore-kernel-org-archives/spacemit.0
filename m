Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EDD2206AC
	for <spacemit@lists.linux.dev>; Mon, 11 Aug 2025 14:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754921159; cv=none; b=jjbE3UGbCHS5tRkY4TvKUJWuLE2+FwzMWWnKj+wv2WlPN3nGDuJwHS+Ctz4jo+w0JWpqGArEUmGm25s7s1LSXhVUB/J3evducWa7Hoj+YH1FDbxocwlhh5l5zznOeZy8VzyprfRsFlULxuiUlOftOQEt0p7+M+nCygHvS0v9WiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754921159; c=relaxed/simple;
	bh=WFzD3JxmXZH2A/HVSLYZQ1zRbumApEBwgTZWddNtTRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o8G0MKPpn7hdks+PCd71G3oTvnGLwypftERB6IITpHbdIPVriHuu141rnsO/93Y/jB8p/+cCk7RiGOrjg/Dw3U3z6WA3mIxDTB+pTkl0O1Giq2+RaCqKI+p20C/fI09Awp9yNWRV3xwjIKWBpI04S0Z1navEBFUWLsR3b9MhJ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=vEnDzEeK; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="vEnDzEeK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1754921082;
	bh=VnVbQJFTKT9KqK9RrK42D0ZPWUeaI/Fw5R+S1EtpFzg=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=vEnDzEeKJVVJlOePPf0OIiMV/SZ5zmaY5C4Rpcsk0Tfo+T3HKFq3N7DD/U7foA77m
	 cWnaaJ5WY3OcXuy7CwJm8SSAruGNaRxJwKE+6xDq9XanMuJEgeVKhGdL8yRWBrjadu
	 lvGgy/hUy8VPkrzj2lkMQcNDK7Uy9eIcAW1sH+Tg=
X-QQ-mid: zesmtpip4t1754921080t0cee6af6
X-QQ-Originating-IP: 7OmkVN+qzWmNrNPB6kdQOPDm4g1ogZjUvbkSpLnPYLg=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 11 Aug 2025 22:04:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12793305655331086450
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 11 Aug 2025 22:04:27 +0800
Subject: [PATCH v2 1/4] dt-bindings: clock: spacemit: introduce i2s
 pre-clock to fix i2s clock
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-k1-clk-i2s-generation-v2-1-e4d3ec268b7a@linux.spacemit.com>
References: <20250811-k1-clk-i2s-generation-v2-0-e4d3ec268b7a@linux.spacemit.com>
In-Reply-To: <20250811-k1-clk-i2s-generation-v2-0-e4d3ec268b7a@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754921074; l=1059;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=WFzD3JxmXZH2A/HVSLYZQ1zRbumApEBwgTZWddNtTRo=;
 b=MwM8g6ePB8qFUqu+QWf2+Dd40fsyq2XhFG631In6WZXoTzuMThqsfAVXsjFvgWb1fESK/4zji
 wAO2FZ3uhtUCOKXPoMxLEMKVVkf+XLoC69QqiJQL9CP9rXxus/FPTV2
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OEyOu662Vd1NRrx+wUwaHMm12pv2mgGx68hkXOm3i+gKvMatHuO02ml0
	asZcxvXG4SFk0CYN91UtB/brEBeCzyqBKhUwm1e2H58QzM1eU0UBaFBue4g6WuYlQKdjg0z
	c9jXc5peM7X7ThICzZDsNkUNkEumPWDk5XodrAa9/32qGVs398gYsbuqnNqpFOwZcL4fynX
	TeK+mbNDeYmwAQ9KxWEuV159A/zqXIiJs4emC6gWbG1v7DtioCg3eu2CAmeL2nsR0hyb7k1
	oIvB9ERN2F0vHQoeGomr2hC1LDiOq4ot6yRr/OI/YBhWWzBJODUBOsruysD/YK7ao3qnQqx
	8MRr67HDbNiVGzGiDeKk6gqhoi8BQWTMTNlzgYZUcy8dN3yrSjZax8Gfkmpb9R8IevOC+/V
	Z1LxXPxiY3nLFivBUxsaCNORkoEnqIuahULWL5w1Bc5ytuf/sFEFAP5XYtcGY+GzjtUrvQv
	GghgAYWXxv0M/gLqZcEG03CsgJAoFhc2PCFhIjgGWb05Mq7HlR0L876fbsUe+e6FJvWUJrr
	4R3Ed3MR2H5Hw46J24Fag5cEzsVLpkw2We2VMJzzY2zK2I6QUmY6a+gtn/m5eMcO/Hun4Uv
	BZ5ABLka2tyYrM4teHCXb1FDJq8+7bLkBRNqOCL2oKzh/yX4zXEfVNvjaoJMPcIYb7C6sqh
	1DfeJJoh/wkwZm3ADtJMng+iaim8GkwjN1o/YKa0eTTPRVLMXPR5WV5RNIEf3+XM68fKrOq
	N94DkTr4/Z+3jgbNmRDBU2yVK10ghJSr1hSFb71kahgnAta05iUbI6/bk4mvI+v63/9SpB/
	gyBzf66D8jtr0M6wJ9mTwVjTn2J8sR+FxSLaSmwlPX2RmOsVhaZq4JVBt9KmoxEJC8lmvu1
	/wNdfy+LW9tEwaMIUm0wuyR65hH5p/nHx/d6MnfE70YXqxnEGsbSmLIJhAIP2rGZDAWEGbh
	cbjmQHiHTKxEd2RdRAssv/0SMuesmysbY2MsfZLhCtgYP1Vz3uKb13s7hCPllkjbeYeJPKE
	D0GFs4GPpUxWZnclCV/xP5yQBc5enL2ytNkBijlux0/2qpzAHyMFHToQXX7DjvfbjMJMCXh
	eSa3U1Rc3060nGbygvO2mB4OUl1/UDg1GEYR8fdIry+tQgfb7uSRXkm2MiMEi//Vb4JZS4C
	6SyRAuJtYF2BEwM=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Previously, the K1 clock driver did not include the parent clocks of
the I2S sysclk.

Otherwise, the I2S clock may not work as expected.

This patch adds their definitions to allow proper registration
in the driver and usage in the device tree.

Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 include/dt-bindings/clock/spacemit,k1-syscon.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
index 2714c3fe66cd5b49e12c8b20689f5b01da36b774..524268246fedd3f1238320f35244baf32354fbd2 100644
--- a/include/dt-bindings/clock/spacemit,k1-syscon.h
+++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
@@ -77,6 +77,9 @@
 #define CLK_I2S_BCLK		30
 #define CLK_APB			31
 #define CLK_WDT_BUS		32
+#define CLK_I2S_153P6		33
+#define CLK_I2S_153P6_BASE	34
+#define CLK_I2S_SYSCLK_SRC	35
 
 /* MPMU resets */
 #define RESET_WDT		0

-- 
2.50.1

