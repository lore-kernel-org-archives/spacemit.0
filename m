Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0E236D9EB;
	Wed,  4 Mar 2026 07:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772609838; cv=none; b=TB+jWjL04fZidW8bKoMCRDl22UXARBDrrlOK+0XM7n3UM1QBKuWwlx4yOeUQdZTp/cX/AA+jk419RYxAWfmCtFmkPkFZZFvETfIwNmP8trrDO+NL6WGUVwCxSBf0nvQZixTnvw04RgKhxJNF7lFvjLiZ1Lw66qazrsmcddotcRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772609838; c=relaxed/simple;
	bh=jO0M0guSNWEHLzTjxBxCbcuEOMBS1RGGO8p6u7k7qVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S8a5g3ZfspDckXfBesYmCY6e0KCNXTvj4QETUN8EkRmbfodRFBrOGoam0ymqSir4ottQkh2yi7pFr3PNrKWtUZCg/OG6FKeb7eL0YHn4YWmfpH6pHVotyduqVYpeROHivbFHcimAmp26DNzwklEeAw61etyrb+ZayYDrrOH/1Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ou5kmWfT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ou5kmWfT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F0AC2BC87;
	Wed,  4 Mar 2026 07:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772609838;
	bh=jO0M0guSNWEHLzTjxBxCbcuEOMBS1RGGO8p6u7k7qVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ou5kmWfTVNhkQAGuRMx4jAzMHi1sHSIX+7046/pU9Yv2bkr5MtCI4qnCH7V9VEa7E
	 VDnT+eQ/fzWaAXvoV/D5blg3JVNMM9tK+ywKGEpAToWU+VVAW/EHMWAP3mJyqHLGOl
	 JNWRQiFFe3CTf4pzMRnf9AgsUyr93h+oxT6kaFyWyOH8nywTiJbmKOTzgmqCTanWMf
	 h2vSF9gd21JBz3NRewbHNmKpKNocEiHcVW87KOajIzeV7HusTmnBS1dWHv3k/jmeKH
	 v6yxrGg56TxGIY5Oo18y7CJ1k6WZkUlFXqtjFMPU08ti+QMk/z5gu4eHLZZGPn/3AD
	 f9IxJkDNuRW2A==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 04 Mar 2026 07:36:42 +0000
Subject: [PATCH 1/4] riscv: dts: spacemit: k3: add clock tree
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-01-dts-uart-full-v1-1-50a0aa53a245@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3402; i=dlan@kernel.org;
 h=from:subject:message-id; bh=jO0M0guSNWEHLzTjxBxCbcuEOMBS1RGGO8p6u7k7qVg=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpp+EaBnWKf5lfQFWDs7PyaOqPYpQUX9+orzVya
 wlBUL6K0XaJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaafhGhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1Ieg//ReeuC4zNyy8R8tfDFGVqOd6yom9iwCKlOXMU4KW/9RsBvveOp3D7M
 AzEVYRl4Uz+o2Ic5Zz5SxmLDxFFZvDFn8pm+66BpKhnUDhpvFCyGO7v8S4NKJwnzaOe3nGz+wWh
 9NQfIbn+a/HKqSf3Ti4Jc8z/xc7agehnXRK36diTV6m1kFakW3FVnYdzIABNl53/Url+i08D1UN
 P7j5IVaKddPRhDBry1R06zt4pbyWjeIdctVf8w+UZ3z7ZjJzb2WIjebXjzKHkjZpyTpw96pejoC
 y7cPVdP8s+1ETPDgOGIqwUiarndot8z/ko/d44PiPn60Be8AYOWgSyQlEgZpqG+mICyPaGvFsOR
 bHJ7cSkExV4cR/VlSwacGVNt0qye9EOoI03nkWNEKM+m0BOh/fh+wIJ2ld9Bu0l/USPcuIR2gJw
 cN6o9BmUewZ7QJLaOB8eKvEAIVJULX+P95eQoToqdpnFAZzkYnsJMXriUYpoWyl71/5tLe0NYtG
 8dDhvfG+YQPrgDezq5jYJ60L633w4PMwCW01eg6QetaKOtAHl8nXrli8ujPQxROmuAVoLvU1hH2
 YsO9GdDBMDMnV4R4k/j7Uz7e4V+4C3cUjS4KEl1kKnOLoh/qjNWlx4uAULckHL6TBKNHxoj1Qqk
 QsFFCNy7VI1/egT+7FVGw6onExe40g=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add clock support to SpacemiT K3 SoC, the clock tree consist of several
blocks which are APBC, APMU, DCIU, MPUM.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 75 ++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index b69cf81b5d55..e3d7f3102fd5 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -4,6 +4,7 @@
  * Copyright (c) 2026 Guodong Xu <guodong@riscstar.com>
  */
 
+#include <dt-bindings/clock/spacemit,k3-clocks.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 /dts-v1/;
@@ -398,6 +399,36 @@ core3 {
 		};
 	};
 
+	clocks {
+		vctcxo_1m: clock-1m {
+			compatible = "fixed-clock";
+			clock-frequency = <1000000>;
+			clock-output-names = "vctcxo_1m";
+			#clock-cells = <0>;
+		};
+
+		vctcxo_24m: clock-24m {
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+			clock-output-names = "vctcxo_24m";
+			#clock-cells = <0>;
+		};
+
+		vctcxo_3m: clock-3m {
+			compatible = "fixed-clock";
+			clock-frequency = <3000000>;
+			clock-output-names = "vctcxo_3m";
+			#clock-cells = <0>;
+		};
+
+		osc_32k: clock-32k {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			clock-output-names = "osc_32k";
+			#clock-cells = <0>;
+		};
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&saplic>;
@@ -406,6 +437,15 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_apbc: system-controller@d4015000 {
+			compatible = "spacemit,k3-syscon-apbc";
+			reg = <0x0 0xd4015000 0x0 0x1000>;
+			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>, <&vctcxo_24m>;
+			clock-names = "osc", "vctcxo_1m", "vctcxo_3m", "vctcxo_24m";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		uart0: serial@d4017000 {
 			compatible = "spacemit,k3-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017000 0x0 0x100>;
@@ -506,6 +546,41 @@ uart10: serial@d401f000 {
 			status = "disabled";
 		};
 
+		syscon_mpmu: system-controller@d4050000 {
+			compatible = "spacemit,k3-syscon-mpmu";
+			reg = <0x0 0xd4050000 0x0 0x10000>;
+			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>, <&vctcxo_24m>;
+			clock-names = "osc", "vctcxo_1m", "vctcxo_3m", "vctcxo_24m";
+			#clock-cells = <1>;
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		pll: clock-controller@d4090000 {
+			compatible = "spacemit,k3-pll";
+			reg = <0x0 0xd4090000 0x0 0x10000>;
+			clocks = <&vctcxo_24m>;
+			spacemit,mpmu = <&syscon_mpmu>;
+			#clock-cells = <1>;
+		};
+
+		syscon_apmu: system-controller@d4282800 {
+			compatible = "spacemit,k3-syscon-apmu";
+			reg = <0x0 0xd4282800 0x0 0x400>;
+			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>, <&vctcxo_24m>;
+			clock-names = "osc", "vctcxo_1m", "vctcxo_3m", "vctcxo_24m";
+			#clock-cells = <1>;
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		syscon_dciu: system-controller@d8440000 {
+			compatible = "spacemit,k3-syscon-dciu";
+			reg = <0x0 0xd8440000 0x0 0xc000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		simsic: interrupt-controller@e0400000 {
 			compatible = "spacemit,k3-imsics", "riscv,imsics";
 			reg = <0x0 0xe0400000 0x0 0x200000>;

-- 
2.53.0

