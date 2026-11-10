Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794291290;
	b=gXRX4uBN6x29t8MV+xK5LM5AdTBjj39PwG0ms65GOTpqzdFkkfp3fMx395gbhlWt7S1E
	 aP8qNRwBsIA/nf2JGCfQvjOfIvAg0Z9GVVtsGRfuJIiqzJ9IQcr8HlfuRvHnZvIHNzVCy
	 0/+TjY1eZVXJrPlSqtGu2Q49zbtwqCKe1AFgpkQFt+j6dby3rNvAHvKVJ4jARGFzT2lEN
	 PEKxAf0OYepxLzP3BeHYPwnmFvnQjY0XzlY6iZrYQJmjpbFdsTQBpJuivuUX5WfQQyTdb
	 aqnpO29ZASthAOwGrRABScTXc08Nyp2EDEyt4HamB8hUjqtl083OugIFY9dPaE2AD7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Hmsn5rju1QEih4whYeeXauh44x6sfy0wW0ureLZw7mY=;
	b=0BNsRurMN7IgcAixSoK2J3ajhwCwWXFb58qmTO7+dngL00BKlo/7GnpmK5RjCgfZmSaa
	 nYz2j+KrUH9UFOK4I836qe4MbmQDFwIofJq2YxrBYxh3WC0k5fJB9anfUVZOhaNHqZnU1
	 cHNaZiixV4VDim07KqJhrSFXgEnkvBWlRL7YPCKcTSwTXwRpT1jXAHC1ht2DouoCCaC2Y
	 kK41YbmU0mzg4IhGGmrJEnbtgK9KGGZidmMcc0WWiUirLakcQE8Ifwf3Vmaw8BZ9lP+YU
	 T3rSQSmtXSbcHP6NfBV66jOKGuhQ1qjy548T7DXWomMQA1IBJChld1zHVv4FGRnCrJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wg9WMjXY;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78282606A321
	for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 06:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78282606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wg9WMjXY
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36ff9c9da34so2851333eec.1
        for <spacemit@lists.linux.dev>; Mon, 09 Nov 2026 22:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794291290; x=1794896090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hmsn5rju1QEih4whYeeXauh44x6sfy0wW0ureLZw7mY=;
        b=Wg9WMjXYBubvLaqfFUyZhuoVvGkj9Y0SZH//uPWaOfS7RIo07xd1txSOj62D7l+0t+
         lzcMSj1KTaW/8af995cGH0B2GmNzlBwYrjOYuwSi8KQMZyjY/qRS7zXThbxR0V8SiYEb
         Tx2erFf0tbns6/qK2S2XJFgmiXO0LeXK53e7GwNadToczWMnssPiNhbl6NbfnQgdKxbL
         z5pHqFZJDrHHEP4iZL2aTNaVXF8xL6bAmNAqiC7vbEjoiSOCEOLNtp6e5Ep1L7gAt1LK
         oi+mcocfD1G49CzWluEZN2sPIqszUkNjQKBtF8oxeeRgwi33EqSHa+Rph/qYL5NBM2NN
         VOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794291290; x=1794896090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hmsn5rju1QEih4whYeeXauh44x6sfy0wW0ureLZw7mY=;
        b=NdpaOUX668eaWbgcGO27mecUWI/Xe6XgF9xrJ/VpEVEFd8jYW8+ys0J2pAG7I6j3GI
         SUAzVaDxRt5nLnYDvGfvX68vAskmnHWOZtiYHZdbZJnfaMF3eo9opMcXgyN/6p96B3PH
         2ScGj5AqNhuKfaaYs5dDJhoUlVErZ5n21dwvjIZS7WdQZHLzCwqz0VRUz1Mo4j53GNLC
         ilc9Khq5S5HTx7zES5/bHEDOK/JOAzU6wqKj6eMfJq4uVjvzuMmaadkojM88+I+N0/pV
         woaAJ1CD0Di26ivtByaTsQT0mB80/vL08cIjKOUCLyL1jrcaxGw12abBwwC55dhHC4Bh
         om+A==
X-Forwarded-Encrypted: i=1; AL+hErHCPVknKXCVMjE4pTEb2t6xRVUN8MMtVw2/urk6gkgH3qZuf1mlqKbh2KnXTDIaaR6a1uFwP0Wuuw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+WUAK2X9y5toe5rCbLVQN6ikXjUGb9DFRLiV9Jta74EzcvymYG
	SsfnrJYrV3s6AtgrlBaeaaOCDlxicSWKESL6ScIIbxei1ZbggdMY1TPY
X-Gm-Gg: AYBFou09uBdqPnNtZvGYNlH99AcIGRYcv0X/cnASrzkkjjwWyRGSo66nzLOOMl7vY9R
	3j7RBKIgAO0U1cjkT4nrl4DCQcS7euDiprh3P8/lWA7d+zaXz3r594gqRoulnhtT/6lo11toTyv
	rbnD0yi6zOZyb4LMgY0d5oVUjKeaw9j6iQSPa0AhGKtaGsRi6ZYR4t9/XXS4m+WVkWPmWI/n7ri
	DOC3kNxz9+oC9f7CmBLTKEYI0ioqotm0+CnVQVjpmey2wLfqCNe9x0H2Gqu52EQLS6kON/fJRiO
	n8D4xvK+jDge/UBhOSxxs8jrAAs2gL6JNAcMR5cH8Pu3xwKpyOd8gvwYcvLNEujL8okM4+GV+Uu
	rYRoLQGX6TyfGw917BGB49hNjIAjUbDJnfSueDnxnNzO9fMRQLKiLAuniQlPQdFKDm4AwA7aNPF
	Y5dljQsTgoh14YvSCa4HxfYx2Hkw2fAYmfsD9ctQPW331As1fX5cPRPOB8Ei9VL4K03MHZruKGP
	WWLlwp/Xn+QwrDMnnSbjSBg8sOX0TN262r8uhPzsuXpBvphtHxA2/oxXA2bREOVi3zcGkw1dmle
	wgRZi3hKdwCZ6KVUDTicrY7rJh9TaLPE
X-Received: by 2002:a05:693c:6007:b0:36c:da71:37e0 with SMTP id 5a478bee46e88-3751c6350e1mr2197912eec.2.1794291289618;
        Mon, 09 Nov 2026 22:14:49 -0800 (PST)
Received: from archl-rock5b ([45.112.0.182])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c863csm3802316eec.28.2026.11.09.22.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:14:48 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 2/2] power: reset: spacemit-p1: Use atomic I2C transfers for power-off and restart
Date: Tue, 10 Nov 2026 11:44:27 +0530
Message-ID: <20261110061429.2036-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110061429.2036-1-linux.amoon@gmail.com>
References: <20261110061429.2036-1-linux.amoon@gmail.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT P1 power-off and restart handlers use regmap_set_bits()
to access the PMIC. However, these handlers run in an atomic notifier
context (specifically within an rcu_read_lock() critical section), while
the I2C-backed regmap uses a sleepable mutex.

This triggers a "WARNING: suspicious RCU usage" warning due to an illegal
context switch in the RCU read-side critical section during shutdown on the
Banana Pi BPI-F3:

[  563.803475] WARNING: suspicious RCU usage
[  563.807813] 7.3.1-ARCH-RISC-V #1 Not tainted
[  563.816614] ./include/linux/rcupdate.h:387 Illegal context switch in RCU read-side critical section!
...
[  563.841445] locks held by shutdown/1: 2, last CPU#0:
[  563.846694]  #0: ffffffff8404fb20 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot+0x230/0x29e
[  563.856806]  #1: ffffffff84167860 (rcu_read_lock){....}-{1:3}, at: atomic_notifier_call_chain+0x4a/0x1c2

Replace the regmap operations with atomic I2C transfers to avoid sleeping
in an atomic context. Preserve unrelated register bits through
read-modify-write operations and check for atomic I2C support before
registering the handlers.

Obtain the I2C client from the parent device and verify that the adapter
supports atomic transfers before registering the handlers.

Tested on the Banana Pi BPI-F3 (SpacemiT K1).

Assisted-by: LLM
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Fixes: 28124cc0fb8c ("driver: reset: spacemit-p1: add driver for poweroff/reboot")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/power/reset/spacemit-p1-reboot.c | 86 ++++++++++++++++++++----
 1 file changed, 74 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/spacemit-p1-reboot.c b/drivers/power/reset/spacemit-p1-reboot.c
index c0454b547718..8fcb3eadddf3 100644
--- a/drivers/power/reset/spacemit-p1-reboot.c
+++ b/drivers/power/reset/spacemit-p1-reboot.c
@@ -4,8 +4,9 @@
  */
 
 #include <linux/bits.h>
+#include <linux/errno.h>
+#include <linux/i2c.h>
 #include <linux/platform_device.h>
-#include <linux/regmap.h>
 #include <linux/reboot.h>
 
 /* Power Control Register 2 */
@@ -13,13 +14,68 @@
 #define PWR_CTRL2_SHUTDOWN	BIT(2)	/* Shutdown request */
 #define PWR_CTRL2_RST		BIT(1)	/* Reset request */
 
+static int spacemit_p1_read_atomic(struct i2c_client *client,
+				   u8 reg, u8 *val)
+{
+	struct i2c_msg msgs[] = {
+		{
+			.addr = client->addr,
+			.flags = client->flags & I2C_M_TEN,
+			.len = 1,
+			.buf = &reg,
+		},
+		{
+			.addr = client->addr,
+			.flags = (client->flags & I2C_M_TEN) | I2C_M_RD,
+			.len = 1,
+			.buf = val,
+		},
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+
+	return ret == ARRAY_SIZE(msgs) ? 0 : ret < 0 ? ret : -EIO;
+}
+
+static int spacemit_p1_write_atomic(struct i2c_client *client,
+				    u8 reg, u8 val)
+{
+	u8 buf[] = { reg, val };
+	struct i2c_msg msg = {
+		.addr = client->addr,
+		.flags = client->flags & I2C_M_TEN,
+		.len = sizeof(buf),
+		.buf = buf,
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+
+	return ret == 1 ? 0 : ret < 0 ? ret : -EIO;
+}
+
+static int spacemit_p1_update_bits_atomic(struct i2c_client *client,
+					  u8 reg, u8 mask)
+{
+	u8 val;
+	int ret;
+
+	ret = spacemit_p1_read_atomic(client, reg, &val);
+	if (ret)
+		return ret;
+
+	return spacemit_p1_write_atomic(client, reg, val | mask);
+}
+
 static int spacemit_p1_pwroff_handler(struct sys_off_data *data)
 {
-	struct regmap *regmap = data->cb_data;
+	struct i2c_client *client = data->cb_data;
 	int ret;
 
 	/* Put the PMIC into shutdown state */
-	ret = regmap_set_bits(regmap, PWR_CTRL2, PWR_CTRL2_SHUTDOWN);
+	ret = spacemit_p1_update_bits_atomic(client, PWR_CTRL2,
+					     PWR_CTRL2_SHUTDOWN);
 	if (ret) {
 		dev_err(data->dev, "shutdown failed: %d\n", ret);
 		return notifier_from_errno(ret);
@@ -30,11 +86,12 @@ static int spacemit_p1_pwroff_handler(struct sys_off_data *data)
 
 static int spacemit_p1_restart_handler(struct sys_off_data *data)
 {
-	struct regmap *regmap = data->cb_data;
+	struct i2c_client *client = data->cb_data;
 	int ret;
 
 	/* Put the PMIC into reset state */
-	ret = regmap_set_bits(regmap, PWR_CTRL2, PWR_CTRL2_RST);
+	ret = spacemit_p1_update_bits_atomic(client, PWR_CTRL2,
+					     PWR_CTRL2_RST);
 	if (ret) {
 		dev_err(data->dev, "restart failed: %d\n", ret);
 		return notifier_from_errno(ret);
@@ -46,21 +103,26 @@ static int spacemit_p1_restart_handler(struct sys_off_data *data)
 static int spacemit_p1_reboot_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct regmap *regmap;
+	struct i2c_client *client;
 	int ret;
 
-	regmap = dev_get_regmap(dev->parent, NULL);
-	if (!regmap)
-		return -ENODEV;
+	client = i2c_verify_client(dev->parent);
+	if (!client)
+		return dev_err_probe(dev, -ENODEV,
+				     "Failed to find parent I2C client\n");
+
+	if (!client->adapter->algo->xfer_atomic)
+		return dev_err_probe(dev, -EOPNOTSUPP,
+				     "Atomic I2C transfers not supported\n");
 
-	ret = devm_register_power_off_handler(dev, &spacemit_p1_pwroff_handler,
-					      regmap);
+	ret = devm_register_power_off_handler(dev, spacemit_p1_pwroff_handler,
+					      client);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed to register power off handler\n");
 
 	ret = devm_register_restart_handler(dev, spacemit_p1_restart_handler,
-					    regmap);
+					    client);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed to register restart handler\n");
-- 
2.56.0

