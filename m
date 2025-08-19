Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B7720126A
	for <spacemit@lists.linux.dev>; Tue, 19 Aug 2025 01:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755567402; cv=none; b=KTZm1NrdSuoNXQj6E6u0zwbXAu6rTlWjMCqjcjVwUs682TgbSgolj0RUCt0u0pQvWHaIPznyZbNRXAo2byBgvLdudoXh+V5UQbrz/fayhFkdIn4/C+aIIVeqFmqE4wRUxlb8ru4NGkQ11wC4G9kuNpjYeLaBWcH/kYl26DNGsQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755567402; c=relaxed/simple;
	bh=/hJv0mzHXIS6bEs1DcXOmRFXRROo56LNrivXaAlRwYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NXTTyTk7rw1vdfzqKLXqljHqvSi+Nr+EI5GskE8bylgpcEGtep1jbuCuw6zJYQKhJD8X6wpvdCnn/dOTq9h7O1gfyDdCexkTiiDKOwyxloezKxsfj9wxXBLLIN1DrHJWPprLfyQqt3TjLVl/2mi+YRAdpF/Ws4P+sqpBKhnNe/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=zA3YgBca; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="zA3YgBca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755567328;
	bh=SK3FakjrDopXlK4b5FMuZJRoz8l5i/5MUhXQJMfoKCo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=zA3YgBca5jcZxTI7CzwpTugUBmz8tRdPBsKTdUz6DrO0EVbTtKmYcBORdulCxnGAT
	 nmYbhJhw9alyX+Pj6SohwQ8BNZZ9S6b0k5pRuYZaaBkxCKsY97SOOcYYsFeDvKBKuS
	 nX//LKYInisrkho2MZ4ZbaVXDd6UsPXrQI3xKCJY=
X-QQ-mid: zesmtpsz8t1755567320t10858b5e
X-QQ-Originating-IP: 2YKpn87vCa46PGfFmKGjP3sxuCDc0QCYQ4bnMNTeHms=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 19 Aug 2025 09:35:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6033226300495281637
EX-QQ-RecipientCnt: 17
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 19 Aug 2025 09:35:09 +0800
Subject: [PATCH v4 1/3] dt-bindings: clock: spacemit: introduce i2s
 pre-clock to fix i2s clock
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-k1-clk-i2s-generation-v4-1-80174edd04eb@linux.spacemit.com>
References: <20250819-k1-clk-i2s-generation-v4-0-80174edd04eb@linux.spacemit.com>
In-Reply-To: <20250819-k1-clk-i2s-generation-v4-0-80174edd04eb@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755567312; l=1199;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=/hJv0mzHXIS6bEs1DcXOmRFXRROo56LNrivXaAlRwYY=;
 b=lxfwkInvVlzITCkxhNZsnwfYrvWEuKp82wNatT2pHJ7c2Na1nYQNMachZD/QUYBYCbYyqzu5t
 TOYFEJc7KhJDompSouwpMPXpIEMdM3C5qrjPrUfhqOAkdSE1S584k4/
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M/0PeaSZFgmfv0H4ccfSgWpO5t00MKHrqd92HULpxpD+LzbyHLM6nAjG
	TvcNOTGU27M2vCi4H4E8i7xJWe66p/YQx4elhapm2D9nzFzWPYZJgPUgxA5ZH/JQeqjA7YP
	jIhDiSLh9/kUN0oOFyTuNGRKanrwAOot2MuipHptmBcUcEqsBg2jp3d9DKnTQ4O2DxFbpm7
	BtkbuhHQ5YoH4ssLdi7+yhYVaPO0LYBlLJcUDf5bwq1BA3+xsgHpg5iBdfv865jRfP4GwMS
	ZDP1C1RYIlmM6sVhtNejzUFxUN/hIiJ81k49nYh0hfm8aM2Ko4/Ojo5ETZ+TrMdDzhfYaf+
	NorIozhMTPp+iQ1afjgYimGa2hEq3aQPUDRglS/Q+LoOnYT3/PymfnpVnmT1EEyRjZsc8K9
	HpfXuRvdO67QQkWm4/5sKv2D97z6g0QtGMMmlvrN8+dZY56nGykYR2C3tUQUzZA66typb6/
	g2hbkwJ+KHBoU2S6wfn/M4ah6VJHtBp3XtLwI3TLU0tUKrs/BP7tFjKnHRJiQIVP8zPcIZQ
	WY/tmgxqlpYf9Upv/1Zj/SGWmZL8fNLVX7fuPgK4b1Qj01Sez/Epv2SqxdiSNh+kv+eCllD
	gwaClfQPN8PsRWqVxoxNeLL5rIfyeZi9rTGNUwWE3LXikBq/Sw0KB6UBDRd/tyYfEPGThcC
	OBzpnkzCPZQ56MM0KW5FTVlD67XteZEL1GYnTsAN5n0dc73j4DYs68O3P2uPaXrliD+zXQ8
	LkqJkQgUksIXzbSXyxQWevkCrtXg9EFijsu9FYDUHJhpmyYdAeyLeYHmoZfUUNZzr/iAHXV
	pnZHpJshosC1FaNOHAO+V8K20GN9Q3IHnvALlMHRNx+KzC2tyW2P6s80cnGpDlbHvkH8Lh8
	Gb0xJqVeWlHbWTuqugnlFdB/+uq46qvNm40JIOET+EZs00+fvJShDUFwHJkZ5TIVdKn6fHY
	DKlLJY62nynTlaxzaeMmNTSuiHXBf+OOeTcmoSUYnQnk47snQpUqux6qann7M3qHxtGp/u/
	lqCMJt2/vX89fsXTKISWTtyYLbXjXLOJv6CvRNJ+6ZYAyPEyuKRul1BRoqV/Jw1Fd/ZB6cW
	NnFyOSCVOGsRG7Wal607fag8KIrvxRyd2GgtfefFM2qQD370YO2Syk=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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
2.50.1


