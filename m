Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A881A26AA94
	for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 12:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761569716; cv=none; b=EeTUZuOiE0MwBWlHYiAFyO+pUOUy4eLUndlc6ikKPOX9ph8lb/GU8POGPpWrcwHIL0gFdKleVLVC9MjeprZVsUdTVu9sytEUmKgVUcsH05plNinaNyMuBzsHmjd9q5HNrxto5CzCrqnC2DuAI+6GVqnv0MfC5myAnVtfstOSOds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761569716; c=relaxed/simple;
	bh=CnvW49qaumu8lY0eIQQxtLrTc9V9hHZfGU0p6GUmcLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lLUKcZP/ItKjVtLklye7uZlOTitjIdLzVxZbLmYleweNOX07Cofa83RyI/fSH+38P8IKjqBTPXg6XFMJBlXqW+NLEFQuzW5Jv1zV9EX4x+5PuIbcRiT6NdLd2UsakS9rSp17vQT6BLANuqndW6qVJwhtC252xekOwzwha8vFkQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=vePscdSe; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="vePscdSe"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-940d2b701a3so492830339f.0
        for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 05:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761569714; x=1762174514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZm4qLXyHnGCSJjs14timCrgYr+hiVUmvuC1ejayZQY=;
        b=vePscdSeW7s3dKF4EMi6WFhhaGKH17eb+2W2vMrmUzpwmwL/CleRJpd2YLhEvS391K
         YGxVo6GJKQ70HfM2LAfECmu+ICeDCyQPPiAK/vXfRbpvEZhSYKT88uTMvYyn9jItAfku
         UaC0fmvTyar+cRaOs3BifRIjtPkCzvHWS0rBSFfWU7V+kmXQVkPzNK2gLf+gnRiCPZ10
         Qdr/5GAoGdCPk72WBoIJHMjes4wZrUMABJVQ3MCDXgCP1CvcXCYa/LbgGoz166YWFsxJ
         fT1dKgUYYO34gkrBHPKJixdS6UoKCuRchd2EnnlaJy/9YMkHbTiUzNyWsTunsAXUXiml
         7WLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761569714; x=1762174514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZm4qLXyHnGCSJjs14timCrgYr+hiVUmvuC1ejayZQY=;
        b=M1O6carFpJIaaQytxnkIiqfenkoOVCsUlTsYOSL+/LO2sgJsBLcYjRMsRLg01gvdXs
         +SmjuJRxzeNKcEtjYmmEmIvTHG19Q7lBduIlwy4UmM4FCkKiukWc2cwMLAIBz30TbOC0
         7fP4Ea79gT6fjX7AwVcuk5NppPHHKu2bPoKz0QU9ibdhegnFzhgOjaIEIiXuaq3GLNy+
         k7+CjJvQhG2w+FaqdO7na8l/nJmvsyeO23iABUcl4pkCPBTJWe3yCMaR05lBV9zqEoJZ
         E1hHaOtOAC2ccCpF8GHD+8a6YhixG4AY1tkq3LklQ9Whh3kjNyiNOmJ93nEmRDQVkBCF
         jyOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz+mskk+NWb0sSNxugL53hDwl3Bhjx98I+++JRbrt1m5rB9KSGHEmG2Lfd/gmCXryZ7bAfGGo1Jw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4m/uqQzyjYTBwmf30W8ifP6y0pxBEgDH0ycnbWzm4PbkeStyJ
	NMkbc+hXsvTvnvMdVL0jdkSAxiUqAuUgLBIzHF33gQIYF5Fz0kv4vVt4mXpXdJNMPSI=
X-Gm-Gg: ASbGncu/nsSgDzv1TNefe0gGI36B33iiw8e1duAstbx0Oc1pIm4QuLVWrW7aRPeonxm
	FsgfC4wXGVoNstokNtHSY/PWBTPV5nZ2ezA2vFKDXCDy+cU+Rza0jPB6H5tbXyWf5tbz+yC0Ayv
	HvfbRrZFM09mi/jL7OG6a2s2rvIHZZmGaM89Y+lsnbwOVli+NC29sznCPwZs/LiYV389HNDxxkL
	ATXQEnXDD0dpsIrchyMQgpU4JqABodKLnG4NU9tgs5JdUgOZhr2n3ssEkdJ1D8ggEJouM9oQGx2
	++e61RQZm7LB507FD2S+0NFpOlyoH9FjKIz1MvDkUFlwKfnITm145qC+pkBYX5v3x5CCq/xFTmy
	iPkfvSQiR7Pn6a26aNwDQbzziIwd8m/p+QGwsZrTJD+1TggQfr0tanVRdCgzeNS7/P6cejZeZvr
	hpkWQoMeKnRF4qJwg8bpBxcHSFZQhNIiaRK9/TdB3nqhZIzoiw6c2Kxg==
X-Google-Smtp-Source: AGHT+IFmmT522+C1SBtNjrGRDwvpDMmF/aXjZncAIPKX4af5yw9ZwOirXo4uSn/478nB9D2HnyXQgw==
X-Received: by 2002:a05:6602:6b89:b0:945:aa9b:4165 with SMTP id ca18e2360f4ac-945aa9b43c4mr414941839f.1.1761569713842;
        Mon, 27 Oct 2025 05:55:13 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94359e742efsm249121639f.7.2025.10.27.05.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:55:13 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] riscv: dts: spacemit: define a SPI controller node
Date: Mon, 27 Oct 2025 07:55:03 -0500
Message-ID: <20251027125504.297033-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027125504.297033-1-elder@riscstar.com>
References: <20251027125504.297033-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a node for the fourth SoC SPI controller (number 3) on the
SpacemiT K1 SoC.

Enable it on the Banana Pi BPI-F3 board, which exposes this feature
via its GPIO block:
  GPIO PIN 19:  MOSI
  GPIO PIN 21:  MISO
  GPIO PIN 23:  SCLK
  GPIO PIN 24:  SS (inverted)

Define pincontrol configurations for the pins as used on that board.

(This was tested using a GigaDevice GD25Q64E SPI NOR chip.)

Reviewed-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 20 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 15 ++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 33ca816bfd4b3..0b0478c6f273d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -16,6 +16,7 @@ aliases {
 		serial0 = &uart0;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
+		spi3 = &spi3;
 	};
 
 	chosen {
@@ -258,6 +259,12 @@ dldo7 {
 	};
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
index 4eef81d583f3d..c4b9f6265a31a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -516,4 +516,24 @@ pwm14-1-pins {
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
index af35f9cd64351..990246a3b50ff 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -823,6 +823,21 @@ uart9: serial@d4017800 {
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

