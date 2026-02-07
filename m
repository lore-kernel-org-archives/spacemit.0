Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6C62F6937
	for <spacemit@lists.linux.dev>; Sat,  7 Feb 2026 15:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770477104; cv=none; b=TbtL0D1W3/AeNCdgI3yajq6CBn/Zwt8H+jnLSgVlgCvF6rCKfcUs/YYs91klqPb8oeYewgwTtDMfxTNGjLV5Uqoa6WKI8CZuoQkgo9wmZGYFVPyzYwJHbrvVR1/pHrUjcXoktl4eJnR0DTfNueXJdhkkc1UytZtnUPmQMgkOspg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770477104; c=relaxed/simple;
	bh=fObZ2VADvmnq2ga4fUiik6dtloWq4BE/WX/lsKHQ3Sk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DobZAZC6rnYV6Dv+zTo5e5k3EGF+VpNXjjpBOF72ttjPDhfPlf9ar5NGUc0TFaFgzotnorFb5KaSLF+/qaFzvmechN7t4UgbzqscAxV0JEDv2LKaIfx6QMcntffMf4V/JckCVTpTfBlOjo9T4iimluAOJfuxrbmTsX0Pxh1pmx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=khhyO2/I; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="khhyO2/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770477100;
	bh=3tysreunGyxK9grEoo6D7aMrnzbnsab2/WrUaDPKeU8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=khhyO2/IyoPkbk5evKLZsMMYxHUt/HTh+r+RGQcuY1HCxO2zBRF2BCWIUyGfcPjQX
	 N7FUtDPxr3gKpZFnA5xlZX/gxag2B0MGq4YjbU3na7asPJ6gaw+biNojjdTUNE9tdT
	 R7EbjSwC9MN7Ha2zSyj88BqroBU+V8hlX5w5zli8=
X-QQ-mid: zesmtpip2t1770476909ta9e74f16
X-QQ-Originating-IP: NqBWQtJ7emv0IMzEADEC24CCXPphDOyUyc+MZjPCjAs=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 07 Feb 2026 23:08:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18321366254888439668
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Sat, 07 Feb 2026 23:08:21 +0800
Subject: [PATCH v7 1/2] i2c: spacemit: move i2c_xfer_msg()
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-b4-k3-i2c-pio-v7-1-626942d94d91@linux.spacemit.com>
References: <20260207-b4-k3-i2c-pio-v7-0-626942d94d91@linux.spacemit.com>
In-Reply-To: <20260207-b4-k3-i2c-pio-v7-0-626942d94d91@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770476904; l=3114;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=fObZ2VADvmnq2ga4fUiik6dtloWq4BE/WX/lsKHQ3Sk=;
 b=bu1J1Kg+2C5ALywRbkZ6pYQAc7dkVxcV7i9gdjhpyGTuFjmHvJDrt/0aEkZ2RD7Q0tKMFTkAd
 mOVKspNhag1AZ/QvqMbxFXtcJ7DadSIgdE0IGxYFg6pnaGanWw2UuGm
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N1fXDe1nQuLqu4hjfZNDNBG5gH/vk3fVZ9zaEUQizhK7SC6V348eszT1
	0Bsjb+Ytd9VqarTkVL3Iys3UCkJ7ETLgOwVTm/AJKABdXzEuZJzSybLcPZpLhod6VnmAzj2
	dWrx0a9k7/19XObD2ZGPJjMvcl0YeWijhXooVT1kFg7rxl+aQunDxnOqAKPop3uGz+wBIlY
	CnjFp7u5zunesYwHQ7Q5rky0Dntc8onOdOVa8jGGpY8mwCB7t7yM8FiwlwWXlmRhEAAu9kP
	7/HqVe7N8kyH/FlyR91Oy/onYcNk/T3p40cNY0+5T5thOxL5oGa4VYq5oGr7sqPKj8YQmFq
	mQ0xgfrKFTk8pL6vlzt8gbf16ZrTUxspaUnYp5QroaS0grO4rJ8iuYPlyAu1byIVrX7yQ4q
	rJ5F3WI0vjqegQicDQZt8qE76u6kgN0Oj/J9i27z4D5EH0RWdcsCR/d3ZFiafmflfnF8zP4
	S0bi/VmkdM0YicoO1ET+2OUqaLXvcQNKnsZ0yv7mtAy5kVCNv+5wyfF6klbSz6XkwoRLFZH
	TGQy9rvgToRX4lEfLuYKr5NBnYSKczU3e9h1a/IubJKYiQbdk1ZxrYZWq+My8/yu4rr8Zoj
	QnAUr0lJctnmNwPr829h9qpbM4g9hWoaldM3NIjqIClkSaCCRXyQ1eOIhYJj08dKWl/upF8
	zORexO7QobCci1iBdpn4dp1IezV54Fz55Gcblhm4uFHq8a1HQqyKlrY43rNM4wPgVuGmFQx
	kwAGxQ5Fb+q3UfHQ9KhjLsd80dkAivUfR2Gl0MHnSJxUx8gF5mz+gHR7UtMUGqghrYNsBmq
	DKkACDXU8xrZ9+ibdZ9iAPDA+ZfmhAtSRNU0CjpxZpi2uRnIQ27O3PCyLq0sOHsCYpiFYOm
	j0LucK0qutVaYMEm6k6+akzlRjBwwWFIAGBprjnXWPbHP277yXIpuB3FVnubfE7A/+B1JhH
	rCc0eDOkcAZFcrfIiJw6XXBxG0C9Tagvrf3SDNxCIlwpbpZ96amWPl12ayYK6/R1spYGt++
	4cyXIHs8GwJrJiN2kuUYfUXIsGp/KH5HpDzW0F0E1qSGTQ7/dx/6dqkF0Coo0ssmVt8c+fV
	c3/PjRNTIeYh/c67W1zHK6rDgXWzPrlmE2yhO17NV4Srt1QF3rRZcYn6itIdsB141mX5dtj
	ZBY9S1zQJGw/o494okgedOXMCx08FtYPGV5bs5+clUEtouk=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

The upcoming PIO support requires a wait_pio_xfer() helper, which is
invoked from xfer_msg().

Since wait_pio_xfer() depends on err_check(), move the definition of
xfer_msg() after err_check() to avoid a forward declaration of
err_check().

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
---
Changes in v7:
- nothing
- Link to v6: https://lore.kernel.org/all/20260108-k1-i2c-atomic-v6-1-41b132b70f68@linux.spacemit.com/

Changes in v6:
- fix wrong subject
- Link to v5: https://lore.kernel.org/all/20251226-k1-i2c-atomic-v5-1-023c798c5523@linux.spacemit.com/
---
 drivers/i2c/busses/i2c-k1.c | 62 ++++++++++++++++++++++-----------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index d42c03ef5db5..accef6653b56 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -304,37 +304,6 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
 	writel(val, i2c->base + SPACEMIT_ICR);
 }
 
-static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
-{
-	unsigned long time_left;
-	struct i2c_msg *msg;
-
-	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
-		msg = &i2c->msgs[i2c->msg_idx];
-		i2c->msg_buf = msg->buf;
-		i2c->unprocessed = msg->len;
-		i2c->status = 0;
-
-		reinit_completion(&i2c->complete);
-
-		spacemit_i2c_start(i2c);
-
-		time_left = wait_for_completion_timeout(&i2c->complete,
-							i2c->adapt.timeout);
-		if (!time_left) {
-			dev_err(i2c->dev, "msg completion timeout\n");
-			spacemit_i2c_conditionally_reset_bus(i2c);
-			spacemit_i2c_reset(i2c);
-			return -ETIMEDOUT;
-		}
-
-		if (i2c->status & SPACEMIT_SR_ERR)
-			return spacemit_i2c_handle_err(i2c);
-	}
-
-	return 0;
-}
-
 static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
 {
 	if (i2c->msg_idx != i2c->msg_num - 1)
@@ -418,6 +387,37 @@ static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
 	complete(&i2c->complete);
 }
 
+static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
+{
+	unsigned long time_left;
+	struct i2c_msg *msg;
+
+	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
+		msg = &i2c->msgs[i2c->msg_idx];
+		i2c->msg_buf = msg->buf;
+		i2c->unprocessed = msg->len;
+		i2c->status = 0;
+
+		reinit_completion(&i2c->complete);
+
+		spacemit_i2c_start(i2c);
+
+		time_left = wait_for_completion_timeout(&i2c->complete,
+							i2c->adapt.timeout);
+		if (!time_left) {
+			dev_err(i2c->dev, "msg completion timeout\n");
+			spacemit_i2c_conditionally_reset_bus(i2c);
+			spacemit_i2c_reset(i2c);
+			return -ETIMEDOUT;
+		}
+
+		if (i2c->status & SPACEMIT_SR_ERR)
+			return spacemit_i2c_handle_err(i2c);
+	}
+
+	return 0;
+}
+
 static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
 {
 	struct spacemit_i2c_dev *i2c = devid;

-- 
2.53.0

