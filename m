Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D2330EF80
	for <spacemit@lists.linux.dev>; Thu, 21 May 2026 14:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374725; cv=none; b=HNU+EnH00Ejtp2uRTQtqEJ6/XtnoVJmbVnY3T0rrCzmJOVMN0KQWUaXlSOBU30nNInOyVH52FP/JfGLrSxI/kYQiVhSTUSUduiH8S9D2+BcgRSVZd3KQUtz4UQEOEdjLnK0L/dg1XFsCzwB/EZ6QKVPIXEhqxqsubNGV0ojqvwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374725; c=relaxed/simple;
	bh=jeLdidJLllZzK2MXT62T70ecJUPwLSRHEx1l1dcK0nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r6htDXRl9s4UghYmITneJqH6rWNjSy2ZMUgb8MupTYtQylCguBcwZDorPdsHEx7qgh5XcGGXMh4faiCfWnntsxoPtvh+awliDgxgfv5KXAJhpTLozpmXPaHWSzdXeSr6IIngQqJq605abxZUdt+eg08kLTB1O27xuTyO6hJbCBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QasiDSfW; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QasiDSfW"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2be1dd4af34so46347465ad.1
        for <spacemit@lists.linux.dev>; Thu, 21 May 2026 07:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779374723; x=1779979523; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvrZ9HyiEaruMBycCfFZW1FZ0Z1ilz+f20q7BDvb5rI=;
        b=QasiDSfWZnDzVHr0HTzdpHf7CE9uKdV7B0ZOPYQwhBLqCw6CqL776nCiG4rnl0XqcI
         9tQyjz1Zc5FlyoBuJNhhV5r51RzNbZxS3rA123HOD5mMIX1i0jL7zXLq9g9Mv//wc0iY
         nb8qQdZTBKe+x9N9NuB/OZgEUWLhCLfRMviC1k0ibjyFztGDV08ttKh2pHqOTMEY0TN2
         a0TiRN/5GOBP7BCs7prGaKfx6NJdmLac06lCS2JnfnAU6pzwYzBvb6Ps1sz+tGdYgWQh
         iGvm3qn8BjY5OFOPypYcrMDP6Ra5e9fx6I+sL/chLg17cMpFlmioqSE+KmdzNLvmi8g9
         fz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374723; x=1779979523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fvrZ9HyiEaruMBycCfFZW1FZ0Z1ilz+f20q7BDvb5rI=;
        b=JKick0dk4CMz98vtsHsdouub2S3YmuaIW2s+7s17VeDODZH1QFgu+KywZMxjne/wgZ
         1Jt14haRHMjDR+Ace71KHniSSGoOYS6YtucmtFOClm/5kiDOVn3mZZ1KHSyi4laEClA1
         wQflwd0e1OGuAT9MBiway0zeOpZ2IqHNzxURHk3fP3qD6ql9Oq+AyNv6yDrU2fV3Xtzp
         lM9+QEpIiNrYX0Z5i2h/JqIKpui2I4EhMEbqdmmjC8RXQZRhmEI9JGJdUYITIuXsPWmb
         YQYnPyQOsOdFaRNISR4AewIKq2Lu4F3Zd7cQsxq/Tnkfu+0wpLq0jlv7qHDP530Crtfj
         TnVg==
X-Forwarded-Encrypted: i=1; AFNElJ+ip75YSzNqsUdLHxOfPN4RfaJwbHmFboTXq6GqsWdpbqcJMXC4UqavxQgA3Lfc6wGCVTI8TwZsZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYMQnmMzRphhMJlNuuSRGAj2xN6fihhPrUAXhHHYcqpF9rSdzJ
	1kTwwfFrhvkf3kqn8YyrpvWn8qI6RPHKa7twGIeY16llSN+HbsE1x6cKuLXPo1kzTYUduw==
X-Gm-Gg: Acq92OH8mlnNOHm41j5AuIkYNoC5IjXsgcCRdINpnOOXNwji9/MO4+eVBxxW9yABwvA
	25b/8j4+rCyXPzIeilgAajvHpjEuOWbHGg9nA+DhH6Iw8fAwyWkp6zi7GUwOiC/UlsbTTVMrYx8
	/nR4Al16NWXrhnAaaCFmfAW8KqPhJlrhlihohlulJn0+I+liJqaLLS48ri//yh6g+npYDsYl2+K
	CCasELeY9LzTkzA1pz2Gu+EB9TWEQFCHiW6BkQgPSj8XDesA7dB9hWZRwmufoBuiSVJ5z+CjHOl
	+escH/7mNP/GHrfsxkvCJRAsNHocH4WY71F6HVIjEY5dgxTZgPpGhW+BZFToaLPkxX4lw90ucNL
	zYqToQIBCb2PVEhxu7oWs6v4CRpn97ai57tyFqC75J8hYiqlB8ja2YQfGHjJrj1s24jFzf3fR+/
	w4tnXwgta9CKZbRCLrOUdIOiG/oOe4+A==
X-Received: by 2002:a17:903:2301:b0:2b2:4029:d781 with SMTP id d9443c01a7336-2bea3379db6mr34408925ad.20.1779374722230;
        Thu, 21 May 2026 07:45:22 -0700 (PDT)
Received: from [10.240.146.115] ([2.27.148.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea990f667sm13261475ad.62.2026.05.21.07.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:45:21 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Thu, 21 May 2026 22:44:46 +0800
Subject: [PATCH v2 2/2] riscv: dts: spacemit: add QSPI support for K3
 Pico-ITX
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-2-52bce26e5fd8@gmail.com>
References: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-0-52bce26e5fd8@gmail.com>
In-Reply-To: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-0-52bce26e5fd8@gmail.com>
To: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Wei Fu <wefu@redhat.com>, Zhengyu He <hezhy472013@gmail.com>, 
 Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3846; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=jeLdidJLllZzK2MXT62T70ecJUPwLSRHEx1l1dcK0nc=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqDxpyRg6BUTVWQauu6YPVthr2PheGUvA+y7vxf
 oC2HwfnutOJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCag8acgAKCRDN9pw2gLgN
 2Gi6D/9lB6LxcH1junWH8uO8byFxvvzdHo5m/u4ozxCzl/DXFunPbljGCUF9YA6/u1FyRTGzsEg
 4RHFapdf+RPxloUAj8KtAVnFf2I9bnx58IVdfyXGGC9d7EYR85eMDNDkhK8CQquJVsAAxnzuOjr
 wVtpdY3CXXnHWAGMPGo4dl8GZWHlAYr7/qYiXWq4jmqnhtABaPFy0thDFGr9YobPEjQVZCVfW4j
 tWQTuhztPE39JItO3BUK5Aclje/0Nv6J6V5O+1YqqaGx4JJM7+v4f9FH9tQ+kcNwmodJPDfst4J
 j4EDvb2f4BFfegY9Th8Hl3Zib/hULtGxSaC/f6EaSbfPXyqVF3KQK+MeohhDfEGENLQI2kXZP2m
 go1f311JLGKo0LqPljr78SVcPiGkfbgIVDP++gh2yUo4J8/5KTz3GeMgdbmCqV2mDyRmd46FwUe
 to8pCyZpI0DDfJYZBTsKSymyA/G2ljsBFu/AS47wg8wmkhIxuhUEjScXaZel3+OKblSwQkRReOi
 FXatx0LNj8wqQ8yRT9NG1s/q8W0Bm+cdAAtWDMZhfNzcLZJtMxOfqkHveGA4dcq0f2IHXQHXAd8
 dki/lQLAugC0kcMsiKew3JD2HU/S9heCeoo99vngLvOzDtqtCT/Th5ez7jrkoH+DoZwDz99PRkK
 bHA9c/bHLCyQX4Q==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959

Add K3 QSPI controller node into k3.dtsi, and add related pinmux
configuration.

Enable QSPI on Pico-ITX board, and describe the NOR flash which wires
to it.

Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
Changes in v2:
- Add "spacemit,k1-qspi" fallback to the K3 QSPI compatible.
- Reordered Signed-off-by trailers.
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 58 ++++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 21 ++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 17 ++++++++
 3 files changed, 96 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b89c1521e664..e90e17895bb2 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -200,6 +200,64 @@ phy0: phy@1 {
 	};
 };
 
+&pinctrl {
+	qspi-cfg {
+		qspi-pins {
+			power-source = <1800>;
+		};
+
+		qspi-cs0-pins {
+			power-source = <1800>;
+		};
+	};
+};
+
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <26500000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		vcc-supply = <&aldo2>; /* PMIC_VCC1V8_QSPI */
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x20000>;
+			};
+
+			fsbl@20000 {
+				reg = <0x20000 0x80000>;
+			};
+
+			env@a0000 {
+				reg = <0xa0000 0x10000>;
+			};
+
+			esos@b0000 {
+				reg = <0xb0000 0x100000>;
+			};
+
+			opensbi@1b0000 {
+				reg = <0x1b0000 0x60000>;
+			};
+
+			uboot@210000 {
+				reg = <0x210000 0x5f0000>;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 23899d3f308a..5d9763791180 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -56,6 +56,27 @@ i2c8-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	qspi_cfg: qspi-cfg {
+		qspi-pins {
+			pinmux = <K3_PADCONF(138, 0)>,	/* qspi dat0 */
+				 <K3_PADCONF(139, 0)>,	/* qspi dat1 */
+				 <K3_PADCONF(140, 0)>,	/* qspi dat2 */
+				 <K3_PADCONF(141, 0)>,	/* qspi dat3 */
+				 <K3_PADCONF(144, 0)>;	/* qspi clk */
+
+			bias-disable;
+			drive-strength = <25>;
+		};
+
+		qspi-cs0-pins {
+			pinmux = <K3_PADCONF(142, 0)>;	/* qspi cs0 */
+
+			bias-disable;
+			drive-strength = <25>;
+		};
+	};
+
 	/omit-if-no-ref/
 	uart0_0_cfg: uart0-0-cfg {
 		uart0-0-pins {
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index d4be8de8fc6c..63dc36f49871 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -878,6 +878,23 @@ pll: clock-controller@d4090000 {
 			#clock-cells = <1>;
 		};
 
+		qspi: spi@d420c000 {
+			compatible = "spacemit,k3-qspi",
+				     "spacemit,k1-qspi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0xd420c000 0x0 0x1000>,
+			      <0x0 0xb8000000 0x0 0xc00000>;
+			reg-names = "QuadSPI", "QuadSPI-memory";
+			clocks = <&syscon_apmu CLK_APMU_QSPI_BUS>,
+				 <&syscon_apmu CLK_APMU_QSPI>;
+			clock-names = "qspi_en", "qspi";
+			resets = <&syscon_apmu RESET_APMU_QSPI>,
+				 <&syscon_apmu RESET_APMU_QSPI_BUS>;
+			interrupts = <117 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		syscon_apmu: system-controller@d4282800 {
 			compatible = "spacemit,k3-syscon-apmu";
 			reg = <0x0 0xd4282800 0x0 0x400>;

-- 
2.53.0

