Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257ED23814C
	for <spacemit@lists.linux.dev>; Tue,  5 Aug 2025 13:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399034; cv=none; b=mWWek2qTD7V4LsZeil16572Nyk0aKCgAcenxhQgI0FBRcpa2FYof9lUoNS7s4V7YIYdEVjTL7mrnWjJvAz665Ikya7fvJGhg4wuHJyJF/gKge4RKT0dIVWdSfCFYrqNxYIMRVqUgaJdfVYmO3DArmnY2wIJ6+WyhPGISyVIHUp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399034; c=relaxed/simple;
	bh=5BkvHDYGZxcrey1OnIOFiDWh/mlgsN57huK66iChlDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nhg9dQBEPMNwH6DgnS0Iw7/boPd0ifZokJVOq519jAWEdNJ28sjdf0JUvCQ0D9q0rxTGnABj/+/NDCoeV9qk/QLZAJ7xFH51aE0+mJylKiR3qaTQ/Uyr4HOCm8iwmL/pMhrPuY9GN0Hhiasm3JAzA6cCnQz/BrYUoLs5qdD9UI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=GKqVW8Rl; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="GKqVW8Rl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1754398897;
	bh=FVBPVEeUd1bxjQJhz//RpBXorx7jPTLOEKGvJHJaQ6I=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=GKqVW8RllaaWhyxzlswADaKZNrK6QXCLKcNW5vbwzBY1KJhPygIiiRfYlu1c3Q9AK
	 1gHDTrTZaXRiaYFI24Vyg4FLEa/+PJoDpvvjFoWR9I/4axB2Fu0QE6xHnZEIAL8WF0
	 m3PVVkGYVrmBR54CV1ikMWtAAMNtM4rMuxk34AOo=
X-QQ-mid: zesmtpip2t1754398895tfe7aa0dd
X-QQ-Originating-IP: CPpRJvHoFk9wwvAZxLC1CoM7Jc+eYsDtqwv2sfJO/dA=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 05 Aug 2025 21:01:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9963814642751996560
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 05 Aug 2025 21:01:09 +0800
Subject: [PATCH v4 1/2] dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK for
 SSPA
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250805-k1-clk-i2s-v4-1-038181284dd4@linux.spacemit.com>
References: <20250805-k1-clk-i2s-v4-0-038181284dd4@linux.spacemit.com>
In-Reply-To: <20250805-k1-clk-i2s-v4-0-038181284dd4@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754398873; l=907;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=5BkvHDYGZxcrey1OnIOFiDWh/mlgsN57huK66iChlDA=;
 b=SxTtW4MUMwC7dLisiqic3znXA6OPJqUWvrb5W5Pn6+JFG8K/Yh3eUkw2+FCEHT/mEu4vhreEc
 rAhO0DskONhChyvl0uXygnVqsvgGn/ntlTHpow6ebqltPYLSEQ4B0QC
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M/XjN/ZJ8p367ZHiom7Cv7mua4kjbEkWh6RWDcrdzzvcifHUXn6L7z64
	lMnrMVcOIVumqRHN9CRBfmH25UmbjBby2YPvKHiyTi+2Bcn+iv2BZdzFmHkp8YsZfhSbb6f
	atxS4zQu0P10VClCdiBJlmOuMYi1g7dEA3v3o+iy7QHRA8RdPX7YJEcrnggHyRcoFgA3PE5
	YJCs8LweoxIp7BOVACcDWNhGQf4J/FFW2nwwb/30+Pp0HaY5N0gpw0mSosj74upGhrBLmOn
	o04AREv0yWtjJf+SWcywAk4MQudzBPWAO9EdkZ8oyUtaQaJPTsEVuArorakFx13fR2TqRUX
	C1hVeWgLqJeGmtFdV+qbLTRkvGwOQJiaS0rLWD4j05HqsRUXjXFTjXkHESMBtBNnz4MQqn4
	sPBtt7+i/pbCSYXg3o3ZpQ+2Ytch0H/kK7azePXjra5645EVYuFOYGTiEDCvlJdTedpGZ9m
	zTlNOjyo61bGGX3CtBcd2Ze8OwrHq0GMyvYkgr80uQdsEkQyUO9tF6e+q075UrCJxHfF6mx
	1od9KznOOcI4vwrY+00wkRMjyhcE1rUTvkbgifvfMAL/8Koj6/qWd6E5jmgtRzXi75Tjp85
	RNXE/a1lRQcDlWX8YqqfGjmhXtxNxiY3QC6APw692j/dXoQZX41xXK9wNHwPzmpDB2DfwXd
	qr2rcWiwqp7cdcqWfj4FzvM2SATqUVI2OyDP350l168fmJgtYxRc8JDmyvYN6iRWnKTi+nJ
	0Bb39N8FqYQJSkTPyjsY8bA8yy+j/K09fbSW5TruMnSq1uvgp5z+dnK1NYc9lG5lds1q/C3
	IPkstVyylWxTAmONO1KXheeO8S4Ee8JMsnDukkaz5ez5uiJojBMePqTUqigqF/L/YruZ1lZ
	tbHLM/vaWJw1DeUVi0JsXiYY7XJPOztG87TCCNJL0omwF+8nH8BY91S0BWqFFbeiskKL86v
	x3MM69imvXYmTMuYFGYAmpssnT+kILkoiX97qM0iu1FW3Ws00ed1wU6JMVk7q+BB7zomgfj
	w+rO/2p6yHECyrjo2tMwDM7SBEZSkl+fMws0MJzqbt/8TJWF5UTcExHEmwZiniPMb/GNvPX
	gZ9YFBZlz9cLJb18SPnzwhF/gNaODrt3kvvUhRfmKKzIT0/g0zBnQxSDYMxpQeRmw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

In order to use the virtual clock SSPAx_I2S_BCLK in the device tree and
register it in the driver, this patch introduces the macro definition.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 include/dt-bindings/clock/spacemit,k1-syscon.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
index 35968ae98246609c889eb4a7d08b4ff7360de53b..9be578953d71e79e93eb10eaa35b47b97812e826 100644
--- a/include/dt-bindings/clock/spacemit,k1-syscon.h
+++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
@@ -179,6 +179,8 @@
 #define CLK_SSPA1_BUS		97
 #define CLK_TSEN_BUS		98
 #define CLK_IPC_AP2AUD_BUS	99
+#define CLK_SSPA0_I2S_BCLK	100
+#define CLK_SSPA1_I2S_BCLK	101
 
 /* APMU clocks */
 #define CLK_CCI550		0

-- 
2.50.0

