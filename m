Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1CB38F625;
	Thu, 12 Mar 2026 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773311676; cv=none; b=LXvHtnrUYlpllGY9NNKuhpeteWEiCrJBUgEY+nLbe/gpG54Celp/VgBtM2OuE1wvnMJHVZAFLsyukUQfsCaClG/1QEZeYNu3AKeWEOQSxbntTOfZn5PxcMM47/lRT2H0gCu4sCwsB3+UHCCJUImWzdH371+9yAvYNuaJ3JpfIVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773311676; c=relaxed/simple;
	bh=TXeg03A17+JTRhh6ORiHWKg8puKzhaSUB8aiB1qimoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eswaG+0i9rV8cgWZrMeKJy5pWyoKlf8Zdjus9uMxO12c8O86GEFCZQQk/o6w6Fo7f+d3HfczOyc7HjBkn+5ifTKbEiiT1KaGtKAlBkPJTguPtx1d1bh/0SYyw+7BlUnH7TDfdIEulwaFHOc55EIZEj1a74tsRQzHMRbbzJBmfdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WvPvbgR4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WvPvbgR4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136C2C2BC87;
	Thu, 12 Mar 2026 10:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773311676;
	bh=TXeg03A17+JTRhh6ORiHWKg8puKzhaSUB8aiB1qimoc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WvPvbgR46qpZFMw17w7dcWygzH7RcdidwdsC01SgjOnKicPfuOtE/QS76BGTmjxaj
	 8D+plW4g+716p/7qo64Jo8KIDFqv8+QA++DynjBxqX9N3+qRahSu8WO3RgymnklawU
	 ld0zA92jljsul1ROv8MPxtL32YGg6Br6SucBvK/5hGwUG/kgyuQp6FpOSJedBsidDA
	 xfyn2feowBiLwZlWE24TKEzSbM/J+bnPrArxabgPdAwdXBU+JN9TpbxM/BQWWYkQkI
	 uKVjmSxzwQXBS4x5QLN0bjZ5zizxUMxC8UU7JQU4n6XUEVUUExgPfS2UFgYMj811UH
	 MZ37lCo9QRxFQ==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 12 Mar 2026 10:34:19 +0000
Subject: [PATCH 1/2] dt-bindings: soc: spacemit: k3: Decouple composite
 reset lines
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-01-k3-reset-usb-pci-v1-1-022b24b7340f@kernel.org>
References: <20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org>
In-Reply-To: <20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Junzhong Pan <junzhong.pan@spacemit.com>, 
 Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2995; i=dlan@kernel.org;
 h=from:subject:message-id; bh=TXeg03A17+JTRhh6ORiHWKg8puKzhaSUB8aiB1qimoc=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpspawl4ApWYrlyNDba348jokZUG3mE8tY23kBN
 my4zgoKR4KJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCabKWsBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0mmA//fpEoEYLSrNxjLP6JMj0vOvfx/ImIo1QpYY7i8FB+Rj6W23J0HjAIB
 RI385PB67NG6ImPgd/vD706j97p9DXuxlxR3q1feIyKHoQYGiDUlnFuCrEGid8ue1OZUkCuL6IG
 xv3qj29jjj3QqRfkY/Tzjja3MpzuZkOSqxD2Rz9f1Gj8uJCTWbmn84TmqSyk1IIVZScaT38vvID
 B7OdRze352sBZEx40MbnoD+P5LgY15RHX5oBsCVYIRkwgSgu67iSueGaPDyzSaswldaDO7px4B1
 R9Z6UXmV7N+BMwD3MA1va06AA9jzujZybd7rTcoaJQ7LiZkrorJ92fB4DT3N+CUsPLo/Xa9EGne
 zEVMLT+yOtVvTTdqo/DoqXWtud6TzKE/XSCxT+GIjLZfoWmNsImXDYtYR//0UgIpX+ZgR5d0maz
 /zJmKMQwhmrRizAKmdGAU9TNpZqkWfV+Fxpk3EMQyHF3uK6f+n3mXcXQ3mzorh0UIbF1E5Ip+tT
 x790u86ojBrekaexzWEdyV8n40SzekfWnd9tbUlpsMQdgKIMTCjPaD44u4tU+aPpVt7tyeeU8vG
 xPydkPLNS8msDA/wW3w5fjB9id+l7/KpiHC8nyEUMlq+k/pbyDIafaLNLJohH8e8XJxosFuYdUv
 mM+BNc9sa8X8aWMP9pkg4dRQLw0t0Y=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Instead of grouping several different reset lines into one composite
reset, decouple them to individual ones which make it more aligned
with underlying hardware.

The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 include/dt-bindings/reset/spacemit,k3-resets.h | 42 ++++++++++++++++++++------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/include/dt-bindings/reset/spacemit,k3-resets.h b/include/dt-bindings/reset/spacemit,k3-resets.h
index 79ac1c22b7b5..c12f8bd32047 100644
--- a/include/dt-bindings/reset/spacemit,k3-resets.h
+++ b/include/dt-bindings/reset/spacemit,k3-resets.h
@@ -97,11 +97,7 @@
 #define RESET_APMU_SDH0          13
 #define RESET_APMU_SDH1          14
 #define RESET_APMU_SDH2          15
-#define RESET_APMU_USB2          16
-#define RESET_APMU_USB3_PORTA    17
-#define RESET_APMU_USB3_PORTB    18
-#define RESET_APMU_USB3_PORTC    19
-#define RESET_APMU_USB3_PORTD    20
+/* Deprecated USB 16 - 20 */
 #define RESET_APMU_QSPI          21
 #define RESET_APMU_QSPI_BUS      22
 #define RESET_APMU_DMA           23
@@ -143,16 +139,42 @@
 #define RESET_APMU_UFS_ACLK      59
 #define RESET_APMU_EDP0          60
 #define RESET_APMU_EDP1          61
-#define RESET_APMU_PCIE_PORTA    62
-#define RESET_APMU_PCIE_PORTB    63
-#define RESET_APMU_PCIE_PORTC    64
-#define RESET_APMU_PCIE_PORTD    65
-#define RESET_APMU_PCIE_PORTE    66
+/* Deprecated PCIe 62 - 66 */
 #define RESET_APMU_EMAC0         67
 #define RESET_APMU_EMAC1         68
 #define RESET_APMU_EMAC2         69
 #define RESET_APMU_ESPI_MCLK     70
 #define RESET_APMU_ESPI_SCLK     71
+#define RESET_APMU_USB2_AHB      72
+#define RESET_APMU_USB2_VCC      73
+#define RESET_APMU_USB2_PHY      74
+#define RESET_APMU_USB3_A_AHB    75
+#define RESET_APMU_USB3_A_VCC    76
+#define RESET_APMU_USB3_A_PHY    77
+#define RESET_APMU_USB3_B_AHB    78
+#define RESET_APMU_USB3_B_VCC    79
+#define RESET_APMU_USB3_B_PHY    80
+#define RESET_APMU_USB3_C_AHB    81
+#define RESET_APMU_USB3_C_VCC    82
+#define RESET_APMU_USB3_C_PHY    83
+#define RESET_APMU_USB3_D_AHB    84
+#define RESET_APMU_USB3_D_VCC    85
+#define RESET_APMU_USB3_D_PHY    86
+#define RESET_APMU_PCIE_A_DBI    87
+#define RESET_APMU_PCIE_A_SLAVE  88
+#define RESET_APMU_PCIE_A_MASTER 89
+#define RESET_APMU_PCIE_B_DBI    90
+#define RESET_APMU_PCIE_B_SLAVE  91
+#define RESET_APMU_PCIE_B_MASTER 92
+#define RESET_APMU_PCIE_C_DBI    93
+#define RESET_APMU_PCIE_C_SLAVE  94
+#define RESET_APMU_PCIE_C_MASTER 95
+#define RESET_APMU_PCIE_D_DBI    96
+#define RESET_APMU_PCIE_D_SLAVE  97
+#define RESET_APMU_PCIE_D_MASTER 98
+#define RESET_APMU_PCIE_E_DBI    99
+#define RESET_APMU_PCIE_E_SLAVE  100
+#define RESET_APMU_PCIE_E_MASTER 101
 
 /* DCIU resets*/
 #define RESET_DCIU_HDMA          0

-- 
2.53.0

