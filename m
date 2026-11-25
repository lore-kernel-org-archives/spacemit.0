Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592804;
	b=GC7UIJecPoHK1ChFn5BkEIcOLVVeHoYqHgi4/WjvsbtDuTXNPl1DHkTRmxgAw8YEwnyn
	 NuyP4jcuue2+JKTYpA3z8+kmdCXyEiTEnqpB/7fdGHXGTuPlWn8bR8Ap8iPDjhikd2+M0
	 jA7152K8b2hD+VK7npdYQVxMukQb768jAJU37+FJIWxNO2KWPy7TAF4UPHode7lILPY2S
	 NM2dpigEwfvQBpD72n2mYUKj3JhqugDXka2Z42Cz24n+CVxMFzSvEgHWOmhLTiehrInMB
	 NAu5AZJOfJpUSsljOkTCkMsmKWSPpFl2KFmkNr5PRtqywuBUmq1hmLk9/iSOJ68kXJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592804;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=gU/UcpSoePzAQUGjCNdjk4uCfDEDrO1+IvpBCE4O59k=;
	b=RvgBIAC0hmzL4j5Gwea06yrpBM7OjaL4a92NZBIbjpw6xKH9DBLv+my7hErJ2t5RbEt+
	 7BzKtTjQ1BLSdMxD1FgUQByJXjPujeb86PYa7B1/JtRHwHRgIoSz7tjwudXNrLDm8tw/g
	 xl/SKbVFJ7n9yhB9xMUUpLAAPs7R7u4LWOoJB9JSIYZpJ6wvRK6IbdQJAu+ANu4AvO6jS
	 hfp9JkNGBLxL6KiJO2olh00+Q0oePWG+Gu/sLl2PwxjdYkyhtv8fkaC6Z/u8saemUw1q7
	 MPc32wDUYQP/tW9UR250PArJNlQplLsneyY7z9ukOmT0gifA7CNz3/V7U7uUgs+RY1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YfV/mzuc";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDEB60A382C;
	Wed, 25 Nov 2026 07:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YfV/mzuc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B49F1F000D4;
	Wed, 25 Nov 2026 07:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795592804;
	bh=gU/UcpSoePzAQUGjCNdjk4uCfDEDrO1+IvpBCE4O59k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YfV/mzuc2IioktAlU4ZSkT2pk+XOB2ke0a/tufs34x0/IxQV2ypubnIs+vxEGqPM0
	 XPOjdf3/8UU10YmpC49q5Ik8XnHXydeXQkjM2VBdI843e7vA/KDCI0AtdBg6GseH7C
	 xGzH6r+itNASJ3/Oo0QVl5MFYCS3OPsOsJhwFCaJwvsXghqyBJo213+p9gkjCWEhrq
	 e78l4wbV77kDMgeI5OdHX8t/5obtIIiEArRrYGO+5WWHLMdTKjsZK1XrFwWabUrLDX
	 /JomraxVtZsJPF3nOCrdnpsGDJcIgmW/ShbMke2IykLiq7a3Z3g7Kp4nj/NjlrT0uX
	 VgEO+vugJ/gYA==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 25 Nov 2026 07:46:15 +0000
Subject: [PATCH 2/4] riscv: dts: spacemit: k3: Use Pin Macro
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-09-k3-dt-minor-misc-v1-2-dd887a8eb326@kernel.org>
References: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
In-Reply-To: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1958; i=dlan@kernel.org;
 h=from:subject:message-id; bh=NLfSqq53cy2/3tiAdAfEyPG/cXEbgeJoLVQyYeX+FXU=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBrBpJO1HPGHrHOa4+sCWp0aoIjf4FJeBPh0ePeS
 VAMxmAHAMOJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCawaSThsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3AJA//epbR8jRNKONG8DGeBdI6pFSea1fPSpdVgU8qQ0rQ3T3/bTpoQSN1M
 04P6PHq9m89BlO4q8G5s4tIvptF51gkYeefOR53Wn7+YQgbRlCs6OWA3TBoGTTM3OE7+ik0x70e
 BEELxY0CUSaGpB9PAglGAumASDKFVsK44CM8C8nk0lCCHkqWQrCfb964PXN8zYdGWtTujuFMZnO
 Rng9sze/d8GggKzk1IY2H98lrrM05IWBm7Inmk/dJ2sZabrmAYMZujY+OfNUUIfi06UOMWAQF8y
 eUhAjBX0NhDEdTwFcou0IRQ2BmwarAxNEsFAUwSNJh4YTa0Ml89PysA+VJaHBBGP5HbXXlZBjm+
 6UAU1oPG6fiu9/uofUiJgWBYlBjkR7zZ7Jub6p78wtNecTsHox8ojab/QF+MyGWdtWBPlYNtenJ
 nwD/aEe4d0tOQ2e6Od17KOxPQLHTrGbqE9h/fwuLVECMLJCCUxSubTPpXDk0CrZ6XGr1eb6YqFz
 W6qCXPe5s0IoSYWIhT4wZF35aHaPGAqLYki+Fw8zz7zhW/7b0kJh13Ks/l3KJVW3RCyt4VAld/E
 oYWzojxZACFjzsQ0Scl76uZ30uD7W9xFx/a2KbCdpPhCdvkLHDyjLcrstRvY5E8deiTRSirZYrT
 SJr3fmFan0FXsHUaVeOQ1V7xYrFlYs=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Use Macro for the GPIO Pin definition, which match enumeration from
pinctrl driver and make people easy to grep for debugging purpose.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi  | 2 +-
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index d8e94d538bf1..65c6f49f8591 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -228,7 +228,7 @@ mdio {
 		phy1: ethernet-phy@1 {
 			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
-			reset-gpios = <&gpio 1 5 GPIO_ACTIVE_LOW>;
+			reset-gpios = <&gpio K3_GPIO(37) GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <50000>;
 		};
diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index a4afe24130ae..a74e76ee75e4 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -48,14 +48,14 @@ rfkill-pcie-wlan {
 		compatible = "rfkill-gpio";
 		label = "rfkill-pcie-wlan";
 		radio-type = "wlan";
-		shutdown-gpios = <&gpio 1 3 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio K3_GPIO(35) GPIO_ACTIVE_HIGH>;
 	};
 
 	rfkill-usb-bt {
 		compatible = "rfkill-gpio";
 		label = "rfkill-usb-bt";
 		radio-type = "bluetooth";
-		shutdown-gpios = <&gpio 0 30 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio K3_GPIO(30) GPIO_ACTIVE_HIGH>;
 	};
 };
 
@@ -250,7 +250,7 @@ mdio {
 		phy0: ethernet-phy@1 {
 			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
-			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
+			reset-gpios = <&gpio K3_GPIO(15) GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <50000>;
 			realtek,aldps-enable;

-- 
2.56.0

