Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9463B3BFA
	for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 08:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859920; cv=none; b=W1mcknIYJb1ho/FGhN2zeTKGc0SEUacdg7lIpLdD02ZrIdKvfgt3a5QYrK1reeWD/3h9MbEXC7PtR6RusR2SwAMVs6OKPF2Rbt/tcHf5Q7mT3D8g3H/zoaZSDHypPLceXtzsMLHWj5Tz0e3vzJGJbWmkRG5ViFj3SOR5XCbOGSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859920; c=relaxed/simple;
	bh=0EFZ53q2XAEQCbsr9UzobauZinI9NCe/+PQ0fxu05PM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjGasXtOsKfjI6/52YVGQl82weXcpj8xCUHqkfZpT8XyZGWC9cOkJ8YubysFvmDkPeVehxdGDI3WelNJGikV+lrDzu0x5spvJe69hTJ2zscWqtKGPqH7mECgJfCTjcdVSo8p1NpX9lXD+popRBj6CyZMJgiO7fTiWCh7qo9U2vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hk6/r+fk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hk6/r+fk"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fb439299so37892365e9.0
        for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 01:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859916; x=1775464716; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LbwR62Ox4pP35TzcC1/kMlb8rYdhZytDukagY2Rkq4=;
        b=Hk6/r+fkZ3fq7w7ffVD+4llzQZRhHHM32AxkuhW/9rFQohWw3f8WyZjZI/nMQeHHNf
         BvODgXbwEIDdFh7tzq0n5CTnxCEb+dIJKibAKGIKfn/q64LtyWMAXjSP4lnbp8grTI5z
         y0A4YqdVKiQZXIIA+boIAK7+v1gZkpcHjR41Vlg60tXBML5DQo4i9nEZHzvtrmvx3l5u
         izsR8yGsHEzwiHUhta97W4Bnhy9MoaX+OHbMay/w1EtZ/5Qz8cA7ER3g7/2jXnqldN9j
         Bg9RgmgVenvZ/qY7NCVlBP9C9dJWs6hPlDtWCazsE6objgVghKzlb9Uci/j1K90Ry1SX
         +xmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859916; x=1775464716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1LbwR62Ox4pP35TzcC1/kMlb8rYdhZytDukagY2Rkq4=;
        b=E3Dc71TUurE69fSpCB9XN8AIXyFFnfp+ixdqFo765MzVSP7RrvwDlsRJ8sNZNE6NWk
         LcGiWDSyV8MMrVUsOqpPEOfKv6qA1MKDE2OuUW3DJy6+Pvvbba3cMiYmIjMgtUFlOx9X
         neZvHthQQuWp3hpy+Myuqw70NJj9KCCe1HBXBpe6GIQ2+LrtsF1va0z6BngqNMqiB8fa
         he1ihOfzn67th9HNqOMPQClXh7fw0q242tGIii2dc5R9fnX+j1INJ8iUyt4MwO6Ey9Af
         ahgQifd8HuL9l3fTNWRThK32YKRztKs6B67N5YIvDYc+RY+g1OiEEX3sZHqNw2vDYreN
         hQZg==
X-Forwarded-Encrypted: i=1; AJvYcCXfmitEEIlm+mT9JaY40/kwAZk0R2JhdyFRZu0rV8WU76dK36XGjy4NgU37FVwKZpba/pd4GGeR/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzT6j294zmjeZNq5g3r1afjre1B1ezYpCgzKgz8OElcgfNYAEX
	/w2suhXku7EUbIy1L1sEMxZ3EZu9JWGZojtWIhOLRj0QW3nCvffVYyNz
X-Gm-Gg: ATEYQzzjcsSc0DHAY3YZOi3yv7I4wZGleXnmQH6QCBWjVP5ARuHdh3tF/T9deUYNLSN
	sD8zJ8IwjC0W/9GW94AyojYcVOGLrTdYN5dIB5vs74KeBuiG0Zccp0FNEEl3sAisUQPk0q7pdIQ
	8b0uHuAIO+RoxAX1pFfRIH3NQN3UcM8X1Q2G/gnWFvMgpE7m9eOo070o1BgYSJt8TU0ZHcI0MZN
	V7gdRQ+nqHEc2izMogh6e8f1t+xME66XJIOS0I2dP4xCwEdolDL810VRAMqb4mijUdK1I3k7X+p
	xHhqpeiSwRhy/GMrzhA12slBRdCyPkttkEvE1sY08S/P+TEEJj0RCv3aIxFgKIv5ecYAn/ON6GI
	AqOxNEGD3Y4CvDWib7AZsDzhiFn/bUrbCwMNIuKbT+wM3vUXFIWZ6VEGnp6mPusILBi6qXBcvI9
	OYgHGMG961PANKOeGI0p9k3ESd0PXuKaEr0QEQaN9kDW0lKw2yvbHLDvPwRt4Tf7SN
X-Received: by 2002:a05:600c:5249:b0:487:386:3714 with SMTP id 5b1f17b1804b1-48727f7bb08mr213736895e9.17.1774859915529;
        Mon, 30 Mar 2026 01:38:35 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:35 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:08 +0200
Subject: [PATCH v5 7/9] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-orangepi-sd-card-uhs-v5-7-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
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
Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 9c417a483f6bad6e60617cf8d5400ca079588726..5f823611c969eb0e15546862228ae4f65375675a 100644
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

