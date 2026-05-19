Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E9C392819
	for <spacemit@lists.linux.dev>; Tue, 19 May 2026 06:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171435; cv=none; b=GuJnBHhDbcM68YtQ4WfZzXxjnt77WblDXltrUky/H0731dLYbcJES2zYC8/qtqS1Cls/VlcrOOs27oUyK1Zba9OHF5imasLP/9+tYROejeDRw2PkGHUIGxDcATcbHUaG6syZe7D7S2TE0iY5G6OFb6VV1HFygaEDk01RQLdhbJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171435; c=relaxed/simple;
	bh=QQ5srJ1k52NpjI+Q3HaLSa9pVnjXdE8OZht6hpCEbfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nPP2qXKsy9SiwJOb44rqxxaCxydafOjTnOSJYPNoPnlRYlQCKtck1tOYcxZqMKsyadliINGtIzQTVEq5gTRVPJkFph8GR/fGxE10SbHhVEE4rWaBcHA0ncZKtLIMQE7AChWFwXd9SGAEKjB+2zU/+7UB0AGaEcXctlrEhSheymk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrGSMdzv; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrGSMdzv"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso2651958b3a.2
        for <spacemit@lists.linux.dev>; Mon, 18 May 2026 23:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779171433; x=1779776233; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0chwJesI0BcvhVwn8jIR2v8RSVOpIFD5ULcDL4OMxNA=;
        b=ZrGSMdzvZW0iJ3vIP1Yv0nxid4o7utR8EHXyMaPF9xYlJPB2sY4LGP+klNnambmCCZ
         JAOhr37tBerc8cYaTpL4S1zdbECE3D29R/yWslJUmprjnvB1AA2PFwpRb1kgIBe4e6cn
         +T8sx7tuylhfXmBT8V7sGP0u5xKH9KMmfJr6TyIiGE0/CZQXmdUnkVJhADINw/nIo2AZ
         jgJ/Ippi+zErVi/9vW5DkjwpkiXqLmnARq6xtQTn4YmS3sCHnDg5Xt+/g7vgjLgCFQLR
         4mSkLkTX17kGYJDlAtgZXfHZujeO1pskld6RcL6u/Li3y34vlEICiNLLLWq7S86haL2a
         FQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779171433; x=1779776233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0chwJesI0BcvhVwn8jIR2v8RSVOpIFD5ULcDL4OMxNA=;
        b=fAOgvBJUnDzdLJnlbcu1Fs5jlVwPhm9v3WLbRwNROUnWrD7lJISf56dRdxGtRd55Yi
         dHgImf+QNss8z0P24IdtvSnHfgfQiNdHxoaDseQFVWDzVKWbT2sTeDOvBOC4O2LLdc4o
         9JaRd4EbeJP4g8J7CkYW2e5Qhf11RjfMBUB71X/PwBUi1w7B+ufCZgukc45fjaH+w2OO
         49ttj4EZve0JCzDoD1HUVZiiHt/r6CqxfZ/8FXneGM2r5GKIyCLsY+ceIJB5GCDKkVZg
         AXOFanthjhsQ8Dh5lzP2ivMZFwO85nZMcUdJ3UbQ90n8N8hIUzfp9u81EvgsYubo6uqu
         OSRw==
X-Forwarded-Encrypted: i=1; AFNElJ+QyvQVN008ElRQVsYldM0kxhym44LGRFHIwpPHwkAgYL4Fu21t4ODxtuO2RYg+CZhm/1HvvyXvng==@lists.linux.dev
X-Gm-Message-State: AOJu0YxF3F+RV2OLFY8G8QE0WG7F1GcLCzQB+Vzc0l7v3Vu66iiJ/bwU
	MO/P3LbzP4vpduLDMEL6UUbEkSPQarI3mZLWKm5bdxKrVJEJ9o6aDDUO
X-Gm-Gg: Acq92OFBdE0Oes6hrLmlcunn2z6xFGOn4hhmxpg9RudkqiirT6hgKe4XEWr9CULCU/W
	2m4qYqMM0Lb/c8N86sR4tI1rPelsTrk3nrh8ELilAnQFdNzWI53/S7RkRvu4eYAud7b4uWB6S2f
	k289tX3Qk90CZeAE1x+WfrQs9qcxIZIVY3/KyhPn+PIN7IoLulcEvNNIVoUoX48xwgMUvgI/cn3
	goyhjio0FcqFwUAR7C38Fl7723rqzSaGLUSODSC1uzMaw4r67XcjT/bey9k1dWNkECp6liM2Abd
	G1jg0eVteMZatDnAohxcnUOEgwHeGNYhXSPAz7rIQSfDuBjCIGq6KHXdnF79qZftaiQnJG+ZUui
	pLBv3WYvta6c1ayW5QXgX2ZYU6gXH1fSpFPCEo1PT1WfSmcUmNAC0Oe1M6dAoaqCF+BLLjQBhVu
	83029P1slm1G5sDexppO4rQIpoftrvAw==
X-Received: by 2002:a05:6a00:1797:b0:835:5aa3:2dab with SMTP id d2e1a72fcca58-83f33c333f4mr18789859b3a.6.1779171433260;
        Mon, 18 May 2026 23:17:13 -0700 (PDT)
Received: from [10.240.146.115] ([2.27.148.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7f202sm16112266b3a.43.2026.05.18.23.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:17:12 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Tue, 19 May 2026 14:15:56 +0800
Subject: [PATCH 2/3] spi: fsl-qspi: add SpacemiT K3 support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-k3-pico-itx-qspi-v1-v1-2-c32afeeaf741@gmail.com>
References: <20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com>
In-Reply-To: <20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com>
To: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Zhengyu He <hezhy472013@gmail.com>, Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=QQ5srJ1k52NpjI+Q3HaLSa9pVnjXdE8OZht6hpCEbfA=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqDABXIRd9mve9a3LQBUJIUGDCj75EfmGr6SWgm
 EgLvgHfmoaJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCagwAVwAKCRDN9pw2gLgN
 2B0UEACbVrBMVl9AKoDlOthIdXOqinDtkvcCtGfWilREm6uKD0VHDaDqUbYqUyyngN2LzVqqsbM
 4fPTAtLTqOVySq3qbYFX3li10q48NOGWn5QFQ5v+JNkNd/Fe2l8mLhiSiKRtYG4M34VtWUBChoL
 L4FVnsJ7mLlU5zChZFZYySvPDRsgheMHCJpL1MUvfnB3Ln3iitWB2cyhV1Ir1LHYUnALTrVSzIU
 X7a/fAWMFmGN3z3Oiow1a11VMmZPFgW3jtrXMavZ3hVCYbUtnpZkwuYRUAReJqNEdFfm4m2WOYe
 +8PnK2BUOn2U7pnF4I8qnlcAqU2h1xxUGSXXywuRLuPigKDnpTAmhYwhtZqkpJTt4UDNkMbt57j
 JwzUhz1F16xy8nm2mHzgB2folx/0lKSpcxEz9VkjmixyFn6WA/SAUzBCQnK84kXdhFuJxavaN0v
 YeIJ9Fms027WtDd8alyE6tnGz5Nue//wz9sXiIcd9dbi/Y3vA6y5gMtXVsQ80hTZ9XkfEcm1n0S
 orR0nudtNEWioux2TH/BmzcDbRE/rxyUAzeC5Y6Be484DxyHtGdNjw1RxFS4WKD4ZJs8PaHivbf
 B0OcC9+Y6MuCpmZjh0N8Cb22uSIcdI9nfNP5iPdRJNBPgeWp0uaweU83FV4ew/fE7d6tYYYY267
 UwbX6qasCIKqbwQ==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959

K3 uses the FSL QSPI controller with the same programming model as the
existing SpacemiT integration, but has its own compatible string.

Add the match entry so DTs using the K3 compatible bind to the driver.

Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
---
 drivers/spi/spi-fsl-qspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 57358851029b..bb94fae32609 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -1015,6 +1015,7 @@ static const struct of_device_id fsl_qspi_dt_ids[] = {
 	{ .compatible = "fsl,ls1021a-qspi", .data = &ls1021a_data, },
 	{ .compatible = "fsl,ls2080a-qspi", .data = &ls2080a_data, },
 	{ .compatible = "spacemit,k1-qspi", .data = &spacemit_k1_data, },
+	{ .compatible = "spacemit,k3-qspi", .data = &spacemit_k1_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);

-- 
2.53.0

