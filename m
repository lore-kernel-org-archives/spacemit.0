Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A91E18AE2;
	Tue, 17 Mar 2026 02:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773714987; cv=none; b=RTYvkMkCBy52YYTzrTDazLu+pWsonle6KaI5La2MruYNrlBSxI0M8Vp68vZpjxhel+JqFxNeU7qEpLMgTRxaM3cXO/NXvcLyjyX4NWH0gYgSSrFisFKDpTe9Fk7WN7X0w2TnvouA+YbywEWWcqfZOyVk4a/+65OxMOskMdyGQXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773714987; c=relaxed/simple;
	bh=4RTD/yVfz8nqsxqv6oLXhqKEvwwMZcuh5/dmklf76I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PYjfGjP8X+BpXVDmNq55JqZ0vdSWvdVxOS6YiqfGiJak9rp+KTRL1ZCs724riZSGfThA0rGLlgVfokE8SqSUkFNAzDDpqDwQKjluwgC1ywoeM6cZmxhzjg3yzzu/J8ODCgB84Eo4UjTumXwS5tX98j5v0ybJIsGv3OoiYR6pN84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JyGjYvFo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JyGjYvFo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95AB1C19421;
	Tue, 17 Mar 2026 02:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773714986;
	bh=4RTD/yVfz8nqsxqv6oLXhqKEvwwMZcuh5/dmklf76I4=;
	h=From:Date:Subject:To:Cc:From;
	b=JyGjYvFoyfE9oPqs1rRlWVBmC5wSFXmU7DuOSZcq4KZ2/S6LzlfovTOILdNskGqal
	 PMMgdlVW4OwgUjehNbEsRyp92Ek0b2fxXjBIyt9JSnsvvPmfCoCQbafl10yZKlnf0L
	 ADJ0u6lid7enblKVPeUxfF5Hahz+IWS2d5fevTOoudOj5SxLid511xrSBN3DUQ56AX
	 vpgSO6nWrEe6dNPc+Uj2UHQzR/8Bd8+53afi3WF89VSq5/AUI4y0UhItKR2GvLwCU/
	 3dMxuR9m4tPzWBfLSZJJNQufHKEJmLFrQWR4tbWpdDVCTkPbBN1WZA2cNw30WKJaMN
	 5ZYP9spzX4IDA==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 17 Mar 2026 02:36:17 +0000
Subject: [PATCH v3] reset: spacemit: k3: Decouple composite reset lines
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-01-k3-reset-usb-pci-v3-1-e4b9a43c7d45@kernel.org>
X-B4-Tracking: v=1; b=H4sIACC+uGkC/33NQQ6CMBCF4auYrh0znRYIrryHcVHoAA0GSIuNh
 nB3CytNjMv/JfPNIgJ7x0GcD4vwHF1w45BCHQ+i7szQMjibWhBSjkoSoIRegefAMzxCBVPtwFp
 E05giy6UR6XLy3Ljnrl5vqTsX5tG/9idRbut/L0pAQKKKdFUojc2lZz/w/TT6VmxgpE9E/0YIJ
 JS2xrLIbUaav5B1Xd/twA1F/AAAAA==
X-Change-ID: 20260312-01-k3-reset-usb-pci-dd00afa7561a
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Junzhong Pan <junzhong.pan@spacemit.com>, 
 Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13998; i=dlan@kernel.org;
 h=from:subject:message-id; bh=4RTD/yVfz8nqsxqv6oLXhqKEvwwMZcuh5/dmklf76I4=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpuL4k2K9YyCxu7zijmW/LDkGYpELbhu9DSb+5c
 1y2CGdAEwGJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCabi+JBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1GDg/+IJTWeYNanQDfVPNx5r+Z3XvOlPtUqLEsoEe++OcZZFE7VaNKzZCWa
 nbqXhrmnpbrvJCKY4b1SEpXyAeQ1VMbhixk6w55cNTVxcwuUfDY9byLHuYIoVN6lY6HRabwt0vQ
 YKuzSWpuOYGhVUF/Z+q+BRSnBN5YD5/H8AZ9TFsYsjzY4yknzRk8SNkE8vn2LnTWiu1CTHgMPIj
 BL+0FTuLZYP8yotEIjsQLmDvH6+PeEZ55+X3cfv3Elpx+XGH5lngEfG5oNoHWi8s4poHVO+vskb
 7919DyVNPNcsMU8vi6VIAVHxR9hw8kf5dJSUsNxCg/bT0PGufA0hFdUd1t2eDXjgsXKAaq42T79
 1oihd863CRPMouvnA0ZJvli1JcGFoA0shqgoMNCjogSp7gTJpxBS2YxM8UYpiDyd0Mc/tD4Af8Y
 eNiw0x+jwaS8mDd4y7MMMFKzdD96nOqC6gRjVTE2UY94OAFLxcoESHU37jeUepn22rCQZotsdyc
 f79mPFOts+8wEHaijwV3iml97DclmU3aII7z/qK7QWvUzWS3LPcAESE0nFanjJy2cGtbITK9Gyd
 LDg2LAq4y+YSW3KLWU0s4qKzgCa5XKW2UFUfQ23ah4wIjOUTQmj2G9uldaMJyR4uGFHkkOXr12q
 7siXZUU9VhbEX0fjm1rh3fw1G561Q8=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Instead of grouping several different reset lines into one composite
reset, decouple them to individual ones which make it more aligned
with underlying hardware. And for DWC USB driver, it will match well
with the number of the reset property in the DT bindings.

The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
Also three reset lines each for UCIE and RCPU block.

As an agreement with maintainer, the reset IDs has been rearranged as
contiguous number and pushed as a fix for the driver, and reason is that
there isn't any consumer of reset driver so far, so should not cause
any ABI breakage. Also, the changes of DT binding header file and reset
driver are merged together as one single commit to avoid git-bisect
breakage.

Fixes: 938ce3b16582 ("reset: spacemit: Add SpacemiT K3 reset driver")
Fixes: 216e0a5e98e5 ("dt-bindings: soc: spacemit: Add K3 reset support and IDs")
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Previously, the reset of The USB and PCIe was submited as a composite
reset, try to decouple them in this series.

The motivation behind is that it will will make the result more aligned
with the hardware which describe them as different reset lines, and also
match with the K3 dwc3 DT binding which request different reset, 
K1 and K3 SoC share same topology of the reset line design.

See the reset part info in binding doc
Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml

In V2, I've visited through whole reset driver and decouple more resets,
which include the block - UCIE and RPCU. Also add an explanation of why
rearrange the reset IDs as contiguous number.
---
Changes in v3:
- fix checkpatch.pl warning due to missing double quotes in Fixes tag
- Link to v2: https://lore.kernel.org/r/20260314-01-k3-reset-usb-pci-v2-1-9dc0976d524e@kernel.org

Changes in v2:
- squash the two patches to avoid git-biset breakage
- rearrange the ID to make it contiguous
- also decouple more reset IDs - UCIE and RPCU block
- add Fixes tag explicitly
- Link to v1: https://lore.kernel.org/r/20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org
---
 drivers/reset/spacemit/reset-spacemit-k3.c     |  60 ++++++-----
 include/dt-bindings/reset/spacemit,k3-resets.h | 136 +++++++++++++++----------
 2 files changed, 116 insertions(+), 80 deletions(-)

diff --git a/drivers/reset/spacemit/reset-spacemit-k3.c b/drivers/reset/spacemit/reset-spacemit-k3.c
index e9e32e4c1ba5..9841f5e057b2 100644
--- a/drivers/reset/spacemit/reset-spacemit-k3.c
+++ b/drivers/reset/spacemit/reset-spacemit-k3.c
@@ -112,16 +112,21 @@ static const struct ccu_reset_data k3_apmu_resets[] = {
 	[RESET_APMU_SDH0]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
 	[RESET_APMU_SDH1]	= RESET_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
 	[RESET_APMU_SDH2]	= RESET_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
-	[RESET_APMU_USB2]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
-				BIT(1)|BIT(2)|BIT(3)),
-	[RESET_APMU_USB3_PORTA]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
-				BIT(5)|BIT(6)|BIT(7)),
-	[RESET_APMU_USB3_PORTB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
-				BIT(9)|BIT(10)|BIT(11)),
-	[RESET_APMU_USB3_PORTC]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
-				BIT(13)|BIT(14)|BIT(15)),
-	[RESET_APMU_USB3_PORTD]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
-				BIT(17)|BIT(18)|BIT(19)),
+	[RESET_APMU_USB2_AHB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_APMU_USB2_VCC]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(2)),
+	[RESET_APMU_USB2_PHY]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(3)),
+	[RESET_APMU_USB3_A_AHB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(5)),
+	[RESET_APMU_USB3_A_VCC]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(6)),
+	[RESET_APMU_USB3_A_PHY]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(7)),
+	[RESET_APMU_USB3_B_AHB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(9)),
+	[RESET_APMU_USB3_B_VCC]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(10)),
+	[RESET_APMU_USB3_B_PHY]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(11)),
+	[RESET_APMU_USB3_C_AHB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(13)),
+	[RESET_APMU_USB3_C_VCC]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(14)),
+	[RESET_APMU_USB3_C_PHY]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(15)),
+	[RESET_APMU_USB3_D_AHB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(17)),
+	[RESET_APMU_USB3_D_VCC]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(18)),
+	[RESET_APMU_USB3_D_PHY]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(19)),
 	[RESET_APMU_QSPI]	= RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(1)),
 	[RESET_APMU_QSPI_BUS]	= RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(0)),
 	[RESET_APMU_DMA]	= RESET_DATA(APMU_DMA_CLK_RES_CTRL,	0, BIT(0)),
@@ -151,10 +156,12 @@ static const struct ccu_reset_data k3_apmu_resets[] = {
 	[RESET_APMU_CPU7_SW]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(26), 0),
 	[RESET_APMU_C1_MPSUB_SW]	= RESET_DATA(APMU_PMU_CC2_AP,	BIT(28), 0),
 	[RESET_APMU_MPSUB_DBG]	= RESET_DATA(APMU_PMU_CC2_AP,		BIT(29), 0),
-	[RESET_APMU_UCIE]	= RESET_DATA(APMU_UCIE_CTRL,
-				BIT(1) | BIT(2) | BIT(3), 0),
-	[RESET_APMU_RCPU]	= RESET_DATA(APMU_RCPU_CLK_RES_CTRL,	0,
-				BIT(3) | BIT(2) | BIT(0)),
+	[RESET_APMU_UCIE_IP]	= RESET_DATA(APMU_UCIE_CTRL,		BIT(1),  0),
+	[RESET_APMU_UCIE_HOT]	= RESET_DATA(APMU_UCIE_CTRL,		BIT(2),  0),
+	[RESET_APMU_UCIE_MON]	= RESET_DATA(APMU_UCIE_CTRL,		BIT(3),  0),
+	[RESET_APMU_RCPU_AUDIO_SYS]	= RESET_DATA(APMU_RCPU_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_APMU_RCPU_MCU_CORE]	= RESET_DATA(APMU_RCPU_CLK_RES_CTRL,	0, BIT(2)),
+	[RESET_APMU_RCPU_AUDIO_APMU]	= RESET_DATA(APMU_RCPU_CLK_RES_CTRL,	0, BIT(3)),
 	[RESET_APMU_DSI4LN2_ESCCLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL3,	0, BIT(3)),
 	[RESET_APMU_DSI4LN2_LCD_SW]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL3,	0, BIT(4)),
 	[RESET_APMU_DSI4LN2_LCD_MCLK]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL4,	0, BIT(9)),
@@ -164,16 +171,21 @@ static const struct ccu_reset_data k3_apmu_resets[] = {
 	[RESET_APMU_UFS_ACLK]	= RESET_DATA(APMU_UFS_CLK_RES_CTRL,	0, BIT(0)),
 	[RESET_APMU_EDP0]	= RESET_DATA(APMU_LCD_EDP_CTRL,		0, BIT(0)),
 	[RESET_APMU_EDP1]	= RESET_DATA(APMU_LCD_EDP_CTRL,		0, BIT(16)),
-	[RESET_APMU_PCIE_PORTA]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_A,	0,
-				BIT(5) | BIT(4) | BIT(3)),
-	[RESET_APMU_PCIE_PORTB]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_B,	0,
-				BIT(5) | BIT(4) | BIT(3)),
-	[RESET_APMU_PCIE_PORTC]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_C,	0,
-				BIT(5) | BIT(4) | BIT(3)),
-	[RESET_APMU_PCIE_PORTD]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_D,	0,
-				BIT(5) | BIT(4) | BIT(3)),
-	[RESET_APMU_PCIE_PORTE]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_E,	0,
-				BIT(5) | BIT(4) | BIT(3)),
+	[RESET_APMU_PCIE_A_DBI]		= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_A,	0, BIT(3)),
+	[RESET_APMU_PCIE_A_SLAVE]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_A,	0, BIT(4)),
+	[RESET_APMU_PCIE_A_MASTER]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_A,	0, BIT(5)),
+	[RESET_APMU_PCIE_B_DBI]		= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_B,	0, BIT(3)),
+	[RESET_APMU_PCIE_B_SLAVE]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_B,	0, BIT(4)),
+	[RESET_APMU_PCIE_B_MASTER]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_B,	0, BIT(5)),
+	[RESET_APMU_PCIE_C_DBI]		= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_C,	0, BIT(3)),
+	[RESET_APMU_PCIE_C_SLAVE]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_C,	0, BIT(4)),
+	[RESET_APMU_PCIE_C_MASTER]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_C,	0, BIT(5)),
+	[RESET_APMU_PCIE_D_DBI]		= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_D,	0, BIT(3)),
+	[RESET_APMU_PCIE_D_SLAVE]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_D,	0, BIT(4)),
+	[RESET_APMU_PCIE_D_MASTER]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_D,	0, BIT(5)),
+	[RESET_APMU_PCIE_E_DBI]		= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_E,	0, BIT(3)),
+	[RESET_APMU_PCIE_E_SLAVE]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_E,	0, BIT(4)),
+	[RESET_APMU_PCIE_E_MASTER]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_E,	0, BIT(5)),
 	[RESET_APMU_EMAC0]	= RESET_DATA(APMU_EMAC0_CLK_RES_CTRL,	0, BIT(1)),
 	[RESET_APMU_EMAC1]	= RESET_DATA(APMU_EMAC1_CLK_RES_CTRL,	0, BIT(1)),
 	[RESET_APMU_EMAC2]	= RESET_DATA(APMU_EMAC2_CLK_RES_CTRL,	0, BIT(1)),
diff --git a/include/dt-bindings/reset/spacemit,k3-resets.h b/include/dt-bindings/reset/spacemit,k3-resets.h
index 79ac1c22b7b5..4c8cba2897c8 100644
--- a/include/dt-bindings/reset/spacemit,k3-resets.h
+++ b/include/dt-bindings/reset/spacemit,k3-resets.h
@@ -97,62 +97,86 @@
 #define RESET_APMU_SDH0          13
 #define RESET_APMU_SDH1          14
 #define RESET_APMU_SDH2          15
-#define RESET_APMU_USB2          16
-#define RESET_APMU_USB3_PORTA    17
-#define RESET_APMU_USB3_PORTB    18
-#define RESET_APMU_USB3_PORTC    19
-#define RESET_APMU_USB3_PORTD    20
-#define RESET_APMU_QSPI          21
-#define RESET_APMU_QSPI_BUS      22
-#define RESET_APMU_DMA           23
-#define RESET_APMU_AES_WTM       24
-#define RESET_APMU_MCB_DCLK      25
-#define RESET_APMU_MCB_ACLK      26
-#define RESET_APMU_VPU           27
-#define RESET_APMU_DTC           28
-#define RESET_APMU_GPU           29
-#define RESET_APMU_ALZO          30
-#define RESET_APMU_MC            31
-#define RESET_APMU_CPU0_POP      32
-#define RESET_APMU_CPU0_SW       33
-#define RESET_APMU_CPU1_POP      34
-#define RESET_APMU_CPU1_SW       35
-#define RESET_APMU_CPU2_POP      36
-#define RESET_APMU_CPU2_SW       37
-#define RESET_APMU_CPU3_POP      38
-#define RESET_APMU_CPU3_SW       39
-#define RESET_APMU_C0_MPSUB_SW   40
-#define RESET_APMU_CPU4_POP      41
-#define RESET_APMU_CPU4_SW       42
-#define RESET_APMU_CPU5_POP      43
-#define RESET_APMU_CPU5_SW       44
-#define RESET_APMU_CPU6_POP      45
-#define RESET_APMU_CPU6_SW       46
-#define RESET_APMU_CPU7_POP      47
-#define RESET_APMU_CPU7_SW       48
-#define RESET_APMU_C1_MPSUB_SW   49
-#define RESET_APMU_MPSUB_DBG     50
-#define RESET_APMU_UCIE          51
-#define RESET_APMU_RCPU          52
-#define RESET_APMU_DSI4LN2_ESCCLK     53
-#define RESET_APMU_DSI4LN2_LCD_SW     54
-#define RESET_APMU_DSI4LN2_LCD_MCLK   55
-#define RESET_APMU_DSI4LN2_LCD_DSCCLK 56
-#define RESET_APMU_DSI4LN2_DPU_ACLK   57
-#define RESET_APMU_DPU_ACLK      58
-#define RESET_APMU_UFS_ACLK      59
-#define RESET_APMU_EDP0          60
-#define RESET_APMU_EDP1          61
-#define RESET_APMU_PCIE_PORTA    62
-#define RESET_APMU_PCIE_PORTB    63
-#define RESET_APMU_PCIE_PORTC    64
-#define RESET_APMU_PCIE_PORTD    65
-#define RESET_APMU_PCIE_PORTE    66
-#define RESET_APMU_EMAC0         67
-#define RESET_APMU_EMAC1         68
-#define RESET_APMU_EMAC2         69
-#define RESET_APMU_ESPI_MCLK     70
-#define RESET_APMU_ESPI_SCLK     71
+#define RESET_APMU_USB2_AHB      16
+#define RESET_APMU_USB2_VCC      17
+#define RESET_APMU_USB2_PHY      18
+#define RESET_APMU_USB3_A_AHB    19
+#define RESET_APMU_USB3_A_VCC    20
+#define RESET_APMU_USB3_A_PHY    21
+#define RESET_APMU_USB3_B_AHB    22
+#define RESET_APMU_USB3_B_VCC    23
+#define RESET_APMU_USB3_B_PHY    24
+#define RESET_APMU_USB3_C_AHB    25
+#define RESET_APMU_USB3_C_VCC    26
+#define RESET_APMU_USB3_C_PHY    27
+#define RESET_APMU_USB3_D_AHB    28
+#define RESET_APMU_USB3_D_VCC    29
+#define RESET_APMU_USB3_D_PHY    30
+#define RESET_APMU_QSPI          31
+#define RESET_APMU_QSPI_BUS      32
+#define RESET_APMU_DMA           33
+#define RESET_APMU_AES_WTM       34
+#define RESET_APMU_MCB_DCLK      35
+#define RESET_APMU_MCB_ACLK      36
+#define RESET_APMU_VPU           37
+#define RESET_APMU_DTC           38
+#define RESET_APMU_GPU           39
+#define RESET_APMU_ALZO          40
+#define RESET_APMU_MC            41
+#define RESET_APMU_CPU0_POP      42
+#define RESET_APMU_CPU0_SW       43
+#define RESET_APMU_CPU1_POP      44
+#define RESET_APMU_CPU1_SW       45
+#define RESET_APMU_CPU2_POP      46
+#define RESET_APMU_CPU2_SW       47
+#define RESET_APMU_CPU3_POP      48
+#define RESET_APMU_CPU3_SW       49
+#define RESET_APMU_C0_MPSUB_SW   50
+#define RESET_APMU_CPU4_POP      51
+#define RESET_APMU_CPU4_SW       52
+#define RESET_APMU_CPU5_POP      53
+#define RESET_APMU_CPU5_SW       54
+#define RESET_APMU_CPU6_POP      55
+#define RESET_APMU_CPU6_SW       56
+#define RESET_APMU_CPU7_POP      57
+#define RESET_APMU_CPU7_SW       58
+#define RESET_APMU_C1_MPSUB_SW   59
+#define RESET_APMU_MPSUB_DBG     60
+#define RESET_APMU_UCIE_IP       61
+#define RESET_APMU_UCIE_HOT      62
+#define RESET_APMU_UCIE_MON      63
+#define RESET_APMU_RCPU_AUDIO_SYS     64
+#define RESET_APMU_RCPU_MCU_CORE      65
+#define RESET_APMU_RCPU_AUDIO_APMU    66
+#define RESET_APMU_DSI4LN2_ESCCLK     67
+#define RESET_APMU_DSI4LN2_LCD_SW     68
+#define RESET_APMU_DSI4LN2_LCD_MCLK   69
+#define RESET_APMU_DSI4LN2_LCD_DSCCLK 70
+#define RESET_APMU_DSI4LN2_DPU_ACLK   71
+#define RESET_APMU_DPU_ACLK      72
+#define RESET_APMU_UFS_ACLK      73
+#define RESET_APMU_EDP0          74
+#define RESET_APMU_EDP1          75
+#define RESET_APMU_PCIE_A_DBI    76
+#define RESET_APMU_PCIE_A_SLAVE  77
+#define RESET_APMU_PCIE_A_MASTER 78
+#define RESET_APMU_PCIE_B_DBI    79
+#define RESET_APMU_PCIE_B_SLAVE  80
+#define RESET_APMU_PCIE_B_MASTER 81
+#define RESET_APMU_PCIE_C_DBI    82
+#define RESET_APMU_PCIE_C_SLAVE  83
+#define RESET_APMU_PCIE_C_MASTER 84
+#define RESET_APMU_PCIE_D_DBI    85
+#define RESET_APMU_PCIE_D_SLAVE  86
+#define RESET_APMU_PCIE_D_MASTER 87
+#define RESET_APMU_PCIE_E_DBI    88
+#define RESET_APMU_PCIE_E_SLAVE  89
+#define RESET_APMU_PCIE_E_MASTER 90
+#define RESET_APMU_EMAC0         91
+#define RESET_APMU_EMAC1         92
+#define RESET_APMU_EMAC2         93
+#define RESET_APMU_ESPI_MCLK     94
+#define RESET_APMU_ESPI_SCLK     95
 
 /* DCIU resets*/
 #define RESET_DCIU_HDMA          0

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260312-01-k3-reset-usb-pci-dd00afa7561a

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

