Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.67.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503F9537F8
	for <spacemit@lists.linux.dev>; Thu,  7 Aug 2025 01:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.67.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754530353; cv=none; b=fXnZQzivNpLa+RtItoI49a5OVRxiCBFYkWRgY0KFkP5L40AcvdNcabujvN84O9oZxe8lPEadLOmA3amqhC0RzKwiWaPhOpPwHABJJyxBxv4JstjUip7m4WnemEpfSuTckXLN1nxP2hvntsTYjHum6RnFswE5lQBHhK8lIwzKvXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754530353; c=relaxed/simple;
	bh=sxGnfSSFz+QDwg50EXWstYMedLLmqKm28v9mT9MsQQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kuAJ2mNH8BQRbkzJsgYUFWhfDsGiIxBwNyAzQPiaw2s6ktiZVgAIo9gXFILtisPNRArKKel7QFmwX/AzcmS2AT7kiYMHty6EBxmq9VZ8GwAmTKzLOoJsO8RYfjFLwqNuwOEMTR2jGviEZtJtFi4xQIMQc2ts7LBfuiuxahVVTvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ospKx1Jv; arc=none smtp.client-ip=114.132.67.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ospKx1Jv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1754530218;
	bh=iu88a8ay7VG2RXEtKM0gyJ25kHT+aTDCXwwaMilECgs=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=ospKx1JvFchuu1v0OOBB5cntvdj44pPeeEFayP8p5UNWqe/9f7JiSgBJg4cNYgMam
	 Mo6rntEXtT3tAmLrMNU1xWodHkVvd4sbL+OjYSLxBGa+ht9STACG3SYJKB1Eo+0z+P
	 usMeCPBgDtM5aZYNhK8OB8/zUyDbLYHTPZFLE6jo=
X-QQ-mid: esmtpsz19t1754530216t1fe22e97
X-QQ-Originating-IP: XufVyFBFlZPw5gqLYgT9DkQ/sMxsFpvomT926UJMoXo=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 Aug 2025 09:30:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11800184382334055400
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 07 Aug 2025 09:30:10 +0800
Subject: [PATCH 1/2] dt-bindings: clock: spacemit: introduce i2s pre-clock
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250807-k1-clk-i2s-generation-v1-1-7dc25eb4e4d3@linux.spacemit.com>
References: <20250807-k1-clk-i2s-generation-v1-0-7dc25eb4e4d3@linux.spacemit.com>
In-Reply-To: <20250807-k1-clk-i2s-generation-v1-0-7dc25eb4e4d3@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754530210; l=1005;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=sxGnfSSFz+QDwg50EXWstYMedLLmqKm28v9mT9MsQQQ=;
 b=c1WOPEprEFuqX1JuniBPzz1BLPQLK7s+QSaEugX2PSJ5Y4cTmYrzwo7Ci+k3rDHuMf1xlYrpe
 Jwb3/qeiY+tCfgtzx7K2OAYGp3FBvXZJ4RuOEsXF/dzUQIWTBF3SpqF
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: ODGSgaNxEhursINb8gBa3m54Ps1YsjiTn9QPXrittBTgduNzYOSHdtOY
	WNJGxeG7llgC0ZDegxgxHiD4cXIozkilwSNEU01WBKs+VNY8mvmDU+tCtNXxuekjCfsTFdA
	K00cTLcnyN6Ie5/IEx/JTLcZPEfIF3tIHfwXsrU96/1IXR3cwqbNqrQhIZcie4Wkm5c0Yz0
	Zij2J4tymwqWSmPwU3YhEXcn7OnFGUHCWJbR+1j8TiMTzimvdF3OraZkacILT/6fh0uPeph
	CSy5lESc5Jrpzh9GWJ4g8u4WKsNxpBy+KtbAYgfaa/p0Gp6egcMXAYLUJBxPVQiDbPE5jxd
	TkU61wYutqa/q7ajBJ2Ek7wJG7pq1wGx/NlnioF/8mmyQSRyDxE0SteBMeYoSwkJ4oGGZVP
	kB+iNVSttFB8mOHwxmfBejOS9N+ag/aq4mQzAuMMEaByo870eF05FCjRrrx7+y91geXsXwF
	U4XJzvVvvYyODpgpUzCNVfzBfZQcc/INQS+/T7Napvu7aEUbRcYEznfAzkrtcpwalNvYq5P
	hPc8KgvlAL6mizYSp6tU+Dcs/GpCy/WUHo1l876nZ4COBJEh3HZUiMtACYnyHX0rHc87X4z
	MPqfFAMDsXlKhjM9OclqdUkQH5nie0CK3I28s13m8mOqO0TXepeiDbVsKgZ30pGOjXq7mkI
	I3pESCwJAXaY/kuKEDIIdryilNM0koLvhUFrpraMHDvA+JPVgHI+WtzxGDMh879GoMJcXl4
	Anp8hNfCjZf+uF1HL9Q/SMzx12xPx+6IY41EoLHVXD6yTwqXsCp0NxdKhV7Ax50gu2KkrLE
	OnCC4ceptuV8z0UXGqmZhqWgf42tAtvvV8n+0n7SM1YNp0u01db4yUnH4BhEPChyDeGGzlk
	KsjGBx0ZjV7XBBYAJsJLKLuAVJ04SXMg2VQc567jc+l+H54MbsXGctSqUjcAI7ANgXudDz8
	/jFygzMDTy3yMbXxC+6iJ+Oc4WESw3qg9v2tUfxqMjhB6iPD9PV+oLgBABUZXbZvzM+Ckkq
	XSm7Z50KkMhDIWwdulv/xBHWXg0FDwks6LgEqJIif0Nh9/3W3VPJFh5jDXPZ/mooh4E/Okh
	Yhq9dso5MHjx5alD9TtTZ+0WwrBql5+OK54hEwerKLcmy4USnPAMR4=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

Previously, the K1 clock driver did not include the parent clocks of
the I2S sysclk.

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

