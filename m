Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17C742B329
	for <spacemit@lists.linux.dev>; Fri, 17 Jul 2026 14:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299592; cv=none; b=G0/qIWo6RgKSr6MtFR3pjYM5vBNyBpKtPdl//PuUndrSqNR6yjgoo/eXCnVVm/hZbM1yqK2NgF8ivxvWg3+A2gjWuj2Ps7211vwhsVSjMlxDkCJFfwTYNQvu1d8c4G6U/VTI2byDp5ywHCwOIGT5ekCfK1vaMmZ8rm9FV3p/5tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299592; c=relaxed/simple;
	bh=9WewAlWMXqRN9/lmO58HQ6Q1ZD6pMrDL2lu1WfWxo94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WmbTcovBmuGmS+MN26zoLT0yUDKVSd/sPEY59eJwdhXhaCouhfdNVBedv49RU2rjRRDSCvW1MzsnDRpL0NHY6J02u15OO4KcNtZl9qLMVHI3l/1fh4JQYd+ubR0yEMxD0qJ3NEqVC4iLL3EnLwey09tpbQcnmlVouoZ0F9Hf+TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwPm91Ub; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwPm91Ub"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-848d21bbaffso7791475b3a.0
        for <spacemit@lists.linux.dev>; Fri, 17 Jul 2026 07:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784299590; x=1784904390; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+70UsRe6SWCs8p1enxjrZeDqh6U8B/eywJS5RleoOQ=;
        b=jwPm91Ub/8kcPD+TnkzsQHrv29Ez8GakF2e19dMYeVkEzEIURxRpGHWcKwuyGu0F/+
         Lla2/3VZ90uBV51UlZeafwCTOQylM0UMXRkycFGiCjtzJhM/tHSFHLnyiu8nUEe1+IvZ
         dBXos2hg2uthamb7yutKZQUxr5N26hLpxmD1SAiCTTGIXby8guTr84KVjSrfg+3CqHnN
         AP55G3pi/fZlO0pJXgiaAOVPCjZ1PC1qtdH4NRNyvb7hFmAyex9gblsMFBRSITB7xdjj
         FQxW4UKraberlfppx/lhxEXBf6QzVF5+ib87bWcj/wmBr1H503v8pUvHnkrGmpqeZNGF
         oFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299590; x=1784904390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+70UsRe6SWCs8p1enxjrZeDqh6U8B/eywJS5RleoOQ=;
        b=PAqqG4b5gwL2b8aeHtZ0/x9uls8dI1MYf8QyODDGQHeNPq/I5FxPCSIL8OEhmOBayg
         32Wr9gEatEOG5nNnM4tdye40k1aCQzKQ1Etw9yHTRw2Us8MNmrJ9I4RNciTWy/Couj0d
         /F67Jw5FnitjZ1Erb4L74WjpWbQKD07atCOwCVhSL9yM8Q8+PggrImGg06R/DdGK3Srd
         odag+veV8Mneud2VQf0Hx0OeWO3OM9a6cjLSyjRgZ/wWMwS8qZ7Og6RiwBSfJeYKJu/W
         jDoaUh3NIrI5j4zsMnA2M4I/Asxq8WYYEfDZaGPjK3HCgANB5Bw7bQAvyCVlDil2krhW
         JPEQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGYpOXX+KExVu7RMat7B4Kn26EC464hkOeTDxveowABFuYwkkwugzm5luR0KmYnOIAmf8c2gDTbw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxA6TVDJcx0PJ1oLqAfM/PrUUydlysJYCOJ7R8CqyWQSCTTpgHD
	diI0ANQvqgBQAGx0lgSCjGdaZXluz/5jYIaYBNzGOdoHPNiU+WdiE+eI
X-Gm-Gg: AfdE7cnuFtoxuIGMJqNZu8lj1KBD2uMAQwEMfAsJyhWTUfuJqhQKs+C0mjvdOo8Ic20
	VlWkSOv0L/UQ4fGRwbxyl9v06T23/sxEC0hoayzxAmlkXRyE0Zm+mkq1APQxEZfQWOYSOuyPPkb
	V8h7+G5pvvZ2cy4uciy25+0XPGHceHufCPlX7FgP7W0z2nahnxudtYP5T8CySkajPrrOkO9HGCU
	oQBfXgIL2b3qbJlcXW7YpFoQ0720YjbyjnvHjF2U+5qxIrVKbrP0S/vjMxzzj6228LolZkZnOh1
	SG0AFyRo0EUtM6w0OBPdrasAUQBFEK1B1FGik1PWTlOk+//KV8k6pctqXmb1SbK5CY/sbovyyTV
	9LuarYuhy3Hdr7rU+KatLAv4AinmzFe2oNjiDxtxmvxFWsoozLwT0cZ0WfSc9Z8GXhF7dMfIpEJ
	AwkA==
X-Received: by 2002:a05:6a00:420d:b0:837:e9cc:d474 with SMTP id d2e1a72fcca58-84c2923a653mr3262541b3a.2.1784299590120;
        Fri, 17 Jul 2026 07:46:30 -0700 (PDT)
Received: from [127.0.1.1] ([192.220.14.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6d519sm1166408b3a.40.2026.07.17.07.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:29 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Fri, 17 Jul 2026 07:45:25 -0700
Subject: [PATCH 1/4] riscv: dts: spacemit: add K3 PDMA request numbers
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-1-969a1b0f783f@gmail.com>
References: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
In-Reply-To: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Alex Elder <elder@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, Zhengyu He <hezhy472013@gmail.com>, 
 wefu@redhat.com, liyeshan <yeshan.li@spacemit.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3077; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=Bvj9DyzO8CkDeYsF7QvGrDf4qFZaWq59anKSe1ahYuA=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqWkAvRC1PdSak0AmQY19oVbVQd4dwrxvtWN8Wr
 WzfboxWA6CJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCalpALwAKCRDN9pw2gLgN
 2IIJD/9EPUVLcR51uLU+wJn2/P4pQprJeuvmAK6VF3BOBRxoDcVbiIvWKKabDJqEyN6eJReC+AS
 isiQEj98LKPh3dvjeJJ4WAdo1rg2H6MvNHfKKKjIHRgOkZO0MzCMiavxt+KqHLUF7XKCjH9P4Ka
 VPWzhrdJY4zlX9IafN3L5byPuuAmNGoME8Sq4SZnPEzI/ue6GJMRHDyA0TkCfM8LODW7uNIDVM3
 x/kcvYGb2Wp2OfKMvSiNTpt0dxMV90YGpzQp1ikI2qGDY4KnvlKvhcqgaIPS26V8kO5m5IsANan
 XUPJPNFA57N6Xz0locRXukBzzh4GUdXU5f+dz8v7ALmAzg9kR27SrLjpi8EfBqPEIPhUuBB+jKt
 KhtdkAxG7Eu0a2zuo7Il3M0pRTnBHqLQMuqLsZWW7aCy+88IRUn5cI+rEd5/4l7Pc90lXGIytQR
 Q1IFO3chMGmCg4IOXJaCF+6rm/E6oFdXCwGKR/0L7G6ZnOrHynSwGsuW8fLQLgrvDLjNJ3n09gb
 VqB2mNkvj585HTR5BUrjFvS4McUW1eZit1o5miF08MX4B+jtMRacb/qeRPsmtD/O0aHbozh88pr
 fLlpNxLss3fOFoobP6MmdH/wQqHfBI6HSLK4aK+bnDamsgeDdlO+UDaFp3mMSDZPNO9hIacAgMW
 23NVd2kekezmXjA==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959

From: liyeshan <yeshan.li@spacemit.com>

Add a local DTS header that gives symbolic names to the SpacemiT K3
PDMA request lines of the non-secure peripherals. Device trees can use
these K3_PDMA_* macros instead of hard-coded request numbers when wiring
a peripheral "dmas" property.

Signed-off-by: liyeshan <yeshan.li@spacemit.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pdma.h | 83 ++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pdma.h b/arch/riscv/boot/dts/spacemit/k3-pdma.h
new file mode 100644
index 000000000000..a5b723ad616a
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-pdma.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * DMA request number (DRQ) definitions for non-secure peripherals of
+ * the SpacemiT K3 PDMA.
+ *
+ * Copyright (c) 2025 SpacemiT
+ * Copyright (c) 2026 Guodong Xu <docular.xu@gmail.com>
+ */
+
+#ifndef _DTS_SPACEMIT_K3_PDMA_H
+#define _DTS_SPACEMIT_K3_PDMA_H
+
+/* UART DMA request numbers */
+#define K3_PDMA_UART0_TX	3
+#define K3_PDMA_UART0_RX	4
+#define K3_PDMA_UART2_TX	5
+#define K3_PDMA_UART2_RX	6
+#define K3_PDMA_UART3_TX	7
+#define K3_PDMA_UART3_RX	8
+#define K3_PDMA_UART4_TX	9
+#define K3_PDMA_UART4_RX	10
+#define K3_PDMA_UART5_TX	25
+#define K3_PDMA_UART5_RX	26
+#define K3_PDMA_UART6_TX	27
+#define K3_PDMA_UART6_RX	28
+#define K3_PDMA_UART7_TX	29
+#define K3_PDMA_UART7_RX	30
+#define K3_PDMA_UART8_TX	31
+#define K3_PDMA_UART8_RX	32
+#define K3_PDMA_UART9_TX	33
+#define K3_PDMA_UART9_RX	34
+#define K3_PDMA_UART10_TX	53
+#define K3_PDMA_UART10_RX	54
+
+/* I2C DMA request numbers */
+#define K3_PDMA_I2C0_TX	11
+#define K3_PDMA_I2C0_RX	12
+#define K3_PDMA_I2C1_TX	13
+#define K3_PDMA_I2C1_RX	14
+#define K3_PDMA_I2C2_TX	15
+#define K3_PDMA_I2C2_RX	16
+#define K3_PDMA_I2C4_TX	17
+#define K3_PDMA_I2C4_RX	18
+#define K3_PDMA_I2C5_TX	35
+#define K3_PDMA_I2C5_RX	36
+#define K3_PDMA_I2C6_TX	37
+#define K3_PDMA_I2C6_RX	38
+#define K3_PDMA_I2C8_TX	41
+#define K3_PDMA_I2C8_RX	42
+
+/* SSP/SPI DMA request numbers */
+#define K3_PDMA_SSP3_TX	19
+#define K3_PDMA_SSP3_RX	20
+#define K3_PDMA_SSPA0_TX	21
+#define K3_PDMA_SSPA0_RX	22
+#define K3_PDMA_SSPA1_TX	23
+#define K3_PDMA_SSPA1_RX	24
+#define K3_PDMA_SSPA2_TX	56
+#define K3_PDMA_SSPA2_RX	57
+#define K3_PDMA_SSPA3_TX	58
+#define K3_PDMA_SSPA3_RX	59
+#define K3_PDMA_SSPA4_TX	60
+#define K3_PDMA_SSPA4_RX	61
+#define K3_PDMA_SSPA5_TX	62
+#define K3_PDMA_SSPA5_RX	63
+
+/* CAN DMA request numbers */
+#define K3_PDMA_CAN0_RX	43
+#define K3_PDMA_CAN1_RX	44
+#define K3_PDMA_CAN2_RX	51
+#define K3_PDMA_CAN3_RX	52
+
+/* SSP0/1 DMA request numbers */
+#define K3_PDMA_SSP0_TX	64
+#define K3_PDMA_SSP0_RX	65
+#define K3_PDMA_SSP1_TX	66
+#define K3_PDMA_SSP1_RX	67
+
+/* QSPI DMA request numbers */
+#define K3_PDMA_QSPI_RX	84
+#define K3_PDMA_QSPI_TX	85
+
+#endif /* _DTS_SPACEMIT_K3_PDMA_H */

-- 
2.53.0

