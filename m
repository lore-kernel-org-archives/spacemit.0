Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054342E611C
	for <spacemit@lists.linux.dev>; Tue, 22 Jul 2025 07:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753169903; cv=none; b=khlBPWhHtXjZ9TzrKvjI9t3zIXkdCVkjZnF5NoOHhl19NDv3xdjY2/nXsxT+OGN+hMoQJ+k7x1hVVoeOKKyIm2c8uqAroPsSOcyACWZufax3prfWrkzYb3xjqMQsHC/GfvVHvebyC8P5ablcc+1RZZg/jIV1dI2tt5U7QeLGe4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753169903; c=relaxed/simple;
	bh=0XUvAvsfHaff6g28QDK8UZbmnijtvMKUzjxWMgcstW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZJyd4+HLTbya8Ok+Dlat8xvN/LFmo0ve91PHdL6qBX/ikYIiYdphc8mpOtqbb4uxP8rqyKBG+/zM82YoGN2Ozx4URZLyRdnEb8YmNubqajVV5S8fPGlJCIOIH0a27kG5KAOnY/jpoSeK45nrX3aWHUxxKYkx8QH3k+xojyVCPtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Jd8wLbL1; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Jd8wLbL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1753169831;
	bh=JUyZIy4STLgGKV6n0Rtjh+3mXpolfFOBxvl+rc7sCTw=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Jd8wLbL1MjJWf5mP2M3KuXPQ2VoHHYxpkeZmWggqptGi4uVAl+p4UQQ7Vb5sdi+kt
	 WwF3QnJ6RhYRPD/aEAk1c2BCe0gH+w5CUl2ma+JqLKoMiN5+HWm335AxYFZJkCtoSb
	 P205E/YUnV8sdx5JLpitd5v9NQthEDUYQOgu/mwg=
X-QQ-mid: esmtpgz14t1753169829t213f62df
X-QQ-Originating-IP: BRDEE0KNGCSRu018HljDnqbQ5/Bkizy8x9JNb6qaSPA=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Jul 2025 15:37:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1888360680555149108
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 22 Jul 2025 15:36:31 +0800
Subject: [PATCH v2 2/2] dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK for
 SSPA
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-k1-clk-i2s-v2-2-2f8edfe3dab4@linux.spacemit.com>
References: <20250722-k1-clk-i2s-v2-0-2f8edfe3dab4@linux.spacemit.com>
In-Reply-To: <20250722-k1-clk-i2s-v2-0-2f8edfe3dab4@linux.spacemit.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753169819; l=3905;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=0XUvAvsfHaff6g28QDK8UZbmnijtvMKUzjxWMgcstW0=;
 b=k5GPBMnuflbw6w5YYY/wSRbxzcKYTo+sAbNQujyR6OtwOjWRfniZlDNr1on6JbxWYRTUA4F5f
 GD09MtbJb+CC1vZ/84afMi0wLhIAFI0yt6fILL4Gv1ss8U3sJb4ccou
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MAu4Ycv3XufaSoWgFb6y/SIIX0+HjBtGl4C5q+PZUbkzNyrF3IFb4A2H
	xFIbYzjrVePXH+w7Nxh4AW5fH3ZI/wBRCtUNdHDdii/zHBkNbTZCua0PiQqmWcOy0vcz3aZ
	PVYafKd3QaIh+OS68FVsPuhdNUOBRDKio6zBMje3/pHHvhEnDMwKpJ+dvTvslpT30IEdsOc
	8ainugSPkkvKT7DrLkvZ10ZZfU6GmTfWAMqbkUh2E8LweZ4oFoGggsvNLmV50cYViAkT5Mk
	WsDNQ9YUQZZymMX79BmNgruNMim0q70QEoekRfIFab70ZlUU/G5355t/LmmlLqDpfDwt5KT
	OBv+SDb145+eUBuJiKMtBpltK3Ua6Gd5dKVFKaDWz45u4QPWy3bcLOjScW7IUaiM3I29uiS
	wQlGqcIJfVCcWJoc5fPmrzkGmO2V7JsWqPZkafdzvLysNcJ8QmujmzZiIUJ9xYIGMeeI2lD
	17SYLy9AjtkIv9ZdCJwQ3FsnnpXY1HHSiqPuuZOFRP0H/rlrTMAn7GByVv4Qo3yDU4bAUiv
	00V6+QjgEPlSlxRDjVPujFhy4cvLOvsDvczYRE2W8SnTEpPIiT1MfDOhbKgytfoWbBjC3n0
	KntIx9b46zAXBZTrE6zJwdNZdllkj6bcOxxaH4bca08sBUpa03G2c+Q3zSPVUAiJyaVGSEt
	UEOcHZvWsfgofq6HW1gC2sXU6cxypT7Oa05DEh+2r2KdscKh6BkNKTk3REajlZJx3SQ2I9K
	jaeuhz1gI9vXfWqiasBuI4tqjokWiC6ziUZbRcoy8T7Qiu7h8//7g8F2UnV/nvQo5m+Q0y6
	pi6tUYs2Mobspbpr4TFa7QFHmhewfmu7uP3cY+nLxFFxP5fquzbysSMF8bgKEjBFAToQhGV
	luxFNf1d6tizixmiXPXLDeOCFKKBD5X4/1cEiwTdfg5Q59G2M0fE80GYK51t8w+vBhymh4k
	8D3CLoPVB8R7nsRXvBZvhYkXjCUm7EHI6qqHRTE477hT4lYxCRqg5mWT8wEd8sGeVVflUW5
	95bA/h5puCKMaZ2sskoMkFb2dWD+4P9DY4unnS3vwPiofOfmeyTVRxYj+++HUh/eSdnGdEw
	JO0FIjJiEq5TDCe9D4WYLw=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

This patch adds macro definitions: SSPAx_I2S_BCLK,
to introduce a dummy gate for i2s_bclk.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 include/dt-bindings/clock/spacemit,k1-syscon.h | 114 +++++++++++++------------
 1 file changed, 58 insertions(+), 56 deletions(-)

diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
index 35968ae98246609c889eb4a7d08b4ff7360de53b..6914ccf5be45a1071d5b6eac354cacb67888e00c 100644
--- a/include/dt-bindings/clock/spacemit,k1-syscon.h
+++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
@@ -123,62 +123,64 @@
 #define CLK_TIMERS2		41
 #define CLK_AIB			42
 #define CLK_ONEWIRE		43
-#define CLK_SSPA0		44
-#define CLK_SSPA1		45
-#define CLK_DRO			46
-#define CLK_IR			47
-#define CLK_TSEN		48
-#define CLK_IPC_AP2AUD		49
-#define CLK_CAN0		50
-#define CLK_CAN0_BUS		51
-#define CLK_UART0_BUS		52
-#define CLK_UART2_BUS		53
-#define CLK_UART3_BUS		54
-#define CLK_UART4_BUS		55
-#define CLK_UART5_BUS		56
-#define CLK_UART6_BUS		57
-#define CLK_UART7_BUS		58
-#define CLK_UART8_BUS		59
-#define CLK_UART9_BUS		60
-#define CLK_GPIO_BUS		61
-#define CLK_PWM0_BUS		62
-#define CLK_PWM1_BUS		63
-#define CLK_PWM2_BUS		64
-#define CLK_PWM3_BUS		65
-#define CLK_PWM4_BUS		66
-#define CLK_PWM5_BUS		67
-#define CLK_PWM6_BUS		68
-#define CLK_PWM7_BUS		69
-#define CLK_PWM8_BUS		70
-#define CLK_PWM9_BUS		71
-#define CLK_PWM10_BUS		72
-#define CLK_PWM11_BUS		73
-#define CLK_PWM12_BUS		74
-#define CLK_PWM13_BUS		75
-#define CLK_PWM14_BUS		76
-#define CLK_PWM15_BUS		77
-#define CLK_PWM16_BUS		78
-#define CLK_PWM17_BUS		79
-#define CLK_PWM18_BUS		80
-#define CLK_PWM19_BUS		81
-#define CLK_SSP3_BUS		82
-#define CLK_RTC_BUS		83
-#define CLK_TWSI0_BUS		84
-#define CLK_TWSI1_BUS		85
-#define CLK_TWSI2_BUS		86
-#define CLK_TWSI4_BUS		87
-#define CLK_TWSI5_BUS		88
-#define CLK_TWSI6_BUS		89
-#define CLK_TWSI7_BUS		90
-#define CLK_TWSI8_BUS		91
-#define CLK_TIMERS1_BUS		92
-#define CLK_TIMERS2_BUS		93
-#define CLK_AIB_BUS		94
-#define CLK_ONEWIRE_BUS		95
-#define CLK_SSPA0_BUS		96
-#define CLK_SSPA1_BUS		97
-#define CLK_TSEN_BUS		98
-#define CLK_IPC_AP2AUD_BUS	99
+#define CLK_SSPA0_I2S_BCLK	44
+#define CLK_SSPA1_I2S_BCLK	45
+#define CLK_SSPA0		46
+#define CLK_SSPA1		47
+#define CLK_DRO			48
+#define CLK_IR			49
+#define CLK_TSEN		50
+#define CLK_IPC_AP2AUD		51
+#define CLK_CAN0		52
+#define CLK_CAN0_BUS		53
+#define CLK_UART0_BUS		54
+#define CLK_UART2_BUS		55
+#define CLK_UART3_BUS		56
+#define CLK_UART4_BUS		57
+#define CLK_UART5_BUS		58
+#define CLK_UART6_BUS		59
+#define CLK_UART7_BUS		60
+#define CLK_UART8_BUS		61
+#define CLK_UART9_BUS		62
+#define CLK_GPIO_BUS		63
+#define CLK_PWM0_BUS		64
+#define CLK_PWM1_BUS		65
+#define CLK_PWM2_BUS		66
+#define CLK_PWM3_BUS		67
+#define CLK_PWM4_BUS		68
+#define CLK_PWM5_BUS		69
+#define CLK_PWM6_BUS		70
+#define CLK_PWM7_BUS		71
+#define CLK_PWM8_BUS		72
+#define CLK_PWM9_BUS		73
+#define CLK_PWM10_BUS		74
+#define CLK_PWM11_BUS		75
+#define CLK_PWM12_BUS		76
+#define CLK_PWM13_BUS		77
+#define CLK_PWM14_BUS		78
+#define CLK_PWM15_BUS		79
+#define CLK_PWM16_BUS		80
+#define CLK_PWM17_BUS		81
+#define CLK_PWM18_BUS		82
+#define CLK_PWM19_BUS		83
+#define CLK_SSP3_BUS		84
+#define CLK_RTC_BUS		85
+#define CLK_TWSI0_BUS		86
+#define CLK_TWSI1_BUS		87
+#define CLK_TWSI2_BUS		88
+#define CLK_TWSI4_BUS		89
+#define CLK_TWSI5_BUS		90
+#define CLK_TWSI6_BUS		91
+#define CLK_TWSI7_BUS		92
+#define CLK_TWSI8_BUS		93
+#define CLK_TIMERS1_BUS		94
+#define CLK_TIMERS2_BUS		95
+#define CLK_AIB_BUS		96
+#define CLK_ONEWIRE_BUS		97
+#define CLK_SSPA0_BUS		98
+#define CLK_SSPA1_BUS		99
+#define CLK_TSEN_BUS		100
+#define CLK_IPC_AP2AUD_BUS	101
 
 /* APMU clocks */
 #define CLK_CCI550		0

-- 
2.50.1

