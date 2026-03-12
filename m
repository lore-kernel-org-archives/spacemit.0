Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0B436921B;
	Thu, 12 Mar 2026 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773311680; cv=none; b=U+RT7caWWgxi84eYIffDxBrlwwVSuhqbbpSCiwC/V0VKIF960i2XRGrpbfHOePONXXNXhomg/K0m2fsscZ2QFbwHw4lEfsi1zvb/mYDPz0Qac4UpHdSvbzRlRNYH890uyP0cYcVrBmfoabY7yyTo9at25/499AdmWAu10mZYTuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773311680; c=relaxed/simple;
	bh=4vJ6d7QV3xPwTiykwfhRJzRwAyeVmoWsLoGPFgfmzm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cYbJ44QPW7f0LMNBwXcoErsdftS8On2BFRBu+xC9tchpdLR0EpN4a1XuJrq7voLTtw0eBIETmf3HNuR9JaiDDo2yIR+YeXjcHCR3ewaQSC7OdWaFYPf8XJY9SBP9u4Zdk2jPjv9gShkvtW3sWXo5DYNJmDef27RTl2KSz8hVYsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMiq6hNu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMiq6hNu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359DDC4CEF7;
	Thu, 12 Mar 2026 10:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773311680;
	bh=4vJ6d7QV3xPwTiykwfhRJzRwAyeVmoWsLoGPFgfmzm8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FMiq6hNu2fSPkZAoChA+OY3rsaeClBJUNjaGrA4OoxLhg19MOS96dCTbyvEiCK52+
	 3o3Sz7O1hxxZShzlfuTGBRV+G4REkXSBzLoWWqk+5olXaCx7Wssh4rql0Uj7R5TLCF
	 L6XPs+OGAkkM6lAKeGdFcExvL55rdr4D5IlCyCbeHBCTdUkM9pICKTU9ub0FjgXc+2
	 8FEKAP+xbRWjkYDllEhUMRaUVUPvEXnlfmXM1wRvXLVDBVZ3speZLlXtrFa7n0xbJk
	 62ZZtTFClbn2cLobTWHH5ibaei+7PdV737TTkTM3gMUOJxH9UyzNTNGm8TIz1L03h1
	 lWYz+j+M4D4GQ==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 12 Mar 2026 10:34:20 +0000
Subject: [PATCH 2/2] reset: spacemit: k3: Add individual reset lines for
 USB, PCIe
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-01-k3-reset-usb-pci-v1-2-022b24b7340f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4967; i=dlan@kernel.org;
 h=from:subject:message-id; bh=4vJ6d7QV3xPwTiykwfhRJzRwAyeVmoWsLoGPFgfmzm8=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpspaz/pVzM7e18puyPKELV6xMhE3HoSQ8uC9B+
 Nwrv+1mIFCJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCabKWsxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1ZrA//RzGpjGigz45qGwFV2To8lsLhZ64SokRG5vKKj1vwOKA5eXHCbQlwW
 t2HLAeIABB6ic2Iug2CRXyQrDy6V+gX1oN6GfGDZnSQTQZqlIuJmYD1YILMiB0naqt5i7hUQqPU
 /fouQamRSwrgsZQtghRiSo1x6QVWezC1n0epVY2Esxd8A9A2yQ9iiGfUjZ/rUzz76Tqbx6G/6b+
 y3Aa8rAB8076KpMqzwe6Z+2ae/uy/J1XmR19+Pq9Eu69x0a2EQ/g+OwDbbDt9K8mJZ/BdJIAjcF
 tQA4jehxhhMDrRd6esOdYwxfIvZs+XIra3HvAMiJJ57PQMLI1SiCMeVykkaQmQG700waeuPUP9u
 403YrOPm8sRRRvLAAN3uQRAg++hEWuEtC4l8/EMmJQ32/wwy+6lu1oXespixWsxB57JzhKkPrqT
 SL/lUzHfENqqDTLn/gBrALlRYl5ONGLYZidLZF8T8vVTdmtwGipYNIq092V+sIv1nWOkpn0d7+l
 Yv7zyaFzAT2Cq6DcLK5ANT238aNc7gDhkn6/YKXtJhnSJd1UiNNU7gayrl4ybb2Yakm48BOBQqM
 YTaSgcQ1xxGKBsII+bKCDrVzFO9Fj0YsFfaB4Vv7G8k+6Ppm0Rj8PF2fYIUpJILoNnx4B4E+zP/
 fQTcFGOjotbGOfgVCcGP0BNzxwSXzg=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The DWC3 USB host controller in K3 SoC has three reset lines - AHB,
VCC, PHY. The PCIe controller also has three reset lines - DBI, Slave,
Master. So, decouple USB and PCIe reset line to individual ones.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/reset/spacemit/reset-spacemit-k3.c | 50 ++++++++++++++++++------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/drivers/reset/spacemit/reset-spacemit-k3.c b/drivers/reset/spacemit/reset-spacemit-k3.c
index e9e32e4c1ba5..9f58526b0119 100644
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
@@ -164,16 +169,21 @@ static const struct ccu_reset_data k3_apmu_resets[] = {
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

-- 
2.53.0

