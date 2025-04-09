Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F8A21CC68
	for <spacemit@lists.linux.dev>; Wed,  9 Apr 2025 21:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233477; cv=none; b=X8I2thRkLP7mTVnMk4AY6AyEx5bOvf6p68aJ5NQgxbU1WuxhwBFlNgHsqa5KVSBabyyPnXX4ZOdQ/8NSaH+hCj//DzGWcydgMYRyMTl6yCkfVLs/fTnGUgYXo7qfuHsRvgHqGQVScB9IDeq4ldwYBGD4IhUhCF2M54uShG0HhII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233477; c=relaxed/simple;
	bh=2wkF3pIspsBICKC2HLHsuT/AUDwllqmRkvg4pojS36g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jaowjBfZyj52RIFA+bDnm/9tsLAZSrFlq3+MpIYaWHl/11kY/1xSwyYuhD2t7hHjnyX0Bb5sPyLDbLt3kK/4KgKBhl97kvzyg5Sj65ykLsVnCpHuZREhqzB1lI5m3xOfIg+Q1mN8ePpOVzuDlSXyankmQJeFotBysr9mUzH4kII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=E2KP+ToQ; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="E2KP+ToQ"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-85b43b60b6bso7180539f.0
        for <spacemit@lists.linux.dev>; Wed, 09 Apr 2025 14:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744233474; x=1744838274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=E2KP+ToQf+wr5CCgPOApG0OHTE8uZImvc76kUrkdWSvaGDkSu1N2Ba4FU/gEXVS+9U
         2j81aQ4IkzjGK5jIqcPdcyf2iDeKIwrCvepPmq/xgBWq6EtKiuTzgvxOyi2qql7tmltx
         m4sbTPdxS/a9P0j3LVT2yaSRVViVszbI0uQX8ah+YuxPL2YjAKS4tyg3X2mBdsFOqmhE
         /B92nIjs2UUClH4sPyvsWos+D7yrFM+qgNFarOZQpxnr40KqzhNmZ87NVZ8qqv0dQOqs
         1togEcNNfQbdDz88HiLU8bB0hfwP604MHPG9xB48sWLw6L8elOrm0zWJchzdKBnwZU7g
         NCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233474; x=1744838274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=UGiiYFeLYPo+TLmNIWWnTglOVn1fq9mLerLYkCfQFyrXW1iT6CgAna2tPqaXJrcAe2
         Fe9MLYhJRW9JN04EpyDW0yXxzt4sDqxcpdsgN1ghED9QZL3u8VXYAoC1xpcjv/TY67lv
         UR34oUzmr35qb5dl/6G//M6L0lfb9RotXlOeXv1ytOZaWRkUKy8DvMH+B0rYl1pu6uuw
         sJs+AHH4MAWcHKp/uki0n2LCAJG+jGgTR1XywMuEJgtzb9SIksT9xiIdlT4E3B+F0q/0
         GPvUAO8vlJFm6fosWPMX2u/3VFwVMJ4Y2rhPx4w+akg57crdd6Tf7eH7OUzaHTQ7ChQV
         AtIw==
X-Forwarded-Encrypted: i=1; AJvYcCUlnwMudiGZl9/JtIzoSh+MYOmNyKRXGRTxMakojq2MbgjufypvADOt1Qphe/sgxig9hT/jdcfFBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbrqBpHHNamUloZgjqIWwKB7MYXiaPHUGruTSPa6pWe+jsXVb0
	1TuFo+YHbTjT1b/Uj2KHZieAm+xecqt4ZlcPDNUyfn5Z8vi2EokaU/mDaDBAp60=
X-Gm-Gg: ASbGnctfVcLf34FSS6fe8azW2r9Pu/lzCbsBVxH6jijy/ASyArHI3NJ1rw/H7/Q+4ow
	VGgUkEOi412CBELgAVfcgcCOvqFZJCBVQI/1s94BjrtlB1/TJgGtJhK9Wt9Vssx1MIsUFKILd0e
	RqGj0RepYXIdTWcKRkDQ7PrMYfOBEU+M2ZYbdn7jKfDR/VZ5uEKsZFhrnN0TTGM1G4El5hOixbk
	LTlGoFXc4SkK7MAvgiVvoVhJPSDXdSMuGuV//YzIsr5KD2WSaOii8gDYqEbfNn0qzytq6Hq7/85
	0/OOTwq2/5j/UDWlTYlncOM2RxkPYCvYkiys3pVFYx7JsbsaP66RLWe7SBYBh7mzjuTIF5vHIU5
	bWnWfOgwc767FaQ==
X-Google-Smtp-Source: AGHT+IE2EFUaAUGzZqdq2RH+minAxPrbtolq6/W/NBIYcCuS8He5fK97oLjQC2cX1JOUkUtoZzh2cA==
X-Received: by 2002:a05:6602:6e8e:b0:85e:16e9:5e8d with SMTP id ca18e2360f4ac-8616f206ec2mr29618639f.7.1744233474607;
        Wed, 09 Apr 2025 14:17:54 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8e91sm420735173.6.2025.04.09.14.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:54 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
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
Subject: [PATCH v3 7/7] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Wed,  9 Apr 2025 16:17:40 -0500
Message-ID: <20250409211741.1171584-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211741.1171584-1-elder@riscstar.com>
References: <20250409211741.1171584-1-elder@riscstar.com>
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
index 584f0dbc60f5b..491ab891788b8 100644
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
 		syscon_apbc: system-control@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -514,6 +526,12 @@ clint: timer@e4000000 {
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

