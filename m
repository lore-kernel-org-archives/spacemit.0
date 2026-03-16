Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847414204E
	for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 14:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669881; cv=none; b=oTxoavt8zHCM0MqG/XxHODov4ZYfuSnsmZkdMCrTOWfdkxL0NE7q65M2MeZd+Zs2t0kgNoiwUH76+C4O/NduX/7pq7bBqgHXP2R9aa5KuggWFrJLUKPgOxyzQv63awlBAy04cRKJJdBKwS5FtT3KfWa+3Xf/MCU8FobJ6FT9fLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669881; c=relaxed/simple;
	bh=h2D5WHgrxz43uhMtLfKxOR0sKrVvSVtSEpqCmED+0J8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pHzrl3UbZRCzUbNjZAZAkgNIHL3BYGncrrVfflIV9MRjKu8v/XOODQmMMC+ZNzAeU8n4xG0BkDJTn+8SW8rlO8uwoQlv+dkyxDsm/Dq7AhWBtLeof2FzeBk3kjVVUsUofhdVrkkAvLTh3FB9zRAQOm7ixOcWE9+9SHmUwirYjxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2km4zT5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2km4zT5"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48534237460so51167785e9.3
        for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 07:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773669879; x=1774274679; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7U0Z6Pq5BNBGUpIipaToeDztdOq53P+XHlRkPRfqt4=;
        b=R2km4zT5VkvUbQ1q4xVISIOdPlDUf/+qoS30CS99iSEQA0qzyDtc0TKqwpbQVZt2FZ
         QPkirzQ9IRCtWRdnWvP0n4LBUAD4C255U7ZyxQI4KUrmuIYiueRhRGHU+4uX/29LyG9e
         avKuUwSbjqClFPLG+vvlBSivUMrhg0wTqKZMKegufXuIlGvOttu2q+2rNrvzUXw1Z5Bj
         fmCQ5ExpFgeob4p/KAYEhZ0qrsrSHgMi7SK1bRWLuxQF3VznoTFI4IS/aRLsTjga4TFE
         0XI/OSaJQXoRTHx/mSxdFRq1yvP1u9n5dmeA42GNwXntLo6JSpLPRfIk6ot9m/CTJjVK
         aPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669879; x=1774274679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H7U0Z6Pq5BNBGUpIipaToeDztdOq53P+XHlRkPRfqt4=;
        b=NseVy03iruNQNDPNsh1nuNyFC1S37mKspIb4uziR7mYUbBALQMwWw2/xoolBhm9Nau
         9N8eQXC2YXRxRQV/iHyw7B6LyB9MRD+qz4dvkamtEBwOhEJ/DnnDpg2QsNMQwcsxz8nF
         hy/W9bUowWqhozOS/Si+Fql6Up3YK1mQjqXU/9xxp8bxgIJSFgQnnjJjEVbsbsuzHN0o
         pnbMl8DE9DOSVK2bs7SlhrCHcsOBQsRCWIWRZAZSdk6T3YO8IfBgHf/BqXp757CqUEZ8
         kSqWnqrc/Wse8eLibYUnsQb4WhLprXM2Wh6+9cwrQP46KCtCvdEmuzwFldmeKVZpBN1R
         J2mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkXpqOZ/khTMbDt9Ya7hH5GyxZcBCzcnLoWlCCETPx7AZZvADR9OibFHICFeN6rlV6VFllX608Qg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGwpPXeZTFtcBxPSu6MoRSkr+svQ0ZVX64fedxF5xpSJ7wVslO
	HBiIYi5Lfmco8f6nodaYozrBxUSSEJGxiArsck+v+2sx2exwXt3sqTSz
X-Gm-Gg: ATEYQzwIny9F2yuajjezhlsiy8nC17ovGqOgGbp8NqK1tHuE/2tVtYudbWDSWQvojN2
	RmU350LsB8Bu8WN6j2HVzBDaAzGFp0DoIgeBWSFjUpQF8ide3oSMyO6z5yr/L32hu0n202fx/cm
	YyMM23L6XjkbI1llS1KNNRVnfU8O6Ev+xA+qWt//6Z5J6aUqVq8/9EQwrxW4tNpzz2kS7iszULx
	bnofQRVgjXEMA15byVFr7Phf55rQ2l78ZDdpz3QJ1jcRJy4PXoLTouYITuOPFk2Iglqnqk65zu5
	frTyVy9UlpZxaEvzru/4avTB3gW6LXuInVY43ClRf2uP/wuyxcPbZuWwihVuOfyy8fFWCwaD5nP
	TbpXTO2y2ih3rHhH3lMZhH0juQSRZOqROYG5XVCucQiQTV/J/N52YLXod9j89dHHIofJ7pK3Qqs
	NotaGBefKmWru79NpL1q5FLl5LC/pwnzwjjwc4mF6zFnaQM31WttBC4qtElxu/0ShC
X-Received: by 2002:a05:600c:81c5:b0:485:3812:36da with SMTP id 5b1f17b1804b1-485566cf00bmr199399265e9.9.1773669878422;
        Mon, 16 Mar 2026 07:04:38 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.234.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3a09e453sm20698725f8f.0.2026.03.16.07.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:04:37 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 16 Mar 2026 15:03:34 +0100
Subject: [PATCH v3 6/7] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-orangepi-sd-card-uhs-v3-6-aefd3b7832df@gmail.com>
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
In-Reply-To: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index f1533c99881dbf38e16cff5e91e33253cfa7a56d..aff23846085d22d1e9cd77434bffd2816ad59e12 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -140,3 +140,22 @@ aldo1: aldo1 {
 		};
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.53.0

