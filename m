Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521862F1FDC
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 09:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077020; cv=none; b=Po5TNEvnhh1xE2qJj+rFfZNQ+NJg8ajGB7ZYrmfIiDQqQ23NERik7oGMMACaQGj242LOMdPgmAcK7yLUoenS7xfGcExpNosrd0iGWmcJHllD+9V9qi9Dn+nn86ycJk7spifayjZhXPU/+IEy0NsWiq6fYgOH4G6MB81z2hjOX88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077020; c=relaxed/simple;
	bh=YgCbgenFVOzNh67wJb83oSCGyPXaTZ71l6QIJbUP6yE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WOxWJ0QwjQvxK7dJbvh1OkHVcyrdMUTvlhuFBMD4lCaS9yDA0GedUGhQ+/9Rx+MJFCd5qF1vgt4fp4jFSWsaxM5hUzi3PbfA3L/4Ow5xOVU31jaKLgtn5pEq8G9Gxs0895dTqkeGX9OMEpvKNmduuec6ZVAyPB7StyrV2Lqt8Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=T4sJmNqX; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="T4sJmNqX"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9141866dcso910162f8f.2
        for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 02:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1755077017; x=1755681817; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1TU+Xl0n1RhqfO3nfZOueztwfTTkM2m62EBReINxsY=;
        b=T4sJmNqXEhfbaLCFA/rT9RbesCbbsTxoLk43tePr6QHUfp02MLlNqw36wI1NT3O/Kn
         aGgt8aZYZD6yBhKx3HuZkOB1yxeMAmAynGYWaUbTls2ImJ7Zc4ITzCscnHYXFQfnPy9G
         igGVHmuh0+He9pJRvLG4c29MXQno3P2LcQBH5CpYfO9EE5Isd0ssyzz46zWCrzX7g8IV
         rEwKKvw3z4JxzO64IPjChdzW6ByivJLusO/WOKMqhUuWwlw6O2nP68YIiqXL7tMEhD4M
         Vf4fthBYHj8YKZ2fINf/3LPjhDDA627N/6ZQCfbJIkONvT8dnINCT/45s8gPNWE10lo4
         fRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755077017; x=1755681817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1TU+Xl0n1RhqfO3nfZOueztwfTTkM2m62EBReINxsY=;
        b=G55SeE9trlRVLGmy0JUJ1XZh+Y9i0085m2KbGHqu/oUx7YrixmiRQQxoFPz1Fgq4wP
         OFthhk5YzDBKZt+hGuSKQLf/ZCROF7E8Ybs9Gsidwu51J+V5QQzLMHtts0ylqZ6BF/Ic
         RyjAmqJZKMtjJOWgabl4929IeaC7Egn6UjeDfncba9t383aFSz5+ILNNfWw8O+z0tkon
         S5w93vicprL2h+VIEzgJMe4OrNm/84A/PPhkUsCGvFZS8TQXegAZHflnFePsypT/xlQD
         urFsl2xBilengTSElPTbuRDgX/aDFhv4l3nTSU0LW/X3JrdPrezW249Ck5b2m27fklyV
         4+Nw==
X-Forwarded-Encrypted: i=1; AJvYcCU8Vvk49X81oGI277bALDP6GcjPqNKAeuE9Lxh9kLz4DlxTKsis1luPlarf7Iv0gYf1yC8Tz7SX1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHe4U3j6B19J3bGkpE7QRHEOgR268yUhPAZtehFt3zsWiv358I
	hjdJblAgefh4mbC1A1rkWQIqFyFsDrqWA3hjDIS3ow8eeIgOx5mwM8sOi8Hjw3QMy0E=
X-Gm-Gg: ASbGncvo/Ium6mYHq8gF/2pS4exIuB4BVpunuFyB9oeSgoTIClOkYtyGgg9DWoZHuGx
	OJqqp0ULKH6efoAYRjnIYJaT42SP97m5QPEXUnW6s+VBBuNInO2ffBvxVlyTpYdYymuEzJHEWyd
	F5Hx/ZLVIykYbpHt7ooDbp8Z8WHHlY0r+fS4pXGc+gUoT+PB8Bi2WTNWXCVRU7xW/+PxsYHgE3E
	PKuTByMgDYg99FMFpyKYOLZruK9LfeZswJqTAUwT6ir03OzFYOXOM9l97igpLPPn5ed0QrZwe80
	egkT+5OaeFhvbCCNpDNDr5pSnrdztvxtAaGrcDvEgEKuhpScTIyZPKvDWQlv0QymHtBOvr4ppNX
	kyR8VHKZPGlnKFz8RkJLhip+iAHo2qRMOCC7Jd7peS6bHILh75g==
X-Google-Smtp-Source: AGHT+IE3vtz1ELNgTuw1NVDgwEF012pagU0/e5TxjB4oj/3WIMChqDWH9mXGzW1B/LaUDhfksyi79w==
X-Received: by 2002:a05:6000:2087:b0:3b7:905e:2a32 with SMTP id ffacd0b85a97d-3b917d2a92dmr1794493f8f.12.1755077016260;
        Wed, 13 Aug 2025 02:23:36 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:d33c:e682:2af6:3c3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac158sm47966077f8f.4.2025.08.13.02.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 02:23:35 -0700 (PDT)
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
Subject: [PATCH v3 2/2] riscv: dts: spacemit: Add OrangePi RV2 board device tree
Date: Wed, 13 Aug 2025 11:22:40 +0200
Message-ID: <20250813092240.180333-3-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813092240.180333-1-hendrik.hamerlinck@hammernet.be>
References: <20250813092240.180333-1-hendrik.hamerlinck@hammernet.be>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial device tree support for the OrangePi RV2 board [1]. The board
is described as using the Ky X1 SoC, which, based on available downstream
sources and testing, appears to be identical or very closely related to
the SpacemiT K1 SoC [2].

The device tree is adapted from the OrangePi vendor tree [3], and similar
integration can be found in the Banana Pi kernel tree [4], confirming SoC
compatibility. The main difference with the current Banana Pi BPI-F3 tree
is that status led is using GPIO_ACTIVE_LOW.

This minimal device tree enables booting into a serial console with UART
output and a blinking LED.

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Link: https://github.com/BPI-SINOVOIP/pi-linux/blob/linux-6.6.63-k1/arch/riscv/boot/dts/spacemit/k1-x_orangepi-rv2.dts [3]
Link: https://github.com/orangepi-xunlong/linux-orangepi/tree/orange-pi-6.6-ky [4]
Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
Changes since v2: improved changelog
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

