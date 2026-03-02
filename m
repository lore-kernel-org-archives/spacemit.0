Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435F9411608
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464436; cv=none; b=AYBJ+Tk+GMDqqHCYMKJM2yFLtheQqRwsGuuSEpp2lOdXhu8zEg5xP2IUJjOa/sxsrYdWNCyGmp1+aX41/LmkoUFZZ1I+LXTredKUIZmkT5bWsv2slnjuA/7YtoJiFgqwail0sYFTINhM5A6+BRLc6YJLbms+JDQnZnFRT5OiM/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464436; c=relaxed/simple;
	bh=SX99H5nWyHLgqEfAA8y8YXcLLBYPw3yIqFfWFk7yuwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r1XnBCm6z/T2hAS5hxjey51Mm+ro91Vl4Y7vz+sm8I4buYjyLXCoVsiMLvVa3Fs8OIk216QFgibl86p1PAIbuJ0WM/m1Jhs2mkJYb3QSq+xpmwRjYuIkwwWWKNKrM7k6Dd9In4SpsULpV0A0VQPy1rZJ9+fCAq6sY3pw2oEiktk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTOtsZ/s; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTOtsZ/s"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so52684125e9.2
        for <spacemit@lists.linux.dev>; Mon, 02 Mar 2026 07:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464434; x=1773069234; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPno2RjoHZxgUnIZr6lB0hz/wV8TjU09ZahXKQxHzqQ=;
        b=CTOtsZ/siLpqrfa1OSB8sbKxsiX4G+I8n5g+OOXZqsiYVHIeoJnR1ng5+bUhUhEI+Z
         5JWHlckvb38icK1UINCW+J9jsnJXe25xWtTIPW/bSC3PguLDf/aygunEiYhc3nhNNN9/
         3ygiVOc7Xw+OeZZnrh40OTYO7sWgEIarWcKoyQzFDKx34E5FfqHJos0rFmTetm4Z+pr+
         A9TOOCXRQjL9dWtupMrNcLG+4VrS5l9pQ9mUFA93tUHDHm8iN6gzCIf/jXAKRN2yT6NZ
         q/Fbmm01UXqCkK2/iRicvbSPALQnLqVbsQygMOb5m5uPlglcLgJbhpMXvxrD8/uhTMCa
         0H1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464434; x=1773069234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xPno2RjoHZxgUnIZr6lB0hz/wV8TjU09ZahXKQxHzqQ=;
        b=Y8tuWMTY/nnBPCXoQ6tR4m+0KWEgX2NHgnozIOWmVmFcwAGz0MhoeDEhu8WLPskfLh
         hNTWzACZ6q5DQ58d3LBoipOuzlH1Xl72f1bIth4KC9Bjb9XAzFki/R/JacQXO+8Res36
         ArxKzaA/U5txSda6SKlJd1AZQ9l4ZEHGHak86ShhArudCzfkX48Caxjg3pQCXOgGkeUG
         CiUlsylT8Apt4JSmmrEQ8n8blti21H4djVyK+8T7L7VZQfRyF36F6I1+MJJt+NWAnDZe
         83Xgx1K3gjsVkomxCu3rWHD1TcEEHWISVQfFny5Lrn82wxdOwMiOwhtOMZCV9xSDxHuE
         W2rA==
X-Forwarded-Encrypted: i=1; AJvYcCVePdjn8cGKNo0CIChM17RDQGg3DweE+AFqDpwQhyjnKJD7ePWaT02EmkJG5GejPYZoRaLyFwcCOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwdY+9+eV9IA1yrj7VWPD603dijmpaJ6hClIfKLnnITeA0mo+Rq
	ajnCwSoy4aBBaoygPUvgHvLtnjB9k4A3OkxTlVq9qk2FmvJ1j5SKhCJB
X-Gm-Gg: ATEYQzybjYvty859CE9NMrBJrGR2/UL1ym6tjIC/5ngvoEZxW5xz/LM3+EFdELB76SF
	FWCCjnDDUlHITUbWr/jxkvKIfAK/t61UES+Lsp9kXL1RT7Zj9NanFnZbEyK3ESCi2TvBioTZRH+
	fljfh/vcksyv2V6LJNQe11Wc9ZqX28xQIaoF4HimVtI8235mvjP/MrEmS7iT3phlP6bbFg5Alrk
	rMhX4ns8QIXYQhvrhKFignanxYIoNxrV1lQT4N5ZGPlAb4aiebz0a5YhHN6dOimEZ9i+4Mo/GiB
	0MG6zBcCk0h1HPjc46/eXVpW9ZHHaDtjuuTzZLloM5zm1bIl45zQBtM32ufv+n6Uc7qCWWE2Nns
	Hr+C0CtFC2brW/g69Nxdamm3/PzpHsqFx0aZVe5gMcDcwFDfOk93Pw42XamL3dePVTzcaVp09GW
	Y2yoluJTaS5LEO0PTHJIVGi9bbsysKrCvTyNh7VO7Zb1G4dT2VhtotT+RgCGrqQJ3JeWn1kI+kn
	sp1
X-Received: by 2002:a05:600c:b86:b0:480:4a90:1b06 with SMTP id 5b1f17b1804b1-483c9c196a5mr205940835e9.34.1772464433577;
        Mon, 02 Mar 2026 07:13:53 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:13:53 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:24 +0100
Subject: [PATCH 03/10] mmc: sdhci-of-k1: add regulator framework support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-orangepi-sd-card-uhs-v1-3-89c219973c0c@gmail.com>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2

Add regulator framework support for voltage switching operations. This
enables proper PMIC control for UHS voltage switching between 3.3V and
1.8V signaling levels.

- Add regulator supply parsing
- Implement voltage switching callback
- Enable mmc regulator framework integration

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index b703b78282ed8d89183c816477c149c0a565618a..c260cb89704ae7a25bec0f07831d495553405bbd 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -216,6 +216,12 @@ static void spacemit_sdhci_pre_hs400_to_hs200(struct mmc_host *mmc)
 			       SPACEMIT_SDHC_PHY_CTRL_REG);
 }
 
+static int spacemit_sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
+						      struct mmc_ios *ios)
+{
+	return sdhci_start_signal_voltage_switch(mmc, ios);
+}
+
 static inline int spacemit_sdhci_get_clocks(struct device *dev,
 					    struct sdhci_pltfm_host *pltfm_host)
 {
@@ -291,6 +297,12 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 
 	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 
+	ret = mmc_regulator_get_supply(host->mmc);
+	if (ret)
+		dev_warn(dev, "Failed to get regulators: %d\n", ret);
+
+	host->mmc_host_ops.start_signal_voltage_switch = spacemit_sdhci_start_signal_voltage_switch;
+
 	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
 	if (ret)
 		goto err_pltfm;

-- 
2.53.0

