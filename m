Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFE12F273D
	for <spacemit@lists.linux.dev>; Fri, 11 Jul 2025 18:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752258809; cv=none; b=ZIO1nkNkmnatwZf+s8MSXCU5gVTxxbE7jjqhOxcXRShFEebqCvlUuHL4jCUa6ispMk2OrIjUnjzEEb3Sbz5dKNKNzgHBenQU05Re6Wmb3VX01N9lQGDgkUYYq76x+/kmRkzOHqwXj/ot1kYjhNuZCJCbznOTiw76swX0zEQ81KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752258809; c=relaxed/simple;
	bh=I2K1uHXw4EQkyH35EpeDjkCvWXqIGNmebVNMyD1Rqwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZpkMisrlSluRyM4jNl71l0xSfEQ67p5CxEfzL1vXDUglXkrOlgUifeKNfMrXzcsK5j3Lo6sOJbPnPKm+/d/FTsHFGaLcT5rX8Ywlaex8NCokHKwHMFXM50JbiVBdXt/5Mslkgh1kRASRUjJT9cDCsGDO9q5LMiuv46L+PgjWfig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=nhaseFSo; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="nhaseFSo"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a5123c1533so1295007f8f.2
        for <spacemit@lists.linux.dev>; Fri, 11 Jul 2025 11:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1752258806; x=1752863606; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajLVmCN8EV1ROtFCYKGnJZHORiVxqh3PONYE32dE2Kw=;
        b=nhaseFSoApC0Wu536da6YMX4SyOPCQ23CWa9Eh0vu/FUQsiZM4SofBLnUIpIb175r0
         RjxTGK2dgrvgz38ikbLtrIY7txjyt4TB731iiFYe7Teqww2LI7GbXB04miTQlNYUeYxf
         wwngHO8h2D0A2vSYCzGGx99IyeJHt1MedYQv073cANn+3IJupFcZIdZ/B23U371VbBCX
         aq+9Msr822W3U764/jxmCD4Ip1yQCocgdheCVMO0n2zpYsyVlTuyiYv5jcgzO0XDGFWg
         KBT5gug4awriB/SiUTModtMGqk3MIsbGNFNLMrM1bHp7IhW8K4CT/hKG0wXVaAIYZucx
         SBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752258806; x=1752863606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajLVmCN8EV1ROtFCYKGnJZHORiVxqh3PONYE32dE2Kw=;
        b=T8rawUb9bM+9/Csh1Z6ubYq5SWUeR/nWqvYWLVyRU9BYh/+z5QGIOFOIR4RsG4maZI
         08ymk71dRku/dCOYYyGvBsQZHklyePBHT6oy4jU4Yz+D0OR6GtJZsrKDnSo//+097t4g
         9KEm/kd/Cvt6tsiAKXC8dUMEE1aav0xsK75wkGizpTsTfsOOfwPeAVv4SYZPV9+CnCdS
         U6spMte9ZtC7XR4Jvrx9Nym3jQ9WB+pPmrk1VP2mNmNJvOZmNj3QpzrOJRfiPRRScjMQ
         OSu2iMbWfUHVPBomi3GpvABWj0Fxs5g9YRH1YDZJXQyAjEocOMxK2mChvalsTXJnhDJN
         33mg==
X-Forwarded-Encrypted: i=1; AJvYcCWCSwo0jg00Z5wU72rHTgL4Kmf5vDNZpMJPI/fa9qOQuzN29zeqPHrUo/PxqxJeXa9+fPLUqz6XbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzA5r8iK4eAKKozoRG9CyLdhyVmDRMqILehx86DwT0HhNMWm6bG
	3gbSO/lB8N+kTHihVh1msOfUYQVLF4bNQOG/CbYGW9+9xhAdjRo2EaJgDcHBxRFJB6U=
X-Gm-Gg: ASbGncs3bUrdnq3o+FwNgz9IL+fYder28dZ71yUyKwrLTvkOz3xuDqZSRPbA6qN3pIS
	7uZaxPnJ9yZPzFZnWedMUt99VZYuKrCMH3HZ6wgRzDJZXq6RPhIgkc0Oh8O43hAr+RZEygkdpHG
	aJOQn/QB8a/85yssKjOOgXBIWWfdj9o41ptJgzNVMNJ58C0LE5QctY5RSmD6u5WHHAIbA6ZNfyF
	xzLY7+AcQJJWjzUUNOwuuwSUNh6v5kaDTnBKl+zxLnvsallGcbwBtiLUss8Ofljj1PZruzDU3FQ
	8CN7OZBBQFqQ5EKI8Mn1xeyBzwuXDJaT3157Z0xbRTrBymCxgVkuPNLAsgnxYqDmN4wsSRPWj3Q
	m0ir7lsUgKWJy8J0E5wsnEgyxVH8bpRKlMmvVzEEdmwGOD2yGQek7iP1X5Uw0
X-Google-Smtp-Source: AGHT+IHoIVVNWSLMADUf1EqgQlVt++Sa+z/qkL2VbBz8sznu1zu8Z81BC5P4gKRYQcV0niTuA1b6wA==
X-Received: by 2002:a05:6000:4108:b0:3a8:38b4:1d55 with SMTP id ffacd0b85a97d-3b5f18dc7dfmr3898978f8f.28.1752258806040;
        Fri, 11 Jul 2025 11:33:26 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:bed2:2848:b66c:32d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45601053020sm705205e9.36.2025.07.11.11.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 11:33:25 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	palmer@dabbelt.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH 2/2] riscv: dts: spacemit: Add OrangePi RV2 board device tree
Date: Fri, 11 Jul 2025 20:32:45 +0200
Message-ID: <20250711183245.256683-3-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250711183245.256683-1-hendrik.hamerlinck@hammernet.be>
References: <20250711183245.256683-1-hendrik.hamerlinck@hammernet.be>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial device tree support for the OrangePi RV2 board [1], which is
marketed as using the Ky X1 SoC but has been confirmed to be 
identical to the SpacemiT K1 [2].

The device tree is adapted from the OrangePi vendor tree [3], and similar
integration can be found in the Banana Pi kernel tree [4], confirming SoC
compatibility.

This minimal device tree enables booting into a serial console with UART
output and a blinking LED.

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Link: https://github.com/BPI-SINOVOIP/pi-linux/blob/linux-6.6.63-k1/arch/riscv/boot/dts/spacemit/k1-x_orangepi-rv2.dts [3]
Link: https://github.com/orangepi-xunlong/linux-orangepi/tree/orange-pi-6.6-ky [4]
Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 92e13ce1c16d..152832644870 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-bananapi-f3.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
new file mode 100644
index 000000000000..8313f9589cd2
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2023 Ky, Inc */
+
+/dts-v1/;
+
+#include "k1.dtsi"
+#include "k1-pinctrl.dtsi"
+
+/ {
+	model = "OrangePi RV2";
+	compatible = "xunlong,orangepi-rv2", "spacemit,k1";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x00000000 0x0 0x80000000>;
+	};
+
+	memory@100000000 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x0 0x80000000>;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led1 {
+			label = "sys-led";
+			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+			default-state = "on";
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_2_cfg>;
+	status = "okay";
+};
-- 
2.43.0

