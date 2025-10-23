Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A227A34C151
	for <spacemit@lists.linux.dev>; Thu, 23 Oct 2025 17:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761242376; cv=none; b=kF6r0lr/Y4JK356Bc8PqmoP3b0kWFTv+V2X1ndoIbM4jeUeWZGq+FEapTw16aMIMo4PlrxRdHMujr7VzhkJ9gauaKUMIZXU+gCgezcUIjcwaHwPxf5As+2R0XX81UsFUyFlTOie8L1LKB8M0wMQrlohh3+ZB9X1fnklRHKANK5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761242376; c=relaxed/simple;
	bh=b5TthaVgozjRNo6oynm9yNvs9UvZId9+fMO7VfpmIr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I/+V5j8rRnAJNIH3H6pjkmJzIOdzRuoZpUX1kr5cQCnGdSHmz7Vi4VWDdvxMJ5VVqUh28sVSYNqXISIzw54ZOwdXIBu1yJNVfkFyDxhPjlOzyil1NBkZ7FVO5AORaTzGBTfugsJamI+dHReDWC1vWOqiYY6LbkEy/EgEv3Xymwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=BJ+TasjM; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="BJ+TasjM"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-33bbeec2ed7so1106147a91.1
        for <spacemit@lists.linux.dev>; Thu, 23 Oct 2025 10:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242374; x=1761847174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/0R3e5CbG34zw1DZffq6WeOG5UrZqNxxyPe6S2P55U=;
        b=BJ+TasjMOgENBi0xsaG7YNHjIfzuwAHmVKnrGKu5CWTRlb9k4sjdLy4TFysybENuHF
         vzhg9EsihkF0dF69BfGLof26O6NG0xG/8FyeAh9sX6FK2RX7rsGO4eFpIEUEORu0fHMP
         B5YLWuZ9edjlzgmSJnPpHGwAzJYR/VorMiMAF1UV1X0ctgTdKLkGEV/AgjALRyz7fdzH
         eaBxfKYe5oGe+rnc9mjTeIh6N/iQWF4edxQe5zC4nwFViK0eGGsb7kIVJCk8kevbCQyZ
         J32PLUdpesXz5M4zz9ZNXQYkToc+Hkb5qRn4VougUVrKh0EN3RNn3e5Kcrh3H//hpgkl
         By+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242374; x=1761847174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/0R3e5CbG34zw1DZffq6WeOG5UrZqNxxyPe6S2P55U=;
        b=JW59oKaiZ7wPx8cjX+tkppwvY5VZZc82/jKiWEbkb1GMwdykqoiqZNNuHy4Q2+GAFB
         b35H4CJTrbmpMG1ulfHd1jgceYY9TJT6JPzf/4iETn87B6NCDnHGdiVzVjabLAczPQQV
         a50FamtfmmLd0SJVXR2k5JaMsbhXn2LitVzDOtdjeBNyEhRXRHr+NaYTHohBDPwQK4W1
         DBkjJMCh8ReHUdMW2zSjl+WV49u3m4WFjSQTK+/3dtmdevZF770UxJ600aEX8rbe7You
         R7CCmHURmOoKgEgbskVnFPoc1lyFfTEuQpmvcaFcnUUR0SHxfsKsPs3TyBBzE+o0YIRj
         IMjw==
X-Forwarded-Encrypted: i=1; AJvYcCUjflu2It94WKWWXpBAg4rvUxQ8BZqQFtWGyBgltOaMp6wq0uHtxFMsjB4A6cn/o8WFuixe/hn5QA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+BuKjlS7WChS3Z3r2ukAWlr2pa+3I++HkNIgCmF2E1mIbg7DM
	sDXRCWo0YDeGO0gisENDBd13bDEKltciSAsY4/TeBXhvtg/0n/1o2CDnicrZzDWsb0k=
X-Gm-Gg: ASbGnctmSWhrWMUxC4Tps5vhE9F58+vsupUTTNDKATCfTmAbG6KYIItEWBYfDtHmsvM
	hEdh4S4pgHIyvc55DQBEtBT7GABY6hB7CB9CwcZkmSnam0UIWlwwAlwNbvy8i3I+AJE3yxZ/In5
	VH7yBUk1hivgaYMzXgRUZPR5GdP98EAQPMep7dxnQYn3Xe2AIUjuw53zOkyjzoFY6Ut72j9ndNR
	j4Oh8hO9JnptxzPEoz/2hu6T6+OFRRLLxFBt43+U6sQJKBcP7eAMpzHmROsVJYyfq0pHVzKyqvV
	c+VjPb9JI7qTO102AlEFUEW4L3vUc7m/0f4n+dM+6eeNhw/Z6yVIOvwhRnqdo9IGkzwVjDToreB
	AS6E3BqW3YZr9J2rhTZshxcUYg+K55vFftbElNeoxoReIIMJx+ueXLXmS2uxeWESMcf7UtxaG4e
	xBWKPyaQBXPsqi4/MZ/+yxCON6iDkAjiNDPw==
X-Google-Smtp-Source: AGHT+IHVBHP0VNMgL4i11Hlpfi39kzITsFSqD4nvg71vtIarn49Ipd8vSMUYzNOXYVvvOjEu2JoRZw==
X-Received: by 2002:a17:90b:1b05:b0:338:3789:2e89 with SMTP id 98e67ed59e1d1-33fafbab393mr4375317a91.10.1761242374092;
        Thu, 23 Oct 2025 10:59:34 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:33 -0700 (PDT)
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
Subject: [PATCH v2 8/9] riscv: dts: spacemit: enable K1 SoC QSPI on BPI-F3
Date: Thu, 23 Oct 2025 12:59:20 -0500
Message-ID: <20251023175922.528868-9-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023175922.528868-1-elder@riscstar.com>
References: <20251023175922.528868-1-elder@riscstar.com>
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
2.43.0

