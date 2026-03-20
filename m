Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E12F2E4274;
	Fri, 20 Mar 2026 11:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774004792; cv=none; b=Ji5QSBlgd1R7Qke+LKyVXBC/iat/yv8SwjMGL/k/koiIvSWbV/9DggDxZUTzkh3ObrKHuwjkKsoP1eVYzyHWFeIMyFv5LR5wo9IJifu5Ig3fet02eDJZjNSoIkKDlXAwC4Sbbl7LN1NQWCnBU74suEGChbeB05RKnxGGAnWY/ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774004792; c=relaxed/simple;
	bh=WrHj/b8deWiGuar8cbaJPGBckgcFXuxHBpTnu7n5cRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ChbnEnEv/em25QzrA6LG423XIZ7wEydRZV37Ce44uEp1fPXRXIsCRvTLMx9t9TgjOsbJzKgnVNvOQpFKw1k2Zyn/jRoANrxVEdWlslwLijz0faE6ysLBnVfHzNCVxljNr4joudB5Ixmi1Uiu0wukepFK7HLi2GTHkgjyunjirbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+Bh1C2P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+Bh1C2P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8E5C4CEF7;
	Fri, 20 Mar 2026 11:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774004792;
	bh=WrHj/b8deWiGuar8cbaJPGBckgcFXuxHBpTnu7n5cRY=;
	h=From:Date:Subject:To:Cc:From;
	b=m+Bh1C2PTGcRjR5raKoibOrhkA6A7B8mUwamLcEwR24j8hwnmY8xC377b+c356uEY
	 9lBerJRdLlflRG82pjQv6FPT7HzaieCmVyIJdYori21A3krqomfEtNP5hfnBmKo5Rw
	 K8aa+tIHiqAK974fUxsawVzcJCpnR7KnMtzH3T6enQH86wVsIQ7JYpSlrjX/zDTpQz
	 JpdicJDDmNlOKxbv9s4lODnzJJWJV8VeMX41m4WnQOG8ceeU3ReXR5/QFMrdXJV+EH
	 4Nc/bJAEGQHZ6XG5ELpzOdUZyaic794RdnW491xmsfTIquoJkv4ouwSImFH3mRzUih
	 /madpIkY47GVQ==
From: Yixun Lan <dlan@kernel.org>
Date: Fri, 20 Mar 2026 11:06:17 +0000
Subject: [PATCH v5] reset: spacemit: k3: Decouple composite reset lines
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-01-k3-reset-usb-pci-v5-1-07f4a5ddd728@kernel.org>
X-B4-Tracking: v=1; b=H4sIACgqvWkC/33NTWrDMBCG4asErTtlNBpZuKvco2Shn3EiUuwgp
 SYl+O5VsnKJ6fL9YJ65qyolS1Ufu7sqMueap7GFfdupePLjUSCn1oqQOjSaADWcDRSpcoXvGuA
 SM6SE6AfvbKe9apeXIkO+PdXPQ+tTrtep/DyfzPqx/u/NGhCQKBAHZxiH/VnKKF/vUzmqBzjTG
 uFthEBDnyL2rkuWWF4Qs0bcNmIaIhx6zya6xPYF4RVCuI1wQ1zg3mLUqRf6gyzL8guJO5L0hgE
 AAA==
X-Change-ID: 20260312-01-k3-reset-usb-pci-dd00afa7561a
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Junzhong Pan <junzhong.pan@spacemit.com>, 
 Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11894; i=dlan@kernel.org;
 h=from:subject:message-id; bh=WrHj/b8deWiGuar8cbaJPGBckgcFXuxHBpTnu7n5cRY=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpvSow0FrXTNV49qZWKb4S4N0RUKbukUy+hVo4d
 7Nj9IqzYIuJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCab0qMBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1QTg//bN5yrW53KzKN987sAL6H5EgwH8Kk+xjfUdA2oTNhx8jdNcTrjhkmP
 BSF8+VyCU3lCMS7NKmPDevxLL848tKEsdC+yODv31GXoTNZIU3uXJF0tr1D1sCviW6s09WKwlmD
 LY2Sd+u3zCB2wGhXZAcc48mXXcPaXaOjNNx5hxtPt84Qq92ObIlJTnATKjzEWACd0nncr4NSRyA
 z1xl3P8GV5Ko+zyNvER351q4vG3yNQFS4ravdKJeUq/pwCkPhCUQKxovpkR9K95yfPldLInu9/n
 niaEzynV2FZJf3yztXtdZdNJJavXawI9N8hZQnJML/WhN2LpsVAgDmZ+5WBm96v/f7i9eKTu5Rc
 gl/gdbbB0dqP+jl/p6ny2gdpVSqslQAsr+LJPQU5inMyommhTHuH17FfW6de6sLv5kgjEY76RZX
 eG3c1UTPBixXEzdqj/rTtH2q/Z4IqSCR4lwEbJRCs9ka0vhoNpLb94r6H6uwGeUJZjLqxFhq2hr
 narr4CwYRNllG4ZgntweR0HtxD7zZ3Dw7qHCowaILMD8ZjtyZ6AGse8znhid/Wl+waXI1nKRtUa
 aaSuhQxq3xKtt9foz7UXzUY+eaiS7B1P30AIKMpK1i16VvUU8uiBOPdEAVuGxwiWUjECutC3AQX
 Y2IlMSWsMkUAtoECzSgAHuQo/BC4d4=
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
contiguous number but keep most part unchanged to avoid break patches
which already sent to mailing list. The changes of DT binding header file
and reset driver are merged together as one single commit to avoid
git-bisect breakage.

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

In V4, I've rearranged all reset IDs to keep them linear(no hole), while
keep EMAC part IDs unchanged, this still bring lots changes to ID number,
let me know if it's ok.

In V5, keep most reset IDs that don't have to split unchanged, also fill
the gap, leave no hole.
---
Changes in v5:
- keep IDs don't have to split unchanged
- Link to v4: https://lore.kernel.org/r/20260320-01-k3-reset-usb-pci-v4-1-7b4950c1d9e2@kernel.org

Changes in v4:
- rearrange IDs but keep EMAC part unchanged
- Link to v3: https://lore.kernel.org/r/20260317-01-k3-reset-usb-pci-v3-1-e4b9a43c7d45@kernel.org

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
 drivers/reset/spacemit/reset-spacemit-k3.c     | 60 +++++++++++++++-----------
 include/dt-bindings/reset/spacemit,k3-resets.h | 48 +++++++++++++++------
 2 files changed, 72 insertions(+), 36 deletions(-)

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
index 79ac1c22b7b5..dc1ef009ba79 100644
--- a/include/dt-bindings/reset/spacemit,k3-resets.h
+++ b/include/dt-bindings/reset/spacemit,k3-resets.h
@@ -97,11 +97,11 @@
 #define RESET_APMU_SDH0          13
 #define RESET_APMU_SDH1          14
 #define RESET_APMU_SDH2          15
-#define RESET_APMU_USB2          16
-#define RESET_APMU_USB3_PORTA    17
-#define RESET_APMU_USB3_PORTB    18
-#define RESET_APMU_USB3_PORTC    19
-#define RESET_APMU_USB3_PORTD    20
+#define RESET_APMU_USB2_AHB      16
+#define RESET_APMU_USB2_VCC      17
+#define RESET_APMU_USB2_PHY      18
+#define RESET_APMU_USB3_A_AHB    19
+#define RESET_APMU_USB3_A_VCC    20
 #define RESET_APMU_QSPI          21
 #define RESET_APMU_QSPI_BUS      22
 #define RESET_APMU_DMA           23
@@ -132,8 +132,8 @@
 #define RESET_APMU_CPU7_SW       48
 #define RESET_APMU_C1_MPSUB_SW   49
 #define RESET_APMU_MPSUB_DBG     50
-#define RESET_APMU_UCIE          51
-#define RESET_APMU_RCPU          52
+#define RESET_APMU_USB3_A_PHY    51	/* USB3 A */
+#define RESET_APMU_USB3_B_AHB    52
 #define RESET_APMU_DSI4LN2_ESCCLK     53
 #define RESET_APMU_DSI4LN2_LCD_SW     54
 #define RESET_APMU_DSI4LN2_LCD_MCLK   55
@@ -143,16 +143,40 @@
 #define RESET_APMU_UFS_ACLK      59
 #define RESET_APMU_EDP0          60
 #define RESET_APMU_EDP1          61
-#define RESET_APMU_PCIE_PORTA    62
-#define RESET_APMU_PCIE_PORTB    63
-#define RESET_APMU_PCIE_PORTC    64
-#define RESET_APMU_PCIE_PORTD    65
-#define RESET_APMU_PCIE_PORTE    66
+#define RESET_APMU_USB3_B_VCC    62	/* USB3 B */
+#define RESET_APMU_USB3_B_PHY    63
+#define RESET_APMU_USB3_C_AHB    64
+#define RESET_APMU_USB3_C_VCC    65
+#define RESET_APMU_USB3_C_PHY    66
 #define RESET_APMU_EMAC0         67
 #define RESET_APMU_EMAC1         68
 #define RESET_APMU_EMAC2         69
 #define RESET_APMU_ESPI_MCLK     70
 #define RESET_APMU_ESPI_SCLK     71
+#define RESET_APMU_USB3_D_AHB    72	/* USB3 D */
+#define RESET_APMU_USB3_D_VCC    73
+#define RESET_APMU_USB3_D_PHY    74
+#define RESET_APMU_UCIE_IP       75
+#define RESET_APMU_UCIE_HOT      76
+#define RESET_APMU_UCIE_MON      77
+#define RESET_APMU_RCPU_AUDIO_SYS     78
+#define RESET_APMU_RCPU_MCU_CORE      79
+#define RESET_APMU_RCPU_AUDIO_APMU    80
+#define RESET_APMU_PCIE_A_DBI    81
+#define RESET_APMU_PCIE_A_SLAVE  82
+#define RESET_APMU_PCIE_A_MASTER 83
+#define RESET_APMU_PCIE_B_DBI    84
+#define RESET_APMU_PCIE_B_SLAVE  85
+#define RESET_APMU_PCIE_B_MASTER 86
+#define RESET_APMU_PCIE_C_DBI    87
+#define RESET_APMU_PCIE_C_SLAVE  88
+#define RESET_APMU_PCIE_C_MASTER 89
+#define RESET_APMU_PCIE_D_DBI    90
+#define RESET_APMU_PCIE_D_SLAVE  91
+#define RESET_APMU_PCIE_D_MASTER 92
+#define RESET_APMU_PCIE_E_DBI    93
+#define RESET_APMU_PCIE_E_SLAVE  94
+#define RESET_APMU_PCIE_E_MASTER 95
 
 /* DCIU resets*/
 #define RESET_DCIU_HDMA          0

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260312-01-k3-reset-usb-pci-dd00afa7561a

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

