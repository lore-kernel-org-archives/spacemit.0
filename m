Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D13138B149
	for <spacemit@lists.linux.dev>; Mon, 23 Mar 2026 10:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261173; cv=none; b=SMuHuzeJQr3x2lg5MWKxqV0CFy9Nr+JKoSCxSdM8wn4dTMNr3JCcxA0wlhRtGVP9x78yPE3fW0Fun0XvY+hnFgvvbKUptYfso7kwwW7VwqER8a6ayVoz+Gn25nUA9LYOuyWeZxcxxpXkm6eAf5uzUIvnio3hoiPRVfdakAZWu9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261173; c=relaxed/simple;
	bh=qUA8SRWMHXak4DMGjiU5xSTobYDglxv6lNBrFgz1elQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GB9V2db+iLBFxBXxhJfBtZBQphSTadvmGoo8K7gYxTIOpteXuG4D99z14Zm3+1RJIw6IUFfibSBNC4p6GkQ8JPCatDuCRZ+1/rsnZt8Xq603vaTqvwSXkQ7QlOijorNGtX+FtZk9CvdWZ9gMG95w42VGtzf0Al+nufmvFuAedow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DA0TiNT1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DA0TiNT1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fb14227cso42326695e9.3
        for <spacemit@lists.linux.dev>; Mon, 23 Mar 2026 03:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261171; x=1774865971; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvVWaFSwZuIIuqOAIjURBh3MX19UZqagVH7905iJLbY=;
        b=DA0TiNT1k7FQqMeYF23s8xg5TI6XAZpV1oHMCOK4xRLYBUpoXUq3xOKL3Hq8o/8Jlt
         yh8oEJpOwsZ+YC2Up2Grgu4ucE01QkQnR1pP2kMvQBJitMFGruB+u+YHG35U6WhdbBln
         Dc06MExHiMpZxjLLIhwJ5WsiuBSsTd74RTCpu09xZDrUKqrUL3soSfVkwvRNbbLYN6aW
         ctsq7WqvSCec4iDXqmh3JTAOnETEo4aut5ApMGYbQRO//FwhnQXjiyTigYLPDeLS9ubh
         lLsvuwKkOqwTgbWr21azBbhwx93PIK/i1btZASEKlLDN/mny9M7AGwnNQiFnYBHzHvR1
         uTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261171; x=1774865971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AvVWaFSwZuIIuqOAIjURBh3MX19UZqagVH7905iJLbY=;
        b=YLyxScmJLBmbpMh2sddeNV32IWWlCNnc0Dkfc0bckHAHMFLIoM50hch8MprutD8nDg
         rp/s6krdLY6SMTAekCfQ1sgLo6zxfvB1m59HWMg9kI/ROAZPR7fYLKHfWlvGEUMlLDJs
         xq3HiUd0wjTMRKng/0i41SmGBo/Tf2XlYMjBBYutQvMK/yi/8o39BbMwqMQEPsdn1IHE
         Zlusoz+aMt5XXtX25SJ/cbWeTTqsLRSxwg17msqnw56nufYEUmfAznKaL/1hY7sD/Hxj
         og00LKQtt6w2W4Obst2pUx4lnUfCQ7XUaNj5DiPCvpVoabEd/3FwyjwtHJVfRkxdGJuF
         vC6g==
X-Forwarded-Encrypted: i=1; AJvYcCVCGWcEiL3hi3NJ3+z7VNMGjqe6gVr/VJ2QynqB4sDGxaJG+6tNVMGUHfXGMlH4TDOBcROpbwfIeg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHO1RAz3VT9LLAET4UCuNMH+cjULxmR+4yoUVr3dU4vOw6LoSD
	yarSibo7HFuWpqBcKntl+PXVRHG4SWP8slgQzKQ1RuUzD1TVXW1I+0Qh
X-Gm-Gg: ATEYQzyqY8BKeVK77D2+ukSlWc/SP8x/jD6JZJRrjd+wK/cqX8KGiFo2Aw1nHlKveny
	KU2aUPk5ysopsIC3b2OPqZ/UpBdn9XDkmR8d/vOoQottSJ+YnGI0GXYPOGL2QPe6Hb8aGb0AWGA
	46gLNxB9ZELnjdQqlueS4ri6JodDzH+f0wIRIStWqNiRkudb5skIVqDRdUpDpBBEBW9A38U89cN
	1G8TwGNqz+Er1U0CUte15MDG5weWrK9SbD3zAlaup9zX0emibIuH4s26mhhTHkP0VWLxjbFIpxo
	IuMxevM6VehV3OZ9MZz4RmmoWWJ4WcU/XdjXQOeGvu+GMIUdRMv/bZZCq7BmqYmDbmOYJL9PK4g
	VPxucSXKJlAHdwacqFJ9sIzVjQ2zwXzeVM4DRImCzgswZKUDHYk1nMMBE6K0uXqJWCOa1fgL44E
	d4D2sWAqy6Qnqwh0/gCyvh5r3Bm4ebek3FodvVEMYXtj98iRsdF0G/0t3VfbNz6iVm
X-Received: by 2002:a05:600c:474f:b0:485:3b34:2f62 with SMTP id 5b1f17b1804b1-486feddb659mr165327915e9.14.1774261170709;
        Mon, 23 Mar 2026 03:19:30 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:30 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Mar 2026 11:19:04 +0100
Subject: [PATCH v4 1/8] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-orangepi-sd-card-uhs-v4-1-567c9775fd0e@gmail.com>
References: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2

Ensure SD card pins receive clock signals by enabling pad clock
generation and overriding automatic clock gating. Required for all SD
operation modes.

The SDHC_GEN_PAD_CLK_ON setting in LEGACY_CTRL_REG is safe for both SD
and eMMC operation as both protocols use the same physical MMC interface
pins and require proper clock signal generation at the hardware level
for signal integrity and timing.

Additional SD-specific clock overrides (SDHC_OVRRD_CLK_OEN and
SDHC_FORCE_CLK_ON) are conditionally applied only for SD-only
controllers to handle removable card scenarios.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 455656f9842df90c7a94a290aeec22157b378fc1..0dd06fc19b8574ae1b00f7e5d09b7d4c87d06770 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -21,6 +21,13 @@
 #include "sdhci.h"
 #include "sdhci-pltfm.h"
 
+#define SPACEMIT_SDHC_OP_EXT_REG	0x108
+#define  SDHC_OVRRD_CLK_OEN		BIT(11)
+#define  SDHC_FORCE_CLK_ON		BIT(12)
+
+#define SPACEMIT_SDHC_LEGACY_CTRL_REG	0x10C
+#define  SDHC_GEN_PAD_CLK_ON		BIT(6)
+
 #define SPACEMIT_SDHC_MMC_CTRL_REG	0x114
 #define  SDHC_MISC_INT_EN		BIT(1)
 #define  SDHC_MISC_INT			BIT(2)
@@ -101,6 +108,12 @@ static void spacemit_sdhci_reset(struct sdhci_host *host, u8 mask)
 
 	if (!(host->mmc->caps2 & MMC_CAP2_NO_MMC))
 		spacemit_sdhci_setbits(host, SDHC_MMC_CARD_MODE, SPACEMIT_SDHC_MMC_CTRL_REG);
+
+	spacemit_sdhci_setbits(host, SDHC_GEN_PAD_CLK_ON, SPACEMIT_SDHC_LEGACY_CTRL_REG);
+
+	if (host->mmc->caps2 & MMC_CAP2_NO_MMC)
+		spacemit_sdhci_setbits(host, SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON,
+				       SPACEMIT_SDHC_OP_EXT_REG);
 }
 
 static void spacemit_sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned int timing)

-- 
2.53.0

