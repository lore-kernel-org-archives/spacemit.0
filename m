Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47D2297B7C
	for <spacemit@lists.linux.dev>; Mon, 12 May 2025 18:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074748; cv=none; b=obe5w+oLQRPlW6OBfHH1/7g0jaBhPCXGwe/gwhjzkE5PwW8zW8wNkq8Q36TaTSLX7hVDNbiV2sWck7U+YSHJeOK3wnDdAbv8piIqLeNtmYCysn4A7xEJkxBrWxzaWykzsLhuaBNv+wUWYQsNjRZQiCDulhCEUEuSTkMW3fWCm4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074748; c=relaxed/simple;
	bh=KZJEwnPF2oP9YPtwzisRM5EnPhICPVWmlwFr/un/FRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B+qm2Oo092n1qhJ9p08Re/gFFNECKPLvGL0eHSCLRPHj9StMaFoFT2GquGzSDdgA0j3jXCUoYaegazClxnqaq0V+yoB/eRW5Cdvh95wc4j6zFCL0nSQ3b3q2FSLf3pMJW4sgANLFKFr2xLM3QIGnW/pliLrncAkXn3XjA7wY/Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=TBDl8OIf; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="TBDl8OIf"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-861525e9b0aso469804539f.3
        for <spacemit@lists.linux.dev>; Mon, 12 May 2025 11:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747074744; x=1747679544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyAsDOHX0TzSNx8TRSfIb8QCj6vETa2EWwj7A6u+8bU=;
        b=TBDl8OIfkNquYmK1TbN8AfYhnPlbqrQXz7BvZv4Q9ZKThCy5DpXH766QoVILgLIaqV
         SFs96gTgEpM6/bPz5XLtoVQJtZfk53EU/BO8gOmZZHYxsLFuuygrTHxFJLn/NRGTF/lE
         Tbm4fXLtsPvzE2grSRHPnZyH+bAVZiLIDB8xHmSXr/otw//1cV96foDlM4KAKzPIlF+i
         yJjcVnjid9z/tyze1Enq7Q/GDS+FHECILiXHA+KKGUScB4O+cdwkVFqNLZdcBVoBveC3
         oCqEDZY2bVayb/w2yMqgRrPe2Wvt2rIrFOw93fRZSuqrTqCZQRhvSqa0qFRJv9VsYKKM
         Z+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074744; x=1747679544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyAsDOHX0TzSNx8TRSfIb8QCj6vETa2EWwj7A6u+8bU=;
        b=Z66kyrgHIw2ORBPZGxc8SY7eXpYMh5Cj3sxYgmmQEPEKd4aNmt5j/yqS8xfYH6sY34
         i5cwBUhK2h5Rw4Y9Ri/hE6S7pwWgZG6E9ZScO+huK2stUbgU6DFFhTzUTfv1YJErmXCS
         dV+kRq96JBZQAJXpxYSBOSIF58iby0CBM+ydfbr9WyLNW374oxu/OZ3w5ifIbRmu0p9w
         L+uLPw1pCJCn6h+X+2veB8DqcYb5oh6S3blfhda0PY9GNcemlJkIa5ZAq3nmuLpzfthg
         r3+CG4EOmq9CxybvsxM0pWkS6OzhAPiE6h0LFSv/q1yAvc50dfB9NXnfA/BjP8IXuN4y
         155A==
X-Forwarded-Encrypted: i=1; AJvYcCU4r2iCUH45gloyuNUixL0B/fRX9ItnSdY3tKdtD+vELEMlS+MC68MRRJ1DBHLjfWjhIM/lGUi0mg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiOTRARQ5s5SUshH4wP+D/5Af9rsG9ymyMVanJhNc+rkXMbfqT
	RuN4NUr3NpTSmGrEnieXL16VvnYI8GfIXoxieElVXY42EN+PRNZxnEULjOdnQyo=
X-Gm-Gg: ASbGncsilQUv3q+gD7bhNG6QTRpkqv4TP0S/VqWuIj90mxNqf1+/NZ+yUNurMMuCWls
	ayFK73YSD9X2cd7sPfHb+UU2rJHg2gyO930rRDG1W8bkCUtYmH6GpNfcyp73qGwbjvj7OdA0itS
	L0GPnVHpQ58hIAprM5KkiAJHyF1NqVcLe5bzajak1lOzzTSg6/wCH4umWtLzNsrYvF1qWefnIaz
	P7H/v+F4qfk50KWqmEaNndGsyG/xXSs+3Sz7hyYq7aUKUQfN0BRCqAVHGABZe8RnVGX9fI+gEtW
	FLPjDNsLB2HfPAyMwZKm3aB0lSampS3BMK3RcNv2aryXudBlNJ3aHMZyBX1g+3sdJ90qwDMl6Q1
	uAikzHevzz9VXb075HvmuGSVQ
X-Google-Smtp-Source: AGHT+IFp8y0gq7FRiygtuXYQxumD0qfklzDcQqew2MqXSZ32JaN7tFBN5F+L1BBzUbVI3IjffHBXLA==
X-Received: by 2002:a05:6e02:3784:b0:3d8:1dc7:ca7a with SMTP id e9e14a558f8ab-3da7e1e1acbmr157948855ab.5.1747074744563;
        Mon, 12 May 2025 11:32:24 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa22496e9fsm1740333173.11.2025.05.12.11.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:32:24 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Mon, 12 May 2025 13:32:11 -0500
Message-ID: <20250512183212.3465963-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512183212.3465963-1-elder@riscstar.com>
References: <20250512183212.3465963-1-elder@riscstar.com>
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
index c0f8c5fca975d..de403bda2b878 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -346,6 +346,18 @@ soc {
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
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -553,6 +565,12 @@ clint: timer@e4000000 {
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

