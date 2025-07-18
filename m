Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6072951CA
	for <spacemit@lists.linux.dev>; Fri, 18 Jul 2025 08:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752828271; cv=none; b=kXWmNc6VkU8iXNNDeHRY/u/9ZUWccOnahcb4sbTh5oymV+fejS+1t0pkWXcuyTYTRqSBjcneQVDEsvFoDwqePTNAKtPwHrzTqvmQEUGtQAHGVGTfUqMSghGJ5dW5blctmu1kX/L4XDFclob6hA6Zq1295sZUXnwbNQlGB38U+fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752828271; c=relaxed/simple;
	bh=b2MYDK+PAwESQkrD0k9SN6tJHVK+oPHFALbYh/bbzxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GkVfuCTb+2eeyXyvfPK8+FZN24xQR+Vat+mkKSPMax9hac9R8t2YzZvaMXhcaRbAY6IpLZoQ9fFrh8EOKScr7wKytGZdFd/Dx4UL5erb5ILVwYoC7F0zYYLby3A48kDWq64MkRqqWwQSKuZL5xpFr5bzj1VPbpbJoOm4o+5Yuw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=U9XIWTVk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="U9XIWTVk"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45629702e52so7664465e9.2
        for <spacemit@lists.linux.dev>; Fri, 18 Jul 2025 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1752828268; x=1753433068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZF7vneJ/oeaOQ29Nz/sbY4GH4SE3qUarTuWdFIe75qc=;
        b=U9XIWTVkV5NP/0RBOiCc09Yo0OPwca+w8Gx5Ebza7JqjzLKBY6wPdsJsKMropzilHo
         LY9t0kX7p3iHTTdStTHGXlTovnQ8N1LWMeimyFk48tmgJnYnfB0PkQX0GxRnfYaMWo7o
         6jE9YAg0+e6gq4FDxfBy/LNZe9VBiCBzRK4MrzWsgePenZfMlRHPfDrcDAknAPrXVLK4
         Y6q8z5ArU83qh9eZ2HyTZbcPXicvy4A4SsdHL2lup+5H7fvrdi31nFi708Q4c+xDMftY
         fV9LdR/mjG4p2oJSgIdhkMiDK783wlPpyDk0eZKUMCx0FYKxsS/jvdOoBOFveXfdO2Gu
         vHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752828268; x=1753433068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZF7vneJ/oeaOQ29Nz/sbY4GH4SE3qUarTuWdFIe75qc=;
        b=bck5lgWjtgXN+3rEkbciz/SxES6KiXZYupgwCS5Vmfjv2vQ3Y02rlxWdfyWtKnpjP3
         WCb9Hr7lWCdDtrDOz0hv2bu7TAFm28wXdBIG+zpQWnXM8EitdyaxXVnl+7QOVkKISHAf
         Ys2PsCLPRD9Vbd30ydNmf38T5mewnSzXk41eU8ftiiZKuPjAqltyqyrUG9Xc5UFgy/sx
         IjtkfM77qMCbw0DUZsx00KBnoDMlJcwcw62OlXU6cAQ7sEu1o1FEJ0hamPVjEVxpXPMe
         9n0II4ALNXfTIihUq+78YDhqMTk4HwVkHOMGXXO+HXs2TK+yND1uhK2avOIG9c/26n9G
         mEMw==
X-Forwarded-Encrypted: i=1; AJvYcCWBqLIGOdM1Zx0G/BiuEOj9DdHydQUbIawrXiK82ePHMOIHJAk0AwHwnwAAtxCX3k6saXwwbJYO1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPBvDZkswJ3AMUUe5fxW1hvAF0rgkpf9EVynJQsggcZnE46HzA
	xdaUyO8dMGAbyvUUGqcW7xkv1OdpXyTjbIy1vI90a37XhX7kiXMTHDpdc/zF70zANr4=
X-Gm-Gg: ASbGncvJ9zKEAdrLcWThVKIzvEW388bZkuSjm1MTaigSy57OgwOlwGnyLH3Iov/sHxl
	8Epi4TumU4vupecZjz77/1F4eKJL2aZC+bd7tG+FsIZQZ0Q9IUwGSj6B7MGsxXZXjgKcMzM41RM
	2ivCtODa+/3mlCJEfSYKK28jE1wVShgzQk9lvokBdUJGdAqM2cdAOckO4BUR0O9wahF9ZC6OTGQ
	9SAYx6H3iR9S5lUUwCNuWjtxwoZrMRZ5R33AODvrqwiumKRKgIYyatjt3pbu1HHB+QkfKfumq2L
	+CHu5HwmJHDgG6yt/NZlRujvvtXyGINPy4msZaAP/iJrqyy+rkZq0LTygggpDYyPOEBJazWN+vt
	SLxu637fbIWkjeQp9JlJfW8pdw89lXy32Y6FCcnxkydejnJBi
X-Google-Smtp-Source: AGHT+IGqz0s/AaH2jo7lzKlm58e4CdVC6fpR5T/WfzdfwX2FhNDW9nmVqoPf2WlNPuA5uOQWGsE3zg==
X-Received: by 2002:a05:600c:8b0b:b0:456:1442:86e with SMTP id 5b1f17b1804b1-45635e6d11emr49725385e9.21.1752828268318;
        Fri, 18 Jul 2025 01:44:28 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:9aa9:dd5c:bad6:e31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45627962384sm58208115e9.2.2025.07.18.01.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 01:44:27 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	palmer@dabbelt.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v2 2/2] riscv: dts: spacemit: Add OrangePi RV2 board device tree
Date: Fri, 18 Jul 2025 10:43:39 +0200
Message-ID: <20250718084339.471449-3-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250718084339.471449-1-hendrik.hamerlinck@hammernet.be>
References: <20250718084339.471449-1-hendrik.hamerlinck@hammernet.be>
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
Changes since v1:
- Added the aliases section to the device tree.
- Removed the memory section, as it is populated by the bootloader.
- Replaced unclear copyright similar to the other K1-based boards.
---
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
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
index 000000000000..337240ebb7b7
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
+ * Copyright (C) 2025 Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
+ */
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
+	aliases {
+		serial0 = &uart0;
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

