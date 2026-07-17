Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90893BF66D
	for <spacemit@lists.linux.dev>; Fri, 17 Jul 2026 07:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273240; cv=none; b=g4URtj8QJPDmSX/iZkN2gzvfVXfEZ4kijbJAa01bAtTPOOiCiRwiJYAwbRItFPAGSnPAJucUZbC+i7HHdxYaU//oGf9sa7kbpEL85oJlZZwVar/zT6zwNG10MujXnWrkmM44W2u79V5cRngIam4NoB27n4FT5uya+ORGWEOiXEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273240; c=relaxed/simple;
	bh=jdxLhGznkgDupAqCdXkunU0hq5sAmj1K4l6yG/K9+Gc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X1ibNej8NmDVwIb+qX3wLSrzlddtlz03oyZ0wnkcWbbhywprh6+WgmJ4oZfMcIci4LWL+B8y0FlEyZM9qM8c5wYxsSoLIQDJUPTpLD0Cyj+Cc3PbWoFHXliJf/YGx0u8eBME1Yf9x4+twuXhJ3Tz7JfAf43xFUigYTUGkgkTq6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=WsIvGZeK; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="WsIvGZeK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784273193;
	bh=38PhwQsCteVhWqZvbvzqZlrs6p1pYCdri5yp22jYWIc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=WsIvGZeKaRqjAiH6o1CXJHG2gS0lMrYVJDKfcVfMhqH4QdAi8wCX103FUhyD5noo2
	 th71H6jTpjvZXRFK4oPcfGRk/nfduNjj9UXCE2PG6k4bUqwhM4Bn5sxfww6o3twq9+
	 HTieYpgPZax7TA7lV/5rglnXmmdN+p244vgIAs6c=
X-QQ-mid: esmtpsz16t1784273185t0cd49d46
X-QQ-Originating-IP: 0qEVPKCqEdQ1GXAUHe8Nd/dZrwlIlPynUoTPLD47rxs=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Jul 2026 15:26:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11695669700659989284
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 17 Jul 2026 00:26:03 -0700
Subject: [PATCH 3/3] clk: spacemit: k3: fix missing /2 factor in i2s sysclk
 dividers
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-k3-clk-fix-i2s-v1-3-e95001a692ee@linux.spacemit.com>
References: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
In-Reply-To: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=jdxLhGznkgDupAqCdXkunU0hq5sAmj1K4l6yG/K9+Gc=;
 b=kA0DAAoWmAnvgPkzNC8ByyZiAGpZ2RGh+AjRw2mKqB/RlTGH2MU1+TNKyWxQw3vLFQRAyynTK
 4h1BAAWCgAdFiEEi+AMtnBMWj1wEHFNmAnvgPkzNC8FAmpZ2REACgkQmAnvgPkzNC+BLAEA7Uki
 nKszCL3B6P3wkkKECxf6bYm/ZqdNV9iiVEh5n80BAO39hlDprHKXIIw/+nK2k3F+aH1Aj99x1ae
 jGDlBe2sI
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MhbIMYBflAap/6Y+LPeSAXJUHcNydZE34fdWk5C0Ij/QzXw+0ONdnzJA
	NDuVE0eeYxS60NfGPRyLypJ7YoajQIwooZAES2Zkp5BPlIpI+0yi3h3NnwS1om+vSbAJC4b
	FdVXE9DZLogFM3VNZs8nWyoeSg9VitPtATw4jnWsutM8JAJk8cFGlR5yNkITzC/wcNM6JUH
	BYaUhE9gEze1/zUJmSBpGzC8kGMTSNOHsfB4vdUArCfG318w4glt5pzuG6qEbnw1LwOxej8
	e07tROvyBmOOJEbjHTIo6shtippRJRbAPhR12vBLR7rFaf8weN1dDeYirTmFk2qzI81E+5F
	fta2ETm7isFlz1eOS+3WtpQ6/a5lpotsvO0LilHAw/1zVKk14HBqQ2TErWAFxRr7z91zl47
	QnSz3Et6nmsFt2YpnzYse2mr7YQJhelcvDVqMC7gWYy7DoXybwstdfLOhg7jb5R0Wg3Vqpy
	pGzYdt9TT3AMwBT6PZiFioPt3Hvy9jDCNw3BmxrSuDrzyJQDOYqqsPzb0nmkKMKv5oQ5H6X
	XXDozR+wmDOvggswHpHci7ZXsdK/wXskqCc+OpbBYcguALBXWAqfZLHDu5FYgidyJpfmDQW
	wyNJoLX+J+kSmYMozDjUewTb25tV2wwAfw7cindAhqJttQdfZuNFCLP3KW67mpi44JLX+Hq
	tUWphnmtkCYtrCq2Nc2U2aOsPSLFlB46/+TL4eKjcADy10I3gR+1aqd3tM6REGWg4MqGyOe
	GSiqe08AL6FZqk6ooOhrcY7c0uvJ6X8oQBkbkTeOv1QJP2WwrMZfixUXHKk3G5RGoIC3ji9
	fao0/04LjTBxk58doQUN9mR7K3Z8Hmf7JcRRnqr6IX6gzDZPegukddKHf6AwZpEffgrxE/j
	dPrQ/H50l8Op0fnMkcBZWimNmOPykKI+6FECWM3v2sgjrAbEAUijDukJIkjIyR28dtv6MsL
	j86AkPE2MK1rv0xTapUx0oxThdlrcK1q1abPWsZCpWP2vVk5Q+w2gschc8ZBW/BwNWbTo9L
	yM0Pf/D7sAduYWi0LzndnVKUqKVK7YrwcdF15HJLgkKvot+GFWX/e9RSV3mb/FAaZwkMQEV
	V5ITIqCuMwOHsze2OOxp3g=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

The i2s{0,2,3,4,5}_sysclk_div DDNs have an additional fixed 1/2
divider in the hardware IP after the configurable divider, so the
real output rate is:

    rate = parent_rate * num / (den * 2)

Set pre_div to 2 to account for it.

Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu-k3.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index abcc5caa67bd..675cf03d98f0 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -244,11 +244,11 @@ CCU_MUX_DEFINE(i2s3_sysclk_sel, i2s_sysclk_parents, MPMU_I2S_SYSCLK_CTRL, 12, 2,
 CCU_MUX_DEFINE(i2s4_sysclk_sel, i2s_sysclk_parents, MPMU_I2S_SYSCLK_CTRL, 16, 2, 0);
 CCU_MUX_DEFINE(i2s5_sysclk_sel, i2s_sysclk_parents, MPMU_I2S_SYSCLK_CTRL, 20, 2, 0);
 
-CCU_DDN_DEFINE(i2s0_sysclk_div, i2s0_sysclk_sel, MPMU_I2S0_SYSCLK, 0, 16, 16, 16, 1, 0);
-CCU_DDN_DEFINE(i2s2_sysclk_div, i2s2_sysclk_sel, MPMU_I2S2_SYSCLK, 0, 16, 16, 16, 1, 0);
-CCU_DDN_DEFINE(i2s3_sysclk_div, i2s3_sysclk_sel, MPMU_I2S3_SYSCLK, 0, 16, 16, 16, 1, 0);
-CCU_DDN_DEFINE(i2s4_sysclk_div, i2s4_sysclk_sel, MPMU_I2S4_SYSCLK, 0, 16, 16, 16, 1, 0);
-CCU_DDN_DEFINE(i2s5_sysclk_div, i2s5_sysclk_sel, MPMU_I2S5_SYSCLK, 0, 16, 16, 16, 1, 0);
+CCU_DDN_DEFINE(i2s0_sysclk_div, i2s0_sysclk_sel, MPMU_I2S0_SYSCLK, 0, 16, 16, 16, 2, 0);
+CCU_DDN_DEFINE(i2s2_sysclk_div, i2s2_sysclk_sel, MPMU_I2S2_SYSCLK, 0, 16, 16, 16, 2, 0);
+CCU_DDN_DEFINE(i2s3_sysclk_div, i2s3_sysclk_sel, MPMU_I2S3_SYSCLK, 0, 16, 16, 16, 2, 0);
+CCU_DDN_DEFINE(i2s4_sysclk_div, i2s4_sysclk_sel, MPMU_I2S4_SYSCLK, 0, 16, 16, 16, 2, 0);
+CCU_DDN_DEFINE(i2s5_sysclk_div, i2s5_sysclk_sel, MPMU_I2S5_SYSCLK, 0, 16, 16, 16, 2, 0);
 
 static const struct clk_parent_data i2s2_sysclk_parents[] = {
 	CCU_PARENT_HW(i2s_sysclk),

-- 
2.55.0

