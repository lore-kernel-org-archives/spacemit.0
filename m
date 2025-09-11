Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14BC216E26
	for <spacemit@lists.linux.dev>; Thu, 11 Sep 2025 03:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757561741; cv=none; b=BP56512wAXjuwgLuqz5WgN+N4Iv+DWbNqBI+y3GCSc6EIrsj/G9pw7ZxNHMOVxVdE8p3G/uogiuBxKJ9HSc9ZvtH2cl/auqkLI6j29bKf1g5y7l258I1EixKeCcc1EYK579i9WCDg6u6dFhTut68bseDxreKsZ12JljjToM4cKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757561741; c=relaxed/simple;
	bh=MpbEVQJf2AVIQqx//peGNwuMBg67BNUIUbJjcb88MlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PzIWe+U8FFPTfugoxgJJoXwbwKiTYt14ZHJQ9SW0Bm7aYcWFwK42Xu8qfnFL14xtO0DndmCMVqi48lySPN+j55DfpBMgxOVLVfFR4hhEN2OYJngLe2aKdQcIwexDtpv9P7sYI93SetYbTC6kiBn7h3P+AX/5gbIL6TMk+JPzy80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=YGLFS1gF; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="YGLFS1gF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1757561661;
	bh=x5heRWWxoAFSgKGfAwL+UUBZ/SH0X/KEucfW1kCohLA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=YGLFS1gFNDqHvMBmzpe/0i/6O54jEG13pMZc1sMnmvmLgByQYn+aeJcKdK8IoYI1U
	 +neE7C8cRIj4X8jF2ApgdHkijysT38EMrkusSWczAOvkm/RZOR1ZSxmhKqFBNoxr84
	 vYa/waSJf3E9tXgqWShIuQW5LHScdo3Ga26yjKMw=
X-QQ-mid: zesmtpsz2t1757561652t4b838e95
X-QQ-Originating-IP: Qp+B9ePOiwoUsGLiwQOkSRppr9ndituH0TM+4FnkRBk=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 11 Sep 2025 11:34:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7849737783869679119
EX-QQ-RecipientCnt: 17
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 11 Sep 2025 11:34:03 +0800
Subject: [PATCH RESEND v4 1/3] dt-bindings: clock: spacemit: introduce i2s
 pre-clock to fix i2s clock
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-k1-clk-i2s-generation-v4-1-cba204a50d48@linux.spacemit.com>
References: <20250911-k1-clk-i2s-generation-v4-0-cba204a50d48@linux.spacemit.com>
In-Reply-To: <20250911-k1-clk-i2s-generation-v4-0-cba204a50d48@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757561644; l=1199;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=MpbEVQJf2AVIQqx//peGNwuMBg67BNUIUbJjcb88MlM=;
 b=rJtTCJbkHV68WSAj3AA4O5N9sWEvL4JzfqV7QHzEt3JilpuSsg+tpZqj+UenUr0AyzvQgMkO6
 HNOIIvHjIjpBSk9zDm9JO2k2vzfrzJXoYpVw5iCFRcHahAINTOG96fL
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NlLEkF+Y0lKeL/hQmrPt4bSLqDk2TPGNwHxxeLywOQxe1R4utBs+fIiQ
	rkb2n1f6hM26Jate3I0lHpP6hwjLTvtV9r2sgD7uBv7z25Sw1MvDXrD8FXkLKOnti4bzBrl
	aHx946kaOZdirXoOAWf3GOCtE+2ue2nEw3g38M9aU3LnM9EZ5/apnCDpiUH9nbmvcc69r9Z
	lVO47KAaVa6JWqj3KZnTV6kSH5voQBAuAnhBXGYZn2B7Ti5MpW8GUbV0pqmZmuDhD3xODc5
	pkAsM5gjfK8M+Z5cfbdg+pI538x/sO5G93qB02yJcQVAb/FX34omltD4Y1v7M0JUQvrMto+
	lFnZ3RYS28QzNVrMftXG/qjZimMP18MZsALlCh/kKwOfFHRRZJ6CMqkQGiJ/JFxRiG9X4vg
	j8o0jD0MYUmkCZltWUqRKz0MhSE0dpYbFEJ7zaeasW94rwbLHDAw/2gzRAV7sD294t1kLG9
	BukFm+9r/PpFsZ2wHLvxh9UBbqY/9RfU3zMIa5rAKQyvNvq3ogs4BbL7eP7Tm39gA9aCZve
	tcj30Wnngjo94gQ/LXEbdn1B9b1tAfADaykDAjoLFLr3l3w4qwYtis9wWIcQw22ey5Uww0O
	BN15Yi+6e6LODM8N3zDcOhyvCQO0towpEv286IeRBpyfJcSnEUiHz7Er5bqyRUDYsIikTpt
	hoF3yTy6SMgfNaHbk5M0NcygRoRMTIOg+uitFjtNiNkxrfSVx+mfeRheJlzNXJjuwh70UET
	AzO6DIcw8Fm68hk28P9RlPZ408tnq94ECkqTeFQNl2p71PZgc+k3dulfNgtuAJ0Dr6UalRl
	lOk/fT3SQYyUS6MDR7nbieTrWdRSt5VokVZwXiPnjE4e/ph4zEZxci50/uonPB0NhjQpzo0
	fbGU85URd7UEvmZWZUyrhsNlglYcQUsH268+wUDcVrcsd/fFAHdSWVfcLio9Ncki5FiBo1J
	qIYv5e/0O7hzLKQ6sd9en/IRnUQhOYDX8vejZB1wTPvwpAd73gN50hOjAYILcsN1ivIw8qO
	d54oF4TBRTB6bpLugx+WrDnY4n8TLrA0Sz6aqMgfgGP0rMIZlc8GXjeNC0ubF8KaZ9Y84S4
	Q5f0CvdrvyOGwUn0MX8CHjKMWAF3nbtxe0MN+8cg84J
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

Previously, the K1 clock driver did not include the parent clocks of
the I2S sysclk.

Introduce pre-clock to fix I2S clock.

Otherwise, the I2S clock may not work as expected.

This patch adds their definitions to allow proper registration
in the driver and usage in the device tree.

Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 include/dt-bindings/clock/spacemit,k1-syscon.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
index 2714c3fe66cd5b49e12c8b20689f5b01da36b774..ad62525be43a909633f8d3a65ece1acd60ba8052 100644
--- a/include/dt-bindings/clock/spacemit,k1-syscon.h
+++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
@@ -77,6 +77,10 @@
 #define CLK_I2S_BCLK		30
 #define CLK_APB			31
 #define CLK_WDT_BUS		32
+#define CLK_I2S_153P6		33
+#define CLK_I2S_153P6_BASE	34
+#define CLK_I2S_SYSCLK_SRC	35
+#define CLK_I2S_BCLK_FACTOR	36
 
 /* MPMU resets */
 #define RESET_WDT		0

-- 
2.51.0


