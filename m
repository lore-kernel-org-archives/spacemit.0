Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599330;
	b=puKp6LHf60Y8fmDHY2LrFWMc9XSK8pf9Jnj2xsghAEy7WX2mz8R+z9s/LxLCFwjgLmJ4
	 l0FwkNxkFZ/RedMACeoqmC/gh5Ft+ZU8fpw+NXZaiAswqkyNbSB1QPtZ4SEXbVuQOj5N4
	 1vU4ggYvVi4xaQyiLE1rSQfpiaN+dSsy6PV2PV8Vy7fo42Z/2Nq+yJOhHh7Lz8jdalCmG
	 P+mlvkvN7OWHxEm7ySD+yRMUAphmD6LAEPnLhOF0Z9rCCF+XO40EOFL5/RcXuAXX9thrU
	 Dvycl4Rhmd2vCOHPgwc92tQggPRltumq/i/TMSxkXBL7jqUweDVXPOZ15Cjo5lpYiDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599330;
	h=DMARC-Filter:DKIM-Signature:In-Reply-To:Received:X-Original-From:
	 Subject:Date:Message-Id:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:To:Cc:References:X-Mailer:X-Lms-Return-Path:From;
	bh=quTJ/XxVKV0teBm3OuTXvbxjmUOvYB55/JlNClrvCTY=;
	b=trR0QaHx9b8/kB77N8bgVOIgoIvcxBcZRdPOM3ikK5iFqfXsd3hVyDqQaIeiPgTsfuoA
	 4DdgaNQoo1/75+Y1dLPkluh4aa3sRZNv30K9SsNatdJO66ri/1cUNX+PJ/seDGl79bC+O
	 nnhI3chD9NPzh4A6gdM45CqYOUd2snn+8CDZ6ankU/SMkzh+l+vsKIgVYHGZSyuKi2BSq
	 Q4xKd8K+tgvPiRpqQMAn/WF3XxAp8ley8feZmTfj7MIPfCPSF67xn8si+BdkAze2/ZEvw
	 +/8Ziw2V13oYmF9pg1jNJp/E75BedkY0mtvmWBKyz7b7gmYMuKrzlBxn3m80EhKAVOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=dmF4c2Ke;
	arc=none smtp.remote-ip=209.127.231.39
Received: from va-2-39.ptr.blmpb.com (va-2-39.ptr.blmpb.com [209.127.231.39])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8DF606A329
	for <spacemit@lists.linux.dev>; Mon,  2 Nov 2026 06:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE8DF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=dmF4c2Ke
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1793599325;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=quTJ/XxVKV0teBm3OuTXvbxjmUOvYB55/JlNClrvCTY=;
 b=dmF4c2KeVgjBaSl49yyGAn1BIljqAmXQKyA3R+CsgkglqMoPBV9ZJ9pNrDgOGnElcLjEPo
 3AUn0nTkyPCzkgvk/l7vqyLzM0/EziuSXUHyyNe6ud7INEK1iPhKt5vb+91YIEURspJKc6
 nT8t+S7QSNh6SN2vqBwxJTCr0kLGzuy1a0CuQIPc9i36/M1vBlfF3jHcTNLansKRM2Zr+q
 XliXL00QVwPEsfAIjAb3gBcByd1j+y28AnLTZ0a9Tbbjdsm9On1orjyj5PeEP3qmvIPf1w
 hniVHfNaGj4tlp7QCdB8u9N1onIW5AnDzu/1noqB1CXRdF0ou7NXXyRx1rDJ/A==
In-Reply-To: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([113.80.9.210]) by smtp.feishu.cn with ESMTPS; Mon, 02 Nov 2026 14:02:01 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Subject: [PATCH v3 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
Date: Mon,  2 Nov 2026 14:01:55 +0800
Message-Id: <20261102060155.100679-1-sandie.cao@deepcomputing.io>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
References: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
X-Lms-Return-Path: <lba+26ae8275a+65b189+lists.linux.dev+sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>

Add the device tree node SDHCI-0 controller for onboard Micro SD card slot.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 84f66dd8f962..4471338a9774 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -184,6 +184,28 @@ &combophy {
 	status = "okay";
 };
 
+/*
+ * Onboard SD card slot:
+ * Plugin/Plugout the SD card before power-on the board for secure.
+ * It works as a boot media. so set it to non-removable.
+ */
+&sdhci0 {
+	pinctrl-names = "default","uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	non-removable;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
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
