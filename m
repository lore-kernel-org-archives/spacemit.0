Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BE71EEA54
	for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 00:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766018617; cv=none; b=odDJLKyoXqiT0ANpgwC17BrqwvG6U2I92h4W935cYBOWP1s1WVcvHMxruu6m3OhUNvgd6vuR3hP0ncGP299XJUBQ3idK1OttEeZRQCbojlHx7Fyq5FlKxPGYMX8WAbS15k9oaEfxPThANyRlYdohnD80XHjhr1RWg+8SL7zTik0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766018617; c=relaxed/simple;
	bh=3U+uEvM5FmJ21lBK+piPuzGOpXb+adXu2iPH+sgOaBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hoITwZwMwY87Z/j5JTqHYy1Vtp47cdMLnQQfyUL0gE+aHiOgu5Sz7aP0xLAfRANDlN5J2xTdrKkwHG1cF8DXeHAqN97Y3WTv7ZzlDOlW9GjjkGosu5ARqw/1cn95A1O0k/XEwey8TXVQlICEctc3WWTt7FfLTZJ8fXs3Dy0hfV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPiCoVEp; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPiCoVEp"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a1022dda33so541445ad.2
        for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 16:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766018615; x=1766623415; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFBvL96SsBXFY1GOi9n3IufCfDj+mjJoC0nT1JtdTtw=;
        b=EPiCoVEpQFrxzJGzZEYcPaW5xkVKrwu06UPQkQUCN1j+T70dcyY78yvR26UO1k1Nfg
         2m2Q04M853KCFAcU9iOc+3AbqHch+aXfEwRxW5kIpcJS7qxCuvu72AxA+IZSTEBRxl5y
         1AKNyD3yvdW5TIjx59JXulVqEppitAgYUKwSFEaNFNmSmAtHjCHJxLV6nsds8g/5HvY/
         Or1+dS3+4OoN+ZEOC4pMOHSj2v8Povfk1/cxtUjtSXD2HbRDWa5lg+AHJBQJy3HKY133
         fQsyiqXQmn38Ua+cUgvvAkYY/oKxkeOyV5KL5WmVlMCzCjWG5YMn+R6mYs1Q8K9mm3Bq
         a9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766018615; x=1766623415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFBvL96SsBXFY1GOi9n3IufCfDj+mjJoC0nT1JtdTtw=;
        b=fjRREqxO+KgnUamL4vH+7r+GZ0GY375Do1uKOCAJ/87z2lQ/fwW1plp/oeEw47zWI7
         1qm9rzfKrFOaPEA2Fe6FVnp4V66ZCUnumiGzATeLRHXD5LbzaLO6/ok21uOctYbd907L
         Oo9xvdse1fnNX5QFKmw5iW9Z0jAHsKG5jOSS6rMuw3wkIz/4x1y1wrBmkmYMcmo3WJXf
         s8NlvTtAEQ9QZ9Tz8AXP1t0Me75YhRsG5mRi3g06sRNScHsYPZWZGRTTFQaw5wZUQe5+
         kJ5J+bbWG4ecis+cOQIBrDhs+x2jmoHgrk0dlHNDmYPzo6+VniXbU44fbM/xk1F+x1lc
         XRhA==
X-Forwarded-Encrypted: i=1; AJvYcCV3m3l0gWt5UymQbeOBL9X7RWAX+nGu/y9+3JMeb/41Y91z1EM2NZWSt+0Cuo5haqXRZMcyXaBQeA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOdSwlhUcGJMZnwkb0ASGIBs41q5RgloCEBwrUvMWjPDbv05uW
	+XVW/K/Towbtz46cnjlqdgG/EUUBxx7FOGfAC6r1hIl+5vKUPtbFDyrz
X-Gm-Gg: AY/fxX5emvBdlkbIQZiJVE/qBMGeaIfHQsovaF/4HWqTLrSjit8WD/476u4GMUp0C1l
	x0kebWVXDHGLSwvBq/0L6UH/rGlSYI8IXdJI0qAtYdsZCcsWVtAA1+bhiZ+QRu7yTZXwZxUvvJf
	cj0mywgHESkLvh7sRhlZPeIfaOgORzO108nChI1eKBa5lG/rPv9177U4KUd7toaOdCB+/aWdj4z
	lyEPmS2SvEC7p4dVHNVl0mFN8AdEyZaVkPBJpuhOSzEot/EB/kUDthQ0BVhkUOpoYsN8mTXCN4+
	MiEyzXCnm5qU3XD0D6gtIpH5XRkiNvhnpbHKR65tJ0IJsM0gxyNUxlM7Qi1S5wY74RH7RAIk+Xc
	T3oWv1TgwZmdyTkl/+au2dogPz01S6ZN0WAZQeH9Z8xcTk6SQylSqCINkHfbwvrRpYAOU6kTzIs
	SmAUlzkMnHcQ==
X-Google-Smtp-Source: AGHT+IHXPYnZ7E69bP2nqUc/pQLxn101I1QmHMYq1oQ+b98tg7iTEqKDi2M4pJ8wuRrwwolMhc/67g==
X-Received: by 2002:a05:701b:2218:b0:11a:72c6:22d6 with SMTP id a92af1059eb24-11f34c02a6fmr15633109c88.25.1766018615312;
        Wed, 17 Dec 2025 16:43:35 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061fcfc66sm2825041c88.15.2025.12.17.16.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 16:43:34 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Brian Masney <bmasney@redhat.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3] clk: spacemit: Fix module build for spacemit common ccu driver
Date: Thu, 18 Dec 2025 08:42:27 +0800
Message-ID: <20251218004227.221861-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For build spacemit common clock driver as a module, the build
process require MODULE_LICENSE()/MODULE_DESCRIPTION() globally
and EXPORT_SYMBOL() for every exposed symbol. Otherwise, the
build will fail.

Add these missing hints, so the driver can be built as a module.

Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/clk/spacemit/ccu-k1.c  | 1 +
 drivers/clk/spacemit/ccu_ddn.c | 1 +
 drivers/clk/spacemit/ccu_mix.c | 9 +++++++++
 drivers/clk/spacemit/ccu_pll.c | 5 +++++
 4 files changed, 16 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 4761bc1e3b6e..01d9485b615d 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1204,6 +1204,7 @@ static struct platform_driver k1_ccu_driver = {
 };
 module_platform_driver(k1_ccu_driver);
 
+MODULE_IMPORT_NS("CLK_SPACEMIT");
 MODULE_DESCRIPTION("SpacemiT K1 CCU driver");
 MODULE_AUTHOR("Haylen Chu <heylenay@4d2.org>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/spacemit/ccu_ddn.c b/drivers/clk/spacemit/ccu_ddn.c
index 5b16e273bee5..b5540e0781ff 100644
--- a/drivers/clk/spacemit/ccu_ddn.c
+++ b/drivers/clk/spacemit/ccu_ddn.c
@@ -84,3 +84,4 @@ const struct clk_ops spacemit_ccu_ddn_ops = {
 	.determine_rate = ccu_ddn_determine_rate,
 	.set_rate	= ccu_ddn_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_ddn_ops, "CLK_SPACEMIT");
diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
index 7b7990875372..67f8b12b4f5b 100644
--- a/drivers/clk/spacemit/ccu_mix.c
+++ b/drivers/clk/spacemit/ccu_mix.c
@@ -198,24 +198,28 @@ const struct clk_ops spacemit_ccu_gate_ops = {
 	.enable		= ccu_gate_enable,
 	.is_enabled	= ccu_gate_is_enabled,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_gate_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_factor_ops = {
 	.determine_rate = ccu_factor_determine_rate,
 	.recalc_rate	= ccu_factor_recalc_rate,
 	.set_rate	= ccu_factor_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_factor_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_mux_ops = {
 	.determine_rate = ccu_mix_determine_rate,
 	.get_parent	= ccu_mux_get_parent,
 	.set_parent	= ccu_mux_set_parent,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_mux_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_div_ops = {
 	.determine_rate = ccu_mix_determine_rate,
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_div_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_factor_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -226,6 +230,7 @@ const struct clk_ops spacemit_ccu_factor_gate_ops = {
 	.recalc_rate	= ccu_factor_recalc_rate,
 	.set_rate	= ccu_factor_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_factor_gate_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_mux_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -236,6 +241,7 @@ const struct clk_ops spacemit_ccu_mux_gate_ops = {
 	.get_parent	= ccu_mux_get_parent,
 	.set_parent	= ccu_mux_set_parent,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_mux_gate_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_div_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -246,6 +252,7 @@ const struct clk_ops spacemit_ccu_div_gate_ops = {
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_div_gate_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_mux_div_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -259,6 +266,7 @@ const struct clk_ops spacemit_ccu_mux_div_gate_ops = {
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_mux_div_gate_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_mux_div_ops = {
 	.get_parent	= ccu_mux_get_parent,
@@ -268,3 +276,4 @@ const struct clk_ops spacemit_ccu_mux_div_ops = {
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_mux_div_ops, "CLK_SPACEMIT");
diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
index d92f0dae65a4..7389202c4831 100644
--- a/drivers/clk/spacemit/ccu_pll.c
+++ b/drivers/clk/spacemit/ccu_pll.c
@@ -7,6 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/math.h>
 #include <linux/regmap.h>
+#include <linux/module.h>
 
 #include "ccu_common.h"
 #include "ccu_pll.h"
@@ -157,3 +158,7 @@ const struct clk_ops spacemit_ccu_pll_ops = {
 	.determine_rate = ccu_pll_determine_rate,
 	.is_enabled	= ccu_pll_is_enabled,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_pll_ops, "CLK_SPACEMIT");
+
+MODULE_DESCRIPTION("SpacemiT CCU common clock driver");
+MODULE_LICENSE("GPL");
-- 
2.52.0

