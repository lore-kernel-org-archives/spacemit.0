Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9319A2DA742
	for <spacemit@lists.linux.dev>; Fri, 19 Dec 2025 07:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766130167; cv=none; b=ogQvsz2xJiDNzdJwt1Up1T0cErD3IS0tU0cyEW897A38h34GcZV3fKW6gRANQj8SrUEE4fFClEl2rQ9+EEnnzvIDmfUm6Y5eNOc6q8NuwH8Wu815RshoikgTcj14hqiYgznzkX0uY+ahU7r/xpl7+PeCa49ZjVOMwvOaXP322NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766130167; c=relaxed/simple;
	bh=Ynzt5v58obwnhda42H/gajIJVLz4GWJg6Tg2WmflUX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cifB9KKJ7AmRdA1zV1dHX+q8ti5q9tQx6Hd6e/QMgf4m2KN0dLkEnfRn2MFDCvVwFAaKSwVc8beQUTENXsZlj6PPxOgUUoflV37N2lPFslIyITGhNRPCEWcJnPSG6BwtZ6CRP9kAYcfLFpzM0lplE/I+lGWg5yzG+f9RiBcg2kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ogsy4Lcx; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ogsy4Lcx"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so1814599b3a.1
        for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 23:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766130165; x=1766734965; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gskLEpYvfTmHkZ8CaNqOvSk3HkUojmzZhMB2CXBxgs=;
        b=Ogsy4LcxOCuWeOpupa+jkYXveXJTHGyGSns5qCGf7fa3/Nfgum92eia/CJDlwHkNDz
         OP+zHpz1oqxI8+eHcRSbCVYf5t5hVAkzC90nKQhl8ooA7lJGlCkokFzYhY8IJEGar2Wf
         bK5odUNLd2+A49+H8TmJA9DoNCzy3Z/ivaIdcb98R35qG40LSW4yo+1VUz11ZKY/3heT
         gM6udxsSoOoemuHAVFaHpmGA4zU5TVWhxnkv7sIF0jHxaQe4gtsfgleTxwWuVDtyEqaI
         FbQTicTZXyehncPrv3vHiGTDHf7o2HFnvdyDtlkm4VMDl/QJATXMffhMmb9X2bIFB/ea
         9DlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130165; x=1766734965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7gskLEpYvfTmHkZ8CaNqOvSk3HkUojmzZhMB2CXBxgs=;
        b=TXT+C2HfzfRhSfiSqlSaZu+neDxvEpPzqYGhKKMrqifYbMVXBsIVDLm2z2VJtJLT9x
         s/FL+S5XS0p2HSyA6gCF3N6UOLMBnJrwKPzCGtudq8k/CEN2L3A6cOnECFDANuI5nX8Q
         y3HOXbQwutZDV8JmK0xrNNEMdq0EYbus8RvVuckY9VkXyWfbmkQHWjqo6oKV5wykSshc
         su1WwNLs34y+9q/8JsFrLN+HVIaypYVOYUWU3itaj8HIHylciwPt8NZOKOrU15zfCfF6
         WmbNOjhIGCcDOMk67b2qDAgo9uxg+IiXOk+5t7A7Et+fzMNriNOjQpOBYXelBGD3au8o
         Afdg==
X-Forwarded-Encrypted: i=1; AJvYcCVs+qnaX78Yz77cApmgNmY2ehdNM2H+5ULlXaKKkSx3X2y6Co2EzF9RMT7mzRaYL0xmE4tq0OmcxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwtA8Wjf0y1oEmO3eox3Ey1qy9rVrft5IlkOWCOEyuB8dnx4MZW
	1NIUlCJgkgSFYhwSISPuof8ngycYRLwzSW4A39LxhSdXnxeK9tVNHbms
X-Gm-Gg: AY/fxX40ou6LVa559Yl4wL6uaqjR3nORMwsxVsKOHgwaPRu9IlUXaq2rt3qGBpIGNKg
	C1Cn1XvSZmCqhTDlzrDKT7QbL3nh/qOKG+veBwaSP4ocO1Mx6Zg4kJcFUHYAuto0wGKl/pdj+ME
	olvzRb8sklJ2NxVKJ4dePPLQ75SXFRRtahRH5cWQ+7zw7uCmoIoIXvXS0ybYoBv/RHIw62qdVTP
	fpX7ZP9o9NWO+9s+x7pcxEz6nLBRkUq0zLydivGg84NUN8zWLOif5fTtR8RsBHkIXpOkW5DxtoC
	pJtvxA3vBZFN2cTWEfE/BxI/2ovY78arkESpn2/oEBn1HOl846k8S1+wcAya68pD1ddwdEKFuo9
	CbwROv9f/5S26GqdLlU86MS0iBRa7n0pKaCwF1yYYfMYVgySyz8Di
X-Google-Smtp-Source: AGHT+IH8um1u+/F9IR4mQclrwTJCUs1YBwb7PhDmU+FSfhTQhTdwaDaF9aezKXIjOn8tGRCOsfD+xw==
X-Received: by 2002:a05:6a00:1d27:b0:7e8:450c:61c1 with SMTP id d2e1a72fcca58-7ff66679547mr1708853b3a.49.1766130164675;
        Thu, 18 Dec 2025 23:42:44 -0800 (PST)
Received: from localhost ([221.192.179.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b4234e2sm1512802b3a.27.2025.12.18.23.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:42:44 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Fri, 19 Dec 2025 15:42:21 +0800
Subject: [PATCH v2 2/3] i2c: k1: add reset support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
In-Reply-To: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, 
 Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766130147; l=1515;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=Ynzt5v58obwnhda42H/gajIJVLz4GWJg6Tg2WmflUX4=;
 b=qMfQlZSVzRGvXZdg3oEioN5Cn5Xm2J1x59daHMj1raOdC0lTKCnZqnLoQeM/xYyg7eq3aQSEi
 yhbHPR9x9ooAJ1+wCoS5U5WsMyorqPVeBT+RjAIOxX0vOoHqgDQp5hl
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

The K1 I2C controller provides a reset line that needs to be deasserted
before the controller can be accessed.

Add reset support to the driver to ensure the controller starts in the
required state.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 drivers/i2c/busses/i2c-k1.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index d42c03ef5db5..23661c7ddb67 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -10,6 +10,7 @@
  #include <linux/module.h>
  #include <linux/of_address.h>
  #include <linux/platform_device.h>
+ #include <linux/reset.h>
 
 /* spacemit i2c registers */
 #define SPACEMIT_ICR		 0x0		/* Control register */
@@ -534,6 +535,7 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *of_node = pdev->dev.of_node;
 	struct spacemit_i2c_dev *i2c;
+	struct reset_control *rst;
 	int ret;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
@@ -578,6 +580,11 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
 
+	rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst),
+				     "failed to acquire deasserted reset\n");
+
 	spacemit_i2c_reset(i2c);
 
 	i2c_set_adapdata(&i2c->adapt, i2c);

-- 
2.25.1

