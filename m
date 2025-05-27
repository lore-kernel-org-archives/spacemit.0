Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4423C1E0B66
	for <spacemit@lists.linux.dev>; Tue, 27 May 2025 05:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748325310; cv=none; b=eBPTLMjfLTjdiMyfoSbdHix/vbZm0ZgMbfCJuzzVPedrsGFIcDpXA4lzyP3t+NKZXLWhPFkUfRnmcOj6h81d7ORtiGOZn1Jsd0DJ6sKmwnBdqEcapR1+iKxJHodXxurLlLf32dR53rallOPwiTr+BHbYK8XpeQ/0ZcdRW7FBgfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748325310; c=relaxed/simple;
	bh=kp2Ho/gN90qoPt7EOupJs6drcisxOPFdqCVoJAm4AUk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eTkIJTRvj4AEqrWvAnbw8cAcFGK3oedorzRUQGGdUXiegvlSSRiDytwjvsNpEYqr9HUefW4JVoOTNnoz7OSndvq3cmQkvdUE1pGVq0fWH9YE48AKgGwZrwZO3kdPcQ7J0Yc03HeStRZfwx3zfq9qKNlgi2JVXqpAi1VuhsOTWLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tvuk8kpG; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tvuk8kpG"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6045b95d1feso4517087a12.1
        for <spacemit@lists.linux.dev>; Mon, 26 May 2025 22:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748325305; x=1748930105; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/92qQ8/8bI1foaF/B/6o65zGGONk9qpEUFF2woz+1A=;
        b=tvuk8kpGpeXe+r1itdw9MM0KNGmmnbzCSZRwvCMK3VYDR73VI6LstGCPg+qa9hsVdu
         e2G0SHgD9h/UyMNYUokIoYR4f3WjW8bZkZe2YUX+7iaF47fY7hitb+pTsfqcquW14fz3
         Pf25zjAXxOyhHeHY1RX56xIci93uoWBVIDCBHby39+YNPXSbrMXftltPB3rTX3yXe2rs
         rRAzjR6Tb3xMy2D0e28vnn7H0GZcnwmg6tCIl1r/AELhHmQzmmrr1I8/sE2WJr24LpUR
         +980+Hxs5CEkTk7G4NQUOjMd4ryRJve7Q5j2yh589rzwSBIuiFL4q5RrM4FJWSSZnt+p
         09gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748325305; x=1748930105;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/92qQ8/8bI1foaF/B/6o65zGGONk9qpEUFF2woz+1A=;
        b=a9d770n/wLMl8hZVoiQ8PEZHPIzxUoO2x11/y4BDT/2UBbeyp5EIvx/Na4YTidh0dA
         pyIQpII8eZ5D5KLgZHCEYYv0WqWuqm83TgVi2nmmE2h0O5k5dgfZi140nMBS6YZe32ng
         A5Fsazrd5eKeu0mdTprlstMO6bM9REVY3DmfprpwRn90L7SSY07BziHFhvywnptbhRgJ
         w8jnLSZMpVcGX6ktsttoPEZI08Vc1MSNN93CVErj4ujmmPg6CO62X/Q6qRQSPKnM2Lpc
         jVDXoMWBc8jD3bvsW9vu76EbuPVA3YHYRDonjb9sgz8yc/qyuSR9/N+kRSrp0NzUUqkg
         UWOA==
X-Forwarded-Encrypted: i=1; AJvYcCU0UXKqXEuJHNfFknidGkRRLKe7VJiZvnSAPBiJpE6Wom3qx0/lJaKpfqiT546XTzVz/40f652wWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqdRSsH0mohEZM553+ly7XCPJ+tEQPPK1E5rQzPQI/hBqjoWe/
	WgSS65m1bW5EazhDmepm/6MGWkh4RPWdOp3jeKD+L2km2a3LEHXPXLTj4n4GpiY6z53pL1bGMXM
	7T7yQ
X-Gm-Gg: ASbGncvgELRxHBAMSrVMU628XHD1PxVhgAj9CKusj9fi0PC1bmyRNN4HkZ2MqDJy4KE
	0bFrSDBC55HB8LEIhRiGwVuthVNJp9lTDwNr7cKS9IzVhNvSbeOs/GRUNSxOrsfe4svijW0ztC9
	5N3Et1dtOQXNeaRCLR9zcfWb4+TzyqA6WzaOWcMhvugu1/elXOcTKxSeBzv5U60rduXBoEGxBGU
	OwjaM8/BsfQNWKBhwShQ3FJEwBQJgH1WNoTUo+PP6+z/VtCYKcKnCYXKf+mCyOItxIFs1EpXzQG
	eq0Dr0vNfNwGODxTmN5+XM7dVlNajkJVRbyJ3jjDOQAPqw6tfZNyvptWrJVmocn+N/p/OfKnGwQ
	=
X-Google-Smtp-Source: AGHT+IEv5s7xDmY7xLIqn57Glb7AygAOacFI1nEFLy11fNwi+mIgMvJcQA8W8aLW+zQYLW7VY4hQDA==
X-Received: by 2002:a05:6402:2713:b0:602:1832:c187 with SMTP id 4fb4d7f45d1cf-602d8f5d5camr8978474a12.4.1748325305573;
        Mon, 26 May 2025 22:55:05 -0700 (PDT)
Received: from localhost (hf94.n1.ips.mtn.co.ug. [41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60464875b8csm3393023a12.76.2025.05.26.22.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:55:05 -0700 (PDT)
Date: Tue, 27 May 2025 08:55:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH next] mmc: sdhci-of-k1: Fix error code in probe()
Message-ID: <aDVTtQdXVtRhxOrb@stanley.mountain>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If spacemit_sdhci_get_clocks() fails, then propagate the error code.
Don't return success.

Fixes: e5502d15b0f3 ("mmc: sdhci-of-k1: add support for SpacemiT K1 SoC")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mmc/host/sdhci-of-k1.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 6880d3e9ab62..2e5da7c5834c 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -276,7 +276,8 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 
 	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 
-	if (spacemit_sdhci_get_clocks(dev, pltfm_host))
+	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
+	if (ret)
 		goto err_pltfm;
 
 	ret = sdhci_add_host(host);
-- 
2.47.2

