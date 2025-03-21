Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1481F1DE4E5
	for <spacemit@lists.linux.dev>; Fri, 21 Mar 2025 15:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742570327; cv=none; b=NtroLuoLCAQqJcjhDGScNd+W56Bc+JdK8ZPEALOQTs8ANrjO6k1hEqqTP8/3Suyg0RbVuMmSnVJwJdekSx2Vj9g3rFiTNrb9TOaoRie9eRGGLdTjG1co2cbBP5MblQ33QYXAgsS4zIytOl57i//QqekrO019nxd9CA24l6N+j/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742570327; c=relaxed/simple;
	bh=KwRmEv3W3EtqBDLfbMtwfsqs1joXJAuCfqCxq5Hb990=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C95vHkUIi6yYAf7QYmA8o3A1ABaKrHOpb2AFf3BcqyjlADCWzNGHtNeZXBQLwD9WgTBGHWJ4FLa3T3sfwUdIuHLnVnFrLOO9aDd24UVLAKQOJowdg7lanyhLrYAl8zbqZO/AFaMVkdKOUztBxMUNy9e13JGUiPsQw/5kPhcEWnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=yxd2udom; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="yxd2udom"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-85df99da233so168635739f.3
        for <spacemit@lists.linux.dev>; Fri, 21 Mar 2025 08:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742570324; x=1743175124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nY3+cr8LwPrnwPUbr8ZQVdT4sW06Crewhjj4AmYBWuU=;
        b=yxd2udomJLm+NXNpJjWElwfmDKYaF1RCnH7LuaL1Rjgt3wT8/gndvW2dwp4pgrrg1j
         1GqgjLIcQ5GZ+t7rKQ5fd2xX0STOrHd0iZwlWKhmM4xMgeBgXqjHpxONEgXCuqFQn6W5
         2ap0lMoRQFLXhnwFNAZy80IZXqUFz6WA7mswMseUVdjRJNLX8VdrFpxDjHSyGqdId7bb
         KFYvn/gkbM5aJs2BDAKWqmuKsPkP8A8JAUjIfecRhZsxH8OG27YEYvbTEmpeJPEPr8PV
         5SXLReJf73OcvVuwPvEQbxEhvvrZV690QVSZYDUnTjrtKsZUgnM+L1P+KJ1t9Imfbzmt
         3puA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570324; x=1743175124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nY3+cr8LwPrnwPUbr8ZQVdT4sW06Crewhjj4AmYBWuU=;
        b=kwBSPjoyTczJG51J7345HzcyJ2qAmq3J6GhvZivnCDwQE1eLkXAF6YIrOqVMiO97+j
         oq3LRgRdugsvTn0OxRMlLD2s0a0T5Kc6RK7EyYcqAUR3mei6+r6zVlOdcMDAItVHI26S
         lF8IcqlDJqQqoTlVyfyUiCk4w3W74BxKFG136N25seNXzgeiDmVHtoyoBD6gunRKjZ7E
         QxXD1n0eOF9qSRR4Okp3Tm5doh8d9vswh4IJxfO++jSmnxC6dn46vfFU10fFD4U0IPY5
         s0h5C77nS28Mup6v6wxAhqYy9TZujIdYOCa744tF9Pl4Pg9JmYaomrYJ1M3542k8qhk2
         UY0A==
X-Forwarded-Encrypted: i=1; AJvYcCX7jgWU4+GYIsFzip2Xktd6DkfjvFdxKKyZivVFteNepM9JLs8hkyKpkmYfvrO9CDHPrwernWg3Fg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNvlUfO8FK6ZtF+JsRAnLp/75qCmEp6QxK7TeInVZdtUWXqVgn
	wIlit9kb3Y2Sxn+hUY2Ky8/1tgYosSb3xHCnBQwISwkx4YFjCeE1mt3J/tFo7pM=
X-Gm-Gg: ASbGncsYaUZ5FdO1gEHxFmp7hm2zJSw4OwB9kcvggUjGBZWZOIzkvtN09Ajg/o3osjI
	/fhAzb9Why3ypC4cbSfhJ4ptqyLqicY2CCqfynpwcUSkpkDABGuXN8uQTn4FQuHb3Qw/cZ1kaQP
	01nM2VgnHJksvnTU4UP6I2u4yjVv3sXexDbBSJTTqVip7TA7tWOd7TMYZkySprEs4HghAFkbAUc
	e4RuCmWEiecadKJ4jnaddOjmLO30lzxldLUO8Xpl6u6xHLpnsNYiv5cqXRXtB+FFNpVDtBdhRIO
	Yz3FNug3g+gsYytyFlgHZAGRuK5qF7zlfRDoasQag6oUF31zjSRK2G1tLRCoIULNkH7WUQYStJu
	rEFstwqxcQKhNSoUDADChgcw3
X-Google-Smtp-Source: AGHT+IGguI55dL71gHl0tK+hT91rVomg7KnVgw+/XoVslENUEzuEPRHi4KDVzYnSZRrU4EihCkbgug==
X-Received: by 2002:a05:6602:7512:b0:85b:3c49:8825 with SMTP id ca18e2360f4ac-85e2ca62dd3mr380237239f.4.1742570324050;
        Fri, 21 Mar 2025 08:18:44 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbdd0a21sm475553173.41.2025.03.21.08.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:18:43 -0700 (PDT)
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
Subject: [PATCH RESEND 7/7] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Fri, 21 Mar 2025 10:18:30 -0500
Message-ID: <20250321151831.623575-8-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321151831.623575-1-elder@riscstar.com>
References: <20250321151831.623575-1-elder@riscstar.com>
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
2.43.0

