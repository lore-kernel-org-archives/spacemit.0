Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2088D283CA3
	for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 13:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646823; cv=none; b=cmYWujMDftx9R3d+RytHw5J/g8fXnBCpLUcXolw+zNGk4Y65t/3Q5jQhhi+okQXV9sEcAYm8E4AVdzH6f3JmPvjTbTBixOzQug2xDxzFLzSSq/GD0pjYZ6ZFi50zCh6NQ8M4O1ZESVAwDmm3uJrMguIKcbQN9nt3K30fTtIzBkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646823; c=relaxed/simple;
	bh=OwZYPy6rlzwZIArlF9lrCLQyQuHFt7ZjSzgDcEQMuBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IM9YBBTBQdTYePWTYW0gwIUhQjgO1LsK4on+ESoruBV2OlQmHJQc3VMFzIz4yibaLhhxpwNLqVgzlU15QKOZDVg8FzktTXmF8BmHbNUB8Nk2pGjO5er8kFJRb0F3Vgf+wYeBvlEx+u+gLtmwuleBRAN5G/NKMUOt5RMWch+6w9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=zcO/LULf; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="zcO/LULf"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-235e1d710d8so81835895ad.1
        for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 06:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646821; x=1750251621; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wfkuc3Nm6XNXxPvRJIgpzIHQXi51C7ZBujG/Lertj5Y=;
        b=zcO/LULf7LPq07zkWAKTPpo3qhPUno6r3cFet3p2AixF9hqsZRePKgU42+eUCOZEWq
         El+b1TZ/j35r6DbS56jFkV9/YYaSYug/AP6E6uz9fC3V44QZB3kRcR3m7SAH1ASwItYY
         5Hl+Y55bSKmvQCFpFCnsDeX6KKXeNgno3Df6+AUEe4L/RHtJ+xNskFXW5FVghnHFnOLl
         exJa3LOqmgLCxfH1kwbRwKLBp5U6hxqmR3W1oMjHLNimXqfT/+A+64GT7RXB//VDn2yV
         ax9dNQbDC2Hq+9I5+3w6i8ZO5CK2qat4petLgW3nN75OetbjLGy0uxqHvgyeNCnjthnx
         bKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646821; x=1750251621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wfkuc3Nm6XNXxPvRJIgpzIHQXi51C7ZBujG/Lertj5Y=;
        b=U6rZYDM1f4Xr1XWu+YPRh6OKN/0JRKkxgcxJJ78LwJ+y6sDkfSYLfzY50bQGzavcY2
         poN21+LmCMEM5bZXPvNpzizP4dotH6fzSSaPUiZv1R7UMnHZ8gS48LS3izw/3dDLRpms
         c7NWOMdZ68oTj/Xq5rqzNlOUTEQxUowHKOrJXTCtLIU2V84D2DkwZM59XyzYeukd93Qk
         6a/CeJwp4cTzZrGM8dii8ftus3rvXV4wKS1csVdabD1+YYy71IzpbEBHHqiXJTjX6ni/
         7W6blB7mOSVg4OQcighQmt2RNW1Z7fmheYmZYteCm7d2bJ4P2XHhllPFeCLsvZFkPf6a
         7ksg==
X-Forwarded-Encrypted: i=1; AJvYcCXs2WFP1wi7IgdQBILspEuMNi6Tv0x5kNaEaSFTjPXRct/Q3ObR2swgwJQNZBvDJ58ZEU5O5LeVTA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3yFxmhU7QI8ltxgv6mP5ZCbFH9gH7yP2jDkZ+PjlqjYWD64zp
	pITMXLmu63tD9cwAv9Lu7HM9ievWmggLHL4YegEzKpGWO/xC03R8cXuUQ/Wh2ob/gB0=
X-Gm-Gg: ASbGncu+/WKookDp6gYIdc/izV/lTkQbVpJsPtzlKRlYxLL9iQjUlthGZDnA/MIfr1u
	Jc/ivK5Atj71QuAYrlZItFJqWODsPuKSstocyykZk0zSc82IDq023DGXE+wu7VfjdYnC1FpfDu/
	B5E7D+/024ttdmht/lRa4IOdQSb68aW+iSZYnfLZSoxW4GSxFjcQczS03BdMa6ZbDQEuHiC3eOn
	q8Lsul7DPv0ynlpMXq1qrtVhwGI1QpbWI0x0MP0uTA+Pfim7E9SCqZ9SVEEJrnT9q4RTWCe5Tst
	B5l4QYWgNvYtpL+QhuAS/ybOJs4JHn80uFfrKU9wG3VNDn/C7d2+7aEGPyByXx1vJbsvEUtI12o
	cVbzfxsAP8SKnD8ObPA0xIQ==
X-Google-Smtp-Source: AGHT+IGTQR16JIfczgjiJDhE97qKg0H9XYRosojidd3FLQgGETflIpsSTEjq5mENRWeE6+WcGFS80A==
X-Received: by 2002:a17:902:e5c6:b0:235:caa8:1a72 with SMTP id d9443c01a7336-23641b19943mr43885485ad.30.1749646821466;
        Wed, 11 Jun 2025 06:00:21 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.06.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:00:21 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	emil.renner.berthing@canonical.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	joel@jms.id.au,
	duje.mihanovic@skole.hr
Cc: guodong@riscstar.com,
	elder@riscstar.com,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 5/8] riscv: dts: spacemit: Add dma bus and PDMA node for K1 SoC
Date: Wed, 11 Jun 2025 20:57:20 +0800
Message-ID: <20250611125723.181711-6-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611125723.181711-1-guodong@riscstar.com>
References: <20250611125723.181711-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorganize the K1 SoC device tree to better reflect the hardware topology
by introducing a dedicated dma_bus node that groups devices sharing
the same address translation scheme. This change aligns with the actual
hardware organization where devices are physically connected to different
bus segments with different address translation characteristics.

The changes include:
- New dma_bus node with:
  * DMA address translation ranges:
    - First range:  0x0_00000000 -> 0x0_00000000 (size: 2GB)
    - Second range: 0x1_00000000 -> 0x1_80000000 (size: 12GB)
  * All UART devices moved under this bus to reflect their shared address
    translation domain

- New PDMA controller node under dma_bus with:
  * Base address and interrupt configuration
  * Clock and reset controls
  * 16 DMA channels
  * Required DMA cell properties

The PDMA node is marked as disabled by default, allowing board-specific
device trees to enable it as needed.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 234 +++++++++++++++------------
 1 file changed, 128 insertions(+), 106 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index dead05a3c816..557feac860de 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -369,112 +369,13 @@ syscon_apbc: system-controller@d4015000 {
 			#reset-cells = <1>;
 		};
 
-		uart0: serial@d4017000 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017000 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART0>,
-				 <&syscon_apbc CLK_UART0_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <42>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart2: serial@d4017100 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017100 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART2>,
-				 <&syscon_apbc CLK_UART2_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <44>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart3: serial@d4017200 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017200 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART3>,
-				 <&syscon_apbc CLK_UART3_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <45>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart4: serial@d4017300 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017300 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART4>,
-				 <&syscon_apbc CLK_UART4_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <46>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart5: serial@d4017400 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017400 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART5>,
-				 <&syscon_apbc CLK_UART5_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <47>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart6: serial@d4017500 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017500 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART6>,
-				 <&syscon_apbc CLK_UART6_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <48>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart7: serial@d4017600 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017600 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART7>,
-				 <&syscon_apbc CLK_UART7_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <49>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart8: serial@d4017700 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017700 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART8>,
-				 <&syscon_apbc CLK_UART8_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <50>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart9: serial@d4017800 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017800 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART9>,
-				 <&syscon_apbc CLK_UART9_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <51>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
+		dma_bus: bus@4 {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
+				     <0x1 0x00000000 0x1 0x80000000 0x3 0x00000000>;
+			ranges;
 		};
 
 		gpio: gpio@d4019000 {
@@ -792,3 +693,124 @@ pwm19: pwm@d4022c00 {
 		};
 	};
 };
+
+&dma_bus {
+	pdma0: dma-controller@d4000000 {
+		compatible = "spacemit,pdma-1.0";
+		reg = <0x0 0xd4000000 0x0 0x4000>;
+		interrupts = <72>;
+		clocks = <&syscon_apmu CLK_DMA>;
+		resets = <&syscon_apmu RESET_DMA>;
+		#dma-cells= <2>;
+		#dma-channels = <16>;
+		status = "disabled";
+	};
+
+	uart0: serial@d4017000 {
+		compatible = "spacemit,k1-uart", "intel,xscale-uart";
+		reg = <0x0 0xd4017000 0x0 0x100>;
+		clocks = <&syscon_apbc CLK_UART0>,
+			 <&syscon_apbc CLK_UART0_BUS>;
+		clock-names = "core", "bus";
+		interrupts = <42>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		status = "disabled";
+	};
+
+	uart2: serial@d4017100 {
+		compatible = "spacemit,k1-uart", "intel,xscale-uart";
+		reg = <0x0 0xd4017100 0x0 0x100>;
+		clocks = <&syscon_apbc CLK_UART2>,
+			 <&syscon_apbc CLK_UART2_BUS>;
+		clock-names = "core", "bus";
+		interrupts = <44>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		status = "disabled";
+	};
+
+	uart3: serial@d4017200 {
+		compatible = "spacemit,k1-uart", "intel,xscale-uart";
+		reg = <0x0 0xd4017200 0x0 0x100>;
+		clocks = <&syscon_apbc CLK_UART3>,
+			 <&syscon_apbc CLK_UART3_BUS>;
+		clock-names = "core", "bus";
+		interrupts = <45>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		status = "disabled";
+	};
+
+	uart4: serial@d4017300 {
+		compatible = "spacemit,k1-uart", "intel,xscale-uart";
+		reg = <0x0 0xd4017300 0x0 0x100>;
+		clocks = <&syscon_apbc CLK_UART4>,
+			 <&syscon_apbc CLK_UART4_BUS>;
+		clock-names = "core", "bus";
+		interrupts = <46>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		status = "disabled";
+	};
+
+	uart5: serial@d4017400 {
+		compatible = "spacemit,k1-uart", "intel,xscale-uart";
+		reg = <0x0 0xd4017400 0x0 0x100>;
+		clocks = <&syscon_apbc CLK_UART5>,
+			 <&syscon_apbc CLK_UART5_BUS>;
+		clock-names = "core", "bus";
+		interrupts = <47>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		status = "disabled";
+	};
+
+	uart6: serial@d4017500 {
+		compatible = "spacemit,k1-uart", "intel,xscale-uart";
+		reg = <0x0 0xd4017500 0x0 0x100>;
+		clocks = <&syscon_apbc CLK_UART6>,
+			 <&syscon_apbc CLK_UART6_BUS>;
+		clock-names = "core", "bus";
+		interrupts = <48>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		status = "disabled";
+	};
+
+	uart7: serial@d4017600 {
+		compatible = "spacemit,k1-uart", "intel,xscale-uart";
+		reg = <0x0 0xd4017600 0x0 0x100>;
+		clocks = <&syscon_apbc CLK_UART7>,
+			 <&syscon_apbc CLK_UART7_BUS>;
+		clock-names = "core", "bus";
+		interrupts = <49>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		status = "disabled";
+	};
+
+	uart8: serial@d4017700 {
+		compatible = "spacemit,k1-uart", "intel,xscale-uart";
+		reg = <0x0 0xd4017700 0x0 0x100>;
+		clocks = <&syscon_apbc CLK_UART8>,
+			 <&syscon_apbc CLK_UART8_BUS>;
+		clock-names = "core", "bus";
+		interrupts = <50>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		status = "disabled";
+	};
+
+	uart9: serial@d4017800 {
+		compatible = "spacemit,k1-uart", "intel,xscale-uart";
+		reg = <0x0 0xd4017800 0x0 0x100>;
+		clocks = <&syscon_apbc CLK_UART9>,
+			 <&syscon_apbc CLK_UART9_BUS>;
+		clock-names = "core", "bus";
+		interrupts = <51>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		status = "disabled";
+	};
+}; /* &dma_bus */
-- 
2.43.0

