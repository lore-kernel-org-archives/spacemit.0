Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9EB36A60B
	for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 19:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761333367; cv=none; b=K3giudStQKMJIPjX5JkmVabqf1rmrFauR6nHrtLhC21gcWYQqi9eIYLkCl3irmJwRk5/EOPBPDWTm15FrAjnzJJPMOm8UKjaoUieNujup7QATo7xoM6ah9JL0OZxkqCpu10pb5uKc7MWp54s325mLDfL+aPOuELgbm5gQ9OYu6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761333367; c=relaxed/simple;
	bh=BzKRuhxyonoQsuopPQdi/8jOGmwxXgdxHX/BXxXKdik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RIhDmSUNIm2hXRDeXPKw4uhWMkstRgo9zVeP4W8et/Up0qXSnxTi+Fhw+L0LXbqDz4kFdosx5GhU1l1IRYy94BSOf7Ae2uTawtZqj+e8I57hRnSxF1wmKhhqRbyhuvs8/qYyTLlZL415JcnBnv6ZnujcHHGLR4H7+rXbpjwY7nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=YJSiI4fU; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="YJSiI4fU"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-430ab5ee3afso22587915ab.2
        for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 12:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333364; x=1761938164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdMeTbCiZFImBLpdSseleACrRi7JJpgsujeJgyCXmeA=;
        b=YJSiI4fUeqkPVrEPkVEYp9zt66shG9VB0aDkN7i+KZADKtw6YuH+d+luP+UAMmLsUS
         2MGT3law+1uKICJq+rWq6RsHOfzpRX5lTmtKZy29mPW7SH50B7YCWMKjDm3hy6rr8HKK
         2b5jfGNBcRc078TCQifaHQkgvGUlClHBHHat/ZD1vvYRPEUT2F12+NrUofRQA3iQDyoo
         FPvyvnxmwg6f6OkeJK6VY/H173cHNWxG4OVWfQvlHd1oD7Ya08aULuudHKqvqkzL/Zs0
         7c+7FQ63Ll71iq2npsqgcncuoZ0pNHbvTEW1u0xS940eJrgKmOsPXTT1kbZvVBLxF51H
         pUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333364; x=1761938164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdMeTbCiZFImBLpdSseleACrRi7JJpgsujeJgyCXmeA=;
        b=oYSYVdCVGj+KtTXdiS4+0tFrilcXH9rE7scwuF1kHiKXwetM0CNTU6c43puDo1rkai
         PNF5gRlnlDVltJ4ykqscwRe/25bdGC5NCt8f9Ly26bjP13RJZNTBnejItgYVlYKVqgJf
         bOoHg19FS83bghUMDgYqG2Nd3hbojD4hMvnriBrumk9CdRUJKq2UjZjandvyhC0AsPcb
         UKXG+0XkJmYe+GnRWHxNAXnIFenYlNiUuOKe90ReyW01ezcfpJRTypMof2VUC+VLXrL9
         tYa7FxyBHrhlwztn17IytGfFxIgKEceOdXIFWCeCvZWZdAqQLWAAICA8LyN3gY/ghoZU
         SmwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4RXwJo1N7o49Q9IAG87z505aZVp5h0WYG5O4lBr8ShYuYHs0wW638Sgqg5FgzTjXnD6PquwqSKg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPN2T0IqNPeVZbPe1AFFn0KuIxbL8NFQGrwREiMDBCChb+FNxV
	BqHGsnVTlngDibpnEcd/hkTxPLjJoqNNaKE9P75KHbb072YIIHZODjkFN80e2jeoUZY=
X-Gm-Gg: ASbGncu98N/7lAdaWdVP+eFvV5Gud2szedHnd1WY2+eKhiNY4Uyq+d2ffUAXp0vTDqp
	kZkMIFrLamg6eEt9smFiHEjCcvcOyyCE/8WqQW5YXvoAnaTp/cSw327+cTOGMQvKb3WpcwJUYUc
	3dlDsWbO+/Gf5EZiUssc+2S9vFZnr2389LaZTwWr0p1+CY39NPT94Slqt60zhHltOsEGWrGvkJL
	zFLEuBwhsrz1g9b1Mx3EM39Efsez2Qgk7hQKtB2OdB6YXjkaUBYN1kBz4YkDC/0dFORP8HviKsu
	8RqkNcfOrBll5najMUVCl5+kp1qi8alvbzD8ZhzfV2qZRZ7T+Z9CXWN0hnNkDsA4oPZQ9vxbe+A
	0ZkSUpjmL8RLKo4I9LzPY/3g3itGZrkKTOVE7+zQeByHFAsuLVmoTuBKzmCID1/SkeEcCnh+5w7
	ec/bG+Pt/659IOBgrBumeLZ+EwbY6uQ36dMOJNE3uR3kA=
X-Google-Smtp-Source: AGHT+IHdac+yNZmM0pe7fb5MedOFJ085tc7Rho0L92xEnV6VaHpJ93hLc5aHoV4AFkJA7fa9m7wHzA==
X-Received: by 2002:a05:6e02:348f:b0:430:b290:b6c5 with SMTP id e9e14a558f8ab-431ebf86403mr45545195ab.30.1761333363919;
        Fri, 24 Oct 2025 12:16:03 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:16:03 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: Frank.li@nxp.com,
	guodong@riscstar.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/9] riscv: dts: spacemit: enable K1 SoC QSPI on BPI-F3
Date: Fri, 24 Oct 2025 14:15:48 -0500
Message-ID: <20251024191550.194946-9-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251024191550.194946-1-elder@riscstar.com>
References: <20251024191550.194946-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define DTS nodes to enable support for QSPI on the K1 SoC, including the
pin control configuration used.  Enable QSPI on the Banana Pi BPI-F3 board.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 21 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 ++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 33ca816bfd4b3..02f218a16318e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -113,6 +113,12 @@ &pdma {
 	status = "okay";
 };
 
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_0_cfg>;
 	pinctrl-names = "default";
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

