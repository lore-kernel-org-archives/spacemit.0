Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806A02940B
	for <spacemit@lists.linux.dev>; Sun, 14 Dec 2025 23:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765755043; cv=none; b=jJSACl4IZwNd8gdQaQRY+/PPPVabmo3dZzO7xXDgBOClsSt9NXM/sQezc2UWLD+khQKMf5mOxuqdv9wCkPMCj5YhIHQuJTUp6ZOJXks1oztlHXoizr6t79KbyJAVbAqIP7C2bIZJG8PaK6KGsUWL9bYkuKe0KiuTZzFefC/qhJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765755043; c=relaxed/simple;
	bh=T7SjwE3X4VHRa7EQmLRK+I4LKSkVDZeZ306BR6wQm0A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVDXmLuc8EBeWnI3TzgObD1mrd9Q7fam2a4ZtEr25DCfihfGK1oPLRgNz3Bsgv6Ww9wVrL48ksipzFx5Wi/xe5ZJ0D2f5iu3sjQ8kDyOnvWUhXfIjxhlTW4P4ZVbd7hd3DZxBk97Rm3lEs+pnO9eAJnp4i/Wfimn2Sj3+WxQSrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7+8lpWT; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7+8lpWT"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c026e074373so2552343a12.1
        for <spacemit@lists.linux.dev>; Sun, 14 Dec 2025 15:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765755041; x=1766359841; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eYzoYAiPmzzivK8Ki6QV16iwe5G/a6yZeTp3lLRhlMY=;
        b=X7+8lpWTEK7YqZb4hnJGwuAM8Lu+MnGJKa5WRoQ5xzdPtZOCI8etiwG7lpdD3Kr8+B
         k8PABakRX+lZEPcEU8iQrQss0Jq+2X51JKNViRFgyvfD3cLZkIHgfopLO6K/P8tTxaGi
         a7OHb0ma2+DmHgqQ2JA9MIjXziGep2bOWyaXUGEDWqnT5JYUL8WPyh5gDrB23FF/efKO
         TCGQTUXOQV9o2Dd5i/V9Edm8tdzbCwnmoUuBbVorsPgC1viVSC+NLqd+Ist3Vto/gB+k
         Uxbjb3Y6LnJzK4uifA7ritydu0hmnqDReEaM4NHo9111m2UDjBvvkPtT90OamjapjlII
         QjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765755041; x=1766359841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYzoYAiPmzzivK8Ki6QV16iwe5G/a6yZeTp3lLRhlMY=;
        b=naFPVc/ok+KH5H6VQvvH+yjSqjh1XSYBBNyf0yWi3NnAURdUwGkycrwGbNXnPsMp0C
         3HQ8ylYZhlO7O5OvdKaztpSsb46TVqwa2ulAUddZpzN/8gpeelI28zmvtthRpbSK7q39
         yURyXMn+Ckxx3m0/Is1l2M9ybgJW707QoeWOZgb+NT7tfcC6UdNWVkBsJP0NGqUU26fu
         Gg4wvT/DlkjJpBKriu88Lw08gO0NJZpCKLydmWh8UaswP0PTPE4i/WJDWjiGGqW3xsQ7
         dtrhI16queymClgR+tX7/UC9bv53CORJ8Zeb13i3Z4RezpDqMX20yR5Hvmo5JQitB4PF
         SE6A==
X-Forwarded-Encrypted: i=1; AJvYcCXOlv5gNJsCEr66UXuEEM5lH3FwkCc34U1zgKyPypbTNa7wDX6utmCFD6UoalowZRZ1lKlLYiDx6g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJBH178rjL4fTv/X32VXu207OWk0D1qn3sGdaXxR/uC8jd4wQQ
	vBMsaB9m0AdIjUVXxhBt2ONLA56HwjGXzF+bKsZk5+rc5Eo0El+G8B09
X-Gm-Gg: AY/fxX55ZWNP+QE4duHH0ChQj0eqzivne9hfi1L0TO/G+xj1o5xQ+8kzVZ5ZffT/O0T
	0cz/2WwNQZz6AKu9af+IFxVGi344+X+RTauWzHTF6AHCFk/0qP3ps1nrJh9SLiS8bzt3njAY9MD
	u361OVP5sFTX1kgHpx5J8ISTSDZ2pEV1U0YZ+GD3NbOnecjicnIIKp6QQG5/hwjFoUKBi5KibB2
	VKkzpW0X7N92xyv0Tih9YYwXb/SBlzEIGpGpBgsjCNCmiCHefUUbChuWRXl0BPgO0ebOtj8I19j
	6je6ioEqelLuz0zu2WrLVhCiXMy72feQbA9IE1r8Ze8p8BDw+jz4p/PkG2tHvXmZ1YPiLPM7DRT
	erALyhwyD855QA51GV6cBYGzfD0R97JP8Oo4blAQOh7eN9LKpBpD5ODFJGdcpS9c0ZeZHsJJVMT
	RbUaBW65t8yA==
X-Google-Smtp-Source: AGHT+IGQk884QPSGZiuAKUTjJrQTSdk3vzJE7zDrugsr9qRUB8OVSda5q4I3tfPa/ntnYHcQi10gGw==
X-Received: by 2002:a05:7301:e0cc:b0:2ac:21bf:e937 with SMTP id 5a478bee46e88-2ac2f29b7f6mr4392207eec.0.1765755040555;
        Sun, 14 Dec 2025 15:30:40 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac3c13d60bsm13553377eec.0.2025.12.14.15.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 15:30:40 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Haylen Chu <heylenay@4d2.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Brian Masney <bmasney@redhat.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH] clk: spacemit: Fix module build for spacemit common ccu driver
Date: Mon, 15 Dec 2025 07:29:37 +0800
Message-ID: <20251214232938.668293-1-inochiama@gmail.com>
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
 drivers/clk/spacemit/ccu_ddn.c | 1 +
 drivers/clk/spacemit/ccu_mix.c | 9 +++++++++
 drivers/clk/spacemit/ccu_pll.c | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/clk/spacemit/ccu_ddn.c b/drivers/clk/spacemit/ccu_ddn.c
index 5b16e273bee5..9b6dc6910284 100644
--- a/drivers/clk/spacemit/ccu_ddn.c
+++ b/drivers/clk/spacemit/ccu_ddn.c
@@ -84,3 +84,4 @@ const struct clk_ops spacemit_ccu_ddn_ops = {
 	.determine_rate = ccu_ddn_determine_rate,
 	.set_rate	= ccu_ddn_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_ddn_ops);
diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
index 7b7990875372..09f377a6a4f5 100644
--- a/drivers/clk/spacemit/ccu_mix.c
+++ b/drivers/clk/spacemit/ccu_mix.c
@@ -198,24 +198,28 @@ const struct clk_ops spacemit_ccu_gate_ops = {
 	.enable		= ccu_gate_enable,
 	.is_enabled	= ccu_gate_is_enabled,
 };
+EXPORT_SYMBOL(spacemit_ccu_gate_ops);
 
 const struct clk_ops spacemit_ccu_factor_ops = {
 	.determine_rate = ccu_factor_determine_rate,
 	.recalc_rate	= ccu_factor_recalc_rate,
 	.set_rate	= ccu_factor_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_factor_ops);
 
 const struct clk_ops spacemit_ccu_mux_ops = {
 	.determine_rate = ccu_mix_determine_rate,
 	.get_parent	= ccu_mux_get_parent,
 	.set_parent	= ccu_mux_set_parent,
 };
+EXPORT_SYMBOL(spacemit_ccu_mux_ops);
 
 const struct clk_ops spacemit_ccu_div_ops = {
 	.determine_rate = ccu_mix_determine_rate,
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_div_ops);
 
 const struct clk_ops spacemit_ccu_factor_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -226,6 +230,7 @@ const struct clk_ops spacemit_ccu_factor_gate_ops = {
 	.recalc_rate	= ccu_factor_recalc_rate,
 	.set_rate	= ccu_factor_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_factor_gate_ops);
 
 const struct clk_ops spacemit_ccu_mux_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -236,6 +241,7 @@ const struct clk_ops spacemit_ccu_mux_gate_ops = {
 	.get_parent	= ccu_mux_get_parent,
 	.set_parent	= ccu_mux_set_parent,
 };
+EXPORT_SYMBOL(spacemit_ccu_mux_gate_ops);
 
 const struct clk_ops spacemit_ccu_div_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -246,6 +252,7 @@ const struct clk_ops spacemit_ccu_div_gate_ops = {
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_div_gate_ops);
 
 const struct clk_ops spacemit_ccu_mux_div_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -259,6 +266,7 @@ const struct clk_ops spacemit_ccu_mux_div_gate_ops = {
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_mux_div_gate_ops);
 
 const struct clk_ops spacemit_ccu_mux_div_ops = {
 	.get_parent	= ccu_mux_get_parent,
@@ -268,3 +276,4 @@ const struct clk_ops spacemit_ccu_mux_div_ops = {
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_mux_div_ops);
diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
index d92f0dae65a4..f8fc53887189 100644
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
+EXPORT_SYMBOL(spacemit_ccu_pll_ops);
+
+MODULE_DESCRIPTION("SpacemiT CCU PLL/MIX/DDN common driver");
+MODULE_LICENSE("GPL");
-- 
2.52.0

