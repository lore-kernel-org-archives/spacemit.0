Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCEB19AD5C
	for <spacemit@lists.linux.dev>; Fri, 19 Dec 2025 01:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766107771; cv=none; b=n+bRwc1Iz1ckFRpSRhh9Wq/DtaqMsOmuzemJocOXqzPQgKvTlfy4y7lC+BLXLPtrW+xiIe/VS8ob2+fE4G0oqX7SWrlLIqYzuOBd8j+qcPC1YVXu8zw1Xte4/pgYcgA0Ufjhl0jQNR1ImDgLW2xZ4uk1JDgek2iwWwThR2EGMqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766107771; c=relaxed/simple;
	bh=Tb7/WE3IPfVHDvtp1yGkJuvJOkxKx/jR/Dnp1byAOd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YJKNEQ0hZLbZnO9RakliGtz62dsOAVQCLkQcKK226dLFB6GiMhv273O90DEGmfdzbdrNOvXazIH11unzjoKxVvMiBYZgUI9wAP97RS2MC6A8peXqt0bmwYIoFOE5KtjQvw9AwSfzgQKwFVh5JQpRW0eUbzEEtzkx4TxLdkI4o9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/GGG+Be; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/GGG+Be"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0bb2f093aso12897185ad.3
        for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 17:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766107769; x=1766712569; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWWh4FwGIgdhUsOi3EYtk/dhz8Z1t2Z6pki4bZVI0Bg=;
        b=Z/GGG+Be4/V7SVSAhH7IjnMC8OnUdoyT3vBNVSz56G4LfP0q9QqqP1U3q7sF0aOaRL
         XHliknvv7Yo9ojFICJmV5FRA33CMkH7keqHOpYGeTNCEYPPAQ8B2RkIrT+dSLsYgWOrN
         awvsAD+utZWQZ59fB/ilZ2UHQUX8Cuz8zjYRtQC6G3oSaVWVCenusjxET4gXnGPnt/QX
         d4xQllqCuCBsuxGBwEwjjTdI6b8qAysY8hlBZQPzYUTBx+iEcjOkePEelcw9A4Vw/87P
         H8Cu5m0Dzxaw8IUSjlgNrIQSb9OxPTA/xYN2edbNu7ZSsi5lbsAfDhXYmUacyvAgDXh8
         cNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766107769; x=1766712569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWWh4FwGIgdhUsOi3EYtk/dhz8Z1t2Z6pki4bZVI0Bg=;
        b=dKcBrXE3aoPhpAs9KbA/9dLOMbIIjcXZxdGjccrnNEroFKgcW0lTuHebVj08EbQr8j
         mjsuVWhIWYyCOwZpOzHZeQrlwvuMwT2fek6JyVvbh/sYT+0VKrSk5wtEUGatpjpD/iJv
         3sF6G75/L5gISzG84e2OhVl8aBNTEau1zCyXt8/haP7Wj6zyAVVzU+q/WywxzG8BI3E8
         Yo3OfzngVNHtU0/Fm+BSo8J1IVCdv1V2dcVq1vG7OmzPxKAJsE9HJ7ej3BnxKXRC2YBc
         DgNiVmBuo2MDbyAwbaLPrUfaf6TNPPf9ri+bL7jfcIdLKHZT31e4i3aPa91lwLBFKTdw
         eI2w==
X-Forwarded-Encrypted: i=1; AJvYcCU2qLEzOOshV0/4qjpIk4xzJe6YbI4RC/zifcuN3qePFXhVstj+eNNW4SLf3suqvwfvw0cxQlIDzw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzORSJZk/OHFbhI23yjVEVnLiCayi7cUvs4XYrZTYfIt6510hLn
	kMvLFKBS/s8feOywrkjnndqXbfbV2idJqnxLtLGKpaFPS4Xc7bmKZukp
X-Gm-Gg: AY/fxX7q4yIiHLDWa4vHwZzRtXJv0Drq/Af0ipgHzZrm1BKiOBOqPivQhyAr3gt+pam
	kNjDxjj3nt8VjttbuHjITb27M1nrgryDcM2h8GFwalp2rqhAjdFdJ5Ife2i4kK9U4A396PMSMll
	Tw2cByrVyWZGyz/FzPCzEhqW2vAcYK1rrD7iWCKSEKITZy/2RPLb+j+XoUrJ6JjYk0e2/JH1MD6
	3EFXUnu4WGtiPXiMmRrjWFYvllt1tHWPGvInmOKCOeo+34h7xSjvqIDssatuk5vqftlRiuTnYHj
	fJgSHIilLZsz998HTPYAn5YCBAuXnzQd830eHr1eX982HxnCZR6zDPFK62TicXT3gZosNbkdFqk
	bg5UePeDInKKeNEvRcl7ay5Ql8tisvh1InzXtCvPyYp6YO2XjPSRCwaHY7pkTFb4vOsBAeMlde3
	yMiO/+COvZRInq1+Yqfhfh
X-Google-Smtp-Source: AGHT+IE7O1mGEpNS72Vw9iE/o2/iiXWpH+x3e4X6CYZynSGrcKdLgUt7hdbT3MImooLeHtQOOms8UA==
X-Received: by 2002:a05:7023:c087:b0:11d:f5d5:f699 with SMTP id a92af1059eb24-121722abe01mr1128444c88.20.1766107768634;
        Thu, 18 Dec 2025 17:29:28 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121725548b5sm3222028c88.17.2025.12.18.17.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 17:29:28 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Brian Masney <bmasney@redhat.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 1/2] clk: spacemit: Respect Kconfig setting when building modules
Date: Fri, 19 Dec 2025 09:28:17 +0800
Message-ID: <20251219012819.440972-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219012819.440972-1-inochiama@gmail.com>
References: <20251219012819.440972-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the SPACEMIT_CCU entry is only a switch for enabling entry
SPACEMIT_K1_CCU. It does not guide the build for common clock codes
even if it is a tristate entry. This makes this entry useless.

Change the Makefile to add a separate build for common clock logic,
so the SPACEMIT_CCU entry takes effect, also add necessary
MODULE_LICENSE()/MODULE_DESCRIPTION()/EXPORT_SYMBOL() for the module
build.

Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/clk/spacemit/Makefile     | 9 +++++++--
 drivers/clk/spacemit/ccu-k1.c     | 1 +
 drivers/clk/spacemit/ccu_common.c | 6 ++++++
 drivers/clk/spacemit/ccu_ddn.c    | 1 +
 drivers/clk/spacemit/ccu_mix.c    | 9 +++++++++
 drivers/clk/spacemit/ccu_pll.c    | 1 +
 6 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/spacemit/ccu_common.c

diff --git a/drivers/clk/spacemit/Makefile b/drivers/clk/spacemit/Makefile
index 5ec6da61db98..ad2bf315109b 100644
--- a/drivers/clk/spacemit/Makefile
+++ b/drivers/clk/spacemit/Makefile
@@ -1,5 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_SPACEMIT_K1_CCU)	= spacemit-ccu-k1.o
-spacemit-ccu-k1-y		= ccu_pll.o ccu_mix.o ccu_ddn.o
+obj-$(CONFIG_SPACEMIT_CCU)	+= spacemit-ccu.o
+spacemit-ccu-y			+= ccu_common.o
+spacemit-ccu-y			+= ccu_pll.o
+spacemit-ccu-y			+= ccu_mix.o
+spacemit-ccu-y			+= ccu_ddn.o
+
+obj-$(CONFIG_SPACEMIT_K1_CCU)	+= spacemit-ccu-k1.o
 spacemit-ccu-k1-y		+= ccu-k1.o
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
diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
new file mode 100644
index 000000000000..4412c4104dab
--- /dev/null
+++ b/drivers/clk/spacemit/ccu_common.c
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/module.h>
+
+MODULE_DESCRIPTION("SpacemiT CCU common clock driver");
+MODULE_LICENSE("GPL");
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
index d92f0dae65a4..76d0244873d8 100644
--- a/drivers/clk/spacemit/ccu_pll.c
+++ b/drivers/clk/spacemit/ccu_pll.c
@@ -157,3 +157,4 @@ const struct clk_ops spacemit_ccu_pll_ops = {
 	.determine_rate = ccu_pll_determine_rate,
 	.is_enabled	= ccu_pll_is_enabled,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_pll_ops, "CLK_SPACEMIT");
-- 
2.52.0

