Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A66357A31
	for <spacemit@lists.linux.dev>; Wed, 19 Nov 2025 11:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763553211; cv=none; b=Kk+KP1FLqEyxdtbDZ7Y2OwKH6n5DLyJz8sjTpFiVmuQZDYLWBXRlh785o7UAv9wGMLYh4eEiAOXrmXCRTsjtMohpH79zQoLmCa575RzRqvPc7UyDbQV4UKq3aY/V7epLoEeG5CZpezxr/bMT504BXhbo+RAsg8HltU6toli6ghA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763553211; c=relaxed/simple;
	bh=wTE8n3djZOFBW0Hn/pyVrrtw+swJ6pskokEvgXPqj2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lJ3I5RKbBG8w6p7nQ3xQ+TFpIesNJi2BXkAoERQmLQuTgFGSIYOZBy0N3ldJQoSi0gSzxF33x3yaiwMFphxahF1RdPOP9zDEdoFmjOz/VgcmmvoJmG0DOd34FwBeqMDxmOUXjCOcNQ2XE21aDDWfiqpP9T1zKuj7HWRoOwTiwT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnqcbiV3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnqcbiV3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-298144fb9bcso69928195ad.0
        for <spacemit@lists.linux.dev>; Wed, 19 Nov 2025 03:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763553209; x=1764158009; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkVhmhWJH2xsEzSbcMaRRrW6ia9B2Vv7NsUx82PuIzs=;
        b=FnqcbiV3phJ/G1OF8iYJud+zzozpH9SnW6d4otKVOOV9lVIH7ep+6Oufj4uZjEYknx
         HkadWM3WS0rXP8uB3EGgCgjPW7NuqQa4ZmAGNbngYoNx0s7nv8Qxb6tZ6s9chsjle6xE
         xKLt/Ts7JD7Wx6oqvHtKBly4Pgy/WEVct4qm0pmm4XctVJ/ZZtoYwzxPqmiVafHekqUI
         E2VqR6YRwO+B8bRT9Z+fzoW5Hqp7JFQ3mlCb9n1xv1iZcTWYzt4j7KTuTcVO70zS3yIA
         YH39AjO6gsxWjohXK0Ut/wyIsS63T3X7F0sl9F4QqobuTz8irJsCgT/ENwpJzLoPblTn
         fJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553209; x=1764158009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QkVhmhWJH2xsEzSbcMaRRrW6ia9B2Vv7NsUx82PuIzs=;
        b=IBYufg5LgSsH83zvvmLWfUXri8FnPOPnMtlHfnOHyhoqL2vXtW5QYiyNLTYwiHEec1
         YzElRSvNoTcXtQ77ly0I/6NeaHFZkSfQW0/BmIXa20yGnPN3qyX7C832M2UHPBnvEK8o
         3d0Bofy3xTEkU7QAIVJiWR/5dvpYfP7H3/StI9sXz7AGU92ojaGBEUT1CwNGTaMEaVma
         E2SAybT7o4jfG2ixB/J7fcjD1fXOhlBYnKR+BRuvK/lw56VV0PjTsZOxny41+qlVxZmC
         q7iB5uHWz56L3PfJT3S7G2oBy2o7tczoc/6wjRg4A6DPdPz3suEk8FonJQhHgOQU5nGZ
         fAtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3kYG0OqGlgFgsfJGsw4qcwvySozXKobxtHiXKnsJqPn5RFor6UQljqjnLW2MKwN7R8aXCm25mxg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi9y2sS2d8VLz8BJ/pZo5c0etBJ4se15LfpCpPTwXH+S+HUmwK
	oWtNF1neCahlnRW+IeM78YhWFGpiHIfyAEFt4FuoIqpmgyGfW7xbY5T9
X-Gm-Gg: ASbGncvi6/ko4OAZL43/a7a9Ob4GAEKkm6G0aTmvu+N2nZDA67sMkGh5KtMOumrhBcB
	6Soqxq1kmCsRwrsUBqJb2g6kEvnjBP7Ra0qx0PBLtWikl1Ekqj9x0nGksb2IBxBKDRkX8XsE0//
	vAyj3zvrMCsNZZV+K+fao0eA7A1CSukqoLh0NEuSWR1AlpxsuO26E2VPegV7lLMAHaxnbnFzXCT
	pjxbJJx6BCF12/+FOcrcIZqUZPY6+YWMfUljIokAIxy7+0lrd1VdcMS5BLPaVgW/KEyzGuPl0bZ
	eKYBPd8RTQP3aO5PDPel4sEzoyeZx8FwzkKkD8X5da43Md0UISg4qENKjugBOfM46rjt4R2euG8
	IS+w84zD7HJrxNUzF65xciLRSLytVT6qH5UERDSDIjMfwOcVUvWeccj+80q4B5yy/UoemB3ZwIs
	/JgtMwVJI=
X-Google-Smtp-Source: AGHT+IGL6W4IRdUG3Pykh/ul7KcrmSUrOtfZbl9NcCQYrIiiCus1KZ/lienOW5Q0rnK8Jh29js+QlQ==
X-Received: by 2002:a17:902:e788:b0:295:ac70:10c4 with SMTP id d9443c01a7336-2986a74b0ecmr232959175ad.47.1763553209081;
        Wed, 19 Nov 2025 03:53:29 -0800 (PST)
Received: from localhost ([2408:8410:7820:651c:873:1d7e:7195:d122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf158sm206818055ad.91.2025.11.19.03.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:53:28 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Wed, 19 Nov 2025 19:46:44 +0800
Subject: [PATCH 2/3] i2c: k1: add reset support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-i2c-k1_reset-support-v1-2-0e9e82bf9b65@gmail.com>
References: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
In-Reply-To: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763553189; l=1326;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=wTE8n3djZOFBW0Hn/pyVrrtw+swJ6pskokEvgXPqj2g=;
 b=5RS6cTQPwPDN1vYMenh1/T6oCu1CCVSmO2dMgtFDaHcqcKQ5jm6tl9fU0b/ialCby2DQo8WcY
 UhTQmN0qij1BbrInMIivwpwRgL5t5RjCVIFFOS2v5J35vm0U4BBgqtw
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

Add reset control handling to the K1 I2C driver.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 drivers/i2c/busses/i2c-k1.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 6b918770e612..64d817d8315d 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -10,6 +10,7 @@
  #include <linux/module.h>
  #include <linux/of_address.h>
  #include <linux/platform_device.h>
+ #include <linux/reset.h>
 
 /* spacemit i2c registers */
 #define SPACEMIT_ICR		 0x0		/* Control register */
@@ -113,6 +114,7 @@ struct spacemit_i2c_dev {
 	void __iomem *base;
 	int irq;
 	u32 clock_freq;
+	struct reset_control *resets;
 
 	struct i2c_msg *msgs;
 	u32 msg_num;
@@ -571,6 +573,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
 
+	i2c->resets = devm_reset_control_get_optional(dev, NULL);
+	if (IS_ERR(i2c->resets))
+		return dev_err_probe(dev, PTR_ERR(i2c->resets),
+				    "failed to get reset\n");
+
+	reset_control_assert(i2c->resets);
+	udelay(2);
+	reset_control_deassert(i2c->resets);
+
 	spacemit_i2c_reset(i2c);
 
 	i2c_set_adapdata(&i2c->adapt, i2c);

-- 
2.25.1

