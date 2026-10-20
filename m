Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484449;
	b=FmTbEkDAbqtNg+a2rDF4aiuyoROEBfL3ky4NkQYiNoPixXLxupR78oFX2WgROw5p7zdR
	 +5rXYnfjpicANMPWvjsKWdBhTmd5wkB7TrJah2G78PZwRUeCyIba7VDYQmJVbhyx3ZunX
	 IsM/iYZMfFC+uGFoEhuTE7Bj+wyGKau3YMIphyy4MyjOq9vDqS6Kko59cMNBHngujccX7
	 r90phR6voIS/gvSAuPyZLa3MRA4KlMrICAM0UAwVFQkM38AN1Y3IeXxgvYBA+pvzaTWXL
	 upD11XQT5Zv2zSiFuUVh9ksyW1wCeco+JuCgigkKc2bM/xmk8qqKxBW+7aLmuohLVDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484449;
	h=DMARC-Filter:DKIM-Signature:X-Original-From:In-Reply-To:Content-Type:
	 Cc:Subject:Date:Message-Id:Received:Content-Transfer-Encoding:
	 X-Lms-Return-Path:References:To:From:Mime-Version:X-Mailer;
	bh=Br+RwhEUUjij+LQeVh8KN+b6c87vkCnWluLTXLQF6m4=;
	b=EKiYBNfWwq9v+IfUW0KfQvXBtbLODifSDBOqlP2K0YLEzDkPtr6hYIKN2nXlUQ2AebdX
	 KrIKhi5H/orYpSW5ogtd9n/7FCf8z+Sxl6RNXZO2SvOuLBAR8ol+Yn5TxuUTpP+eFCX7I
	 xFUl0XLDpSw816AwlT4LDQFx0X+FcctZS7+K2jFyfQm570UxEyMnZwXm40UN+ppH/zxjc
	 UCAenfSKGd8NCmIZkjNvTox8rwx+fw/Mu2CEYAnM5Q5/uvuPJ9p1zlUPCZkc/CaQzFjzx
	 KpqT4pwAmYt9bF2zBDaycXeKk/c26CA6fYXaXfbcnuZmc8NM27eQI2A0/3a6Xy9Kplw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=EYlIhu4G;
	arc=none smtp.remote-ip=209.127.231.28
Received: from va-2-28.ptr.blmpb.com (va-2-28.ptr.blmpb.com [209.127.231.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ED960A2600
	for <spacemit@lists.linux.dev>; Tue, 20 Oct 2026 08:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49ED960A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=EYlIhu4G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1792484436;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Br+RwhEUUjij+LQeVh8KN+b6c87vkCnWluLTXLQF6m4=;
 b=EYlIhu4G94jqyMPz4MCSLFwcIJNVbmambYLs856HrhkBjjGF+rLxM0NV0pd4UBQ7lwUgcZ
 IPKnP2vzE0u+l9JYjU1Eoy84yqD8L3qPVyRKUzt3G7If6Hiu3Pz1t75Q0HDKdLFp+OSqD+
 zdW0naFaeIuoZw32VVJ5Kiz4sR6k7AsPWm/39RI/0trADk9qkwz8z+IRK3CAZWN94cYYEU
 Ou7B2F5HvR/aFmPk3QcZNJxV8rP7o3J9ateiokfhaNdyDLtLP7O6KpZVY6kDcPS2mSN93n
 m6OSZ+iYqCQU2hgOfXKtb3LxdLwaCtcKonI+VT9HLnPuwJJaKlgJunz+RA44Bw==
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
In-Reply-To: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v2 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
Date: Tue, 20 Oct 2026 16:20:15 +0800
Message-Id: <20261020082015.3673761-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([14.155.180.235]) by smtp.feishu.cn with ESMTPS; Tue, 20 Oct 2026 16:20:34 +0800
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26ad72453+6289ef+lists.linux.dev+sandie.cao@deepcomputing.io>
References: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0

Add the device tree node SDHCI-0 controller for Micro SD card slot.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../dts/spacemit/k3-deepcomputing-fml13v05.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 84f66dd8f962..09e3d46a2ea3 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -2,6 +2,7 @@
 /*
  * Copyright (C) 2026 DeepComputing (HK) Limited
  */
+#include <dt-bindings/gpio/gpio.h>
 
 #include "k3.dtsi"
 #include "k3-pinctrl.dtsi"
@@ -184,6 +185,23 @@ &combophy {
 	status = "okay";
 };
 
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
