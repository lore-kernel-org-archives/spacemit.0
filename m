Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D997360EC5
	for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 03:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949575; cv=none; b=QBfaXUYpXYrKqQo57k+4/zL8AjPAyGy0DFDo0AU8LVg4Pp85jIRyXfG0MsAh8+jEu8YGMc7GiWI9tXumicHuDSqVkk+WDDdVn5f/vaDjZ6slF5QlniUGBM7H18QzP5oK4wvziMVrGE8vIGkA4szDnwCp3IqWGWArDpJxxr37044=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949575; c=relaxed/simple;
	bh=itI/1VwTHA3V7ox5PXMT2Vrb2UKYmyIibaQ0egNmgMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MKnT+2Bmc9zI77AHEwmsnk3N2V8rrgvb1aFcqRMdOphVfd8RhiUO87XAJquc+hXxBMs6lFg2bvmnYVNORkTDRTHyk5WGQYXGTX8kSVOI4oGT64bGtHHmWkAkSLIv7XJ+nJU7EfVYvx7M5IyDvWnEgm99IH8DJPlbUHYkeBM3Jv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtIA+DUl; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtIA+DUl"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-c96739a46acso596847a12.1
        for <spacemit@lists.linux.dev>; Fri, 24 Jul 2026 20:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949566; x=1785554366; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnOgmyFyaaGmxr13glRiK2+qIyg9Qu4CO8mOwq+CLUM=;
        b=HtIA+DUlDrKph+PPWK+27DH+D8go3u5/T5iM3yB1J96Bc8QpAMhyWT5ZuGiRoKybcH
         QCcsHQGwLq9o+4T+tq68xrb5Ut/Q9wG00zY1q/C5pba2+RVDcXwClG7w/u22wvVp5R1r
         kfj3vwWafzAOcyArdPAVNeiEFcpY6ASeMC8xEJGnSZCdouLdhQQ0DSwqBCLUI+6tn0s4
         hF1AZVeYxhPuDPAcwK31yeGyqfzPCg3MwoBlh85fSCbbmIvMGKRRlt0IkaKwFcdbCMQC
         iiAUJ8/vAAvFhYWBwH3Zvnx+n1rPR+dBb34kJMTOe4HIxNi062UQYIbgixO7bj8qiGoH
         Bufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949566; x=1785554366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnOgmyFyaaGmxr13glRiK2+qIyg9Qu4CO8mOwq+CLUM=;
        b=pYXYWzHkSQYcaY55Pxwbg6rTi99urtOWdQaVRcnE//tFl9FKyzv/ryT2Dq6dPkc1EO
         W/uls4P1XcKUgz86UpEhopLHyrzbzILaCf2SAIigndQRGp4JjzGZYacR0Xs4xq/bsVXs
         RAca4A+RdY+xGcRD83hLnSBGqkcFtc+4c0qruXbrDJaGJPcDhgbUHpNFqC2eqhuxpAET
         Bhr7q1qPoWNsk9lT/YIWX4MumDY9uXzhtnRDwgQRSyJLRk9efQz4cf3hUQTEnckUZLyj
         Ux4TrZJ2F3Sil6das7D74C9GjBPYLJUa9zAOzN006zasBQobJ5OcgDpy6puqKA8FWDkM
         SR7g==
X-Forwarded-Encrypted: i=1; AHgh+RroQNSA00YaS/KfTIuxnAtK7JRa46ePDX1eee6mx5BOgzb4wXIXp9euoJifhNQfHUjY+I9lrZIQPg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/v3jV3nYn1fMMEAxDa9A1iastAp63KDTs9oKf2/XPX5w1zzMr
	83i0aFzNii4uGXQwVGT++ZFn00VmW4m5LPotj0rkmb0Gxl/kqDzSBMNp
X-Gm-Gg: AR+sD10U764cew7bsYf5sOQoSJCOnxHmWlp8poCMCUORqi55GUNEFHig8cQSfZ1SIkB
	8hoZdtw/GCnsaJtGSBWYuj3gmQz3ClDBlFhtDc8d4ezyY0MR8YtCzxFt84S6qT6ZOR6azbqF+Yu
	FduxH36rQ4TuRWUvAe2ao8xdSsh3jml4z94Wyu4K/Oqo/ilXFe2Y33Hpqg01NElQcYYo4ni8zal
	7woF8u6BoBry06A1c6r21o33qIzoJqFiapKiXLIf2Bya6f3q1RrpUZkPZzueEhnGJHGPY51fK61
	//O7Ua8d6u5446onIe5ksjPTeDq9J05hPT2S6K5TvMqom2sOsXMXXFIt3K9E8LjJOaw17p0oZub
	KpE3MUGG3T7xCo17GXV89RuNN0HI3WJpnjGbOiAZX899E6oG1SObeVmk=
X-Received: by 2002:a05:6a00:2d9b:b0:848:2a71:a48a with SMTP id d2e1a72fcca58-84e593ff0ccmr648871b3a.13.1784949566154;
        Fri, 24 Jul 2026 20:19:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:19:24 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:47 -0400
Subject: [PATCH 15/17] riscv: dts: spacemit: k3-pico-itx: enable the
 DisplayPort output
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-15-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

Pico-ITX brings the second DPU's output to an external DisplayPort
connector. Enable that DPU and the DisplayPort controller it feeds.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 11 +++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b89c1521e664..6c31460990a7 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/gpio.h>
 
 #include "k3.dtsi"
+#include "k3-display.dtsi"
 #include "k3-pinctrl.dtsi"
 
 / {
@@ -221,3 +222,13 @@ hub@1 {
 &usb2_phy {
 	status = "okay";
 };
+
+&dpu1_crtc0 {
+	status = "okay";
+};
+
+&dp1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp1_1_cfg>;
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 3ee1471f3798..2f36eba20f1e 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -11,6 +11,17 @@
 #define K3_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	/omit-if-no-ref/
+	dp1_1_cfg: dp1-1-cfg {
+		dp1-pins {
+			pinmux = <K3_PADCONF(24, 6)>;	/* dp1 hpd */
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <3300>;
+		};
+	};
+
 	gmac0_rgmii_0_cfg: gmac0-rgmii-0-cfg {
 		gmac0-rgmii-0-pins {
 			pinmux = <K3_PADCONF(0, 1)>,	/* gmac0_rxdv */

-- 
2.43.0

