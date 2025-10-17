Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06651337109
	for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 14:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712621; cv=none; b=bwVDXGP1yF2GG811yl/0M8uvdfmN5/8VEEi22voe6cNWsGRA+fDDxvIVRDxFSmbN0YzEHHssMkO7400eN/2dCLw+flE7neRAlBvZf5rj3/+LH8b88W+j6r6USU4JwgUNHZHpV5DtK6lNU0oDcqxzavBTkRhcQc1u9bcPIXOWKp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712621; c=relaxed/simple;
	bh=xYFfzWZY7PNIWVX+rajaH6POYLCZB9C77midjP4KBqU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WhOrKEzkzfdwQmfQii0vQ9bmK1kJA3yTX8o2k0gNyHwE37BpoKjAq2oyMurEofhzWtQui6kq8TDQll9gfKSbcpxFQcqlUV1zh+oLFx5+DxxH+sq2tnxFSLgGlkyfA33GPW+CK68xjUZpgiMyzaYcSQVOtRah1FPXK1r3tWTR0GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=A9KtzhW8; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="A9KtzhW8"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760712616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g8VnFRXvUE1a7WW0NcsEXBWswsB1Ob1B+aHFeZOT43Q=;
	b=A9KtzhW8vX/snE9om2bhA6I1L5Htv3q8dEoRCpGTh3TjR/edET9V4ijT8DMLP35QMBErwe
	T9VnEGVGriuBveX6GfdUL+WR8c676ogFXfwq+lPg71K9t7UIKJZhnQcQvHtCCnfKnBd9jh
	gBnOGaS6xshy9Xt3f+s2SxOnNH1cO10=
From: Ze Huang <huang.ze@linux.dev>
Subject: [PATCH v6 0/2] Add USB2.0 PHY support for SpacemiT K1
Date: Fri, 17 Oct 2025 22:49:51 +0800
Message-Id: <20251017-k1-usb2phy-v6-0-7cf9ea2477a1@linux.dev>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI9X8mgC/yXMyw6CMBCF4VdpZu2YTqVoeBXDoi2jTAy3FoiG8
 O40svxOcv4NEkfhBJXaIPIqSYY+o7woCK3r34zSZIPRxpKmO34Il+TN2P7Q2Rs3BTtLXkM+jJF
 f8v3HnvXpyNOSm/M5gneJMQxdJ3Ol1vJKD4yBoN73A+qT6peJAAAA
X-Change-ID: 20251017-k1-usb2phy-a53ed4ea51b0
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Ze Huang <huang.ze@linux.dev>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760712608; l=2988;
 i=huang.ze@linux.dev; s=20250705; h=from:subject:message-id;
 bh=xYFfzWZY7PNIWVX+rajaH6POYLCZB9C77midjP4KBqU=;
 b=R4jbqMiXxfoldJxe/h7zcsqp7UagTAXHs+vpcLA/FcP/NhTgQMJ4npqDGP1SeRp0KejyrQgwY
 Yg4aLPHxTgHC0UdhIlBHslzcV5One7kCDUKIwXCj5SiGvZUUi+I2bLd
X-Developer-Key: i=huang.ze@linux.dev; a=ed25519;
 pk=Kzc4PMu5PTo8eZZQ5xmTNL9jeXcQ9Wml0cs+vlQpBkg=
X-Migadu-Flow: FLOW_OUT

This patch series introduces support for the USB2.0 PHY on the SpacemiT
K1 SoC. The implementation has been tested on the Milk-V Jupiter and
BananaPi-f3.

K1 includes three USB ports as follows[1]:
- A USB2.0 OTG Port
- A USB2.0 Host Only Port
- A USB3.0 Port with a USB2.0 DRD interface

Each of these ports is connected to a USB2.0 PHY responsible for USB2
transmission.

This series is based on 6.18-rc1.

Link: https://developer.spacemit.com/documentation?token=AjHDwrW78igAAEkiHracBI9HnTb#part5 [1]

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
Changes in v6:
- phy: spacemit: k1-usb2-phy:
  - Fix clock API usage and ensure proper clock disabling in error paths.
  - Refactor Register Definitions: Replace address/number-based macros with
    feature-based names
- Link to v5: https://lore.kernel.org/all/20250527-b4-k1-usb3-phy-v2-v5-3-2d366b0af999@whut.edu.cn

Changes in v5:
- phy driver for usb2:
  - convert readl/writel to regmap
  - fix typo: sentinal -> sentinel
- Link to v4: https://lore.kernel.org/r/20250526-b4-k1-usb3-phy-v2-v4-0-eca668fc16a2@whut.edu.cn

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

Signed-off-by: Ze Huang <huang.ze@linux.dev>

---
Ze Huang (2):
      dt-bindings: phy: spacemit: add K1 USB2 PHY
      phy: spacemit: support K1 USB2.0 PHY controller

 .../devicetree/bindings/phy/spacemit,usb2-phy.yaml |  40 +++++
 drivers/phy/Kconfig                                |   1 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/spacemit/Kconfig                       |  13 ++
 drivers/phy/spacemit/Makefile                      |   2 +
 drivers/phy/spacemit/phy-k1-usb2.c                 | 200 +++++++++++++++++++++
 6 files changed, 257 insertions(+)
---
base-commit: cb6649f6217c0331b885cf787f1d175963e2a1d2
change-id: 20251017-k1-usb2phy-a53ed4ea51b0

Best regards,
-- 
Ze Huang <huang.ze@linux.dev>

