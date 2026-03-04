Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615D335CB7A;
	Wed,  4 Mar 2026 07:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772609848; cv=none; b=oc/2gUEfH8h+fZmGrOlcM40c0tU8VI9yBXRTcJOIzMBcbHOAET9ZUraASkbQMRL1jbarcTvYt7zXcL6IHCthD8FaM/DRBhZXXia4SjlXWg0ebl0HbcT0f4ZqjTYRk4/YpYwJgT2VCpsMZJ7KmTRLtiTG5xp2dmd2EYyXOhSJ6Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772609848; c=relaxed/simple;
	bh=PU9E6pvdIlTXi8fnb6POonhnG/LZrpSiO7afGiZDxCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dSH2W0XWUJlXCttNegBVmwg1u9nOpQmZ9TedduQmecl4AtzvDcMiOp2d0TFYVPSmlkQSpdQpo1/FHZzG14gaTn+fYWJD4Z0leCTqc9lPnOIKT5x9Q4p3tHIvkCB6dwpO3rRMMeENL5L/8twlbIAkxUgsj/8kgdrQEM8XoxQF+Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qCVsVDfx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qCVsVDfx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91910C19423;
	Wed,  4 Mar 2026 07:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772609848;
	bh=PU9E6pvdIlTXi8fnb6POonhnG/LZrpSiO7afGiZDxCg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qCVsVDfxVJvkOi1kDJpbjU+fQLmyFgE3WC6VrTCFKTNAte6PfTthuNIutHSdLEdl5
	 qlJiVGQG8hopLbM6BolJWGeeQU5Q1CZyOKL3Oz3sKpQjqiSRDCO3JYbYCHL49ePfml
	 RLmpN6dPyRTsjLcz7WrDJbyea2MSvJhf+JsnTBIttfQ4LKwR/0rdEBK4RNXXHNUgX8
	 Yi9ApvexIkEGifijIb2SuGx7j4P079OX5kyt0GEBoso/o7kNvuc3ME/S+7PYjQEP0V
	 C/NBlDklTzESFQrx7g903Aay5F6tlcZRvji+nirgUD+oJAAwyVTLuOFuzu1v1ORJYj
	 YwhQnMq12YjvA==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 04 Mar 2026 07:36:45 +0000
Subject: [PATCH 4/4] riscv: dts: spacemit: k3: add full resource to UART
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-01-dts-uart-full-v1-4-50a0aa53a245@kernel.org>
References: <20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org>
In-Reply-To: <20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6388; i=dlan@kernel.org;
 h=from:subject:message-id; bh=PU9E6pvdIlTXi8fnb6POonhnG/LZrpSiO7afGiZDxCg=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpp+Ek3f7qT9eVOyes3n8iQaYZedxnfHU0ksOVO
 NpKTrjye7yJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaafhJBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+14cA//TefcIjF+yE61NYbff1LjwKw6K138+XeItfZAjwPC2MG8gme1Yiu4g
 XW0IvPPA9UljzSCWOj05ZUxxk1yfGPRHDtqPoRvObqRPJlfjZbEZpIFIwXzaTwUBU8+VlU3P1ZJ
 sgYjUn2id1MkYOJTLxm20rUXGDzIoiIovEbkJFcobobvdvRVUjEj4Sttp5b252h1T4+fofK/R5N
 q+HLJtb00B7uQhL5dVkhzzR1b8fuKXbqe2zDsI9V7WQrEvt3ZewR0gwNNGhOnwVNcOQA1b1rHMQ
 SXfGHXw/T+z8IBkKi/xo0low45/iBgUhQ90LsS0HBmb8tbpt0W0FRej7t6dNK8ngFiOhMnv9qN0
 pzeLyugDkR7GOU0MYYYM+sI/ENenkxcEkyYE3tgsN0/+urLDl2qjs/IPz74SOhZz9xQudh/a+s/
 irsAKqp7Nl3QHtMsRmS6hVxjFAjdxKSS1/RQ8qJSrYiv00pwxtNP7JiQ2j4hiZA8BkON+I8SDsI
 rytLtuqxskx4my7VnApOuR31+BIihhf17nDu1uMB8hdZo7ZQ4D+4k4rLabXvD7aDh2obLlFSaLg
 KdW/4gfHcY/c3LoIkLYc3xQ83So1ZCMHVNLOBU1Ayp0Hr23S17BeeQY3d4KwgQU9QDaJi2KRxlt
 PtLJq999NnXWx0l+5s59B2TlcZE77w=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Previously the UART rely on external bootloader to initialize clock,
pinctrl and reset, to solve this, explicitly adding those resource in
Device Tree, so UART driver will handle them properly.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  3 ++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 24 +++++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 51 ++++++++++++++++++++++------
 3 files changed, 68 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b691304d4b74..b098dbd0e7a1 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -5,6 +5,7 @@
  */
 
 #include "k3.dtsi"
+#include "k3-pinctrl.dtsi"
 
 / {
 	model = "SpacemiT K3 Pico-ITX";
@@ -25,5 +26,7 @@ memory@100000000 {
 };
 
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_0_cfg>;
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
new file mode 100644
index 000000000000..efb0f1572188
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2026 Yixun Lan <dlan@kernel.org>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+#define K3_PADCONF(pin, func) (((pin) << 16) | (func))
+
+/* Map GPIO pin to each bank's <index, offset> */
+#define K3_GPIO(x)	(x / 32) (x % 32)
+
+&pinctrl {
+	/omit-if-no-ref/
+	uart0_0_cfg: uart0-0-cfg {
+		uart0-0-pins {
+			pinmux = <K3_PADCONF(149, 2)>,	/* uart0 tx */
+				 <K3_PADCONF(150, 2)>;	/* uart0 rx */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 3683a1a65362..a3a8ceddabec 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/clock/spacemit,k3-clocks.h>
+#include <dt-bindings/reset/spacemit,k3-resets.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 /dts-v1/;
@@ -451,7 +452,10 @@ uart0: serial@d4017000 {
 			reg = <0x0 0xd4017000 0x0 0x100>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clock-frequency = <14700000>;
+			clocks = <&syscon_apbc CLK_APBC_UART0>,
+				 <&syscon_apbc CLK_APBC_UART0_BUS>;
+			clock-names = "core", "bus";
+			resets = <&syscon_apbc RESET_APBC_UART0>;
 			interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
@@ -461,7 +465,10 @@ uart2: serial@d4017100 {
 			reg = <0x0 0xd4017100 0x0 0x100>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clock-frequency = <14700000>;
+			clocks = <&syscon_apbc CLK_APBC_UART2>,
+				 <&syscon_apbc CLK_APBC_UART2_BUS>;
+			clock-names = "core", "bus";
+			resets = <&syscon_apbc RESET_APBC_UART2>;
 			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
@@ -471,7 +478,10 @@ uart3: serial@d4017200 {
 			reg = <0x0 0xd4017200 0x0 0x100>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clock-frequency = <14700000>;
+			clocks = <&syscon_apbc CLK_APBC_UART3>,
+				 <&syscon_apbc CLK_APBC_UART3_BUS>;
+			clock-names = "core", "bus";
+			resets = <&syscon_apbc RESET_APBC_UART3>;
 			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
@@ -481,7 +491,10 @@ uart4: serial@d4017300 {
 			reg = <0x0 0xd4017300 0x0 0x100>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clock-frequency = <14700000>;
+			clocks = <&syscon_apbc CLK_APBC_UART4>,
+				 <&syscon_apbc CLK_APBC_UART4_BUS>;
+			clock-names = "core", "bus";
+			resets = <&syscon_apbc RESET_APBC_UART4>;
 			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
@@ -491,7 +504,10 @@ uart5: serial@d4017400 {
 			reg = <0x0 0xd4017400 0x0 0x100>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clock-frequency = <14700000>;
+			clocks = <&syscon_apbc CLK_APBC_UART5>,
+				 <&syscon_apbc CLK_APBC_UART5_BUS>;
+			clock-names = "core", "bus";
+			resets = <&syscon_apbc RESET_APBC_UART5>;
 			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
@@ -501,7 +517,10 @@ uart6: serial@d4017500 {
 			reg = <0x0 0xd4017500 0x0 0x100>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clock-frequency = <14700000>;
+			clocks = <&syscon_apbc CLK_APBC_UART6>,
+				 <&syscon_apbc CLK_APBC_UART6_BUS>;
+			clock-names = "core", "bus";
+			resets = <&syscon_apbc RESET_APBC_UART6>;
 			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
@@ -511,7 +530,10 @@ uart7: serial@d4017600 {
 			reg = <0x0 0xd4017600 0x0 0x100>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clock-frequency = <14700000>;
+			clocks = <&syscon_apbc CLK_APBC_UART7>,
+				 <&syscon_apbc CLK_APBC_UART7_BUS>;
+			clock-names = "core", "bus";
+			resets = <&syscon_apbc RESET_APBC_UART7>;
 			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
@@ -521,7 +543,10 @@ uart8: serial@d4017700 {
 			reg = <0x0 0xd4017700 0x0 0x100>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clock-frequency = <14700000>;
+			clocks = <&syscon_apbc CLK_APBC_UART8>,
+				 <&syscon_apbc CLK_APBC_UART8_BUS>;
+			clock-names = "core", "bus";
+			resets = <&syscon_apbc RESET_APBC_UART8>;
 			interrupts = <50 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
@@ -531,7 +556,10 @@ uart9: serial@d4017800 {
 			reg = <0x0 0xd4017800 0x0 0x100>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clock-frequency = <14700000>;
+			clocks = <&syscon_apbc CLK_APBC_UART9>,
+				 <&syscon_apbc CLK_APBC_UART9_BUS>;
+			clock-names = "core", "bus";
+			resets = <&syscon_apbc RESET_APBC_UART9>;
 			interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
@@ -567,7 +595,10 @@ uart10: serial@d401f000 {
 			reg = <0x0 0xd401f000 0x0 0x100>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clock-frequency = <14700000>;
+			clocks = <&syscon_apbc CLK_APBC_UART10>,
+				 <&syscon_apbc CLK_APBC_UART10_BUS>;
+			clock-names = "core", "bus";
+			resets = <&syscon_apbc RESET_APBC_UART10>;
 			interrupts = <281 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};

-- 
2.53.0

