Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8542D3A1D1B;
	Thu, 26 Mar 2026 18:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774550289; cv=none; b=hUUz6HmTPji45lSH5Tqn9CRdNaH/OOvdnSRfbj2FhH/GD0wABwX8qDWurMbWBzDY6NaiBZA0Orm83Hmb6h4uiaLbMAfyyGxWcquqnFozn8AKPCm5rVQMBygE0LEFcF4sII++ezysh/hNh0RPYYuJ08n2N1i7nriWLfmSwnR62nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774550289; c=relaxed/simple;
	bh=KCWBbfrTOUMcx0cIWGLjyLL5xytign+TYvgFQPTLs14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RBjj3Rry+hFp31DjVEJosFjwWE5t9ji/qUXqB9VQ1Ghw016xulv9ILntPt8jqGE13x3JrQmb/xZlKsi40N8sm3a8fgjlOn+L0HsvZvyZJhjIktMOlO7SxrfEQ7Kr4l9jDpt2xD3F3Sfb5M9KnlTQ+b10RpnYXIU26u68SqbpuZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=hJiSQDph; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="hJiSQDph"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=3on1Dl9hWGjs68TWWHrwVaSnOV+T0jR1PO3sYA88TQ4=; b=hJiSQDphQUuf9rSArYSlR5Vsg/
	b+fDKy2WRFniSRVCyGy1MsMD9ZV4dgerQvWFf8dj0B3XpDkpaNXzuqPiZuKoU6ByffzbXdf/pGVK5
	lv5CY8DjUE9hFZ4b6hSflsGSvY5vqQsq3g9dC6SKrCvv3bUcxZ2DUa04dHcZLWGEmLds9sqQKiapj
	GNuNZweiAogLQ0WroozF2sgJqtoOXjaja/48syRRpBRbGn13fQ8ZTYMgRO1lP5KePgl2wCCZ5Wvor
	rcZRJcS0P6J2JecOm+Vgs9xmGmU70EXGzMg+VMdb4w0b7EFw0hBDnSYmoXaNr9nleLXB3T9Ci6G+I
	ZEqg9OhQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w5pan-0000000GAjq-1QCF;
	Thu, 26 Mar 2026 19:38:05 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Javier Martinez Canillas <javierm@redhat.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 4/6] riscv: dts: spacemit: enable QSPI and add SPI NOR on Milk-V Jupiter
Date: Thu, 26 Mar 2026 19:35:32 +0100
Message-ID: <20260326183745.1370642-5-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326183745.1370642-1-aurelien@aurel32.net>
References: <20260326183745.1370642-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the QSPI controller node for the Milk-V Jupiter board and describe
the attached SPI NOR flash (GD25Q64E).

The flash supports a frequency up to 133MHz (80 MHz for reads), and the
SoC supports a frequency up to 104 MHz. However tests have shown that
the flash is not reliably detected above 26.5 MHz, consistent with
frequency used in the vendor kernel. Therefore, use this frequency.

The m25p,fast-read properties is taken from the vendor kernel, and the
GD25Q64E datasheet confirms tha the fast read opcodes are supported.

Add a corresponding flash partition layout, matching the layout and the
names used in the vendor U-Boot.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 43 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

v2:
 - Remove bootph-pre-ram property from SPI NOR flash and update the patch description accordingly
 - Mention that the fast read opcodes is marked as supported in the datasheet
 - Collect Reviewed-by:

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 836311c3f035c..bac6438c67532 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -173,7 +173,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4_3v3: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -256,6 +256,47 @@ dldo7 {
 	};
 };
 
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
+		vcc-supply = <&buck4_3v3>; /* QSPI_VCC1833 */
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x10000>;
+			};
+			private@10000 {
+				reg = <0x10000 0x10000>;
+			};
+			fsbl@20000 {
+				reg = <0x20000 0x40000>;
+			};
+			env@60000 {
+				reg = <0x60000 0x10000>;
+			};
+			opensbi@70000 {
+				reg = <0x70000 0x30000>;
+			};
+			uboot@a00000 {
+				reg = <0xa0000 0x760000>;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
-- 
2.51.0

