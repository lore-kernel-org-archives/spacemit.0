Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998988;
	b=0L4uKCvrN3L7je2HqKctycr/9re162WzAHKM6Pb+PJSHuJoCJjV8SGNH1KjojYDKm76F
	 V19mz7XDT+EsAAWdZmnQgbz9gVs3ylyDTfjjaa20PQzm0PJBEAj9GBYWrJoBlp7QWsPGc
	 QmMVzIuxIpPVLV+odYNjFNPRo9m5PWd9HnGxX9r4/bOrXGdwKIB3tdSR5ZkKWx5H1LaOA
	 y7Jv8n4wQ5AzqOm0U7WQJGnvkHup2+dD6xNYHPJz0mROwpobtigUsSonL0drQ3B5z8gzT
	 EcpQZM9Wu1SJhVmF0/iJkja9sEwH3SUAYR7Ks1dF4xRYzMROKIZqK6eOHDtfJi742Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LIcWmceFZYgQietyQnWOcEmUtfnOG0g7rm/baVCxi6w=;
	b=lDr5bgXif8AUPVMu7uC/PkMh50l+V9YdWXGKKYRSQ4web6+cYKulbEuDGo1UHzuMR3LZ
	 qRASHJaMYEA7XHuctZ4abpOxQWW8ueDUboy7D5RYPcBsLe4/NKZcUvqzmvWeqSjHhRh6I
	 KREsvrAOzv0n/6e1FskYak2RqbzpY1+eteBfAD25rLM+rbasNXk8oCyzajnPWt1Dd7fRh
	 5EOjKLpMmyBDrpCJrJsAKz3sutVSzHYCopIIQMq2CBcVyxTtv4LmJu0Suo5fnKYCaQb1r
	 nLGri9TjJSf93njEeKaQuu07jzhS8JmjphHTelD5MLcQiO1glseYYIXF0oAeouK3D9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F7uA2SHY;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6C7606A33E
	for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 10:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A6C7606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F7uA2SHY
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-381d542bc29so1610268eec.1
        for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 02:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998987; x=1795603787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LIcWmceFZYgQietyQnWOcEmUtfnOG0g7rm/baVCxi6w=;
        b=F7uA2SHYWTnMQM/c2RxVbHhDUxWlH4KHbanjnazncYU8i3tb7ieEQIrooNCCjT6n4X
         DyhSMSOKiyxsWe16w6XvrBfovo29jL3i3yuY84sLb8gSYDGuEulkh45JEs9Pg+pS1QbZ
         X2b6c7yakjQoUR4tCOIcixCnQnTswc3QJHLT9sLcodcYsllpZ5OudNnixdp9gAbN6uT1
         nuamq2JGN8usp34Ni2eXEqluXrY4fzfdbEe1NSgX4KzTYJTtp1mL+insFw+qmQisIFgF
         RSVpjgFrzfU82LxGQ8UXkz41wjcwLPqq7eJfPQNHLIJWyAMiIy7i5utKfN6YIGYrF5kG
         oogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998987; x=1795603787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIcWmceFZYgQietyQnWOcEmUtfnOG0g7rm/baVCxi6w=;
        b=mgV3t93q3MYZAZIMauA//hdMctSqCnivyqB+eI2vTKOaUhhdaWGzEv90/jumdfIAYW
         DVJEJmjVSaODBNiVWH0b+iv6AqxVVlF4STCnzeKxezkrhTeoy90Vb1UUWhD2Qwo5wB56
         QzfbaJ6kJ66Dsa//tDr4rL47MI48P2MiRqPU7L46FCRb9EL8F1t44/7vh/6QPzxwChAI
         LEZPgGgdwiBxWIeNoZl2RNwZxFJM1vqqBFbkOIAVyYXZWhFz5wb7AyxxkOCFsd4wtqLx
         lp0UAVBmvYVAHk1TY0Mgyh4pZNjGb57WYQg43h1ZCqKam+wwvV64r0kNEZe4wwRPJw8T
         aO6g==
X-Forwarded-Encrypted: i=1; AL+hErENP4jvVYBHzno94WQC8URfPAUAkhugRNEfFed952SMv4tOHQRbZ+SMnuQL1cbGZbUAsn0cxnF8Tw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+ntU0BRGHuWxgy0GretNnVHZgDANGr+agQaOSfF9h7TiQYaevk
	heSsx1FbJa8SRNgCdBT1PwdtG+TJ+AZHvIqYMcV7t5cTld2ROU4wi/0r
X-Gm-Gg: AZFdTZcdPnBCacVVTnSVSi87coB9FcSyRW18ENmJt7sez4nPGS1m/zgKv5h/OzWP88I
	BOETCfr5EvCVggqfiYL7Y3CV0lGO/WoYrjYkPdwhJIc+ffXs8r9VEE41WLc+CbgED0Ypkln5FVk
	ThpIY+sN2RiA+XI/Q8ojS49wfkcbXsS6KV01OHWl1iOfvvPXkVLiFeFR6Bzj+qS2fdPe+M0M64e
	ekU1yfDx7RmdAFVG4mst2ApxaQl/tzo2gbZ+wobnMeDkioOjhMFb5QL1X9InNiWo+CQaz0P4Br2
	9OBBRcQono2q53AL3g83NM8R1QhSZT10UIr7zN9YxogQR284zoDHb4YyMQiOv+6SHMGUjlVP2jn
	ExCSketoayd1z7A3txBs51NZY9PBA3wQ5Hax7DmEoEZ8170Ez6/gx1uy49Q+WrYj0WrgkotFtF8
	HTZ4Kiymzy7/Gq1kOvKEGsyF53p6XWWrBZRKeOkHt1WQ4HFWTJJbrHVODifwZ4+rsbBiWgCXEy4
	3iPmbik13K56adieO6LQ7qyt49KA9v8U7ZblXtOLL1BHT5qZGpMWvT4EbvpHoMx5mEKkmD/EhS+
	hFQsx4q9l34u7BGCrWSDDJLrj33eySf6
X-Received: by 2002:a05:7301:fc13:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-38280377e84mr2164257eec.16.1794998986480;
        Wed, 18 Nov 2026 02:49:46 -0800 (PST)
Received: from archl-rock5b ([45.112.0.182])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45260a8sm11729913eec.3.2026.11.18.02.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:49:45 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH v2 1/3] i2c: spacemit: Avoid sleeping during bus reset in atomic context
Date: Wed, 18 Nov 2026 16:19:13 +0530
Message-ID: <20261118104935.1716-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The spacemit_i2c_conditionally_reset_bus() function uses usleep_range()
to wait after triggering a bus reset request. However, this function can
be invoked during atomic I2C transfers (such as power-off or restart
handlers running in atomic notifier chains), where sleeping is illegal.

Replace the sleep operation with the driver's internal helper,
spacemit_i2c_delay(), which conditionally uses udelay() when running in
an atomic context, avoiding "scheduling while atomic" bugs.

Fixes: 5dd75dac1b35 ("i2c: spacemit: introduce pio for k1")
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Alex Elder <elder@riscstar.com>
Reviewed-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v1: https://lore.kernel.org/all/20261110061429.2036-1-linux.amoon@gmail.com/
	collected all te reviewed-by
---
 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index ff32876e24d3..f4b21d7efaaf 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -332,7 +332,7 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
 		writel(FIELD_PREP(SPACEMIT_RCR_FIELD_RST_CYC, 1),
 		       i2c->base + SPACEMIT_IRCR);
 		writel(SPACEMIT_CR_RSTREQ, i2c->base + SPACEMIT_ICR);
-		usleep_range(20, 30);
+		spacemit_i2c_delay(i2c, 20);
 	}
 
 	/* check sda again here */

base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
-- 
2.56.0

