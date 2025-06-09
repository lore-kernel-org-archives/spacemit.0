Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B836422129B
	for <spacemit@lists.linux.dev>; Mon,  9 Jun 2025 20:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749499708; cv=none; b=u3FgzTRTO8t7XyYH+Qt6Mx8mbKBYp1f4bZTqe60oVzXeQNwXssgz3JqRmZ+I5uYH7WWj6bxzDZ/YEh73lNBivaEx1au7DzYncawK3160UAexnVHwDJ77Y97HNSd6FKX1WUTHqVGlV+N9o+GFQ58HDbOaXts8J5XxwFBSHtXVAVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749499708; c=relaxed/simple;
	bh=5col7cyjORVDpBjeMZhgvIznfmZtb6RKuoV4CGQF4zE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N7aTacsVWfobacKqdONEBf82ucBU9YAxvXzbfGRFI6VjdJ93intJx/uBaM5mqzLCnHvi0cvv60PaHiBoQpvPbtACxzpg6BiP97B7THA3ZTI0MRaGcq45cZkh8cUWuOVs7jnAwXUAKMl32r3akkif4XgqgWY6TzgsifuroCafqpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=sqyGGQWo; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="sqyGGQWo"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5b8d13f73so513064785a.0
        for <spacemit@lists.linux.dev>; Mon, 09 Jun 2025 13:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749499706; x=1750104506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXZOtes7v+x/7Gb9DsK5r+A9Wyuu/k4Jt+Vsyyna0xw=;
        b=sqyGGQWo0w0hQUtRa3LUZDeTfr9eLNy/wFOfF9nuz9ezLOzeiX+JJXJyvC1qxBP272
         qCzqYfkPU3XvH+ywZrquRupRVNwtJEPckae1RL9N3Y8WJ+/FiKm1uwbu00JIh5VFIeng
         Fn0l9f0V30M9QbZw1Ev8J3fcwB/XzI+T3LlFjNfa3/6p7LMo28aITUzGzRRnf5EwdrFs
         y1On1p1qQsREZ5PqI/o529Pk3FMPFuGF0+q7QiRZfO3D0Vb+8COUViY1YU3VBL3HJ8ll
         XFwmVP8YWYZtcmpCCGsyhBy6Xza+DN37y7rPpIzlAbpvFfihZR0ka15fB/I8f7Im8pgU
         w0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749499706; x=1750104506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXZOtes7v+x/7Gb9DsK5r+A9Wyuu/k4Jt+Vsyyna0xw=;
        b=gZc0VoutJDNGVHfNnplb6susj//WCRnXgN6cAyXQY4lY6ePEBDvEb7VYeYAH1EvrW7
         /jQ7JR3fongBNCxBSa9mcvE0YBPW47BYsJPuwMhPwrzKm03lIJbGcvNxph6J9ahR+hRd
         46lavpN3/LWXyZ+GOtv4CQI6RKc7tYETrUQeAM8QLp/uyl0Voj9b3fMCvLFhQzUopzyB
         aaCDlhmVWVly4Iu+hBNDuxuIQHraV+0HCd4NPDwmPF9mwRv9ndK6jktWaIfQ+ZK9yV+S
         vzX1DDWEzOxdVfJ1jAeT2R9kUQyI1NuacT26rp0ZWasvBC1v0atXAikVKBn+jv7m4ATQ
         9JDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpKNlrGAMXVv9kvKNrwGBPUE606PZ5rV25Dkem09RP6/kENxwMsO+sbilMVEWPZjAeu0lOe5Wy+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/+o4L0khCn4n+AuGRxjhXRFSf4Rs6v475I3MmjEOGfAlS/QPh
	Gs2sz/teZ0B7RfygKP3hYdw3Q3HguTVedz3UXtIZHoCMmsnJKaf496YnNE8/WRe51BY=
X-Gm-Gg: ASbGncu22+QcIftjr+FG9FJWNx3qqtXheDWLSqVaKnQ9MehJ6VSOThlJSx93H+S52Ld
	0YVmLsLGSKyAE7n1bQSutf2QyO4Ejsn5wXtr9/drRVRmebfutCMzktOGyFEBqTpwJzZVAQnscSh
	WkUQrwzlzukWk3n3etorbdKizw2sZ9psT8mmRf1NFPrJ+I+AQLY7Bm3Wuw+nyltpYyViHpipMek
	fAWR9RjspBSVME4ESo0j2oi7vMZUOIOdq5ndVKQsTLMW8ZSarbbNF5pooAShSGzblompJK/OrWe
	MGfC6d+mqzijVpELqWg5oYWsFKqqzF8kRerX08AuaQ6xUMyteLnbtMkNn5ctCE0/dHD1et3NglS
	4RmgT5C3pbNmreOgBK9Lb
X-Google-Smtp-Source: AGHT+IGQOWA/DdgNdcF0vOFp4bfRniwjEhSufXRdrgu6ZhEZb9CO/nMVcj463R4KXqdEUZZrqIYgZw==
X-Received: by 2002:a05:620a:28d0:b0:7c3:d7ef:f7f5 with SMTP id af79cd13be357-7d2298b164fmr2068749685a.18.1749499705469;
        Mon, 09 Jun 2025 13:08:25 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b2a021sm55869336d6.83.2025.06.09.13.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 13:08:25 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: dlan@gentoo.org,
	heylenay@4d2.org,
	inochiama@outlook.com,
	elder@riscstar.com,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guodong Xu <guodong@riscstar.com>
Subject: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
Date: Mon,  9 Jun 2025 15:08:21 -0500
Message-ID: <20250609200822.468482-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pll1_d8 clock is enabled by the boot loader, and is ultimately a
parent for numerous clocks, including those used by APB and AXI buses.
Guodong Xu discovered that this clock got disabled while responding to
getting -EPROBE_DEFER when requesting a reset controller.

The needed clock (CLK_DMA, along with its parents) had already been
enabled.  To respond to the probe deferral return, the CLK_DMA clock
was disabled, and this led to parent clocks also reducing their enable
count.  When the enable count for pll1_d8 was decremented it became 0,
which caused it to be disabled.  This led to a system hang.

Marking that clock critical resolves this by preventing it from being
disabled.

Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
be supplied for a CCU_FACTOR_GATE clock.

Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Alex Elder <elder@riscstar.com>
Tested-by: Guodong Xu <guodong@riscstar.com>
---
v2: Reworded the description to provide better detail

 drivers/clk/spacemit/ccu-k1.c  |  3 ++-
 drivers/clk/spacemit/ccu_mix.h | 21 +++++++++++++--------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index cdde37a052353..df65009a07bb1 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -170,7 +170,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4,
 CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
-CCU_FACTOR_GATE_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1);
+CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
+		CLK_IS_CRITICAL);
 CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(15), 11, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
index 51d19f5d6aacb..668c8139339e1 100644
--- a/drivers/clk/spacemit/ccu_mix.h
+++ b/drivers/clk/spacemit/ccu_mix.h
@@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
 	}									\
 }
 
+#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
+			       _mul, _flags)					\
+struct ccu_mix _name = {							\
+	.gate	= CCU_GATE_INIT(_mask_gate),					\
+	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
+	.common = {								\
+		.reg_ctrl	= _reg_ctrl,					\
+		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, _flags)	\
+	}									\
+}
+
 #define CCU_FACTOR_GATE_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
 			       _mul)						\
-static struct ccu_mix _name = {							\
-	.gate	= CCU_GATE_INIT(_mask_gate),					\
-	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
-	.common = {								\
-		.reg_ctrl	= _reg_ctrl,					\
-		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, 0)	\
-	}									\
-}
+	CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
+			       _mul, 0)
 
 #define CCU_MUX_GATE_DEFINE(_name, _parents, _reg_ctrl, _shift, _width,		\
 			    _mask_gate, _flags)					\

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.45.2

