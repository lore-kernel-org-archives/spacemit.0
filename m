Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D39367283
	for <spacemit@lists.linux.dev>; Sat, 17 Oct 2026 14:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792246093; cv=none; b=vAU8Qo+/67F1kyXOtf530BcBTmIPqxFMQ9K/gpngkUUKESskpmVdcRy2mFSZjVQIffD723X0NM83zzNTYjn+ok1G8aTGU+/2FjsSom7OT/bKSwOEPe4+SuGTX0m4oFhPZ7MhlU445mOHMy81kqWL0kFUf8EpzpRXk8O3uYB9Vds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792246093; c=relaxed/simple;
	bh=c3zAGnbXG00dTHAYCXYMyd4rQBtIZC6Bxn8dsZvWsHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Evfx13hpdTcpx18Sv5xQxm8MPutujOl3mE6+W8K/GhC7girAO0/icBC1PIISYMd6lyeBFAoqnwjsWHAyAtxr7L/3+dfFUfXMap/7vjCz7MBisbSb3x/TlVslICRl00d7WzLuNA1PIDO8c+IT7T9P1/HEo5HbwPMFHzgGp64S8pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAhFRpev; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAhFRpev"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso1905650eec.1
        for <spacemit@lists.linux.dev>; Sat, 17 Oct 2026 07:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792246091; x=1792850891; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6GqqVEdUv42zaBEqCnBmiwK+siq8auSXn02n9bIP0WE=;
        b=mAhFRpevacYuNE/zAU1cmebrl3QQ2LgOF+KnTuYPDEG+2UND4tKgCQ4gdjwMMTavfb
         UGjQSlkOo6yRecMXzokyXZFdPsbKuudMjNRLJTfn4cxRnYzfHALzaQ0bkw+GPP4JtlCF
         mzASn+Jix7Yrz2axuMFRMaPKwIknBsVMCRzGTPgbAZYFF7WXmn8ed/+1RZS18+tfd5Gs
         HTzuJ5AKBfD24ITOT4Q+mLgUoceTCj56TAWeQJKwwEmpudEokTEGYyq6bmv/MJQWOQyY
         G8jmSpwkmWrLHMS4zjtP3w1GZ2MYiVh9rnRCkBteLfUywgq9pDdEsd0Bs2EI9BcHVCN2
         8AZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792246091; x=1792850891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GqqVEdUv42zaBEqCnBmiwK+siq8auSXn02n9bIP0WE=;
        b=U1mgQOvxiozofEp/irc3SbDmj0t2wl0iz2GQLCp/xJu4YkxysEq7MNh+PwC5Hg7IBV
         qb4NcecY2jadBSviR1PVQjRVwYJBGwkkx6u6eSYi7WNm/jijkSarrbRDSB/p/qXCKtqn
         SMeXV8a19IQrjLOai9RfbyGf5xVlnzzM2imEKMoVdHnh2fdP0JLzkdJ5i6eWMyC6zwCS
         Talnukr02MgvzdFv4sDRLmsAK77tLhSh7/BuMuXoZq2V5tKKA0D96il9juGPY9+m6hcS
         JSZ+gLuX+1fN3bJVa7FItrXYxhGU79sMWMRTqZGAWtky52GV9yCtLN8QU4VzIvnQbK81
         gotA==
X-Forwarded-Encrypted: i=1; AKwUvByXP0GYZHnpyBo+hvYR/K1I1wPH+VQbAkq3aYXcf4Z5jesSlmmUeJ+8aCCrq9P6Gl3/Oi37RO2OLg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKoKmmo7zXErFfCiwxWSVGnL2hq40849xrMHR3j4SYUcv/eZEec
	Kd6lOvKHAJsRQTyKsrb/plX+G44zbSr4bfNdEl44/ic1ZHf2NZF5G82pGu9qAxxq
X-Gm-Gg: AYBFou3zxBoh+icza5ibxUyW0s9Se8GB/8lMi8vhHyg4m3zuj6JToCjepoaT8Hz3D/8
	VlE/BGsDBLn1Q4a8kUrsA8TWsvl5DAZdneHQLUzBG5zydrzrV2N5Q0KEeW7E2akCVJAuqhQ9ZgJ
	GtgR/V0n0rPnF+gnxaenQK0NOY4HJtMOKkqzPCv73mUclzBaZwpS2xYAjHRNl7ZHdOGcFu7iGiZ
	5RYUKF8BUtZt1QLH9urQgz0c0bB2b7bIgL2Jg6xp3Ah2g5LSa6R5CeLYPiwpJtTGGvmZT1/wh8s
	SLSy4jJuFGsx9InNiB9Xn6nYTfGoLq7TQKA0AJ5KUKE4yBaTA1cuQu0+eJ78wEeD6gLn+c166FP
	VB+SkRmQ+RJkopnrzK7dhao+2s4pc8sxXwGlRHMNfuS1GAs79BgQu38unnIRhrxGsleG7LgioK2
	cd/no8Y1HReGuo/0rSwOPDMoChg1megKgt/l8MqQBS8uxwiP3Irmm4g89vBUrFOH4/o/zJpWEyQ
	li2g0efaTTaHKBRImhua8GC+XnBYyqwL3LapYL3pEJdtO9PWVH8QI7LxIK+jZaJ9JCs9DHlDZKa
	vt0FQTOehaped6H10sOt6aL/BdZbdckxKgBySKVkdcK9pksaXoJ6tw==
X-Received: by 2002:a05:693c:8943:10b0:351:4a80:d94c with SMTP id 5a478bee46e88-361a2054e07mr4084483eec.21.1792246090528;
        Sat, 17 Oct 2026 07:08:10 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a02b8sm17766277eec.17.2026.10.17.07.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:08:09 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Guodong Xu <docular.xu@gmail.com>,
	Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] reset: spacemit: Fix the RCPU2 PWM reset registers
Date: Sat, 17 Oct 2026 22:08:05 +0800
Message-ID: <20261017140805.3278709-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every entry in k1_rcpu2_resets[] uses RCPU2_PWM9_CLK_RST, so asserting
or deasserting the reset of any RCPU2 PWM from 0 to 8 acts on PWM9
instead. Each PWM has its own register, RCPU2_PWMn_CLK_RST at offset
4 * n, as k1-syscon.h already defines.

On a Milk-V Jupiter running the vendor kernel, which uses RCPU2 PWM2
for the fan, the RCPU2 registers read:

  0x00: 0x4  0x04: 0x4  0x08: 0x1  0x0c: 0x4  ...  0x24: 0x4

Only PWM2's register has its reset deasserted, which matches one
register per PWM.

Use the matching register for each reset. No in-tree device tree uses
the RCPU2 PWMs yet, so this has no effect on current boards, but it
would break the first one that does.

Build-tested only (riscv defconfig, W=1); the fix could not be tested
at runtime, as mainline has no RCPU2 PWM node to exercise it.

Fixes: c479d7cf06c3 ("reset: spacemit: add support for SpacemiT CCU resets")
Assisted-by: claude-opus-5-5
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 drivers/reset/spacemit/reset-spacemit-k1.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/reset/spacemit/reset-spacemit-k1.c b/drivers/reset/spacemit/reset-spacemit-k1.c
index 8f3b5329e..dbd783c13 100644
--- a/drivers/reset/spacemit/reset-spacemit-k1.c
+++ b/drivers/reset/spacemit/reset-spacemit-k1.c
@@ -154,15 +154,15 @@ static const struct ccu_reset_controller_data k1_rcpu_reset_data = {
 };
 
 static const struct ccu_reset_data k1_rcpu2_resets[] = {
-	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM0_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM1_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM2_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM3_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM4_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM5_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM6_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM7_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM8_CLK_RST, BIT(2), BIT(0)),
 	[RESET_RCPU2_PWM9]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
 };
 
-- 
2.43.0

