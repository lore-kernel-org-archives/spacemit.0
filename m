Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4E038736C
	for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 03:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949584; cv=none; b=BgZBxZMPjdVHrcgAaOMQleUM9R+Nvq1zLggNwGsrvGcJs7UZWwRK9yq8XnZ/DFXrr3V/YJfHKv1sjTMIxcyAOFVmokn4WmNO37nmCiG+czBjpjPniMGnoO2hFn7RQf3a30kD52oJySI6Kajx4IYNlew/pFhlC57Xh7Zr699Bd/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949584; c=relaxed/simple;
	bh=Ich4f6q4tajR0qNR1lNUbENzsTq+U+zWcM4jg4iHZLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E0aUqlpqZkcbBQJ7UqwQ7bgeZyyZ9JsHW3DZSfcejyGHiXqjAb6wDjoBDVQnW0gRmyj+zj+VCTIm466sSQUjlsqV9nuyOj1ULYwpQ4v8bG26MGwHxM9Fzsas/DhTWSTcDjoGOZrVvVXCUhmOqTouiHzAtQaP4Pl9chYyHyj+hZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qkogEzP8; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qkogEzP8"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-ca24d39d8a4so635029a12.1
        for <spacemit@lists.linux.dev>; Fri, 24 Jul 2026 20:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949575; x=1785554375; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSv4z6+j0ETigrrBAdkCkvY/jDNAOWHrT+gEbT1n1Mw=;
        b=qkogEzP8a3Ns+iCxwtvnOIX7IAI9sEEcPrfEFeHgcfmMB4OSLmwULK6iUXj5zm6G2v
         j8roV/YYPANvSRkFFDyTyMbioZgoWmBQcSpuC7WHY4RYtnqaddZ63q0Nj3ou4LJwCTWJ
         rChXjW2H9BQbPrqogcq3aqRfimecesWHYTbqyEhmM3Iibkj9JGBCxxWJ7NIN9GENqc1c
         dE8GbQ1qVszGWvhCWIkLxRffQQwtpEBoLxqlj4RcEOOMcxQKTtAJnMwmm+O3EqsMECjO
         JZvk+lg3mvPfPXOALkaFQlU7YIobkkWe4k8BvnrZKUwAmmKSlqxLwAX8zyJ2KX/xLyay
         6VvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949575; x=1785554375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSv4z6+j0ETigrrBAdkCkvY/jDNAOWHrT+gEbT1n1Mw=;
        b=sA+BJaaeds+hpL5+r7Ck0JZQjsb4yJF0DM3SdYSh+hSPdFSihi0fBBFQFt3UvLrRgz
         R5dvxDXjaAhNLR6Fx864wzunsxxCK9uN3SDlEIyPYrU2cFgLp/XGT24A+I64ctYq/8NE
         1bo1TcPTaEiku7mLInW46emqXfPJcvvIzcVnBni4nwJCUdMmPVIlxogcbqf/UaZtxKqL
         0CwiYQbh7hQEUH38xoy03/1hdhv/DAt5zXtjESRhNqLUbo7vgUqNJNR3E9OHCpZnyifD
         TdBn5t6V+fn7EaMBynZ8InstfcCBWLYcv9TgcvdSY1JOEsr/wHkkqRmM9tbAn3mvH6ss
         94WQ==
X-Forwarded-Encrypted: i=1; AHgh+RrA7c9plgGi1zwK9BhTb2ywHFZMrsJGDYF274CTyrRQHV9Vb0a6Vojrv7OF6YOVoOmEtdmHdljMiA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyi8awdih6Fnr2bu5fS/spBiKArhN3RPGzTqTJJUbpksA0DBn1t
	nH1fNNxVj4TfMRbO6ACe9TBRcAWMIfUfuJPwjwklDsId9+vbuBngo0PN
X-Gm-Gg: AR+sD117N4a2QVktKBfVIHqRTnbA4TsAdjtmhY8PIRltVfDlUVf3WaaVQCSItjEXDrx
	d7vJVwYWJnMcFNiYGovXd3Fi2YKIh9bAR0mletOl5QoBO3HARmAnZOax7SHJDXOBpiM7P7dVFFY
	+qIGfNOSM4pEFT1rF55E7KxVbpqNUEixsQMDkA6KNRqhXEgzuN4HekO8dqwWVaAN44vDpPwx60e
	KSxmQhB2wAIYa6uk1CAhoZs6Y3LrU+ZbNPpqyDvQ2bbw96TNkLB7StvU6WMsjIMIu5XeS8TQMUZ
	Eok8/UHpntfdZ3tf0Xqd7aPxSNAQsPMdn9j4uwLznUIWx7K0ZIrgtzr5HmR/+F6YplM/PyxzIEX
	Y1diZSsO1ziSWaH8V/4z4BtErfMwjJAjH0DR+fZ8b3BUB45MrUffJJK0=
X-Received: by 2002:a05:6a00:298a:b0:845:c906:5ff5 with SMTP id d2e1a72fcca58-84e5944d694mr613698b3a.30.1784949574747;
        Fri, 24 Jul 2026 20:19:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:19:33 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:48 -0400
Subject: [PATCH 16/17] riscv: dts: spacemit: k3-com260-ifx: enable the
 DisplayPort output
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-16-f22a10a52867@gmail.com>
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

CoM260-IFX carries a single DisplayPort output, so the second DPU and
the DisplayPort controller it feeds are enabled.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 11 +++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi   | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index 238bb03d0e9e..114d0e02fed9 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -5,6 +5,7 @@
  */
 
 #include "k3-com260.dtsi"
+#include "k3-display.dtsi"
 
 / {
 	model = "SpacemiT K3 CoM260 IFX";
@@ -19,3 +20,13 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 };
+
+&dpu1_crtc0 {
+	status = "okay";
+};
+
+&dp1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp1_3_cfg>;
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 2f36eba20f1e..dbe8db4a8b76 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -22,6 +22,17 @@ dp1-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	dp1_3_cfg: dp1-3-cfg {
+		dp1-pins {
+			pinmux = <K3_PADCONF(72, 4)>;	/* dp1 hpd */
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

