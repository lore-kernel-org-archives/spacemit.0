Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF15331A5A
	for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 16:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979129; cv=none; b=iluUCFmFJ5C5+arKzrI2JTKoFSMWNJuq938f7Fntk3RVEcQHm5IjIG/9nX2SobYkpsJ0MJHfRHbkjtuj7X+oUF+aVt6kZNkHbsam11cQ+bvKt013B+3icTg7mMJS/34xj/pPjG607memnttccC5yxi74F0VW7aTOJVlQlWCdd6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979129; c=relaxed/simple;
	bh=wy1ICIdGX60YDFSfUgR2rdxBjAGUo3dI3PFdtxnHMOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bQGG8lHtDJvRl9kYeipUFuw86tEuwgiweHdTt7QSR5TSNA0PqXnhN+JO0U3zIsiK4OZiV8F6ucF3NsMrTIl0Zx0SOF66125KAsJ4Vfu4/Uv3b3v38ve7kdsRdkLJnSjltfZSzSjoCRVBfUxwOW/C1DHCfeTudS75CMqOjaWz9/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=iT3pKbsD; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="iT3pKbsD"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-938bf212b72so189179539f.1
        for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 09:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979126; x=1761583926; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ME7tN0yU+7BkLvgNaV8YZoYvs3CU33grIokhdTXS5MI=;
        b=iT3pKbsDhVpizaVup+p6VYYrEAzZg4LxaqESjdqk4XUHMdsnKpm2oJJXNHakpzwEA3
         gPToU1qBtl9VVpoMU8S8YD/0FsizE48OGGJbH53TGvXl10KsKztf3yGheaGDnVJi+fz9
         /0j9GgkjeOVOQgfOuCkrOakh1uxMqPmcdResPqQ4BWw+g+cEqRy3vrV6y7m3midft9ax
         ICNuH7YB1EHm8CIGTWFlOhFCIzGwac4atj6t/sKIGcvIFf1KaScSg+g5CtRravS2ufmY
         pJU23MB0MYd2WS5Y8kNt0e52p4QwmuxaZkLRKRqeUH57D6XGl23WVoRPfSP8lhCSDgsy
         Ri1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979126; x=1761583926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ME7tN0yU+7BkLvgNaV8YZoYvs3CU33grIokhdTXS5MI=;
        b=Zj7BY4ao9DTExMQMVfFb9W16cNoxMDnDM4Yv23ddYgOjPElc5cFzZk3Mtz4NNvIQOm
         de0HrDGwrtG47iKe4Nkl7DT0Z6z2/qscUFRVyd3mJ765rT+7ucWxtedaWRFkdTQ0ucZx
         SegTOeU7TW72uCSxAxQKYh3yNl6/ylsBFHw+h2BCmp4E6cSQmQY4LB4iix8Q7pmk4y2E
         1QBYjSHs9ZeYRdh6J4RKkESrKNxwjNcT4J0S6sei10uAe57K946YCbT8B0tgzMbkaqZY
         weYCME8ss13fDxBG9nIXYWTCcrumqYf+n/JbkrMhb270ANpDOy/xqo/boi9K27j7Ia3l
         m3mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbSHCEENOWrwhrvOe2y+3esMdKO0hRfU9HWX6KQ+H7vrXqg53wdZWwTirMRSnSh2yhWEDEHJ/aRw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyy85AJw3cqjg46ps8iR7On7CcK7CwcPyCfjIZxjNrsnkGqUDj5
	rBCY56zSzUTJk/xksvjJ2eb9ubBqY42K/PtcjhEb3ItSK2gFFz7hoG+kI+VZPnCq8o70EbzUO03
	yvSS54sw=
X-Gm-Gg: ASbGnctdC2U/lSk1y+mlvwgUTxCTTms30a5L/ApoEcKPsojmGxtRE/c25K371VeBcYe
	5sb05hXK3ZIZ9LYbLNRdQej30e//KTbpInbXLE3ScWPv+JrGAKARlEOruQsye9FEalD2JFNUdDQ
	mpu0k6s5yWYHvlrU0f2APRztxD9iXc3G9fJOE1e+khinmDXIDt6UR2oKxgsdgFpdnb7RSrSiBPE
	SdkoDd7XOvhDhV7Yh9BfkUIaoSNlkj8Egk+lBY3aVbvccA3x2EZi4ZvcoYgW2lme+nbZmKhk7pC
	ab19YNbIlZG3c2RpsoLikCpKPhwKxb6oy0rrB5jKlCBsUKMoNofGa/vfD79LjtCLhSpNXUxFBve
	CWezfXrXfJ5Z1xBNSVp6kS7UF/XFe5FF5zKiQu+/Az/dP6pF0z4hoFMMddUOsUGCt0GZ7Pz9bDN
	pHYwta72tz67NEjHJQ1CJ6xlhhVqQQsDbvE12fbsVOYDpBPpSZd42smV2OSNfculTS
X-Google-Smtp-Source: AGHT+IH2irmcbwMULie9OSrSx0zC1Cu9OY8pd1/5qlpoxwTt5tQIMKxjTuK3uX5gEo7j5Pm6IgtfPg==
X-Received: by 2002:a05:6e02:2301:b0:424:7ef5:aeb with SMTP id e9e14a558f8ab-430c526b27fmr218824855ab.17.1760979126308;
        Mon, 20 Oct 2025 09:52:06 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:52:05 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] riscv: dts: spacemit: enable K1 SoC QSPI on BPI-F3
Date: Mon, 20 Oct 2025 11:51:50 -0500
Message-ID: <20251020165152.666221-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251020165152.666221-1-elder@riscstar.com>
References: <20251020165152.666221-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define DTS nodes to enable support for QSPI on the K1 SoC, including
the pin control configuration used.  Enable QSPI on the Banana Pi
BPI-F3 board.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 21 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 ++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 33ca816bfd4b3..2f3750f7fd6f3 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -258,6 +258,12 @@ dldo7 {
 	};
 };
 
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 4eef81d583f3d..e922e05ff856d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -73,6 +73,27 @@ i2c8-0-pins {
 		};
 	};
 
+	qspi_cfg: qspi-cfg {
+		qspi-pins {
+			pinmux = <K1_PADCONF(98, 0)>,    /* QSPI_DATA3 */
+				 <K1_PADCONF(99, 0)>,    /* QSPI_DATA2 */
+				 <K1_PADCONF(100, 0)>,   /* QSPI_DATA1 */
+				 <K1_PADCONF(101, 0)>,   /* QSPI_DATA0 */
+				 <K1_PADCONF(102, 0)>;   /* QSPI_CLK */
+
+			bias-disable;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+
+		qspi-cs1-pins {
+			pinmux = <K1_PADCONF(103, 0)>;   /* QSPI_CS1 */
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+	};
+
 	/omit-if-no-ref/
 	uart0_0_cfg: uart0-0-cfg {
 		uart0-0-pins {
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index af35f9cd64351..47f97105bff0b 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -823,6 +823,22 @@ uart9: serial@d4017800 {
 				status = "disabled";
 			};
 
+			qspi: spi@d420c000 {
+				compatible = "spacemit,k1-qspi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x0 0xd420c000 0x0 0x1000>,
+				      <0x0 0xb8000000 0x0 0xc00000>;
+				reg-names = "QuadSPI", "QuadSPI-memory";
+				clocks = <&syscon_apmu CLK_QSPI_BUS>,
+					 <&syscon_apmu CLK_QSPI>;
+				clock-names = "qspi_en", "qspi";
+				resets = <&syscon_apmu RESET_QSPI>,
+					 <&syscon_apmu RESET_QSPI_BUS>;
+				interrupts = <117>;
+				status = "disabled";
+			};
+
 			/* sec_uart1: 0xf0612000, not available from Linux */
 		};
 
-- 
2.48.1

