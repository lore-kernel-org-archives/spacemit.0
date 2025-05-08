Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1981E28C5D0
	for <spacemit@lists.linux.dev>; Thu,  8 May 2025 19:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746734066; cv=none; b=bkCbQCpK/Fwiw0OqBTjNC90LoAzIJfSjLNMFbFfh3n5A/p74lN0dt1M7KsQzfUQ6CszPSdPlzLyZRog1DgN2FgzIN8Du3vo2eV6uPxcuayDBS0zw0diCEW7Y+/xY+3+YxE0N3XI/9AuFyqLtETs9cey2lkX2U+5iD6SAjXvzet0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746734066; c=relaxed/simple;
	bh=o+DTlUShzMqTWdpVptHXPZF7T6Hpe95l3FZm/2enEAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZbZ/Xv4VASQms4PEvYW87JyaVi+5i5Vil3Rs9oOxfMbiQGEgdlAh8Pht1XjvlVi9C+US5iar2k3jX/ZKIlUpV4PyPCdpqrvQpqx1ny2HnGOeFLFsAJO+itZi/rv79TUtA9olmhUSTKmK5Uwr3GnIfJfn0YHPOdWhu5/x6C3SMx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KhKBqQYl; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KhKBqQYl"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3cfce97a3d9so10931555ab.2
        for <spacemit@lists.linux.dev>; Thu, 08 May 2025 12:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746734063; x=1747338863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=KhKBqQYlMyQUT+GV61A81H9oMetxQXpxiq2alUNdeoUpv01IOMwewXwooNemG+vUHv
         OLj7OoR/Q4dYEer25xcbp1FfZip5nKLR0GGCB9E/SnNWU0xFEAFDCu97KwWc/CgxypS/
         /fsugwzwMzpVq3dZcwl5bGJG3ygSl9NID1pcWFhOgW2bVSLHzS0rvlP+Ii7STnzujysW
         rVZweMWOqTT4kPdJhSQjA+Kv9Ic1gT43s/Ri3hxAxMR3wfpSH2oilixDfd4FEx7NlyK1
         9E9qzsHbVDD/vomU6go15xfmOWYqxGMO39cwScIy0I3wdFsIgeF6vg+IzZHJM7VBSxPf
         SHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746734063; x=1747338863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=ZOw8E6t2uBuFlJcLvh35gIeqThbS/G0DmFgslMOitDyS/Nj/v1tjpAuQ4J7DqsTOot
         dBsADWPirVJV4R8a0l2A8s6J5yDdKOxcEcKpJe48FylKqRxFKQVBah6A61PFKWt6KC/Y
         nqd9k3jjD2eI6UB8AxBffruZ2HYVdpr25uHEMSbZvgDuGGm7UXQx7yW7fweHDeBN4Srt
         nnALfdwQmtOld3BE9wpCIg7JSpVfJnVzuT6tWmW5yloyNQL4pvi7mHI5ID8C5519LHVO
         DBqTuRMxOzTZhwbou8je1MamTP4JaALskD8QWBv+32cKK4Xk+T77Ue1GikDgy+ig2Kz6
         ZcEw==
X-Forwarded-Encrypted: i=1; AJvYcCVXZjDoZT/bAkOx6+7uB79RlRxUXc0l53Hut1Vzeio0VS5FnfhAluJG92JAp4/lHp2MZrRWq1Cvtg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQf+npEanVFlL/5KbO1XtvGSdpEkfkzqoM3+NWvncJ8C51oy6n
	zzS+8GGS7qbxET43EVBP+GavmVO8gWJplM+yo26p5i3TV9K3Bq5Tv3Sswl09TXk=
X-Gm-Gg: ASbGncvlTAg9xk6rVfU1eCwp+vJ+J8C8sKXe4GVFqLcL0LR7ot89xRWIeDX2yxlyXsU
	oh1h/X6hT5R9U7N+mdNCQxj9mt8Q9tx5IiMrVqz9zav//XLS4Omy3d79An4md/C/Rj8B8h0QrbU
	tRufdSzNb21HRFGE900NjdszqoPPWc8RdNa1eh5sm9EMNrPknCDKeJtjecYHQkvpNU1UGrileKQ
	VyUuiQ5yqaBl1gv9Tvv806HyYB/hiy9NN0GYlenjbumfUve7XABq2gU3jPN8ZJ/GQAUA5Bfcsvd
	nB/svbjWLgrB16BW/DrNFapgqymEnJcxBiJlcZXkvyXYPJcdoL0jQF5LGg10PPZJkUXQa052CRw
	OmQh2+Rdu37B/Ow==
X-Google-Smtp-Source: AGHT+IHxa0h5ENM9DziETWmuFGwasgRig2JIzf55dVO2uhr/X5qFkUD+e9t5JjAw/tigV8feMiv7Kw==
X-Received: by 2002:a05:6e02:349f:b0:3d8:211c:9891 with SMTP id e9e14a558f8ab-3da7e1e26bfmr14255055ab.2.1746734063073;
        Thu, 08 May 2025 12:54:23 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa226850e1sm93983173.134.2025.05.08.12.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 12:54:22 -0700 (PDT)
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
Subject: [PATCH v7 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Thu,  8 May 2025 14:54:08 -0500
Message-ID: <20250508195409.2962633-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250508195409.2962633-1-elder@riscstar.com>
References: <20250508195409.2962633-1-elder@riscstar.com>
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
index 6eec6328c26fe..f4afb35dc6bc9 100644
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

