Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89313238C15
	for <spacemit@lists.linux.dev>; Thu, 11 Dec 2025 01:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765416049; cv=none; b=M3C1+TALn91jURLdzbnVMjBIQStBLZSqBf5B7m3T1ZlnSrbKwKwR1z1Asruy0+djK+c4VaHLLEXB4dq1qwLV9vvFVrK+AaplWGFXAO9w7i8rInFLZwPUwzCxkyyEE0cRjjQcaIPB5IRkxclk4XxVYr8H96Wot/mWnHiW4OZ1/J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765416049; c=relaxed/simple;
	bh=z0ZgybaynQikg009OHl+uzvyamuWc/NqSoIjZV4jmnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hnvOxr46yHhbP93GkNFT6lbhOu1nJ69vDuPH9aVjFA5C+Z+uU5qYrFIRQrn6dDt8j0kQjcrqwiiEwm58xaExmA2Ij0QvMWqnISxzQ+KOYGis7b6R7+AvHfr1RdnH2UQCir2bay1WOPghu3hTAGOzBCWc4yCSWi+blPh4Vx6qzFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id DE442340D4A;
	Thu, 11 Dec 2025 01:20:42 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 11 Dec 2025 09:19:42 +0800
Subject: [PATCH RFC 2/4] clk: spacemit: ccu_mix: add inverted enable gate
 clock
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-k3-clk-v1-2-8ee47c70c5bc@gentoo.org>
References: <20251211-k3-clk-v1-0-8ee47c70c5bc@gentoo.org>
In-Reply-To: <20251211-k3-clk-v1-0-8ee47c70c5bc@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3259; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=z0ZgybaynQikg009OHl+uzvyamuWc/NqSoIjZV4jmnI=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpOhxY8P9XtfuKZFnfAmWEln3d3oL1AMPO+pGyW
 RWDCyiz7e+JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaTocWBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3Ygw/8C8l2Q2t/zWgnPHCYvRyse+6XhTdzqmpPDqgX3VpKpz+BbDaDP5aUA
 6W9OZ0qQDkgp+3nKD2LDr5Ov1MYjaActhTSF7HNbzaJlNN5zqttZtrbdJTyMvXd7SxfVWOfvyS3
 6Q0Gn2jZgtt3My111ahdeBHn8Mdn0YCPAvk8vjqUo+kDBkipG6N0nfacbnWZK36kZPX9C21u+C4
 5j/zkfIjglDNN+I5rh7zA913YDzxQAeDFjd+3HalvG9Lns/SlXbnqarevxKc6sMM2hiYc7ocexW
 eGLaEHwUT+3Q4/N7ADmVAb4tXUOj9qVewFAgW19yTtCgul7RrkUJ4NyWsGhG1qM88q+IFkgLGWS
 4JOTJFxpOlMB97bxebcIfZf/ufdK8WrWgihsirElShnaf+USljwUCrNVxZZfs1KOnpAn+jtyFsj
 WQYE6vQZfRJz6nSfq8KpCRbfEY6idrmpv7/TzEJ0ovM2lHE886g1T5ubTkCpczXuZupnH28lFJs
 z9/dAK5C/A/lfNpJlBaJctjHixcGvjc3lONFjbsvymQSG0qth4bgQzj6K9eXMibs/syT+HT4xwS
 DNEqN3uwlVD/+k0x9w/IdCfB5k61AqjTExWYnYt1ONgh3+pATROOFjPDq/y1TIoThejaeKteZTq
 fdaboaP3ZBn1zQngI61MBW0XkHBLWg=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

K3 SoC has the clock IP which support to write value 0 for enabling the
clock, while write 1 for disabling it, thus the enable BIT is inverted.
So, introduce a flag to support the inverted gate clock.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/clk/spacemit/ccu_mix.c | 12 ++++++++----
 drivers/clk/spacemit/ccu_mix.h | 12 ++++++++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
index 7b7990875372..14fbf7048c89 100644
--- a/drivers/clk/spacemit/ccu_mix.c
+++ b/drivers/clk/spacemit/ccu_mix.c
@@ -16,17 +16,19 @@
 static void ccu_gate_disable(struct clk_hw *hw)
 {
 	struct ccu_mix *mix = hw_to_ccu_mix(hw);
+	struct ccu_gate_config *gate = &mix->gate;
+	u32 val = gate->inverted ? gate->mask : 0;
 
-	ccu_update(&mix->common, ctrl, mix->gate.mask, 0);
+	ccu_update(&mix->common, ctrl, gate->mask, val);
 }
 
 static int ccu_gate_enable(struct clk_hw *hw)
 {
 	struct ccu_mix *mix = hw_to_ccu_mix(hw);
 	struct ccu_gate_config *gate = &mix->gate;
+	u32 val = gate->inverted ? 0 : gate->mask;
 
-	ccu_update(&mix->common, ctrl, gate->mask, gate->mask);
-
+	ccu_update(&mix->common, ctrl, gate->mask, val);
 	return 0;
 }
 
@@ -34,8 +36,10 @@ static int ccu_gate_is_enabled(struct clk_hw *hw)
 {
 	struct ccu_mix *mix = hw_to_ccu_mix(hw);
 	struct ccu_gate_config *gate = &mix->gate;
+	u32 tmp = ccu_read(&mix->common, ctrl) & gate->mask;
+	u32 val = gate->inverted ? 0 : gate->mask;
 
-	return (ccu_read(&mix->common, ctrl) & gate->mask) == gate->mask;
+	return !!(tmp == val);
 }
 
 static unsigned long ccu_factor_recalc_rate(struct clk_hw *hw,
diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
index 54d40cd39b27..8a70cf151461 100644
--- a/drivers/clk/spacemit/ccu_mix.h
+++ b/drivers/clk/spacemit/ccu_mix.h
@@ -16,9 +16,11 @@
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
@@ -48,6 +50,7 @@ struct ccu_mix {
 #define CCU_FACTOR_INIT(_div, _mul)	{ .div = _div, .mul = _mul }
 #define CCU_MUX_INIT(_shift, _width)	{ .shift = _shift, .width = _width }
 #define CCU_DIV_INIT(_shift, _width)	{ .shift = _shift, .width = _width }
+#define CCU_GATE_FLAGS_INIT(_mask, _inverted)	{ .mask = _mask, .inverted = _inverted }
 
 #define CCU_PARENT_HW(_parent)		{ .hw = &_parent.common.hw }
 #define CCU_PARENT_NAME(_name)		{ .fw_name = #_name }
@@ -101,6 +104,15 @@ static struct ccu_mix _name = {							\
 	}									\
 }
 
+#define CCU_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _inverted, _flags)		\
+static struct ccu_mix _name = {							\
+	.gate	= CCU_GATE_FLAGS_INIT(_mask_gate, _inverted),			\
+	.common	= {								\
+		.reg_ctrl	= _reg_ctrl,					\
+		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_gate_ops, _flags),	\
+	}									\
+}
+
 #define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
 			       _mul, _flags)					\
 static struct ccu_mix _name = {							\

-- 
2.51.0

