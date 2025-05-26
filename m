Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2957B20C487
	for <spacemit@lists.linux.dev>; Mon, 26 May 2025 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748269889; cv=none; b=O/jtH4JJKa9zyAXVL0szsOUf4DBuMdq9FAKHQhnQNHzYUKpeul5W4TRJGTMPSNHoBVNSdhWYNorML1FSc4Vh9+n/A+hoSJ6KKr7pPUbJxpM9kmWDYOlqfTgt5X6pFd4UfM1Jil9c0bTHAOM7Q7U2BlODovknK1I9IsRFT/DCAGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748269889; c=relaxed/simple;
	bh=gcnis70+Pp4V6XwUCZWMe9laz5neKSKoON4lydmTiBs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D7P17+/Sj7VZnPfqBL7i/ttMqapRCUYxGpAnscgaCoGPkeARJA7m7pcqQuMnGwmSJzhC8Lzn4stkXJgCq+PavNx47mKNnqVMr1AibywCjwgqebUgL8wX6SjHxlKCoU1aEX+i7SoOKse6EtrZLUR1+f/kra1aYDcStV7eWQJj+GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1670631d8;
	Mon, 26 May 2025 22:31:10 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Subject: [PATCH v4 0/4] Add USB2.0 PHY and USB3.0 PHY support for SpacemiT
 K1
Date: Mon, 26 May 2025 22:30:58 +0800
Message-Id: <20250526-b4-k1-usb3-phy-v2-v4-0-eca668fc16a2@whut.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACJ7NGgC/22OzQ6CMBCEX4X07JL+C558D+OBwiKNEbCFqjG8u
 7WaGBOSvcxm5pt5Eo/Ooie77EkcBuvt0EchNxmpu6o/IdgmasIpV1SyLRgJZwazNwLG7gGBQ2s
 YSlbIksqSxNzosLX3xDwcP9rhdY7o6fMkpvII9XC52GmXBZ0zBa5m5G3urJ8G90h7Ak/ub3WxU
 h2PgtElUt5UhUSzv3XzlGMz53WfeEH8GGp1fhCRgVQrpZmomBb/jGVZXunqzn8lAQAA
X-Change-ID: 20250417-b4-k1-usb3-phy-v2-fb1e41849049
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>, 
 Junzhong Pan <junzhong.pan@spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748269870; l=2723;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=gcnis70+Pp4V6XwUCZWMe9laz5neKSKoON4lydmTiBs=;
 b=ES3T8ThBYPhnWFUdpEYEU0elZxFQRV/oNOoXbaLOtRVXr/P8egaWbxEcEp7RGZbceLhhRSwXC
 iy/qrUjrBNrCb9BdULuDQHxhLGPTfiVPf0paMZn+mdKw3Pd66AIGx1k
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSkhPVh9LTBpNGU8fGklMSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktJQkxNTFVKS0tVS1kG
X-HM-Tid: 0a970d012dea03a1kunm41fed85011971
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MlE6LSo5TDE9EAwQTzU4FRpW
	FgowCktVSlVKTE9DSU1CQ0xNS01JVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFPSE9MNwY+

This patch series introduces support for the USB2.0 PHY and PCIe/USB3.0
Combo PHY on the SpacemiT K1 SoC. The implementation has been tested on the
Milk-V Jupiter and BananaPi-f3.

K1 includes three USB ports as follows[1]:
- A USB2.0 OTG Port
- A USB2.0 Host Only Port
- A USB3.0 Port with a USB2.0 DRD interface

USB3.0 PHY for USB3.0 Port is shared with PCIe port A, meaning that only one of
these interfaces (PCIe or USB3.0) can be active at a given time.

Link: https://developer.spacemit.com/documentation?token=AjHDwrW78igAAEkiHracBI9HnTb#part5 [1]

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
Changes in v4:
- combphy driver:
  - add in-code comments to indicate that PCIe mode is not yet supported.
  - replace custom spacemit_reg_update() with standard regmap API.
  - drop spacemit_combphy_wait_ready helper function as only used once.
  - Fix PHY init timeout handling: ensure proper error reporting when PLL
    lock fails during USB3 PHY initialization
- Link to v3: https://lore.kernel.org/r/20250517-b4-k1-usb3-phy-v2-v3-0-e0655613a163@whut.edu.cn

Changes in v3:
- improve commit message, provide more info about phy hardware
- drop superfluous local variable in `spacemit_combphy_wait_ready`
- replace devm_reset_control_get with devm_reset_control_get_exclusive
- Link to v2: https://lore.kernel.org/r/20250418-b4-k1-usb3-phy-v2-v2-0-b69e02da84eb@whut.edu.cn

Changes in v2:
- combphy dt-bindings:
  - fix reg-names
  - describe reg
  - describe #phy-cells argument
- drop stale ".owner" in driver struct
- add support for usb lfps_thres in combphy
- fix Kconfig depends on
- Link to v1: https://lore.kernel.org/all/20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn

---
Ze Huang (4):
      dt-bindings: phy: spacemit: add K1 USB2 PHY
      dt-bindings: phy: spacemit: add K1 PCIe/USB3 combo PHY
      phy: spacemit: support K1 USB2.0 PHY controller
      phy: spacemit: add USB3 support for K1 PCIe/USB3 combo PHY

 .../bindings/phy/spacemit,k1-combphy.yaml          |  72 ++++++
 .../devicetree/bindings/phy/spacemit,usb2-phy.yaml |  40 ++++
 drivers/phy/Kconfig                                |   1 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/spacemit/Kconfig                       |  21 ++
 drivers/phy/spacemit/Makefile                      |   3 +
 drivers/phy/spacemit/phy-k1-combphy.c              | 266 +++++++++++++++++++++
 drivers/phy/spacemit/phy-k1-usb2.c                 | 131 ++++++++++
 8 files changed, 535 insertions(+)
---
base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
change-id: 20250417-b4-k1-usb3-phy-v2-fb1e41849049

Best regards,
-- 
Ze Huang <huangze@whut.edu.cn>

