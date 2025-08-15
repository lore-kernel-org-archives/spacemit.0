Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4756329614F
	for <spacemit@lists.linux.dev>; Fri, 15 Aug 2025 05:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755235104; cv=none; b=hZvNxGEbJldWvw2U352Q47KRzpo3Ec0DwcNj3OREWjvNrrZ+Uckh9SVFCQrqklyWWzBrRZknkgRYBbW3Cs1nrgsKXZxhKthorfGngeM6LjlmosrmvIYivIQ+v17by2rNs05fT+3jt5WQX2xs3vRwkXYNW4O+fBJmOOn7kWw9hbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755235104; c=relaxed/simple;
	bh=wAbS4Hm5Ej3gB5y17PgS7507wIkyUc+hhTmlBTFT2ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sxe+INJEqppz8zmNeGyFOE6MxrloDjEEVP1Hxayu6Dx5XLdhV/v2FwjShkFlsYn31MF8fH0PtNEuwlO0ALM2wKB39paNjnAzIp3u17TjR+tb8x0JnCe2WZk0IORB+Hh38AJjPvgY/fl72zVoRsWjcMTVW+J4Vu4MwxsTNiBy6AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=xiSqAPqk; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="xiSqAPqk"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-321cf75482fso2621406a91.0
        for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 22:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755235102; x=1755839902; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tu3VbVvBVdJX8NKXRo9aN8ru1kGERA/t9NfAcjD1b4=;
        b=xiSqAPqkp6cJtJBwGDJh2aueBTy4iuL7vYB5PeR9XKFDk37OSj9wDYitd4xZMhs15h
         eOKswprSrnz0oSnyT9g4Vqws1+u7llKNn/DZPx5CC9Wm0e4Yr1cl+2aCiPdUA1rNYN9o
         1bEtCA7u0F0Hptc31c4h5Mz0sRE5SjgnTokmuxp9hOIc1J88kUFxVNNeyXi9EMTJZiIN
         72vG9A3fyNH0CRyanZus8G2ibq0ohiTdywDPHTIZJ4O0me401Mo4e1LrwldPBkqKxHZG
         IUveA/IYNrPI73rYOqL2iwq7IyX+1lfgr4BgAR5S3S1PQJOGnDoNUvqK4UO4FS7FKtn9
         vayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755235102; x=1755839902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tu3VbVvBVdJX8NKXRo9aN8ru1kGERA/t9NfAcjD1b4=;
        b=QvwZ9BP70N/l+YybpPbyHorNAMKmwCm+W2WRjSw2lF78hRO1FQok3N9qtlUD29fJPb
         HSVnDt8FRX/fOGogXsV5bd20mNedbj7POSptRkccYYYMWgJRdeVYQMhG/D1q8+I/9PJN
         phE3pE5pWHUVLtbhSBF91MIWPf7GxpMhqBBsYb//F77iq0YVBWZuDLXhB8SFW7RY2Y5o
         O1eHPwetit8t7HJeqNXxIM7/0lOtJK34OChcfBoFrYE/VgbrDVrkarAtEzEmF9Uik3kn
         ptoo0X85xvpjzE5RKvmCtcLPmTq/in5s1DdvYToxNHZH7CzVaBRx8f8iN42ZIxt68Tv5
         sTmA==
X-Forwarded-Encrypted: i=1; AJvYcCXzcA1IYpNwBqPtpqsn5qzn25owU1lnJThgZiyxG3IGaURZ9vO0FYx4wVTyCgSzAnwx6/Edxl9b/w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxlXKRrCWrGIISBRA9iMPhL84uyLJH0+dVzYCui03Y7ST/glOj
	2Lb5Dc2Bbz2VwdUpJIrpWFihcQBOHkOWPKpVaax1BMSZOGZ83NJmJD1iFGc2NetR/TU=
X-Gm-Gg: ASbGnctp1qONCZ8DsSekiKTw/0qvQAc9clkMT7ucMqNzDiYE3F7ygiibuGxLl83i6KG
	akZ11gm530HWDka9p79khC/sdGaMClC4KXtam4JN3gml4tKZfDo/ax6K6qhnwkP9P40+st/v3IN
	JxZ6kT1iil214QXhCItoPq2GgqfCChhqRyf5I056rcxMsy2hSKqINg92bAZurB3DoICPzxU7TDV
	x4Q94MMhqdZZyrQ9HAZk/2JiDTQWD/KDprV7ubgZDNAo1st0qqKVnuaeDAkPxL7ulUAFSePo+sZ
	A5jQD3ToZJTiqKPDC8b4zKsAJXP6sGMVQKpPZRIO2JEcy/taRHx3aYXQGLsp3s1riNIKV1dIIj/
	2q9obmmQY0toX0PsWxDIm6w==
X-Google-Smtp-Source: AGHT+IFDtHgfFvQxxm6fxEwWXi9awBBZD5Ua19+tFUlmmEm3vFbmRHegYSTVwFsXKmUcUeczaz7/jA==
X-Received: by 2002:a17:90a:c10e:b0:321:2b89:958b with SMTP id 98e67ed59e1d1-3233f0c1a4bmr1740600a91.0.1755235102576;
        Thu, 14 Aug 2025 22:18:22 -0700 (PDT)
Received: from [127.0.1.1] ([103.88.46.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-323439978a4sm373212a91.10.2025.08.14.22.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 22:18:22 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 15 Aug 2025 13:16:29 +0800
Subject: [PATCH v4 7/8] riscv: dts: spacemit: Enable PDMA on Banana Pi F3
 and Milkv Jupiter
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-working_dma_0701_v2-v4-7-62145ab6ea30@riscstar.com>
References: <20250815-working_dma_0701_v2-v4-0-62145ab6ea30@riscstar.com>
In-Reply-To: <20250815-working_dma_0701_v2-v4-0-62145ab6ea30@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2

Enable the PDMA on the SpacemiT K1-based Banana Pi F3 and Milkv Jupiter
boards by setting its status to "okay".

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: rename the node from pdma0 to pdma
v3: adjust pdma0 position, ordering by name alphabetic
v2: added pdma0 enablement on Milkv Jupiter
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 4 ++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012fe56d42ac8a7efdbbdb694f31b6..6013be25854283a95e630098c1fde55e33e08018 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,10 @@ &emmc {
 	status = "okay";
 };
 
+&pdma {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 4483192141049caa201c093fb206b6134a064f42..c615fcadbd333adc749b758f7f814126783f87fb 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -20,6 +20,10 @@ chosen {
 	};
 };
 
+&pdma {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;

-- 
2.43.0

