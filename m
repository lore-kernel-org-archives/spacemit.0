Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96385372E7
	for <spacemit@lists.linux.dev>; Tue, 22 Sep 2026 11:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075107; cv=none; b=WF0wO69QW/C/2L0UXandDUn8hLPF7h9d+Pyzwmt5mGlc34rtRmYFiDaRSkh0XJdDOGl0T580ereQzbB4J/FUFR2vZtHwTwBGGtb4xxAXHWlhfScl6t5RwlpvS30bu3/mXuYQWaCJocfJhvO3m6lQW1qiVy5tnPujDooqtd30bjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075107; c=relaxed/simple;
	bh=hx+SqT4b0nTPGXz8Zi1PItX5OUBohL8OCHRG+K1GYRI=;
	h=To:Cc:Mime-Version:References:Content-Type:From:Subject:
	 Message-Id:Date:In-Reply-To; b=uYGoYKSdHezeEmBvAWqoYBr5uWzTlmt/iPq/D5nRBpUF1E/IbUHXII3GS2E3v7nS6PXOOF2DnblybfA1sFDB33P5xSee6WKR5osEHsQ7UU15s0YtwSO4vgBbxMrzWR7F9woVOUN/Df7oRg5Or8urPFxPgWwMzqtZtSpNXTI7nV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=27nbDTW5; arc=none smtp.client-ip=209.127.231.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="27nbDTW5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1790075098;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=uNBN88CvitLbE8eK2wORQzJTthToTwfr/f6ZTQuKg+4=;
 b=27nbDTW50TJ+6t/QiIXCg4Yespoqr4RYHpL+CpcCO6BL/fRTv+JDFEt8uEvyn/u/Xhkv6/
 JikeyFV1jpj8gRUfYH0R1B+qB9lMzh27JlUUsW0+zdgIn4CDA4OMfAJmlpHbiRV8iIB4O1
 fABNfxg27eedUS3LjaoPlDkJj0oTj9mw9IMHv80p1DAVasTP3R6gsRGw5IH20XYNBcXg9I
 p4ob5ri6c5rWtEMFRt+2PKydThq74Ksr2hyL7KEigdgarestqMt6GBgXu+C4MdIC6ODxMu
 6nwfEr5ZyI1jYQ6GgZ7cUcMYREy4Wp8e2b3vz7KEgtC5NpWiRkFv/El79x81mQ==
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Content-Transfer-Encoding: 7bit
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
Message-Id: <20260922110450.3426070-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26ab260d8+8157d1+lists.linux.dev+sandie.cao@deepcomputing.io>
Date: Tue, 22 Sep 2026 19:04:50 +0800
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.111.1]) by smtp.feishu.cn with ESMTPS; Tue, 22 Sep 2026 19:04:56 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
In-Reply-To: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>

Add the device tree node SDHCI-0 controller for Micro SD card slot.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 55b0f63dcb2e..5d3f07483d34 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -2,6 +2,7 @@
 /*
  * Copyright (C) 2026 DeepComputing (HK) Limited
  */
+#include <dt-bindings/gpio/gpio.h>
 
 #include "k3.dtsi"
 #include "k3-pinctrl.dtsi"
@@ -184,6 +185,24 @@ &combophy {
 	status = "okay";
 };
 
+&sdhci0 {
+	pinctrl-names = "default","uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K3_GPIO(88) GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&aldo4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
-- 
2.43.0
