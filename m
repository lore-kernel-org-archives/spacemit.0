Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7330E145B25
	for <spacemit@lists.linux.dev>; Sat,  7 Jun 2025 20:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749328087; cv=none; b=VsoaMV4TxMLkAiVVQCcZ6P8GwW0Xvk+Y8NxITz2Hfcwf95YIqVX7nCFhJJTFwkkSNvsMoDWcDbcypAuFxIgYTM3iYDvBbUMGuXQRfic9mUw+d81GcoLOQIAgA1jXyvIXaEw/j+L6FzFhjB6Htq6M8a8w4weRa618Mh/e6D/te64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749328087; c=relaxed/simple;
	bh=7neKK/LUxYPlYgKjRN/Lyrv3ugJoj6FkgGZxKg3h/qg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lVjeUQJxr1JsnNVC0rnlJkfTxQToLJdmTdEKIDZm0mrt1GpwUJ/wqNa1WH6c/G36SpS0wR1YVL9CFQnd1QVoIz/HqBBLftaNCjgU7nnG1Hpw+FD/6rX9EvCGltnr3njBpI6xiQr72pcnrqLLeJdaiNM0iGrZsHN7J0iAmq3pPmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=sYTVL29p; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="sYTVL29p"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2da73155e91so1308915fac.0
        for <spacemit@lists.linux.dev>; Sat, 07 Jun 2025 13:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749328083; x=1749932883; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+L1F7WN7oNU4Rha4L1L/e482m8K2Vmc2Laqvym1FnH4=;
        b=sYTVL29psccPtYvwWwG2+cLe4u9Li4d+E9QnTtw5t3La8Tr85vbl3HDN9tZI/XRO7V
         H1cjoGDsKp/W27ILSx3sx26JQxJAY0YmfKQFV/Ts2n3sT3+h3GwjiBww2tH9EjMgAy1j
         Y2m139guSlC29aK3jROb6xHptR3l8L6UXD6PtjoH8xqMoXfMe85i7BzwmiISkv7/277M
         +SeDbPI2IjZ/E0KzoO5/U81z21ePrwapPLY1q9EucseblHWn7TkWiZvIDHBb4v6NXaay
         CnwgTsPGXeFjmoWL1CgD1adMFjzDPRtc9FIWlR8QJS9tuTa972pCye5qvyj2TDWN0UFf
         bjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749328083; x=1749932883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+L1F7WN7oNU4Rha4L1L/e482m8K2Vmc2Laqvym1FnH4=;
        b=hGVXRBcZA/AbEdw67+0mahiPMzTseycNt4/c3KNVq/zFG1tpi39qRzDtCw+D27iKs2
         7aA9q/Y7mTCh+RZ4RJyPPqUQEZ9crCIqZ/c9k4Od8q4fcXwdMf8NwbdHYmNOMDZ1un5F
         yPhGBVhrTbU7C1vJieqOaNV5qOfd+Ge6wPVn2Pe2AiTbJyxsg7KHw5ir/z2t3hTgL9xQ
         HDqq+ugAF1uDdCv54hCc7PZ6T+BdAM2UCf4O+MhBY6RH10/HwqvHm1cSeFRH56bs6Zg2
         f8s8NheALOIFDRHCIL62aaJXJkhlfZXj7Mdg+CDgdAikRNzFSQ3cTgTB/gglhamlJOId
         CzeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTJ8X+PcJQawS2ULABTxBd+4pDKPWRrqAPRRA9I+AHqXRzWkKWForzS917OSjdAIKEPpvTn6+1vg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGDRvjVqeWmCtcbaNSYI90CLdy+zn3CSK7PVlE9wrEd3W+Yysy
	BM5RbYq9iejMNqTwIv37dO/2G/9xe0/AbASax7ipI2rm9O+6uisb8Qvwo9PQjdpqnIM=
X-Gm-Gg: ASbGncvw2VVrAXuN/PdGR/2T+48fatX7z2kqqJKsCyRuVbJYZiIF6mYJ6nzeQXfXrnZ
	/mkKbWQ2mFBnwErc3eMgP5P1YkoGm0inkNSL9UqR5JUMYU22Rm+3z+hFe1ie6in3FaCHzGM/3Lm
	tCD3ObJ2+CXUOJFuTouorPib2OgqAFsN58D5QL4B0ijNmgiqyhDLKk0YYj6cupj5vC5aq1dO5dS
	lmpQWxs5CgGaqr+IDo3XkAV+M2+IGGS7Vw05ZzhGIVlLYrhBI1JOXimIUP57F7/YAQlnxdTTCw4
	6uqQ+rgkgcFfqY1fjlFuw2Ov9AH/9/FZ4R+GvYIGOV6X11fxI0OVv2P1dIwEPQcFoxrclHWqgC1
	gJhJt1mmMmVKXCqkdgUfVGLIijAMwXZw=
X-Google-Smtp-Source: AGHT+IEvPgGJvDGOrI6eAu5IXXdeG5KtOXQ02AqjXd9yxzuhdNHpWFjKBYNJ0mWoWzWzeLONozHNTA==
X-Received: by 2002:a05:6870:818f:b0:2e8:ff0e:17d3 with SMTP id 586e51a60fabf-2ea009b7c99mr4489727fac.21.1749328083498;
        Sat, 07 Jun 2025 13:28:03 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60f3e46bc17sm747593eaf.0.2025.06.07.13.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 13:28:02 -0700 (PDT)
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
Date: Sat,  7 Jun 2025 15:27:58 -0500
Message-ID: <20250607202759.4180579-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pll1_d8 clock is enabled by the boot loader, and is ultimately a
parent for numerous clocks.  Guodong Xu was recently testing DMA,
adding a reset property, and discovered that the needed reset was
not yet ready during initial probe.  It dropped its clock reference,
which dropped parent references, and along the way it dropped the sole
reference to pll1_d8 (from its prior clk_get()).  Clock pll1_d8 got
disabled, which resulted in a non-functioning system.

Mark that clock critical so it doesn't get turned off in this case.
We might be able to turn this flag off someday, but for now it
resolves the problem Guodong encountered.

Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
be supplied for a CCU_FACTOR_GATE clock.

Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Alex Elder <elder@riscstar.com>
Tested-by: Guodong Xu <guodong@riscstar.com>
---
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
-- 
2.45.2

