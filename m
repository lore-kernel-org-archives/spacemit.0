Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870062F1FFE;
	Fri, 20 Mar 2026 06:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773989512; cv=none; b=Fc5wAospjRWhSj6P15A3k3QL7P6SD3qxp+xYQx0qXjgGM9iAjCy/GgxDQ/2O7I6vPU9IoNfWMTux+3VuDQXLNGp8rbv+iXuSieBdHk1eGcFk3VGxO6iQjHgpN0MnPfX6TmrrmhLLNEOR5HirhxwcpHm+G8nS/hgFFuisTn7/k58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773989512; c=relaxed/simple;
	bh=JzGGgFZiTTIyi4BJILmEvvtpwxFmeY+UvnO8aSTAqPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FHhJodNB/7of5JYSCpJzrIPEHIgmj2EvXw0wAIAJobtb1sQ8KUSoJ+DOB/JtAVyOjf1O1xkCgt8uZGC3dxClW6a0XAl7107I3IEYjY+d0Dom2vr8gvcPnp5uqO30mtoVxYAAY1+J99GEXopNujMSFeJXrBIXsFeOUfsuCiY1bIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XA/lZ5/S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XA/lZ5/S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD43C4CEF7;
	Fri, 20 Mar 2026 06:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773989512;
	bh=JzGGgFZiTTIyi4BJILmEvvtpwxFmeY+UvnO8aSTAqPI=;
	h=From:Date:Subject:To:Cc:From;
	b=XA/lZ5/SrZY62jqw65JhgEhJai8gqe6LhGFVpI7SWuG6w0QNaklfLUuORwI40y2TI
	 w/8s3BOblBJ7P6o91yKAjhIIHsQxbtA/0/MFuL8oz21xTGE+VeauNS8/QQmBNV6Rnp
	 0vkszJMamyKzprAS2PUSR+DaH9weg1NhIx/pfRQCFviaUAyirxJ/uPF/+/jzc/+b6g
	 d7wFfFSig61AwbSzT3AyUd3QJEMIbX5P6w9rIHwX4KQLBLO3xSLXY0wv/nLrKy0W1t
	 DUJ3fzK/KAyFBgnTmusQSHMwXDl9YtHcZdcJTvcww7FYiliwmnOz8bWAS9+M2PGGbF
	 BpakNk9l/MuWA==
From: Yixun Lan <dlan@kernel.org>
Date: Fri, 20 Mar 2026 06:51:40 +0000
Subject: [PATCH v4] reset: spacemit: k3: Decouple composite reset lines
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-01-k3-reset-usb-pci-v4-1-7b4950c1d9e2@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHvuvGkC/33NQQ6CMBCF4auYrh0znRYaXHkP46LQQRsNkBaJh
 nB3CyuMxOX/kvlmFJGD5yiOu1EEHnz0bZNC73eiutnmyuBdakFIOSpJgBLuCgJH7uEZS+gqD84
 h2tqaLJdWpMsucO1fi3q+pL752LfhvTwZ5Lz+9wYJCEhUki6N0lif7hwafhzacBUzONAa0dsIg
 YTCVViY3GWk+QdRa8RsIyohrMvCalUZp7MvZJqmD97vE4BBAQAA
X-Change-ID: 20260312-01-k3-reset-usb-pci-dd00afa7561a
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Junzhong Pan <junzhong.pan@spacemit.com>, 
 Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=14087; i=dlan@kernel.org;
 h=from:subject:message-id; bh=JzGGgFZiTTIyi4BJILmEvvtpwxFmeY+UvnO8aSTAqPI=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpvO6Cp/l+uo6MwWtUZv85xHd6YfCamjVi22bhR
 Vyi5JUd+k2JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCabzughsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0SMA//SYLbk6MW1kt4Ya+CpqCYhUee14Wqim0QrZdta98b1hlBwdFTqSQ4n
 /kArUkY+Bz1q29RA+auX+Rb/DlxfTO5hTKi33M4fVWJiQQiu4TJgADZkREofqeZ9Uhl0m/d8rP4
 92cP5nxi/H9o83H+tCaWR7WKvyjclS71e9/UgqoAIxGkLqg9K8eOR60k7G2lk7v0vLmKhpLbvk9
 4EWFrjsDURpo0Wdu6qryyV7uZJlqaQq70g7oAYoEm57n9U4RaFIhq6s4FGgS3Ot9ulonPstgGfK
 7VXPFccqIJhjLRpwnE6zkeh0apIhX1gXuMCsdcGwV1Ehiw+B1SKn2zCUt97tyDXzGl+kl65ybXc
 AJdyddOkn5gsAJ71GBXEMGo4tlGc9xErH2A7h4GlezHXREh5d1g1uEtrJv5wKYrhs3HocEp9nON
 SuqCNPJxWzP22o5BFIzyCXLohfg9vhaqsscimZrYqXxTMzDGU3hW8pa9aD31Wox7RKViY4bn/KN
 IQ6KSdLZMBQCXVc09Jsi7GDp5lYuwXh43/OaKAXgyaw7HGUVAlZL7FmyhB66H93if3QGZCjHJmf
 0iRaPyxpmDbevehYQP0gN/jjPaDGtFlpcmwNzTv+UceMxyw5u8E9Vte3EuEPPKpzEt/dce6dAC4
 ufpnqh4dHypi+I4sBN43kigyswHqsU=
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
contiguous number but keep EMAC part unchanged to avoid break patches
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
---
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
 drivers/reset/spacemit/reset-spacemit-k3.c     |  60 +++++++-----
 include/dt-bindings/reset/spacemit,k3-resets.h | 126 +++++++++++++++----------
 2 files changed, 111 insertions(+), 75 deletions(-)

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
index 79ac1c22b7b5..5ce260efe25e 100644
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
 #define RESET_APMU_EMAC0         67
 #define RESET_APMU_EMAC1         68
 #define RESET_APMU_EMAC2         69
 #define RESET_APMU_ESPI_MCLK     70
 #define RESET_APMU_ESPI_SCLK     71
+#define RESET_APMU_DSI4LN2_ESCCLK     72
+#define RESET_APMU_DSI4LN2_LCD_SW     73
+#define RESET_APMU_DSI4LN2_LCD_MCLK   74
+#define RESET_APMU_DSI4LN2_LCD_DSCCLK 75
+#define RESET_APMU_DSI4LN2_DPU_ACLK   76
+#define RESET_APMU_DPU_ACLK      77
+#define RESET_APMU_UFS_ACLK      78
+#define RESET_APMU_EDP0          79
+#define RESET_APMU_EDP1          80
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

