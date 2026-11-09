Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794195243;
	b=jSP82qapIGZ5Dob55yWtI9YrS/MpYUEgkRXpy8a4F0H9+s7ARLeHE39YcgxWvCtHKUow
	 NMlHDk7WD30/0RDssOIwFzh+nrHyqLCofM44v6dzhhhDRAzpMESrBR5rcwgBWUG8tt2OW
	 EnfGDbNqFyWj+wIe73Yz8XXx77Eud+c+Wfe9Ks8q2VSRyURQjmZAZildmpPcb5l7faBet
	 22V0cEaRC/he8zRoPtqBhZiiBi8BKK1BEAuFMLWvcO/0EjpyE2E67VIPotw1h3e4bepfX
	 M/bMCktPeq7a9tMA+azwnSgRWbPzHi0ecP7LJkzCtRC2emZukHTAL+3Z4LJ3/sugYdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195243;
	h=DMARC-Filter:DKIM-Signature:Mime-Version:In-Reply-To:To:Content-Type:
	 Date:Content-Transfer-Encoding:X-Lms-Return-Path:Received:X-Mailer:
	 X-Original-From:Cc:From:Subject:Message-Id:References;
	bh=DSfjtHSZUsSyQaOs06LHZoC4jG8cLJJQqat7HHI0wIg=;
	b=Q+2HFkoMDsdZlusnQcUap/rQEaZ/DyId3Xd7h6wIEctpRwk0hUGbIr+oYV5sMbatp+rA
	 SELJYExSw5Tiwer6PRnRZr9YFwBpNsjuARmormxA+MPDnUCgFbAHePqlTo3PGRvhNvqSh
	 FBTCrYGKklwjRROIlh1EDr14/ffRG6IdER1Z8cPbKMrWFrdPlEklmwQtEk/YV081nF0IB
	 OPethLIbuT7WlE9afeEzf88abdj6IIODz0L7y0so0o3+YK/nRXf3y2FQKsmXeMrtjPlfK
	 I2LunUAzXDOjGZ4lH4B6lhW3lvOQ35ZUxg9DpliZwCMwNTqvw07cP03I1ZH5uh5OO+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=23VbAndK;
	arc=none smtp.remote-ip=209.127.231.35
Received: from va-2-35.ptr.blmpb.com (va-2-35.ptr.blmpb.com [209.127.231.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07328606A321
	for <spacemit@lists.linux.dev>; Mon,  9 Nov 2026 03:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07328606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=23VbAndK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794195237;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=DSfjtHSZUsSyQaOs06LHZoC4jG8cLJJQqat7HHI0wIg=;
 b=23VbAndKn2vzgoyV8Rt3mY6dm38eeUzPdCuGHqwWHrcezmWVtX4TtaAG+0S8ll59IZa0V0
 6wD8KQUI30OFafQNqWDANEt6BX9DTSbQbZ6qresxEpC9H6DOVmjRIELJTaI2y8ajXvcYRO
 2gCA6fyQE7WObssu2ho/KuQvAFuQksEf+2YeresvP//ke/HmDrZsrG7Z6IBg8onOQL8oub
 vDFiLkJH3bxsrZ7M0ihQdcHiiITFsNLCHMIqqD+YKiZhxVAKgToszzI8WQKgUOoK5AgBKL
 YNqR891AkbClFc0Z6oWutu7TeoX1rQc0NUhihwMw3SjDhGNdpM68jAlDRYFJKQ==
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset=UTF-8
Date: Mon,  9 Nov 2026 11:33:48 +0800
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26af13f23+8e41c0+lists.linux.dev+sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Mon, 09 Nov 2026 11:33:54 +0800
X-Mailer: git-send-email 2.43.0
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v4 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
Message-Id: <20261109033348.361452-1-sandie.cao@deepcomputing.io>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>

Add the device tree node SDHCI-0 controller for onboard Micro SD card slot.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index bcd533484a73..051046fe90b2 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -177,6 +177,28 @@ &combophy {
 	status = "okay";
 };
 
+/*
+ * Onboard SD card slot:
+ * Please insert or remove the SD card while the device is powered off.
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
