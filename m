Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8114E1F4C8C
	for <spacemit@lists.linux.dev>; Fri, 28 Mar 2025 21:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743195770; cv=none; b=ntWDb1XAFu3b6ha/vZD8nRgorDLlfiQVAZmgGeMxHV9XL/CAanthPgru9LRpEjTUixNtVu2wcalOBfBmVvs0V+Nr13lbgz783HWOouhIeVMlC3FLp0nGC0JrqLSCag0/uvrN3Fakj1rHzmbDcShtUhdm8BL1Gccn8277/0ftBXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743195770; c=relaxed/simple;
	bh=qVNF/97Fzr1SWnglsbvekG+r808MZVRjwdBPHhVs+jM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJ6YaNvipl24YuBeCe/ivsFPxRch5Z14S9Qev0faQEAoJ5YMfmba4aslatplSOSw1Clu/6kL1qz6bc/mfHEPT1eH1cfITeIDnMF2PXP/iLdTXuj2eMFd+vkkpz7UcmfA8xOerOqfbE4AxPIcLgS+ygE0y6agTdYkYSj+2d71kFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=A6/PPMbc; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="A6/PPMbc"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-85b3f92c8f8so223139739f.1
        for <spacemit@lists.linux.dev>; Fri, 28 Mar 2025 14:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743195767; x=1743800567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Up6UVO27Yn/XqWtQdUwLGOA59Ljhuzuee1Xv/FAc+zk=;
        b=A6/PPMbcWmfOWJ6ywtJSL9DeKjKMJ7M5Wap9xHzRyMb62zlBZPYgkGnCg576F3ciNj
         MO76LFBYMcEkTuEX0HsRn4M+sWblnUyYhrHbg5jeEPTO9aOh9DiM871aeGFxnvAV+Ea1
         29f4fdX4u6kAHI/TMkw/sPmg+ngkiskNsGHiUKRq6oVyEdg1sauIc6tRQ12I9nPsKLh8
         NmtzVFngnLZ341f9CuSiay8ui3DKaI1v+QKn3A6hxyzcE8YxQ5ByH8+kaCLC+0FC3RFk
         0rUkvejeYrZmZtxgLDZcbkYbr8ZQLY7j2gYKfyr2PaFLuvrmNCpFAzAa7ScoVYHL1WuG
         Nh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195767; x=1743800567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Up6UVO27Yn/XqWtQdUwLGOA59Ljhuzuee1Xv/FAc+zk=;
        b=gP5NVscvQPu9+xBC65V4PoHvCyf0BEG4MnLhZy219YGCUitA9yQ6dWNDZ3j3iioDLY
         rCBeT0/hbReADOJO0asBXfsoS/t8S8CALK8XarLT7foBVkOdSweUyttMn/rrJ3lDqzo5
         CdmdiPEEM3DQMNBPWIzqGDT9UIWl2Rohz0bEOhR1AsqR8nkHQU9bmA+CuUnjsR5T7J66
         feAnCd54KNhkWk2dKh3Kz+Hc0Hulxn31rekXmWzKSJb4Ysu0XXPCVV7O2N0+Dw/xUq//
         BH6DjhN0vFpZoPy5MSST9lRDK5o7co/sAIWlG6sjkxOfjwp9YbNA6KxMW4jBenC8t1NU
         ELFw==
X-Forwarded-Encrypted: i=1; AJvYcCWmV5tG5g6DpkC5LGG79mTPn6CakN8cYP5AAUS6OA9HORdop5jsYYsyU4YaQx0V1Qrlm7Sr1QmHSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZadHvesH89nkF8qs26YntMtv//n68DX+5cVIJQduDF0AY6+1X
	KPYmKLM5Xl8H/Kwt/3m/ttAFgyQ6VZcZMfyDgImJbdnE1o7W5rwJVql77x4SY/A=
X-Gm-Gg: ASbGnctLzAe2uq+7tZvvqF5bCL7UiXlZ4MTGFakktAsGDN3VLGxVV1/gN1F3JHxl6Zn
	SGQ/F0BbG675L/ekmgD6yVIZwN2W5fcEUBfEEGE1662ndovDHkTdrnqWoI5HEdZUJaGbl9bKkGo
	BX273jdCvpbLT/6INhjI6KIonZrfjubHUb3te8vg6kr1buwVs7uXGH0EdvUv2ASfQ+C/y928qhD
	OOLQLjeuwgQqZKER3I4qvYjaYckbbOqaED90qsT8ayQFYnFD2r6exYbkmj5SUlpEy9ynWGXVWLC
	6DQbVVtGLKk+fOJP7W1ZI0+8eqjT5na86EAVq2CtwfOgqF169FqWzZxj0/PyUmd2hm7MpKHjocn
	EvcpH0dfL16gfw7vXiA==
X-Google-Smtp-Source: AGHT+IGycY5TIkiYNgkSFBznHFQkpXRLd390tmdbEA+ih3++uzphzN5QAmfZxFmfAoPvrq6k/CN1+Q==
X-Received: by 2002:a05:6e02:23ca:b0:3d3:e296:1c1c with SMTP id e9e14a558f8ab-3d5e090e3e0mr11364365ab.9.1743195767546;
        Fri, 28 Mar 2025 14:02:47 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a74286sm6769405ab.39.2025.03.28.14.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:02:47 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Fri, 28 Mar 2025 16:02:32 -0500
Message-ID: <20250328210233.1077035-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328210233.1077035-1-elder@riscstar.com>
References: <20250328210233.1077035-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
currently support resets but not clocks in the SpacemiT K1.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 09a9100986b19..f86d1b58c6d35 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -350,6 +350,18 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_rcpu: system-controller@c0880000 {
+			compatible = "spacemit,k1-syscon-rcpu";
+			reg = <0x0 0xc0880000 0x0 0x2048>;
+			#reset-cells = <1>;
+		};
+
+		syscon_rcpu2: system-controller@c0888000 {
+			compatible = "spacemit,k1-syscon-rcpu2";
+			reg = <0x0 0xc0888000 0x0 0x28>;
+			#reset-cells = <1>;
+		};
+
 		syscon_apbc: system-control@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -518,6 +530,12 @@ clint: timer@e4000000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
+		syscon_apbc2: system-controller@f0610000 {
+			compatible = "spacemit,k1-syscon-apbc2";
+			reg = <0x0 0xf0610000 0x0 0x20>;
+			#reset-cells = <1>;
+		};
+
 		sec_uart1: serial@f0612000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xf0612000 0x0 0x100>;
-- 
2.45.2

