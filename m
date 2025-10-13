Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E9228504D
	for <spacemit@lists.linux.dev>; Mon, 13 Oct 2025 12:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358801; cv=none; b=fGi3ZOsPGunBfv088FDckpGL15N3zCTaxEGd9ihRn7MofXT6lJqs5WbY7+2owXlRGNLB5sKuGDOCu7KYYG7UoOJubToBFdJixov/NUeBQWK/OHaCQNxNaHzoGeSP6K8mLwf7eRDYs5TN/sLdP5eDKeZzU0hm0+a6fLm0XJny1XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358801; c=relaxed/simple;
	bh=IBn6ZhODzxUpc3P0+zT+3Gw/37gC8OpKQaPr/A9Z7Tc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gfP4VdlNGApb9ArDX84/gGZrQWuN5AQuKgHYeN/op+KIlC+VPhI1SSjh2XFlhtgV42XfCvnjqPIbP+94A2nV3w3KnvN7+Ix+kGCxxYRYm9XzVSn7NFjzy00Csn4nBCRn9ycXlbRPzip3BT1Ehsz3hpj6apGTL770YkfLdearbWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=OWyPOHjW; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="OWyPOHjW"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-42fa7507047so9067525ab.1
        for <spacemit@lists.linux.dev>; Mon, 13 Oct 2025 05:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760358798; x=1760963598; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lH1v0rpYCArgbrLYKpreuIoN+Gm6oJddlVx2jUGumJY=;
        b=OWyPOHjWNnE+3bxFj/FEvJApsfM1KbQQjoFEylrJLOMyihK+cyHEjybsDqFP1jr9rY
         8dqGbAzHmB9l3vbToyKl7pbc4ez3+tIqkvdQfaEYN5567aFDheL6dYZa2xmDAp3UpqSX
         q2662AruBRg7myhVXDRU60NPnQIaMiUjVJpKtaX7oZjTBahfFMLi+lgiBXo+tXb8JZ9l
         H6w+4ECOQ38fnafqLDDXF2pV/FO4NjPd+0RLeCFkbqmHXjDeLoefqux5avX2KBH6CLjY
         AMJjSFivBBeJBx6G12zR13ft+OUNO58HymQ4onsOaDxpZavd85BgDenIEbUGbOX+L6+V
         sIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760358798; x=1760963598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lH1v0rpYCArgbrLYKpreuIoN+Gm6oJddlVx2jUGumJY=;
        b=Tee7nrWoM8Tok4IzMC06nhBXpMhbMPRRT2ulExo2QJbGc/00LXJgn9bbRPqToTjMOG
         IiUmbVW1oP2EO1GX65QZNxZRNNfU9fGTxY+qRUJTVi5aZ4x+brmiFyYiPAPNww/6g7nJ
         p4ZrXnn0QGxm6i0wCrFPrThgllpyRO4MTWmrIUaURPZRw4JevXv4nUKo3q7WDk49mO3A
         fWxCPryTNVFoe4C5MzCA58Tf8CGbxXUpzgPD/m9NpIQAe1kWCAV5HHeBQlC/67WuXdcK
         72ni2oioC6QDJBQsAE/fkxrZwC+mr2rpuH2yreB1H4OdEzX7WD9MgE6R9SO8mDfbeIlE
         GICg==
X-Forwarded-Encrypted: i=1; AJvYcCUOQKNTeceghJJ/e/f6MlKMgoeUrMyskxl9uupfr9KVylDZR5hXpc9AAQ0J4cWq3+FyLFOuRuN0dQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwepsJ32KFVLcSK7hg9dRxGItKfo2bZ7EP2v0aQtvUVRVwaVmSB
	IhOP/6c6a4VNm/tLcTrsBx4ciakhs2EajqVW4Sthj7cSPpn8GvslKGHf4o87o2LY57Q=
X-Gm-Gg: ASbGnctmlKU/G06+Uw4LbIdB9nccaR9yQ3s+Z63lmt9ydWS0/Q+KvmiuSa1/ks+NIVq
	0r4yyhDyPwlA/TJC8xUn2147+MTC6ObTyaJus5/OS/7uA9GEPQAa1klMhYCsVa4mINlRzsGRzoI
	SIcKlmSQyv5VDUj3VpXSq2pzhKcgijbe34xXtr6waaqIcIoCjmSG9bapmYd687lUXh5m1v0tLXX
	SrsIOfXfiHT49KMZwPTPq06jkbtJCuahcNTJb5N56AgBUFlXlE/n9aZ3MQ6xCcJs9kt7qiheX0c
	BNDWDswU6OedTGql4y/CKbjkSlDeXg0rCTnrog/DP3jCo2WtGjc+mdJ8adda4XIXLq2chFTvfhJ
	zNld5K/qwa2VUzo/x4CeOtoakaa0kzJE+9CSnXnG14qqd/FddSkmptYPRdy+VJeTjHr5/xFMI62
	fUn7ltQCztA2tBpV9nZfY=
X-Google-Smtp-Source: AGHT+IHl+kdG7KX32xkfhYQaqxRv069N0+qssQtZvAYRJCWtVjC/Z307urfNlq0x0wqsqA/KnCtbeg==
X-Received: by 2002:a05:6e02:1529:b0:42d:87c1:da2e with SMTP id e9e14a558f8ab-42f87497a42mr227386585ab.13.1760358798387;
        Mon, 13 Oct 2025 05:33:18 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42f9037e344sm51529815ab.34.2025.10.13.05.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 05:33:18 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] riscv: dts: spacemit: define a SPI controller node
Date: Mon, 13 Oct 2025 07:33:08 -0500
Message-ID: <20251013123309.2252042-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013123309.2252042-1-elder@riscstar.com>
References: <20251013123309.2252042-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a node for the fourth SoC SPI controller (number 3) on
the SpacemiT K1 SoC.

Enable it on the Banana Pi BPI-F3 board, which exposes this feature
via its GPIO block:
  GPIO PIN 19:  MOSI
  GPIO PIN 21:  MISO
  GPIO PIN 23:  SCLK
  GPIO PIN 24:  SS (inverted)

Define pincontrol configurations for the pins as used on that board.

(This was tested using a GigaDevice GD25Q64E SPI NOR chip.)

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
v5: - Added Yixun's Reviewed-by tag

 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 20 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 15 ++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 2aaaff77831e1..d9d865fbe320e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -14,6 +14,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		serial0 = &uart0;
+		spi3 = &spi3;
 	};
 
 	chosen {
@@ -92,6 +93,12 @@ &pdma {
 	status = "okay";
 };
 
+&spi3 {
+	pinctrl-0 = <&ssp3_0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index aff19c86d5ff3..6ce56584ff473 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -76,4 +76,24 @@ pwm14-1-pins {
 			drive-strength = <32>;
 		};
 	};
+
+	ssp3_0_cfg: ssp3-0-cfg {
+		ssp3-0-pins {
+			pinmux = <K1_PADCONF(75, 2)>,	/* SCLK */
+				 <K1_PADCONF(77, 2)>,	/* MOSI  */
+				 <K1_PADCONF(78, 2)>;	/* MISO */
+
+			bias-disable;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+
+		ssp3-0-frm-pins {
+			pinmux = <K1_PADCONF(76, 2)>;	/* FRM (frame) */
+
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 6cdcd80a7c83b..ce55897d34fac 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -797,6 +797,21 @@ uart9: serial@d4017800 {
 				status = "disabled";
 			};
 
+			spi3: spi@d401c000 {
+				compatible = "spacemit,k1-spi";
+				reg = <0x0 0xd401c000 0x0 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&syscon_apbc CLK_SSP3>,
+					 <&syscon_apbc CLK_SSP3_BUS>;
+				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_SSP3>;
+				interrupts = <55>;
+				dmas = <&pdma 20>, <&pdma 19>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
 			/* sec_uart1: 0xf0612000, not available from Linux */
 		};
 
-- 
2.48.1

