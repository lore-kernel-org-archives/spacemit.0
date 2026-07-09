Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E613939AF
	for <spacemit@lists.linux.dev>; Thu,  9 Jul 2026 04:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783569902; cv=none; b=rawJv0JazmAK9VElrPePw7p1Y71bZMkJ306FSUTqRZvLAo6vi/2IAyXDSG0dwReudE8NhGFkpk3yirE+X40xhMh+zCiqLbLP9KTNzhQUEsrhtvzsoLnC69yVwJ0KitOrJrAHzuFjanBmNuJrBXkLI0cOVx4yAEv3wn1TTGclCHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783569902; c=relaxed/simple;
	bh=z3sYFVd8IsXgcaQ0PxQUtQdimHxLc4eG7buTt6GPwb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kq/kiSyZXeD4BZNwsGbvj0dL3K3XHQI89LPcKkdxRqFV3mCQ8o+6zux0dm3YaBIYy9SID/LQefN/zsrYV3v3j3MrpB7T9A3SUt6zZhyL61F1uWygiMRsU+BxHJ1d1sRGPRZ2y0fiip2KIwToWJ4oIoqD2S7muI/FpeJ5Zr9aOBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zupg9pFW; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zupg9pFW"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8423f236418so1012734b3a.1
        for <spacemit@lists.linux.dev>; Wed, 08 Jul 2026 21:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569899; x=1784174699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8A2Yz+iwfJcs0dFRSsIsJfrmmL9qanZsP+qCDJrYjw8=;
        b=Zupg9pFWav/Uz97bHAtRtnxY9kFReR2l4sDwA8LWwxlP5tADd1D88w3+wHebA5yy5E
         DFwVnyAWWp6wwWLZd/e5evrOnhM7CpohR3G7yr/B35T342vqihDm5Vxo620Vu67JConq
         ypyHDt5R/qSHMHNMxhV72BltZoc+FSGCBvQqwzGxKDsWn4nzEHAKNPiDO24zAQxEEgY0
         sEda98O1bKXZSBQrMncpyoSVucJqmxDYVJ3/L+1TjHw5Q8mXKI+76S7lgz7sOYFEpSCq
         0Xx77wEvieUyczy+x/yI/DFjXI5qfQBwaNaCBWOLGF9/pVHDxi5inTGQKCPimUB0Mn0k
         Yvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569899; x=1784174699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8A2Yz+iwfJcs0dFRSsIsJfrmmL9qanZsP+qCDJrYjw8=;
        b=hpfC9FZun90kdvhsbstsqlP+1XdKhVpnEEgh/nQu6pRO+Va+xvHaceekIxJuCCTFpF
         c4Mqb5xBhtad4LDgiGaaqqTrXKSHKu5LgQSrzH424iK4nXdQCNgUW+LhufWwBN1d25o1
         8ujNU1uz7k4cYX8T3erR9+06AllSaUe9W1xFyTiVLRNNoWN4CvinSdSw4KwQOnNtOU+S
         jWg1TsA2Htqj2TcvS5pfYfO4fYPLaP1k05RuL5UMcPemLmRVI5YU4Mpfq0IakSn/iFVU
         ZeyFkUSshNd90P6Z0U0xvftUb8AwXoAQx/dJMpPq3aF4+2dBcUgdXjmRe4EUtK3RGLwr
         UxwQ==
X-Forwarded-Encrypted: i=1; AHgh+RooMJRoE+uSSh1/jK9lQeG0gTJE+A+xWBYkL5clILne9EvKUm+/95Q+UBqLViI9GYxd4zmiuPjPyg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4hv6P16Ai9zpWLyRfcq71ioN5kSSDquh2baX1W4Hg2FMbEvqZ
	v+qclxwMFOoEhdwA6kCV/s7STx4UHxxVf3v9DeiwCYroD1XeT3IMxfNtLIjBj7p0
X-Gm-Gg: AfdE7ckvPdSFQwIH/M1tOYIUuU23IfGPnwwnnuTUj0W8qO4WnEaSTHQIfva+5n7ught
	JnlvgOlYRA0hb3UbKclcYvvF2EA24gYq2cUhYXkBUesYHvgWSzL3nk2b1SJ1Jz2CzGJgHNVYvnf
	667mLNUarze7GWShrrtg4LITmkKUdc43hlxiLfdUaCrdFRbf6X/6mAxTDa2MUcfLycAzYbQAnVe
	nYdSgeS7nvhyLS/vgqjImxNM6791qBr0vEgee4sPxVajNTANwWgtgmX2Xtf+7XgWKPQfw8iim/R
	uN+HE/nsiRCricWTdui7O1bzKFMdZ41FvBmVtwcqPT2H2WXPraDdASC8+begeZCzBSBFN+b/PJ6
	Yb7eNCZFsX80LG8yFDPS31pasCu/Vn4f+4LLuq4F8+RQ5iM5+AEDAc88QRIkogutFiIK46bbHCk
	U=
X-Received: by 2002:a05:6a00:2912:b0:847:759e:f61c with SMTP id d2e1a72fcca58-84843433a23mr5150837b3a.47.1783569899165;
        Wed, 08 Jul 2026 21:04:59 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848593a591asm387242b3a.26.2026.07.08.21.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:04:58 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/2] riscv: dts: spacemit: k3: add USB controller and USB phy support
Date: Thu,  9 Jul 2026 12:04:13 +0800
Message-ID: <20260709040415.977784-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709040415.977784-1-inochiama@gmail.com>
References: <20260709040415.977784-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add all USB device node to the Spacemit K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 13 ++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 42 ++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b89c1521e664..2a6d35a64d5c 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -182,6 +182,11 @@ dldo7: dldo7 {
 	};
 };
 
+&combophy {
+	spacemit,apmu = <&syscon_apmu 0x11>;
+	status = "okay";
+};
+
 &eth0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac0_rgmii_0_cfg>, <&gmac0_phy_0_cfg>;
@@ -221,3 +226,11 @@ hub@1 {
 &usb2_phy {
 	status = "okay";
 };
+
+&usb3d_u2phy {
+	status = "okay";
+};
+
+&usb3d {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668e..82c9e2da82e9 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/spacemit,k3-clocks.h>
 #include <dt-bindings/reset/spacemit,k3-resets.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
 
@@ -438,6 +439,47 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		usb3d: usb@81a00000 {
+			compatible = "spacemit,k3-dwc3";
+			reg = <0x0 0x81a00000 0x0 0x10000>;
+			interrupts = <149 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTD_BUS>;
+			clock-names = "usbdrd30";
+			resets = <&syscon_apmu RESET_APMU_USB3_D_AHB>,
+				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
+				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
+			reset-names = "ahb", "vcc", "phy";
+			phys = <&usb3d_u2phy>,
+			       <&combophy 4 PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,parkmode-disable-ss-quirk;
+			dr_mode = "host";
+			status = "disabled";
+		};
+
+		usb3d_u2phy: phy@81b00000 {
+			compatible = "spacemit,k3-usb2-phy";
+			reg = <0x0 0x81b00000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_USB2_BUS>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		combophy: phy@81d00000 {
+			compatible = "spacemit,k3-combo-phy";
+			reg = <0x0 0x81d00000 0x0 0x600000>;
+			#phy-cells = <2>;
+			spacemit,apb-spare = <&pll>;
+			status = "disabled";
+		};
+
 		usb2_host: usb@c0a00000 {
 			compatible = "spacemit,k3-dwc3";
 			reg = <0x0 0xc0a00000 0x0 0x10000>;
-- 
2.55.0

