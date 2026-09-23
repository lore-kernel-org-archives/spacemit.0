Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6472738838B
	for <spacemit@lists.linux.dev>; Wed, 23 Sep 2026 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156106; cv=none; b=fWag+2mF5jZzPI4g+iO3gnaY7hbcdItJCAmVF9OiGzWi7UO4wX/gSJIz+R6s6RKpFr0IY0ZmPQGPIjmz90CkNSXOgzn++C7cqvmBp826oCT7lQseJRBVuXdu4fVnx0g6XVvz1zxstuFzFUA1ZxB4nVHm6g5XoPxW8OCjggaloNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156106; c=relaxed/simple;
	bh=NRLwp8NB1IxmSa8mEQExvHg9nJZQbtlW+HLuENSffDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g+wQ3mzYA/qQpqQ/P/YNhyjewiADUM4oXNTaY58LAWlPtH5EVcuO4GFtX6Dj8hbE87eIZ7LxSKXy93dcX5plcqD8S+Wj2RsMrIZnvTcMSZBguR/tO5W2jrFxULJ7Mh9rjiO+6cYIoIT0IlZJWTGVSZbV6WSN0YR+9noDlWWkjS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFXzSLWM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFXzSLWM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C711F000FF;
	Wed, 23 Sep 2026 09:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790156105;
	bh=xVDLYm7Vc4eS7g7lUhStZtpiZZEIXN58iH76x5D+dEk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YFXzSLWMiAgjrPzz+WXvfa6dOMTPMk6g526ZW54x4DQ3ohUq8rZlWNZb8cJJvzIa3
	 jBQLVbY8iu3gBRIc1i6btYi4i7O40vnP0eVEjHZSHRAwvKjz/4A0Qof994hrkDI9i8
	 CU0ANQtfwC1PHMIlFwp5lJa+LliXF780R5vuuUKROa8KQpwVkIq5hnoP2v4xvVMhbU
	 tcFTx9Qldwp4vFeq2iXzMaA+lZIlfxYkHWt2Nv2p2ghXR++lo9z/GgGln8cjbpnXpq
	 XVdlmdG48aMGVtKFNcddLBISkJd1D0Z02kqQM3MlXCrs9sDOphQH4PfYWWBKlrD+o3
	 b5F4eSGPrcXmg==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 23 Sep 2026 09:34:25 +0000
Subject: [PATCH v2 2/8] clk: spacemit: ccu_mix: add inverted enable gate
 clock
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-01-k3-clock-reset-support-v2-2-6ec0abb1c7b5@kernel.org>
References: <20260923-01-k3-clock-reset-support-v2-0-6ec0abb1c7b5@kernel.org>
In-Reply-To: <20260923-01-k3-clock-reset-support-v2-0-6ec0abb1c7b5@kernel.org>
To: u-boot@lists.u-boot-project.org
Cc: spacemit@lists.linux.dev, u-boot-spacemit@groups.io, 
 Lukasz Majewski <lukma@denx.de>, Tom Rini <trini@konsulko.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, 
 Raymond Mao <raymond.mao@riscstar.com>, 
 Guodong Xu <guodong.xu@oss.qualcomm.com>, Peng Fan <peng.fan@nxp.com>, 
 Torsten Duwe <duwe@suse.de>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Alexey Charkov <alchark@flipper.net>, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3297; i=dlan@kernel.org;
 h=from:subject:message-id; bh=NRLwp8NB1IxmSa8mEQExvHg9nJZQbtlW+HLuENSffDg=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqs50p/OEdcNrXnpI/Fjgp2feQ6M7VGpD4aPRrq
 KSwtnzWItiJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCarOdKRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0aGg//RpiWlqlQI9k2UbhWQRQVypkvbR5HcTRGdcvHfRWAF2cu2exHKNCSn
 4ONHndqBqy75rJbL0afT0ikstLTsjGDnPlMI03pGUsZAgdsK9w/pdSw8++T3JETEAGFnrr1BRl3
 6ahojMf5whxaFTG7kE83BauuV5SZSIBHecUYjzMi6PXOX0p82znr9Jl4ajzbv7mNHpwwp/ApjKe
 uDrawJG/CFpFgDpQjAvq158ZfZhgyk/rEzQwG/WAYpILSRem5G1Zw/gQFFhPOLObVLOh0Wtsd+1
 6Ai3S3Nf4HZGMtDcXMOvkefZNALgwHzk9d+tC+ZL0lwW217zglTzTCzUvFByEO/jTtgwKe5rsoj
 s4rfCBufyj210CMLp6hCAD/UDhjJQxdKQ5icNvx7oINMseEpoOk4pybbjgeT/IdgtjR7UP+QAEy
 vr7hu3ScEYTKV55WgRP3nfzayV63vUdLAVTwvikBSnfqnP9aFKILmTLE80puBDLN7I1joJyz74+
 ee1Net4PqhqdAKwe8Z00AVaz1qqH6Ksj2Xl1I0/mpW0P5F+N+FHDgOZCu8kOZ44/CHTbJx2/3xf
 M8J7xnMJ3/ObZloeCfpDB0s2bwfIecEZi3LRuPwyOnfGk1VD3bQZevy6dsXy0T79cu92g1pxzXO
 JYtDDfaPhYF9zpz4bHWyh3+jM3Bl90=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Based on upstream linux:
  ace73b7e2763 ("clk: spacemit: ccu_mix: add inverted enable gate clock")

K3 SoC has the clock IP which support to write value 0 for enabling the
clock, while write 1 for disabling it, thus the enable BIT is inverted.
So, introduce a flag to support the inverted gate clock.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/clk/spacemit/clk_mix.c |  7 +++++--
 drivers/clk/spacemit/clk_mix.h | 17 +++++++++++++----
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/spacemit/clk_mix.c b/drivers/clk/spacemit/clk_mix.c
index 45bf2c72375..b0d1a506851 100644
--- a/drivers/clk/spacemit/clk_mix.c
+++ b/drivers/clk/spacemit/clk_mix.c
@@ -33,8 +33,10 @@
 int ccu_gate_disable(struct clk *clk)
 {
 	struct ccu_mix *mix = clk_to_ccu_mix(clk);
+	struct ccu_gate_config *gate = &mix->gate;
+	u32 val = gate->inverted ? gate->mask : 0;
 
-	ccu_update(&mix->common, ctrl, mix->gate.mask, 0);
+	ccu_update(&mix->common, ctrl, gate->mask, val);
 
 	return 0;
 }
@@ -43,8 +45,9 @@ int ccu_gate_enable(struct clk *clk)
 {
 	struct ccu_mix *mix = clk_to_ccu_mix(clk);
 	struct ccu_gate_config *gate = &mix->gate;
+	u32 val = gate->inverted ? 0 : gate->mask;
 
-	ccu_update(&mix->common, ctrl, gate->mask, gate->mask);
+	ccu_update(&mix->common, ctrl, gate->mask, val);
 
 	return 0;
 }
diff --git a/drivers/clk/spacemit/clk_mix.h b/drivers/clk/spacemit/clk_mix.h
index 26a12cedd0d..4ac61b55546 100644
--- a/drivers/clk/spacemit/clk_mix.h
+++ b/drivers/clk/spacemit/clk_mix.h
@@ -20,9 +20,11 @@
  *
  * @mask:	Mask to enable the gate. Some clocks may have more than one bit
  *		set in this field.
+ * @inverted:	Enable bit is inverted, 1 - disable clock, 0 - enable clock
  */
 struct ccu_gate_config {
 	u32 mask;
+	bool inverted;
 };
 
 struct ccu_factor_config {
@@ -48,15 +50,17 @@ struct ccu_mix {
 	struct ccu_common common;
 };
 
-#define CCU_GATE_INIT(_mask)		{ .mask = _mask }
+#define CCU_GATE_INIT(_mask)		{ .mask = _mask, .inverted = false }
+#define CCU_GATE_FLAGS_INIT(_mask, _inverted)	\
+	{ .mask = _mask, .inverted = _inverted }
 #define CCU_FACTOR_INIT(_div, _mul)	{ .div = _div, .mul = _mul }
 #define CCU_MUX_INIT(_shift, _width)	{ .shift = _shift, .width = _width }
 #define CCU_DIV_INIT(_shift, _width)	{ .shift = _shift, .width = _width }
 
-#define CCU_GATE_DEFINE(_id, _var, _name, _parent, _reg_ctrl,		\
-			_mask_gate, _flags)				\
+#define CCU_GATE_FLAGS_DEFINE(_id, _var, _name, _parent, _reg_ctrl,	\
+			      _mask_gate, _inverted, _flags)		\
 static struct ccu_mix _var = {						\
-	.gate	= CCU_GATE_INIT(_mask_gate),				\
+	.gate	= CCU_GATE_FLAGS_INIT(_mask_gate, _inverted),		\
 	.common	= {							\
 		.reg_ctrl	= _reg_ctrl,				\
 		CCU_COMMON(_id, _name, _parent, spacemit_gate_init,	\
@@ -64,6 +68,11 @@ static struct ccu_mix _var = {						\
 	}								\
 }
 
+#define CCU_GATE_DEFINE(_id, _var, _name, _parent, _reg_ctrl,		\
+			_mask_gate, _flags)				\
+	CCU_GATE_FLAGS_DEFINE(_id, _var, _name, _parent, _reg_ctrl,	\
+			      _mask_gate, false, _flags)
+
 #define CCU_FACTOR_DEFINE(_id, _var, _name, _parent, _div, _mul)	\
 static struct ccu_mix _var = {						\
 	.factor	= CCU_FACTOR_INIT(_div, _mul),				\

-- 
2.55.0

